Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011064.outbound.protection.outlook.com [40.107.130.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123023AA4F9;
	Thu, 12 Mar 2026 06:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773298659; cv=fail; b=EyrdE2H30htB4QrU0SdiqitptYPxQL84sLUXTQT11NSNUhwXT4eKeL9icEF8nO/A2zZmxbFLWaOQVKMSINFpEzdg8PnAYPSdFnAnmXEIpnCY2rsSaVhH35PZcr4OIEBg9bvHL6zAa/7c72bpj8RYhuU+Hh0dxAULrH1MHLtsJK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773298659; c=relaxed/simple;
	bh=1JZAAhLgF2GAQowtA60Hzc13YTUbGezfQ7xImp2KZx4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uQGLoHurqyR7bHEnA+3ta6SS2Ev4tpe3tApgbDbEeU/s69o9I8IgF1otzyHX9tvkpxJtPsCqGZm/I9ISYE2pqzAXcGAyJhLBBjSVO5bS8OW7qcnmsbVOURu09bvtLYPfoa32R3pnyHnIdFPwaXuSx8uA6dXjzz4xKjTVCnbFD58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bhT1hTYD; arc=fail smtp.client-ip=40.107.130.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bhT1hTYD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vN0OI2j5Tvg6QnAsfGesuAn2VhHN0cp3t2DZ+YkG/0vofYdrfKOlzXidFpiZRVYp1Gj4GsUpD/drriOWqUnsH7Y3phqSTyFBE6Mbq82Yn9QtWm5V5y6i4iuqeuu21sEeqzG+xs3QC1b9dTCZzxQhBeUU2NGo852j5lpGV2CRXUWNgOBY2AnFYx2ela4Ql9YVE0lN+6rXET2bnIYiOUiVC86OghJpqCL/ROIYvjFUdsZJdH17d1HjyPOGWDrfDY1UCgZLWdFINHA9pPgPvavWs433Vu+S0niX3fJrXr8aoBSJR1teKSAKr0v746iMu0xv0+i6qAE2S9nuAKN0lfTcTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QKLClw6HqVdnkiQD6OOrbZYI51J0d1Os9FMuxngI4c=;
 b=rtBwmhI3f0iR76vY5FVpW/nGYfXb34BoJMOzDCYQ/nEg1y0Ei1KKIFnlUMMSioRuKObKXRi7pSSmfP6DjIrrELdGH4RmPtcqJBjGwBGMibe69RFtOXACFvVRyrtjkLiINsA8jsNZM8/nGmVveL4oAfQVU5fvii6eeMRk3+FUe0/RoB9EkOXvBkgwfPH0dQYz/RljIvoyLkBcVeQw3xHpq5VcesJy/zC/R29YW4ts+4d9S2ypyovXPZ/KdBqYL6b5TzFyFnp1C3WLts7D22uftw6MLRQz/qUbQqXCD38uEYraRXX58/Eeg/MA1Yxex6u7ul4TWBbuiUeIHWt0VzSilg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QKLClw6HqVdnkiQD6OOrbZYI51J0d1Os9FMuxngI4c=;
 b=bhT1hTYDVEvqY+HBsZ+8vBkJ8wt5sXOF9vznHyVyqvZRFwuKvOcrIFu5fCpFnb7jeGXmM9XSIWDsJvSFqZ2F6onBbv0s8+vNv55CfHcWY+tuX0UgKSp+Ov+zbJb78ZDiBoSliNlwFnUYm8fWj/DAfTZxbm5IvECv/QzKsloZ6JQlM/xe2SdPXZxpDR2znoYUHSoV5UfKhmwjxMxE1/N2Q2CnR9ZGR88NnycTT5fUsuQYxKPbzydUKmOq2VYO6KEcXbyn2QK9bhY7R9uucdRQZTfn0i18j886ShN054NokPLNfI8o7IXPBSVRkiSLKkIgl7jL/Pm1PuAE1BBIhrsJpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 06:57:32 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 06:57:32 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 12 Mar 2026 14:58:19 +0800
Subject: [PATCH v9 3/6] clk: conf: Support assigned-clock-sscs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-clk-ssc-v7-1-v9-3-0a9d2e188d9e@nxp.com>
References: <20260312-clk-ssc-v7-1-v9-0-0a9d2e188d9e@nxp.com>
In-Reply-To: <20260312-clk-ssc-v7-1-v9-0-0a9d2e188d9e@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sebin Francis <sebin.francis@ti.com>, Brian Masney <bmasney@redhat.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MAXP287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::35) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM7PR04MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: 6676b693-8a60-4a4f-8dd0-08de8004a207
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|7416014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9G/ujYrfbXp5RVe6pUczBm6Nr8yVgxa1+dbb3Hh314roLLQoxHpu06EeED/DwfivviOLaC/iXYDgs/W8cxyznB38nwUScyUe3n1W/skpzU4ZH2LD1VVdl1aiWLtrNng1RLEfikWn3I17Lf3gUf9TTszeRgLJFoRd9ZJmZYYmJhyDgY8DLXuoX8mgzIGZdPw52WPP50GkniGrqd2f5u5cyNLd4N299JJxo6gNH9NroB97uBqhNi85GFxL2OMFYZRQnKmDCRK5FfIMR38dBuBEeDHvns48wXXNKI4a5h9lpe5mAWnJ/HeDFRAFKbFFgwgrTo36AIzVyZoxLSWaLgv1FaFu33fDNufgbZimoWgvXTaVdC45C0Vj75ZoCxDPpRebgu+2hhoEkzeT0oIwPJFt6DC6sCzkE5Hu31y97KY14wF+iemhkymyXaaYnEFtOULNGq08lXF4zw+sx2CTsChs6hnRrdYtjRU1RmjrjejTS1G/fNSwj/w4j+ljl/CctcTcvx+iR+UaeV6cJAVx+4PUVpS6qLqm5q732vk1EYuRUpUc3NfUGfejpp3jbVHSVf3wLWKoAaB7z6BBbrpcoEsTsu8sI7hRKxXm6cTIwHA6dbeJyGadjUB3YYL4qKx5BKb/27l9igP4DyZLDwzXCb/UHtHmMnQo4jZnB/UmvNBg57kC8UyuDvVsBLy92MZsAHESzVUlwkBOhBXdtACrY1VJcos+8VX70pGPhR4DCX+5tiFKlE0AM0ql1SdbiiMwcxZ/0Z8Lp+YeeKuOtU8oWvdz/yo+uUS6gu6JuHerww90OZI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(7416014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHVCQ3NQaDJseldPNVpDWGJJemhsRmJINWxuTmxkaXhISCt4OEpJOCtDdGI5?=
 =?utf-8?B?c0NJd2xLeU9yUC9ZcXFUSFUzUGx1UEJEalZaWXEzZzgvZGE2dTZZckNCYko4?=
 =?utf-8?B?RlNOdEtHK1FacEJGMDdOV0EyNm9YRWdyYlJyektZZ1l0elhQVHE0V0VxOW9C?=
 =?utf-8?B?b3A3ZE1uaHVNd21TdnVUTnhjdXhta01JWGU1cWxMN0Z0UXJZZnVpam5USExQ?=
 =?utf-8?B?WmJOb3pPQXBHSkFRd2lsMXRKVlZQQTJxSk51VWxwZGV2S2R3ZkJSK0RQdUhK?=
 =?utf-8?B?V1pXaDRqV2JISEduWWtrVS91bTlkRGFSN2ZnV0JRcGZjUGZXOXpXTHhQWVZY?=
 =?utf-8?B?VVhpZFhXcUtOTXd1OVluSkxoY3ZybHhXaU55N1QxTmE3QUVlNUt0OHpUcWp1?=
 =?utf-8?B?dlVISlI2WFUzRHBZRnE5dGhLYW1vK29VQzFubGpSUE5MZnlEUVdBUGswbEFn?=
 =?utf-8?B?eXRwRVZ3ZkJGVmRQSWkwbG40ZEx1c1hWRk9kNXU3TmF3MUZWUzZ2anVHbFZy?=
 =?utf-8?B?emE0ZXZ5di9NazJkcmZiRStIYi8yaTJKaFhYVURlZ3Npc2N4RHZoSWRreTFz?=
 =?utf-8?B?Snk1T0t1NXZRbG9EM2JyZDNMSUxYOVllc1ZVOFlNTXNSdmhPejA2TFFjQm9u?=
 =?utf-8?B?a1Y1UGtnUjdGQnRvWUJkdTEyd3F4RW9mWjE3SXpFb0hpQWlBZUx6cnA4bFI4?=
 =?utf-8?B?Y3JXRkZOYlNIOTRlRW12ek9JZ01zcWpYTUR4S01iZmdvQ0tVb2Z3WFE3WlRC?=
 =?utf-8?B?bWhRdTFJMDVjOUJmVmZtcFJOTTNEekx4L1ZqTmZxb2Z4TEI2ZnIzZGVXQlEy?=
 =?utf-8?B?ZEZFRTVWQm5yTjFnZTN4ZWRXTHFiZytUY3J3bkZhNjRpblN5UWJDQ25JNzQ2?=
 =?utf-8?B?TjQ3QWJKcjNybnlETFMwa0ZmekRmWUFabjhIbXpTcHNIcHB3RFppdTlxSTM5?=
 =?utf-8?B?WldPSFVEZkp1eU81TDRRZ3ZsdHlBTFp2c1hscGVLVC9vRFNhUTQ5UUp0RXpS?=
 =?utf-8?B?bUVma1hrY2EvYThsRkdRbGN3V1BXODFUMkx6czk3WC82K01NNG9mSUh5M3hS?=
 =?utf-8?B?UzMwYThpNklBR0lZUzdNajZ5RVZJZzROdDN4UXZQcmFlaUNJektNZ2o5ZXNo?=
 =?utf-8?B?emxPd0pERWgyN1V1MkROOE11bVVBVGd4VDZXRmlDRVhPYlVoRGJjd1NEWmJV?=
 =?utf-8?B?cFlvQkZNTXhtZUJnY0Q0OFNZcnNDSGRTSkRrOFlNVlZQNVFwbTBBVStBakc5?=
 =?utf-8?B?d0pSWEM1VWVaMjArdUhjSmxiNHdGajVRbTFuSFdmb28xUElEdGlXaUxVQkdv?=
 =?utf-8?B?T3RSMzNlbVJibkMwYXFrakRINnRUWWVJdjhTdW5oNXdaNTBsalNMZlRCTTZ0?=
 =?utf-8?B?bkVGTjFrSXI4TFlaVm5KMU51TG16bFdsMkMxWER4RENxMEs0bTU1djFTVE5a?=
 =?utf-8?B?VDRkMEtQd255L3p4QjdsUFM2UjNGSXVRbXIrWGZnRzZJc0tkWExUamxzZHJS?=
 =?utf-8?B?Zkw5UTkwb3pqajJKWnlyZ1BuMklIcEZieHRNanZXOWkwV29vd2Z1QWJoSVp0?=
 =?utf-8?B?bUpUU1hIVGlpbFczb3ZCSVNoWHhBOFNZQ213dmVPNXhQZFZYcG9obXlkUi85?=
 =?utf-8?B?dzhCUEtTaDBPNk5MY01Rc0tGMVdBUWVWaTdycVVsbWhoNDRDZFNEa3dEY0RZ?=
 =?utf-8?B?RWlyaXpTZGpWRHBOeTNkUnhabEQ5N0JINVJ4TUpmQzgyVjhiZlNFcDl4TXdt?=
 =?utf-8?B?djJUdC9KNmxiTHovTnR2RFZkQ3FMZzdLYkJiTVFqOGN4cEZyRm9xRXZsTGZt?=
 =?utf-8?B?czBuMCtuTC96NjFYZjdNTzRhVjhrTGUyV2EvcS9hQ1BGVHVQRDZLM2FMTVow?=
 =?utf-8?B?L1FrVE9XK1FEV2tFRG5nQVhET093OGtONk81N1pwaWN6QlVoUkRzU1dBRTV6?=
 =?utf-8?B?TG1HYUEwYnFETEd3ZXRTaVNnbFc5blZlTllMamtSN2RFSnp6RG9DdWVFZmJE?=
 =?utf-8?B?R0pBR0NaZzcwdnpwS1RJakltTmZHNFczMjNpbHdqQUk5bUtlcjYxNk42R2JR?=
 =?utf-8?B?eVh5aVB1V0JSVlBVYVpoYnpzVmxOSUxrSVozZ29KMVExL1FhN0ZPM0RKY1lk?=
 =?utf-8?B?blVIODdqUEhRZEZlWHgwWU5NWm0yNFF5RXhpaUIyamhiK05tK1NteENJazhI?=
 =?utf-8?B?Rlp0MUMxaW8yeDgzMmhWRjF2Vm5vaTFmY3VpbzhMaWI1SUZoRnNGeVFOakM1?=
 =?utf-8?B?UURmZEFYR3pYczJ5UVhMQ3BialVQcVFueS9GUHd0RnFIWW44QitSTWVjWjRk?=
 =?utf-8?B?YWoyUWNFajM2OXVXcHRVL2Z5eENKQVIyd3l6UFMvdkZzd01rem9ZQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6676b693-8a60-4a4f-8dd0-08de8004a207
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 06:57:32.2808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOtp1HRP/z+KgMHgQRTOOAYECMbCvIufaZQr0GxG8Bs724aiMnrClMF3p/xlB2dg4tKgRoF0qDN1yI2TXu2ZsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997

From: Peng Fan <peng.fan@nxp.com>

Parse the Spread Spectrum Configuration(SSC) from device tree and configure
them before using the clock.

Each SSC is three u32 elements which means '<modfreq spreaddepth
modmethod>', so assigned-clock-sscs is an array of multiple three u32
elements.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Sebin Francis <sebin.francis@ti.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/clk-conf.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
index 303a0bb26e54a95655ce094a35b989c97ebc6fd8..550b8ae375a2cae8aa6ca22152753ce8d95332b5 100644
--- a/drivers/clk/clk-conf.c
+++ b/drivers/clk/clk-conf.c
@@ -155,6 +155,78 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
 	return 0;
 }
 
+static int __set_clk_spread_spectrum(struct device_node *node, bool clk_supplier)
+{
+	u32 elem_size = sizeof(struct clk_spread_spectrum);
+	struct clk_spread_spectrum *sscs;
+	struct of_phandle_args clkspec;
+	int rc, count, index;
+	struct clk *clk;
+
+	/* modfreq, spreadPercent, modmethod */
+	count = of_property_count_elems_of_size(node, "assigned-clock-sscs", elem_size);
+	if (count <= 0)
+		return 0;
+
+	sscs = kcalloc(count, elem_size, GFP_KERNEL);
+	if (!sscs)
+		return -ENOMEM;
+
+	rc = of_property_read_u32_array(node, "assigned-clock-sscs", (u32 *)sscs,
+					count * 3);
+	if (rc)
+		goto free_sscs;
+
+	for (index = 0; index < count; index++) {
+		struct clk_spread_spectrum *conf = &sscs[index];
+		struct clk_hw *hw;
+
+		if (!conf->modfreq_hz && !conf->spread_bp && !conf->method)
+			continue;
+
+		rc = of_parse_phandle_with_args(node, "assigned-clocks", "#clock-cells",
+						index, &clkspec);
+		if (rc < 0) {
+			/* skip empty (null) phandles */
+			if (rc == -ENOENT) {
+				rc = 0;
+				continue;
+			} else
+				goto free_sscs;
+		}
+
+		if (clkspec.np == node && !clk_supplier) {
+			of_node_put(clkspec.np);
+			goto free_sscs;
+		}
+
+		clk = of_clk_get_from_provider(&clkspec);
+		of_node_put(clkspec.np);
+		if (IS_ERR(clk)) {
+			if (PTR_ERR(clk) != -EPROBE_DEFER)
+				pr_warn("clk: couldn't get clock %d for %pOF\n",
+					index, node);
+			rc = PTR_ERR(clk);
+			goto free_sscs;
+		}
+
+		hw = __clk_get_hw(clk);
+		rc = clk_hw_set_spread_spectrum(hw, conf);
+		if (rc < 0) {
+			pr_err("clk: couldn't set %s clk spread spectrum %u %u %u: %d\n",
+			       __clk_get_name(clk), conf->modfreq_hz, conf->spread_bp,
+			       conf->method, rc);
+			/* Do not fail */
+			rc = 0;
+		}
+		clk_put(clk);
+	}
+
+free_sscs:
+	kfree(sscs);
+	return rc;
+}
+
 /**
  * of_clk_set_defaults() - parse and set assigned clocks configuration
  * @node: device node to apply clock settings for
@@ -174,6 +246,10 @@ int of_clk_set_defaults(struct device_node *node, bool clk_supplier)
 	if (!node)
 		return 0;
 
+	rc = __set_clk_spread_spectrum(node, clk_supplier);
+	if (rc < 0)
+		return rc;
+
 	rc = __set_clk_parents(node, clk_supplier);
 	if (rc < 0)
 		return rc;

-- 
2.37.1

