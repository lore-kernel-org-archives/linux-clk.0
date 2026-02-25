Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013054.outbound.protection.outlook.com [52.101.72.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D7B3016E0;
	Wed, 25 Feb 2026 08:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772007266; cv=fail; b=mCKB6R/nMLbLhxjWiBuAp3eJlhy24EL7oi0wKsNHVJg9WNswLFAwWKDBoLClDbK4We8/qOZhRShAzKh8VBpCa8H6dU12QXZQvsQ5XQLJeDPsXvqW1LJLj+U0hxh6rFBfwq0zepeoU5M8lREeVGXjLjTZWrnNqjDeodJIHzyopTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772007266; c=relaxed/simple;
	bh=wVBoPUnTh3dGxUeZ1lpuANBAwUgeAj21KnZ5GP+C0mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HvGV+/liszcE5RUNw620WOMgyEoBX09xXkRN7xIqQA2xWhSq0gWswXaebFFKmVc0c8v59GCH+F53+5GDHr7oD/joFRbSzWivvLecHRipi5DAw20J4jdTAdxOf3dfsQNqh2qil/KQyjBF/DyY5UtvFjF+c1zWouwqJtUmoJCjYyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NRBhP+aT; arc=fail smtp.client-ip=52.101.72.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NRBhP+aT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fox4tdZ7y1GUi3Raeo/Ii6nxJaEUWlwRBfEKpRaW9Wi/sm9hRVwlHvf4lTWGS2WgChN6wbwWXBY/hFH0LsNruXz5myv5RkJnfxO4C6C8vsF2XdM5qzu+2nlNo95/2Ekn9EMyUJUsPR/bZeKYeROGxnula74dxCqxCInHfPbWQlT5h8JKXDSnQoqbSItvbCf1kpfReKAbRJF3VcytoHFFVSZMFTyLuy+4TqEqhklOfRfV6y5K51CwmGLMGfadl7yBzZK5Jfq60K2g+cjvWe0JwU/sI4BtZ4HfESaA34Ja6hyTvHQeZZV1v6EW3w1uIkH/JLZqU76TAMw+ILZdaXamag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BypvY7FCk/Vy+mMebpYCbwRrnnvNfIyP/hPsKx45jhM=;
 b=nluVGsH10+xI2eqZegNmpLh9CrHCL0IaQk54wUylIGvYr0Ibo1IUwDAVUp7zrwQMdHhIYfHs6PAH5OK5ppKiw0bnGlrjgdvlUnIbTuCi4lnJ07meOQWT6rxo77FsB9yb+Vbs5dWG++nxmrh9ExqZzZJKwcklkyrMTeFjnB/t/l5L8QUOlTAqGqJrD6a42mirHjEwu43KSr2z1vkoaAN6NFAbJiAzvjlj5d4Eu3OvtDKWj8wH1rwbBI98CZgvVwlmFBodrc9FQHFyZXCqk/oXp5F4OeJZg659/9r8mSQe2V0uboTUvpMulHFM2QKxRNguRdKM7Klg+qNOhJz8QHMY8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BypvY7FCk/Vy+mMebpYCbwRrnnvNfIyP/hPsKx45jhM=;
 b=NRBhP+aTzq/PU947f3qwqXuoDN1vpAb2Cn3O154ybI9ot+ln7l/BE7XcpmVbK6JmBOWk7H+6UWTualMlC6GxU4dtfuB827W1ht47DXdMNVBLjE9GNZcMf/FAbbF7LJlhlF9LcwFjdsAVJ2kdjNcia/RudNaxLj+5FHNk9rT/RwtYA0SmSUrct94V/s8qB2JxZAyrLQWjCxJN8MIYqYwm9fosKPCYq/iFWJ0PwbRuKA8jEacrru6OjJj3x6vx3HS/yDKJcYgzOsx8vzZrFJ0sTb6nAf0/KFJlCXHoabHjTRzVlAjte3IxGfC+Zz1YLtlTnfyTRNY4KyDRD1VqIeJbcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB9325.eurprd04.prod.outlook.com (2603:10a6:102:2b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 08:14:17 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 08:14:17 +0000
Date: Wed, 25 Feb 2026 16:16:09 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, daniel.baluta@oss.nxp.com,
	mturquette@baylibre.com, sboyd@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, rafael@kernel.org,
	hanguidong02@gmail.com, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
Message-ID: <aZ6vyQw5a5LhSCaT@shlinux89>
References: <20260212235842.85934-1-dakr@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212235842.85934-1-dakr@kernel.org>
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB9325:EE_
X-MS-Office365-Filtering-Correlation-Id: c8b2554a-3411-4d6c-7303-08de7445de5a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1l+ki1JGRpcXi9zja3iZ67TN08RWhtwG5QqBdi/Wf52EemoeeNqsla/8recc?=
 =?us-ascii?Q?OEJnzGaMdr/IzGu/FKmFLFtlIdvn91sehzH2dRLsypFRxCFKDLXkez1L7JF8?=
 =?us-ascii?Q?O6cMEx1GU7/aYBqjwOCCwhnN3o//Co/ImC2GqEcuIrsUPEdRLB78ORzoHpKE?=
 =?us-ascii?Q?vMiHBXrkYc8Bv65QCb7m0JOGc/1BqVbJIJADnE18LD06xlRpihf8+P4LxIDt?=
 =?us-ascii?Q?tXHVeVDPTOd2vpdYvojVEEHu/CfaNKcgTLifjaub8CDoR7L5Bhq4a5FztE8r?=
 =?us-ascii?Q?XDz5ZuZu1a9ECYETnQadF9olXXp5QZg+iovOgqzoSXkjTw/qaX4rxJFbCyjV?=
 =?us-ascii?Q?j5/3hQNakeT/oJSgsE7tzro1NK3O8bT3H/62yXV1GMZJx6JW/r0jc0ddLzhh?=
 =?us-ascii?Q?3H69l5OcYCB1iGUHtRU7HdCTMDGn/6AvlC/WCkyZ5rnOEd5zF6lWCb8noMO0?=
 =?us-ascii?Q?F0pDclNFlm2Ci6EEc606EuNj0awg/e4Ra2QNG0EmuhvI6RX0JS+6sSpRQKPu?=
 =?us-ascii?Q?IhuasFGtW79U3qFZqwYJhuXF0HCDyyhNOwiI/dMc26ob3HdZWX7xTyCKhX80?=
 =?us-ascii?Q?652nIdC9sXDxGvjsPkHa2oKeeRFkokphwrTlE2h2XTcLPH/vDIwFQn5mAWB8?=
 =?us-ascii?Q?nlG/g2pKaU0UdqTGQH3b0UFt96cCrXhUDzzdiuRcULHuaFdj9S3jCltL+XYu?=
 =?us-ascii?Q?HAkjoLL2yQfRmOrnhBpgWQqi/wIlMfxWrIsjd+Lf+6vNM4GyWJ8tobotSKyC?=
 =?us-ascii?Q?txhU5Ihu5yqZdJ5eTONa+v8vfT49aJSBvWXXXLKD/3mAXF/gDI7hfFX/uPUq?=
 =?us-ascii?Q?izbIEl39U5aU/HRROVqwvEw2MOmjLIETlQKr/UUobl5I4rkqFeU26giv5F8k?=
 =?us-ascii?Q?jOXcCysUBY0WTFBAarU5+B/tewcEsaVcYyNfikTMlGrQFItIS7/+NI9uS+De?=
 =?us-ascii?Q?vplng86fBBPulcEefLSr8qri2tw1u2Tivbi6ApTj8OCnIXvY5Fnel7BUcheh?=
 =?us-ascii?Q?03rdqMGwzdH9vvVVhY34LLPQ8JVR4cyOOTSXKjDq9+X6C3UEJvxxOPgiIsct?=
 =?us-ascii?Q?B5xh8vtVfZhUsTSlXZidOgKcZTI+r28GrHdjrA+JaiIuQLtZv/zrj+3KLygF?=
 =?us-ascii?Q?YI6S+qa890nUq+rpKrlTnMyMTWClzUK/EHMjukBlcegK0BurVgkyr24+WIPj?=
 =?us-ascii?Q?GArzhhG1y2IE95JCM8cNujvzWRM5RkFG7N9Nw6wpalRCnYo2xGqF4e7zjbMM?=
 =?us-ascii?Q?25Yu7Zxn75JAC6seb6gY6QCX4t/g/3Vfi6zx/xBkJCb02DbhvLe2nLDtq3Ru?=
 =?us-ascii?Q?FtsK714ifMjqexIPzcuVr58fiBflAGefjEHF0ctFgpdcRwK+P1s9TcV2VX3e?=
 =?us-ascii?Q?7GxPFXC8JWgcojjBBb38MbTdKtjgm5cke4AJhkeJMebYomUt8p4mzl1cTrPd?=
 =?us-ascii?Q?DYNksCwn0R1yVeKZxykv0h2iW/KcIUM4m7bU6XBaaSbeqou/u0HFnfiAjUW0?=
 =?us-ascii?Q?Sa6bKluYJGP/PMYkZ96dH2YLSx8AcEUZRkVtFt+x2zi/F2VJPIUQAbWBC7oi?=
 =?us-ascii?Q?Ivv9EvTUbJwg5jOOOFjyszHUmnnGTBa6pq8X9fPT8owxPqDBA/LwFBSNCF4N?=
 =?us-ascii?Q?Rpxfp3vsrhOwDT+hbRcf/L6ZOeaT92jYPsoHsnienL3k?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VspT1dIoD/FPHL1NbQpNwYVWquZEA8vZhJIlUiBBwTVvHtO66R6Lqz30k7tR?=
 =?us-ascii?Q?0tH7Ine4i8oKdvw18y3mE9u350JsIbQUZ2dDian0LVA67mMv9YthquSM2TNZ?=
 =?us-ascii?Q?TfWHbJsyR0cwk61QtUsvRYExlgio8ah2m5W7ZlB0wXZLM170A+9gdzUK5RdV?=
 =?us-ascii?Q?HI/Qk+GDHqmv+3BYQbwSxoKyKGwx3zIHsCK/6eMBCP63mRLIekdEKVnicnUS?=
 =?us-ascii?Q?fM59DU5jAj4RUVQhHCXUJxlNPD2opKH7u0H4strIVVSj1VovtA/AN80pwpoR?=
 =?us-ascii?Q?fiNXGbRfRURYpdrWmEbtsh76fRl6j/VafcriQ8VvkICd2MaTBCprTHfX1iPe?=
 =?us-ascii?Q?ZWaDFFyTJRLj8pqM1wyHe+iM/pKmMcBqXLv20fBHYj8D/w/1pKD4RiLCqMpB?=
 =?us-ascii?Q?d2rcvl6t6JJF9yGqRlPaml7NuVck2B4ATYntOgNIcxj+9XBKdAlRAKLedI3a?=
 =?us-ascii?Q?nmpOpoQ1w7JlnDMm2IjhY6lutcFI6CP7Qa1qRz/vxGcGGcnudZ2qPFa1nmul?=
 =?us-ascii?Q?wj4OlktRqFRMxmR7QtEYTTKpQ7SqM8J/SvAmLVmGuAf6Q2FKiJyXl65wQTA9?=
 =?us-ascii?Q?URLG2pXJCPe+wZVoGA9rEA1U3FEZtGIslr2XCZAI98Ehc+mgPT8IGB+cRDDH?=
 =?us-ascii?Q?3pittiEbUPXXWqe2++MHYPzsurH99f9pDyxcASKJKsMhJ9U4jcoMshNbSJ9G?=
 =?us-ascii?Q?dXnGHYRP69oyt5VVYrblgUg4sCXBh7KXyKW3EJuKrhcf9dyy4pBamasQ+Q41?=
 =?us-ascii?Q?z1EC/u8aRlPX0k2sKGcIQ2Cs/3xYS8k+nZdpttBkgPgYfnIUxtQckLk8KE9z?=
 =?us-ascii?Q?pyH/TY3UdJbikZcx6NZNqvGVosMa1itzQ2tkxKuw1C4e6sxFveMgwh9SzETn?=
 =?us-ascii?Q?4S34gI6A5Fj/55Bho8hFvSQQ049N1SrqI+g10sA0HwQRfGzzBgshc4zYuU2N?=
 =?us-ascii?Q?+PL/EENPikGltB55IJjB4NkhPk7CchRSV7G9/5t2HJXzxVi6uAfjkbSiFo5F?=
 =?us-ascii?Q?In1p+5kC9ChJIwD5HjNUBsgUBv0n5pPnpRfN8Eoc1DbcrX5hhB60/FGwjbFB?=
 =?us-ascii?Q?85rorxpxa1sQpGl/eOPTrUqC+JOYDl+rmGfujEBoX3SoFwbIh8NiGF7jQRhH?=
 =?us-ascii?Q?g3fdTf24q0GV7S/7lF83W82rl0ZMMV2CToSH+rNp7gfbQwCd9K7w9r28Eq2a?=
 =?us-ascii?Q?QMVoBSmUOxROXKFfJ9HFTvH+cEJrfMS/tI6wAD0IfNFS7FHis2oGwXmI4Asz?=
 =?us-ascii?Q?De5gF0LuKXaljw2aaQVLDqJ2OPX1uEP3WDT8YPQqsSQGZ/ho+h+cbPNQNd7x?=
 =?us-ascii?Q?+WKnDTqfZsH8FsljHnOfg0v+4SmaqBPBboYNEKrLaDIaQnoaj3erWR8Fpv1D?=
 =?us-ascii?Q?ZIB1uZ9p1+AKBR4MvepXf1wqSFtNqFQuyTHEfSLQaKNSWCatMpjhIcZRewdf?=
 =?us-ascii?Q?9uo8q+Hm5Vw/Zh0tcftXsod2ANlBbN34qyomErBXGCo8OeTXcW4Tj2Dr8A+r?=
 =?us-ascii?Q?+NjRkWIlS7peEI4DCxB+PQ8+vD/T7o09GP604ttMLwsTeooAQqYXBkMQh8ZH?=
 =?us-ascii?Q?NSjR27zMZOBN4EMTJY9KY/gajdFr18RIZIWG2HkAy6GZecaWmwDcERpNh11v?=
 =?us-ascii?Q?ADSmmF7Vye7verpOF2JeWWR4/jXSt2uj3MM0K1KXjdTbgJMMWdyPXIQ/DyKX?=
 =?us-ascii?Q?oSfIGR0OIL2ILvQssHK5S1h7mfnocg2LfZoVFfvX2fGIZPLNsKT3z64JvWHV?=
 =?us-ascii?Q?+c7YaCH51g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b2554a-3411-4d6c-7303-08de7445de5a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 08:14:16.7257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3XFWPk8QrdH42YqmIF4VzMHMJ/7SH5T5KAa0DxPvDhh7X0ouusCj8Pf3jQGs0dFQ2VXoMVQZPWEJyGN4SAxUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9325

Sorry for late reply, just back from holiday.

On Fri, Feb 13, 2026 at 12:58:11AM +0100, Danilo Krummrich wrote:
>imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
>called from IMX driver's probe() callbacks.
>
>However, it neither makes sense to register drivers from probe()
>callbacks of other drivers, nor does the driver core allow registering
>drivers with a device lock already being held.
>
>The latter was revealed by commit dc23806a7c47 ("driver core: enforce
>device_lock for driver_match_device()") leading to a deadlock condition
>described in [1].
>
>Besides that, nothing seems to unregister the imx_clk_scu_driver once
>the corresponding driver module is unloaded, which leaves the
>driver-core with a dangling pointer.
>
>Also, if there are multiple matching devices for the imx8qxp_clk_driver,
>imx8qxp_clk_probe() calls imx_clk_scu_init() multiple times.  However,
>any subsequent call after the first one will fail, since the driver-core
>does not allow to register the same struct platform_driver multiple
>times.
>
>Hence, register the imx_clk_scu_driver from module_init() and unregister
>it in module_exit().
>
>Note that we first register the imx8qxp_clk_driver and then call
>imx_clk_scu_module_init() to avoid having to call
>imx_clk_scu_module_exit() in the unwind path of imx8qxp_clk_init().
>
>Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()")
>Fixes: 220175cd3979 ("clk: imx: scu: fix build break when compiled as modules")
>Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>Closes: https://lore.kernel.org/lkml/13955113.uLZWGnKmhe@steina-w/
>Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8x/MBa8x
>Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/ [1]
>Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>---
>Changes in v2:
>  - Expand commit message, mentioning a third bug fixed by this patch and noting
>    the order of platform_driver_register() and imx_clk_scu_module_init() in
>    imx8qxp_clk_init().
>  - Rename imx8qxp_{init,exit} to imx8qxp_clk_{init,exit}.
>  - Link to v1: https://lore.kernel.org/driver-core/20260211142321.55404-1-dakr@kernel.org/
>---
> drivers/clk/imx/clk-imx8qxp.c | 24 +++++++++++++++++++++++-
> drivers/clk/imx/clk-scu.c     | 12 +++++++++++-
> drivers/clk/imx/clk-scu.h     |  2 ++
> 3 files changed, 36 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
>index 3ae162625bb1..c781425a005e 100644
>--- a/drivers/clk/imx/clk-imx8qxp.c
>+++ b/drivers/clk/imx/clk-imx8qxp.c
>@@ -346,7 +346,29 @@ static struct platform_driver imx8qxp_clk_driver = {
> 	},
> 	.probe = imx8qxp_clk_probe,
> };
>-module_platform_driver(imx8qxp_clk_driver);
>+
>+static int __init imx8qxp_clk_init(void)
>+{
>+	int ret;
>+
>+	ret = platform_driver_register(&imx8qxp_clk_driver);
>+	if (ret)
>+		return ret;
>+
>+	ret = imx_clk_scu_module_init();
>+	if (ret)
>+		platform_driver_unregister(&imx8qxp_clk_driver);
>+
>+	return ret;
>+}
>+module_init(imx8qxp_clk_init);
>+
>+static void __exit imx8qxp_clk_exit(void)
>+{
>+	imx_clk_scu_module_exit();
>+	platform_driver_unregister(&imx8qxp_clk_driver);
>+}
>+module_exit(imx8qxp_clk_exit);

The clk driver is critical for the system to work, removing this driver will
make the system not work properly I think, so it may not make too much
value to add an exit function here.

Regards
Peng
