Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022079.outbound.protection.outlook.com [40.107.75.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED2630F7FB;
	Mon, 22 Jun 2026 02:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782095134; cv=fail; b=ECznBhccnwzIkdNJnG8JPUJvQJGeJY3kYhN5wcBvfU8OafAHeemEacHEg7c1VTAJffAo5+NosQMIct2XJjUn1T/tAwWUPTfz6b5/1UbHPDOlk4CFelb4nB0xH3DJwBtoIpRXf7+K+xg5Kunp5xWB6hG7Xk5G5SGs6j6uaC46vwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782095134; c=relaxed/simple;
	bh=SovscZJ204cWytRRc+Lb+H7Besfpmg4cAMBXPeIHy5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nX871K5mMBLpPa/8MBkrWre5Iu3l6nRIetrUzwnf5lWK6mQJBGMeJ4TnP+WvMYoHLJ1jq/tWk5v8mu/E0GqzLi9jdjKiEtn0dDTwtwuzo8wnSomqh/mSQrjRTo+NuYGC9bdE3JsiDk/DHEjX4ZPCSUJcdRcisZEGf+zPS9gSqm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMbaoLQjAyOueyxNV4gr2T+6XqcPr3YWn/JOJVGjNmvTbNet195b+KIAAzxyAkQp49+z6kzMpzHw0gNpf4eJ+UxlaoTXK3qd/OR60NkT7Db9jXAHVM/5bxC0eWVd7kmOnh62sFcc8cTQN4jNwYZ1dje0cgL917BCYGNlA2qLn2b/dGgBQgl1XB6un+f170BOjK91F99VDRMN2zBOKGPMzQFcWBMN81yfvp4g9y+KQyD8u/T3TbeWRpDL0Zwv7GzPxeWFiOnXNxOa+XcFbKXCUKBzvBAeG0ytMwaw13UnY+N+iPuWNTP1OQqWpD9olUT66eW/ocO3MtJ9rPiMBvwcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTm2XL8a1/DmY7Zsk0M53nZ2+aOtYHrrqgUwUPGcdgo=;
 b=ApYaiNbJTisJsh7XAmaIXgTo4XTTj2hIAsPiVOOpoY/9ps9p2KqkBIat5aP0QVcNJ6sRx5bZqzLrshKDEIfbFG1pBi+whNwRmJYMhM2MU02tHgaxkGSV7zUQJR4JAP2PmANWYpuj63/7K6/rNGgkcmJOcioDZliHIQcYMWCorU5TB/Fk9QyRsMXNlyFmAIt8Lwdhyf70Lli8vVsFv55k++/stmUAAhDsh043PwDH/KL4QZ1EF5EwkfhSdRJMArHmDM3nZ6XzmDCGB2ReCmdYn5sNt96luDNh0lUHweiqvuTLfr9FeuldiPXDsVqsLoQ2wyn/HDhyuQJ/cyDcog4Vng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR06CA0010.apcprd06.prod.outlook.com (2603:1096:4:186::6) by
 SE3PR06MB9219.apcprd06.prod.outlook.com (2603:1096:101:332::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Mon, 22 Jun
 2026 02:25:30 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:4:186:cafe::46) by SI2PR06CA0010.outlook.office365.com
 (2603:1096:4:186::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.13 via Frontend Transport; Mon,
 22 Jun 2026 02:25:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 02:25:29 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D2B9540E7F98;
	Mon, 22 Jun 2026 10:25:27 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	gary.yang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v5 4/4] arm64: dts: cix: sky1: add audss cru
Date: Mon, 22 Jun 2026 10:25:20 +0800
Message-ID: <20260622022520.3127103-5-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260622022520.3127103-1-joakim.zhang@cixtech.com>
References: <20260622022520.3127103-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|SE3PR06MB9219:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 321c13f2-03cf-461a-cc4d-08ded005873b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|23010399003|36860700016|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Lblxy9gWLSnqf1kBGyIcgWjxzoyKud4H8SS4IGoLw2tHZhJbre6Hco1lxLr4DjPQjaZQf/7D3uWsifWvGLWzbeFw1GTw8HsJUFb6jZDxqhQtgmezSnNbzRdrPjHVcIwiPd18NCr6cAKZqYi2AYiwTXjDvcubTeiutoSqSKwUgJULj6lNiFKQ8IS4zEwlqaYpWULJXoZYXs3t9eB05cTP4mP01QWcmeeY+Z9HMQtAcvfkqwhtFvPQKCdvO/PROhkm6CaDdf76c0dACR8ZSZmgIr4B7ZcvZQAT3KsNdgohmcIuTiFVkDdwWAx3SJc9EmQoZwgyyCyyiYtM9Mf/vs6QWHiw1iqh6nmvUiRmYwEB/nJNWnMSHrUWBmOcQZu3m73aNVAoVOYGHkJae9CgFi5jxSqCb3IQvWGnctqvKojGZsgVlojim24r3zFft7zDh4nBDJb/+1tiPJhU5CglXb+w0QiRwMRkskNT7JzTsZFgYp6trSiTBnQJz2OKm7Ig/HJDfDfQdH9DO5II1bvxK7xzajciTcyxxBZDloRvvwsH5n6F1aGJOsK9kXoBz2pSPL7Bxs6VJprmw/uUy+ezzfbymcBgP2CqqLoLIWGE4lrtf7NMfxHtbwggnF7eGxtfDLxk0HfU6v+eQka3TrmvJ3Nw6Ju1nwdWpzgi+r383wIAZQQSK/6NjcBf9MA87l3PayUK+iTEv1KOe2OmGGrQfjc+FQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Q4H3vk3RgC1bHQeHo8NTMmPR9prt+2C3iRIc0zZOeUrMuK7Mx9dp2Fjbx02bvGG3a5jLF6etOtWk5t3lH7wRjqZdk8N+mFis+KXoQmdgMUlDs30eD8xPcEejlndDOVmG0id7vstw4Et9G63VzMn0kjJfk1xPd1sejAwzqbAlQolJ7C3R6jCGHGvzTMO7J9u6NDbltNfGcJu5adl94GdIs90Kf0dT9efnY7VEywi3/lL/OEf6qmdtsqeooQIZiRZnlj/IhI0K9eRrAZfAZDcZhV9sPtN2OB7IBfhCYePB+8WV7YUmgtbbITy6IcggEr8sr86V1aPNqTvaNlkZ2VhMwC61w4WH6yLE5oOOA5u6UCwGUp+4a8EZ4YQSt4EBrkkbMXmQ3G3LlO3Qrgu+rD/gE6guNeur4nfhMtE2Mna4fe76T1R4mNK3XqDTVjDZxPQv
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 02:25:29.3030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 321c13f2-03cf-461a-cc4d-08ded005873b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB9219

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add the AUDSS CRU device node providing clocks and software resets
for audio subsystem peripherals.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index bb5cfb1f2113..f125f92d64aa 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -6,6 +6,10 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/cix,sky1.h>
+#include <dt-bindings/clock/cix,sky1-audss-clock.h>
+#include <dt-bindings/reset/cix,sky1-system-control.h>
+#include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+#include <dt-bindings/reset/cix,sky1-audss-reset.h>
 #include "sky1-power.h"
 
 / {
@@ -488,6 +492,21 @@ mbox_pm2ap: mailbox@65a0080 {
 			cix,mbox-dir = "rx";
 		};
 
+		audss_cru: clock-controller@7110000 {
+			compatible = "cix,sky1-audss-cru";
+			reg = <0x0 0x07110000 0x0 0x10000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>,
+				 <&scmi_clk CLK_TREE_AUDIO_CLK2>,
+				 <&scmi_clk CLK_TREE_AUDIO_CLK4>,
+				 <&scmi_clk CLK_TREE_AUDIO_CLK5>;
+			clock-names = "x8k", "x11k", "sys", "48m";
+			power-domains = <&smc_devpd SKY1_PD_AUDIO>;
+			resets = <&s5_syscon SKY1_AUDIO_HIFI5_NOC_RESET_N>;
+			status = "okay";
+		};
+
 		mbox_sfh2ap: mailbox@8090000 {
 			compatible = "cix,sky1-mbox";
 			reg = <0x0 0x08090000 0x0 0x10000>;
-- 
2.50.1

