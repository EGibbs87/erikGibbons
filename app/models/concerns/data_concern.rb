module DataConcern
  extend ActiveSupport::Concern

  def self.get_ppp
    agent = Mechanize.new

    response = agent.get("https://smartasset.com/insights/ppp-loan-lenders")

    bp = response.at('.blog-post-copy')

    banks = bp.css('h2')[0..-2]

    blurbs = bp.css('h2 + p')

    links = blurbs.map { |b| b.css('a').map { |a| {'text' => a.text, 'href' => a['href'] } } }

    info = [banks.map(&:text), blurbs.map(&:text), links].transpose

    dataset = []

    info.each_with_index do |l,i|
      dataset << { 'id' => i, 'name' => l[0], 'desc' => l[1].gsub(/\p{Pd}/, "-").gsub(/[[:space:]]/, ' '), 'links' => l[2] }
    end

    dataset.each do |d|
      if d['name'].match(/\*\*/)
        d['name'] = d['name'].gsub(/\s?\*\*/, "")
        d['members-only'] = 'no'
      elsif d['name'].match(/\*/)
        d['name'] = d['name'].gsub(/\s?\*/, "")
        d['members-only'] = 'possibly'
      else
        d['members-only'] = 'yes'
      end
      d['still-active'] = 'yes'
      d['upated'] = '2020-05-20'
    end
  end

  def self.return_existing
    return [
      {
        "id" => 0,
        "name" => "America First FCU",
        "desc" => "Headquartered in Utah, this credit union is taking PPP loan applications from business account holders. You can start the application process only online. That said, the credit union says it takes only 15 minutes to become a business member. Consolidated assets: $11.7 billion.",
        "links" => [
          {
            "text" => "Application",
            "href" => "https://wwwapps.americafirst.com/applications/member/business.cfm?productType=businessMisc&CID=web-lk-sba_relief-sba-ln-com-20200327"
          },
          {
            "text" => "Become a business member to become eligible",
            "href" => "https://wwwapps.americafirst.com/applications/busapp/index.cfm?event=app.home#wrapper"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 1,
        "name" => "Ameris Bank",
        "desc" => "Ameris Bank has branches in Alabama, Florida, Georgia, Maryland, North Carolina, South Carolina, Tennessee and Virginia. It is accepting PPP loan applications only from current account holders at this time. To apply, contact your banker. For more information, this is their SBA relief website page. Consolidated assets: $18.2 billion.",
        "links" => [
          {
            "text" => "Ameris Bank",
            "href" => "https://smartasset.com/checking-account/ameris-bank-banking-review"
          },
          {
            "text" => "SBA relief website page",
            "href" => "https://www.amerisbank.com/sbarelief"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 2,
        "name" => "Atlantic Capital Bank",
        "desc" => "Atlantic Capital Bank is accepting PPP loan applications from existing customers. If you haven’t already, you can begin the process by contacting your Atlantic Capital banker. If you already contacted your banker, you will receive an email with application instructions from ACB_Payroll_Protection@atlcapbank.com. (Emails began going out April 3, and continued over the weekend.) For more information, this is their PPP website page. Consolidated assets: $2.9 billion.",
        "links" => [
          {
            "text" => "Atlantic Capital Bank",
            "href" => "https://smartasset.com/checking-account/atlantic-capital-bank-banking-review-35525"
          },
          {
            "text" => "PPP website page",
            "href" => "https://atlanticcapitalbank.com/covid-19-updates/"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 3,
        "name" => "Bank Independent",
        "desc" => "Serving Northwest Alabama, this community bank is currently accepting PPP loan applications. It does not say on its site whether it’s requiring applicants to be existing customers, though its expression-of-interest form asks if you are one. Consolidated assets: $1.7 billion.",
        "links" => [
          {
            "text" => "expression-of-interest form",
            "href" => "https://info.bibank.com/sba-relief-options?_ga=2.245538308.1633525680.1588242550-1319386693.1588242550"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 4,
        "name" => "Bank of America Corporation",
        "desc" => "Bank of America is accepting PPP loan applications. To qualify, you must have a small business relationship that predates February 15, 2020. (There was a lending relationship requirement but it has been lifted.) This major bank will only take applications online. You can start the process here. (You’ll have to sign into your small business account first.)",
        "links" => [
          {
            "text" => "Bank of America",
            "href" => "https://smartasset.com/checking-account/bank-of-america-review"
          },
          {
            "text" => "Start the process here",
            "href" => "https://secure.bankofamerica.com/apply-credit-cards/public/business-lending/sign-in/?producttype=UTERM&campaignid=4045940&productoffercode=F6&groupCode=YACK&sourceCode=UW005S&smallbusinesscare=true"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 5,
        "name" => "Bank of George",
        "desc" => "With two branches in Southern Nevada, the Bank of George (as in George Washington) is a community bank that lends to businesses in more than 30 states. It says on its website that it is participating in the PPP, but does not say whether it is restricting applicants in any way. To inquire, here is its contact page. For updates, check the bank’s COVID-19 website page. Consolidated assets: $344 million.",
        "links" => [
          {
            "text" => "Contact page for inquiries",
            "href" => "https://www.bankofgeorge.com/connect/contact-us.html"
          },
          {
            "text" => "COVID-19 website page",
            "href" => "https://www.bankofgeorge.com/notice-details.html"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 6,
        "name" => "Bank of Hope",
        "desc" => "Headquartered in Los Angeles, Bank of Hope is the largest Korean American bank in the country. It has 63 branches in California, Washington, Texas, Illinois, New York, New Jersey, Virginia, Georgia. and Alabama. An SBA-preferred lender, the Bank of Hope is currently taking PPP loan applications only from existing customers who either have any type of loan account or have any type of deposit account that was opened as of February 15, 2020. If you meet the criteria and want to apply, contact your primary relationship manager or branch manager. For more information, this is the bank’s PPP website page. Consolidated assets: $15.7 billion.",
        "links" => [
          {
            "text" => "PPP website page",
            "href" => "https://www.bankofhope.com/sba/paycheck-protection-program"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 7,
        "name" => "Bank of the West",
        "desc" => "A subsidiary of French international banking group BNP Paribas, Bank of the West is a regional bank with headquarters in San Francisco, California. It serves the Midwest and West. It is accepting PPP loan applications only from customers who have had a business checking account since February 15, 2020 or earlier. Applications are only online. For more information, go here.",
        "links" => [
          {
            "text" => "Application",
            "href" => "https://www.bankofthewest.com/HeretoHelp/Business/query.html"
          },
          {
            "text" => "More info",
            "href" => "https://www.bankofthewest.com/HeretoHelp/Business.html"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 8,
        "name" => "Bankers Trust Company (IA)",
        "desc" => "With headquarters in Des Moines, Bankers Trust Company is Iowa’s largest privately owned bank. It serves Central Iowa; Eastern Iowa; Phoenix, Arizona; Omaha, Nebraska and Sioux Falls, South Dakota. The community bank is accepting applications and does not require applicants to be current customers. That said, it is giving priority to existing customers and local nonprofits in the markets it serves - and it encourages non-customers to apply with their own banks first. Current customers can email the bank for next steps at paycheckprotectionprogram@bankerstrust.com. For more info, go here. Consolidated assets: $5 billion.",
        "links" => [
          {
            "text" => "More info",
            "href" => "https://www.bankerstrust.com/business/lending/paycheck-protection-program/"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 9,
        "name" => "BankUnited",
        "desc" => "BankUnited is headquartered in Miami Lakes, Florida and serves the Tri-state area (New York, New Jersey and Connecticut) as well as Florida. The bank says on its website that it will prioritize PPP loan applications from existing business customers who are borrowers. Then it will process applications from existing business customers who have a deposit relationship. You can find more information here. Consolidated assets: $32.8 billion.",
        "links" => [
          {
            "text" => "More info",
            "href" => "https://www.bankunited.com/paycheck-protection-program"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 10,
        "name" => "BBVA USA",
        "desc" => "BBVA USA is a subsidiary of the Spanish multinational Banco Bilbao Vizcaya Argentaria. Its headquarters are in Birmingham, Alabama, and it primarily serves Alabama, Arizona, California, Colorado, Florida, New Mexico and Texas. The bank is accepting PPP loan applications through its online portal in anticipation of a second round of PPP funding coming through. To apply, you must have an online account, though it looks like you can open one if you don’t have one. (That said, the bank warns that opening an account does not guaranteed that your PPP loan application will be approved.) For more info, go here.",
        "links" => [
          {
            "text" => "BBVA USA",
            "href" => "https://smartasset.com/checking-account/bbva-banking-review"
          },
          {
            "text" => "More info",
            "href" => "https://www.bbvausa.com/special/covid19-small-business.html"
          }
        ],
        "members_only" => "no",
        "still_active" => "future",
        "updated" => "2020-05-20"
      },
      {
        "id" => 11,
        "name" => "Bell Bank",
        "desc" => "Though its branches are in North Dakota, Minnesota and Arizona, Bell bank says on its website that it has customers in all 50 states. It also says that it processed 1,300 loans the first week the PPP was open. The Fargo-headquartered bank is accepting applications from new and existing customers, though it is giving priority to its current business customers - and warns that non-customers will experience a significantly delayed response to inquires. For more information, go here. Consolidated assets: $6.5 billion.",
        "links" => [
          {
            "text" => "More info",
            "href" => "https://www.bell.bank/covid-19/Commercial-Banking"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 12,
        "name" => "Berkshire Bank",
        "desc" => "The largest regional bank with headquarters in Massachusetts, Berkshire Bank operates in New England and the Mid-Atlantic. Specifically, it has offices in Connecticut, Massachusetts, New Jersey, New York, Pennsylvania, Rhode Island and Vermont. Its website says that it is accepting PPP loan applications from its small business customers. To apply, fill out this form. You can send questions to sbppp@berkshirebank.com or call (800) 773-5601. Check for any updates here. Consolidated assets: $13.2 billion.",
        "links" => [
          {
            "text" => "Application",
            "href" => "https://paycheckprotection.bakerhillsolutions.net/136C10C5-D302-49BA-8365-F838ED733904"
          },
          {
            "text" => "Updates",
            "href" => "https://www.berkshirebank.com/"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 13,
        "name" => "BNC National Bank",
        "desc" => "Though BNC National Bank is an approved SBA lender, it does not mention the PPP. If you want to inquire, you can find contact information for the bank, which serves Arizona, Minnesota and North Dakota, here. Consolidated assets: $967 million.",
        "links" => [
          {
            "text" => "Contact info",
            "href" => "https://www.bncbank.com/contact-us"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 14,
        "name" => "Branch Banking & Trust (BB&T)",
        "desc" => "With its 2019 merger with SunTrust Banks, Branch Banking & Trust (BB&T), now officially the Truist Financial Corporation, is the eighth largest bank in the country. It operates in 15 states: North Carolina, South Carolina, Virginia, Maryland, West Virginia, Kentucky, Tennessee, Georgia, Florida, Alabama, Indiana, Texas, New Jersey, Ohio and Pennsylvania - plus Washington, D.C. The bank is currently accepting PPP loan applications only from existing BB&T and SunTrust business deposit and loan clients. To apply, sign up here, and BB&T (Truist) will email you a link to its application portal.",
        "links" => [
          {
            "text" => "Application/sign-up",
            "href" => "https://www.truist.com/coronavirus-response/banking-solutions/business"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 15,
        "name" => "Byline Bank",
        "desc" => "With headquarters in Chicago, Byline Bank is a community bank that serves the Windy City and Milwaukee. It is currently processing PPP loan applications only from existing customers. If you are a customer and wish to apply, you can submit your information here. A bank representative will contact you with next steps, though the bank requests you to be patient. For updates, check here. Consolidated assets: $5.5 billion.",
        "links" => [
          {
            "text" => "Application",
            "href" => "https://www.bylinebank.com/covid19/sba-relief/get-started-now/"
          },
          {
            "text" => "Updates",
            "href" => "https://www.bylinebank.com/covid19/sba-relief/"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 16,
        "name" => "Cadence Bank",
        "desc" => "Cadence Bank is a regional bank with eight branches in Alabama, Florida, Georgia, Mississippi, Tennessee and Texas. Its parent company, Cadence Bancorporation, is in Houston, while the bank’s headquarters are in Birmingham. Cadence Bank is currently limiting PPP loan applications to existing business clients. To apply, contact your relationship manager, who will provide access to the online loan application portal. You can find additional information, here. Consolidated assets: $17.8 billion.",
        "links" => [
          {
            "text" => "Cadence Bank",
            "href" => "https://smartasset.com/checking-account/cadence-bank-banking-review"
          },
          {
            "text" => "More info",
            "href" => "https://cadencebank.com/alerts/coronavirus-paycheck-protection-program"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 17,
        "name" => "Capital One",
        "desc" => "This major bank is continuing to accept online PPP loan applications in anticipation of the SBA program getting more money. To apply, you must have a business checking or small business savings account with Capital One as of February 15, 2020. If you haven’t already applied, it says to log into your account, where you can request that the bank contact you.  For more information and updates, go here.",
        "links" => [
          {
            "text" => "Capital One",
            "href" => "https://smartasset.com/checking-account/capital-one-banking-review"
          },
          {
            "text" => "More info/updates",
            "href" => "https://www.capitalone.com/updates/coronavirus/small-businesses/"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 18,
        "name" => "Capitol Federal Savings Bank",
        "desc" => "Headquartered in Topeka, Kansas, Capitol Federal Savings Bank primarily serves Kansas, including the greater Kansas City metro area (so parts of Missouri, too). It is accepting PPP loan applications only from existing business customers. If you have a current business relationship with Capitol Federal, you can start the application process by emailing your business name, contact name and contact information to the bank at commlenders@capfed.com. Go here for more info. Consolidated assets: $9.3 billion.",
        "links" => [
          {
            "text" => "More info",
            "href" => "https://capfed.com/business/small-business-or-commercial-loan-payment-assistance"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 19,
        "name" => "Cathay Bank",
        "desc" => "With roots in Los Angeles, Cathay Bank has 60 branches across the U.S., a branch in Hong Kong and three representative offices in China. It is currently processing the applications it has received, but does not say whether it is accepting new applications and what its requirements are. For updates, here is its COVID-19 page. Consolidated assets: $18.1  billion.",
        "links" => [
          {
            "text" => "Cathay Bank",
            "href" => "https://smartasset.com/checking-account/Cathay-Bank-banking-review-18503"
          },
          {
            "text" => "COVID-19 page",
            "href" => "https://www.cathaybank.com/COVID-19-update"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 20,
        "name" => "Celtic Bank",
        "desc" => "Headquartered in Salt Lake City, Utah, Celtic Bank specializes in small business finance. It has ranked as a top 10 SBA lender nationally since 2013. The bank is currently accepting PPP loan applications from new and existing customers in anticipation of a second round of PPP funding being approved. To start the application process, go here. Consolidated assets: $1 billion.",
        "links" => [
          {
            "text" => "Application process",
            "href" => "https://www.celticbank.com/"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 21,
        "name" => "CenterState Bank",
        "desc" => "CenterState Bank is a community bank that has branches in Florida, Georgia and Alabama. According to its website, it is processing the applications it has received in anticipation of a second round of PPP funding. But it is not accepting new PPP loan applications at this time. If you have questions or want to discuss other Small Business Administration (SBA) loan options, the bank recommends contacting your relationship manager or emailing one of its SBA Bankers. For updates, check here. Consolidated assets: $17.1 billion.",
        "links" => [
          {
            "text" => "Contact relationship manager",
            "href" => "https://www.centerstatebank.com/corporate/commercial-bankers/"
          },
          {
            "text" => "SBA Bankers",
            "href" => "https://www.centerstatebank.com/business/small-business-administration-sba-loans/"
          },
          {
            "text" => "Updates",
            "href" => "https://www.centerstatebank.com/paycheck-protection-program/"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "no",
        "updated" => "2020-05-20"
      },
      {
        "id" => 22,
        "name" => "Centerstone SBA Lending",
        "desc" => "This non-bank SBA-approved lender was accepting PPP loan applications from new and old customers, but its PPP page seems to be down [UPDATE: Back up, but not accepting sole-proprietors or independent contractors. 2020-05-20]. To begin the application process with this Los Angeles company (once the page is up again), go here.",
        "links" => [
          {
            "text" => "Application",
            "href" => "http://www.teamcenterstone.com/ppploan/"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 23,
        "name" => "Citibank",
        "desc" => "The major bank is still processing and accepting PPP loan applications in anticipation of the SBA program receiving more funding. It is taking them only from existing small business banking clients. You can find more information and updates here.",
        "links" => [
          {
            "text" => "More info/updates",
            "href" => "https://online.citi.com/US/JRS/pands/detail.do?ID=paycheck-protection-program"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 24,
        "name" => "Citizens Bank",
        "desc" => "At this time, Citizens Bank is accepting PPP loan applications from existing business customers. For more information about this New England bank and  how to apply, go here.",
        "links" => [
          {
            "text" => "Citizens Bank",
            "href" => "https://smartasset.com/checking-account/citizens-bank-banking-review"
          },
          {
            "text" => "Application info",
            "href" => "https://www.citizensbank.com/small-business/paycheck-protection-program.aspx"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 25,
        "name" => "Citizens Bank (WI)",
        "desc" => "With 12 offices in Waukesha and Walworth Counties, this community bank serves Wisconsin. It is accepting PPP loan applications from customers who have had a banking relationship with it on or before March 13, 2020. To apply, go here. Consolidated assets: $793 million.",
        "links" => [
          {
            "text" => "Application",
            "href" => "https://www.citizenbank.bank/covid-19--coronavirus--resources-for-small-businesses"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 26,
        "name" => "Comerica Bank",
        "desc" => "As of April 28, Comerica Bank has accepted more than 10,000 applications. It is currently accepting applications. Previously, it said it was doing so only from current business customers who have a Comerica business checking account. But its site no longer mentions any restrictions. Here is the bank’s COVID-19 update page, where you can find details about the paperwork that will be required.",
        "links" => [
          {
            "text" => "Comerica Bank",
            "href" => "https://smartasset.com/checking-account/comerica-banking-review"
          },
          {
            "text" => "COVID-19 update page",
            "href" => "https://www.comerica.com/campaigns/covid-19.html#2"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 27,
        "name" => "Commonwealth Business Bank",
        "desc" => "A full-service commercial bank, Commonwealth Business Bank serves California and Texas, with its headquarters in Los Angeles. It is a member of the SBA’s Preferred Lender Program and can obtain SBA loan approval on the same day. As of April 2, 2020, the bank says on its site that it still waiting for SBA guidance for PPP loans. That said, it also says to email applications and inquiries to ppp@cbb-bank.com. It does not say whether or how it will impose any restrictions on applicants. Check here for updates and to get the application form. Consolidated assets: $1.16 billion.",
        "links" => [
          {
            "text" => "ppp@cbb-bank.com",
            "href" => "mailto:ppp@cbb-bank.com"
          },
          {
            "text" => "here",
            "href" => "https://www.cbb-bank.com/EN/Lending/CARESActLoanProgram"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 28,
        "name" => "Community Reinvestment Fund, USA (CRF)",
        "desc" => "The national non-profit organization is a non-bank SBA-approved lender that supports mission-driven organizations in historically underinvested communities. It has temporarily halted taking inquiries about PPP loans. Once its online application is available, it will email people who have already submitted an inquiry. If you haven’t already submitted one, check here for updates for when the application will be available.",
        "links" => [
          {
            "text" => "Updates",
            "href" => "https://crfusa.com/sba-paycheck-protection-program-loans-from-crf/"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "future",
        "updated" => "2020-05-20"
      },
      {
        "id" => 29,
        "name" => "Community Trust Bank",
        "desc" => "Though this community bank is a top SBA lender, its website doesn’t mention the PPP. If you are interested in contacting it to inquire, here’s its website. The bank operates throughout Kentucky and also in West Virginia and Tennessee. Consolidated assets: $4.3 billion.",
        "links" => [
          {
            "text" => "website",
            "href" => "https://www.ctbi.com/"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 30,
        "name" => "Customers Bank",
        "desc" => "Customers Bank is accepting PPP loan applications from both existing customers and non-customers nationally. Its application process is fully online. The Pennsylvania-based community bank has branches in Pennsylvania, New York, Rhode Island, Massachusetts, New Hampshire, New Jersey, Illinois and Washington, D.C. You can find more information and start the application process here. Consolidated assets: $11.5 billion.",
        "links" => [
          {
            "text" => "More info/application",
            "href" => "https://www.customersbank.com/business-banking/sba-guaranteed-lending/disaster-relief/"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 31,
        "name" => "Dacotah Bank",
        "desc" => "Though Dacotah Bank is an SBA Preferred Lender, its website does not provide specifics about whether it is accepting PPP loan applications at this time or if it requires applicants to be existing customers. If you’d like to inquire, you can find contact information for the Aberdeen, South Dakota-based bank here. Dacotah bank operates branches in South Dakota, North Dakota and Minnesota. Consolidated assets: $2.7 billion.",
        "links" => [
          {
            "text" => "SBA Loans",
            "href" => "https://www.dacotahbank.com/small-business-administration-loans#small-business-administration-sba-loans-479"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 32,
        "name" => "DR Bank",
        "desc" => "This Connecticut bank emailed us that they are accepting PPP loan applications from non-customers nationally. Interested borrowers can find more information here. Once you email your application to SBAapplications@drbank.com, a bank representative will contact you for further required documents. If you have questions, you can contact the bank at (800) 361-5363 or sbaapplications@drbank.com. Consolidated assets: $370 million.",
        "links" => [
          {
            "text" => "More info",
            "href" => "https://www.drbank.com/covid-19-updates/"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 33,
        "name" => "EagleBank",
        "desc" => "An SBA Preferred Lender, this community bank serves Washington DC, Maryland and Virginia. At this time, it is advancing the applications it has received and is not accepting new ones. Its website is not clear as to whether it was or will limit applications to existing customers. For updates, go here. Consolidated assets: $9 billion.",
        "links" => [
          {
            "text" => "Updates",
            "href" => "https://www.eaglebankcorp.com/sba-paycheck-protection-program/"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "no",
        "updated" => "2020-05-20"
      },
      {
        "id" => 34,
        "name" => "East West Bank",
        "desc" => "With headquarters in Southern California, East West Bank operates more than 125 locations worldwide, including in California, Georgia, Massachusetts, Nevada, New York, Texas and Washington. It is accepting applications only from existing customers with a business account. For more information and updates, check here. Consolidated assets: $44.2 billion.",
        "links" => [
          {
            "text" => "East West Bank",
            "href" => "https://smartasset.com/checking-account/east-west-bank-banking-review"
          },
          {
            "text" => "More info",
            "href" => "https://www.eastwestbank.com/en/small-mid-size-businesses/sba-paycheck-protection-program"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 35,
        "name" => "Embassy National Bank",
        "desc" => "With its emphasis on serving the communities in Lawrenceville, Duluth, Suwanee and Norcross, Georgia, Embassy National Bank has minority depository institution status. It has not updated its site since the second round of funding, but it was accepting PPP loan applications only from existing customers. You can find the application and instructions here. Consolidated assets: $110 million.",
        "links" => [
          {
            "text" => "Application",
            "href" => "https://embassynationalbank.com/COVID19-business-resources/"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 36,
        "name" => "Falcon National Bank",
        "desc" => "Falcon National Bank has headquarters in St. Cloud, Minnesota, and branches in Foley, Ham Lake, Isanti and Richmond. It has information about the PPP on its website, but not about its specific application process. The bank says to contact it for more information. Consolidated assets: $574 million.",
        "links" => [
          {
            "text" => "PPP info",
            "href" => "https://www.falconnational.com/small-business-relief"
          },
          {
            "text" => "Contact",
            "href" => "https://www.falconnational.com/locations"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 37,
        "name" => "Fifth Third Bank",
        "desc" => "Fifth Third Bank is currently processing PPP loan applications from current customers. To apply, you must have a Fifth Third online banking profile or be a user of Fifth Third Direct. You can start the process by logging onto to your online business account through 53.com or Fifth Third Direct. For more information on applying, go here.",
        "links" => [
          {
            "text" => "Fifth Third Bank",
            "href" => "https://smartasset.com/checking-account/fifth-third-bank-banking-review"
          },
          {
            "text" => "Application info",
            "href" => "https://www.53.com/content/fifth-third/en/covid-19/business-support.html"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 38,
        "name" => "FinWise Bank",
        "desc" => "A subsidiary of All West Bancorp, FinWise Bank touts itself as a “financial tech bank with a community heart.” It has offices in Sandy and Murray, Utah, and in Rockville Centre, New York. Though it is an SBA lender, it does not have any mention of the PPP on its site. If you want to inquire, you can find contact information here. Consolidated assets: $171 million.",
        "links" => [
          {
            "text" => "Finwise",
            "href" => "https://www.finwisebank.com/"
          },
          {
            "text" => "Contact",
            "href" => "https://www.finwisebank.com/contact-us/"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 39,
        "name" => "First American Bank (NM)",
        "desc" => "This local independent community bank primarily operates branches in New Mexico. Its website says that it has helped more than 600 businesses receive a total $123 million in loans. The bank says for small businesses in need of financial assistance, presumably in its community but not necessarily existing customers, to contact them to apply for a PPP loan. For more information, go here. Consolidated assets: $5.32 billion.",
        "links" => [
          {
            "text" => "More info",
            "href" => "https://www.firstamb.net/home/home"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 40,
        "name" => "First Bank",
        "desc" => "First Bank, which also goes by 1STBank, is based in Colorado. It has locations in the Southwest, specifically in Colorado, Arizona and California. The bank is accepting PPP loan applications only from current business customers who have had their accounts prior to April 1, 2020. If you are a business customer who opened your account after that date or are a personal account holder who will be opening a new business, you can email the bank at SBAPPPCustomerService@efirstbank.com. Eligible business customers can find more information and apply here. Consolidated assets: $19.9 billion.",
        "links" => [
          {
            "text" => "Application",
            "href" => "https://efirstbankblog.com/sba-ppp-information/?a=ppp2004"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 41,
        "name" => "First Chatham Bank",
        "desc" => "Though First Chatham Bank is an SBA lender, it does not mention the PPP on its website. If you want to inquire, it looks like SBA loan-related questions can be sent to Scott Gilman, who can be reached at sgilman@firstchatham.com or (757) 625-1033. Consolidated assets: $378 million.",
        "links" => [
          {
            "text" => "First Chatham Bank",
            "href" => "https://www.firstchatham.com/index.html"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 42,
        "name" => "First Citizens Bank",
        "desc" => "First Citizens Bank (officially First-Citizens Bank & Trust Company ) is accepting PPP loan applications from existing business customers. To apply, contact your local banker. For more information, here is the bank’s site. The bank serves 18 states and the District of Columbia, with a focus on the Southeast, Southern California and Washington. Consolidated assets: $39.8 billion.",
        "links" => [
          {
            "text" => "First Citizens Bank",
            "href" => "https://www.firstcitizens.com/"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 43,
        "name" => "First Commonwealth Bank",
        "desc" => "Though First Commonwealth Bank is currently processing the loan applications it has received and is not accepting new ones until the second round of PPP funding is approved. It was accepting PPP loan applications from non-customers, though it was giving priority to its existing business customers. If you are a customer, you will need to contact your local banker to apply (once the program reopens). New and old customers can get updates here. This SBA-Preferred Lender primarily serves Western and Central Pennsylvania and Canton and Columbus, Ohio. Consolidated assets: $8.3 billion.",
        "links" => [
          {
            "text" => "Contact",
            "href" => "https://www.fcbanking.com/branch-locations/"
          },
          {
            "text" => "Updates",
            "href" => "ttps://www.fcbanking.com/why-us/contact-us/coronavirus-update/cares-act-information/"
          }
        ],
        "members_only" => "no",
        "still_active" => "future",
        "updated" => "2020-05-20"
      },
      {
        "id" => 44,
        "name" => "First Federal Bank of the Midwest",
        "desc" => "As its name suggests, this bank operates in Midwestern states: Ohio, Indiana and Michigan. It is accepting applications from current customers only. For more information, go to the Defiance, Ohio-headquartered bank’s site here. Consolidated assets: $3.47 billion.",
        "links" => [
          {
            "text" => "More info",
            "href" => "https://www.first-fedbanking.com/COVID-19"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 45,
        "name" => "First Financial Bank",
        "desc" => "An SBA Preferred Lender, First Financial Bank is taking new PPP loan applications again. But you must be an existing business loan or business deposit customer of the Cincinnati-headquartered regional bank. You can apply if you are a current business customer here. For more information and updates, check here. Consolidated assets: $14.51 billion.",
        "links" => [
          {
            "text" => "Application",
            "href" => "https://microsoftsharepointintegration.na1.echosign.com/public/esignWidget?wid=CBFCIBAA3AAABLblqZhDNxlAp6rNdzOFRVrhR_2A8MybM0W8KwiVLWRcc3RcFm1480TONM9CIRQ4R-skmuAs*"
          },
          {
            "text" => "More info",
            "href" => "https://www.bankatfirst.com/content/first-financial-bank/home/firstfinancialbank/sba-cares-act.html"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 46,
        "name" => "First General Bank",
        "desc" => "With five offices, First General Bank primarily serves the Chinese community in California. Though it’s an SBA lender, it doesn’t mention PPP loans on its site. If you want to make an inquiry, here is contact information for the bank. Consolidated assets: $977 million.",
        "links" => [
          {
            "text" => "First General Bank",
            "href" => "https://www.fgbusa.com/default.aspx"
          },
          {
            "text" => "Contact",
            "href" => "https://www.fgbusa.com/Contact-Us.aspx"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 47,
        "name" => "First Home Bank",
        "desc" => "A top 10 SBA lender in the country, the Florida-based community bank is accepting PPP loan applications from businesses in Pasco, Hillsborough, Pinellas, Manatee, and Sarasota Counties. They’re using third-party vendor Fundera to help with the application process. For more information, go here. To apply on Fundera, go here. Consolidated assets: $531 million.",
        "links" => [
          {
            "text" => "More info",
            "href" => "https://www.firsthomebank.com/"
          },
          {
            "text" => "Fundera application",
            "href" => "https://www.fundera.com/ppp?aid=1hb"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 48,
        "name" => "First Horizon Bank",
        "desc" => "First Horizon Bank is accepting applications from new and existing customers. That said, Memphis-headquartered bank is giving current applications in the pipeline priority - and warns that there may not be sufficient program funding for all applications. To find out more, go here. Consolidated assets: $43.31 billion.",
        "links" => [
          {
            "text" => "More info",
            "href" => "https://www.firsthorizon.com/Small-Business/Products-and-Services/Borrowing/SBA-Loans/SBA-Loans-Updates"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 49,
        "name" => "First IC Bank",
        "desc" => "With headquarters in Doraville, Georgia, First IC Bank primarily serves the Korean community in the Metro Atlanta area - plus Texas, New Jersey and New York. It is accepting PPP loan applications and no longer seems to be restricting applicants to existing customers. To apply, the website says to contact your nearest First IC Bank branch. For more info, go here. Consolidated assets: $705 million.",
        "links" => [
          {
            "text" => "More info",
            "href" => "https://www.firsticbank.com/index.php?id=en&info=Loans.5"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 50,
        "name" => "First National Bank of Alaska",
        "desc" => "This community bank has headquarters in Anchorage and operates branches throughout the state. It has stopped accepting new PPP loan applications. On its site, it’s not clear if it was or will restrict applicants to current customers. For updates and more information, go here. Consolidated assets: $3.8 billion.",
        "links" => [
          {
            "text" => "More info",
            "href" => "https://www.fnbalaska.com/business-solutions/fuel-your-business/loan-relief-programs"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "no",
        "updated" => "2020-05-20"
      },
      {
        "id" => 51,
        "name" => "First National Bank (of Pennsylvania)",
        "desc" => "Based in Pittsburgh, First National Bank is currently processing PPP loan applications from customers and non-customers. The bank was inviting those located within its footprint (Pennsylvania, Ohio, Maryland, West Virginia, Virginia, Washington D.C., North Carolina and South Carolina) to apply. You can find more information here. Consolidated assets: $34.5 billion",
        "links" => [
          {
            "text" => "More info",
            "href" => "https://www.fnb-online.com/landing/covid-relief-programs"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 52,
        "name" => "First Savings Bank",
        "desc" => "An SBA certified approved lender, First Savings Bank is accepting PPP loan applications. On its website, it does not specify restrictions regarding who it will accept applications from. That said, the bank operates in South Dakota, New Mexico, Nevada, Nebraska, Texas and Arizona. You can find more information here. Consolidated assets: $144 million.",
        "links" => [
          {
            "text" => "More info",
            "href" => "https://www.firstsavingsbanks.bank/Small-business-resources.htm"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 53,
        "name" => "First Security Bank",
        "desc" => "This community bank operates throughout Arkansas. It is accepting PPP loan applications and may not be restricting borrowers to current customers (the site doesn’t mention any restrictions). For more information, go here. Consolidated assets: $5.8 billion.",
        "links" => [
          {
            "text" => "More info",
            "href" => "https://www.fsbank.com/covid19/"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 54,
        "name" => "1st Source Bank",
        "desc" => "With branches in Indiana and Michigan, 1st Source Bank is a seven-time SBA Gold Level Community Lender of the Year. Its website says that it has processed 2,000 applications for roughly $554 million dollars so far. Existing customers may email their applications to their bankers, but non-customers should wait until the bank announces on its website that it is accepting applications from them. Check here for updates. Consolidated assets: $6.6 billion.",
        "links" => [
          {
            "text" => "Updates",
            "href" => "https://www.1stsource.com/hereforyou"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 55,
        "name" => "First Western SBLC",
        "desc" => "First Western SBLC (whose parent company is PMC Investment Corp.) is a non-bank SBA lender that is accepting PPP loan applications from new and old customers. At this time, though, the SBA Preferred Lender is requiring applicants to have average monthly payroll costs above $20,000. You can apply for a loan here.",
        "links" => [
          {
            "text" => "Application",
            "href" => "https://pmcpaycheckprotection.com/"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 56,
        "name" => "Five Star Bank",
        "desc" => "Five Star Bank is accepting online applications now. To qualify, you must have a Five Star Bank business checking account. If you don’t have an account, you can open one by setting up an appointment at one of its 50 branches across the country. The Warsaw, New York-based bank is requesting that customers not send or bring documents to their branch or business banking relationship manager unless requested. Here is its update page. Consolidated assets: $4.3 billion.",
        "links" => [
          {
            "text" => "Application",
            "href" => "https://www.lendio.com/ppp/five-star-bank"
          },
          {
            "text" => "Locations",
            "href" => "https://www.five-starbank.com/resources/branch-and-atm-locations"
          },
          {
            "text" => "Updates",
            "href" => "https://www.five-starbank.com/five-star-cares"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 57,
        "name" => "Fountainhead SBA",
        "desc" => "Fountainhead SBA was accepting PPP loan applications from small business owners whether they had or didn’t have an existing relationship with the national non-bank business lender. But it has paused its program. For updates, go here.",
        "links" => [
          {
            "text" => "Updates",
            "href" => "https://www.fountainheadcc.com/ppp/"
          }
        ],
        "members_only" => "no",
        "still_active" => "no",
        "updated" => "2020-05-20"
      },
      {
        "id" => 58,
        "name" => "Frost Bank",
        "desc" => "Frost Bank is a regional bank with headquarters in San Antonio, and branches throughout Texas. It is accepting PPP loan applications from existing customers with business checking accounts. You can find the application and list of required documents here. Consolidated assets: $34.1 billion.",
        "links" => [
          {
            "text" => "Frost Bank",
            "href" => "https://smartasset.com/checking-account/frost-bank-banking-review"
          },
          {
            "text" => "Application",
            "href" => "https://www.frostbank.com/COVID-19/CARESAct"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 59,
        "name" => "Fulton Bank",
        "desc" => "Fulton Bank serves Pennsylvania, New Jersey, Maryland, Delaware and Virginia. It is currently accepting PPP loan applications only from existing business customers. For more information, including the link to the application portal, go here. Consolidated assets: $21.8 billion.",
        "links" => [
          {
            "text" => "Application",
            "href" => "https://www.fultonbank.com/CARES-Act#CARES"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 60,
        "name" => "Hana Small Business Lending",
        "desc" => "Hana Small Business Lending has headquarters in Los Angeles and a branch in New York. Though it is a nationwide SBA 7(a) lender with Preferred Lender status, the company does not say whether it is accepting PPP loan applications. If you want to ask, here is the company’s contact page.",
        "links" => [
          {
            "text" => "Contact",
            "href" => "https://www.hanafinancial.com/contact"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 61,
        "name" => "Hanmi Bank",
        "desc" => "This Korean American community bank has halted accepting PPP loan applications due to the high number it has already received. The Los Angeles-based bank does not say on its website that it is limiting applicants to existing customers, but it also does not provide a lot of details about how to apply. To find out how to apply and whether you’re eligible, contact the bank. Its California loan production offices (LPOs) are in Los Angeles, Fremont and Fullerton - plus it has LPOs in Colorado, Texas, Washington and Virginia. Consolidated assets: $5.5 billion.",
        "links" => [
          {
            "text" => "COVID-19 support",
            "href" => "https://www.hanmi.com/covid19-support"
          },
          {
            "text" => "Contact",
            "href" => "https://www.hanmi.com/about-us/contact-us"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 62,
        "name" => "Harvest Small Business Finance",
        "desc" => "With headquarters in Laguna Hills, California, Harvest Small Business Finance is a non-bank lender that serves small business borrowers who have traditionally been ignored by large, regional, and community banks. It has halted accepting PPP loan applications from existing and new customers.  Its site says it will resume if there is a third round of funding. For updates, go here.",
        "links" => [
          {
            "text" => "Updates",
            "href" => "https://www.harvestsbf.com/"
          }
        ],
        "members_only" => "no",
        "still_active" => "no",
        "updated" => "2020-05-20"
      },
      {
        "id" => 63,
        "name" => "Home Bank",
        "desc" => "Though this Lafayette, Louisiana-headquartered bank is an approved SBA lender, it does not mention the PPP on its website. If you’d like to inquire, here is the bank’s contact page. Home Bank is a nationally chartered bank with branches in Southern Louisiana and Western Mississippi. Consolidated assets: $2.2 billion",
        "links" => [
          {
            "text" => "Contact",
            "href" => "https://www.home24bank.com/about-us/contact-us.html"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 64,
        "name" => "HomeTrust Bank",
        "desc" => "Community bank HomeTrust Bank is taking PPP loan applications through Kabbage, a loan processor. The Asheville, North Carolina-headquartered bank does not mention any applicant restrictions, though it does refer to them as customers. For more info, here is its website. Consolidated assets: $3.5 billion",
        "links" => [
          {
            "text" => "More info",
            "href" => "https://business.htb.com/sba-assistance-programs/"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 65,
        "name" => "IncredibleBank",
        "desc" => "This community bank has 15 locations in Wisconsin and Michigan’s Upper Peninsula. It is currently accepting the PPP loan applications. On its site, it seems to be welcoming new customers. For more information and to apply, go here. Consolidated assets: $1.4 billion.",
        "links" => [
          {
            "text" => "Application",
            "href" => "https://www.incrediblebank.com/business/paycheck-protection-program"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 66,
        "name" => "Independent Bank",
        "desc" => "Independent Bank is headquartered in Grand Rapids, Michigan, with 82 branches in rural and suburban Michigan. It is currently restricting PPP loan applications to current customers. For updates, check here. Consolidated assets: $3.6 billion.",
        "links" => [
          {
            "text" => "Updates",
            "href" => "https://www.independentbank.com/business/commercial-lending/?hsCtaTracking=f39d6d4c-405b-42d1-9477-1be721dbc9b7%7C22e1ea5c-4c47-46fa-91c8-7be6d5e0ac3b"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 67,
        "name" => "Intuit QuickBooks",
        "desc" => "Like PayPal and Square, Intuit QuickBooks is a newly SBA-authorized lender. The accounting software company is not taking new applications at this time. When it was, it was taking them from Payroll customers and from QuickBooks Self-Employed customers who filed 2019 taxes with TurboTax Self-Employed. For updates, go here.",
        "links" => [
          {
            "text" => "Updates",
            "href" => "https://quickbooks.intuit.com/small-business/coronavirus/paycheck-protection-program/"
          }
        ],
        "members_only" => "no",
        "still_active" => "no",
        "updated" => "2020-05-20"
      },
      {
        "id" => 68,
        "name" => "JPMorgan Chase Bank",
        "desc" => "The major bank is processing the PPP loan applications it has received, but is not accepting new ones. When it was accepting applications, you had to have an existing Chase business checking account that’s been active since February 15, 2020 to be eligible. You’ll need to sign into your account to apply. For updates, go here.",
        "links" => [
          {
            "text" => "Updates",
            "href" => "https://recovery.chase.com/cares1"
          }
        ],
        "members_only" => "yes",
        "still_active" => "no",
        "updated" => "2020-05-20"
      },
      {
        "id" => 127,
        "name" => "Kabbage",
        "desc" => "[NOTE: Not included in original source] I received my own PPP loan from Kabbage as a prior non-member. I applied on 5/13 and was approved on 5/15 after an application process that was significantly easier than most others.",
        "links" => [
          {
            "text" => "Applcation/Sign-up",
            "href" => "https://account.kabbage.com/create-account?product=sba-loan"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-15"
      },
      {
        "id" => 69,
        "name" => "KeyBank",
        "desc" => "As a top-10 SBA lender, KeyBank serves a large swath of the country: 25 states plus Washington DC. It says on its website that it is processing its backlog of applications and does not seem to be accepting new ones at this time. It does not mention requiring applicants to be existing customers. For updates, go here.",
        "links" => [
          {
            "text" => "KeyBank",
            "href" => "https://smartasset.com/checking-account/keybank-banking-review"
          },
          {
            "text" => "KeyBank page",
            "href" => "https://www.key.com/small-business/promo/stimulus.jsp"
          },
          {
            "text" => "Updates",
            "href" => "https://www.key.com/small-business/promo/stimulus.jsp"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "no",
        "updated" => "2020-05-20"
      },
      {
        "id" => 70,
        "name" => "Live Oak Banking Company",
        "desc" => "Live Oak Bank was taking PPP applications from existing loan customers but is no longer accepting new applications. If you are an existing customer, the nationwide bank says to contact your business analyst for more information. If you are not an existing customer, you can sign up for notifications here. Consolidated assets: $4.8 billion.",
        "links" => [
          {
            "text" => "Live Oak Bank",
            "href" => "https://smartasset.com/checking-account/live-oak-banking-company-banking-review-58665"
          },
          {
            "text" => "Sign up for notifications",
            "href" => "https://www.liveoakbank.com/paycheck-protection-program-sign-up/"
          }
        ],
        "members_only" => "yes",
        "still_active" => "no",
        "updated" => "2020-05-20"
      },
      {
        "id" => 71,
        "name" => "Manufacturers and Traders Trust Company (M&T)",
        "desc" => "With headquarters in Buffalo, New York, Manufacturers and Traders Trust Company (M&T) operates branches in New York, New Jersey, Pennsylvania, Maryland, Delaware, Virginia, West Virginia, Washington, D.C., and Connecticut. It is no longer accepting new PPP loan applications. When it was, it was restricting applicants to business checking account holders who have had their accounts since February 15, 2020, or earlier. For updates, go here.",
        "links" => [
          {
            "text" => "Updates",
            "href" => "https://www.mtb.com/help-center/be-informed-business/coronavirus"
          }
        ],
        "members_only" => "yes",
        "still_active" => "no",
        "updated" => "2020-05-20"
      },
      {
        "id" => 72,
        "name" => "Mascoma Bank",
        "desc" => "This New Hampshire community bank is accepting PPP loan applications. It looks like you don’t have to be an existing customer, but you will have to open a business checking account in order to receive funds. You can find more information here. The bank helps underserved communities through its subsidiary, Mascoma Community Development. Consolidated assets: $1.9 billion.",
        "links" => [
          {
            "text" => "More info",
            "href" => "https://www.mascomabank.com/business-banking/paycheck-protection-program/"
          },
          {
            "text" => "Mascoma Community Development page",
            "href" => "https://www.mascomabank.com/business-banking/mascoma-community-development/"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 73,
        "name" => "Meadows Banks",
        "desc" => "Meadows Bank has headquarters in Las Vegas and three other branches in Nevada and one in Phoenix, Arizona. Though the community bank is an SBA Preferred Lender, it does not provide details on its site about its PPP application process or whether it is requiring applicants to be existing customers. If you’d like to inquire, you can find contact information here. Consolidated assets: $961 million.",
        "links" => [
          {
            "text" => "Meadows Banks page",
            "href" => "https://www.meadowsbank.bank/assets/files/0NWKyAtf"
          },
          {
            "text" => "Contact",
            "href" => "https://www.meadowsbank.bank/connect/contact-us"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 74,
        "name" => "Metro City Bank",
        "desc" => "Based in Doraville, Georgia, Metro City Bank is accepting new PPP loan applications. It is not restricting applicants to existing customers, though it cautions on its site that it cannot guarantee that it will be able to process or fund all loans. To submit an application to the Korean-American bank with branches in Georgia, Alabama, Virginia, New Jersey, New York and Texas, go here. Consolidated assets: $217 million.",
        "links" => [
          {
            "text" => "Application",
            "href" => "https://www.metrocitybank.bank/lending/sba-paycheck-protection-program"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 75,
        "name" => "Midwest Regional Bank",
        "desc" => "One of the largest SBA lenders in Missouri, Midwest Regional Bank also has offices in Arizona, Colorado, Florida and Texas. Its website is not updated, though, with specifics on how to apply for a PPP loan with them. Instead, its customer representative said to call or email the SBA loan officer or bank officer at your local branch. Consolidated assets: $750 million.",
        "links" => [
          {
            "text" => "Contact",
            "href" => "https://www.mwrbank.com/contact-us-2/"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 76,
        "name" => "Mountain Pacific Bank",
        "desc" => "Though this community bank is an SBA Preferred Lender, it does not mention the PPP on its site. To inquire, you can find contact info for the bank’s SBA administrator and officer here (scroll down). Based in Washington, Mountain Pacific bank says that its focus is on serving professionals small businesses in Snohomish, Skagit and King Counties. Consolidated assets: $365 million.",
        "links" => [
          {
            "text" => "Contact",
            "href" => "https://mp.bank/loans/#sba"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 77,
        "name" => "MUFG Union Bank",
        "desc" => "MUFG Union Bank gets its first initials from parent company Mitsubishi UFJ Financial Group. Going by the name Union Bank, the bank has 398 branches in California, Washington and Oregon. Though it is a Preferred SBA lender and the third most active SBA 7(a) lender in California, according to 2018 data, the bank does not have any information about applying for a PPP loan on its site. If you want to inquire, you can find a local banker here.",
        "links" => [
          {
            "text" => "Contact",
            "href" => "https://www.unionbank.com/locations"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 78,
        "name" => "NewBank",
        "desc" => "With two branches in New York and three in New Jersey, NewBank has won the Pinnacle award from the SBA for six consecutive years. Still, the Korean-American community bank does not have information on its website about whether it is participating in PPP. If you’d like to call the bank to ask, the number is (718) 353.8100. Alternately, you can send a message through its website. Consolidated assets: $451 million.",
        "links" => [
          {
            "text" => "NewBank PPP page",
            "href" => "https://www.newbankusa.com/sba-loans/"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 79,
        "name" => "Newtek Small Business Finance",
        "desc" => "Newtek is currently taking PPP loan applications. To begin the process, you’ll have to sign up here. You’ll be notified via email when a specialist is assigned to you and how to contact them. You’ll also be given directions about certain forms and documents. The business solutions company urges applicants to be patient.",
        "links" => [
          {
            "text" => "Application/sign-up",
            "href" => "https://partners.newtekone.com/caresact/business-lending/"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 80,
        "name" => "Northfield Savings Bank",
        "desc" => "As its name suggests, Northfield Savings Bank is based in Northfield, Vermont. It is accepting applications from new and current customers, though it is giving priority to current ones. For more information and to apply, go here. Consolidated assets: $1.1 billion.",
        "links" => [
          {
            "text" => "Application",
            "href" => "https://www.nsbvt.com/paycheck-protection-program"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 81,
        "name" => "Northwest Bank",
        "desc" => "With headquarters in Warren, Pennsylvania, Northwest Bank operates branches in central and western Pennsylvania, western New York and eastern Ohio. It is accepting PPP loan applications, but appears to be giving priority to current business customers. To apply for a PPP loan, the banks says to contact your business banker or relationship manager. But it says that non-Northwest Bank customers can contact the bank at 877-672-5678. For updates, check here. Consolidated assets: $1.7 billion.",
        "links" => [
          {
            "text" => "Northwest Bank",
            "href" => "https://smartasset.com/checking-account/northwest-bank-banking-review-32647"
          },
          {
            "text" => "Updates",
            "href" => "https://www.northwest.bank/covid-19-relief-loan-programs"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 82,
        "name" => "Open Bank",
        "desc" => "Open Bank is a Korean-American bank that primarily operates in California with a branch also in Carrollton, Texas. Its headquarters are in Los Angeles. The bank, which specializes in SBA 7(a) loans, is accepting applications only from existing business customers. For more information, go here. Consolidated assets: $1.2 billion.",
        "links" => [
          {
            "text" => "More info",
            "href" => "https://myopenbank.com/ppp_covid19/"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 83,
        "name" => "Pacific City Bank",
        "desc" => "Pacific City Bank is a community bank with headquarters in Los Angeles, California. It focuses on the Korean-American community. Its website says that it is accepting PPP loan applications, but does not give specifics. If you’d like to call the SBA department, the phone number is (213) 210-2070. Consolidated assets: $1.75 billion.",
        "links" => [
          {
            "text" => "Pacific City Bank PPP page",
            "href" => "https://www.paccity.net/EN/Loans/SBAPaycheckProtectionPlan"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 84,
        "name" => "Pacific Western Bank",
        "desc" => "Pacific Western Bank is a commercial bank based in Beverly Hills, California. It primarily has branches in California, plus one office in Denver, Colorado, and one in Durham, North Carolina. The bank is accepting new PPP loan applications, though it is not clear on whether it is limiting applicants to existing customers. (It says “clients and borrowers” on its site.) For steps on how to apply, the bank says to contact your Pacific Western Bank relationship manager. Consolidated assets: $26.7 billion.",
        "links" => [
          {
            "text" => "Pacific Western Bank COVID-19 page",
            "href" => "https://www.pacwest.com/lending-solutions/federal-coronavirus-relief-loans"
          },
          {
            "text" => "Contact",
            "href" => "https://www.pacwest.com/contact-us"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 85,
        "name" => "Patriot Bank",
        "desc" => "Based in Stamford, Connecticut, Patriot Bank is a community and commercial bank. It serves Connecticut and New York. The bank has a coronavirus update page on its site, but does not specifically mention the PPP. Instead, it says for customers financially affected by the pandemic to call (888) 728-7468 to discuss their needs. Consolidated assets: $980 million.",
        "links" => [
          {
            "text" => "Patriot Bank COVID-19 page",
            "href" => "https://bankpatriot.com/coronavirus-update/"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 86,
        "name" => "PayPal",
        "desc" => "The online payment service has received approval from the SBA to provide PPP loans. It is currently accepting new applications. To learn more and apply, go here.",
        "links" => [
          {
            "text" => "Application",
            "href" => "https://www.paypal.com/us/webapps/mpp/ppploan"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 87,
        "name" => "Peapack-Gladstone Bank",
        "desc" => "The New Jersey commercial bank is accepting PPP loan applications only from existing customers. In fact, if you are a non-customer and have submitted an application, it highly recommends that you resubmit your application to another lender. Customers who want to apply should contact their private banker or local branch. You can find more information here. Consolidated assets: $5.2 billion.",
        "links" => [
          {
            "text" => "Contact",
            "href" => "https://www.pgbank.com/locations"
          },
          {
            "text" => "More info",
            "href" => "https://www.pgbank.com/"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 88,
        "name" => "Peoples Bank",
        "desc" => "This community bank with locations in Ohio, West Virginia and Kentucky is accepting PPP loan applications both from existing and new customers. It says on its site that as of April 16, it has helped more than 2,350 business clients obtain SBA authorization for PPP loans totaling $422 million. Current customers can apply by contacting their dedicated business banker. If you are new to the bank, contact a local branch manager. Consolidated assets: $4.4 billion.",
        "links" => [
          {
            "text" => "Peoples Bank page",
            "href" => "https://www.peoplesbancorp.com/coronavirus/businessloan"
          },
          {
            "text" => "Contact",
            "href" => "https://locations.peoplesbancorp.com/"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 89,
        "name" => "Pinnacle Bank",
        "desc" => "Pinnacle Bank started in Nebraska and now serves a total seven states with 151 locations. On its website, it says it is accepting applications and processing them as quickly as it can. It no longer says that it is prioritizing existing customers with an operating account. You can download the application and get more information here. For assistance with your application, contact your local bank representative. Consolidated assets: $5.3 billion.",
        "links" => [
          {
            "text" => "Pinnacle Bank",
            "href" => "https://smartasset.com/checking-account/pinnacle-bank-banking-review"
          },
          {
            "text" => "Application",
            "href" => "https://www.pinnbank.com/CARES"
          },
          {
            "text" => "Contact",
            "href" => "https://www.pinnbank.com/contact"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 90,
        "name" => "Poppy Bank",
        "desc" => "Headquartered in Santa Rosa, California, Poppy Bank has branches throughout the Golden State. Though it is an SBA 7(a) lender, it does not provide any information about PPP loans on its site. If you’d like to make an inquiry, the customer service line is (888) 636-9994. Or you can email or call a loan officer found here. Consolidated assets: $2.5 billion.",
        "links" => [
          {
            "text" => "Contact",
            "href" => "https://www.poppy.bank/business#small-business-lending"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 91,
        "name" => "PNC Bank",
        "desc" => "With its parent company based in Pittsburgh, PNC Bank operates in 19 states and the District of Columbia with 2,459 branches. It is processing the PPP loan applications it has received but is no longer taking new ones. When the bank was accepting applications, it required applicants to be current business banking clients. To apply, you must have an online account. You can enroll here.",
        "links" => [
          {
            "text" => "PNC Bank",
            "href" => "https://smartasset.com/checking-account/pnc-bank-banking-review"
          },
          {
            "text" => "Sign-up",
            "href" => "https://www.onlinebanking.pnc.com/alservlet/OnlineBankingServlet?userId=enroll&origin=b"
          }
        ],
        "members_only" => "yes",
        "still_active" => "no",
        "updated" => "2020-05-20"
      },
      {
        "id" => 92,
        "name" => "PromiseOne Bank",
        "desc" => "Though this community bank that primarily serves Georgia, with a new branch in Houston, Texas, is an SBA lender, it does not mention the PPP on its site. To inquire, you can contact PromiseOne Bank at 678-385-0826 or SBA@promiseone.bank. Consolidated assets: $450 million.",
        "links" => [
          {
            "text" => "PromiseOne Bank page",
            "href" => "https://promiseone.bank/en/sba-loans/"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 93,
        "name" => "Quantum National Bank",
        "desc" => "Headquartered in Suwanee, Georgia, Quantum National Bank is a community bank with two branches in Milton and Atlanta. It has the Preferred SBA Lender designation, and its website provides a chart on how to decide whether to apply for a PPP loan or an Economic Injury Disaster Loan (EIDL). But the bank does not provide details about its PPP loan application process or whether it is restricting applicants to current business customers.  The phone number for general inquiries is (800-533-6922). For updates, check here. Consolidated assets: $513 million.",
        "links" => [
          {
            "text" => "Quantum National Bank PPP page",
            "href" => "https://www.quantumbank.com/CustomContent.aspx?Name=PPP%20vs%20EIDL"
          },
          {
            "text" => "Updates",
            "href" => "https://www.quantumbank.com/"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 94,
        "name" => "Readycap Lending",
        "desc" => "A subsidiary of New York-based Ready Capital, Readycap Lending is an approved non-bank SBA Preferred Lender. With regional offices throughout the country, it is accepting PPP loan applications. You can start the application process here. Or find more information on its site.",
        "links" => [
          {
            "text" => "Applciation",
            "href" => "https://ppp.readycapital.com/"
          },
          {
            "text" => "More info",
            "href" => "https://readycapital.com/"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 95,
        "name" => "Regions Bank",
        "desc" => "With headquarters in Birmingham, Alabama, Regions Bank serves the South, Midwest and Texas. The bank is accepting PPP loan applications only from customers who established a banking relationship on or prior to March 1, 2020. To apply, you’ll need online banking credentials. If you are an existing Regions customer but don’t have an online account, you can enroll here. If you have an online account already, you can apply here. To know if  Regions will open applications to non-customers, you can look for updates here.",
        "links" => [
          {
            "text" => "Regions Bank",
            "href" => "https://smartasset.com/checking-account/regions-bank-banking-review"
          },
          {
            "text" => "Sign-up",
            "href" => "https://onlinebanking.regions.com/enrollment/home"
          },
          {
            "text" => "Application",
            "href" => "https://apply.regions.com/cares/gettingstarted"
          },
          {
            "text" => "Updates",
            "href" => "https://www.regions.com/small-business/small-business-financing/paycheck-protection-program"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 96,
        "name" => "Republic Bank",
        "desc" => "Philadelphia-based Republic Bank is accepting PPP loan applications from current customers and non-customers in neighboring counties of Pennsylvania, New Jersey and New York. You can find the application and directions here. If you have any questions, you can contact the lending team at 888.875.2265 or email them at SBALoans@myrepublicbank.com. Completed applications and required documents should also be emailed to SBALoans@myrepublicbank.com. Consolidated assets: $3.3 billion.",
        "links" => [
          {
            "text" => "Republic Bank",
            "href" => "https://smartasset.com/checking-account/republic-bank-banking-review"
          },
          {
            "text" => "Application",
            "href" => "https://www.myrepublicbank.com/sba-relief-program-0"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 97,
        "name" => "Royal Business Bank",
        "desc" => "Though Royal Business Bank is an SBA Preferred Lender, the Chinese American bank does not mention the PPP on its website. To make an inquiry, contact the SBA manager, SVP Edward Cho at (213) 533-7953 or edwardcho@rbbusa.com. The Los Angeles-based bank operates branches in California, Nevada and New York. Consolidated assets: $3.1  billion.",
        "links" => [
          {
            "text" => "Royal Business Bank page",
            "href" => "https://www.royalbusinessbankusa.com/small-business.htm"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 98,
        "name" => "Seacoast Commerce Bank",
        "desc" => "San Diego-headquartered Seacoast Commerce Bank is the 10th largest SBA lender in the nation, according to its website. It is accepting new PPP loan applications through its partner Kabbage, Inc., a data and technology company, and it is not restricting applicants to existing customers. To apply, go here. Consolidated assets: $1.1 billion.",
        "links" => [
          {
            "text" => "Seacost Commerce Bank page",
            "href" => "https://sccombank.com/"
          },
          {
            "text" => "Application",
            "href" => "https://partner.kabbage.com/sba-seacoast-bank?refid=seacoastbank&utm_medium=partners&utm_source=seacoastbank&utm_campaign=funding-sba-ppp_20200402_email"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 99,
        "name" => "Seacoast National Bank",
        "desc" => "Based in Stuart, Florida, Seacoast National Bank operates only in the Sunshine State. As an SBA-approved lender, it is accepting PPP loan applications. It does not specify on its website whether applicants have to be existing customers. You should contact your local Seacoast SBA expert or commercial banker to apply. Check for updates here. Consolidated assets: $7.1 billion.",
        "links" => [
          {
            "text" => "Seacost National Bank page",
            "href" => "https://www.seacoastbank.com/coronavirus-cares-act-faq?utm_source=homepage&utm_medium=slider2&utm_campaign=coronovirus&utm_content=button#"
          },
          {
            "text" => "Updates",
            "href" => "https://www.seacoastbank.com/coronavirus-cares-act-faq?utm_source=homepage&utm_medium=slider2&utm_campaign=coronovirus&utm_content=button#"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 100,
        "name" => "Shinhan Bank America",
        "desc" => "Though this subsidiary of the Korean company is an SBA Preferred Lender, Shinhan Bank America does not mention the PPP program on its website. If you wish to inquire, you can find contact information here. The bank primarily operates in the New York - New Jersey area, with branches also in California, Georgia and Texas. Consolidated assets: $1.6 billion.",
        "links" => [
          {
            "text" => "Contact",
            "href" => "https://www.shbamerica.com/contact-us/"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 101,
        "name" => "Square",
        "desc" => "The fintech company received approval from the SBA to provide PPP loans. Square, which is working in partnership with Celtic Bank, is accepting applications. The company invites businesses that are not yet members to sign up for a Square account in order to apply for a PPP loan. You can find more info and updates here.",
        "links" => [
          {
            "text" => "Updates",
            "href" => "https://squareup.com/us/en/l/sba-ppp-loans"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 102,
        "name" => "Stearns Bank",
        "desc" => "With branches in Minnesota, Florida, and Arizona, Stearns Bank is headquartered in St. Cloud, Minnesota. Citing the limitations of funding and ability to process applications, the bank is recommending that applicants apply elsewhere. In fact, its application portal appears to have been taken off line. For more information, go here. Consolidated assets: $2.3 billion.",
        "links" => [
          {
            "text" => "Application portal",
            "href" => "https://customerportal.stearnsbank.com/broker/application/?campaignid=7010a0000056pQx&hsCtaTracking=69a5869b-355f-46ec-9313-3c42a5899ad3%7Cf5e85511-1cbb-4290-8309-548884bb1345"
          },
          {
            "text" => "More info",
            "href" => "https://www.stearnsbank.com/cares-act#paycheck"
          }
        ],
        "members_only" => "yes",
        "still_active" => "no",
        "updated" => "2020-05-20"
      },
      {
        "id" => 103,
        "name" => "Stockman Bank ",
        "desc" => "With branches throughout Montana, Stockman Bank is the state’s largest agricultural bank and an SBA Preferred Lender. It is currently processing applications and accepting new ones, but only from existing business customers. For more information, go here. Consolidated assets: $4 billion.",
        "links" => [
          {
            "text" => "More info",
            "href" => "https://www.stockmanbank.com/paycheck-protection-program-information"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 104,
        "name" => "Stone Bank",
        "desc" => "Though this Arkansas bank is an SBA Preferred Lender, it does not mention the PPP on its site. To inquire, you can find Stone Bank branch information here and officers in its SBA division here (scroll to the bottom).Consolidated assets: $474 million.",
        "links" => [
          {
            "text" => "Contact",
            "href" => "https://www.stonebank.com/branches/"
          },
          {
            "text" => "SBA contact",
            "href" => "https://www.stonebank.com/loans/small-business-administration/"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 105,
        "name" => "Sunflower Bank",
        "desc" => "This SBA Preferred Lender says that it has received enough interest regarding PPP loans that it expects to reach its capacity to lend under the program. In other words, the Denver-based bank is no longer taking applications. Check here for updates in case the situation changes. Sunflower Bank, which goes by First National 1870 in New Mexico and El Paso, Texas, operates in Colorado, New Mexico, Texas, Arizona and Kansas. Consolidated assets: $4.2 billion.",
        "links" => [
          {
            "text" => "Updates",
            "href" => "https://www.sunflowerbank.com/PaycheckProtectionProgram"
          }
        ],
        "members_only" => "yes",
        "still_active" => "no",
        "updated" => "2020-05-20"
      },
      {
        "id" => 106,
        "name" => "Synovus Bank",
        "desc" => "Based in Columbus, Georgia, Synovus Bank operates 300 locations across the Southeast. It is no longer accepting digital applications. When it was, it was taking them only from existing business customers with a business checking account. For updates, check here. Consolidated assets: $48.1 billion.",
        "links" => [
          {
            "text" => "Synovus Bank",
            "href" => "https://smartasset.com/checking-account/Synovus-Bank-banking-review-873"
          },
          {
            "text" => "Updates",
            "href" => "https://www.synovus.com/covid-19/paycheck-protection-program/"
          }
        ],
        "members_only" => "yes",
        "still_active" => "no",
        "updated" => "2020-05-20"
      },
      {
        "id" => 107,
        "name" => "TCF National Bank",
        "desc" => "TCF National Bank, which recently merged with Chemical Bank, is accepting PPP loan applications. The bank does not say it is limiting applicants to current customers. You’ll find more information here. To start the application process, go here. TCF (which stands for Twin City Federal) primarily operates in Michigan, Illinois and Minnesota. It also has branches in Arizona, Colorado, Ohio, South Dakota and Wisconsin. The Midwest bank says, though, that it conducts business in all 50 states through its specialty lending and leasing businesses. Consolidated assets: $46.6 billion.",
        "links" => [
          {
            "text" => "More info",
            "href" => "https://www.tcfbank.com/about-tcf/businessrelief"
          },
          {
            "text" => "Application",
            "href" => "https://commercial.tcfbank.com/sbappp/s/application?bank=TCF&"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 108,
        "name" => "TD Bank",
        "desc" => "TD Bank, with branches in the Northeast, Mid-Atlantic, Metro D.C., the Carolinas and Florida, is accepting PPP loan applications from existing business customers at TD Bank, a subsidiary of the Canadian multinational Toronto-Dominion Bank. To apply, go here. Consolidated assets: $17.8 billion.",
        "links" => [
          {
            "text" => "TD Bank",
            "href" => "https://smartasset.com/checking-account/td-bank-banking-review"
          },
          {
            "text" => "Application",
            "href" => "https://www.td.com/us/en/small-business/covid-sba/"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 109,
        "name" => "The Heritage Bank",
        "desc" => "The Heritage Bank is a community bank that is a division of Heritage Southeast Bancorporation. The bank has branches in Southeast Georgia and one in Northeast Florida (Jacksonville). Though it’s an approved SBA lender, it does not mention the PPP on its site. To inquire, here is its contact page. Consolidated assets: $1.3 billion.",
        "links" => [
          {
            "text" => "Heritage Bank page",
            "href" => "https://www.the-heritage-bank.com/Business/Loans"
          },
          {
            "text" => "Contact",
            "href" => "https://www.the-heritage-bank.com/Contact-Us"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 110,
        "name" => "The Huntington National Bank",
        "desc" => "The Columbus, Ohio-headquartered bank provided the most SBA 7(a) loans in fiscal year 2018, according to the most recent SBA data. It primarily serves the Midwest: Indiana, Illinois, Kentucky, Michigan,Ohio, Pennsylvania and West Virginia. The Huntington National Bank is no longer accepting PPP loan applications. When it was, it was taking them only from existing business customers. To apply, you must speak to a business banker, who can be reached at (888) 845-7556. For more information, this is the bank’s COVID-19 relief website page.",
        "links" => [
          {
            "text" => "Huntington National Bank COVID-19 page",
            "href" => "https://www.huntington.com/coronavirus/business-resources?icmpid=coronavirus:latest_response_to_the_coronavirus:top_gray_banner"
          }
        ],
        "members_only" => "yes",
        "still_active" => "no",
        "updated" => "2020-05-20"
      },
      {
        "id" => 111,
        "name" => "The Loan Source",
        "desc" => "This non-bank SBA-approved lender is processing PPP loan applications and accepting new ones. The New York company is taking applications from existing and new customers. Check here to begin the application process.",
        "links" => [
          {
            "text" => "Application",
            "href" => "https://theloansourcesaysyes.com/"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 112,
        "name" => "The MINT National Bank",
        "desc" => "The MINT National Bank serves the greater Houston area. The community bank is no longer accepting PPP loan applications from its customers. For updates, go here. Consolidated assets: $246 million.",
        "links" => [
          {
            "text" => "Application",
            "href" => "https://www.themint.bank/"
          }
        ],
        "members_only" => "yes",
        "still_active" => "no",
        "updated" => "2020-05-20"
      },
      {
        "id" => 113,
        "name" => "21st Century Bank",
        "desc" => "Operating in Minnesota, 21st Century Bank is currently processing received requests for PPP loans. The SBA Preferred Lender will announce on its website when it will open the application process again. Check here for updates. Consolidated assets: $562 million.",
        "links" => [
          {
            "text" => "Updates",
            "href" => "https://21stcb.com/business-banking/#business1-tab6"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "future",
        "updated" => "2020-05-20"
      },
      {
        "id" => 114,
        "name" => "Umpqua Bank",
        "desc" => "Umpqua Bank has headquarters in Roseburg, Oregon, with additional locations in Idaho, Washington, Oregon, California and Nevada. The bank is accepting applications from new and existing customers. For more info, go here. Consolidated assets: $28.8 billion.",
        "links" => [
          {
            "text" => "Umpqua Bank",
            "href" => "https://smartasset.com/checking-account/umpqua-bank-banking-review"
          },
          {
            "text" => "More info",
            "href" => "https://pages.umpquabank.com/cares-act-paycheck-protection-program?_ga=2.35369249.1633677914.1586270015-1244957503.1586270015"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "future",
        "updated" => "2020-05-20"
      },
      {
        "id" => 115,
        "name" => "UniBank",
        "desc" => "Though UniBank, a Central Massachusetts-based community bank, is an SBA lender, it does not mention the PPP on its site. To inquire, you can find a business banking officer here. Consolidated assets: $2.1 billion.",
        "links" => [
          {
            "text" => "UniBank page",
            "href" => "https://www.unibank.com/business/business-loans"
          },
          {
            "text" => "Contact",
            "href" => "https://www.unibank.com/business/meet-the-team"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "possibly",
        "updated" => "2020-05-20"
      },
      {
        "id" => 116,
        "name" => "Union Bank & Trust Company",
        "desc" => "Headquartered in Lincoln, Nebraska, Union Bank & Trust Company is a state-chartered commercial bank. It is currently taking PPP loan applications only from current customers whose loan, deposit, trust or investment account pre-dates March 1, 2020. For more information, go here.",
        "links" => [
          {
            "text" => "More info",
            "href" => "https://www.ubt.com/business-relief"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 117,
        "name" => "United Business Bank",
        "desc" => "With branches in California, Colorado, New Mexico and Washington, United Business Bank is still accepting PPP loan applications from existing business clients and non-customers. For more information, including the application, go to the California-headquartered bank’s website. You can also contact Harrison Lee, SVP/SBA regional manager, at hlee@ubb-us.com or at 213.401.3211.",
        "links" => [
          {
            "text" => "Application",
            "href" => "https://www.unitedbusinessbank.com/loans-credit/business-loans/small-business-loans-sba.html"
          },
          {
            "text" => "hlee@ubb-us.com",
            "href" => "mailto:rpak@ubb-us.com"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 118,
        "name" => "United Community Bank",
        "desc" => "A Southeast regional bank, United Community Bank operates branches in Georgia, South Carolina, North Carolina and Tennessee. It has temporarily suspended acceptance of PPP loan applications until the SBA program receives more funding. You can fill out a form to express your interest in applying here. The bank does not say whether it will have any restrictions regarding applicants. Check for updates here. Consolidated assets: $12.9 billion.",
        "links" => [
          {
            "text" => "United Community Bank",
            "href" => "https://smartasset.com/checking-account/united-community-bank-banking-review"
          },
          {
            "text" => "Interest form",
            "href" => "https://www.ucbi.com/support/cares-act/"
          },
          {
            "text" => "Updates",
            "href" => "https://www.ucbi.com/support/cares-act/"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "future",
        "updated" => "2020-05-20"
      },
      {
        "id" => 119,
        "name" => "United Midwest Savings Bank",
        "desc" => "Based in Columbus, Ohio, United Midwest Savings Bank is the 13th largest SBA lender in the country, based on number of loans. It is currently accepting PPP loan applications only from existing customers, and does not provide any information about its application process on its site. If you wish to contact the bank, the phone number for the large SBA loan division (for loans bigger than $150,000) is (844) 245-3033 and the number for the small SBA loan division is (844) 211-7897.",
        "links" => [
          {
            "text" => "United Midwest Savings Bank page",
            "href" => "https://www.umwsb.com/"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 120,
        "name" => "U.S. Bank",
        "desc" => "The fifth largest bank in the country, U.S. Bank has suspended accepting PPP loan application until the SBA program receives another round of funding. The Minneapolis-based bank was not requiring applicants to be existing customers. That said, it did encourage non-U.S. Bank customers to start with their own banks. For updates, check here.",
        "links" => [
          {
            "text" => "U.S. Bank",
            "href" => "https://smartasset.com/checking-account/us-bank-banking-review"
          },
          {
            "text" => "Updates",
            "href" => "https://www.usbank.com/business-banking/business-lending/sba-loans/paycheck-protection-program.html"
          }
        ],
        "members_only" => "no",
        "still_active" => "future",
        "updated" => "2020-05-20"
      },
      {
        "id" => 121,
        "name" => "US Metro Bank",
        "desc" => "With headquarters in Garden Grove, California, US Metro Bank primarily operates in Southern California. It has branches in Anaheim, Los Angeles and Buena Park. Its website provides general information about PPP loans, but not about its particular application process. Instead, it says to call Ty Park, SBA manager, at (714) 823-4263.",
        "links" => [
          {
            "text" => "US Metro Bank page",
            "href" => "https://www.usmetrobank.com/"
          },
          {
            "text" => "US Metro Bank PPP page",
            "href" => "https://www.usmetrobank.com/Portals/USMetroBank/PDFs/The%20stimulus%20bill%20Paycheck%20Relief.pdf"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 122,
        "name" => "VelocitySBA",
        "desc" => "VelocitySBA is one of 14 licensed small business lending companies in the country. With a focus on lending to small businesses, the California company has stopped accepting new PPP loan applications. Check here for updates.",
        "links" => [
          {
            "text" => "Updates",
            "href" => "https://www.velocitysba.com/"
          }
        ],
        "members_only" => "no",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 123,
        "name" => "Wallis Bank",
        "desc" => "Headquartered in Wallis, Texas, Wallis Bank serves California, Georgia and Texas. The community bank was accepting PPP loan applications from Texas, Southern California and Atlanta metro areas, but has stopped since the SBA program ran out of money. Once the bank reopens it application process, you can find the application and document requirements on its website, where you can also find the email address to send applications and any questions to. From the application documents, it appears that the bank is not requiring applicants to be existing customers. That said, the bank does mention the high demand for loans.",
        "links" => [
          {
            "text" => "Application",
            "href" => "https://www.wallisbank.com/covid19-resources/"
          }
        ],
        "members_only" => "no",
        "still_active" => "future",
        "updated" => "2020-05-20"
      },
      {
        "id" => 124,
        "name" => "Wells Fargo Bank",
        "desc" => "Wells Fargo, a major SBA 7(a) lender, is accepting applications in anticipation of the PPP receiving additional funding. To apply, you must be an existing business clients and log into your business or commercial electronic office account. For more information, this is their PPP website page. Consolidated assets: $16 billion.",
        "links" => [
          {
            "text" => "Wells Fargo",
            "href" => "https://smartasset.com/checking-account/wells-fargo-banking-review"
          },
          {
            "text" => "Wells Fargo PPP page",
            "href" => "https://update.wf.com/coronavirus/paycheckprotectionprogram/?_ga=2.136756080.1736621085.1585961939-1238989020.1585961939"
          }
        ],
        "members_only" => "yes",
        "still_active" => "future",
        "updated" => "2020-05-20"
      },
      {
        "id" => 125,
        "name" => "West Town Bank & Trust",
        "desc" => "West Town Bank & Trust is a community bank with branches in Cicero and North Riverside, Illinois. According to its website, it is accepting PPP loan applications only from existing customers at this time. To begin the application process, have your account number ready when contacting your local West Town Bank representative. Check here for any updates.",
        "links" => [
          {
            "text" => "Updates",
            "href" => "https://westtownbank.com/government-lending/paycheck-protection"
          }
        ],
        "members_only" => "yes",
        "still_active" => "yes",
        "updated" => "2020-05-20"
      },
      {
        "id" => 126,
        "name" => "Zions Bank",
        "desc" => "Founded by Brigham Young, Zions Bank serves Utah, Idaho and eight other Western and Southwestern states. It is processing applications that it has received, but is not accepting new applications. Initially, only current business customers who have a deposit account (names of applicant and business account holder must match) can apply. But its checklist for applicants includes sections for new customers, who will need to open a business account. For updates, go here.",
        "links" => [
          {
            "text" => "Zions Bank",
            "href" => "https://smartasset.com/checking-account/zions-bank-banking-review"
          },
          {
            "text" => "Updates",
            "href" => "https://www.zionsbank.com/LandingPages/small-business-cares-act/"
          }
        ],
        "members_only" => "possibly",
        "still_active" => "no",
        "updated" => "2020-05-20"
      }
    ]
  end
end