Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013066.outbound.protection.outlook.com [52.101.72.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48275351C3B;
	Fri,  6 Mar 2026 06:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772777939; cv=fail; b=ca/PacIIHN1HVvGEQuqXic/9ynwPh2/uiJIAJWKENeQbNdG9bD/ZfQeA2JJS8WlUokmHNFbwhrZc7XWSbVImmsw1HANfdbAxTdFUmtSt5bGyWOCBJM8eDpnhuy6Cf+b1vb41Ln2lArIU9cPgi1Wfj3x2z3qwo7Q2WsWPnZhJnGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772777939; c=relaxed/simple;
	bh=xus0g/Y1oy/1L8lORlAVqSR2ehvyudtR1D61hy949rY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sFmkTA3roUtMgsYsqrwKWr0Lebh086BUW6Z7TNUVbJUt7KVQXp+QJKWLvxZdo68Td0Ogi6KN00T1yoSLI54YEWRumUBdrTGShhVJMysC7zdaHZD5axBDlwqz4GFw5G/ipo6WNWFcEyfLLXO4LIncs2Aj05LgFvXS+izLlx8jqDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kxujx3rs; arc=fail smtp.client-ip=52.101.72.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kxujx3rs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZyTgswN1NHI27psiP6Rv3bKjanhG84wHKzIiY31e3Oi5pQF+L2ZeE9/F3Gp75Udr5s2Fw8O25u4xi50s2IyFfovIqxy7/l9M0HDeNc1g0TGBYPl3JtP1d9r+jWms0XT/6hwlCE16Oe/mUAdkX34NV7jABMvdvnLm672HuyLvPgWLqqGOlV4Kc40ILEM7B3BXKUAWS8czYNL0IWqRBoT8kXYrN6p96oPViZ3cULy97D9WOhXQ5s5Hw/z4n/U3WBL3y22BfjBRtbreM+FZikm/Co0crI1tYSEtP20oslmCP2EUArBV7KDNzuTreXZzaHQL7aT2Rjh3MPodOCXGH3kEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+cy5y32ATiIV01zvDxtKwM7LdknHJj8gpmPldCOyPU=;
 b=EYtkKGYJtBHtKFlf+GGiKeJiKH9K19FMCx4hi1etYwr1nWxU5Pca+C2eY3g3Ap27NUZuIBYEqggGKxY6a+FO3yzXpbiYrK9LUwMEOAafl6YAiotb1QMcPuZKY/6GZwgbJsgrNhKeZthXZklUn2i+ghNq9mFSMr4OIsNJShrRGsbZy87qB6CJu/03EGZF3XkzQ1DKrNQN6XPlPeSadCeEteVFq2uOXuZSlWyjurRiVv/nINc/67DZaQge/dHJbXCvJMqGTkc/ivuG28fqC968QOV84dPuOUghMsIV3B/XiEvzg/axybMwaQxq6cZf9dz6Ke/jDXpPr8kSV2cO6mz9RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+cy5y32ATiIV01zvDxtKwM7LdknHJj8gpmPldCOyPU=;
 b=kxujx3rs1gOLOGB4VYlp++sLMDoaqq3x//gxWP0AjRlg96ZxSYga0XRDr01EbfywZQ502vAMFO8WGadrMnvbQlTlMb++K65dnYbm/UCIAghl6IRS211pv9BAGV58pxnq5pXt7IPSVCcZGAgbwq0Q3hkSlefWUERvo4yjQgOK/Yz2h8rNEK49fttiY1FI1El/bFCj20wBf1ftpf5hBAlzCXidbCSiSiXCGEeM4clVxPy9f+unSzjjw1BQoxXBv486XQPxXXjzkSYVgtIPkJDw0h3GHADSWYIoEjwlenl4O0yga/5+TnYNSZaV+/QwP/pDvxigu2mZn7RE5fBKvenfOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8771.eurprd04.prod.outlook.com (2603:10a6:20b:42c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 06:18:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 06:18:55 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 06 Mar 2026 14:20:13 +0800
Subject: [PATCH RFC 2/2] clk: scmi: Add support for two #clock-cells to
 pass rate rounding mode
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-scmi-clk-round-v1-2-61e2a5df9051@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: e4809c66-252e-4503-605b-08de7b483e7e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	wUHv/Tr24KC7U/UMwEhpIJypmbUSofmzs2aSVLVtzCCXIASRJzfKWdOBE+jI8m/YI0SmdN4tvEB3/pGn1FPqKQlSCXxkNz8p6SGavY7kczVIMlyyxH6+5sJtDLKE4VvSJhnExNIJ+Nl5jcydnND7txO0Qj1/l/4SRBdTEyNRgmwnwnZWPJDcI8lgy2LrWDnRQvh4RhuV/ENPDTYZrKLJbA3EO2YwEU/SHUA6dOwmvnONw744eIs6ZbUakDfu0sEryg++ARVkedDwfALJsjqLx9L6RtcVPWqPXaf3oaX0Mcyo+EdxRl2pfCdvDFe416Ae4kJggYTktDE8DW2jUDP3m//YPoL3HlmktQ9vSfMVP2qrhc2pz/zG7TSf8VHdSbYlI9uHZ54h+Onrw8HfPzQLzOUBc3rko0uS0ZMuvviMRnGjLbw1ZCmYQxQ9s+i8H0IbFB+Ho+1Ht8VQszICRczwsBdKQkYsi8IJseOJo2vGdJRcBwsT1C+DL2KkBuaZtWrqEt2G7AX0u5zB22rJpEzZ1r6fwQzTrfHsrBcnnUpS96dEK7EBJnLi/Pl1v2k6PaesQSjzdchpSrK7fJB5xPQsgupZCs2bNYma06JimLgOQZdb7CLbFHcaKaAuP++ntUbGXgjcuFZfzgFMnzg9VrfYhf2NVXZ5d1ELqCb1Kr/+s9Gf/qaB6zfH/xql5mXilV9txXi2XSHh133U4XGdFyVpetjCUNI1QFY8UG/rDN/o+m3ql9aR3gT442FYzK6F9qIz1achSCr7flFeBogDpRdrwStAFnh4c3Ez41TaOAsbOS8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWlHUllDR1doaGJzelB1N1Z5MHk1dzQ1dE83SnR5NkdOT21YZUdlNXp5WWlX?=
 =?utf-8?B?SWppM21sZnNZekFVYzlValhyOCtnTGQwcExBYk9jdzJmTzJjK2pyOTlvNmFj?=
 =?utf-8?B?dnIvUVhPWXB0RDY5Tm04OUJTdWlDd1FIa1VtMG5MTjQ2UjkxbHU3NVdNTE40?=
 =?utf-8?B?YWd2eTl0Q2lENCtUK0ZnWnhYS01OS3BvWjdGQTkyMllzRHYyZVFYcmFnRzlZ?=
 =?utf-8?B?N2JZckJrWnJ0Ulk3Y0Z2NGJvZ2p3UFVsS2E4VjBsNHBHRklVd25OWjViQ2tu?=
 =?utf-8?B?ZG1oOHlaNEI2M2RPdFFmc0YxU2hwUnQvbnFubFZHeUVzQlF4bGRhdytyYVhS?=
 =?utf-8?B?MVdaZlFOVVMwemlQWFNueHpWYXhvNWdxd2JCcXcrUzhMaWhzT1ZoVWxDam93?=
 =?utf-8?B?QWROZFFuMmF3QW11YmpEZVlRNzNnKytWWXpjdkRRWGVLakxTNzBadmlxN1Vv?=
 =?utf-8?B?QmRtaUtkZ2N0THJtY2Rjd3MvdnRObnk1VHgrZEhpaS9seXM3ZzYxSVFIYmx5?=
 =?utf-8?B?N1BZOFFSQ2JWZWdPVDRROFJFY1lyaTBOZ1Z4U3NUU1hQUjIwZnNCMVBkN2Z2?=
 =?utf-8?B?blVSSmlsd3YwZ3JrelVpZmpUL21VRFNCVzJQd2dEWEgxZmZERzBqNUNlRzA5?=
 =?utf-8?B?TDhyRjJ4VTFYV1NRVmFlLyttYUw4ZDFGOTUzVW9MeldXMnl1d3NPQlpGNlVa?=
 =?utf-8?B?eXpnVXdqNC85Ulg1R1NjUFM1UDV0alI3RWZwd0ZJNGxvLzRKMFZDbVJlejZo?=
 =?utf-8?B?S3pTM0dON2VFUDVEWmdIV0N0NjVFM0hndUU1MTdiT1ZaeDkvUnhuWWc1bzQ0?=
 =?utf-8?B?WFJ5M1BNVlV5aExvc0ZZK3hWVUlHRmJibmpGSGRHYUkwakp2V2U2aXBJMkRQ?=
 =?utf-8?B?TU1xSi8wSWF4Rko0TjNrU1FGNmxHWEJLOFcwdlliQWZVSEhaZ3dRRUFQeVFS?=
 =?utf-8?B?MHdkR0xsUjQxSVdZWmhOV1NNVmpWZnFiTGpEWWxjUW1zMFlnNXZXUXJ3M01j?=
 =?utf-8?B?V1VpbEIrNlZTNitrTXNHWjlDOEFUME1wM1BGRGZRVmtmWHVoRXdXeDVJSHpX?=
 =?utf-8?B?c2NTcTlZbW5iWkp6NzVzVStUYW53ZW90RGxHaVpaaTVvT2R6bUF1RUhtYzZu?=
 =?utf-8?B?OFBnMlRFeHlUQUprQk5maGR6UUwyL2dYTC9qMU9lUG5TSityeUJQdnRRa05j?=
 =?utf-8?B?YTBWTFdWY0QrWVBhMlNGR2VtWWtSeWFtdlMzaGVEdGR3bW02eTI5TzhoTG9W?=
 =?utf-8?B?RkQvZklzTWM0bGJTdDhvUG0yK1dua1NSZnNTcXV0N0I2N3VsYURPZWhHLzlt?=
 =?utf-8?B?bGhYY2czTmk1K0ZJNmptQzQrdGdaOVBhNFBDUjRnMDRIMmVra054S2JnSUg2?=
 =?utf-8?B?eW9XNld5c25IeTFlZWpxaTRhcFJ6TmZac2phbEZYMTdCZWxNMEtRakppeUxz?=
 =?utf-8?B?OTNZcFlOcGhmTENONk9vS2hEdm12L21PbXNpSVZNMW0xdHlQMGppZnBHRkh3?=
 =?utf-8?B?SGxzREdGME1KUU9JMHlBMmFKZUM4OFNXZGhLVGtFOTZOaWtmQzVEdWVCYlNI?=
 =?utf-8?B?ZVNiOE5Fb1hZUCt5VFpjakJUa09USzFUM3E1ZTlyMjlGcUFwT1BPS21aZllI?=
 =?utf-8?B?Yml2QUZ3QitTMlRvT211TWNFa2hZdE5vcitIcEM2NklZMDFVWXdVckhtemZG?=
 =?utf-8?B?USs4OFEwMTVwenRDWlZSTVExWFhnRzFEZzlVSU5ocXpuOFBVU2JYQjdkKzFx?=
 =?utf-8?B?SitXRWtQV3BNQnVkWS9KUXBIT1dvaHcxUDdGOVJMTE9IVUg5MUJ3bDFuWnpm?=
 =?utf-8?B?S01ERjE2WENicGk1K2pGZ0tRNno4YTNUSktNWDF2TGxQM0dWZjlMRGpiYU9v?=
 =?utf-8?B?VHdETkJYSStYRlJSZlpMUUx1c3VxS1B1bTc3VmNZS3JuRVVpYytSOW9jcXdV?=
 =?utf-8?B?MzZuOWxwZDJIOEVYMWdOZUsxWjBOT2NVYzgxcitnU2JYVFlkaW8vT0dEZ2g2?=
 =?utf-8?B?ZEFPTWRMOU5mb0oxUkx3ajgzbGNSTVBuMHA5NlNlMzdack5TcFZKemtzWTBR?=
 =?utf-8?B?bzNYWmw2dkhON0tRWExHRGdzTWxjUkNMaVFjZmRTL1pPa0tyZDZGNGNQYXFj?=
 =?utf-8?B?SFhWcDhqM2szbXdxaEUzT0VBMTUzYmsrRUVNMVdtZU1xVWQyMzNjaU1PZnJ3?=
 =?utf-8?B?aUtQZ2JiTUtEa3U1S0k1YllBb3FCVGpCd0lZYW1PMWFRN0JFVDY4dkhNTVJs?=
 =?utf-8?B?aUdDU1NPNEcvWXRxSHlWc3JsdmhGMzU2Y1p4cjlLd1kvYkdnODNNaGJFdys4?=
 =?utf-8?B?UzhUUGtwZDVuSGlRbW82eWFaSDZ0NmhLZGVJTkV1RWcvdUJnWXY4dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4809c66-252e-4503-605b-08de7b483e7e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 06:18:55.0691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8Z4pE9+NfPSSRjZ7tqQF/G2cE0+X3Na9kGgmY1Z+Co4MGbh0ecOfMd0Oe2ou0KkutGu6bP0MwKEq6hpSmIXww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8771

From: Peng Fan <peng.fan@nxp.com>

SCMI CLOCK_RATE_SET allows the caller to specify the rounding behaviour
when setting a clock rate. The previously added dt-bindings header
defines three modes:

  ROUND_DOWN / ROUND_UP / ROUND_AUTO

To enable device tree clients to select a rounding mode, extend the
SCMI clock provider to support "#clock-cells = <2>", where the second
cell encodes the desired rounding mode. The default remains
ROUND_DOWN for backwards compatibility with existing device trees.

When two cells are used, scmi_clk_two_cells_get() extracts the rounding
mode and stores it per clock. The SCMI clk driver then passes this
value to the SCMI Clock protocol, which maps it to the appropriate
CLOCK_SET_* flag.

Existing DTs using "#clock-cells = <1>" are also being supported.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/clk-scmi.c            | 62 +++++++++++++++++++++++++++++++++++++--
 drivers/firmware/arm_scmi/clock.c | 15 ++++++++--
 include/linux/scmi_protocol.h     |  8 ++++-
 3 files changed, 79 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 6b286ea6f1218c802d0ebb782c75a19057581c20..16547a1fa1a0f1595323b0f89753b38315743150 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2018-2024 ARM Ltd.
  */
 
+#include <dt-bindings/clock/scmi.h>
 #include <linux/bits.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
@@ -32,6 +33,8 @@ static const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
 
 struct scmi_clk {
 	u32 id;
+	u32 round;
+	bool round_set;	/* policy latched once */
 	struct device *dev;
 	struct clk_hw hw;
 	const struct scmi_clock_info *info;
@@ -94,8 +97,20 @@ static int scmi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 			     unsigned long parent_rate)
 {
 	struct scmi_clk *clk = to_scmi_clk(hw);
+	u32 round;
+
+	switch (clk->round) {
+	case ROUND_UP:
+		round = SCMI_CLOCK_ROUND_UP;
+		break;
+	case ROUND_AUTO:
+		round = SCMI_CLOCK_ROUND_AUTO;
+		break;
+	default:
+		round = SCMI_CLOCK_ROUND_DOWN;
+	}
 
-	return scmi_proto_clk_ops->rate_set(clk->ph, clk->id, rate);
+	return scmi_proto_clk_ops->rate_set(clk->ph, clk->id, round, rate);
 }
 
 static int scmi_clk_set_parent(struct clk_hw *hw, u8 parent_index)
@@ -396,6 +411,41 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 	return ops;
 }
 
+static struct clk_hw *
+scmi_clk_two_cells_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct clk_hw_onecell_data *hw_data = data;
+	unsigned int idx = clkspec->args[0];
+	u32 round = clkspec->args[1];
+	struct scmi_clk *clk;
+	struct clk_hw *hw;
+
+	if (idx >= hw_data->num) {
+		pr_err("%s: invalid index %u\n", __func__, idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (round > ROUND_AUTO) {
+		pr_err("%s: invalid round method %u\n", __func__, round);
+		return ERR_PTR(-EINVAL);
+	}
+
+	hw = hw_data->hws[idx];
+	clk = to_scmi_clk(hw);
+
+	/* per-clock policy: latch on first use, refuse conflicts */
+	if (clk->round_set && clk->round != round) {
+		pr_warn("%s: conflicting rounding mode for clk idx %u: %u != %u\n",
+			__func__, idx, clk->round, round);
+		return ERR_PTR(-EINVAL);
+	}
+
+	clk->round = round;
+	clk->round_set = true;
+
+	return hw;
+}
+
 static int scmi_clocks_probe(struct scmi_device *sdev)
 {
 	int idx, count, err;
@@ -409,6 +459,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 	struct scmi_protocol_handle *ph;
 	const struct clk_ops *scmi_clk_ops_db[SCMI_MAX_CLK_OPS] = {};
 	struct scmi_clk *sclks;
+	u32 cells = 1;
 
 	if (!handle)
 		return -ENODEV;
@@ -456,6 +507,8 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 		sclk->id = idx;
 		sclk->ph = ph;
 		sclk->dev = dev;
+		sclk->round = ROUND_DOWN;
+		sclk->round_set = false;
 
 		/*
 		 * Note that the scmi_clk_ops_db is on the stack, not global,
@@ -495,8 +548,11 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 		}
 	}
 
-	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
-					   clk_data);
+	of_property_read_u32(np, "#clock-cells", &cells);
+	if (cells == 2)
+		return devm_of_clk_add_hw_provider(dev, scmi_clk_two_cells_get, clk_data);
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
 }
 
 static const struct scmi_device_id scmi_id_table[] = {
diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index ab36871650a1ff890c4cb7f67d3ded2622a72868..1548b6611f7f6c4ac60e740bb36f2377568d06dd 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -570,10 +570,10 @@ scmi_clock_rate_get(const struct scmi_protocol_handle *ph,
 }
 
 static int scmi_clock_rate_set(const struct scmi_protocol_handle *ph,
-			       u32 clk_id, u64 rate)
+			       u32 clk_id, u32 round, u64 rate)
 {
 	int ret;
-	u32 flags = 0;
+	u32 flags;
 	struct scmi_xfer *t;
 	struct scmi_clock_set_rate *cfg;
 	struct clock_info *ci = ph->get_priv(ph);
@@ -590,6 +590,17 @@ static int scmi_clock_rate_set(const struct scmi_protocol_handle *ph,
 	if (ret)
 		return ret;
 
+	switch (round) {
+	case SCMI_CLOCK_ROUND_UP:
+		flags = CLOCK_SET_ROUND_UP;
+		break;
+	case SCMI_CLOCK_ROUND_AUTO:
+		flags = CLOCK_SET_ROUND_AUTO;
+		break;
+	default:
+		flags = 0;
+	}
+
 	if (ci->max_async_req &&
 	    atomic_inc_return(&ci->cur_async_req) < ci->max_async_req)
 		flags |= CLOCK_SET_ASYNC;
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index aafaac1496b06a6e4f0ca32eee58a9edf7d4a70f..d0b7186177f49dea9c4b0030927782e6fd819ad0 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -83,6 +83,12 @@ enum scmi_clock_oem_config {
 	SCMI_CLOCK_CFG_OEM_END = 0xFF,
 };
 
+enum scmi_clock_round {
+	SCMI_CLOCK_ROUND_DOWN = 0x0,
+	SCMI_CLOCK_ROUND_UP = 0x1,
+	SCMI_CLOCK_ROUND_AUTO = 0x2,
+};
+
 /**
  * struct scmi_clk_proto_ops - represents the various operations provided
  *	by SCMI Clock Protocol
@@ -107,7 +113,7 @@ struct scmi_clk_proto_ops {
 	int (*rate_get)(const struct scmi_protocol_handle *ph, u32 clk_id,
 			u64 *rate);
 	int (*rate_set)(const struct scmi_protocol_handle *ph, u32 clk_id,
-			u64 rate);
+			u32 round, u64 rate);
 	int (*enable)(const struct scmi_protocol_handle *ph, u32 clk_id,
 		      bool atomic);
 	int (*disable)(const struct scmi_protocol_handle *ph, u32 clk_id,

-- 
2.37.1

