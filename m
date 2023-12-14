Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="agaHgf4x"
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0131711B;
	Thu, 14 Dec 2023 02:51:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mw8EBWHtMAwNW2rXNAdST3UxjQy/frII7r7hGxJw6NpiZyRFwQBW73ZirrKf0itY87h4pZi50nyNXihE3wA+Uots8j993VhX2qOQa5FMkSQcYQsV60lJ2R/8s2qFhSuibEuGutobTH7d9i5Ew+v/vDWOSIVpdBYkHCl+jVT/6pnItbJM4lr7c/t3td6bgUabt+FXmSoZh8L2TAqLezD+O6At8tP6BW12Pszf2ZQbFNL7DdxQ/fnxaqfVMgvEpStrpdDO9DuMu5aUmw1rxjYyNCqNLG/bbDNxzLkmFx4a3JAnhjwCbO7mIA0g0k23iF8SP9r5boGlIe4LhPMRUTJW1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zndPdkoj2wT8zCmWAIo2I/EuhHbdxUgyMXxPrwxXE18=;
 b=gM6rG5AO5BakYBO5dUuzpm4U/9z5q/avQiifdaJ+NxopgowmxXbz+4+axDoJ4amDSS1kukXC2HAQv/O4l69Idu7TlQKSnEdLzOpvflMAZ3x4SqKCIJam42bLQNhi4svchnh86bFcQe/Un+CpeP0HDFzrSpa9DWcYZs+PGbBOyjKpuPqP/0byit+wjjOACAxcP6C/N/Hc+GwFx7moiz1ZSxAUJhPGreQ1NPca4AtUWTWScuDL4TAplXyRhN1eb7Cpb+K0aSY+74seIcgB1tuqLQTaOmeSVOt+a8svVSBUuA2xTUZNLmpUOh6RiD7FjOBj8PWKct6WUl1G/oPIKdZvnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zndPdkoj2wT8zCmWAIo2I/EuhHbdxUgyMXxPrwxXE18=;
 b=agaHgf4xGg+cIfgJbPovlx8J1XFqnetUSQmraCkLQBwzQJNNlargN7I/IDR8hnWw6OjUWzFKfiQ4KLHsEZ2NmOyseiOVecqUR9KlknliDRHcAIlhfAjWwlNef1O2/Mll2eyiUmIRuiH3Y13ZPHoGfxrBRQrWunfEOCuXKF/5DF8=
Received: from DM6PR06CA0034.namprd06.prod.outlook.com (2603:10b6:5:120::47)
 by CY5PR12MB6180.namprd12.prod.outlook.com (2603:10b6:930:23::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 10:51:44 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:5:120:cafe::5e) by DM6PR06CA0034.outlook.office365.com
 (2603:10b6:5:120::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Thu, 14 Dec 2023 10:51:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.26 via Frontend Transport; Thu, 14 Dec 2023 10:51:44 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 14 Dec
 2023 04:51:43 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Thu, 14 Dec 2023 04:51:41 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>
CC: <git@amd.com>, <devicetree@vger.kernel.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<michal.simek@amd.com>
Subject: [PATCH  RESEND v7 1/2] dt-bindings: clock: xilinx: add versal compatible
Date: Thu, 14 Dec 2023 16:21:24 +0530
Message-ID: <20231214105125.26919-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231214105125.26919-1-shubhrajyoti.datta@amd.com>
References: <20231214105125.26919-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|CY5PR12MB6180:EE_
X-MS-Office365-Filtering-Correlation-Id: 1411b8b6-c151-43f0-9322-08dbfc92a9a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1ppFXthn4xqSv2CWjE/YQfe8pNJay3YNkYb0YodRXJ3frVVgwGXHRIzzDDPWTB8EKovlI6ixaF7cJ+nGwQHNMM+eywPEJsOJZxgMrRoUtY22xbZPvyaLq1ECGxccXFzofXu6M4oZMzF6rc0n5rmEosAhUjAduH4JMutCdbNEoAJ6NqgCzlvo+RvnoTP7ue/dpI2w21XWClthYjS/BTQLXRA+OTXEKtnLtv8hKnEHnJqLBIak/Gfgqxcd5Ka8hvRT47QodKaJjan7H2ta/u8N0c6/nDxR4FE6oRHLF4m8oqE7M6tzgQvf/sLeKPx12tdj+Bgxjv37BT8bdP2PTcHstDUKjKQgH1OjYOjfoSeCsyS2dB4P7NqO31XK1RUF2D+zQHCD8kI8dZ3shUji/aC9Ndq9O2wkVrVK79KR5Pr12xnERf3i4+qanEaxOmjWyjioxmelMAo1ikUQl04UZaV0HL3ljUgzl5Dvdop068WCAYowZfvTN9CQp40yqGt1eje++995C//JXZPV6DM7vs6D7zDlSfas3VoExLu344WW8Nv0Xutezw7Nm061SQZ9xUPPW/Xz6WjUPxjr9WpZ8htyFi7wpnJUmM4StB1E1xog+QosJzYKaorTOlcuF+wHsEoltVT/p53yysxjsSXLoEis2YE7OUDRv2ErZ4R9TIrBntpMAijQXFTxRuD3Tpm2Hpxbi+G3NAWDPrsGo7DwLxXTWFtefI5vXSnD4z4V0ZLVtiob7SS2n2ZkvFuz1vfPQVAwH8zVni1q1KPt0k1ScvVvQg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(136003)(346002)(230922051799003)(451199024)(82310400011)(186009)(1800799012)(64100799003)(46966006)(40470700004)(36840700001)(4744005)(36860700001)(2906002)(47076005)(41300700001)(86362001)(81166007)(82740400003)(356005)(70586007)(6666004)(54906003)(70206006)(26005)(316002)(6916009)(8676002)(8936002)(4326008)(2616005)(40480700001)(1076003)(478600001)(36756003)(83380400001)(336012)(426003)(44832011)(5660300002)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 10:51:44.3523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1411b8b6-c151-43f0-9322-08dbfc92a9a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6180

Add the devicetree compatible for Versal clocking wizard.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

---

(no changes since v4)

Changes in v4:
Add Ack and update subject

 .../devicetree/bindings/clock/xlnx,clocking-wizard.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
index 02bd556bd91a..9d5324dc1027 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -20,6 +20,7 @@ properties:
       - xlnx,clocking-wizard
       - xlnx,clocking-wizard-v5.2
       - xlnx,clocking-wizard-v6.0
+      - xlnx,versal-clk-wizard
 
 
   reg:
-- 
2.17.1

