Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011071.outbound.protection.outlook.com [52.101.65.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2C82F49FD;
	Tue,  3 Feb 2026 17:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770140057; cv=fail; b=B6OIS5I1eHILsDuEX9YM/gMd4ZYZ7ZGzHQVdgaphur3HDHcF6sEH9L1g5mrPQz1Cb+jM7q2yObrkwN34Wt2PWSAl66DSE0Wg7UBbndKD7Aa+SaULxWDYznrCWlENcKRKC2lLx1q2ZXoDSuu7Jm2ERa8iiv7Yr8VEP1TZUJzZZFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770140057; c=relaxed/simple;
	bh=gzbVFthI0K7pHQ7dck8uwpDkR55gPdyFWv96ppaz86k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WhYj+QXI6e3aV4jv19Sra1TO2tgAGTrAztdRHouGz3j4/C0zDgShkeQNve9S46CrCe/ZeV5TRpyLHWkYMAUMyRGMSeXgwCP7W5tW9I4dZ0G++TQ5NB2q3iBDWorWt6yvbzMT1yMoK+9skVALmmOty2od/+wZhpWCIRSyyHp1Zfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hUfYw29s; arc=fail smtp.client-ip=52.101.65.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hUfYw29s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i27MYvFFvITO6MXCE6+TJug55swYLsLOhlviIkr1G8HZ1G9sRCyOlM/1VWt4t0Mg7zHUR/BJ5qwoZNwv6fBTmjP8oNQzP5g0cPtEkINnWjZN0aHtFW5Zu1f95AGSCCXm0fnO1ey8kO0Hp8wPSpH5sxumQ0Y5neqoCWyL5LHmCC75lngk2ndjPDKTnRTXt5Ulk2P/x7gkD+VnnxyGnJ9wjg0h0DJTBKR1jrFL7Zwg10nOjuooBCPJYk4kY4/G8y/rv1GQLGdbJ2nsEddcmlPZxZ/CG+yJD92yN0PmBdF/wiciK7pT4bEfo+N9NqrfUAIR1I2j2PancmxXZXAx6WTIkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyvBmH1oghXBOj3mw4Q85rCWH3VF9Jp4o5G8qcfB1xw=;
 b=hUj8bovy6j8VPTiq66rSkeRKSOj57QZncI2FDoquE2nxY24uzLsw6Rv2UPn9NON+ZgDl2ALf7TvFaGDC9dNVlcT0MEl4Z806uD7TVQoClS/TwCe71YIqM9hSrnvEpJBJdCQPHPSvv5ODGnZG+m1Sn2iHU8Po8qDlBIzTTZzPu6QgJpF57o4q9ZNJdzQ6VgG1ZsKptgS/Aoy2Mf028Lp6AWMkBtxcOsqaoV5GjgmIA1OKEQ2KIRtIJBFa5nIF0JQfIEE1foJwyR5NnffOQncx105LSakecSjfbvgGShl2A6za3TZtSIsW3p3pbK0ChHdry+UUmRO/ZmhbvWdc37OJGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyvBmH1oghXBOj3mw4Q85rCWH3VF9Jp4o5G8qcfB1xw=;
 b=hUfYw29szenE/RZ0i34iST+fgCoFuX7QaHerdtNF/OS/N18/qzQwvkkvhfUW3lCM7hKh65jzFvWuDAxSZt8S2wkyWeTEjREl1TgMZOTp7hMfHzgRl1jbeoxc01Huu33wOd/QJvTb3+NHr9dMgwfTPa9nef/J+5AslXYYM4Lyw7xH03f9ccyrgn/IUDA18yf4wLCq7uqc3eqB+l0zfhZrwS6F/0k1fUfVjlu5RJMVkVSv8yau4QGZfYLaEzCsPCFZW5lQfFZYNUQgKU4o2RfjqqudQD5sgAWKf5MKhAdwRKvxp6pjpt8mfiReDaBuMIna8Vet7gB4z/kLa0bY3gGycQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB8550.eurprd04.prod.outlook.com (2603:10a6:10:2d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 3 Feb
 2026 17:34:13 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 17:34:13 +0000
Date: Tue, 3 Feb 2026 12:34:05 -0500
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
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
Subject: Re: [PATCH v3 2/2] clk: imx: imx6q: Fix device node reference leak
 in of_assigned_ldb_sels()
Message-ID: <aYIxjWYq3OwwmrTO@lizhi-Precision-Tower-5810>
References: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
 <20260203-clk-imx6q-v3-2-6cd2696bb371@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203-clk-imx6q-v3-2-6cd2696bb371@gmail.com>
X-ClientProxiedBy: PH1PEPF000132F9.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::2a) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: 75021229-ce15-497e-88b1-08de634a7258
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|19092799006|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?lMo7xO6ItmfDy6lN23C7UYd9VXYVPrF7HJwG51UWn7HUeOSCGmDKi6eUQdnj?=
 =?us-ascii?Q?KMc6UBGjaYvFJ8gHZpJWkrt8btdpuxLjz0Zg7FOZFc5n46PLFZBt6N9Gm8yr?=
 =?us-ascii?Q?oCXuc2h63Zz8nYNITgxtGQO6FVD1M67BV5H9qer5XJxcXsulGNR8wzRWVLw7?=
 =?us-ascii?Q?hHReFn62LQ2J6zW0zPZKQvDuki7jfXj0Fw8mkkOPkFnWmz6LC8HdDX3zl6P5?=
 =?us-ascii?Q?A1SKb5EmnizZd6Y3t3T4/gpzI4oLkaSg1+x6NzJOMg9ApY0j6jBfY/Xxc1JT?=
 =?us-ascii?Q?RW8Y28IreHY23Y7xXU8G9NlaPHeQ1WrcZ0BbYmTBkIcwsC8VmX71jN7ur7BC?=
 =?us-ascii?Q?9mQTWRUbUnPEGqH6SE9kL6a9zUz5L2gtjxF7ajOGF8cO/VmbwP5ennKq3wmf?=
 =?us-ascii?Q?W0eyjhlvzOrHpZqEIsWnlL3O6VBmkp0TYOpWpzPpQrx4rYHw4mkAu+qe/pEI?=
 =?us-ascii?Q?zzsBQVo8I+K38fBMZdhQLIFzefrI8lWgpJTFUKSVcRpRH+7XrlJ9zP2JbTH9?=
 =?us-ascii?Q?dUA7SvUsftFCw9/0XzfJDe+3TnfrylskhXqoPrNRB1lkGjZK/W8TO96BWNxi?=
 =?us-ascii?Q?eFjlVhoeHUHF76rcAJ4jajVymUyBFim5ecLrAc8XBxXV3KmzRTHcgQBUNL5l?=
 =?us-ascii?Q?/ili+gs/8dnmYHzrOuMvDhY2u2+BMWWTeALIaulQKq/0a7UuNCVysQbi5cWm?=
 =?us-ascii?Q?vqCBDXgfpyXaNq8jCsm4snP8jKg7zVWXGlReEhH+wop+iw0B0GHurn9CvIoP?=
 =?us-ascii?Q?v12WrHOvsvvhkCKnJ09FltBuEdMc3Kjn5r0q3Xh/7X3+9TQaCJE7OZTjXhfj?=
 =?us-ascii?Q?5dNQOQl33OOhWfg0RZQKxd4KpcImVgYr3KHBgL7aIp4gqhB0IsbywrIOpKrr?=
 =?us-ascii?Q?vJozQujgcal4TGLKLgeGr8ObW6+4DrWPhNE8++g41hLKMKc8WEbbXQ8QMnGp?=
 =?us-ascii?Q?vDTqryqULNXQOtOwSK6cW1I8qlRheCmm0y89Leo341WRxspuuV/MyL9TYsN+?=
 =?us-ascii?Q?/c+aqS94FjW3XfDNP0CxoaDCQDlksqjPnMU4J+svGw4YZ+PKcLSXgm0tpxJ8?=
 =?us-ascii?Q?eKnGecC3RCgVTq3nIt7c5zezpkhfpu+otpQ5MLKkBbF0cEnpqBNeRsvbTY8/?=
 =?us-ascii?Q?QK9vzYjEr1ohPUQOmDhI/DyPuvmFeL38PZqjnaUpNHjDxG1+tgjxDHvl+l29?=
 =?us-ascii?Q?YnPQlaJ7qTv/Ha4YODY0YK9sZsQVC39twP43Xf8HsusZ6REt0OSbH3/8R54+?=
 =?us-ascii?Q?Nh+5iT1DrbWY7UCY+Ega5WYFsuxSBPfKGg/7BkCQ2mn5223ii9LAuYO2jT4A?=
 =?us-ascii?Q?3m8/vPQ/uoVKQBs9AtnIgUoojGvbgRxRESX/PpkubrP1VUcIPAS1LT4gGSq1?=
 =?us-ascii?Q?9w0Nn/Z8ozKHpPhxCJElU800fPrCVSLh/KlvC9+D5/OkcNDgMa3g+6bFdCcO?=
 =?us-ascii?Q?WzKbk9bjlSvbegvsC9FdOz/+9mt0bRgH7XydTljAjiKcQDtjnXuZbUN5l4MJ?=
 =?us-ascii?Q?JPsAynEuCvvyALPz8t99gmOI/Wyz/TvttxiGyzXc6S3AlH5Vfsfn1qeQEgHk?=
 =?us-ascii?Q?lJgE+Ah09pF0RuZWsokq3l6/YZIWETERl+UFaDlereBG3slSCLVbMYy4gtDT?=
 =?us-ascii?Q?uUuL09X28HMt0f7A3Dmicho=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(19092799006)(52116014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?mI9MU7dcYBy9dNWpoR4eU1Zr2a5QCw5LyRL21CWkQqzk+jxpcBdL+oXel2Wk?=
 =?us-ascii?Q?LVUAx8ZKSy5nFGVzXgiZdVFVKm8ts9/O4Z2UpPN4r4qTJcqYchRsmTBe0WHT?=
 =?us-ascii?Q?382+w9DAgu1txhHwhnUVT6IIt3jPJEjlI/jofMo2n8c1AhKknwJZpMIx6B8t?=
 =?us-ascii?Q?ri9oItQqawxdwaKBju0xBUUU6j0BMzFw/1Rf1SrQ5YCtLVWtZ1RXfn6qRgJ6?=
 =?us-ascii?Q?m4thL1pZx9n2chF87q6mVObUgmrDDjrte299fv4aB07/sazyUYPjqLgrR/R+?=
 =?us-ascii?Q?rX/ImNC1m+15l7EPqLVICkYeyILIEw6e0BMvNR/389Z5dXfh//A3RSByEFyI?=
 =?us-ascii?Q?WHqosaSsZfDALf13yZwZY6OQJgaVgbzhrq+9J3CFjd7f8po50s7Gb0egR7E9?=
 =?us-ascii?Q?kKko4T4vDuPXf1t61wqNtnAPmfikqrDCeQk/m0gW+ynfMHY8JnLT12S27wUU?=
 =?us-ascii?Q?qRU8SgvBIEpjDZtQ8Ho1S6jDeUavlTC/Atyz+dV8SDlg0s7j94f+89MUEPa7?=
 =?us-ascii?Q?zh6gCBwTBU+UiLIyYqxSRCcikrN85sKjrJMxnhHahhOU6PgvwvDQARHao5gq?=
 =?us-ascii?Q?R8z1xGYwGRyJFEQiInLmbWs98JOnTu3lUUSnm++hUJSWtCd9E/PMEkXScudo?=
 =?us-ascii?Q?6FquipqIZq+NaIF8riwCK5zSxd9HcCWjzsz4D5bPU5QCd2XViHXOGC0RqaO3?=
 =?us-ascii?Q?Ru4QCDpp9IkRZX991hoEmUYl22cennyJa4LmrhR/nijfQPRSQzINdEdJOdVR?=
 =?us-ascii?Q?3YMnK+KrEuTe84L5F6w3IsqM4KngsOs9ag/3yZa80f0QCVdsGN/BLZtGeXtV?=
 =?us-ascii?Q?5qXLhTasxmn4CGkfoHTeTdwEhMie98GrArrVSVSbJxSHW295Z5OE3mcikWqF?=
 =?us-ascii?Q?TsZzpKhL85oJ4LUuvTBor9P2iLwwvhu6+bNXqrJkm+B/8FTwTNIc/YD77T+r?=
 =?us-ascii?Q?zC1HEx1ZytCh6mC7NnaiLKLfYUkFNDXRbZnCRpdg+LanCDu8yywFDA6YOitC?=
 =?us-ascii?Q?n67bTIvA5BnxHH4yG7IBsfzyqvfGh+9q6QL5vXzFlcSwe6jI3QXukQQjBd7h?=
 =?us-ascii?Q?zqwl2pAG4M3CQaBtdmgutbTryDS2FFcu7gkKljj1kbXY6dIibZiGYdHGpWxb?=
 =?us-ascii?Q?apJUe5M6RSHFxU6XSHkOdHxMZAPTwbOoGNR+/Bs61hh1inFhqSCpkLp1gzbs?=
 =?us-ascii?Q?alepXzB4jllA44T2RUkI6P7n5vxSlOxYc2E4xsv2yuIvqICtoCZEgbIWs1aY?=
 =?us-ascii?Q?JHUVFtwtB1JrHiaBQo2Yuz1HIbZkvD2A0q/40/ELe4GMBh2OKKTw33tdh4Z2?=
 =?us-ascii?Q?eAM/thZmq1LK2yIOLjTHzQAciQnCt6U240XeY9YVBJ3Uilt8m0qG998XzBO2?=
 =?us-ascii?Q?pUbh/r15qUesGDES+jWybbFp9Eqbx2phyAdH14jmEfdXuI0K220EGgbr5t2y?=
 =?us-ascii?Q?ONWM5sbFr/stVI+fIfYJDWnDsX30bm0njwjoKmHhsgfEP8f9iuRYLSsUxOYy?=
 =?us-ascii?Q?GAtWxREQ3XGTUieoRG1jlLlpDXZfd4Qs+ODGv7JZBo3QP1AGQWx/LOgpPbwn?=
 =?us-ascii?Q?ZvisfXuKi8SC7gccJSG59wiEhnV2BLdTbY3I3j6vsF/9AEzb5YGPAVg274S6?=
 =?us-ascii?Q?EG6TM095aVGdq8Kr/y38XLEtmbkIeACals43O+AWyqk9Ccemoe/2YszY45++?=
 =?us-ascii?Q?XPquWYFY4HSHlsbmLJ3npaVuXD4Kay9vYx7fLB3dEaOtN6e3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75021229-ce15-497e-88b1-08de634a7258
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 17:34:13.5121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38kZCeGqgZfd/u+DA9mnULDnxVRC5uKflS+WqLMXGS1eeyxbeeHnWXm8avBF26vtlw5otd0ia6csMd9ELwT7SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8550

On Tue, Feb 03, 2026 at 10:07:58PM +0800, Felix Gu wrote:
> The function of_assigned_ldb_sels() calls of_parse_phandle_with_args()
> but never calls of_node_put() to release the reference, causing a memory
> leak.
>
> Fix this by adding proper cleanup calls on all exit paths.
>
> Fixes: 5d283b083800 ("clk: imx6: Fix procedure to switch the parent of LDB_DI_CLK")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/clk/imx/clk-imx6q.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
> index ba696cf34fe3..048e2ddba490 100644
> --- a/drivers/clk/imx/clk-imx6q.c
> +++ b/drivers/clk/imx/clk-imx6q.c
> @@ -188,9 +188,11 @@ static void of_assigned_ldb_sels(struct device_node *node,
>  		}
>  		if (clkspec.np != node || clkspec.args[0] >= IMX6QDL_CLK_END) {
>  			pr_err("ccm: parent clock %d not in ccm\n", index);
> +			of_node_put(clkspec.np);
>  			return;
>  		}
>  		parent = clkspec.args[0];
> +		of_node_put(clkspec.np);
>
>  		rc = of_parse_phandle_with_args(node, "assigned-clocks",
>  				"#clock-cells", index, &clkspec);
> @@ -198,9 +200,11 @@ static void of_assigned_ldb_sels(struct device_node *node,
>  			return;
>  		if (clkspec.np != node || clkspec.args[0] >= IMX6QDL_CLK_END) {
>  			pr_err("ccm: child clock %d not in ccm\n", index);
> +			of_node_put(clkspec.np);
>  			return;
>  		}
>  		child = clkspec.args[0];
> +		of_node_put(clkspec.np);
>
>  		if (child != IMX6QDL_CLK_LDB_DI0_SEL &&
>  		    child != IMX6QDL_CLK_LDB_DI1_SEL)
>
> --
> 2.43.0
>
