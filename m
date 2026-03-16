Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010020.outbound.protection.outlook.com [52.101.84.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0231427A;
	Mon, 16 Mar 2026 06:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773642650; cv=fail; b=V1/1NjHFBLdI5YYSD2yUhjNSkzAFkBLKXdvoWGSUqSlWTtxRKTwJ3sYAYpisSmrjirYkjP6oJqIxzTNi5CEtfahgsGxsFu0zmLc/Vk1uquIgNHeiuLjsokwtdfx3++AL/a1uO5zzJ1wyFmWMj/O4ixwu5mo4hcn6b9gM0J38cZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773642650; c=relaxed/simple;
	bh=AbxMe28N8osMhd1Iv1snzuSjfGvUCv1TxLUY/zUoLZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OeIkefPrn2uvxB8mfmnwl+NWlswF/qH/u7A01VcSdOEWsPO6lqu1YZEPScH6f16CFxjhjKWx7FhYJyUDtRjkuNGwNdYXWU1429pl33FgdHH/7LeJuU9U2cpmctJ1PK0SRRaPyTS7R5oAMnBRD37KjiRMDyKOn5KFBwcYS6WTsmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=P5wXfOg4; arc=fail smtp.client-ip=52.101.84.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="P5wXfOg4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpA2HeK3R6sNxcagD2D07ZiunPcFE+tUZ3xIZztNgwyfYBEvnfjLUeZGoQi2mYOdHXVutpogBWfbV87DKnl6K1gB61WoK3820kv4nG2nQzis6Ud4yoAnDm41cxuLrmR/FuDv9x+1dMlBvWKOuQ4uUjET8gHcoCx1AuLhJ567E95AUQIkAylZAytTAHOYAt4S2EMExenObIM2eu2LdMqLva3fxSNGDT0Mqs4JYV22AyMyfvan6wx+iuDPnmm7wyiD2mwJ53ehqfUJieWAov+9P+urQpoV8dfuu6Gvd6RLeQ7+8/PYLZ1XuwA/6kSYPoMruproocUCtAsbmO7uBMbCGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbxMe28N8osMhd1Iv1snzuSjfGvUCv1TxLUY/zUoLZI=;
 b=eGkVXeD7HMi0wEwxz2I+DeHU/4j9xURp/d3LMfnInJI4MeVwyvW6dgCE6mZGMc1bF+HDzdfPCynqd/NgmJ680E8NAr1la7usPQKjNK7kaVe5mOESHW8v+zA3Srnphv1qlNDZWfIOT+9VrABAkk3cONkhAL/BeozTpLc2/4NNbfRkpdVGTCmrEHm7Zpx4zSZDpaom9IEj5DIEiOHmITZ7wwgPKmGtCpKEg2woxTLlfDpsdqyxEGD/e+bkcmle52kGeefWDdS75ErdHP6roM3Mq/1gmcCTEGBBD7P+BGThKZLRijTrW6WM8eik8oi+67B+9DIaJebErTc0Oc1fm5N7kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbxMe28N8osMhd1Iv1snzuSjfGvUCv1TxLUY/zUoLZI=;
 b=P5wXfOg4Y/hSDjXIDw7MwWMrTSVKfAbPNiAbuUWUhAgEte8H9EeX0gAYwR/wJtrRXcRxHtholwBQ4Dvzkg2w/kf44HuQwJyTLkw8Apf7RRT7K95kkWEDn892za9foibpjLVGhiL/nIc9BMsDcTo6Rto8H1p2iFXfld5KXjFCjXKVHEPgvppF2LFFYeUAGPXvO0uErDMmbPyBrvNcuNJ/He2NXYnpItRtyEBeiZsr8eBKD5i6nZl+20qf2bap6aewCcFwUNNw0cHcTlQO21AuZbsAG51VfOOdgRphX3+JxrrMEH229rHFVBLZQiQkqw/VdS/nvCFRVrnriDqgEMF1Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8846.eurprd04.prod.outlook.com (2603:10a6:102:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 06:30:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 06:30:43 +0000
Date: Mon, 16 Mar 2026 14:32:44 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/6] clk: imx: fracn-gppll: Add 333.333333 MHz support
Message-ID: <abej+/ayOkfhK+3T@shlinux89>
References: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
 <20260313070740.585043-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313070740.585043-2-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: MA5PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8846:EE_
X-MS-Office365-Filtering-Correlation-Id: 36154c39-fdb5-4b32-dc81-08de83258cf0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|38350700014|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	F2iO3lQUeyBUH01UfpGM+L3yW7KTU/zflupsq8Yf2008x8i+wGOGfTc53FGJYH0xmY+5tfo+XXkNwrVB0+VX08QZk+6jGhLpKOfrEt+cthVTLXg/kKJZXV8txYFbHTORt++YP8pblKWqQtMNhDW8UuLRUFS7eyYTs6Y+SDK8LigviYPAtF3FffZnppuapzTTMbpfCZzUJ0HAiOn476NbXr+91NFhF39yWW/WPTeEnOOddIitBAD00FzyPYtpxgsovr1VxOCf7gZDKj/B5+DgG1NmG8jMVB3mT0sjX2IJFSgqFKdRXn2+kBfgf+aUXbd7+ibUQr1PCLPoMDtnUiInHm4mKdN+ApI3yRZm/kn/NfwoeID2AGaqpQgle6YKpz6Eo3icj7PAgNrLgkj9vbit5nSY388FlIR3o1ubNBpIQ20Eh9sYPyoV5I+JbI4Wv8BIrld0lH1cEw4tP05LihS0HNAl2qYDnFPoH/QcoRF8MFyjY49GQ8NP162uYHxDw6gMsn2PTTSx6ZqmOYqK3hg3AgNkeOcbAKhsVIO4Prz42Ha0mgOTKml9YBM3vNIs28GhPfUfbZw5HCGk+9tdhIa9Dz5hb0EmzjL81ZsF1azB3TnEG5JpuySVIqLvZ7c6Ne75rI7RLlJTcweXiakUZS0xb4L7PqLkHqbw9IfRLP+gju9ETd2+haMpgxKo8Gwp/GvCSv6A8n9FtJKnvXJ5Y+iPmx7xrzJYW1HQp92/zUz0E6SQRaB4CzRl1NZBhsB6/V6mXdTTlJSBvZevZg3ydSu35j/Hmt9xh+OTVTknT1xyakw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(38350700014)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CbVL3rlW7iLyx4X3mWfj66wkYedWOlx1I1If31GyLS6bSKixdUubPrL5+xXS?=
 =?us-ascii?Q?pLdjHKzNiqR1hAvY2YsPflHG2wo6n3RnylxWYJ1bACgp0TM/xcK1E3HB4GF9?=
 =?us-ascii?Q?np3iQC97ElLnBgQtO8V6GISXEEOHHf0rfyO7i5hTbQb0PB+/Qt1ApshJX15a?=
 =?us-ascii?Q?MEYrN5MbLRQVh/eFJe1D+6obiga5SejpgwNjDU+3c6ajdehYFeIEsAseAzS+?=
 =?us-ascii?Q?Srx3VjGNIc4/aGi+pfdfpNO6eCeKapp/q+PpPkuBt+7NOr6KWn+f6ueEIQ40?=
 =?us-ascii?Q?Lmj+RcNKCgg67xUsXwdRebgSzVlPIHn3tIqbxye3MUZfb+ENMGo1QjcyTtFu?=
 =?us-ascii?Q?TM3HSr1w5tMN205iDjqyV8S+LBxxN8r3nmFvI+Ca31waa8Cq+rNmorHXhnbY?=
 =?us-ascii?Q?y0fLjdGSIF0ar7+G2qpFNSkg+fQ9Esz4Tt4YYOO/U+68P3WuL+vhz1CzBAKv?=
 =?us-ascii?Q?HS11RZaZm+N5BwCsN5oNhg3gQjINjDNSkCzkddLeMC7CZGGa8hXowAgNl1jG?=
 =?us-ascii?Q?vtz0Q5fRZUKtDEu+0c/NzOj84X4VraoR8W6sRtiMdm14iuhrPhxPUvYk5Bnb?=
 =?us-ascii?Q?i75KaM0tb6/N7KsfdJfarNCtrJfaRfN2MTsxEaRuvAGdO70a/W4x2JZQjhVL?=
 =?us-ascii?Q?kzEE/Lu4xC5lRiL+lUuvXqUip+rpLgtd5oQ567sT8xjtmgj/eQH5+IHDxm94?=
 =?us-ascii?Q?lUrgF2D0NsT2ummA6ua1Iu+pCkvoQ6pgygVeAm4OFU94T6/Fxr1rSQuCAt8G?=
 =?us-ascii?Q?vYuI5tW5/6Lo3IwtFZEM77mYp/IrFNE774m6GzNLI1c2H9ogvhSRgpFJa/CB?=
 =?us-ascii?Q?R1n4Xe0Y9j0rZafhHxr8/yQjJO0U6dfP1px8ZmvhBA+nw3m9Zxg5X5xcxdCd?=
 =?us-ascii?Q?DuLDd5BK/W/AkV340Op0TwuCiF4h6mFyU2zo2kfZK2DMmCmLlmbWGA1+8Mhl?=
 =?us-ascii?Q?FIfExdkKh5g7qLYXuUWbW/T8bAN2JFmLiRyMW5/cQpZl6LCFUZTs5qtDH455?=
 =?us-ascii?Q?WBRrfHgCs92bFrlmnzRLLz2YBTIErUULbxbbsid4UAzi2cHkOQvZVPLaN7J1?=
 =?us-ascii?Q?Azi+s0gbeTeHMKNoU58GaQ+Df6KUKhYUcV2NiuRoVcgekEDncYpKu2O4lZP9?=
 =?us-ascii?Q?laocMme57APoLQK5SbQt8fpXJotKJq1Jw/A/RJD2Qz6Uoa4o41N9kO7HMzLr?=
 =?us-ascii?Q?WtAw1tvUNws++eBrKCFuDXwBYzyjzU54Uk4MXn/EpxZQzfGrTLisSKdVUDk/?=
 =?us-ascii?Q?jIVnejLUGo2Lb2mz8asg6O6UmmiRsJtJTlxQNnVgnX+aIdPkAywiyL8l4n6g?=
 =?us-ascii?Q?ceGuom/0qCDZFTTcR+ZCIuhkNCtxLWU98dzFzRhctFRbIUM8FCWFUJFjsqAh?=
 =?us-ascii?Q?fn7FBHRAI8ZIx5VneiXjc7sYTt3QHoEg94muoqx7WAVEUMV1NWvex3Dgs0Nw?=
 =?us-ascii?Q?yW3e7q5ldbVOsDqWUpFr4LbLidxgLTxj73Dhtax24+id/hEOwVFRNLWt1SKB?=
 =?us-ascii?Q?ezCfl2uHFeF4tJRiciw335ARm9Hu51jd/SbbLBl8CtTCGBisagPlRwfPbOtq?=
 =?us-ascii?Q?3bhmIE78PeKcl6J9X3NLc/P0Hon5Sxs8QkFtS/GlxB/RoHOkOUlMuMIAiYBa?=
 =?us-ascii?Q?HjHVMFxuduGGPR7quc+L+dpPFbzNrGOzPDeeS9l7J+G5tHOz8B2Y35ZxKftL?=
 =?us-ascii?Q?aTT8GDjSojf2H860oknmYWBsogwIpDCHwMxF0ek8ZayNs2/jzpfAT52KCXqA?=
 =?us-ascii?Q?ghGHLu7h5A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36154c39-fdb5-4b32-dc81-08de83258cf0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 06:30:43.8358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omD78CYD/TNdd7+aR9sMfU+7GBTg+iDSmqUouxlCr9b/aqDmJ9Fk2IuSXP94FHLtUFAAyL+mh5eLll68WBM0Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8846

On Fri, Mar 13, 2026 at 08:07:31AM +0100, Alexander Stein wrote:
>Some parallel panels have a pixelclk of 33.30 MHz. Add support for
>333.333333 MHz so a by 10 divider can be used to derive the exact pixelclk.
>
>Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
