Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010061.outbound.protection.outlook.com [52.101.84.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D723F8ED3;
	Mon, 17 Aug 2026 10:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964160; cv=fail; b=LbeSRTrVQKDo7a7P7X+4MxMtJ2D7kMvvhrNOE721k+qJ98kCEHy6RoqrJ+/iCbz3Sl1bUaHikmOBdnK15Bxk89m026VnHrrDkX8GZxAG1P2zXCvcgfh/GHgmqPOFCJ4d0F0eBPZoedBezgib55yQphk1PjlgSOmO3dG+LF1XtM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964160; c=relaxed/simple;
	bh=NjwtBJwFgDMZ5Uzb12c2RnzCHEaks2V5F7sGbzpAks0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FCnNsAJdUSQiFR3U7RNwnIGxij4XCaYX58ySalKLAKVmPFo1sGy9BoMvzBrJ2wI6SLtUA72XkukJwG8ZHNH9/ulBeysJzcxBH+DfzrUKnyAWP5G2NYvvBz7PcbAN/7cCotaDlkezPj6k3PUba20lEzYEUMQ9DnOZABUyoeJhx8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Wpjn46fd; arc=fail smtp.client-ip=52.101.84.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Wpjn46fd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9evo6pIf/45vbRxtt3tBkLklMGZBXX9Sp8fbVnFJk9UO3+prWSb17VGHuKkc/WlxVauDTtSdogUtNpQnBscG9peFzyMkbgZr1p1jyr+wsCq4isovYCWp7WMS4W1EeyT+QtMKJw/ACb1O+9zARK3EoBMhkDUYyyfW6oeJ9WDEdZhYbsClhSmA5htkfckP1krLyBSuKdlvLR9ZiRozyuz1zMI7tDvEH3v9urly2uCZ2Ib8pE91Jo+h95PlwqcKOZmf3kxg/SbD9cZ0KFSLPt2S97u0wxCQfsm0mWagY8ydwZ1EeJBc/qYpg7pqMIi1uaRyaaqC4U6Pzub7gjkZWQnQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GvpOqNTXmhcBMJKr7mll4R6caW94N7lWlWX9pq3mNA=;
 b=eh6hJpn/LyPb3inPzSNBqAHd4SnaZBH/I+f+OvWtGMLb3AmG/tt+UgkNsXQOCTM5Ls6r6+z5eJ6AHAUP88jtYfQ6RXJZmnoOh73tKIharT8N1qmaWqhgyXB0ojSALEdz6a0b0TpLGRm1RkGDbzuCsi/WbNTyMY19YIQCyehR31KCMul7qw7jpGpsL5TVs3iwmHK3shUXPZ6nVJQKvPSese0A8uu+Zfv9KjlsI/s5v1ySaL1dIqt8rHF5KEIh19Zxwa4jJP08budYnB6rePKmViZAng9z0fY/ZuE29tefqBtwybNgU2u4z+xsQU/QVd47dr+cxW2wAExHFUwev2bkxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GvpOqNTXmhcBMJKr7mll4R6caW94N7lWlWX9pq3mNA=;
 b=Wpjn46fd2bonrqh3k0WBFM1RZSwIeeBCue2wHQucikXE1hlsNp01ntqsLLR8U4i7asineslPobOPcZhuaDfa3q/y1KdltVrIqwPVoIM5pxYGAhbPjNh2en4FYsRl0dxmmpUTsp5DagCuYJJ5DLb/lNxxPw3b6zRk9vjjfDvzopFP+EnrH3ztHcBzjTgc1Tw5bkD9pTkC+8CijgK9HJ7s72Ausnzfc7Iqa4gRN9Fse9b2a6/VgQ3e0d9g5No7tn/BKTrrIhgLuo+UXY/LQIoHIQxyL2D2MIMOtTjdgTdAJ4bG0eqdBo7VnmQK5lKFvsLWcd8r5eM/Od8mIKvZCw4Kog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9072.eurprd04.prod.outlook.com (2603:10a6:150:23::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 10:55:48 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 10:55:48 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 17 Aug 2026 18:59:32 +0800
Subject: [PATCH v11 1/6] dt-bindings: clock: Add spread spectrum definition
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-clk-v11-v11-1-36e9bc701b11@nxp.com>
References: <20260817-clk-v11-v11-0-36e9bc701b11@nxp.com>
In-Reply-To: <20260817-clk-v11-v11-0-36e9bc701b11@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sebin Francis <sebin.francis@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9072:EE_
X-MS-Office365-Filtering-Correlation-Id: db4b1280-9aa4-40b4-fbd3-08defc4e18a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|7416014|376014|366016|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	0W74yg0DiNA8RNk7vhgExn/uBw2DiEHISU/ugnQLtAoX3lXoK14US3CloyjLQpxwCDNiBMk6nVTz4K5CAMkmIQI41lcC3hMX5ZCgeXLF9XCghqRYAz02PUdsLalzUvuYhIuenV5NnvXTsNHfUjFWNTCtU0pL850h6SYorynPOArmEYHg0phZGrYPta5rz+vIlWB+sZElJ71fuw7zr7QiIee+j/MG5XNA5ITcqIqKAV3LZ5atGlE80zQyuRxt8+WF8s2jwdCTG1ZIKw7pjrUHDzRvBJOEqS6wQDPZcso+NT+vBKEgTnm7OL97YCfNtS/AYPZ0VOTJwcTzmDlYFoLJjEHWq7IVM3/Hq4Nh+ITdh7XSKOpaOOCmQ0wwWVrh/H7gNy2mZj6Eg3uEnFX+1V/Y7S7IW3UmzeCDJSPSta7Ib9jcKZ8/P7tRs52mw0CjFbW6KMlHvh+0qLTYFl6VK6eFcxg0W3J4lGZCeqmpbZ+gXGy4/enH0oQij+iTHqzL3Wk0DglPrYaDp++E0omH4TFPDedQEmnVC+Q31DyGEn1svYA1l4AWl77sZXdV/PMj7m3SGwamUrCvmUdbO8FYVbzemVKqZaSRJvO+mMWy4RGA8R3XwZx1Cu973rTV8Tee6/0PTcUhX2t4KFZq015elRgcm2gBpUoDSGXI3+7RlFJ3nOU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(7416014)(376014)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2NyK1pENnE5UVAxN3lUVlN6QTZYTEkwZmtpVHd2cnY0RzJZamF0M24rOTRD?=
 =?utf-8?B?TUlYM1RTcWlMMUFIUGxUY09wSXFFLzltdmpMbStIaU9oRHJSWnNYSER2ZWRs?=
 =?utf-8?B?MFVxR3ZnbEhycjFIUXJhUjQvUFVyTGg4S0I4T0tGekNJTkU2ZXpmQ21EZFow?=
 =?utf-8?B?SVJvZVVMY3hhSjVIMlF1UlQvby9INFdSbTVLTEMvQjBLR3ErYlR3M2gzL2Rv?=
 =?utf-8?B?REIxL3IyK1phR1NpVUFWNkIwaC84dmJLQysrWmE5WDBvZVgyK05FRStJcEZW?=
 =?utf-8?B?QnJFQWJWaWk3V3dOS0tnaVg0K2tlVWlnUzNBU29NQTJwUXNEV295alFlTnZ0?=
 =?utf-8?B?QnNWbWcxNXEwSHgxK3UraTBTLzNVLzRvWVZsL2szV0hLK0YrTzhSTDRZekRH?=
 =?utf-8?B?Ni9VRmxjL1dpM0VlT2dwYmsreTV0TDV0L1I0bkZ5RDcxQXpXVEJ0eVV0MTdv?=
 =?utf-8?B?TUZoaFIvQ3NQSndic2lnTnVvVElTc2MwNGhUaWJoTDRod2pQblNQcnBacHl2?=
 =?utf-8?B?WnZQdmt4YVVSWVZTS0hNNW5Ka3o2RVBIMFdCSUJYbEdzWXRWS2p5MUpZTUox?=
 =?utf-8?B?bEJ3NnlHcFUvN0VVbXlkbTNPeDlLSHRha0xFRlVyYjAzaHVhZVp5amdHbTRE?=
 =?utf-8?B?VkowVjlUbFhJdENjZ2sra1d0OTRqSFFqMXE5RWdHaVEzLzgxUFlFRlcyei9w?=
 =?utf-8?B?MnJtS1lHckZrekpZeGJtVE5KYjd0ejZxMXdYNWZjd0VNMFAycHdYOTVuWGhT?=
 =?utf-8?B?dkt1a3ovelEwSm4vMjR3cml2SEFsZHhhNVZUK0k0LzJNaG9LczFJN0J6MitD?=
 =?utf-8?B?ZHFCZFVpQi9qL2l4NHhhOGdNYzk4ZWpmdjk2MHVjOWVYcm12VXVVVlkwZkht?=
 =?utf-8?B?WWhvZTVjbVBrcmJGbXBXYVN3K0ZMeFhVc25aWVFsNng3SHhROTJiMXd1V2t3?=
 =?utf-8?B?SWJra2F2amdkdHFjcml2ZCtGdGJQK0F6YnFhNkw1MHpUVlMvbUtJeXZhVWxr?=
 =?utf-8?B?NVBpVy93VDBpRnB0eE40dmVXQVVyZGsvQkpCNzVHeGZwMmw3Q2VEOUdRQ1ZN?=
 =?utf-8?B?WmN4Y0psdzVwQkRHMmYvU1RibEdVSVVtRHRRRUYvWmhsbTJoR1pwcXZhbEFo?=
 =?utf-8?B?cVphVjllUTE4M3hxMDNVbnM5bUZWWkRnejh5ZTdidGhhVWRTdGZDQWVUMlhq?=
 =?utf-8?B?ZDdvb3MzUVFvVXIyRy8rTWFtMHErMVNJVStGQS9kNzgxUmNVbEZ0aXBlVFBq?=
 =?utf-8?B?U0VTR2FGQVcrb2hGYmwyY1RVTWlYdFUwWDNaSTlMV0x0cFVVWmhkSTJDSFpF?=
 =?utf-8?B?UzdFYW81aDVqUFZTYk1iM2I5ZGMxV0VBdlNlSjVGRXJURjcrUWlueDU5RjZw?=
 =?utf-8?B?QW1mTDgxdm51eHBSbUpmNlJZMUdTeGlrc1dlWWp2MGJ6bGlmRDBrczE3Mkho?=
 =?utf-8?B?WXdEWXVHeDVxRExxeXBsQndEWFUvWjl3Qnc2azRRbVZnVTFpUGxGc1laQkJv?=
 =?utf-8?B?R0JpYThDVmNZWU1JWUR0ZFFnUkFtS0VOeDAzd2xUSmozN09rbFExOTRaUitw?=
 =?utf-8?B?RzRwbldQQzFOYkJ4YmFKYTZmQVdrQ2p0dysyNUVIMXc2cmJwbWlSUTU4bzNq?=
 =?utf-8?B?bnhHaFZncGMyQWJFdEMwZTBIZ1JxekJBTUhQdTgvbG42Szk4WkVyWVN0RmtD?=
 =?utf-8?B?THJDZkhCK2k0ckJ6TXc0T3hmRGNPZytzazUzdGpuekJWR2M4bGJBajdjRUd4?=
 =?utf-8?B?eXF1cWVpRmNjQVBlMERVUnlxWTA5TWJ0U2FFNndGSHVCR1VTYzNVY2dyMUJL?=
 =?utf-8?B?UDc3N1BrTy9zNmZmSzBHblBzaXhPQkNIZUd2ZXFwWWRhOGdaT3RoR1pML2NQ?=
 =?utf-8?B?RFljcURqbGFOOTdjcnlnV25yc3JoSWlVbmttaHlITjlkY2drVGQ5MmxMeUtW?=
 =?utf-8?B?WDVDNjhHdm1HSWpQQmswWmM0cktxWnJ1ZEdKaG9DalljRElOWlkwMHRoclMr?=
 =?utf-8?B?ekk0WHZrQjkxRG0yK2RLVFRlaFc5RExNY2hLODJEdm9yeUZMR05uZnViK01L?=
 =?utf-8?B?c0NJclhrUlo0TXRhR2lxcWxGWFFMUUJiaFc5d3k0clpnaGZjM29LM01OQWtN?=
 =?utf-8?B?UUtXcEJ6aSttVVgrYmpDNm5PdVRnWit3ZHp1eVhZazNBZWFqSHRSMHhuYWV1?=
 =?utf-8?B?MkE1NUtDcXVLdk9KNTUyeW9xSFhXTURPbG00MVpjVmhuWnpYaVVDQWYxaW05?=
 =?utf-8?B?eGFrak4wRW91OVlOckVzWGdraDN4MzVadGtBUldMK2NqOHNsVVJJaGlLWUxD?=
 =?utf-8?B?SDlMR3VJdHczV0QxbTB3QksyRGZMUi9ic082aWpETXRVVjdxaDdha3hNZzY2?=
 =?utf-8?Q?YRVRUVz3cZ0LVI9Nvv0H0fGV5PKBl1mshliz2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db4b1280-9aa4-40b4-fbd3-08defc4e18a4
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 10:55:48.5452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KZvBciVB0FEnvJziKSOmRIVJ0NHlz7I13VBQysRj46SgRg2OMl1hKjx18YWXlVkVO+lEzBKMwnkY0/RxO5jMrcHckvGm8pdAGfGkvsJTqvpyUG0gqxbt+ATCZs2sqQU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9072

From: Peng Fan <peng.fan@nxp.com>

Per dt-schema, the modulation methods are: down-spread(3), up-spread(2),
center-spread(1), no-spread(0). So define them in dt-bindings to avoid
write the magic number in device tree.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Sebin Francis <sebin.francis@ti.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/dt-bindings/clock/clock.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/dt-bindings/clock/clock.h b/include/dt-bindings/clock/clock.h
new file mode 100644
index 0000000000000..155e2653a120b
--- /dev/null
+++ b/include/dt-bindings/clock/clock.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_H
+#define __DT_BINDINGS_CLOCK_H
+
+#define CLK_SSC_NO_SPREAD	0
+#define CLK_SSC_CENTER_SPREAD	1
+#define CLK_SSC_UP_SPREAD	2
+#define CLK_SSC_DOWN_SPREAD	3
+
+#endif	/* __DT_BINDINGS_CLOCK_H */

-- 
2.34.1

