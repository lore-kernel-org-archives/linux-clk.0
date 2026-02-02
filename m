Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011032.outbound.protection.outlook.com [52.101.65.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D921E2606;
	Mon,  2 Feb 2026 02:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769997782; cv=fail; b=Mcm52eToMAEPNVj1dU/t3/msj/Kvvq8XVn0L3k8eQRw3gvAF6oXmkol15UV27vkiv3Mgohv3QLPMss5IO3eFWmthiboTN+VHOtpqg8gE6R7tXUYifkpcH3Iks12OzzbVQ7uAt+DPbZSSCoJ9HywViG01gDYe0tQVLWt9xF3ON0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769997782; c=relaxed/simple;
	bh=irubyfdoe0+EBgukJKYpAKeKiyNZKH5WIHxWhjEWFh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XhP9tkOMX4W/QLTTBbv9RCxHLaEFViByOhdIjwiVkWaTYlRdnDY6PBnUNLqf/OACt5k0/2uwJCfQ7xxKKoyz5b6TJhO+1xShB7Wu1PDL1enxuk7VXpOD4pBeSBqj4FrdAtTCEfYM1eIDhoZmA44npPrB9EHFeGBnYBaeuagmziE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RjC4V9a+; arc=fail smtp.client-ip=52.101.65.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RjC4V9a+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPvcqS8z4EZz3vZxQk4uXVsR2x4zls113aMRZ+4oSPH0/GQT5HPP29kLvbYsUCw/+5bGpMPGId3Abw0XfXxgLoVG2+fkTrAdTKjKSjMQI+XYZ5QMv5waBTC3ji488q/Ziv+Sl42b8EsY59odQoNWWfYaJhK/JnI8rtMUhx+RgFCjdnHc+ql8cwTdudXn1mtReJp8CaN5kLn/TlwkPxiyXjlYH0LOyqMOUqrrPqrzatU7s/8i8bU9jLxeW0NtrNlEHoCQsmREiBLpAYLccivSCqavBm+hBFSk+pnJPywxyBAp1zvdixv2uu8hBn0YkYjT/CZm1PkNUho3diol4owrTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xfSNAWBEuDeBqtzdxihgi7ryprX2HV31X6b3K/uyl4=;
 b=iZA/bWYzYQ62+4Kw+LFn7ZCfX7AKchhP8hTi8dbpbUAhcD8ZKkE8JGcvsZcunW8m+WKXFzQ1azo0Vwjle7ka902vg0ZuprIKRz5BTQyo8ZG7vspS7oi3+31mTD2AwfK7ZJZP3goiCcP8geauJBNlwNABoXltC77P56ydojOvaaVUrm1sxIweYL1RGT0gf1mGsbH4NwAdeP50D7xf2M/VXGGgo/tTh3zlzOebCPBLazvL6gKxNCDU9QwmpdqLI8FqI43F0CzLayIgOFDELBM/T9/Tqlq1psrnjz0pewvkSlP6sFkf4epLbKVQFmj7jS+jxuj1eRzqUSK2jSLKLJQy2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xfSNAWBEuDeBqtzdxihgi7ryprX2HV31X6b3K/uyl4=;
 b=RjC4V9a+KroZTNM9rZiW9KVV630uMmttWm4rRGUT75QR7iUzZfPnugobx841664CoC2H0VfSesJGKAMhcb52oBN2O1RVfbcbZWbQAj7hNjoT6egH40yIvH0q6WpbwG1i4ROL7nIAAn+TClrM/Yolm/htBE7XbKMZ+Cp+8/rHQPfroNSWm08jQwaMqsQbWUGs4/0RizXwx6Gb21PzKCh4b9sUyZykMfNS90by61/AFdKg2Wb5rVxlYTElTNYZwt0Al7LZoDWxYmzhKE2WqMOkhc8wT+vvmb8aXOzk2mAKIoqs4DeXI8F/irgcEHCpCB0Vr0knknTfRE3goFxVOANJFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA3PR04MB11105.eurprd04.prod.outlook.com (2603:10a6:102:4aa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Mon, 2 Feb
 2026 02:02:56 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Mon, 2 Feb 2026
 02:02:56 +0000
Date: Mon, 2 Feb 2026 10:04:32 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.li@nxp.com>, Felix Gu <ustc.gu@gmail.com>
Cc: Felix Gu <ustc.gu@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Akshay Bhat <akshay.bhat@timesys.com>,
	Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: imx: imx6q: Fix device node reference leak
 in pll6_bypassed()
Message-ID: <aYAGMAE7ppXP/lbR@shlinux89>
References: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
 <20260131-clk-imx6q-v2-1-70471ddc99e0@gmail.com>
 <aX4q+W3Sjx5SRHrC@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aX4q+W3Sjx5SRHrC@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI2PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA3PR04MB11105:EE_
X-MS-Office365-Filtering-Correlation-Id: 26ae2196-3f67-48fe-ba1b-08de61ff2e72
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|52116014|376014|7416014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Gp7/MclUpGbAHyWvtHTgsBCW8LYHEl5naNwuFCvhyX05TF9R6Q9PDLwtGNk/?=
 =?us-ascii?Q?jVg0XaYu9Y9Hl77L10dL+aLrEnsUV435hAYy85XK9vsctH0Hzb15k9asxCMp?=
 =?us-ascii?Q?ivxPhuZyGe9rJ6rMvA5sJp9SnukqprMg5Rd4o5t0mOUvccBidrIe+L4OZ0h4?=
 =?us-ascii?Q?PpPnhOMnA+lDeyhaz9a4uRlViZeYoaFMVX4Ncpsikkdvt05uVs2SffAwVQLM?=
 =?us-ascii?Q?R8YVkudSkjVysdmzLMtWA3kk/wBB7kBNWJkXfhGSeBXgy6jqX7W4LkE6SGzK?=
 =?us-ascii?Q?UEa0Yav+fwAzATSywGuyiwPew2ESLZW4ml2kFPjaVtdTKgVvnyRlmu95nFEn?=
 =?us-ascii?Q?UPM21zgWhjGkOM1ZXAhwhBnmnh9LYMVKEsm6liUivbMU9wWe8GPJCuPHkkNr?=
 =?us-ascii?Q?ozrM75XAdknhNlLGLHSku5m/py+LfLk4Y9e3f+8o9FSowARFRmycnIqv378C?=
 =?us-ascii?Q?P90X3Ve4RCUvjVF3SgPTG5J0oEOsK/8WjoE9u+HiDTwO9gMyhbBJDXfmeLH0?=
 =?us-ascii?Q?kQbKu5U3UibDMjQh0GF6EleHPdLB996c8fLl+zFChXZZ74++cGqnjnbx88aN?=
 =?us-ascii?Q?w72NWI7MyWdcnweW8hhaRNIHWEA7VKO8wORTD8Ka9AF9sJ2vUFULwrUgG6ga?=
 =?us-ascii?Q?eewPOJbFLMtWQysJ1P7ZYlRTLmHr1o2l27ivhd0qU7aUSzDdiTkFJvzVyH+u?=
 =?us-ascii?Q?TxsINbo1nROr1ERz5F+w5zq+txZTjrqx20WE8hJH4x5tF/BheQEsUdFXOFHx?=
 =?us-ascii?Q?Nr6VBi3y2ye4ux+7sGQEHv6NF7thkIYm6nVoRH76CggdWHt6+t3effQiCBGQ?=
 =?us-ascii?Q?WN6GsOlB+8PA1vb7TtP8rJnZd5xlOIflnWennb7hmLz0YLM4+8afPOpKetjs?=
 =?us-ascii?Q?y7rh7o2Dts4o1DeygpqPkOCVZ63JZsdSmn8OB+2rMy95G/CVw0zPn5tQTlVu?=
 =?us-ascii?Q?5Znyhn+XnLl9pM5iDN995poSa2MMvNvaxQkWVdynollIDyNc49OgKXuxqFDA?=
 =?us-ascii?Q?ZAvaGxP3Uvzu2zbMBFiZC4DfzW22ptNrmX4QQwXiPNE6vrJyviaDR1T0z5a4?=
 =?us-ascii?Q?4mQBw5H99xFacpPnhs49zxJdojuNjl4Ke0aqZrrhHjACNt+fpzlPdt3Dvh5u?=
 =?us-ascii?Q?7BlhKeNaNj8tbl6n9NPEAKauX6oGcNIYB1e0DU3W6vo3QRF2UZnRIYgOfJs9?=
 =?us-ascii?Q?msjPFfeinsNYFl1ltMaaGgBtjSe5pzMoH3kP+/dnYKXFbOl7Z3EDJ8jx2wUN?=
 =?us-ascii?Q?PJeVt+WUzPdyI24DkK+xGelfMs8oXQ5H8WyT6aJUL0kOU068cKGYSLhRh3rt?=
 =?us-ascii?Q?XF5MtzD9xhlpmSAdiPK5rpDgGDTpNDXxlTlran6jQufE/G/mt+gnCuvMS4DN?=
 =?us-ascii?Q?BVujhvBRTYGyC/YfwyazRNm4nzvK8zeyZptIuHm0HbERtJAQv2FChdULetwk?=
 =?us-ascii?Q?kepxO+cgdEZme2HBtENCFhyIxfZsqOLg2LdeZktrOBSKGkcNWO1cKirQkaCn?=
 =?us-ascii?Q?9fHUswVFmpCqTysrCKavhCgAnhG94aRQnw8+9Z4rZhB6Ni5GUwwJ1W1VH54W?=
 =?us-ascii?Q?Nhqr+gjRHf7anyFojLVe6kySw+3NMfv1idLbBk/yVR6CXGnb0oF+nzh2FrTE?=
 =?us-ascii?Q?BzNkaYBkoeKeNggtDpGaQQA=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(7416014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Z9Ak1mmQiUDqkFtyb6qTuM7EI9SSW8MmXgE89GW1Dr46GThvZo7Y5sqO2w3d?=
 =?us-ascii?Q?9HhpWZKnptRsA7BoPPutIQwHfnwY/vMRURF/xZDx3/KWG1PnsWDgE97g+sJp?=
 =?us-ascii?Q?tfPvGiUQMhSDKT6yjBHZuDN46v+Gf/bWPFfK+i8eryaBIKQyv2bfiGoTAsgV?=
 =?us-ascii?Q?Lq9ysEj9LNGTckF4CbY7DWGElpFpn1PFNZNy1T8kUbVPyO2CrlAKGMpstUjn?=
 =?us-ascii?Q?hVVbdHEfTujQcgdiq3paq3ZG8hQX3KdAuD0UJ+GdH1Xp+PGx8z6HaHAMCShu?=
 =?us-ascii?Q?JcIq2wBIm6mXezXxJ2wUETH6xop+EuQOrJgVvfjnuOldaxGvNM6dOLxlJuoe?=
 =?us-ascii?Q?cW+4hpLHScTF7h7z2Pa99O+vb7MoAC0xWcH0YlmJ3s6Beb+HZhzj3DGk68mI?=
 =?us-ascii?Q?W4Yvqj7f6Somecrn7yXtUuKaZWO6M1kZf5L2kuL9wKZkz8tEjVN/6zAjbUnP?=
 =?us-ascii?Q?XVTDZxnA7qdJJuuvV+tF/96Q+m45edeqoYkaUJYrvp1lfOIp/+e4+0CGnP/n?=
 =?us-ascii?Q?XI8go0bi5HxjiBQwNDMjOGRw8Hp4lstFm4oMPsUIzic29oRshqAZxv7Lvx7r?=
 =?us-ascii?Q?JwXM5ngIQLki3+169Qdrdrq2oGx+0AXVjr2iDQPbe6t4BToFsBY6OPdYL+SW?=
 =?us-ascii?Q?axA5Eydb2bKMtg7zocbqXBnc4hxHOTjs/46CWarbFobCLTwZNcEBYZrtbeB8?=
 =?us-ascii?Q?qOlVyJjd9SXNJmAz5bNvLFwou8L91FwS9sUulPmjGWvHOYIud3loUDcos4I6?=
 =?us-ascii?Q?mL0iC11g17R2JitmszxrgP2pliZH6vxkTAZYY4CaWWY+O7y3UExvt4+tzApV?=
 =?us-ascii?Q?6NhRxPqJEvJ0jXRWqhE08LD7JytJ6vFolY4CWVeWV8S9VzQRUd5crp+MnNwi?=
 =?us-ascii?Q?Aob8ryj+kjs2cw5LWftj4PhohKdY1wm1iaF0Hy9MID38vTeiHWYXEarYO1tp?=
 =?us-ascii?Q?RVi9TKTwa6CC8IDcTKHBir8wDW7HjqBkcOqKS8FZ/TPaU3xX+S3CJU8uSI/C?=
 =?us-ascii?Q?gQGfmxSZzvn4xcriaz9Dlg9PmH2Kzm54qRtFFyP00Qhm/tN7JVBkrLXepDIH?=
 =?us-ascii?Q?jfFSy6KItGWMF1XUtyCLKeDCHKwiErPotu/Ysk+sndppgkr08MoiYg0ls3pC?=
 =?us-ascii?Q?OFW3A6GBW4/Wf1WMU03xuIlX2KglMajmwap+lWEpTYDmMx/E55rXKMMeO/b7?=
 =?us-ascii?Q?3cNLZ4aiIyoF8SAp+Jq3j4apL6S26sEVkFGDzraw8ZdcrWl4obzH+yGXO2cG?=
 =?us-ascii?Q?HZ154X39k9YjHutXgDGcgEpfCFeBmKhy3DEdN99uXwck8GibDznANXH0rBWM?=
 =?us-ascii?Q?+paFyhVvglm8OMJ9eQlqPKawNLo+2vLYP6fNDHeXOEa4r/bOKd+cO8Wxp0jf?=
 =?us-ascii?Q?B1mSA5EWr8byRkgPiRCVUqdH7WVKyrvP3MtMzCh0G+l/nMewBJrq1+LhctGG?=
 =?us-ascii?Q?AbdA3q0BANTzpmWLHa71LFFvYa8cCwHnzj5wZ4ecPKlx797rjBMkxa3PAX1e?=
 =?us-ascii?Q?f0woEirQsJG7ZTDG8uibH6wtgBkrAe84lGECAmYOAA8DihbMJkWmgu6Cp5+Y?=
 =?us-ascii?Q?0nkIquxEvQDxmtoBpK6gAEhYltiGRx3nQEKDW1VsKExlgMMcReQ0EWcl5Mcr?=
 =?us-ascii?Q?Sfy4MLDM8ECLA7kVn66vt6idAo4J7hmhoBrX7aCWFtvfacqpknhunw00qzAh?=
 =?us-ascii?Q?5kAz0VuKmL/LsFCQEUTelyStCxJl+CxT36ze+SUrKQZc6jK9SU9CHAvgA+5Z?=
 =?us-ascii?Q?Pfn/yDV+yQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ae2196-3f67-48fe-ba1b-08de61ff2e72
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 02:02:56.0587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ra16dzdnd1Mz3Vk2m5EdBwuT/VGWWPoFrF42XRYlN+4BSZT5dh0dwd3U81Sc0X+gYDbTU/eW5Wz916Otuu5+mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11105

On Sat, Jan 31, 2026 at 11:16:57AM -0500, Frank Li wrote:
>On Sat, Jan 31, 2026 at 04:11:34PM +0800, Felix Gu wrote:
>> The function pll6_bypassed() calls of_parse_phandle_with_args()
>> but never calls of_node_put() to release the reference, causing
>> a memory leak.
>>
>> Fix this by adding proper cleanup calls on all exit paths.
>>
>> Fixes: 3cc48976e9763 ("clk: imx6q: handle ENET PLL bypass")
>> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
>> ---
>>  drivers/clk/imx/clk-imx6q.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
>> index bf4c1d9c9928..1d8e8f0891a3 100644
>> --- a/drivers/clk/imx/clk-imx6q.c
>> +++ b/drivers/clk/imx/clk-imx6q.c
>> @@ -238,8 +238,11 @@ static bool pll6_bypassed(struct device_node *node)
>>  			return false;
>>

One more comment:
Put one line here, "of_node_put", no need duplicate it in below.

>>  		if (clkspec.np == node &&
>> -		    clkspec.args[0] == IMX6QDL_PLL6_BYPASS)
>> +		    clkspec.args[0] == IMX6QDL_PLL6_BYPASS) {
>> +			of_node_put(clkspec.np);

Drop this change

>>  			break;
>> +		}
>> +		of_node_put(clkspec.np);

Ditto.

Regards,
Peng

>>  	}
>>
>>  	/* PLL6 bypass is not part of the assigned clock list */
>> @@ -249,6 +252,7 @@ static bool pll6_bypassed(struct device_node *node)
>>  	ret = of_parse_phandle_with_args(node, "assigned-clock-parents",
>>  					 "#clock-cells", index, &clkspec);
>>
>
>If ret is err, clkspec will not touched. So clkspec.np keep old value,
>of_node_put(clkspec.np) will put twice for previous np.
>
>So need add if (ret) check here. Or use difference variable clkspec with
>init 0.
>
>Frank
>
>> +	of_node_put(clkspec.np);
>>  	if (clkspec.args[0] != IMX6QDL_CLK_PLL6)
>>  		return true;
>>
>>
>> --
>> 2.43.0
>>
