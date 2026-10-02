Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012053.outbound.protection.outlook.com [40.107.209.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D02479864;
	Fri,  2 Oct 2026 10:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936598; cv=fail; b=eZRn//eNl8obtzErH4wEmFDu7XxAZHNUCygsDCI08mvp1zwzFh3YJeZfU+1HZvz/z4lXBXFwUaO6Xgosn+EGFl68RK1jvxyxLsFND5jepBi/u2Qxl46IAddGHKZaN9dUr2+MkKfDqrAZkaMiVA5fVc10gp2fwOM+FK7GTLTNhbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936598; c=relaxed/simple;
	bh=4zr2G4MlOEw/iq2NKjl9YtLC32r9W6Y9aCTuQe8xKbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aY8cVprLv4VmCdUSmJjrEigoOm3TDJ6FjROnIDWmmJqr1PCkcUxhKJwiAU6A6Zluqvdtelr9pqjlMLpMMwVnPmra6P63AnzID/b55B1fvdB7Soionl3iWetMrYH3fHOYDh63Tjlz0IDRJ4v5K5wFEXbOYhAtXD2/bZevpOdoalk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=RzbTbRNY; arc=fail smtp.client-ip=40.107.209.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="RzbTbRNY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4x18KJkMTZ1Gs+FQTpHwkzFdqunUMQykxbd1G1nMgunJrkDaErfyxgYclKQGjAcrt9qHf0I62vnLF+4KuKUg65Q0/bVEkYbOdDo8VYv4BR7on7cfZTuutPz71pF4zesgMvRZz5sUCQd68oVQHI8oWewWOJIoYaycQrovPVmL830CigMlTRf9lwzGx63VQfzIm7vW+wdpyhPIIJxsTcDbrojXDKCXIsRu5snuT+h4ChsT+dnsU3LbEBMIMSSpKS7VHCJXWuMMuTyXO2QIJPg7+qhLn75SbuxMUjoGY5vAoZ630AbX3LS/DW09FfBzj5sXqaNwfNPi/8naufxxnTuVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mZ+4T0yIz4oWfHdS3wmWko/nquRqy789OKQqsHol2A=;
 b=PR12uOAyG2pHVhIGw13rJA5ePJ+PojzN0fGBagm7yFK6u47719lAFzhxwMif7WjHxtx5J+gPE75aWwgKFau5QT6KZl3E3JZn3XY7cO2mckXC7pRVc7pSDHsC3v1tUz2NA3mh3DTINJUsLH45IXr5J+IB9+y7jrZl+vcdxl4R96Hye+h0lSS84w1GZZGFMBTfXPf7GzTgS35Twu4n1i+p5VUXZRINLrinALj12iSUUFkL/4aACnWe3q+1HjY6OgKjtQDRniGkpJC1ZEwAoOZC8dDdA/a3ZN81SghIUjJtEaYz/yXccJPx8beNkmVnXFT+s8MVxkCPKr05Z1pAD50G4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mZ+4T0yIz4oWfHdS3wmWko/nquRqy789OKQqsHol2A=;
 b=RzbTbRNYW3gLIB5oxSlXBVMZuWc1rcPdilPXTq2T1S9FqJ1+PfwEREAfSxyOQyu43eKrACBw5bKa7Z18qY2CT+SgB+UPWnVkzms+c0jUwaNSmHWBgRqSgZZIDyivkJZhCAfnusYL50AZgLewQjEN+WjUXtIj/xvNkmayGaXLCDhN0GuQwcm6PcEjnluycpxgoq0KJGU/kEfaF4luTH4mZwgNoe3eQrxdlcgtYtJtvj33urPTu8IAkmfj++wEAheSglkCPFEw+UtYal05Q69uFb9/eFH33i642p45+oSI+dTM65CY69NrgZ/UGT8SWifMuU9Ef25V7XTBTmkhOgWqOw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MW4PR03MB6588.namprd03.prod.outlook.com (2603:10b6:303:12b::22)
 by SA1PR03MB7053.namprd03.prod.outlook.com (2603:10b6:806:326::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 10:23:12 +0000
Received: from MW4PR03MB6588.namprd03.prod.outlook.com
 ([fe80::dbfe:2474:d98e:ddf7]) by MW4PR03MB6588.namprd03.prod.outlook.com
 ([fe80::dbfe:2474:d98e:ddf7%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 10:23:12 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v2 2/3] clk: socfpga: agilex5: register the SP timer clocks early
Date: Fri,  2 Oct 2026 18:22:55 +0800
Message-ID: <cc6e826f93e113e42fbba46f7da2ad8cda7cdb57.1790935401.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1790935401.git.adrian.ho.yin.ng@altera.com>
References: <cover.1790935401.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To MW4PR03MB6588.namprd03.prod.outlook.com
 (2603:10b6:303:12b::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6588:EE_|SA1PR03MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a6f866-8285-4a98-9701-08df206f2986
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|55112099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Dr1uXqJgRkrfPAvHupA/qsjDz5wPe9NE2smVwfehFmjcqzdjWSKpbeNtwTSKFvGAIIsnND6upgz5s4NCYGyr7b3pIPyWlARF2ETQZdw8BlffZWPdwWLyI25JdkUqpcUmvV/vB3UF6/C3wXB4s0vYbucSA88VVQDhVJIQo8xQSTU+GriqYmx4nOG+6VGyKKyugTjahtHkAVsust5L6HS8+nTAWOOJu4h+3f6wRZBu8R3x0qbeKslld+6Gqo1fjEaGavEbXd/xXliIacqqZbY6hh8+CT8WEZaopO/gmZOvJ5MDwGN5CNxPG191HWrz9oxcaZD8DXvfSWoXgUPC0wavZ6B8YPyRtmm0PB2y4uz9fJW738lTRELeWnyrx8p1Axa/F0DcJnYmOHVbFLLM6AIsY9S7CGKtn7VyI1gC5dHdXBxHXDUHpmJ6Zyw3NZQMWJQKF6F5kjSRcQVXHvHbRDFHusGNpvW34YosYLcZZH4KR4hYfY3gmjYCuunTVPd7oUa0tQ1Teh1PoVtSwKkr6bYFTcK0b597Rtv/IMtUVrWZmkSRlMlEaw5I1r75qjRaH9OKGPpkRiSGsJV5LfBnhUuJl7Dh9ZeKz3BblX+6n7JY8NmgWCjbq6gJF7KPksG/YHOkD5CwU4CMlZqu34YF8uJtDlJ5EwZL6lvnmbcnPVUTvVE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6588.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(55112099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ygCKvgYiSPUESC9O9IBoE+skBV9fC9iQPTv830Ul+Ac8tjaho2Z1R0WX6ilc?=
 =?us-ascii?Q?e1Olo6bSpy2Xzdptr1E7m0+G4oE/fVtGB2XM+ySmRvKVST8UmVrmhJT/PnmT?=
 =?us-ascii?Q?nOy0PYHhcZ1t8hMeBJkB4dkTOg9L/4eHWq/hzRF2si8bN2k77EFr0C6pHbiE?=
 =?us-ascii?Q?8bhLgyJJf/hPA+R2I/r5Jeq2rODClfANMovIXIWyy9QV9jbDipchxqi+U0Uw?=
 =?us-ascii?Q?ojqxR4ppxkSN0pY5lmpyGAtq6QRlgbZrkASWgpZ3z/m11x8hXGJsAJtEgsl6?=
 =?us-ascii?Q?fRInHBxjijWMjWgsy1T18UQ1SB7p4kJAvGtq30gU42OLkF4Dbct9PIa1fYEC?=
 =?us-ascii?Q?5rrfSnQrcZqx8H9YiZf4X8N1f6NsjboIWqw2SquEGiU2E9cxvzbN3q0CgS58?=
 =?us-ascii?Q?ykQmTK1guvZ94at4rOZNxdNEUoFuWZjpAH6WEhg0lxRDCxxVsdVcZk/+hn37?=
 =?us-ascii?Q?cmNa0X0NpTUYYC/EdhD4OffT9IXyIHESGU25JPwT1t9PpsiUJZlmhT8NGGTo?=
 =?us-ascii?Q?KlMU0l3JaFquZxK7rxT88BhDMEhqG30zsqjb2wvuR8zalp9xEHF69HP1vwce?=
 =?us-ascii?Q?8e8YQcALW6gynVxjtio9DvYiCZic3uZmmXm+fUEEUKCUyblx0eRa3AlkE1dH?=
 =?us-ascii?Q?qoPpL1P6ZzwnAUJc6WmbPsOapLjiBs45bd6eNTZn7H7JdQIrY9OCFmP53v7d?=
 =?us-ascii?Q?5S37e4gZeaS3bKv0UzLRKKc5UPxYUnoPs9nnR9nSp8KRphgnUAAvKnuh7grx?=
 =?us-ascii?Q?e8S8SPh+GCj1H/cBJ2/FvIRm183TLywNSJA0s6yC3g8RGO1jUNuMnMujZW73?=
 =?us-ascii?Q?9hPn32vF2M17WJ1UHKV8TK6b0smmVpYnNzN5jSXa+y3ISsai635FE3OG7W1s?=
 =?us-ascii?Q?Tf4jjmUJUp+bx3RFqAiENhpwyuP1OegUC6xEcyc3Xze6QUpTAyBJBHOY91MZ?=
 =?us-ascii?Q?KMAUDOJCmImY0pQnc9oS6EJ2kwi0UVpzt6Z4e9k1t1qUCeiR6mWZ7AmCpSLi?=
 =?us-ascii?Q?D/k2ZkT+zFz4cXl70X/dhEdLP6F8doLZ5VwSbOksh83fRm58ZOUzuuvkZqWF?=
 =?us-ascii?Q?+AIqYqose7U8uSKlKigO6tKMrbbqeZIkfRzA7lsFMOfJv4MtU9gROZIpPht2?=
 =?us-ascii?Q?UI2zK+/eQmtS2iL3asL8lrz2ySCUv7+rV+cvaor5wAHxA6CT6EWU0mdxLlC1?=
 =?us-ascii?Q?yzAhJuc9ey+OMmsQx0nBpqbhIN5oJWSKifHtoXNJEaMyST0ZZUNsZhpqlngg?=
 =?us-ascii?Q?9xeg8QVPGVw6b35lDCkdKwKkArmbUkmJhMRjD3dyvA1e6PYTxv7OUwbqAVyy?=
 =?us-ascii?Q?AQ3ZRSj2nS+qcXPfuqu/M69tSoo5xz65jWlrROkv75ijdvU9qf2NEujFiIcT?=
 =?us-ascii?Q?dg3HxLZp4dToWBc0flcxKsiALR73uHYYKUrLFXqFq8r4UgAxIWpe68qhQFDC?=
 =?us-ascii?Q?9ImypFwc/iDApktpRqf2xElUxucBE2qmQ/lm860m8Z4+t00FZnJ0n6QmRpB2?=
 =?us-ascii?Q?BCJq6sxR9ZNM4+ZiR2lE+IgcvPQxPYGiXq6rQGXNFBQSBU4SAv6Oh+juuNn3?=
 =?us-ascii?Q?CTPVRXw1xrJixrYolfdJAnFsFSR9ZL/UawZTdpAoq9MqgqRr7HUB178ojoyw?=
 =?us-ascii?Q?EwAt5fVRhcRqIB4Eiajzdv7rbcX5aAPIKdO+FaL7oscbjINhI/2C9UV6S97L?=
 =?us-ascii?Q?X+Ceu638EGgAcCeK7DP0VJyW+WbP+If71zE8Kr8OCnM8qaM2+VQJhUBndd84?=
 =?us-ascii?Q?MD9DQctyDUJ30NIY6SutWIF6J16Ob+w=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a6f866-8285-4a98-9701-08df206f2986
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6588.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 10:23:12.1206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFnkCYLUKZLZicsB77DTTvy1JMXLMpHARSg3JRg1I7ut55FvteUN7/L5GQ+8MdS24+FhhmwlXc742JYl3MLtDumEe3oLEcr+IHQ83nUANEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7053

The DW APB timers are probed through TIMER_OF_DECLARE() from time_init()
and cannot defer, but the clock manager is a platform driver registered
at core_initcall(). The timer's clk_get() therefore fails and the timer
is never brought up.

Register only l4_sp_clk and its parents (boot_clk, main_pll, periph_pll,
main_pll_c3, peri_pll_c1 and noc_free_clk) from of_clk_init() using
CLK_OF_DECLARE_DRIVER(), with every other clock left as -EPROBE_DEFER.
The remaining clocks are still registered when the platform driver
probes, which reuses the early provider.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/clk/socfpga/clk-agilex5.c | 138 +++++++++++++++++++++++-------
 1 file changed, 109 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/socfpga/clk-agilex5.c b/drivers/clk/socfpga/clk-agilex5.c
index f7f0ad884f64..e439950dd6da 100644
--- a/drivers/clk/socfpga/clk-agilex5.c
+++ b/drivers/clk/socfpga/clk-agilex5.c
@@ -5,7 +5,9 @@
  */
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
+#include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include  <dt-bindings/clock/intel,agilex5-clkmgr.h>
 #include "stratix10-clk.h"
@@ -233,7 +235,29 @@ static const struct agilex5_pll_clock agilex5_pll_clks[] = {
 	},
 };
 
-/* Main PLL C0, C1, C2, C3 and Peri PLL C0, C1, C2, C3. With ping-pong counter. */
+/*
+ * The SP timers are probed from time_init() and cannot defer, so their
+ * l4_sp_clk and its parents are registered from of_clk_init(). Everything
+ * else is registered when the platform driver probes.
+ */
+static const struct stratix10_perip_c_clock agilex5_early_perip_c_clks[] = {
+	{ AGILEX5_MAIN_PLL_C3_CLK, "main_pll_c3", "main_pll", NULL, 1, 0,
+	  0x68 },
+	{ AGILEX5_PERIPH_PLL_C1_CLK, "peri_pll_c1", "periph_pll", NULL, 1, 0,
+	  0xB4 },
+};
+
+static const struct agilex5_perip_cnt_clock agilex5_early_perip_cnt_clks[] = {
+	{ AGILEX5_NOC_FREE_CLK, "noc_free_clk", noc_free_mux,
+	ARRAY_SIZE(noc_free_mux), 0, 0x40, 0, 0, 0 },
+};
+
+static const struct agilex5_gate_clock agilex5_early_gate_clks[] = {
+	{ AGILEX5_L4_SP_CLK, "l4_sp_clk", noc_mux, ARRAY_SIZE(noc_mux),
+	  CLK_IS_CRITICAL, 0x24, 3, 0x44, 6, 2, 0x30, 1, 0 },
+};
+
+/* Main PLL C0, C1, C2 and Peri PLL C0, C2, C3. With ping-pong counter. */
 static const struct stratix10_perip_c_clock agilex5_main_perip_c_clks[] = {
 	{ AGILEX5_MAIN_PLL_C0_CLK, "main_pll_c0", "main_pll", NULL, 1, 0,
 	  0x5C },
@@ -241,12 +265,8 @@ static const struct stratix10_perip_c_clock agilex5_main_perip_c_clks[] = {
 	  0x60 },
 	{ AGILEX5_MAIN_PLL_C2_CLK, "main_pll_c2", "main_pll", NULL, 1, 0,
 	  0x64 },
-	{ AGILEX5_MAIN_PLL_C3_CLK, "main_pll_c3", "main_pll", NULL, 1, 0,
-	  0x68 },
 	{ AGILEX5_PERIPH_PLL_C0_CLK, "peri_pll_c0", "periph_pll", NULL, 1, 0,
 	  0xB0 },
-	{ AGILEX5_PERIPH_PLL_C1_CLK, "peri_pll_c1", "periph_pll", NULL, 1, 0,
-	  0xB4 },
 	{ AGILEX5_PERIPH_PLL_C2_CLK, "peri_pll_c2", "periph_pll", NULL, 1, 0,
 	  0xB8 },
 	{ AGILEX5_PERIPH_PLL_C3_CLK, "peri_pll_c3", "periph_pll", NULL, 1, 0,
@@ -265,8 +285,6 @@ static const struct agilex5_perip_cnt_clock agilex5_main_perip_cnt_clks[] = {
 	ARRAY_SIZE(core3_free_mux), 0, 0x0110, 0, 0, 0},
 	{ AGILEX5_DSU_FREE_CLK, "dsu_free_clk", dsu_free_mux,
 	ARRAY_SIZE(dsu_free_mux), 0, 0xfc, 0, 0, 0},
-	{ AGILEX5_NOC_FREE_CLK, "noc_free_clk", noc_free_mux,
-	ARRAY_SIZE(noc_free_mux), 0, 0x40, 0, 0, 0 },
 	{ AGILEX5_EMAC_A_FREE_CLK, "emaca_free_clk", emaca_free_mux,
 	ARRAY_SIZE(emaca_free_mux), 0, 0xD4, 0, 0x88, 0 },
 	{ AGILEX5_EMAC_B_FREE_CLK, "emacb_free_clk", emacb_free_mux,
@@ -313,8 +331,6 @@ static const struct agilex5_gate_clock agilex5_gate_clks[] = {
 	  0x24, 2, 0x44, 4, 2, 0x30, 1, 0 },
 	{ AGILEX5_L4_SYS_FREE_CLK, "l4_sys_free_clk", noc_mux,
 	  ARRAY_SIZE(noc_mux), 0, 0, 0, 0x44, 2, 2, 0x30, 1, 0 },
-	{ AGILEX5_L4_SP_CLK, "l4_sp_clk", noc_mux, ARRAY_SIZE(noc_mux),
-	  CLK_IS_CRITICAL, 0x24, 3, 0x44, 6, 2, 0x30, 1, 0 },
 
 	/* Core sight clocks*/
 	{ AGILEX5_CS_AT_CLK, "cs_at_clk", noc_mux, ARRAY_SIZE(noc_mux), 0,
@@ -486,35 +502,92 @@ static int agilex5_clk_register_pll(const struct agilex5_pll_clock *clks,
 	return 0;
 }
 
-static int agilex5_clkmgr_init(struct platform_device *pdev)
+static struct stratix10_clock_data *agilex5_clk_data;
+
+static struct stratix10_clock_data *agilex5_clk_data_alloc(void __iomem *base)
 {
-	struct device_node *np = pdev->dev.of_node;
-	struct device *dev = &pdev->dev;
 	struct stratix10_clock_data *clk_data;
-	void __iomem *base;
-	int i, num_clks;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	num_clks = AGILEX5_NUM_CLKS;
+	int i;
 
-	clk_data = devm_kzalloc(dev, struct_size(clk_data, clk_data.hws,
-				num_clks), GFP_KERNEL);
+	clk_data = kzalloc(struct_size(clk_data, clk_data.hws, AGILEX5_NUM_CLKS),
+			   GFP_KERNEL);
 	if (!clk_data)
-		return -ENOMEM;
+		return NULL;
 
 	clk_data->base = base;
-	clk_data->clk_data.num = num_clks;
+	clk_data->clk_data.num = AGILEX5_NUM_CLKS;
+
+	for (i = 0; i < AGILEX5_NUM_CLKS; i++)
+		clk_data->clk_data.hws[i] = ERR_PTR(-EPROBE_DEFER);
 
-	for (i = 0; i < num_clks; i++)
-		clk_data->clk_data.hws[i] = ERR_PTR(-ENOENT);
+	return clk_data;
+}
 
+static void agilex5_clk_register_early(struct stratix10_clock_data *clk_data)
+{
 	agilex5_clk_register_pll(agilex5_pll_clks, ARRAY_SIZE(agilex5_pll_clks),
 				 clk_data);
 
-	/* mainPLL C0, C1, C2, C3 and periph PLL C0, C1, C2, C3*/
+	agilex5_clk_register_c_perip(agilex5_early_perip_c_clks,
+				     ARRAY_SIZE(agilex5_early_perip_c_clks),
+				     clk_data);
+
+	agilex5_clk_register_cnt_perip(agilex5_early_perip_cnt_clks,
+				       ARRAY_SIZE(agilex5_early_perip_cnt_clks),
+				       clk_data);
+
+	agilex5_clk_register_gate(agilex5_early_gate_clks,
+				  ARRAY_SIZE(agilex5_early_gate_clks), clk_data);
+}
+
+static void __init agilex5_clkmgr_early_init(struct device_node *np)
+{
+	struct stratix10_clock_data *clk_data;
+	void __iomem *base;
+
+	base = of_iomap(np, 0);
+	if (!base) {
+		pr_err("%s: failed to map clock registers\n", __func__);
+		return;
+	}
+
+	clk_data = agilex5_clk_data_alloc(base);
+	if (!clk_data) {
+		iounmap(base);
+		return;
+	}
+
+	agilex5_clk_register_early(clk_data);
+
+	if (of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data)) {
+		pr_err("%s: failed to add clock provider\n", __func__);
+		return;
+	}
+
+	agilex5_clk_data = clk_data;
+}
+
+CLK_OF_DECLARE_DRIVER(agilex5_clkmgr, "intel,agilex5-clkmgr",
+		      agilex5_clkmgr_early_init);
+
+static int agilex5_clkmgr_init(struct platform_device *pdev)
+{
+	struct stratix10_clock_data *clk_data = agilex5_clk_data;
+	void __iomem *base;
+	int i;
+
+	if (!clk_data) {
+		base = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		clk_data = agilex5_clk_data_alloc(base);
+		if (!clk_data)
+			return -ENOMEM;
+
+		agilex5_clk_register_early(clk_data);
+	}
+
 	agilex5_clk_register_c_perip(agilex5_main_perip_c_clks,
 				     ARRAY_SIZE(agilex5_main_perip_c_clks),
 				     clk_data);
@@ -526,8 +599,15 @@ static int agilex5_clkmgr_init(struct platform_device *pdev)
 	agilex5_clk_register_gate(agilex5_gate_clks,
 				  ARRAY_SIZE(agilex5_gate_clks), clk_data);
 
-	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
-	return 0;
+	for (i = 0; i < AGILEX5_NUM_CLKS; i++)
+		if (clk_data->clk_data.hws[i] == ERR_PTR(-EPROBE_DEFER))
+			clk_data->clk_data.hws[i] = ERR_PTR(-ENOENT);
+
+	if (clk_data == agilex5_clk_data)
+		return 0;
+
+	return of_clk_add_hw_provider(pdev->dev.of_node, of_clk_hw_onecell_get,
+				      &clk_data->clk_data);
 }
 
 static int agilex5_clkmgr_probe(struct platform_device *pdev)
-- 
2.49.GIT

