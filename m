Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013020.outbound.protection.outlook.com [52.101.83.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32552E2F14;
	Thu, 12 Feb 2026 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770891189; cv=fail; b=sLVCo0tisIqH6IUrj3eU1vt854/Pm8tAkTEgn0zaBA7/VxxmJmX17LgpWmFPwWOmaSTR98Lz4boGnskLRiC4vjYRycbsbEEBkMYqkFTZedBvdX2dAwopBgY4xIZhnRzoYicfSs+eGdeWT5e59N1HpllBfDnkrPTWWxM30ybUoCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770891189; c=relaxed/simple;
	bh=PGbk0AXjdJka2QjU7iPSEb1ynOPmmVkPajAyvOj4/xc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Y/zPvaNg6oI17Fl6VcR8NMGMu927TT2owJfMiE5c9jdDfoRNgYDFF6t16kymOlm1hddo7Rm5/p6N5u3oMuliHd2R/gddW6p+I7t2R0vho4UAXu6WdRB/nwrICd0Jrj4ryftxh4K9aePTFFxBpxHUA5Wyti+l7ZggzkiOP/EioFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Fo7dlHDd; arc=fail smtp.client-ip=52.101.83.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Fo7dlHDd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hojE2I42WaaBzn6yiodt1SUrs+ZaTsO7JSGdJ6F2pJjUtD1lTsqVT5/hTB0owxkTuBNZRgJXreQzUhor8D4DlJ5N8uSojp6kCXf1yMi06U3nR9w/ys/9o8XBBuZQx/zlWbBHln8ottQr1U4dnm6NgtXVLNh6+5vMm+4Gvn6Q4lRtRHicTfQlQ4Gu7hRBzu9vbrpD8BWLuexMd6y4ABaSKaZsHJBivOK/aadcS0cO3KbJNcZSrQZIW/tp7BexUhVlRQAOeDdOb6A01UzGjxlK0bMSSxkBydsJC+cabzOJqtP7GUDjYe7emU6p0TmAjEiWwxWxDMtIcz+zDWWWNBHBVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYzMGzi2zWqxR+0jOlcyCJSebqPuJ5695NaXCeOyeas=;
 b=q1AuAGbzyRTLO7VNhXgQhDDkH+6dIrr+XJp1vXANaBlt9utv+jeo+zBa8ZC8GfJWc2cC2fsukJY0aUBRLspvh5InBndoFMaTMJtxX6D3SHZs2EuKTy8KhqFSINf1oLNSuyUpasA9+joBKhc6RchOOkhJa+aD7Ez1IzvrNmQpYzNCioexl7ArIBAKHwG+SBUADrWjr6qX+K/MZWPhH02YUrcwzvPolMiU1JSqn9FO01mfXCXptGOUnThyaenvchUIXvzj6XGy8JHpI8bs4/zWihHmHEmAb4AXzKkG8as9iwwNaFFbaLI5qxiJDXwkVvm8zPjXUJmHVbu779QJTzObyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYzMGzi2zWqxR+0jOlcyCJSebqPuJ5695NaXCeOyeas=;
 b=Fo7dlHDdNtXgEnIr9F79BehLYU2JrmNOwqV8z80rjtz+guj9FlVpVnIn8MIbcnQ1DfF6mw7uoXdJqsBP2t7Mp6qL2QH9IuHZPwbAge7JqYBzw+Y62tPQdo9tH1bMLtjXJ5zOJmhJWkRYbPUIyEn9g4rhdBKusXZUakDZMMlHM0GSz2RcB5mthCxTZj/eJM+zhMOU/EBZd6Y2ORe1uzIc+G83xv8Vvegbb3frzKL3KsWcSppfYAs8o5ns2BOZ92lrOqFAKUlcXrwm5exFK7FtcEZV+IPOL5Fk5oNA4Se8RSkz4+ep0CgE858KZHjvvag0XwwWL/7g2hd5dWEfJTyR5w==
Received: from AS4P189CA0055.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::22)
 by AM7PR10MB3464.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:140::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 10:13:03 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:659:cafe::7f) by AS4P189CA0055.outlook.office365.com
 (2603:10a6:20b:659::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 10:13:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 10:13:03 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:14:45 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:13:02 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 12 Feb 2026 11:10:38 +0100
Subject: [PATCH v2 9/9] MAINTAINERS: add entries to maintained stm32
 firewall files
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260212-stm32_risab-v2-9-02ef2859b596@foss.st.com>
References: <20260212-stm32_risab-v2-0-02ef2859b596@foss.st.com>
In-Reply-To: <20260212-stm32_risab-v2-0-02ef2859b596@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Gatien Chevallier
	<gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E0:EE_|AM7PR10MB3464:EE_
X-MS-Office365-Filtering-Correlation-Id: 73ba9438-57f9-4c18-9d3c-08de6a1f4ef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTh1aGNVQkFTMGl4czFNUXdhMWZjSVgyd0N5bHdTMjE4YUNrdDZjQTRYS01J?=
 =?utf-8?B?SlpCWWtGQ1l1dGNPTzdxUzFBdHlSQnBkbkhlY2xkbnExSWR2b0lvSXp1UHZy?=
 =?utf-8?B?N3lSb0g5cDhBRkc1aStpL3N0cnRtZllHL2xBYWg1eHVBaUpicU9JMncvdEpr?=
 =?utf-8?B?bDJRYVFqWlV5WFJBSDNDVlZsTEJPbUE3TkRQbWo3ZzRvNlQ3ekJuVlVrMUFL?=
 =?utf-8?B?eStzanNpY3lHaVFnbUorWXBreEdQSkYwN0MvYUpBMzA1TUplbnQ2U2Zmb0ZI?=
 =?utf-8?B?RVBTQ1o4TVJsbi83YUtIZWdhUUhreDMvR3piYUVJTTUwS1NzeVNseDNuamRt?=
 =?utf-8?B?MjhBUFB2Y2Q2bHBsczhiQXBvVlpWOU1OQUZUQWUrdVlud0ZWSzlEVXNQblJp?=
 =?utf-8?B?T2xjOEFlbldQaUVOTFhHOHlNS2o4Y1E0elhiSnhMQTYvMVljQzFhQmNPZnpq?=
 =?utf-8?B?MmlLMHlsdk1CWGlzeU9NazJvZ29NY0REa2llTzZHNjZxQkNVWFo3amNpb0hx?=
 =?utf-8?B?KzFhWWxzajlLbCt0UkFqOXZPaDdYdUh2U1BHVllteHIxVHd4ZFR3L1dCZ0Jj?=
 =?utf-8?B?dEdrQVdKL2hISjlYWllSSDRUMXdLbjRNRDZsaFIrRkhoa29ldzl4TndRUG91?=
 =?utf-8?B?MG1SQW1RazJtcy9Wd0U3SFhKQ3dhM3hseFZmTVdyVzdQR2U2Sjk3SFZ6N2xu?=
 =?utf-8?B?ZnY5UUIvRGxoUEx3NXRHMWJlQkZ6VkdnajhyWEJ4L0tkRzFmY21Yd3FGQWE0?=
 =?utf-8?B?b3pwdnNEUGhXZWkwaFBxQk9YSVVUTS80YTAwckhWQVhOSEt5clpMemRtVnJn?=
 =?utf-8?B?c3E3YkRrTURJK0N5ZVROUEpuM0prSFIxbDJuUmVBVUp2NU5qcjhPa0xCTno2?=
 =?utf-8?B?ay9ZMlEwUllKeVNjdGdvektHTnFLVTBNc0tJTzVuS0J1amUyM3l4SzhmMmFu?=
 =?utf-8?B?Rm9YV1EyMVFuZFhCRC9BaVZjQlpUZHd2ZE1hbVpZK09ISXpjdWhJVjdHdC9a?=
 =?utf-8?B?VG5KV1phVE5GbFdjekVtODROMnAwR0JqeHhuSUIway8vRkhWVUdVc3Q3R1Fn?=
 =?utf-8?B?VEJLYnlMblNDTURGOWZXTnB5c0VMSlJWZEQyTE9MZkdDY3dJTklyZlNYc0Ux?=
 =?utf-8?B?Z2wzRHVZd1c0NzhOYWRkNllHRTVybnRaUUtUTVhnbmd5N3ZuSzlYN2J1UFJZ?=
 =?utf-8?B?VnFtcy9rcDl3WVF1Z0VTQzI3ZjdPY0pRVWJlYjF5dVQzQmVKU1ZqRUszZng5?=
 =?utf-8?B?TXg2Q2pkMU85ZFQyamtVVHZjb2wyRS9aN2c5ZWlQZFJEV2xiWWhtREJUMmxz?=
 =?utf-8?B?LzBvSVA1YWV2RXlvL04xYm1rQXU2VVpaTUREZ3VpYmdTYjVKMHZ3T2tYeDZx?=
 =?utf-8?B?dE92dHJkUTZrV2lvdE5rZEZ1cUFkMC9zMDkyOGtrbXQwZkJHTUpwSFhiVFN2?=
 =?utf-8?B?d2lUdDFzZVdmNFduM01EQnByTWhNcWVHb2V3N24rVXBYbG1XQ1VkM0tLQVB5?=
 =?utf-8?B?VjdJQkJSWnBvVDB4clQrbldFUTBPRFh1UzlMK0dicTlwNjI4dmgyZGhvMHZ1?=
 =?utf-8?B?TmJCb0F4T0F6MXJmRVkraVhGYlVFNUtoTTJiRk9hbGY5eU5jdlV3RXh5Y1Uy?=
 =?utf-8?B?YTdhV2RDOFpZMjJVNUhpTm91R1dhZUQ1Z3duUWtSMmxwSDIwbXZsczhZSWph?=
 =?utf-8?B?UEkxbituUG16L0JiSTFIczBic1p2TDhqTHErdVJOMk5uZnZQaGRvQlRKdStP?=
 =?utf-8?B?SXdOeVdpeWdvQ251K1NKUTg2YzJaSlNWOFZwb0ZWWGlxNFFrTHgvWVV6aVlz?=
 =?utf-8?B?WTJ3b205VzYyK1B0ZytQWU5KdXE2ZUVWQ2orQXo5cksyd1NLYU1Qc2prZnFW?=
 =?utf-8?B?OWhoc2ZJU0J5c2h5TEhmQkdhZlgvY0tBcUZUcFdLYkROcmpnbUQwZTU4VWhH?=
 =?utf-8?B?NDdaYkdPVVR0U0ZpSVFvTVgzK3hEanM0WkROWktLZ3huZDFKZlFGTDB0UUJx?=
 =?utf-8?B?U3F5b1JObWlmcCtyZlVHcjBEVUxnZHpDYWdrYjJYODZiTmh1SzdWZ0ZnSllr?=
 =?utf-8?B?WWxJV3RFQ2p0SkhSeUNiRnZ1VE1MWG4rbFhLUFh2czdEVC84YmVuMDcyelBX?=
 =?utf-8?B?Z2hsb2RneTZXZlAxVElGcFJUT1lzYVI2dURzd09xWVRNUEh3bU9jcllrc2Ra?=
 =?utf-8?B?N0J0NmQzMUFGdGhsbDVtcDY5d0tVVmo5bDhFTVgzQVF5Y2NKTE5kcm4ySk1X?=
 =?utf-8?B?VVJtNHZJRUFsRy9XRHNWVm15SjlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tCn48ITZkeLEwiZ+uMlLYHrSG//VxL+Pk2XIZHY5FZIzvwz79VQ3eLKSisoxsGcK2megb1zIwB849FUg/73IbAmVOfDPESZ3OfmtCWeC3V0L+mfGvIroPBf2c0ZsaHLclIcEdE4JFj6RPHXmPrnCBLFm+h3TO3hy94BxCJV8jaguqYQBMedh4MP05ZTQGNDbu0ZrcDn/MS5oUH46c5jf4ZyYtgR4HU/4uI0XRoVwQ+MxAXA9xcz2hEdMrTllIgaVqA/CfaLW5je+F5Ro++MA9RushYHJu0x4JVRBhPvhM8iKWIvdcBqhavv4WySDZTUGWPlapg/oKtFAGGpgFJlz/x0NrIa4s5RHsI3YeDu9D3tVxRqzC57EofAgc9ddBhl5tYZFDke7Y0MIU0oRWOMe79DXeS94VaMGRqaFBgHejJW4OZPeZ7ZtjhTXM+cRUJmZ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 10:13:03.3529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ba9438-57f9-4c18-9d3c-08de6a1f4ef3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3464

Add documentation and risa* entries to maintained stm32 firewall files.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e08767323763..316fcffcc094 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24734,9 +24734,13 @@ F:	drivers/power/supply/stc3117_fuel_gauge.c
 ST STM32 FIREWALL
 M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
+F:	Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
+F:	Documentation/devicetree/bindings/bus/st,stm32mp25-risab.yaml
 F:	drivers/bus/stm32_etzpc.c
 F:	drivers/bus/stm32_firewall.c
 F:	drivers/bus/stm32_rifsc.c
+F:	drivers/bus/stm32_risa*.c
 
 ST STM32 HDP PINCTRL DRIVER
 M:	Clément Le Goffic <legoffic.clement@gmail.com>

-- 
2.43.0

