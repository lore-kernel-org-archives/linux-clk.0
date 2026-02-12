Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013010.outbound.protection.outlook.com [40.107.162.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEED2DE6F3;
	Thu, 12 Feb 2026 08:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770886613; cv=fail; b=aKQse1tK9EMgU6xm9Hw9bZPOP2DBHusyV1JSc3vJaeir9SqX/skTbGvKNrtykHk+qBAUk7S2r/9sE0G16hUD5Q92rvqOeaATixEowGTu7TZJDEn6+feYWlYMOzpGMKTC2YCuQ9pc9QiO+FD/9L2nuSWAzJXxd03nVD7sVklufwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770886613; c=relaxed/simple;
	bh=u+QVakRyebbABAGiskTss00ZSbv8z/ods8irNlJdQ4E=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=KB60lBmHXFXZka0+EYx9R9OMD+HnZJJ6Bzi4g6gbY2/XTPeeupn2TpNI86JZ5vTwU5Mj208qwBWEGpne1/19rhTML0kucO1GxPlOTfbFVOKYtR7Tl74dPHA+XIewdOY1FdEwsSoy9DH7w8AeaNie1ZnMy42Q3DAzC5N8A6DgHUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aGggh1lY; arc=fail smtp.client-ip=40.107.162.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aGggh1lY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVuMTaIQTUKHOq4DVYKOOd+kl6ZaS56BLKbin9OENabI8pmecKxzwewgLzg+AF5ZA1UnLHBvxkRXruajXZr3NJYbfycFpu9xcMOkvBuKDgc0UT3iAT3e6CRszvBojzJakm6Pw+3mhE663mqTwnlIkM7OAeHbptMqgGH4akXztdBoQniGC5wBah5thwFwEVMjI3S7uQ1sHNWAkcyrjjot9unrV58OXzOeQPDSv090IkzmmHaefmHLrT5uwvTxwDYuUD4RF4DdCvn91l1rULNP5ZoswAytqAQjgflCvPNrQrRjK4Uwg178zH2+vVJw0pS4CKaWi1dv0h9Wj49BpbdPig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSm3LYe/pAeZgAkUgDIaRL5ahtR/Jzol1Yy/7XTP8B8=;
 b=jcHcYLcDTJkJmKYLdr5M5J14wYnuH3g51rrYdAbcSPZxhyB3mD5hi2bz1IFX4NLQ/mmXUALFb4v/4sEWdJjJomSjH2D+c5hSVRGrDMIr7ubwWbhWY/8wtRv1XIvj85PgRF/Kz1q9AH08uWmQ06/xCaBHlhTm3C/610+pbnYFwX3ft2asv08TUdSXMp6LA6FNSJwwSwGHeixWhII3fYhoY0Xsc0+M6jlqt7AwA/UZybGPs5+8SA3zXOYncFigdLZowHdsXThiVnRKB+C78xhVt6K7L0MlzCskrfiiRqoyLp/KN6a8WnsnKZY2kBk152uTX14iizujfpg8CHluSxGbZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSm3LYe/pAeZgAkUgDIaRL5ahtR/Jzol1Yy/7XTP8B8=;
 b=aGggh1lY1o/c32+Sj1pdthXG1JAUEfBMiPRNTEM4MhdZ51hGC7SZrBa+dqox/P5al5ULPk3OkH5clcWr/4vqJ3/sHl1rD6ZIivGs23uIUz6Tbn+19FYtau9GItDfNjTZ/LU63wTf/TGTiwfgtiDr4IA5TxQMaZhVA/dJlRU4LwjmvEMYZpvO0qYH5GbPkDtemV6k6rtXSrme1Z4BNkvBJtSQ+61Sb50a77ch7yJ4CDe/BEgCm6Q+ei+siW1WaazJiVowencmu3yFzj86JNOO1qRrU9rshdeIYneedpB1n7BmJjdt2mnwvNcxii3jQdI3sqcmzJyWzH1d0tou12qU+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GVXPR04MB11067.eurprd04.prod.outlook.com (2603:10a6:150:21a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 08:56:48 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9611.012; Thu, 12 Feb 2026
 08:56:47 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stefan.eichenberger@toradex.com
Subject: [PATCH RESEND] clk: imx: imx8-acm: fix flags for acm clocks
Date: Thu, 12 Feb 2026 16:57:50 +0800
Message-Id: <20260212085750.3253187-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0153.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::33) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GVXPR04MB11067:EE_
X-MS-Office365-Filtering-Correlation-Id: 381e2546-d31a-46ca-2aa1-08de6a14a769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|52116014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5Gp26QvGwvsn6TPwWhrE45Mc6jrNjGxoUr9h4fXWM4glS9C63R+GOJRjgUGJ?=
 =?us-ascii?Q?vOEvNULX51zWVb/CqOSbVgLBLg7T1HQOL7Oyg3Kz2uJPeDaFX+t0DZYmZABa?=
 =?us-ascii?Q?NWpM6zCTXdEEklpwQZIayprf5sW9nt7e7qamP93zg3DDFD8Q4Ctvh1iy5YK0?=
 =?us-ascii?Q?fPhCM2F1//WsP09AwTLBUfSiu14SJskN+V2R3hz5gWGYPwWA96lqDuDIY4vJ?=
 =?us-ascii?Q?jp43zws4Fiyo6mGuE/ZDUDY/a4MjP8umq25EcK4vGoba+mfrhuOw+Atra5bf?=
 =?us-ascii?Q?ALOrZRk5N+ecHuPxAiqrUWm3FxUGdz9uK0JjmWH+IzFkhbm2VKmOJF34oXdR?=
 =?us-ascii?Q?8CqYJPpM0rZyjcB+QgXEtp8CUHqr6VG1kakt1IMkPV/GgLV2cIKpUZLXGCPA?=
 =?us-ascii?Q?1wEVh4IN8LH7XIyeFUZJlSzsTN2BMuK3+FdBkghOq/Vm3GLGx62Eq3RQIUTd?=
 =?us-ascii?Q?jij53lWPhJu1y9QJesvYNfPSHFH6WCFUW16QebkJJv7LfBlkhTFZBDUri2xN?=
 =?us-ascii?Q?hW29uWeN4iVZbkL6jI3s/1vy34qE9hoyGgRDBQOfh7kKMWEhoftXF3vztt+E?=
 =?us-ascii?Q?ooZi7hxMSLL5rF0QrMZnEZxt8Rxogo2CUGqp33Z1pbfA2oJyTAYN7Q+4ITdk?=
 =?us-ascii?Q?z2+lgOXiVScQOLJ33nV50Vb5GlBquuLUTyeka68+jzro5+/XN3I3W8ZWHbrj?=
 =?us-ascii?Q?a6iuD53WMuA+3DFCKcWb6MZiiUyJcR4zHblf16pUJootce0YcDmRaWJWV65w?=
 =?us-ascii?Q?woJrfx3Dpe+pq8LPakTjj8t0B8GoF+VV629THp08r2chzWcRESugI1Kyfq/g?=
 =?us-ascii?Q?AaQDh6ojUHCdyHnKCaGc6RRr0g5yWYI+DlT2WGBaAb47HB0Y/LAaYM/pqZnU?=
 =?us-ascii?Q?EH+2JNxUs+wpn8sgWQnaXfXudpOT7QF6mQVanBBYwgY68LxjqJSJTTYSJL7e?=
 =?us-ascii?Q?aPzIL5EcWvJs1uqjARHJE8Zg2Je5TfN4XpiWK47TofMapHdmWiXLZ7iOAIsQ?=
 =?us-ascii?Q?BfPkuSclEOnlMFoEsQ0PNMRkA8ogr7wj3NWRZbn7u3faNyD4cL07K6CkIJwm?=
 =?us-ascii?Q?8xE9wzE+Ky7IdUpqWg4H1jTQ+1Xic+xefRYlEaVH6GlYzOORDi+/UJevFJyv?=
 =?us-ascii?Q?kJ4UrjHHy3Wlq3KrESulaquxO9bs9rjXWULgUsp7+cqAG9qCOOTbn2bDQswJ?=
 =?us-ascii?Q?BH1eYX+q+Buzy6bJ6WG2t8/jThq4ZUW5LLM+WTlCxAi++g2DScxk/J5Iy6lO?=
 =?us-ascii?Q?3FZNLguCOJLgvE6gzTwliXIp6rfIECCpX8uusPzgPnXn82PQfPqpTRu9jSuG?=
 =?us-ascii?Q?7yiT91uk+nzD73hNlHvo/T++9h45hx7LM3fJHHO33O4Xlgia/+qbM5OXXba1?=
 =?us-ascii?Q?d9RDq/jEJie3z8AcpC/l3RuqIPi4mmQcR4s404AtlzM5F7gFdqlAOwsdStL5?=
 =?us-ascii?Q?8Kg2b6cG9LxqeesLZoGqqL0piF3Ie0mD9lWjhOstPJAn0FTBRh5u2dq3IDOa?=
 =?us-ascii?Q?EM0jFwkPy/mos30f7rzJ/qQ4YAoQ1BQJ7pYdgvFYs/T04z8vPenBY4SH0ije?=
 =?us-ascii?Q?J8tIhwJSUR5ityTdUC9NQKh+gcDDc57LFDeDCx43FNqDSj8HB0r2608AvncW?=
 =?us-ascii?Q?dCUzQIO1thx8XrB1f+bXyLHxRYPpYf6+uypHp59+evl5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+dEdSr12xrB+sF9+Wx6O2fu6ySNUOJLpnnLfZPvsjztXDg5wXfLvcHl0+DPd?=
 =?us-ascii?Q?pFi0BT9apR7gJo9t/1CStklwdlTnosQuH31TB9ViPvfkVbqxfmojUNju8cyH?=
 =?us-ascii?Q?kWXobzWV9zn7CetEq1BRcoIbE0Vi2SfEXY71hGDBvDaEJf/pom9kUNfSbjqT?=
 =?us-ascii?Q?QgqVhS8ewzvm4CgnhFDshtBqNFJ2QG0LlsyRNa2BDJgWSVcqbUYSKiVlVOit?=
 =?us-ascii?Q?lSmIRr1EJO2114D42CVnOLBVgfOHE9vKQQ177O3AcnMimeIvv8FCd8+w9efV?=
 =?us-ascii?Q?eaTJdFiE2f2GchGd+B3yuRYD/hhpZpidZaR5UyI9oTR8ueipVNxgrxpKCcDf?=
 =?us-ascii?Q?WqwIIXDzGHapuYH94Acx6mvsO6+6fpSZFEnlPCy19HXpMNJqDXxmXT+JZ0DG?=
 =?us-ascii?Q?5eFJyFmAKWGiHguHBIN+wIKUKvfy8nOBm7vVkqgw8rPhiS6/l/vQgbT9Z/KR?=
 =?us-ascii?Q?R/IJ0iZPsgMThPJfcM5mHbyqG86gth94oTXW9Lu3LdcBNE9reEVbharRDdFE?=
 =?us-ascii?Q?tdlzwsceX2BiZ7OO+90WhOPbDdNDBdVzEs15QB2qzQQ/0TjfAc/1DtoWIDyx?=
 =?us-ascii?Q?8F3eokRYNbaScEKRXI3nK1bmhFOp66Y2QjasTZ8GGQuGtdoEYD8eHrXQcqHp?=
 =?us-ascii?Q?RNoUYYKiCp03NrRCn36amp0nrMfJ8nxeh3KsKgIBZHJ1EJkk9Yvw5mCBjMPy?=
 =?us-ascii?Q?JzKk0yKUZ9yspTxnyUnE4OWLzpziiVTgQEzxipVs4Tvijw9X/Sc2y/71/nPx?=
 =?us-ascii?Q?UU3zttENIjdLlcoQkOxpEo59PBPHBLF/bWQVCAFqS0A27dVTqIbm+kePN8Dj?=
 =?us-ascii?Q?WF7BYNN8p6T2jAcYaix+bIRxwWvZ0UkihWIh2mUpj+Dt5qGiFQwAA884qR5c?=
 =?us-ascii?Q?QejFyvt7oB1k+g+p/7qTlPTCX1nOMgOrnC4HCLB4CwpBkpvKc6FBk0scunub?=
 =?us-ascii?Q?L0T+APi+wQxWiruDHma35H1nOxveUkAhTW03RA8ciOc2wq62MSN2WO9q/Z2p?=
 =?us-ascii?Q?3mqnJ6BXku5AcIJYW68cZbvcXUd0EQB5oDoElJ86HsemDS2eaUFsbyAFCIHL?=
 =?us-ascii?Q?OuwB9YgPD9dSAYM4qXhZuCr01wKapRvBH1v+ELfZ2hJZYvldllAqKhankdFO?=
 =?us-ascii?Q?S1DQu1+Cvn1mVAoiyNDrDsYYmBvX2L72n7oOVCdSOCttA0/k7L6CfedGLfSy?=
 =?us-ascii?Q?PsazZBmVjolsGG+tre1vqvxXRHtJgxsQ65Ap8k50zA6ib/v/Fwkx8aR9OmP+?=
 =?us-ascii?Q?9TgisNx03XmCNMepGLQh3aWHhCDXcGQQGglDLzDVPBOKC3CJWU1vIQKGCRxo?=
 =?us-ascii?Q?9eduzwjvEqtI8/wfQEXMvriTlWu/ovlLt4i/fdMTmFYglIO52gVa78NTC86k?=
 =?us-ascii?Q?nj3EcKaDhbqFA6V8Rodm26QzF8PouQCraESLvj8xQ9ENqJC1USLLH0pF/1KD?=
 =?us-ascii?Q?vJf2nVkpVwSHn1JLFcFMDGzm4gshhSIQw1e6u7lPQLzXbV0H2sQDIgZRYIRv?=
 =?us-ascii?Q?8yg7QtyKHL/08ERY8Q7shZLF1VsqJT/P2cYRtpZxxRBxZF1ugf37mmtagFu/?=
 =?us-ascii?Q?XhCHH4YwMv9UjMPl5WHzYjKCtNxK6FcDRvPQnEQOGmuYXhrNsDVqFqe5UEAN?=
 =?us-ascii?Q?8sgeSZJKRQic1LPOt6QMmUhRs5G0NCfUAwvwK3jVL/ZFRwoAejmE6TCx/WfC?=
 =?us-ascii?Q?J/rDwT5suRrFoj+lqJbxaiLDrd+Slkx/2av55ZHOMB7Wew25lD1nrgXtC+8+?=
 =?us-ascii?Q?FKoLRbaNdA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 381e2546-d31a-46ca-2aa1-08de6a14a769
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:56:47.6681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9gEzcBLhLqo62J0chNzPZo/gesh8FJoC8JpCQyNMlCBuP73UVgckz5VhHeiyQf9JZzcHP5/BTT+z/BmuEH6Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11067

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Currently, the flags for the ACM clocks are set to 0. This configuration
causes the fsl-sai audio driver to fail when attempting to set the
sysclk, returning an EINVAL error. The following error messages
highlight the issue:
fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_set_sysclk on 59090000.sai: -22
imx-hdmi sound-hdmi: failed to set cpu sysclk: -22

By setting the flag CLK_SET_RATE_NO_REPARENT, we signal that the ACM
driver does not support reparenting and instead relies on the clock tree
as defined in the device tree. This change resolves the issue with the
fsl-sai audio driver.

CC: stable@vger.kernel.org
Fixes: d3a0946d7ac9 ("clk: imx: imx8: add audio clock mux driver")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---

Reason for RESEND:
- I think this patch still need, link of previous discussion
  https://lore.kernel.org/all/20250113094654.12998-1-eichest@gmail.com/

 drivers/clk/imx/clk-imx8-acm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-acm.c
index 790f7e44b11e..07dca6f31cf8 100644
--- a/drivers/clk/imx/clk-imx8-acm.c
+++ b/drivers/clk/imx/clk-imx8-acm.c
@@ -371,7 +371,8 @@ static int imx8_acm_clk_probe(struct platform_device *pdev)
 	for (i = 0; i < priv->soc_data->num_sels; i++) {
 		hws[sels[i].clkid] = devm_clk_hw_register_mux_parent_data_table(dev,
 										sels[i].name, sels[i].parents,
-										sels[i].num_parents, 0,
+										sels[i].num_parents,
+										CLK_SET_RATE_NO_REPARENT,
 										base + sels[i].reg,
 										sels[i].shift, sels[i].width,
 										0, NULL, NULL);
-- 
2.34.1

