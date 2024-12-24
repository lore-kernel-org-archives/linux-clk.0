Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2060.outbound.protection.outlook.com [40.107.247.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184918C1F;
	Tue, 24 Dec 2024 02:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735006325; cv=fail; b=jLICQwyg6YoepBtwrZE5fRp7209FUZOnV6+zVYQ7ONf03Rgeh80Zn5i12sYeIJVJ8BRfQnKylACMaTxXeYcjYBNiE88pbRT3hYp4DZTtgwH/6/jvZqxMK+LisPvWRk2ThOLFOI17XBTB6ibBfud5EUhJA4gxEdNpnFbMVEZGDoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735006325; c=relaxed/simple;
	bh=hR/QmE8C1wa04o8P9w4XQ8XYPBHsaATDzmApuTPXjWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rb1kajIMagxBh2j/r3DNNGHBRy8faEgUdApu6Ex1Y2LNP5fW7M8c/vA9b8J/khYXNohi1/A4Iey5mB7KFaHiEKS1jMU+GsjKBzIbPGC/37GRB+pBNQoVUFVj/1hBa+gMeeo2F4E04+Kuj10i5CFwGZTLx6LR74p+qzmonZ2U28g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Rsj3Cigk; arc=fail smtp.client-ip=40.107.247.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Rsj3Cigk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ih+WduA/cpN1jmmvcB7QM0u8TmuAx7owbB2OVYRpL/lJEcxAeKafr5Z+xfhlu024+8U67MGSmcTi9fQK+GZIM5E+CLFGoSZ69SZuFN7H0qcdpBthsTDQ3KLRJs8MIMz7anaXYVfUMegN4fJPIYVfPehHywmb5rMzKZWQgqqZ6yHZteFR+GJldAXhQm4A1Gkvj83uMJ2oqCHGVgMAhnzYAl2a8C9rrqXdXZoNFoXvaLGX0vuHdf+VeGSD8G6bFE9FiBHMJWxHzv8WdDMt7tiw3J6wIbvrGDv205+eaQ2rqsnXhIPMFOvimgv5Dqf34XMFx33GDeTJhoJjHobr6W4v+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hR/QmE8C1wa04o8P9w4XQ8XYPBHsaATDzmApuTPXjWA=;
 b=DOhYSoNQkEBdxKZtaR3myQm5n6FawCt5wfSwOZ8nuCbpA8Y76dJGCBtCODzisbZNlH/amR7FqGNtgu6TBIQN7JLSKgzopCY4jD+TazQZX7skg5aGzUrop3zv6mNborn85L5iaGTbNpkTsoKlxdE9YqBsfgYMkrmoiJ6OussNcfF3zhHMUzOOa1jCImue1r4hE4+yjEjrqy2iZd4ZId/yvfYEfeIyrlNcs7E22Ynz/rOXmM9WNT0e9VTryPjZY/avliYayUk5bCqpBdD9a7rDiuU4q8jQFaXliIr8kx+iPnGNZonw4WIcufFQN7AR8Lz9NS3npjI/3rr2VzrVbkLf3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hR/QmE8C1wa04o8P9w4XQ8XYPBHsaATDzmApuTPXjWA=;
 b=Rsj3CigkR6T55djEx2XdiJGZolNbijcqduKhW/ybPq0UCOd3Calri+L2ggWISSboU8/6lUCtr5s43ugtoaBZiDr1emSXy5WUcS2pxyts6quEjq3+rXUYUE1P6UiM+QUh8ZgbUu/VQdd9G/cYsPsraPnooDSisw1RJ/RePGDbMpUVqDjsjr41toTmDHmhHzg/GWIuvi/Y/bkyuAUdjUvXzo4ueBR+gW07qzvel38HHbLVWVxMm8RruRglbvYAIUsPw1Wi921HXZ65EoZaACz4njbVWkHOldyxNqFds79VsxIFUpXrQBmeWB5v0DGZijhpwWWjoxaoI1Kg6Q1jwGH2Pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by GVXPR04MB11017.eurprd04.prod.outlook.com (2603:10a6:150:21c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.22; Tue, 24 Dec
 2024 02:11:53 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 02:11:53 +0000
Date: Tue, 24 Dec 2024 11:17:25 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 02/18] clk: imx8mm: rename video_pll1 to video_pll
Message-ID: <20241224031724.GA20573@localhost.localdomain>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
 <20241222170534.3621453-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222170534.3621453-3-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR03CA0116.apcprd03.prod.outlook.com
 (2603:1096:4:91::20) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|GVXPR04MB11017:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a27066b-ec73-47f3-e608-08dd23c054fe
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kGHCJnSChxoHPDXyg/Z6WlJLBD1zpUBpnzCZ/7YiCdWrIZcaVreRwJ1GueNN?=
 =?us-ascii?Q?bfKyrS8zU+ctF6RqP+O+yksrNq0nT0Zzc85Ye3mZ1vxjdc4VhJHsBwzah817?=
 =?us-ascii?Q?3SqcxEJASOegeqpFyLuSbXrRx2gJF+7B3sUcCDm/PhvGsriyemVclCjQNuL6?=
 =?us-ascii?Q?83z7gmK/+Ebbp+K+jA6lKseIW2Mn73/6RD9EOQKazYeqDQQeVgEqbxNcUf/m?=
 =?us-ascii?Q?LTnMf2NFbzi9H+nkV2Xe9LPwlf+GIkt+gw2MVrgAHzlHXHaPomw/0ORv7+sw?=
 =?us-ascii?Q?0YZNYki8Qq0wiF7q9brusLS5P84pW4TkWibo7Sd74nYD5aDADIjSn5YJVi1i?=
 =?us-ascii?Q?velFAN/qdBYKDJdU44s/2wjYsd82gB72JKPubO99e1FpIzyHnAwDGHElcPgn?=
 =?us-ascii?Q?sGv39MqjkK9aGQaC4R0F/JxZoqZ0hlfybgPdgkV4MsnZxcG/MqOdc/HcdTWj?=
 =?us-ascii?Q?cj8Uw04n6ao6tcUggyGz1PDD4Q7ccmYVNap99gd2spJy2pEHuRqRbjI0kQXF?=
 =?us-ascii?Q?sWmNbHuYvQaZIi2/H8KriU7QBoP971nWaykCCNQGCxKoyKIFlcTMcrVDTtJ2?=
 =?us-ascii?Q?qSb+gAaR37yjZIDmwQ8OmBLmqaizk/jdq7bEhjgRUaweyfzI/IUnGVRiMRte?=
 =?us-ascii?Q?NKXrjxLIW72p4mb6BYjriskqQQPuRMrTQHTkOVZFx9ig+N5fq/ak/hV3tVdJ?=
 =?us-ascii?Q?OR9RVxfArCjtmVdN81oHp067BswzpFOcPZ0esnlcXR9JG009bYyJiqU1Gs/T?=
 =?us-ascii?Q?jSbOrDrNH9nl/ZS3LT7Blzd3AZHJ9BOptjzn1r6cw+fMpZI2rX755nQAfx4S?=
 =?us-ascii?Q?UzyPuGyGXZpwzaNp/zJO2BlNvlUYBFhhHcVjbXtS58xxU5U778MkKuuYWzz4?=
 =?us-ascii?Q?U9m1yhmegY9W8RHjqmgiDda1waQQSjaHouzZhghWHoSRKDMz11PCJYfI9vAy?=
 =?us-ascii?Q?NW6X0rY8rlxeJXCI8M94xScsfpQbI37gkq7BUWigATc3av9yUdKKEHNvhOFs?=
 =?us-ascii?Q?v50aoAw4U4dzz6/meMRyoiDAtXG8CWNZZe08KtiVGSUnrbsqR9UQi8+Bt2+M?=
 =?us-ascii?Q?Sn5OywwUqvD255AvMFJy3USl0XhC+7DIfrsfXkg2VKx/sSvvHQktw3weat2k?=
 =?us-ascii?Q?+WIBEYq2iU17K/h/ql4IubPG5Em/2mS279W0fltYUjebcvRmK/FyH+nJYOhK?=
 =?us-ascii?Q?yNTBTgMghYlezkFyMHiE9IqY6B3nepT2Fe4OpWORZ0gnD8WkQ+tXMYaSyClp?=
 =?us-ascii?Q?DP6e5nLGQPUX01MVKftLIfsFDsl+VOiIf+vgntzHWc1YURceDIm5IAObUKH8?=
 =?us-ascii?Q?N8/A6+lFWl7QBF6cvP2gprajxSd+okqU5ODX7qgaVWd0j9VFJdEwRKhzbfxO?=
 =?us-ascii?Q?6lxxHjha5zC8cSSiDJEAp2Cb6+txirLj8wXxGd6BKz/ykkSMggRGVPyAjz8N?=
 =?us-ascii?Q?gBlM4ssTFtKRGhoFrruspJOtanaGGvWW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PdY5Ps7uc7PH2p0iEDrhK6XG7OA6DVQOYHccWsuI+xjAdqVewfApSou2si57?=
 =?us-ascii?Q?sxvnd8+pzHs9usMr+lknKHvX9j+3xiWbXvNVzgfG83HH3UHeEAsvFyvz+++p?=
 =?us-ascii?Q?rAtD6heLJK4PVsNjaww++govhv1FiQALh9AiXz3nboc1Wsww7d9gx+GCnXrC?=
 =?us-ascii?Q?8Y9vekOFgik4AdL4+uoTUyg/lykboYTX2dhCbqSzt6udd6qDPzl0MxgvWaUA?=
 =?us-ascii?Q?zoP294REPxopvdlRMRtRfT6ANuqZn3pzl3+B9vEIekd+SuSpLDPR3/KEnL9C?=
 =?us-ascii?Q?9p2riUwAmA3jSSg1Fgx8qK8GQkysa6BmOSLp4X9VSBVK+9B4SfU7zG63cNCg?=
 =?us-ascii?Q?oT3GAqV+ZSfQzpNzdc13trZqlYzJQGzZDKAIGCd5bi76BNzqLrNDD+mtuGox?=
 =?us-ascii?Q?qQoBYBzjjomwjfgKrlruVXRW1G/Y6XQOZk3IXTK3ZyZ9H2EU8N28nP8gg2XG?=
 =?us-ascii?Q?aKlTarKzUnlybXm/skaW4NY1sMPU+f44Oe+J6Mfoiquo0hncgHTt0h1Gpe52?=
 =?us-ascii?Q?PExssAAGVBP5kjOM9qUehHM45XHwCLQTlNseN8K8LZecopUGAfJ94zGdPlKz?=
 =?us-ascii?Q?8Q0JQKhK3TYt151LI7UcEcFrW0C948SJCtmGrQ78DWqEXN7nY1fvFPnkkl18?=
 =?us-ascii?Q?vbhZAiXS1AChS/qJ9/oPN4uvnXNoUIMuUedtW3L5XgPgoOJnmIBSxL6x+XrW?=
 =?us-ascii?Q?d4B8iGXwpFig2sHLBSlHIbEP1IpI/MfaCkolhbCB7kC8nXoyun09Db3TJV9E?=
 =?us-ascii?Q?woOOpVytIxjGsXLM7y5q3ixA7fa/ZS2u1vFq+1Yvoxqs3aOEyOR2/Kgu5g+n?=
 =?us-ascii?Q?gSu8jQ6VP6UzxUdLAW6j9yn8nFa4wX9dISGMkMh7vHw+4XZFyVw5c7tHoYXT?=
 =?us-ascii?Q?QEuD9eSUmU/Dp/nbf4YkqCZTSjHpKLd5OvyYGCTZlBcNBYpzoOFG6VYbcs1x?=
 =?us-ascii?Q?nYJkHNdxGNP4EZ/IxjwTsaUbSxK+bvn65vU12DPzOMUkJga5ruEAG+TU48aV?=
 =?us-ascii?Q?tXSxUIF28cRAV96fwPFBaRQLLarmKIePYRJTXbSLhwUfYYrQWeqWz/tV/vIe?=
 =?us-ascii?Q?FQvmFgOIUaoqLildNOOaE0b1oit8o2j4py1ylAItMib1f1D/vBec9EgcVlMS?=
 =?us-ascii?Q?iNF11b0t50U9yReJDIsHfO97NtfgOCXZdx3xviiRsafW1NCLrx4dugUL0PCg?=
 =?us-ascii?Q?cMpqBEpfwfnp7TBwfH8HowuyuR0AT4ThRNOfG3qUOdrXX4eLbFBHC5JzhlP0?=
 =?us-ascii?Q?caeR5zfIh/F8fS4SL3DLv11HnVBfBKiFQMjMiY828DZMEu9ap08zP7WE006Y?=
 =?us-ascii?Q?9CmVkx82HPUrIasm9molZhX2eB1L+nbanOZdql+jYt1M6ujE/oIIXE5UcDQh?=
 =?us-ascii?Q?ZB4tCd207lz8O9dQo5SDTMljV/I1VM/MNEUESCP2JLRaCpMZDWcsz3AokMoV?=
 =?us-ascii?Q?PXmMDPQV1OGNBoNJvDv40N9BRGx1fpWEyqvoo7vhLkLdXZIla+/EoA0NWtji?=
 =?us-ascii?Q?Jiet7OvLsc50JD//mSUdD8jrPw8+FxEr1pbZ/1yawYKXg5nXfo0H4W57Oa37?=
 =?us-ascii?Q?XoVrzHrHsJrAZdkkpP57bfArHXtKbPTBpB8ysuYt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a27066b-ec73-47f3-e608-08dd23c054fe
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 02:11:53.4701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEgQIcgouYy7gmbzmKkQAv8V9yGeKSCIFqAelwXh+1NNnBbreJZMxlBcxyC8FNL+0u1u9CFUzyVdfxoLaP7A/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11017

On Sun, Dec 22, 2024 at 06:04:17PM +0100, Dario Binacchi wrote:
>Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
>name used in the RM is video_pll. So, let's rename "video_pll1" to
>"video_pll" to be consistent with the RM and avoid misunderstandings.
>
>No functional changes intended.
>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
