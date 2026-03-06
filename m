Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012004.outbound.protection.outlook.com [52.101.66.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4358B370D71;
	Fri,  6 Mar 2026 06:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772777935; cv=fail; b=QxCGB8s3OitbyjbXv2VjLtBtFf+J0je8TUKcfIoaqCiMd8ojg6GkuBvepxnEc7fvjJ3mP8hHfm+E26Mnj2561VF0dXn9CZ5lOo+aVIr3SOfEeVxmZE3yC/zr4qxg+jfhQOSfQOTPWWFwzb8vYh7+A0+cvVa4gS/a2LJC2c+VPDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772777935; c=relaxed/simple;
	bh=VsOmFUaUpT2Z+JO9cJnEgfpdAjtbWwDCk1mnj53zXeY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jW9ci4AecuP/fCKQEl7FPGoIJ2RnsFid7Q7HIBjcUHDU3N3MqUpAtU4IEv/xZ3xZW0vH1CtE+nZPO9tynPxoboNm+pcNz+ZK/rQaeqFO52enDjd+An0jNTRZIYlaW0T6/myDdGZB+ARSH/N7n9Zz8Hk33g/SZaYO9WcN0o/TmZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=K44TNld3; arc=fail smtp.client-ip=52.101.66.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="K44TNld3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GiNKLQlahHOTBPffbxRddH5oHckUSvUHyFv8AEXgY4rdMzr9pi4jiW70R7uU8XKZ8huq9GolI8IkhYW6+l3inRVFwePktHifwf+KBSsnVNcBCiXYt6zBHA7r1nCQrZCwTbiah5DhuTE9HWbeKbmU3ftcAaRn8xvoR7tXWJN3NOcv6lt3uwZyyfrXTuyBK46uXumUOge+KBd/zlx+1CMwkO6BIZUCevnY80G4x6txLfROaW8wtAM+V2//CH3c5Ofsq+NqS7lA0H7adQewX5tR0jZEUIR+gAChhSL8R0K+khmmQWYoVL5TiFqyH5oSnEZeZQGDZURmpPTYIsqPN9OA0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoLXeNNT3jxSoR2gKlJVneUsi/i9x7NwkWBnFCvyypc=;
 b=S13ga8FyHVvDSixiUYx/YmwMrct1eIa+FhACd4CZSWkFaKkA3s4IjURc8dgYAmPPW01Mj3INybsPj3Enb1huHlCHGBB9jZZJeHMhjndTZUbqF8LKraxGmw7j95l/ipmpwK7Bs9R+LHcSBtwQeYx9r17mH/0gmwZMKjwf3FYSlNt/jVdtnEvRSFE/ug/XGBCHpLQJzeNuRGHsoBRhWLGbM1BGZsyMfGdKcKY9yswslqSb891eia5Gt3NQfGXVTV2slF9PK+dKJQ7bDAW4BtDm3CcuLGxT40EV7K9kdDW6p6cDgCjI519Y5bmeHItlyIlbhEGRBEfDHNBi3vqfjGgjNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoLXeNNT3jxSoR2gKlJVneUsi/i9x7NwkWBnFCvyypc=;
 b=K44TNld3qHzleO1Gx0ugbUR8Qz7axWgRFEdYpA7FXQUwGWoqHpmdLjHL7Xwcee0nOC0JqCSvlFdTVfLSqrjttn4tkl0VhrtcQyGBV7rjfOWaPfICVHIBV/QBNdsokqvJzyssBuFZKvXRPJVMsO6dRxorAHqcy2qunsYvv6KE29wBDjSrGmd3Ef69kjvvg5cCHuR8AOpwt5/IEOhb2faUssWxE58uevxBqqOf/m1u2y2IqTMB1pg0BtM5XFotRTjzjfXeXr+yY0EaDXIFTHZxw2H+Vr+O7SkU2VqfajvKXxCvclRoCkAIlviXB5yWH722W9o7DDhUjZxRNOw7aEiO+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8771.eurprd04.prod.outlook.com (2603:10a6:20b:42c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 06:18:51 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 06:18:51 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 06 Mar 2026 14:20:12 +0800
Subject: [PATCH RFC 1/2] dt-bindings: clock: Add SCMI clock rounding mode
 declarations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-scmi-clk-round-v1-1-61e2a5df9051@nxp.com>
References: <20260306-scmi-clk-round-v1-0-61e2a5df9051@nxp.com>
In-Reply-To: <20260306-scmi-clk-round-v1-0-61e2a5df9051@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bd8aa27-e7fe-4129-6a7c-08de7b483c2e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	l05BVAZjuASRjKldJ1if5RG7qpDM8sRrG+14fqHgaXSW3sTRV+MidAspF7dpNRacqBZA6OpvdQPgyvdDF9hB5JYPQm3vS/H0U2mPMlfkYA3qS9zWSXq3droF+zWtykBqbXB3SD+MEPesz1yN5TXSjhq8zGrPkx/39JPdzpv5FT0zc8HrAZq5fA/mw9Bc95n4U+mdo5a//gvVk+MHMT6PQ9+fpMOuU40iGoQnuBLBT2udzPCml+5Wh2Ijy0oYYfXOEBqxp/LOQ1rKLuwX7YDSoRZcUXV/X4jgcK1rbPBd9TUtcZyvnO5jL/EcY+GtbPDLszgj1KiYg75EBzkbsrMiZ8AJA1rafiQQJWemQ54OHyF/jPusgwQcT8zRuLWoPl/vA32cklSsqj61PQmjsCRaPEfgJNvv9uJPz+LRX81zpz6flsyCVWyDYrzML3+pgVE99m0U7aBRD2R9t/hhYwTN1n8qMRinPiX3BO3gRyR6IJ5Dovt1dV0DMiDv20QmVujPs1iPvhgP++Sy6vcAbVSegv02mvslIstURdsnBUFxnPdNLvFkS9H+Bvm6JZvjeT0o88QxRaj8JpXYYh05xCMp4R/HIH0j5dV7D25nv6lt67f346IjJfrjzMun07nQKL37p5C8DDESFioKQpcfAlYmH3g8qmUQ/WuwNmdqPs3YhQDaV3JviP1wRKH7qxjZe0kSqRzCNCwXYCmX7NSklzYfqxL/rR51cVAugzkKEdkImhy9WVz6WKDgbCFEwmq6WQoxms3Sa2C5vTmqHh4O88T6njqwPuF+AoPkinFiMNNNo5o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEM2L0EvbmVpRzZlcFpjVlM0Vy9scTZqWFY4bWRKQUk1Q3dwQTllLytqMEla?=
 =?utf-8?B?UXBBaGdMMjhPOEI3YnZ4bWNqZ3YweW5XR0FlZ29IV0E1SFROTTUzS3dIVmZV?=
 =?utf-8?B?TTFqclh1Z2VWM2JyZE92MHY5UjMwUENac1NPVFVQa1dnMkRYaFNuOVptRnA2?=
 =?utf-8?B?Y005dCt4N2xzbjlyekNPTW5ZTlJma3FKbEVyVFF3NlkvMFA1WkJBaUR4NzM0?=
 =?utf-8?B?QjdFZnF0OWhCT1gvdGl0MWYrdi9CMWdla09lWkgrUklVR2R4c3dkNzhWVjdi?=
 =?utf-8?B?NFhZUmpjeFlHWE9sU2RxcjNSQVdCUkQyUFRjOHdyTzBDQzVueVF5L093RmQ1?=
 =?utf-8?B?VloxS3NRcmVHZ1A2WXN3YWdMeGZld1R3NGIvdHkxQjZxU3l6SW1lQnhldHR2?=
 =?utf-8?B?OUdzVUlyeGlkSnhONlVQVXpOQ2FVNkd2V0J4NlRkUno0Z1dPNkRoV0F5ZUF2?=
 =?utf-8?B?dlM1Nko3U1UyUEp1SDlZR1dNekhwTlV1WUtJa0NFbkdIQU4wVWFwdnZRZE1a?=
 =?utf-8?B?OFVjSWRBbGo4V1ZjbDNObmtRQ2psOUtvVTRtcmRWMys5akIwN1FJRFdHVzVz?=
 =?utf-8?B?aUMrc2VTTEkySzgxRGJxU05tS2ZYeURSS05kV1JkbVFCK28zZ1NqMTYwb21L?=
 =?utf-8?B?QXJwTEYzSGxETWdGaUs4V1BldFNMT2pDQ2ZWajlTTi9ISTlDOVNLTTdkcFF5?=
 =?utf-8?B?VmFYSHRhRHdsTGFMTVpWOUJYLzh6bGVsTGtqRHI1OFJpbTBqWEVGYmJHMkVE?=
 =?utf-8?B?bGlZWVJWdEFpM3NtMnYxaTRyaGpncnhWZVgyOWV1MXJ1NXFZZ3B1WnFtT3RR?=
 =?utf-8?B?cXBPSENJRnlnbTM0QXZMdTBKZ2VvejJjeGhVM21OMlVKN2ZxUktUalJQSXVE?=
 =?utf-8?B?SmJpWUpLbVpQTHkzM3F5K2x5YkNyN0FDNXFnelcvU2RkdUJ5VDRjQzNGdjF1?=
 =?utf-8?B?SlloWnNoUWFKVmVwYjBqalQwU0NIdURBblprOWdOakRtS2RnVU1Rbjg5VXZi?=
 =?utf-8?B?MW1jM1Y3aGx2UURyZDIvbkJ6aHpzdFBTVE5YaHVDbU42OVRiL3JUWm85UFZi?=
 =?utf-8?B?YUdJYmZQRGZiZ0trSVJLQmhmNnQ1ZWx5U2FHNWxiYnBSSXFiendaMTlST21U?=
 =?utf-8?B?MVovRk5MNVlWSS9XeFZCa2llWXRaa3RWMXl3NWdwdHBraEZrb2gzZGF5TDE5?=
 =?utf-8?B?V2o1cm5CZ3NXK3pRa1pTUzZhN2dDUkhWL0dFL1BOLy9VdGtLNmVlRTBzZUhI?=
 =?utf-8?B?bVViWFltVEdGcEZSUFljVFR1NCtwYVdhcnNzYmtUdGp2Z1NqaWpjMnowaUc2?=
 =?utf-8?B?ZFZTd2lBZlpjN20yQ1pkK2xVNUZ0MXBiWDJUa3hnc0l5Yi9yNVJPMThMbC9j?=
 =?utf-8?B?NmhDc0ZTaGkyNWJMdWs2QVBXUm4wRmZOUkdLV1cwVk81VkNLZTcwN2g1VEpN?=
 =?utf-8?B?UTkyOHhKUGRjMkhGR1pFeWxQWm5OalZXNDVmZlA4ZEdnRTE0V1FZMGYydUhZ?=
 =?utf-8?B?c0FrbnVDclMvTGNjS2hrUHlhTG1kRUNMeHNkdnYvOVNZdS83OWNvb2dLSXVD?=
 =?utf-8?B?T29XNXlYTVFsZHBBT291SHE1ZndmSEkrbmR4Q0IrWVJtNG41L1EzM2VvYmN5?=
 =?utf-8?B?ZUhQUVRscnU1RzZ6T0JmemF4Mnp2bXJMWE4yRUR6cjJSdWwwWmNCRGppaXFE?=
 =?utf-8?B?Myt5clBEQ3ZjTHhRR0s5YkJoWDFyaGtOMDRMbEgzZHpuUngzb3UyUVg5cG56?=
 =?utf-8?B?cWRYSWJRZ1B3dGo1RHZibnpXY1lieExpYWp1RG43emtqRFMvUXVEYmRldWpG?=
 =?utf-8?B?eTJzN0MrcTdWY2RrRkJacncwOEVxSXZ4V0lHWldSMHdGREF2cjdpRFhtWFgw?=
 =?utf-8?B?bnhaNU1NK1M2YjAwU1E0QVZUbzJLcjVJUCt4NUo4WE16bW82SXNSRWNTR3pG?=
 =?utf-8?B?ZTRJWkMxeDlqWWtuVGcvSEw4aE10QmRBTm5NQkNhR05jQU9UL3Q0OVdwUER0?=
 =?utf-8?B?Vm5ZU2RxMnRjQklXUjB5NERWYm5zL2NEN1dUaHYzbVE1TmRUclMxRjNpVG0y?=
 =?utf-8?B?dDdKWVFxNWp3Z0MrclFYdTZMUzBhcE1UOW5DdlZwZndNRkg4TTRuTnh3bC8x?=
 =?utf-8?B?RnhFNkI0SlZmYjRwY052V1AwVUE1WWZ5RE4rU05lQmxtQTVzdC9zVUtvVnZo?=
 =?utf-8?B?WFVmYnhWalY3UFlicTU5MmxKZitSdWI5ZFZiemtDdkgrL3hmNjh2eGxha1B2?=
 =?utf-8?B?QWhUUkh3YUFPZldua21WRXpsWDF6cUdDMklSQ0RWUFo5b2NJME1xVXViQTR0?=
 =?utf-8?B?WkdnRHlrOVQ5MVpidFkwcW83SU1jWnU4UFd0Tkd6T2RtL1VYK0YyQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd8aa27-e7fe-4129-6a7c-08de7b483c2e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 06:18:51.1839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSI8rUA3ThhiReT8SvQrqA+lPD59+IGr1IwB1ACohx3ViB3N5rKWdMAsQXzgSH7B2mVtkP7fceZgV/iCFsenfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8771

From: Peng Fan <peng.fan@nxp.com>

The ARM System Control and Management Interface (SCMI) specification
(DEN0056E) defines the CLOCK_RATE_SET command, which allows clients to
specify how the platform should round the requested clock rate.

Bits[3:2] define the rounding behaviour:
  - If Bit[3] is set, the platform autonomously selects the closest
    achievable rate, ignoring Bit[2].
  - If Bit[3] is clear, Bit[2] selects the direction:
        0 = round down
        1 = round up

Add dt-bindings definitions for these rounding modes so that device tree
agent nodes can specify the desired rounding behaviour to the firmware.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/dt-bindings/clock/scmi.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/dt-bindings/clock/scmi.h b/include/dt-bindings/clock/scmi.h
new file mode 100644
index 0000000000000000000000000000000000000000..bd97d5aba53d042659e8e00ed96c6a054a2f9d98
--- /dev/null
+++ b/include/dt-bindings/clock/scmi.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright 2026 NXP
+ */
+
+#ifndef __SCMI_CLOCK_H
+#define __SCMI_CLOCK_H
+
+#define ROUND_DOWN	0
+#define ROUND_UP	1
+#define ROUND_AUTO	2
+
+#endif

-- 
2.37.1

