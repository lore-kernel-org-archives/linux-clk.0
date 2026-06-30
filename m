Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EA836CE19;
	Tue, 30 Jun 2026 15:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834964; cv=fail; b=tV2KVkvOdyM3tqEjo08R3O51JfVfDMb1IruUTbTI+HS96juM+/U00eGC8tRnxyTUQw1cDPEON2V+z3mIPwJw2PYd7mx+Ax7YGaL9POGgXveynuFKhUFtPyMgxKpsmTMb08Qrel03ae/gX9rSEo1UElgqBCKMywSNPcPtD3LG/l0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834964; c=relaxed/simple;
	bh=TGyuUiU+V8fqkPmYRU6Qa4zj+aXn4/7HczS27zJr5zk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MlN7iuB9Ipc6/RxFKrQRlItovMo/Seo74wu8K5Ts8Cu+xKCUly9Ja1lUnMuuo9TObTHEHDLRFqdylAef0dpTrT8yzCPmzgnu1ux2Em1Y/qY51wcRhe7o6jSc/HjkxFa4HeM/OmBOFMvMqKqMvWv9UkLZ0fiCAedaUr74RWUcOd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UC9HxNwr; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=I0Fboqor; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UC9HxNwr";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="I0Fboqor"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UFdmZK3934519;
	Tue, 30 Jun 2026 10:55:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=nfvLXOwZ623C5L8h
	zMnjFdt3iCAf5WdCIqqTa/i6Nsk=; b=UC9HxNwrrJ69gVvY3jpjtgJ6q5f1MjO2
	b2N7UXp74WjozVOP/I/nnBguLWJ1gCUC6VPnQgwE9vtnDNFE6Cd/HrsLHGD9fRCu
	xZ34RTQx6rLfw+IdbWzK6wUon25lkDRfxSBc3w6jff/FfnOqEuUW65OLCTHItHEU
	Mh2qC2HLH41EknYpoyd9GZArDgM/EzHwKDhtXgSRGM9E4L+fkq0LBqBQtsJaEWq2
	uisnssCs3JVIvSywuT6AxVGgycmruuXmC1ngciZoxvcNfJ7SExnMo+js+rObktOT
	68h8uLngXyFHAo+JJmxAPJ5cIkHi7d2OkZHFnftJI9OgAZMBxhr70g==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020121.outbound.protection.outlook.com [52.101.56.121])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f4e678bar-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 10:55:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3RSMcDbBKuK8F1Ulj478nVviAS3CwlssOiE1BdcF+hkVs+vY6yCecTqo8F/9/DLDdxz5EYotVV1qOzkGExxgkLq7X5j/pdLLkHqU3YfVfsZgCMbDr/uxIs+GFhxCzSOfvqKOixrT+N9hStZH7MGOVCN1LTrDyKPGsiPajmESE3zplsr15zKSsrN6yNF9mfkn5b0Y8bLD4Nj6zffZ3LGoUUCSeaXi+3SFR8buY58praOC1PcXaZ89XL/Z9jhdNiX55t+uAaSY2eGUdCSSF6gqP9oo/vQiGKt+MEELG34SekErfAZaA7Z9tvjvWgeygW7AXQKbbBy1TYtG0Q6gdnKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfvLXOwZ623C5L8hzMnjFdt3iCAf5WdCIqqTa/i6Nsk=;
 b=M0ja+LJR+97URJzsnvFH8Np1RI5IQPWkw3pqRfYLwKp5/u1rCqvV5GNVYJQ6LlDluTm+lV3RMQKhoeFJYADOFHYfMJLz+uc9kpt6dfko1s2LUEMoC+c/uXAgSmWkjT1x/pCGwn6We3fyKYf5vrN4SUhoIaJmdEXn1e5IlLJ9dG999osVx8ty040P52MD8jvIorh60De1zLiHx+z6VH41i8gUJ1GUYvWxnNykC5vMktp55ErLHlBApQHp0j9z30X3JvfOCmZYkrSafcX85Wc8DezdeuPQIvhWx+x4Sgu77i97o4EZhMPbHrwW6UFZTF2wNty3FPJkhul/iiOsoB82Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=baylibre.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfvLXOwZ623C5L8hzMnjFdt3iCAf5WdCIqqTa/i6Nsk=;
 b=I0FboqorM6rXQw4llsidqS/Dgo08PRPRoOVNl6UzYzpslbUpYbyc7LH2oTdMfEFyf4qYFny3UF8i95HE8TeWtz0u5JasRc8lLyiISg9E7ZkLiPm7bax/pcuOSzDwm/YO+kbIECfOEvuDDSAF73hbvp8qAw4RjXGJ7ejAfy40pj0=
Received: from PH8P221CA0032.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::12)
 by PH0PR19MB997571.namprd19.prod.outlook.com (2603:10b6:510:11f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 15:55:52 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::86) by PH8P221CA0032.outlook.office365.com
 (2603:10b6:510:346::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 15:55:51 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Tue, 30 Jun 2026 15:55:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 739D6406541;
	Tue, 30 Jun 2026 15:55:49 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4FA4B82025A;
	Tue, 30 Jun 2026 15:55:49 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v6 0/3] Cirrus Logic CS2600 clock device
Date: Tue, 30 Jun 2026 16:55:46 +0100
Message-ID: <20260630155549.824059-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|PH0PR19MB997571:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 944bbb08-cbec-49ae-b400-08ded6c00f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|23010399003|82310400026|36860700016|6133799003|3023799007|18002099003|16102099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	qkPCL2337loyNar1vDs1twIKhRHisE5A9tQz+We3wqK4JAo0VVJpEdGu+mdEMvGFqsHHVMvHn77Ycvfp2jDvoyQ8Zdld8MoRHVVpIzBWmxVbunR7QoldnJ0Haok2x87RXCYjCkczsZv3660NYYaScLuinK7BMSJjv6qLjqIXQTSsdxhcXNmydTwN+BBFKBdiVQz3Rgg0aFW26nOjmRuiruC4RsJZzkkqsHd/8b914fzaUufJc2hJgl4uhRYqmYciwoTV6qhYxNiNCgCiJFHWGAcyr0rbb9Y/Y1VHjmn9akO8W3ZIqhBwhoO6yMwjn5WRe3XhXLWQ2jaDasLpLgUiVz8bNGIQ7yDYo0x0gE5oqywK1hToHIJ6dLt2IMAsmWQKu4TNfRf62EeXZwXXH+e8qCOO+/IaSSJuNcej3G1eLJigAgT8QVofVGP4cy6nuL7GOKXH+R4zA++zQJScCZG7kHuL4YVQG/wiBTXtOAlQ4O0VbmNbgdW7gKiFUOZYwhIEJtKCouL89yM/3dF572Pgl2cHk77kK7AG92uota+AmrKzFbvJePrsXYb1uLKzkR5q7IYgcqNhxrgX9exOCKns8z3PtHsQIRmnpYFwsjS5wwWej71DNw0dCjjlWufbZAixP//BR3RE20dpwoa/1HEh8XKUIz5TrTcE5B/6ZNE7cMBDs5eCZE1Ij/zdWyuCiULA+9KIt9sAYWmQz6onYf/5Qw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(23010399003)(82310400026)(36860700016)(6133799003)(3023799007)(18002099003)(16102099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JzLntc+p7lu9B+Iap76r25hxcL+kbPthilAlGBQDBKXT8ZDE5VN/yYc3esO4R6p5JIhqyFSTzeAmdY6vJo2HqKlvHyYNLv6i+i4fjRX9F1cAkaYeE7Jh/QlNYj+wO/XnClnrDp31gpdKXhv31KzVHj9mmmT2qagy6NRkZxqB4Udf9c1UbbMuWNH6mKlVWTzOjmbTV/Athf4Et1t3vNP/Q50QLP6JynZq1XlLYxkl8rLbD1g0IOa1GPDPV6SJq6d7kddO1p1wQz+8RotpGkmwiZCj+DyuZ5tW07f72Zir9b9Ld+3qF2TfasPOVyXgsr53v+RJlxIIzLtC/HZrlCOXebI8300YioOL4vJOPexYBNsmKB2HO8UYAy6uqJpRoRui8B/PR1XK9ViTmCIkznwRTP6AJgNsp7OKiESN1ufOONDdzqhVpQC3O+flUqAXOeLU
X-Exchange-RoutingPolicyChecked:
	bXNOaHKQKxuVGUTVggGbTMrbVzhwmEfFYg8qhm1/QU2QSflhS8AXRJrOmoLYtgFs+tzqWpw48HwpFAIb/mWnlXONtYWbWAgbhYRIXfWn1FYUK7TgIAwKtgINHyBdB0lq8ZCXevOdsryi53CeI/zv4qgyMl9MqrmWGYr9gjgjcXlSHrvjX20Peyynn5TsCp6470+IeSJE1c+FHdkoNfJnAgR/AMd+n3jvWfxCbYv5mn7QnC2TJ74pkFciEWt7DeB0x65fTzsNEDQza1zOINXb5ZYvJaA7VjjalZ7nSQJo+JzapW7xAovofgAsDZMO2ugGsdvPETOQZ/vIzg0FNDC/YA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 15:55:51.1335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 944bbb08-cbec-49ae-b400-08ded6c00f6d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB997571
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0OSBTYWx0ZWRfX1HT+Y5Qs6MUw
 03TOipBTMTnRMhKmiB1lRG73s3lcs4+t/bB+dHK0PDMidD6eKF0xfiQoH0gTLzyglis4m8NAgj6
 +8ZF8TwDAfePupFNyHXgsCxsYe6fVQM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0OSBTYWx0ZWRfX2ecC8Cf1dEnL
 Fruel1oWViJqouAYrdWLvv4ETtGJ0ymt5gpQNzYV+LGtT7AGpxqfaAnJfpsYR+cBuqg8hQyEe0j
 OsDNxLjMYmxl6P2iAyom8Dl7fnvvxpV1YNq8gYODEos9lNCKNBI5leqmLWTu2Zho9FmbOGq4vzt
 BTqd4ZEn4nFwSc+sllsX04HH2YKYFN88yR+38ggjDHsn2Ai5pWC/XL+ljiGYP3Havos74tqE1vJ
 Z0h5J65G3Iu6fs7mESanlzMq+ayFMp4UTX6d8QV0GZZGb27EtuhyLUqE3rYJU41iGSfxl6iRt2v
 U7sgBsg3kI0NLQvXwuri6khyqN/weJntFgZgwTGci9OVRpL7mqJhi32SGKJiYw2Pdr3ezqnhMjj
 qAR3F8TUeQOsx9GUMxW5VeMUmev98utZLDjXpOA0XWhvaKg+GZ4158ae/Dp7/ggOAwWndkEeI9/
 nKaqedvkK6MMpx/6MpA==
X-Proofpoint-ORIG-GUID: FHWNTioR4EKTbS7t5UpX2aM-zD9BlNen
X-Proofpoint-GUID: FHWNTioR4EKTbS7t5UpX2aM-zD9BlNen
X-Authority-Analysis: v=2.4 cv=PrSjqQM3 c=1 sm=1 tr=0 ts=6a43e70d cx=c_pps
 a=Xv54+KyL7ikHs1a8OOIzxg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=Zxh60nquOuz1sq3bpggA:9
X-Proofpoint-Spam-Reason: safe

This patch set provides Common Clock Framework support for the
Cirrus Logic CS2600 Fractional-N Clock Synthesizer and Multiplier.

KUnit testing is included in the series.

Major changes:

v6 changes:
- Convert DT smart mode selection from an enum property to two booleans.
- Fix DT clock names to match the datasheet names.
- Add DT property to explicitly flag that the internal oscillator should
  be used instead of inferring it from having a variable definition of
  clock-names.
- Add DT support for setting BCLK invert, FSYNC invert, and FSYNC duty
  cycles.
- More DT examples
- Merged and factored-out duplicated code in the driver.
- Fixed rounding errors that caused the calculated frequency to drift when
  it was passed into clock core and then passed back to the driver.
- Fixed driver bugs where the functions for one clock relied on the
  register values of other clocks being set already, which is not
  guaranteed.
- Fix a bug where the (mandatory) REF_CLK_IN wasn't requested and enabled
  when using CLK_IN as the frequency reference in manual mode.
- Lots of code cleanup in the driver
- Fix driver bugs.
- Added KUnit test.

v5 changes:
- Change dt-binding to dt-bindings in commit message
- Add minItems to clocks
- Remove unneeded comments for the cirrus,aux-output-source enums

v4 changes:
- Change DT discription to add more detial.
- Move reg property to keep consistent with the required list.
- Add enum to string DT inputs and change the input values to lower case.
- Change unevauatedProperties to additionalProperties
- Reove black line.

v3 changes:
- Changed clock-names in device tree to an emum since the both clocks
  are not always required.
- Changed cirrus,aux-output-source to a string input.
- Added cirrus,clock-mode as a string input.
- Fixed ordering in DT example.
- Removed dt-bindings .h file.
- Add in_range to allow for acceptable ranges for clock rates.

v2 changes:
- Remove | from after "discription" in DT binding.
- Remove discription from "clocks" in DT binding.
- Change ref_clk to xti
- Clarify auxiliary clock pin
- Change DT example to not have "reg" for the bus
- Change DT example to change i2c@0 to i2c
- Remove "OUTPUT" from the clock ouputs in the dt binding include file.
- Remove AUX_OUT defines
- Use do_div when dividing u64 by a u32
- Include the dt bindings include file
- Use the includes from the dt bindings include file aux output.
- Move of_device_id and i2c_device_id tables next to i2c_driver struct.

Paul Handrigan (2):
  dt-bindings: clock: cs2600: Add support for the CS2600
  clk: cs2600: Add Fractional-N clock driver

Richard Fitzgerald (1):
  clk: cs2600: Add KUnit test for CS2600 driver

 .../bindings/clock/cirrus,cs2600.yaml         |  262 ++
 MAINTAINERS                                   |    8 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/cirrus/Kconfig                    |   23 +
 drivers/clk/cirrus/Makefile                   |   27 +
 drivers/clk/cirrus/clk-cs2600-kunit.c         | 2495 +++++++++++++++++
 drivers/clk/cirrus/clk-cs2600-kunit.h         |   18 +
 drivers/clk/cirrus/clk-cs2600.c               | 1274 +++++++++
 drivers/clk/cirrus/clk-cs2600.h               |  163 ++
 drivers/clk/cirrus/kunit_clk_cs2600.dtsi      |   40 +
 .../clk/cirrus/kunit_clk_cs2600_assigned.dtso |   27 +
 .../kunit_clk_cs2600_aux1_out_clk_in.dtso     |   17 +
 ...it_clk_cs2600_aux1_out_clk_in_missing.dtso |   17 +
 ...kunit_clk_cs2600_aux1_out_freq_unlock.dtso |   17 +
 ...unit_clk_cs2600_aux1_out_phase_unlock.dtso |   17 +
 .../kunit_clk_cs2600_aux1_out_ref_clk_in.dtso |   17 +
 .../cirrus/kunit_clk_cs2600_bclk_invert.dtso  |   17 +
 .../cirrus/kunit_clk_cs2600_fsync_duty_1.dtso |   17 +
 .../cirrus/kunit_clk_cs2600_fsync_duty_2.dtso |   17 +
 .../kunit_clk_cs2600_fsync_duty_32.dtso       |   17 +
 .../cirrus/kunit_clk_cs2600_fsync_invert.dtso |   17 +
 .../kunit_clk_cs2600_manual_intosc_clkin.dtso |   17 +
 .../kunit_clk_cs2600_manual_intosc_only.dtso  |   17 +
 .../kunit_clk_cs2600_manual_refclk_clkin.dtso |   16 +
 .../kunit_clk_cs2600_manual_refclk_only.dtso  |   16 +
 .../kunit_clk_cs2600_name_output_clocks.dtso  |   23 +
 ...it_clk_cs2600_smart_clkin_only_intosc.dtso |   19 +
 ...it_clk_cs2600_smart_clkin_only_refclk.dtso |   18 +
 .../cirrus/kunit_clk_cs2600_smart_intosc.dtso |   18 +
 .../cirrus/kunit_clk_cs2600_smart_refclk.dtso |   17 +
 .../dt-bindings/clock/cirrus,cs2600-clock.h   |   18 +
 32 files changed, 4688 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
 create mode 100644 drivers/clk/cirrus/Kconfig
 create mode 100644 drivers/clk/cirrus/Makefile
 create mode 100644 drivers/clk/cirrus/clk-cs2600-kunit.c
 create mode 100644 drivers/clk/cirrus/clk-cs2600-kunit.h
 create mode 100644 drivers/clk/cirrus/clk-cs2600.c
 create mode 100644 drivers/clk/cirrus/clk-cs2600.h
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600.dtsi
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_assigned.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_clk_in.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_clk_in_missing.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_freq_unlock.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_phase_unlock.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_aux1_out_ref_clk_in.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_bclk_invert.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_fsync_duty_1.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_fsync_duty_2.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_fsync_duty_32.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_fsync_invert.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_manual_intosc_clkin.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_manual_intosc_only.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_manual_refclk_clkin.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_manual_refclk_only.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_name_output_clocks.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_smart_clkin_only_intosc.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_smart_clkin_only_refclk.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_smart_intosc.dtso
 create mode 100644 drivers/clk/cirrus/kunit_clk_cs2600_smart_refclk.dtso
 create mode 100644 include/dt-bindings/clock/cirrus,cs2600-clock.h

-- 
2.47.3

