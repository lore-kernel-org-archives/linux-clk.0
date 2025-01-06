Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2046.outbound.protection.outlook.com [40.107.104.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDBC1D63E8;
	Mon,  6 Jan 2025 08:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736150449; cv=fail; b=ghPi4YIzaIu7n/DTBJCK08rep4EDtKjMQqHaD3CfxByXCcVAKGHAUdjc+HIdOUMbcVmQd3f+U1nd5wv6YX3q9GZpXN8fmgKidGwaDXQaDtVCl2N6mVUnQfvnXAkizStDvX3ewJD7k2wvpPfMHFse0QEk8NzPX1UZ4j4sqGbPWtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736150449; c=relaxed/simple;
	bh=qFGRpsyw+Tf/2VLA17fR6AO5ZrxNGYc1f5RdoRN1Cks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OtMF8A5Fl4WPQX2OIHbXs+8lHAMrKwuuV4rMXiKxWYtTcQy4NI9OZXD8QRvDD9TpMc6f18gjGxDBbLCCaGM67lfLfW6vzjcWchsBampzQNnxwAwrcZuICaqYj3iG10HrkyvaOzZ2ygTtIybe9cdahG0WaVOqMKPLT35xu8ba8pE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=w6FWX9JL; arc=fail smtp.client-ip=40.107.104.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="w6FWX9JL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rUHgGlkxslrbcnvjh8L7KEZaNc85xO1ma0G3ETXacMbix6NCF5AMEGg+vvGn/GLKxtXomq/OkfnWNp2DKCmQMcobyUEVb3gSctDWmiFJYsbeBoc5LOCdmHZrAS9Zc9MaMepKDPA2Tj4bKtvDck+lSu/bxy1PqmclTxw+vHjc3wpy5JosqBkDTGUBgu/dlRupxsEAmZSfeceWJ0ldW+cavoWiJWBcqw5FTwqUwgTa4zPXqfQG3c6PI5edANS4AddviKZKuo969gMufG8goXDxmHwxtw+0fnosOM4WsAKAh0g4fVNa9hzZIpQVmm/symdMfsNmmWBM28C9XpXGX6Wp/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFGRpsyw+Tf/2VLA17fR6AO5ZrxNGYc1f5RdoRN1Cks=;
 b=gd6X52Hg1XwF+1bA/y28bT2tANwPSe8gMisuFbMmNr7D5g3gMYD70vfEX6mH3fkJjm5g5SdhaRFPXgiT+qlTbZUpnkuyHqMMH4+DhN2YSto9JZI+mnQajbPi++an1FovnwUPQXydQ7VkK8mUR3vR5ANfvYW+cJdnMuZVYVTbwxfnAM1QufVOxEbB5RjGVIFJj+gEoHyWhkuRpPUKzwT9G4ufbdqsBxkke3W6KcGfh6ahqyEZBjhdxPHHWqlPf+O/Ndy85IADL98E/De9ju0rb4xGLxaFvdtRJNll4a2q/U4l3TkEARAuUnmoVWeqEGgXTU3+3hotYno264WQMaX5rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFGRpsyw+Tf/2VLA17fR6AO5ZrxNGYc1f5RdoRN1Cks=;
 b=w6FWX9JL2EcGcoJwCmWIEumqmacf2lNGEPOUjj9Ovpt77wyetdI2gDD6d39DQpUA5F1SAzkWH1uYKkhE8kv6ALodMRoROf0ZEAqrsPVi7N+O+pO5mGJ2kisPuRP4QL8Y+0k+aTMKzTy47UA5BrBp3+MkPaYvbeXc54a/aKXXYPE902mqofWGJxu02sK0oZ2RuP8ryLgrn89iuEvkrBIAO1v9oTkgDzAfCHDP2y8yli9W6NF5fnBFfrBs9mRxTcgxXQN3rP6n2d76NCkBSvLtP9KFSRG+gu5emH4mWbK3APJLJrH03weTt5NC8k/vlrLwSQAfKUBxqs85mlztiiUSWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10220.eurprd04.prod.outlook.com (2603:10a6:800:229::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 08:00:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 08:00:38 +0000
Date: Mon, 6 Jan 2025 17:06:39 +0800
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
Subject: Re: [PATCH v8 18/18] clk: imx8mn: support spread spectrum clock
 generation
Message-ID: <20250106090639.GC19598@localhost.localdomain>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
 <20241229145027.3984542-19-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241229145027.3984542-19-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR04CA0210.apcprd04.prod.outlook.com
 (2603:1096:4:187::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10220:EE_
X-MS-Office365-Filtering-Correlation-Id: 1971f75d-c797-4fcc-0fad-08dd2e283540
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hxj2XBi/VuJTBiLSM5JHio1MYA3UgjkOwfXZRJp/4bUQkWNguOGAYqC0P7Tq?=
 =?us-ascii?Q?G/atR9+CDF1xR8pyM0ROp1se1Vk4D207zT8hP14RaFpdm+XBpiURjA7HiB0J?=
 =?us-ascii?Q?a5bIZTOn4jfaG0uSOfbcLLnlbKhpnfwkFZFliHuqkfKD0BX289av9MjvU0iR?=
 =?us-ascii?Q?96AjQIZbFJM2D45JMwtn+Qf6nSkygwXmctqbiael0i4n/D7EbpP71I2ns424?=
 =?us-ascii?Q?UNx9Uf9bBmE+CCSwqrvpuclMQo+E8ApzmcglAs3tV3cgKD0WNOIMfVkL/qeB?=
 =?us-ascii?Q?tBsqLdW2/XPwJOZkBcsz/2yMy1IzwMG2WoOHolt5hdaHL8qbwHcfUyxdj3BD?=
 =?us-ascii?Q?jUQVbqy8yW0E9IUtnZqyzKinRWv9T1hfVO2MxDQKJeeUUKo/iLi7qa3qfxmy?=
 =?us-ascii?Q?Z32jnco6rBev7RklcT0iBVtRK74XsMo9qLnxTV5wTPnWRoM76qTwz/oNJcFU?=
 =?us-ascii?Q?p4NeSAqvFtX1e5Q6baH3xiCJF6NF2ChWyiTjzXvxYFUMwoX60PsCfiXnmJSs?=
 =?us-ascii?Q?dL9Nj8uZhZijT67zWYZQMbqSGfkgUchejGZn+l/Il7G438fEvfoTv3eA6hpO?=
 =?us-ascii?Q?XFVxGE+aSKHu9CQLwe0xWzsP1QnNQlAytkOdGGbRRD938bS5YihhHkJ4BFrp?=
 =?us-ascii?Q?z1dXJHjLgrGsDSOQDj1kZhe9nd2LPerHvT/H4XnqY9IqhToDW44V2fKUrVgF?=
 =?us-ascii?Q?WYIIz4F23AId2WR5Lqlq1YWu71V80dKSudjHT7npwsIGkB2K87lnOcpJhRlt?=
 =?us-ascii?Q?PlwVSDjruEQmZY6y6bXMFdhpb/4XM6Kk+PEbSZPaz5HkfmOpWrcLMKPit/Cg?=
 =?us-ascii?Q?s8mQnyrgv+ZNkD62S6W9msBVtRtGEah3BpLll8syy2h3ah3T7r5sYixiYLWN?=
 =?us-ascii?Q?xegi8XkznR8HkLFJ4eRwQzMJzTEoZFVrsnzFdhgTPxCZyDLG+gETfh8x5vkJ?=
 =?us-ascii?Q?fladTu3XrDnWRT+cLRHVEZzuZ7F4ko06C5UVsBWvVME9wJzBMzxEnhyl3fln?=
 =?us-ascii?Q?6QuHsNEC84TzUB5P7vQVpuT/f7wo+N/TEwuw9oCnrzchn1pMjjCpbj1FK0ov?=
 =?us-ascii?Q?MWqOYLJ3F2Zm0k/2HmY/v1Ua03ss1noIL1DijD1ieGDxISYNEGAJJHoSTHYF?=
 =?us-ascii?Q?XVxO7CQOkIJRUVvISOoSq2zRvHnSwX3OkQqHjuuKGVCoiAxv9vQZSTG8lOAY?=
 =?us-ascii?Q?OJBhSHCl5If1K7hv1Q07CrgEHHkPyYU6hqzQ8y1BDTOQ1QXWCJdFvN7dmylf?=
 =?us-ascii?Q?Q/060Q3mIRLfK635R+JQ8GNoUrni2kS9k4ouQvjTds/CSXzAQlCp79b7W0F+?=
 =?us-ascii?Q?X+a1jiYtxa1+0GUaHKF1a5XxtIsswUjzk+qYDXJEHTGbVXic0SGBtk/CYBPt?=
 =?us-ascii?Q?DXEJxyejXgWF5CqrZEhYAHyFSKfPppiEHrr2Ck7lC7XPmXAamoyBtJ9+6/wE?=
 =?us-ascii?Q?/3zY6lKS7LNWf3VVAVZo6ve+q7D8R4g3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t1QAml8WsC6SpdUUXzwcDQj6Kpmg9aoRlqnRIMYrIafcd/+MYRLOWMiztV1j?=
 =?us-ascii?Q?YH+QV05oTaBwyOGQT2Q8ms4W8IOo3CC0EXr/lD5JVkxDNCdpHXd9VT1ZexsQ?=
 =?us-ascii?Q?STrTgOAfupwihe7pUbCMuU1BEpKoH4nO7tOX+TiTgX8ZYQLPDaJPyGmtWukO?=
 =?us-ascii?Q?xniCsO6GK6mWw0tIm+ZFPWZZP2ZwZ+VV+NZPeUMDLw86brwsCrmClkuRikYm?=
 =?us-ascii?Q?iLmpM8mSKMLJiEhSiBPlnoH1ztIYl1tVIpFRWEBDYd/PbxDfZvnmhWJ70xrS?=
 =?us-ascii?Q?MTMj6cAH5llvpa/Sljed5ZCfThLnkmdBZUZOReE91qd84mLx4+raN6c2AGff?=
 =?us-ascii?Q?602A0fuAurprKO/AcJr8KSY8gLgxP+m8sN+ToNxyJ/lYrprd7ke7hkdRaJFj?=
 =?us-ascii?Q?/tx8+nXNkKQIaQlijySPhiAJr91ZgHmHWwTObj7sIUlF/B11I/S/ZnsDls52?=
 =?us-ascii?Q?eLbO41wU9a6S8e8i2h7zEo/Prmbiqta1J/PKScvr6YEjP+aLTydNCwbwI3Yi?=
 =?us-ascii?Q?NL5khSonJ6dVbc0ZCe0OtjYcMkgiJXhdUrgy0zqRXy4clKgijdVR24MG8gnc?=
 =?us-ascii?Q?yUr7sQpyWKjIek98IkPqRqLsBm6v9zsY6Kx5Dms7ZGzR919P4Msbf/5F6LWO?=
 =?us-ascii?Q?Y+DFBm5EG8A43HL4i0WOIuqBLfZTyY1N/e33NhnIu2x81tJ3CQGyGHd+0Bpt?=
 =?us-ascii?Q?LsVE9LbdvTAQQDK3G8qKOH0/M36WyKTeVxWz8Mmuv4OmUhy8jsIt3fRS6QkT?=
 =?us-ascii?Q?7x3whYWKe3twI6CcfCxuy0NOX8jFmQS+gj0w2B0Xqsia57KbuWlbAuUHro3y?=
 =?us-ascii?Q?h4+uP954s/S7YZwh4Rn2SSGefEHb6UQ3NwBt07kdf0L8u2ZuCNpKqBc/0ebh?=
 =?us-ascii?Q?shYpAynJYTXXiWnb+XT5++znslI+BwN67/gjCk7670nJI6WRzDlYCAnAa9w2?=
 =?us-ascii?Q?GExGuf6GrRksY2Kc9dT07cipjVnguPjIygeP9qV52FhGzlX0gOMu7MWsx8HG?=
 =?us-ascii?Q?RHYJ6tbjVzGPmg8R2t/jup1mZMhA5tvv4NiVbcgbVyYn7keqqk1oDAHzO0DU?=
 =?us-ascii?Q?B4rY+aax5gT2dDmHkfgkRDwsPOBRfE7GsDaKhK4w7NNkFArHDrCHATyykcB9?=
 =?us-ascii?Q?1h+0yj5bu/AZTQno+a3xU2d8pT3iQylbFWuWYTCU7FDZstxExNQ+SsbVE+KN?=
 =?us-ascii?Q?FX++fxyc/g3Gh8FopibY/C9fMWjXWaO26yyAADjTw1Pk6+JsXnHTiGFTfJln?=
 =?us-ascii?Q?qLXfY5Hnrjk2xu9AMZ6Qo5HGyBiTJR52Bonc9vpxm3ZqC/KNpESNxKpjPYIj?=
 =?us-ascii?Q?EkyALGxEWDUhNQ9LYJ5HdnJVGOd2heyWgzs76TadVus1bZlacP33ZCOFKav1?=
 =?us-ascii?Q?i8lfjmJAyaGfsETG3YXRd4qmtklCrpwnUQlUX555nmWrVlj/HDq1PQuyQN3U?=
 =?us-ascii?Q?BNatSuOmHXuBRrWLy1sgu6W1+8tBJ7DbPoK4pOCCCz41NWHo1UFF8Pepd0y1?=
 =?us-ascii?Q?/elsZUwgoJap4OxOReAMmn5ihTaucCiTNz8ls6BaqwSjQVorc4ZJKG/CoQB3?=
 =?us-ascii?Q?bdpRmsaRev0wTMGWHPLHqOJB65tDO13z2fhB5auC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1971f75d-c797-4fcc-0fad-08dd2e283540
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 08:00:38.4858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmYKvZjVTqZRlqFK3YOMo82AbxR8UC1ePMKJbcSqtVByvt7dqg3ieBZV37kWqJZdvNdeIupHVD1fpqkhR8qOnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10220

On Sun, Dec 29, 2024 at 03:49:42PM +0100, Dario Binacchi wrote:
>Add support for spread spectrum clock generation for the audio, video,
>and DRAM PLLs.
>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
