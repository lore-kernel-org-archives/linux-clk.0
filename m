Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2076.outbound.protection.outlook.com [40.107.105.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFAE1581F0;
	Mon,  6 Jan 2025 07:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736150366; cv=fail; b=NoNF9kOCNIt2tsWstoLNSpzzQ5GbGOKsrLmlwsfzbrkxsS41O1m4WIAeL2WJhUb96xJqYQ/Z5BO9RSFsPOUwrCFrvNQ6Qp9Vhl3tHtxm/GiDGfUwLCyi9uMcpcgXt7wfavgNIp9RL0lvGCAb+yDLcHwBMUF4zzsplCXcJRwgVqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736150366; c=relaxed/simple;
	bh=1n1jMPRQqB4D9cFAZLRAcW9KE3RVlRdWz41JT7Fct78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jIpyREfUW7Eb7UntZrqqc8WrS84JooKzQMIoYVhb4DFznoSmPxVCUXHwwsFwHHkYwSxUJs7Yjcb1tcKW0l5Ql2Y2+ZDprNvIoO0UihIvntTmr4VQ6lPSsLnRvXFeW0GY1FG5rWIyCJmDHsNF5+NQMz3qX9ACiRCo4WKQekNKtW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DoyU10FO; arc=fail smtp.client-ip=40.107.105.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DoyU10FO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5LnZJdBC/Np2wd9ygyyp2cuX+g/v8TbXVFK2l1E9yrvRtlCnVec6PhtTpXKZ7Z/SSi57LZ/zoaPICFFaZqDK1hG1KB43GWGceVS/lZ+FpBvZTbXQkh2kUxG50clpwBk3M33vhLT9ci/nKOcVnPWo2lFPvYtPtUh1LV0vA3gFqAPc+Bzw/D5zCG2d0hDANJYc0ofjv6qNOFpresn+2pY/D/j88prfno2ZMYbdI8RLrvkJXGGGpS+36WDeO2vEq1vRey4tUHgiNTqlrlVeJO6lZaQxeez+HTHSPfp286NRDdF1daOIOMPEPkXDPW7GHzLGXDc7TNc/9P1Qo5VwW7LOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1n1jMPRQqB4D9cFAZLRAcW9KE3RVlRdWz41JT7Fct78=;
 b=Yea3WuNZDoXaqEMjmTR5tqUgwTsf6fvKZnWMLcZSXJS/f8s2VqUpTRMAzEMG2PiF0J+LZspHvBIu2d56nNMOTDVZciIl4e/WqaZRJgYKMMY1eHcyQ86+2Sk56I6khh/uWoMkRcBJHtq5BsqQfQgCn7Hi4l11JcR3D+ZfQmQ1U8aG5rAWJ7Mom9PSEUsE0AQ79oxcy+006xNJHRgUPaxWMgFvtU1O5PoQ6fq8fmnPYh77Ba+1z9/wUYa8ymua2+Si3uDLf2nFxfQo+XSX/D6/o04XuTVQvaPwl+xKJa6NzDx5AXAFIyzDVVN5TbLD8H4WoN9CGlPudWL2H32AMlMH4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1n1jMPRQqB4D9cFAZLRAcW9KE3RVlRdWz41JT7Fct78=;
 b=DoyU10FOjjY+859nmxQZCAul1kGo6gBrq8c1KCIMc+WT1HNeATL5U4cpLA9ayPnEUU1CMrqXXipx6sYSUz1D44+s6+vrhFX56ooCM+RKFyHuEqRI3EhLAQqdbsdHKvpDa/Zok7OH4TRxt1R4HknQGSyEUHvujtd6lDmOhC2dC8HMfYQwMowxmNt4yb8jpaXGN4h3nqXIXfsvtaYdX+kjC8qXsDryww510PUWZxfZd1AzUpremeO/kLhzuIlah5seanxsPd9Q8qmPecwIqhhjpLInKnhBQ9M93VTtxV2QTkTcuZxpFAQNZ2rD67xUu6R0RORY9PZvqeyFSJ+fSg2YDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10220.eurprd04.prod.outlook.com (2603:10a6:800:229::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 07:59:17 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 07:59:17 +0000
Date: Mon, 6 Jan 2025 17:05:18 +0800
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
Subject: Re: [PATCH v8 11/18] clk: imx: add support for i.MX8MN anatop clock
 driver
Message-ID: <20250106090518.GB19598@localhost.localdomain>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
 <20241229145027.3984542-12-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241229145027.3984542-12-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 11cf6092-789e-455a-f1a5-08dd2e280516
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XiY3jmUjL5PR48wrGL57Ybxn36ZrR1o8lMu0KOPsKfRuXB2iU5XO70vhQZQY?=
 =?us-ascii?Q?lsesV14crbZ6X6dDa9ZVameLnT4GfSvnHcyj0/pErwrTOvwFUN/Kvkufxdjf?=
 =?us-ascii?Q?pqUbWT6OaySH5hl2jBdhkxOWkf7w9Cu+Q0r+i/tK5efDnbAf2tWTigy+tdjq?=
 =?us-ascii?Q?7alJ4L7d3v/H9kP7eRHQG/emq7Ok61BixVIRAMYOEWFl5xr4KMou3wfT/whm?=
 =?us-ascii?Q?GWB7sTUaG68oE9bmIyoNDa7DbB8eO0REvbsK6DU5/99zaHdsZ0h7p2pPLsNv?=
 =?us-ascii?Q?Zu2BuznjasDWjdBLCt3Ly+wzumJJCYuYnVYi9wdEbRoKSaYGyn68esaWw2Te?=
 =?us-ascii?Q?ALn7sG3mO7r44TjImzHic1rswiUaqL5kF5c2q3csbMW5+rP5Q4exIhiKFyFz?=
 =?us-ascii?Q?XIFiwxEtw6ivuUnXbswu7MwU5aXiXClZaWyh41iPL/a2gkeojqAI+6I+khMu?=
 =?us-ascii?Q?RY3Vkj767bnonuM6LzErXlM4sXDxZcYOXAwAJlcqCC2KQEAKOF5jF2qBaVgK?=
 =?us-ascii?Q?n/7HDxsQ4RbihHkUqP/zkvRvYdcLC+xv4+UoqR+290FMZOxuwqgPVGYWp03b?=
 =?us-ascii?Q?nmiVSyA0QnmaeYi0z3Al2DzVs0jDvwuBeuk+f/SuNthazIaijzDeNi7hNUVm?=
 =?us-ascii?Q?CqVQiDy3y2oR80ZxUCfHEEw/39CIlLVIP9TaV/nzKxXwmyFVCF8yoJ/9dUmU?=
 =?us-ascii?Q?WLQJEbniVVfmH1MrvuGgkqq3rnhkp0hlvuBphtUXArwhcTx+mVsdPoz1GDbX?=
 =?us-ascii?Q?RhdZ8CsmFGfLoUr00fwz1tIt+sa/kx6sHqZsw07wT/K/KfBPPDv6kdq6hV3V?=
 =?us-ascii?Q?+pxhbkJ3fj6TWHPNtj5+w6BElAgq08DiFOHY0AtD1ocTwCWXmS1j655uzQaN?=
 =?us-ascii?Q?SGGC9WIJ2qDx44TUKbx83IPpGzW4ZiqQQYv4EiLkFOvWMD8IeQDzMf9WXQU1?=
 =?us-ascii?Q?RT2tOd21o9wyKDeuGHOiH0RPxiEJsjlD3pTsPSn84opsdnAqbDPYrZkWVGnE?=
 =?us-ascii?Q?4U9v4vfM+sOO9x3i/ULp6gGC8Z6Ro9yf40VBLBFLy0yubU1IfN+lQV96JXx/?=
 =?us-ascii?Q?VzLJGnNv8wdcuW6c97XXuzjSQBUBJY3oATkxiCBjmRYE1zey8h7HqK908vw+?=
 =?us-ascii?Q?VL5w9DxKizSwyYCGJohuTrjhwoTgPirzq5bTrg2rRkT4/oQSgAD2zJAMqmIO?=
 =?us-ascii?Q?DSn42kq4gaSWzgd64sKjWc+RpqHtQp+Wp4Xpna56kuvxUxTaNfpCMb7KADE0?=
 =?us-ascii?Q?zdpOQK1jYYiLXTSaqvbGupCinvyzzjXRfhsyrrNSBeoyEKZ+Bz60hU3qzQgM?=
 =?us-ascii?Q?jazZZQVHzZRVsBl0FEsnFv/yxUGpu3/FiUT4D0RLURi/y+2VBCvs2s2zNvUZ?=
 =?us-ascii?Q?m73D7Cr4fVmHXQ9e2fPC9vP4T0sOSNqnMLFl6dQ4J7SGJmyFghJI2kNMxKTV?=
 =?us-ascii?Q?OLnXwuM8tf2ifXRv2ywlPT3WWuURul+N?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AyUDCa6r8aoT/B9Tktsz7e23rN2AmwxPK4v5cZ5KWI+6xpcgyLiXSX45EDrP?=
 =?us-ascii?Q?wq2pTEQLcye9saD2iYuXNBVEF151UFzsSIQaVURbPcmVR+Mx8X3AC6fa0rti?=
 =?us-ascii?Q?hwFO+mLeGASIYsbTI6zNZZYGkvWsi5sl5RTpndndLwwNgHF7WvetbrwRzt83?=
 =?us-ascii?Q?ym5btLBUqtYKwQF3LonfUhkacIToNh5Cfz3tYAVbbDZkiukV049VtOy1GHuw?=
 =?us-ascii?Q?RCkYhy1xO5SN4NqZ4c6kCZEaOEbk9XB9+jUr+uH/pKXP38S2vsb7uwVvKM3Y?=
 =?us-ascii?Q?ysqZGo+KUH7eZ03zvqxapwTuDaYOY7urBGBjAaVFsGxdQeCDHyUkt6K9XGKE?=
 =?us-ascii?Q?5id0F9Zs1iQcwk4xygdRGgCnTkljimZfwSchgLh2iU1+4YpaZRRRr4gD1Y3p?=
 =?us-ascii?Q?q7EPSEGNSTeqfFIsZiZnIzB9+l1ZHVhTf7GfeCuTNOA4+js1NX1LcLpftFsL?=
 =?us-ascii?Q?LURvfGHBDvOLRfrx+crjcvMUSnuru15tFBGosTI6DaqCY8sNRbxT40w2CDEi?=
 =?us-ascii?Q?oPZYIOHk6Mq3eqvUZLlqhiMNJfEDJU55oasClOWeSOOApnugiSYe40BUpJG8?=
 =?us-ascii?Q?r0YB2MtoX1dfI7jy9jMoEGAREhDZ+2tu2OB4V2f2dOwYGwrMkwt61eBav8eI?=
 =?us-ascii?Q?V2IsyNjcRIkNzJdI2d8pSr1OHsdlmNHVvlVxzRM5GyoVyarvecKYDZLydQk/?=
 =?us-ascii?Q?2m73dTjA0G63v7BKA0lXYw80aTrvqVLID2tSAhuzArIf3zdcgWQeM4k9TI8u?=
 =?us-ascii?Q?WsRLnHDGrIe6xf2VaJDoAjYZeoMOVcCxDjgnilBnX2Fcw30S6CRXuPZD+AP2?=
 =?us-ascii?Q?/e/KTVj1IAOaH/tLbN3LQsFRpvSlzlbyaifudfP//JL+B7YI8+/uAGrwiPo+?=
 =?us-ascii?Q?vc1TC5JqjDEUxCjUVI13n7nUBo3pS29jp6z8lyyYHVQCtK1vfIL7h5B7Dk6/?=
 =?us-ascii?Q?tT09ETB1drqmyrp3XMkMVjhXAnQTMZpSN1ZxDZLsG6LsXOV37Bnlk5x0altH?=
 =?us-ascii?Q?iAjQhD1Ka9PQpvdoXq5Y5ykCSDUeXCLHVAmoMoPBVB92aW0k/Oa016xgm/h+?=
 =?us-ascii?Q?UGnxc4/7g18SAZtCmyhY6M4B8ZZYLGYUwCIb6EmJe36r++Zn9crXO+Sa+Wg/?=
 =?us-ascii?Q?9z0H1Jswck853shJKBzYv+GkR1EtzPklvGcmEXe8O4wBfKTkkg2uIaoBdCeI?=
 =?us-ascii?Q?fv2rG6ZBcwspx3/k9jnaQYBu6HkgDmQosq18dzbqomsvUIQWCc1VR3mSRAF2?=
 =?us-ascii?Q?Ef3Fv4OQ2abd2vuoCqaW8bBkr8yFMMF2AkBApDAfRfLHZAgg7jcpvnPR94ob?=
 =?us-ascii?Q?YOwy7j9avuEBBrmj1TNQT2V0RwwtHZjWx/qw0LtKBUbHVZU5UxjbJ38zLy0b?=
 =?us-ascii?Q?xkoAB6DDYXtS+TGl2Mk/BbAPsh9Kk+Ugf2piEBvz8L6qDH61Pwvg2LY1aXmx?=
 =?us-ascii?Q?sxuX683tX0Yt2CrkYyAyLDoZbH8Es/tbu6tNV6aiaq2INJqx5cq3oTJsUUfh?=
 =?us-ascii?Q?UPTgrVPm2vFO/cTPXz07ZqEQURdLoVwTKmpwB9Mg5M+fAVp28CB4PZ6fK4ZW?=
 =?us-ascii?Q?UTyIBUsQ3Hza8UIfYJYM5sPpPIEKSMENefpWNQmd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11cf6092-789e-455a-f1a5-08dd2e280516
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 07:59:17.7043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTid9szi5jo/BP4RxPh9iNmunpaF4w7wXTiDmvA4ztwIft8PMXAuxES/vDwG/d/e9PHf4oEh9fYbkK82oqy2EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10220

On Sun, Dec 29, 2024 at 03:49:35PM +0100, Dario Binacchi wrote:
>Support NXP i.MX8M anatop PLL module which generates PLLs to CCM root.
>By doing so, we also simplify the CCM driver code. The changes are
>backward compatible.
>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
