Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013070.outbound.protection.outlook.com [40.107.159.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A821B425C;
	Fri, 27 Feb 2026 02:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772157646; cv=fail; b=cBxa4Plfaxv6mt6U3HsCYhYrBQ6HtSMkj0tEo7JDSa32rfKqVprfF5Vw9WdkQNc4mDvhOBrp1anQa3G5+Bpb2AvueDINeo37aQ4ZMqxX+ugPC44Is3lak6/LcvIDFsOcYJ1/UlD1inAJ8MNBStB5P2xfBowrh1qLTO7vEQdcc34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772157646; c=relaxed/simple;
	bh=qvjkVS81m6AxKN4TVdWI88o40/G0dUnjGGf+7GCm/eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bDgsHjofbo/H+/1sncJfpWVVJW0+P5Htjvuirvhv6WUrHQJKBHMzTnh7LtV3LPcyC8H+cs3craguUCwED5aWhleyBC9L740ecKmZaepBCkUnjjWZLzR6894xIvGJ2rOr2eb/N5d3nbgR7hW3tUen99fmBW+uUCL7dzqbfxI8Zd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kfOYTJdg; arc=fail smtp.client-ip=40.107.159.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kfOYTJdg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ll70j0Px4TcTJUDQIZ1LDhuH4z0Z7si6qnQjMZRV7xvxH1DM6SYHDfb/J0tM7w/ibDp3U+fDLccyf/UnjvSCH0B2Z7SjG3l1gVTEv4h6CqLiFwZl2l72rBBC5kbpFHnaMSjj3PFcsKeDSk4RPNWllG2P30+VU53o/mebDtvSf3YpLM4tmVh5F6MImA38Akp7AJhlyOtrrbEwpPC2ArDVDpqa0I9FDF14UCZVxI90t7u9/wbaVp9ahj8CUSxxoTi+AMcI78sVSswtse1bw/Kd4zvNUsSHj0hg2h5OvpVnTHsmCsNln5bbwmUeqURvfM/2F9RGFS9o9L3yagE+xBNu1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvjkVS81m6AxKN4TVdWI88o40/G0dUnjGGf+7GCm/eo=;
 b=twI6yrEUiEAOXVY3lURVeWnWmmMxDuYK/29dskqvkdo7Ssb2NwJa96f1ze1YlT3cQEDJrqxIF9baxTkiKZT0ICqLWozQjPeQBV4uHjbwYO4mz310AHukdtYHL+7J3q+sa9+FnM61W6w19GeJ5RMIl/dZgltc2xzuuLmg6AwzpnhyTpi2PJW2HXVV+MewwKcNx4HyeWArMDK2DM336XQpZ2MqwKbn4JptcMNUbWXA0rTmsOLBTcMY+QbBJkPkPy/s8Jfa6vlpKK92bcIIHd/qRd6HRE9hZLBO1Nf4lbpS1UU5uSLjHmJUsB+KSrfUlyTVZp3JF3SFObodwR2vMg16Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvjkVS81m6AxKN4TVdWI88o40/G0dUnjGGf+7GCm/eo=;
 b=kfOYTJdgrXiXujjsDpZbZZAOqiJJCL2/agXkreG3rFxYi8yn+A25IXp5fC4S4Ux5UjokYyiO2MFcoAtUJ6rYm+xZgiGcbha7AS68s176jDCvjpbvdEPfFsgUzDoNIU8ohNKP6lDSIYC9DpeAjNC6XmCCkZk7IYs+bIvd1lR+8Y2pG+sR+sz0MbGlPt5+iFDynsmW6xlqCtiXXFFW4JnynFMDFXf5B1bQ197FZi6hP4W0Dy62nbNxLvK9pQkOxFKKP0vVdEJLfMKoKVLSQ2uMH73VHHpNLxShvFbDxiKq1OmsSF4QYQBJE7FDJlMVjRA4+Ywpx1lJQBAAWOX4sIm+sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV4PR04MB11291.eurprd04.prod.outlook.com (2603:10a6:150:28f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 02:00:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 02:00:39 +0000
Date: Fri, 27 Feb 2026 10:02:34 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/13] clk: imx: scu: drop redundant init.ops variable
 assignment
Message-ID: <aaD7OhI/wgXRGncv@shlinux89>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-6-4421dd2f6dc6@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-6-4421dd2f6dc6@redhat.com>
X-ClientProxiedBy: SG2PR04CA0213.apcprd04.prod.outlook.com
 (2603:1096:4:187::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV4PR04MB11291:EE_
X-MS-Office365-Filtering-Correlation-Id: eb608c03-42c5-43eb-5fc2-08de75a40129
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|19092799006|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	EggntAkDPwmtek7bEdDW517lydgZZ1QSFRUFl3A01ljyFYbEm41uFfRY+uqnH9xKUZz98vEn1ZW6yE3Hsjb3LCsnfvceEFelELgES0QV0nBmXdKc6H5pqeojLzCYlmnqmuE1Ifzl++LK0ptJ/RsOkivNJJ2GkXF2DIjS93hPl9reefF8KBCiDT1SGDDbgB4ECmMC5vYE/j7MmropJ9KJPnYxaZFJIKVmlI4VOzKN78n4jVPzh1AhT0X9/JBZg7FioZZJ2xYTEAioAcQ3wLhnwXxqBevmUPV10N9dgNeKHbD1t1OF0JI7dCw1BHYvN9BDNbIr/OUIIsMKkumudo8t7Y6f65uPgagz2xnYdTax48YU4U/flXXdnL3fch7wY2UH2P8ykO46NTjzw2AF/YlDmzCCUgKgbdvaPon1LBu41JZNyBwr9dZ5IBl9HDBswYnq0m/vHljPS/4vLqloVxIAkvXnLmLSy5n5vPOtFSiXxq4nqDAkNnp/qyUo0pSaxtE5iGESPnXb7SkPXM90ioyW6istMV9Y+g45pExY9UJ1BULMuAV+2+YcqkyC2qcYMVqE0VNfmKu43xirISsYFYwCjvUOguNdr2ag44wqGHtf82WOvlQyBNj4HKAGBBjk96iPvl9Pn7yagz2R1gBWUDCRdTeenPs2BZswB882XW6lbOjrK+hZ2+Et4My/vMTTjvOcVdmbX444j46LmjXj/zJedIKuRxCNYK4GmCbb01nHlTOgy+fj5Kc73+JHYJHck+auXC/uH88cNIwwvaPOvai7ozzHCt8sbvF67ujc+XTyF8o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(19092799006)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sOZGi+i5LYRhcHr7ND6eFgQfqfutrGKhLJOx21Vl9crPM84nGhhc2QHpaBmp?=
 =?us-ascii?Q?LY+u7ob3Mou9rMseoBYOgGY7dpMdaX75vSgBm+2GDxfTGvbu7C7Z7tGRrEH7?=
 =?us-ascii?Q?SXNq0eaRO9EV2CdB3WLnSK3SGCa6E0UoJqSrtQgtdb9XGl3erMktZuai+fy+?=
 =?us-ascii?Q?fBnEdrYo7D/dIAm2wCXksDoTwrBojbAAJvHq/wfxs42uebUKfcmOsOem8UYR?=
 =?us-ascii?Q?grcYAVwGhLKyef6p4DhS+r/XdBknpE/MX/+PBiLdGHdNEFXPUOdNLrfVQ4lc?=
 =?us-ascii?Q?DlwfniRO4mAgl5l0HX/1CFWIHZ3tVpx75fgnruo62fF+xfXzngZ1WuWH58R0?=
 =?us-ascii?Q?uwO3HUVgZq3fLYE5czpXuzD/oBijO8qVWvSJp9UGVBKMXTIJ2IEVgJnllHZG?=
 =?us-ascii?Q?vU8rnM89ZuQ9t9egh3PWo4F8Zkrlk1T36hNPRiJvqcW9HSeZlJ05mzdtefoM?=
 =?us-ascii?Q?WOvYIYbR8e7hEDcyOmwChIEiI1W6Wg+yahwAMHW6sMl3uWhgF9M0EJpouNqU?=
 =?us-ascii?Q?zN5Iog+dUphgJNFVVFd4A5n2/3ejHAOYSElB+NtaqIuvPbVyxM9R3Y1dT+hV?=
 =?us-ascii?Q?HVsbQkPpPirEsav5sGFTipDAYcs+OwQYm48nZdy0tLRNc3tw+jTVgFy5FnGu?=
 =?us-ascii?Q?458PguurepeJJYaCvX+eOjLozuED1qyfxVWJChp7tnqGqJCelkMz3CeZV7Qo?=
 =?us-ascii?Q?DWF9C0FQ4h48kb7UE2g3LYKYQwGvNNLDuhpH488fXgXeHqRlPQHF+uh07opg?=
 =?us-ascii?Q?dijvgLgjxuidMMAhG4alHvc00rPvkgARlhfYzrGihLbBBxQ6wnIzuF1p1H82?=
 =?us-ascii?Q?oQI3h+Vr4+rJ0HTSUnNGdWXTUg+mwr089InUNsRUf5Py738fylQuSYbqvig/?=
 =?us-ascii?Q?uvpI3DrUPClgFKVnCXEeHUxoICP73pv1R6KlLHoNy8YU4gpEIBw+2aFlU3yv?=
 =?us-ascii?Q?pQF7xFBtpD7DPF4BWzM4D4gOflZmarxSpEzof0Ebtoud448ekPVqO8MI5WkR?=
 =?us-ascii?Q?K09BAuCFbgbgCEpv0+jzU3CZhNlWOdBVGKAr6ogoM/9imvexk3nhw1je+QnJ?=
 =?us-ascii?Q?6HY941Q0ZvMetEoEghmQMztjbmdCCslTGuzsqGmBTjgnSmoWF4yLTzxJplHR?=
 =?us-ascii?Q?u6Jd5U5syczO4CESkCbXuU2w5jQqItS1lfgVOzESRQexRQMN9Dgf4RzVxDae?=
 =?us-ascii?Q?UDWGasEkH58yyzsFFk9CM0dLiFml95baOVdPcXex6sU3OTUHyDShJbpBILBV?=
 =?us-ascii?Q?IDRh70VgZ94tf7IP/9s45aN0KwEhHWilDAuYUl5oTCenVWZbpQquRVoKJLxi?=
 =?us-ascii?Q?cntfgP03N7dGxV32YghwufjUSyA5DWxMuRigSgfKDnKxWE0h8GjCcL7thsFl?=
 =?us-ascii?Q?DnB1sq4dqYaAwPHcN4LVokGHjtf1eXTAQZ7RwK4kG+ybd3YEa3PzleeiW3u8?=
 =?us-ascii?Q?3fJxrshCOAzkQw2fWJ1UemLS/B/ZFs5FqwePDHs73sLm3WSfBGDBOiEco7I2?=
 =?us-ascii?Q?FUrlNT6b+daKmxgH9eWeMUK38v8Y1qPViDIvjc2Hkc7NGfj83iYup97lSJtd?=
 =?us-ascii?Q?xuGlk0aNrxTc7PEovqy/bmbHdZ64XRYQ6thi/O0JPbCd3E2YzUMPACIvMPXR?=
 =?us-ascii?Q?W/o3wxv1Kmr4c/9bC4iaCWWEan9gO+WiiYZy+Rp5sQjMf65r9XVsZ7DkO7er?=
 =?us-ascii?Q?ZIBSfdPXMewB28TruiO0Z6/z784CLqd0vdCwaj2L5AcX6u/5EhIl0Jrc86U9?=
 =?us-ascii?Q?SDZi15JzMg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb608c03-42c5-43eb-5fc2-08de75a40129
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 02:00:39.1486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IUfAg/1nDpKF7x68aMdiu2o0sbVLX/PfwNNJPmDkJWMf/E6Dd63xWRY1OUfEEDDUIv+k/gEwreo2/OlvTe6jmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11291

On Thu, Feb 26, 2026 at 01:16:50PM -0500, Brian Masney wrote:
>The init.ops is assigned a default value, however right below it is an
>if, else if, and else where all of them also assign a value to init.ops.
>Drop the redundant init.ops assignment at the top.
>
>Fixes: 3b9ea606cda53 ("clk: imx: scu: add cpu frequency scaling support")
>Signed-off-by: Brian Masney <bmasney@redhat.com>
>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
