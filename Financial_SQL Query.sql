
-- this Query Shows all Data inside Financial_Loan
select * from Financial_Loan

--            <<--------------------------------------------------------->>
--                    <<------------------------------------------->>
--                          <<-------------------------------->>

-----------------------<< Key Performance indicators (KPIs) Requirements >>-----------------------

-- 1- Calculate Total Loan Applications : 
        select COUNT(id) as [Total Loan Applictions] from Financial_Loan

-- 2- Calculate MTD Loan Applications : 
		select Count(id) as [MTD Loan Applications] from Financial_Loan
		where  MONTH(issue_date) = 12

-- 3- Calculate PMTD Loan Applications :
		select Count(id) as [PMTD Loan Applications] from Financial_Loan
		WHERE MONTH(issue_date) = 11

--            <<--------------------------------------------------------->>
--                    <<------------------------------------------->>
--                          <<-------------------------------->>

-- 1- Calculate Total Funded Amount : 
        Select sum(loan_amount) as [Total Funded Amount] from Financial_Loan

-- 2- Calculate MTD Total Funded Amount
		Select sum(loan_amount) as [MTD Total Funded Amount] from Financial_Loan
		where  MONTH(issue_date) = 12

-- 3- Calculate (PMTD) Total Amount Received : 
		Select sum(loan_amount) as [PMTD Total Amount Received] from Financial_Loan
		where  MONTH(issue_date) = 11

--            <<--------------------------------------------------------->>
--                    <<------------------------------------------->>
--                          <<-------------------------------->>

-- 1- Calculate Total Amount Received
		select sum(total_payment) as [Total Funded Amount] from Financial_Loan

-- 2- Calculate MTD Total Amount Received
		SELECT SUM(total_payment) as [MTD Total Funded Amount] FROM Financial_Loan
		WHERE MONTH(issue_date) = 12
 
-- 3- Calculate PMTD Total Amount Received
		SELECT SUM(total_payment) as [PMTD Total Funded Amount] FROM Financial_Loan
		WHERE MONTH(issue_date) = 11

--            <<--------------------------------------------------------->>
--                    <<------------------------------------------->>
--                          <<-------------------------------->>

-- 1- Calculate Average Interest Rate
        SELECT Round(AVG(int_rate* 100),2) AS [Avg Int Rate]   FROM Financial_Loan

-- 2- Calculate MTD Average Interest
		SELECT Round(AVG(int_rate * 100),2) AS [MTD Avg Int Rate]  FROM Financial_Loan
		WHERE MONTH(issue_date) = 12

-- 3- Calculate PMTD Average Interest
		SELECT Round(AVG(int_rate * 100),2) AS [PMTD Avg Int Rate]  FROM Financial_Loan
		WHERE MONTH(issue_date) = 11

--            <<--------------------------------------------------------->>
--                    <<------------------------------------------->>
--                          <<-------------------------------->>

-- 1- Calculate Avg DTI
		Select ROUND(AVG(dti) * 100 , 2) as [Avg dti] from Financial_Loan

-- 2- Calculate MTD Avg DTI
		Select ROUND(AVG(dti) * 100 , 2) as [MTD Avg dti] from Financial_Loan
		WHERE MONTH(issue_date) = 12

-- 3- Calculate MTD Avg DTI
		Select ROUND(AVG(dti) * 100 , 2) as [PMTD Avg dti] from Financial_Loan
		WHERE MONTH(issue_date) = 11

--            <<--------------------------------------------------------->>
--                    <<------------------------------------------->>
--                          <<-------------------------------->>

-- 1- Calculate Good Loan Percentage
		SELECT COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0 / 
			   COUNT(id) AS Good_Loan_Percentage
		FROM Financial_Loan

-- 2- Calculate Good Loan Applications
		SELECT COUNT(id) AS Good_Loan_Applications FROM Financial_Loan
		WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- 3- Calculate Good Loan Funded Amount
		SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM Financial_Loan
		WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--            <<--------------------------------------------------------->>
--                    <<------------------------------------------->>
--                          <<-------------------------------->>

-- 1- Calculate Good Loan Amount Received
		SELECT SUM(total_payment) AS Good_Loan_Funded_amount FROM Financial_Loan
		WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'


-- 2- Calculate Bad Loan Percentage
		SELECT
			COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0 / 
			COUNT(id) AS Bad_Loan_Percentage
		FROM Financial_Loan

-- 3- Calculate Bad Loan Applications
		SELECT COUNT(id) AS Bad_Loan_Applications FROM Financial_Loan
		WHERE loan_status = 'Charged Off'

-- 4- Calculate Bad Loan Funded Amount
		SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM Financial_Loan
		WHERE loan_status = 'Charged Off'

-- 5- Calculate Bad Loan Amount Received
		SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM Financial_Loan
		WHERE loan_status = 'Charged Off'

--            <<--------------------------------------------------------->>
--                    <<------------------------------------------->>
--                          <<-------------------------------->>

-- Show information about all data in LOAN STATUS
		SELECT
			loan_status,
			COUNT(id) AS LoanCount,
			SUM(total_payment) AS Total_Amount_Received,
			SUM(loan_amount) AS Total_Funded_Amount,
			AVG(int_rate * 100) AS Interest_Rate,
			AVG(dti * 100) AS DTI
		FROM Financial_Loan
		GROUP BY loan_status

--            <<--------------------------------------------------------->>
--                    <<------------------------------------------->>
--                          <<-------------------------------->>

		SELECT 
		loan_status, 
		SUM(total_payment) AS MTD_Total_Amount_Received, 
		SUM(loan_amount) AS MTD_Total_Funded_Amount 
		FROM Financial_Loan
		WHERE MONTH(issue_date) = 12 
		GROUP BY loan_status

--            <<--------------------------------------------------------->>
--                    <<------------------------------------------->>
--                          <<-------------------------------->>

		SELECT 
		MONTH(issue_date) AS Month_Munber, 
		DATENAME(MONTH, issue_date) AS Month_name, 
		COUNT(id) AS Total_Loan_Applications,
		SUM(loan_amount) AS Total_Funded_Amount,
		SUM(total_payment) AS Total_Amount_Received
		FROM Financial_Loan
		GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
		ORDER BY MONTH(issue_date)

--            <<--------------------------------------------------------->>
--                    <<------------------------------------------->>
--                          <<-------------------------------->>

		SELECT 
		address_state AS State, 
		COUNT(id) AS Total_Loan_Applications,
		SUM(loan_amount) AS Total_Funded_Amount,
		SUM(total_payment) AS Total_Amount_Received
		FROM Financial_Loan
		GROUP BY address_state
		ORDER BY address_state

--            <<--------------------------------------------------------->>
--                    <<------------------------------------------->>
--                           <<-------------------------------->>
--TERM
		SELECT 
		term AS Term, 
		COUNT(id) AS Total_Loan_Applications,
		SUM(loan_amount) AS Total_Funded_Amount,
		SUM(total_payment) AS Total_Amount_Received
		FROM Financial_Loan
		GROUP BY term
		ORDER BY term

--            <<--------------------------------------------------------->>
--                    <<------------------------------------------->>
--                           <<-------------------------------->>

--EMPLOYEE LENGTH
		SELECT 
		emp_length AS Employee_Length, 
		COUNT(id) AS Total_Loan_Applications,
		SUM(loan_amount) AS Total_Funded_Amount,
		SUM(total_payment) AS Total_Amount_Received
		FROM Financial_Loan
		GROUP BY emp_length
		ORDER BY emp_length

--            <<--------------------------------------------------------->>
--                    <<------------------------------------------->>
--                           <<-------------------------------->>

--PURPOSE
		SELECT 
			purpose AS PURPOSE, 
			COUNT(id) AS Total_Loan_Applications,
			SUM(loan_amount) AS Total_Funded_Amount,
			SUM(total_payment) AS Total_Amount_Received
		FROM Financial_Loan
		GROUP BY purpose
		ORDER BY purpose

--            <<--------------------------------------------------------->>
--                    <<------------------------------------------->>
--                           <<-------------------------------->>

--HOME OWNERSHIP
		SELECT 
			home_ownership AS Home_Ownership, 
			COUNT(id) AS Total_Loan_Applications,
			SUM(loan_amount) AS Total_Funded_Amount,
			SUM(total_payment) AS Total_Amount_Received
		FROM Financial_Loan
		GROUP BY home_ownership
		ORDER BY home_ownership

--            <<--------------------------------------------------------->>
--                    <<------------------------------------------->>
--                           <<-------------------------------->>

-- See the results when we hit the Grade A in the filters for dashboards.
		SELECT 
			purpose AS PURPOSE, 
			COUNT(id) AS Total_Loan_Applications,
			SUM(loan_amount) AS Total_Funded_Amount,
			SUM(total_payment) AS Total_Amount_Received
		FROM Financial_Loan
		WHERE grade = 'A'
		GROUP BY purpose
		ORDER BY purpose
