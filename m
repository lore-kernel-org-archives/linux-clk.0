Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010056.outbound.protection.outlook.com [52.101.69.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63372280035;
	Mon,  2 Mar 2026 15:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772463605; cv=fail; b=pwh5q4d+mqwE0gKYzx0e6F+KSz0s+6aR+38LVItXAQFbGfxcIxaZpGd02h/Fj3EVKF2z6JI7DB8+GxN52bYpZiFMmInA3iVZ4X2AN9mMvT2j31up1k/tiCDJc8gdOohD7HnEFkv8vAJaQvjHHtOg+UbGCQGUM391yDOLyrfgLCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772463605; c=relaxed/simple;
	bh=3HptXKt/4iO51FKUPRBtm6nMsR3DFpWhRUYjRtXyTEI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DeVAiH9J+Io8rB85FjuXU8RblIbDKaGTTcL8GNevUIAyuxU1l/9q87VLp0hwH2qpyIY3LfXa/oC2n4nw126c+Q65W4VUE5qVi5aKzq+c0Bc7UYth/hJNWyO4VIKw3BHLPbacOP0YeWuWQKipy3YqjCW9nmkCjXGfTRd9C8tdVec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DAzi28uk; arc=fail smtp.client-ip=52.101.69.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DAzi28uk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjW8HpD1hqke4orc+aeiIEtamu4ngu43CoYAuSCBQqC09q9RueAgg8y964LU2zKuTUYZh5nucD/TtveDJ55cFsZ0PUvy+CYtkT8OnoFz0NHx0hP8GBpXwkB2cdIteyNwB25apFEle+g/IhX/RzS75hmp11EuzIYC33GWVCdV3ednMfiwQVAvlA5EG9NSUFRl9STF4ppkNzjH7s8J3OHf8Uv1OdpAH+IA0o6a82GxyslMJM1LNb2N5e2s/GYIJRfOhUfH+49E1nqzPWhVPnWdVQbuWwKh1+ecgz4vLVY6JgZtySS7AlgXbWEBDGpT1OKWzHl2+wDCTYjhpNm+NP+Omw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvv0Pno5RyrKuhLVC0zF7WPwKyD7sDK3n9uPkiWdWuQ=;
 b=d9uiSys0zNJoAI2dfCBmi5/209qch4y1USxmbimumDCs4lmRsRIPAXTA0XtyVnpmrNEt253hVIzJR09FHF0I8WQtTe83xIswVuHpqDQFkb82Zd+SPqQmHKZ4uyP9JhFW4CLm+1rHPIyAprfnUtrN0kdxqUB52+/MmVP6m3J5B6047MGF5GWRq/9YktiEPdnhHnyvpL7OL1xAeO3+kRMwK04QZu29Rrgky+D1BWVYHy2WIFGQw+jZf95CaYqujnhzAWgPQnBLqU9vV7R1uvjZhFJ91G0/aWmhCX9AmIk8iRo4X5uSpGiWqy6lm7knwareLxvIccm/AKME5zirN1k7vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvv0Pno5RyrKuhLVC0zF7WPwKyD7sDK3n9uPkiWdWuQ=;
 b=DAzi28ukGzHBxZRbWazgAx5PvAD0mOO3vBXOAzNKbmYKsthrXHg6TBraFSJKw2Q162af1Ho2dAEBUHjnTBbopDbYKZQ7y+FWkKq859HzyIVahZdRaUT1o/mXNEUSYrHcxg8i+5qVOjIhZYEvbc9c1Ad29/nWTXRabdDfjexR/OTi1IvY2ivQiofifL1nkaq+gO0QNdqPKAlN6ipfUrZnq+udFlV7PHY3shOS8ZlZCdyCJ5U+Zi0VuDkH6RcihtNhig/el5E/ewWk+n0Kv7zZqCP9/e69sXG9Ynh3UShGtM7LAdDUvC8B5lirvSzD+DUE/AqO0Bl7oSnX3TK0I0qkaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB12255.eurprd04.prod.outlook.com (2603:10a6:800:304::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 15:00:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Mon, 2 Mar 2026
 15:00:01 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 02 Mar 2026 23:01:17 +0800
Subject: [PATCH v8 3/6] clk: conf: Support assigned-clock-sscs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-clk-ssc-v7-1-v8-3-2356443a7e4c@nxp.com>
References: <20260302-clk-ssc-v7-1-v8-0-2356443a7e4c@nxp.com>
In-Reply-To: <20260302-clk-ssc-v7-1-v8-0-2356443a7e4c@nxp.com>
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
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB12255:EE_
X-MS-Office365-Filtering-Correlation-Id: 260968fc-7250-45e7-becd-08de786c610f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	a7CTCuQ/J0CmN0VPncs7aFMiKAN9yaOhtdjREowGcqUFIzyorTsINovYD5GZJshOaH8diqJIl5Cf/EbuM3geQudPuESkuNKulNjoFQOK+ksTk0CPqcjzI0Mi7iy22qMiuSzcGB9ET5V6P4a8K91kO3a445OHMfijqGm6XQnpektwuWcbDCZNUINDtc9867r00MriKXX/gnmThjBn+zAmPPVQwk8j46vB1fDFcUVuB31Jzurg+NEmR4hPo3z+OAwjjzFIaJciGzUTIm7jM1IudYqiKh3+4g/3SLg7i8FnXEka8baqiX/KDwXiQuTKKOU1GhmVQmt/hFconrgbVLXo65UPw2Db64NYDHi2EECOigSZZ3PAvOvlDQkXR/WLjx+lXTu7PvdX2hp+DqSSzVTHvZ6/Y0jVDeYQEhxYb8OCNJ/Etskr7Cv3hBdT0I70aH4LWYvda/5G5oVG0Fi+VlcXN8yjcpqiJnYtn2zwng1EZXzXPwGEYOvIqgTf5wBIBak5kY2OovdoJ8UYW5iQMXJUDsV7mWhxPhNrkT+3uxLyzD5nd3RVhuNU4is9O5der+q6dbkD0y3WFaSeo4tJKy9BHQ+MeDjwHYrt5/NRWxqeTw3cDJVWcqdA2ZcHJI7696CKpBJdcTopWcct2TsaVzEzKNTXs5aTet3ARP2/EL3oYfNTsvsymMyCBk2r9arpFAfyZdrFsp7+bmoOc82BtlYJz8Gn5JjcuRDrrwTr+aj0n6sfrCfGKGYIMAoQevU4koUXizgUOZ9eLIofNiAGW0avq8c6W1/BgirlwJCRvryCNuc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDZOL1M5dDZ3eVRLQlpvNzU3aUxGaitLdC9CVmlVdE56RzRzVEFJa1pvV1ZQ?=
 =?utf-8?B?bkRMNDdXd1NMY3lLMWZBQnZ2NVh0RFpPaStPbFNFemYzQWIxemhVVGFndG15?=
 =?utf-8?B?bkV1VXd3TzlwQWt0aXNqRmgwb0VsbDlYdkQ5djBoNmNJY2ZjYWN3Q3Nsa21I?=
 =?utf-8?B?VDhiamJVZ3cyV3Zndm9GL1Bkc1d3N0hzdmZBNDJqblc1ekpQRWZMNVBBREc4?=
 =?utf-8?B?bkRQaFRqWmNLNmg3TGZpQ3psK3IrZzQwcGo1cjJFRG1odEJIK3lHSHZzY3FR?=
 =?utf-8?B?T0JWK2d5dFJTQldQUEcwVVpKdTdJdER2UU4yTnRhNlM5NCtCTGJua3kySXQ5?=
 =?utf-8?B?czlFRDR2MTNtcXdJZjM1WDhkbEMwRjkzUEN2dTJ3UEJ6blY3SUgxU1VzajdI?=
 =?utf-8?B?a291enVpSGZGLytoWC8yQ1RqZGZkdk9OQlo4SkNHcFNZbmFYQ2szOXJCV3Ja?=
 =?utf-8?B?R2xQLzRnUWVkNFgzOWt4aVVlazdTUGwreW1ZaENhVVp1T1g2NVh3ZFNseWNJ?=
 =?utf-8?B?aGlYWHRCMjNzS3h5Y2JSZGlFVEREYmw5TzQzVEtEYkhvN1ljVDJxNHdyc1hG?=
 =?utf-8?B?anJwVEJ3M0xKZk5YZUYzTUhQQnYvRmpRdm5pc2E4UmhQejlnNjZLVG01NjZy?=
 =?utf-8?B?MzlDbE5NZDNobHBCcG9rV3NTSnJnMzdlcDFqNDFUNmZQaUo0K2VmUjdvbThI?=
 =?utf-8?B?M3VWK2ZiZEEveUVZaENkNDh6UnRMS2FnWFRhUmRtNmxrcjEzbTlTSVZSanh5?=
 =?utf-8?B?QTNUaDJBZzVlRDA3WnRBQ0xvOTlWRGNDdGFIRmc3Y1hMV2pHQS9EaGZGaVhs?=
 =?utf-8?B?QlVRWWVkTHo2Vm1mRDUyS29YUkwxdWJaZE9VaEJjR08rUjFEY0NNVUg5NW11?=
 =?utf-8?B?bHVXK2J2OEhQazc0VHg3Y3lHNmxXVjhBa0NwZVB5S2dFa0JRaXFaWndQaVZ1?=
 =?utf-8?B?Uk16VC9LTlcxdHNCeDlWVTJDNmZhMVIzc21acFhwaW9SaWlBZ2pPUUpMbCtM?=
 =?utf-8?B?ajY5YnNya2dib2h1TzlzcXdKY0JVK1B0RENTMDd1WVh1YmJlMkNodTBPM2hL?=
 =?utf-8?B?NWJ5RDJTbHlYRnhhWEl6ODgyMWpDZzNmQWFUZ3VlWmxWSGlmTUJnUGNLenp1?=
 =?utf-8?B?Y1BoZ3RWU2dWQkZNV2pKV3JnbStTejFEODcwMVBVY01PYmpobWVzTlhIcFhy?=
 =?utf-8?B?TlhTa201N1VyQzNUdXFjTS9pV2tYS2dvdG94ZzV6NERyWUN0WHo3V3o0bE9U?=
 =?utf-8?B?dENMTS9JdUdqTXZNQTZPbEwvTS9zUE9sZk1LdkUyYzhrY2RzL3RXUHpvazNW?=
 =?utf-8?B?NlpOL2dtY3JlbVFrZ1ZjRTRnaEZ0NEFVdi93UjJ3Zmgrd1pOdHZMbnZZcFVv?=
 =?utf-8?B?cStscllMdTVaTmJYdGV4OTNpTUZVOXVQSXJXdjdOY3dadUdLVHpKQVgxWmxm?=
 =?utf-8?B?Y2dBaWloSGEvU1Ntd2ZHemVmM2l4cTlXWWxORTQ2SWhSOGVhNlc1UDJIdEhi?=
 =?utf-8?B?ZmdQNUFTSCtUQytEUnd0TXNXVmhmSERwNDZjR2NwY3hIcFRneW95S2dJbyt0?=
 =?utf-8?B?QkNYY1VzckFsMjkrV2hpY3ZVUmdJN01PaVA5M3oxUEVZL1J4aUhqeWNENjZI?=
 =?utf-8?B?KzF4SGRUK2poYlFCUlQ2em9DenZFWnJ1cWxpTU1aMEVXZ21qYTh1ekRHR2Mw?=
 =?utf-8?B?VVExRUNqb3VxZzZMOTBWWDd4eHpXWHpiNzdKM0Q1d1BVcFk4dDlDUTJsNVVt?=
 =?utf-8?B?SmxrZXFvQ0NYS1BLbHRCSFlORUFBMWtUUitNT09QS0hoWlE5eVlBTWtZeVJ2?=
 =?utf-8?B?SzBOZWt3Q1J5MkVKY2txWDZzSkxtcTVkRUFjSi91UDJvU0p4ZnVtemF3K21C?=
 =?utf-8?B?OW40Z0lOMmJVc2xJdTFPak40b2tzVDFmTzk1NmhoRjF0NmRTZjlhdUlzT0c3?=
 =?utf-8?B?czNEcmlJT2FIQk5obnYyb3UvY24vY25iSEoySlpodHpYbDZTNmtQOVBwYVpp?=
 =?utf-8?B?SHpCbVJQaGxaZUx3eDUyZDJ2RHlxVUQ5NUwydjRkQ0wrWVBHZ1NIUm5kc0dI?=
 =?utf-8?B?OUwybTBtTVpxdnBaa0RzbnlCRFR3MzFnN2lVMko0eWcwamZEWXFhemgzUks3?=
 =?utf-8?B?NXlsS3F1elZ1YXdIRENsNGg1dlc5eTFXZjlpT2pjZVJlN1NBKzgrTFhKWHhI?=
 =?utf-8?B?UGZyQXgwa1FLcFNjRXNZTW45Tk1wRENZYThTbWo4Z040UXNoK2lXOVFEaklS?=
 =?utf-8?B?bDIyWTJvRE9qNWlNWi9sYTFUVVJuMXd2azhVREcxWTYvNHNmYkwybGtEc1ZQ?=
 =?utf-8?B?TVZtWkpVdW10Mk02WWpKWTFYM2VqT1hvc0hMQlJBRFhiODVUczVHdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 260968fc-7250-45e7-becd-08de786c610f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 15:00:01.4860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zWVM9MtFGdYi2dkbbsvquWNXfa/MvOkD+bV04X8vm+ZSJAHq2HWFmsHZnU1YPQ7oSYpZ0ojun/j4JgdBl58Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12255

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
 drivers/clk/clk-conf.c | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
index 303a0bb26e54a95655ce094a35b989c97ebc6fd8..cdc7631f2e159bdaa6829ba5a3b5695dc1c31423 100644
--- a/drivers/clk/clk-conf.c
+++ b/drivers/clk/clk-conf.c
@@ -155,6 +155,77 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
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
+			if (rc == -ENOENT)
+				continue;
+			else
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
@@ -174,6 +245,10 @@ int of_clk_set_defaults(struct device_node *node, bool clk_supplier)
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

