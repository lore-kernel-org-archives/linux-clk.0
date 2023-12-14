Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oEHS80Zn"
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB90D115;
	Thu, 14 Dec 2023 02:51:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPly6Ja7KO9x8jktPNV0ohnW0umKa90kLVei+oO8AJzgyv3E021lCYExXS6k2At3UShoC6Z3hexW9a+tX0wCl3DvFn+N9n/TvQybKq6w4JuB6kueC7EfozJMnx3mwMTm9t3OTLS/kLjSCDW3rCug06lcK9ciE6KW4yneY365+vVeCS4LyL9cG0SVcQJ4TAA+x1bVT28iH3zvh4Xz2a4vJifMVlCMSqNPysVQAn35zYH9yUNOphz4roWXtjE4+85Y01vnlbXZCCjeN+x7D+HEmH8QtcZmQQABmLme/hlWIe41HyrSnkpLLuM7JeygSH6kgXSj0vIB5lsIa3tyaTJcGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2FuJK5DNoq5yo6kOAgRSqN0vz8Pehj1A5usjv1/9jY=;
 b=XE+hUHpKqiqcSHdCT+dCuop/0m20xvfvOVn0ct99JdGQE7t+nsXt5gPAr/zdjFKP8Kas6C4n4FUzH8nY2+olXYhkAIkc96peP0re1fjBKAT2fCQMxf+a/sJSnv21lAuZ/YhZueqftMqjuEVFqKfhHTZL1p3rxikOOjpLS1BXu9QujAEAAkBMsI0sbt9LlWy1nHt/L2UVne9SxMB+PJSZXzlKk4/CVi8caExcVPt0f2aui2YFFHef1LuH4Q17fy3kodlY3NParXxnxuxaLfHLHtn3dMe7vBXR3T0FvEljzwrNHBbGX/XeboRvVzh5swJaelaJ/kTsn1yoOgZcznxUlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2FuJK5DNoq5yo6kOAgRSqN0vz8Pehj1A5usjv1/9jY=;
 b=oEHS80Zn8ZKbs0BGEXxGSJINZ6FiRDyT6nvuizLQvwB4+NCdSa30UJLj33PoaisH+1Gq+dZaeqQ+PUE4Hs7oIjgSWyy3UZK9vSdffB8U7UN+zUgVqQhpv5MQqeY28gA2ZIOAWWgA+QDLh3SsTsHwKPLWwMTSmun8MFEz9MgdrtE=
Received: from DM6PR06CA0036.namprd06.prod.outlook.com (2603:10b6:5:120::49)
 by DM6PR12MB4313.namprd12.prod.outlook.com (2603:10b6:5:21e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 10:51:42 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:5:120:cafe::a1) by DM6PR06CA0036.outlook.office365.com
 (2603:10b6:5:120::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Thu, 14 Dec 2023 10:51:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.26 via Frontend Transport; Thu, 14 Dec 2023 10:51:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 14 Dec
 2023 04:51:41 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 14 Dec
 2023 04:51:33 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Thu, 14 Dec 2023 04:51:31 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>
CC: <git@amd.com>, <devicetree@vger.kernel.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<michal.simek@amd.com>
Subject: [PATCH  RESEND v7 0/2] clocking-wizard: Added support for versal clocking wizard
Date: Thu, 14 Dec 2023 16:21:23 +0530
Message-ID: <20231214105125.26919-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|DM6PR12MB4313:EE_
X-MS-Office365-Filtering-Correlation-Id: acda4bd2-c27e-4ef9-6616-08dbfc92a873
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3IlKCD5OfLMmTAT6pdJdy4Z8l5nclWAamStkBY47xJlQNrxjtq8YD6eHuQUm+rjU4b5K6zePY20D+EEWKWTWgjgxo48KZE1JNaAqHlKVe7mbUK5LFbitHmJvyyTPDr7oEU+llvIsVMD6SNUFZtwt0l/aqgk5+u9BKJWrYEweDyfKbQsHDPUfIJPrx/HoRxrbQpvlnKGMof5joHreHk1ZNdyWQpqgKZNq5O+Dh/IdXRA2H/qW9Wvlf0g+r7JeI0LpHgfvZxJdXlv2pxwQw6aho7dEQ+NFkXqDcx4XEzoEnp2R72AheJ29RlWOYHMvVU9AULpTO5i/jYukvlPxq2+L32v3xS1v49ev/RBiW/PgI9g36d5ZxbysVBZW0LZL0xNWq+RJFYaNl9PF/gzflZ0CXS9PCVp/tJzwUmIwGmbBIjy9t881GXF4V6gKweuKSqa4bTv/2r2AYTmMAqYxtJmmM8jjftLca1uUB9PHCU7ziWldf1/fObeVLLoPSg+Mkg8iE6G5q8ya6ahI7kqIhM8mQDjy38p9Tud8bnM6SbDk1732z/WIaeO+nhPOj/AYK6Mn5Q40oRtXz//ZvnXBYIRL9PEWIPH6nKBtgK7aX77gcdMmN6TskkvuGipiqCWL96Qy79ucRpFcaecLSZRcmgMixkXFRR7LZj12lWUBSzKgs/000SL2Q4AApE28hcKLu5eSrGYpsWNVOLLv2UT/9vAKWEcjOB61Sd8ILBmlLoO8AI1uqQDg5x/DDdt2tlatRkldNYkWl1o1jcr+VJttl170aPaEP/bz+HIJU61tSJEDauU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(82310400011)(451199024)(1800799012)(186009)(64100799003)(40470700004)(46966006)(36840700001)(8936002)(2616005)(4326008)(8676002)(86362001)(1076003)(70586007)(70206006)(316002)(6916009)(54906003)(81166007)(5660300002)(83380400001)(26005)(2906002)(426003)(336012)(47076005)(356005)(41300700001)(36756003)(82740400003)(44832011)(36860700001)(40460700003)(6666004)(40480700001)(966005)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 10:51:42.3523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acda4bd2-c27e-4ef9-6616-08dbfc92a873
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4313


Add Versal clocking wizard IP driver support

The Versal clocking wizard is clock circuits customized to cater to
clocking requirements. It provides configurable number of outputs.

Datasheet link: https://docs.xilinx.com/r/en-US/pg321-clocking-wizard



Changes in v5:
Update the commit message
register separate clock ops for versal
use device match data

Changes in v4:
Add Ack and update subject
Update changelog
Fix warn
Previously we had tried to upstream [1] separate driver for
clocking wizard. It was decided to add support to the current
driver. So abandoning the series.
[1] https://lore.kernel.org/all/20221122121255.6823-1-shubhrajyoti.datta@amd.com/

Changes in v3:
rename the clocks to clk_in1 and s_axi_clk dt
rename the clocks to clk_in1 and s_axi_clk in driver

Changes in v2:
rename the clocks clk_in1 to in1 and s_axi_clk to s_axi in dt
rename the clocks clk_in1 to in1 and s_axi_clk to s_axi in driver
update the warn
Update the compatible to reflect versal

Shubhrajyoti Datta (2):
  dt-bindings: clock: xilinx: add versal compatible
  clocking-wizard: Add support for versal clocking wizard

 .../bindings/clock/xlnx,clocking-wizard.yaml  |   1 +
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c    | 626 +++++++++++++++---
 2 files changed, 536 insertions(+), 91 deletions(-)

-- 
2.17.1

