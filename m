Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2062.outbound.protection.outlook.com [40.107.22.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F0D15D1;
	Tue, 24 Dec 2024 02:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735007227; cv=fail; b=Gar8fL5mE4fTpcIkB85FGh8bOavfkBoL/tP0wXp/LAULPgvOAhEUKKxryZWrWipJcOL+8RGVRefVHP2Ruit133Q9t0zfKdNBIRVqXEKkUUWPgXixPBDDrVMD48qfIBFBhTLtgzA0WywXPakkinfKFTIecBgRXAeka1JIr9M+TCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735007227; c=relaxed/simple;
	bh=RmsqO/TGF0aOWXGFXCmbdqcXilE2mHLhmQwcHOkSnX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Jv2GtJRFS5V9zteuCstvWwcBa1ZnPkQfOdQftqORZotEkWvDbQkAn8Oz4doRecE8ibGRRt36sVX4/wNqUpFgUbVxyIZcRSVpmjA+EFQSwIMeVtU7S2nF2ZF47rosp7k8dNiw/rZi7JeAIwV5VjQDM4HGZKuP5G13JVrvuHs4WEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ewdIVMC9; arc=fail smtp.client-ip=40.107.22.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ewdIVMC9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwMarJz3xcYk2LgGOdJjYtVGMsWASmyd6izrya6zNZ8f/HwnVjTfcLPbnOrAAWXO9kTyuwhONp1SVi8eJHsolHqxhQq4OuEWT3sJULFXn8lRz312BS4WhkilBviEdQlE9yQDbHYYyVCdZ+/qqhAgEiG5b/lqq9Rl9D3hlNmePo4bdKOwitVwVzfms/izhyC9GvL2IUPnl95GGmZgiCDCWukYQYdSD7StV+QZHxuYnAWyM3tfYihbXGQHnor/vp2lfZdYLQYlZB13k7dbVbeclKzCtT+2QKX7LHrpqRWKiQUzwLwoPBJNWkdgCy+K0Oq8R4hu80AVnXzsX2L7muyJ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmsqO/TGF0aOWXGFXCmbdqcXilE2mHLhmQwcHOkSnX8=;
 b=mOhfrkhJK8dh6eHmMxhdonHpkx+3Y9I581AI2R5HF5X4dOApgt8TWAjTbIyOREnyGTb6571G5wxX1Q7kT8nv7r8TH3lBvkGgImxzppe4vf8xbPI24xJusgLCITVSQYJjc+WRxjHzssEY1ZeDQxnfiXbdB/P80LHyHu6XQev0G8VrmaWX6WqNhnjAu0t2BUnDSJTlc6gCxWAhGueG4mg/y8rykCqgcsxyxncdsHKcDJU0cUwVEzxjHAzpzPKCCWxVOKIe2HffWPF0B7ianGLJt50vDdehrDPqphbxP1IxdA9URd1pDkv185Em1upqWmZ+sA6/MGVqNza/oRKtxrE6og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmsqO/TGF0aOWXGFXCmbdqcXilE2mHLhmQwcHOkSnX8=;
 b=ewdIVMC9zhsTYklx6GbittaYTT8aqDlrayD6M3al0OMYNXweD2e63tVxGEUK2wVGTvUCxa8k28bMK2sgQkSTlKiFCPa18doYq6zblOsgak7pkV9KnBVOlkvkxUnmrWU88/n8/0huG0golxBP83pMu1KTO/LvahRMhNlD5Ajtf3IMOHsZszvj9TKu0x1fMSrOHOBsHwKqP4dn13qH17R2WvSjXMFepqzAd4dshYyEcL4CFJ2yE1GTR9qDceMfJlQN4ayKK+oAuQBbYyUJVOE4RDECYybTCNBNQoH0CPwI86UoLHhxOb9aEG80SNKOOKNneBXqjp/IjYhwnjtSD2M0wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DBBPR04MB7929.eurprd04.prod.outlook.com (2603:10a6:10:1ec::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Tue, 24 Dec
 2024 02:26:58 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 02:26:58 +0000
Date: Tue, 24 Dec 2024 11:32:30 +0800
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
Subject: Re: [PATCH v6 17/18] clk: imx: pll14xx: support spread spectrum
 clock generation
Message-ID: <20241224033230.GD20573@localhost.localdomain>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
 <20241222170534.3621453-18-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222170534.3621453-18-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DBBPR04MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: 49996765-db2f-465d-cf57-08dd23c270e6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/uCfp9hl28xE6WNwCK4O/Dts80VKPBF7p4Ry5gmCvtepBWFvQAKJkRC4zv8p?=
 =?us-ascii?Q?Z8DM4xbbm+ug2/fs4bi+p+woIcgr3PJBuXgbmV5NNJ3YXWArLBxR6sb1dF7O?=
 =?us-ascii?Q?vW8MEL8Am4KJ0ucsueGTpNEXnElRcdYX6N5BmVqidP1B3xrf0E2eHEI35m5B?=
 =?us-ascii?Q?bnRAUHxC+S+S1PcpgkV8YwEyFFkSVgINbOqxdQEl4mmYob7l+17y18lfZhhT?=
 =?us-ascii?Q?aw7BDHBybgOIwVPd62e279r0KIu/Os3YtDSBBekAPEgYEFL5D/sGEu9mRLK9?=
 =?us-ascii?Q?sFOd5BTkD8peeOMiRzlFMaN6ZDv3r2cJ87dDYAEW8NeI9ombtW3PSqH6tjLv?=
 =?us-ascii?Q?5lpLEmhkIURlFxw9pu9L2T9ypIEVC9vYOaxJTpBcEIiHGciYiQQWA14ly2uE?=
 =?us-ascii?Q?18GZZ4Ox4lIdQZRDmHPCXjlz5r8ZxJUOh3BwZXRQ7T3pf1brH4jdpOzQJ7mI?=
 =?us-ascii?Q?gQJNygZ6O0yc3dFcieAwLSoE3uhwc1Lw1Fu/KJR4v5DAXM17iFTB5LX8o9uw?=
 =?us-ascii?Q?/FijKo/ucpoiEP7ETtABFW3fQZkHQ9L24eYJPbnJvBXjVqU99Vnb/A/eN6Hp?=
 =?us-ascii?Q?wrxS5kgArOfoxXrn9hrjS+xzaUtTq7Vxjp3vcamB4MC49b8gNtWRZz5HoZVm?=
 =?us-ascii?Q?Rq6OXQ1HgM3SOxZvPV01WqN+FzLPQCH3E1JIuK4XopKRLMnXBD1Sri1s0Pb2?=
 =?us-ascii?Q?kQxie3zl/PlSuJ5Q1tBi56Te/c/bUcpnYMqEY0J0jLgBR5ZK6sdPjM5SeJkO?=
 =?us-ascii?Q?SINZHllumhM2wI6j/6TixcSDlMpObOvFoHus+GxsyjtsblkheqyP9RHXoxuE?=
 =?us-ascii?Q?pvcOyhazYdpGMrCegC7spLNVLHHobeVd53y0sJ2uuYafa1PwAIBUmfPw6xOQ?=
 =?us-ascii?Q?utDtvNE3myj74FaOwdnyBXlp117M7BNzz5iOWc9XGqS4BM0+rkWWeSORaM1w?=
 =?us-ascii?Q?h6PfdEdxMhqYaiKa8JQU1O7d4LzMYUx8Yj0DSSDFMqQBm9AQU0ykv5WrrmYw?=
 =?us-ascii?Q?xIgRAcifqoM6ui1d1t1Kfz8jDBZMNqyoRUTioZFerK2B6gxrRxaagsz4iQxc?=
 =?us-ascii?Q?Gr0JvB1hscX65Jvgr4o2Nsd4gKxkjpXpr2nioO8E4XTuiUZoEz2gJRwyXarl?=
 =?us-ascii?Q?RSWauJbozx5SWoGKSrbRT1IKGIbaGzNP14/J1rOnCZP2VVtUi4sCXadK9nJS?=
 =?us-ascii?Q?X9QHbZ7wig5FcXi7kaQaqiH+3+QZh/7xM/ef9WTSdSJCcKB8ip7XqlyK6Jcc?=
 =?us-ascii?Q?nfQ7V/zm4bb8jkZ1U/ezBIFcB6x3uzAELdi+oRKMRBYu8mbK++YClFdH01FW?=
 =?us-ascii?Q?YDD3NFxDAX5bQNjfirLBTJb+Lku3xQEhWxg9xp5kXFxOFWNvOvHnqyWw1xcT?=
 =?us-ascii?Q?QAX86m0//3M6b03B9MBE36H5VSYVRVI8pbOEkwv9JDjG8izY/jud4fPVPYBU?=
 =?us-ascii?Q?FJ9s0jdyZuM39xZlDQQ2/qpJ/OPM/fQC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ueMssTpieOU6uzTSRsVFs6eiZozdToHFaBR6jnz63Vz5qoFp8l7uQFen4Hni?=
 =?us-ascii?Q?ql47mhoIJpXzeu61W/6/LaQxTf89nFxO7beRwFRdL47dqlVusunkFpx4UbMR?=
 =?us-ascii?Q?mGWGekA5We3HzMmWto942WS++ZqjXYvWzkQqUaWamGLp4vhOOwMbWItG7qhS?=
 =?us-ascii?Q?6KIIb5Mw9Vq9W/HGDBMaDYK2c2qYUqAGv2cPIg3anDYe8ZkqJeL1mzLueFBh?=
 =?us-ascii?Q?vQ1dhqmBWycnMIvN0DRYfFKL56CrMdBelr0TgFTA8e7h+WRfYJEzb6t4tq8y?=
 =?us-ascii?Q?3RlhvWXgmew0VBP82QJtBJPZ8aFVi74x5nMpN/lwESafm60Bji4FcW8FHbVN?=
 =?us-ascii?Q?uMf17QfGkS15KULUFK8puZJ5yLbHZD3sZMv8kkiqrxvRz8xOkWK9blNZazbA?=
 =?us-ascii?Q?G++JidZQ6TnqwK6r4d+nijdkuucw4yDboaUvlXf4AN1ZA6mVpa8VhXsrs1D+?=
 =?us-ascii?Q?wja4Lw/lzo81nv79lTjRqcd7BxDfpg58fkEUJgbY9fJP1+DYCVqHqarAhoyL?=
 =?us-ascii?Q?bJacI72o6z+sTn7UQKRKL4M+vQEqQHEomH2qBy9qhMZ8kZ0b+pC+vHBlMKdE?=
 =?us-ascii?Q?b0yMpca5l/eR7mFYqnqVrEDm17nnjwaD7YAeT+2gKYRBIbF8b7FJIim8uEgu?=
 =?us-ascii?Q?uLyR+Ck6uO/iIeNWAjl/Tr+HaxQ5fWJ7SQf3ntqz/LAfJhhmaRy/NT9nNZUP?=
 =?us-ascii?Q?c+L4rvLu0vVzYNU86sSkpVgFZYSGgeRILzbq8PJzZVpk9xCNQlhxRkvzlZxp?=
 =?us-ascii?Q?zqsOYXRNNOB5fwgc55tcUAI9+OYuPO4X74Y+Wg/cni4AJxAiBpOu5jJTEAkl?=
 =?us-ascii?Q?L9k6JVowToJMN0HZOZ2j4BsWJFI7Wqs/yV57aYLKX+YbNFn/NcS8wT18O6RX?=
 =?us-ascii?Q?M2qasAFz8GAoCLnIdiXR9YkOZmJKilu9kjOkBFEZyBBc9/GQOp2qa50GRXqp?=
 =?us-ascii?Q?nLI356cMmRAjSltC1FSJwmPECvxbp+jZalr7s2+BLbZ0B9+1p/pl1dV5z/fO?=
 =?us-ascii?Q?f3WmHrB5KAFpyP9yxlAE/YB4/d0ckVa3XNBzW5ffBH4t0GLMotmhl3BQna5U?=
 =?us-ascii?Q?28o+GiF4Gi5msXBq3ne5VVD7Ha0UjBEZP9nmURRzI3T6UFfytlnDytGas3aF?=
 =?us-ascii?Q?WzuK7UPviu90FyW7XcEyvir9SJ4tdaxAJSs5nsYgE0AVeoT33Jpc4qBQAsLB?=
 =?us-ascii?Q?4quHxHur1N8EJoW/hNykGaywHFwBKVSGSObN1p0cuIsPQFTiTNO3Z2drUXjX?=
 =?us-ascii?Q?4aoLHmNczFcMVMCQY0zSHyoPG8XeCVWk9y7vli1SwQx4Ke4yAGU01ORW51Xz?=
 =?us-ascii?Q?hP4137/9oTAvHEfyzLew572m0/2XNiqbVbbpC8jD2UrxN/otCa3U/KeJkkP5?=
 =?us-ascii?Q?wWvyg5HGlXSsbJd5mvhqwSqZjO5np5p9TpjZNqsuES7nKl1MjVicHU/iZkWv?=
 =?us-ascii?Q?708XtF/VMFcGt6JbynR9zRKEUAasoA8PDdrYibisDnyZ8RMBpGRgOYXLZS06?=
 =?us-ascii?Q?isKWAdXtjL+OobE2sZWdfLIcAuTiMH/fxiCMSjQbySV6NQIhBg6ZPOKPK1Gk?=
 =?us-ascii?Q?ZC/60T7I5iDq57iyPLshc3hOE/9Ob8eNcFvPy+J6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49996765-db2f-465d-cf57-08dd23c270e6
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 02:26:58.6883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2bsUCrPAQ//aMWjZaM9KNe2zL7UdKaRiLeNYsLPjp3uLDMSpRqvVX3gJMSIP3RJgFC0azjc8UTDt7p4Rf1zDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7929

On Sun, Dec 22, 2024 at 06:04:32PM +0100, Dario Binacchi wrote:
>Add support for spread spectrum clock (SSC) generation to the pll14xxx
>driver.
>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
