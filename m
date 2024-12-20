Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EC1F9EC;
	Fri, 20 Dec 2024 05:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734671244; cv=fail; b=pVE5AIB0ew1yaolh23NbUD4TDRTZ/bsUzlh4deovqN8FtxknAnEXeLXzFj6PrbY2plTIWNYjkoPVNCJqf7Qj4m3nC9zWMf8L3unqjLlcddmO/F4NF6Uho3Z1VNz0vD399nMYRp6NDLKE5Qj5UaIHrwpcz9x+Ut5JXFdKYCHZ+9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734671244; c=relaxed/simple;
	bh=6fgKA+/uIXOk28Ex2EfmJ2iEi7mvgE60ZQDi/5VzPDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u/05xqVQPmoqAMHU52uVOMnQvxkaGnbQxEvkoyY4dmHbulk7bpngslRW5l9K5O58sZno0VJjwofJAT9HZAG0Q2lRw+cVHIgq/3H3Z6nG1S6dgtuSE/07yjkDkzcXnXytqXO35LAdKko4y/X0RGSrtKJhRj2JYlhGsBykcyxjaOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dYFMY9C2; arc=fail smtp.client-ip=40.107.20.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dYFMY9C2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcDNfz4EBwcUHURJSVq40DMfrYLmvZ4DlFAd4vSlOhiW4kpzZkGkB/ygLXAZSYjUomRtKq56NeUJXlQMgl9x69c97eNjuaHPixr7tHeOjE0yxEx4i3N429hWxPxcQhbiIycD9WaHBz9HoNH+6DAdjAHPbP77eDbrLZ1U+Q4QLZcBytDM+zQ1mGvFMIksdZDd98Kxb4AHqOoWBfztLSS0JNwB6y567mgEB7wYA9hVB3YRgnffOzrd2PNqIcuz656Rs3McqY0witU2bfWeGnqskgRtRDCFF9y828IW2A6zU6DwTK7NjUU4iNbRRDyUV7h++Jv5Fl0usfewW435Qn6v+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fgKA+/uIXOk28Ex2EfmJ2iEi7mvgE60ZQDi/5VzPDc=;
 b=A/meCmTwFY2RoqZ0pgo7GCAbBTcilJYkN7BbnjfhwzdlO4QV9/oosDaG9oQedTrsVgXiYO3MzwwHsPtEeut0nhgqUd8ezP/Ae3YQuil4z/l7vKj/lvBWvLWTdvDyO+Si9NqpmVm2X+6wgQZAlS5Fu+I4nI0fokw7enfxmUiZEyJ/GPrC9Tgk+GU3SuEC0GJnOGSdugnqSSIAtoZ9o2NWoWsBHK32dGtkQ+l6F2e7FNibToJfOZJ9FEscFcT2Zw/By31nz0Va3JsWD5pgxFgqQ0+Ox8+ulXwAfSErYk+Gs0zX+QkMiObKEzKFtKo4HwhC9/Dw192GnRKqkP/VrRcvRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fgKA+/uIXOk28Ex2EfmJ2iEi7mvgE60ZQDi/5VzPDc=;
 b=dYFMY9C2bOcwD9IQIUi1i3jljex0uGqVQ4pDV9zZ15JNlBPbyTn6U6qmCZgUpT/kdORhdokHnnFs9bfPQmtK5BdkzjQd4fGvATF5o30npM3KDyY3Tm8wsi0tP/cWr5RnHBBAV6CWxKrYcIVpIq+A5jW1b7vc0nuXU2bE39dW4uB968GNNY6a2nyncFcx7h3r5KBO/NNq3o35DyPARFTn06/jhzrYLzoKMnctMZsRZA1j4VFnU/PWNntqLbqa+5eLtHpFfPGMix0KOxmBjh9xG2sp07VK3RwBPYqJlS0XRKr4x7Be8+VAIaXGt/BqYpv0l4o2xyq6iMhGgK8BohGKiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10232.eurprd04.prod.outlook.com (2603:10a6:800:241::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 05:07:17 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 05:07:16 +0000
Date: Fri, 20 Dec 2024 14:12:42 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Nikolaus Voss <nv@vosn.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marco Felsch <m.felsch@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: clk-imx8mp-audiomix: fix function signature
Message-ID: <20241220061242.GA8295@localhost.localdomain>
References: <20241219105447.889CB11FE@mail.steuer-voss.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219105447.889CB11FE@mail.steuer-voss.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10232:EE_
X-MS-Office365-Filtering-Correlation-Id: 98982666-ebcb-4f8d-2b7f-08dd20b42c30
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L1rrNTE4d2/7y79n/3GvExW9NVoGFGmENNwzWUgEXSb3Z27ahUe5h8Mb6zi5?=
 =?us-ascii?Q?5YSQ6dbtll+bZKF4A0ySe5ABUHP4YeMD401hT7y3g91IGjPx8GKbf+dcVhPz?=
 =?us-ascii?Q?xHGjIDK822Ao86DeO+3QfUtgCO0SoBXY9H5E+tZhTk2B4pBGtWQqz2aQR4tK?=
 =?us-ascii?Q?bkSJJOKWm9dxmSqqqg+z2m5FAnGMVhXiAnuvGkks9XRz7n+mi38H9HkRGpWh?=
 =?us-ascii?Q?HYS2LMJgkNA67ZAX+d/PUCFMzf0DztBLJIuSi2B2f1S8HKesnb6XEkfIlQNh?=
 =?us-ascii?Q?E7Av/dIl4I5UGara8G8oUvwNsXoHiRM9gVx2OybZjAgyu/IostqxM5ymyRlw?=
 =?us-ascii?Q?gvgB0R8j5wK0X/yoOwxeyVKko0Jn5r8FLbiQxDuSnUnCNUE8Pl2q3zcWRihv?=
 =?us-ascii?Q?kyhPf/q0YQhwTJA7UXUTvKFZyuwgxhe4+2P5/86YDGWayVWY3C+v49TCAsB9?=
 =?us-ascii?Q?vnaT0arCKgOgKbV4efa0lFbMpY1DdZBBXYmkxUbL1HzDwWM0aXdSifIMpvmw?=
 =?us-ascii?Q?M4drS/Nf21Al88FhhkFrGkqIyAuiuUgyeJ4LCva7CCoV4RkeIHrAnoT6nSBG?=
 =?us-ascii?Q?a8vzSW9/mSYp2KA4p5+bclMUJ8iyiZcLsJ/PnAr8BshEA82uGH0jRRBkH+iD?=
 =?us-ascii?Q?bSTFixib0zJ6inIbzjULv3a/vwLlmFvgTcOyfwroXG+34s8AU1zfR85r2OrN?=
 =?us-ascii?Q?PZvdUPYbkOOhPA3zhiFlqIC78WiW4kaiMMAM+ISKi3xgK8vDyQ4cWwFdD9h7?=
 =?us-ascii?Q?YOOIqwGxak4n75IvI52GWe+ar5/sPCY9X4f98f3Unti59hjEI9aZfvPZ4zfH?=
 =?us-ascii?Q?Um1beyMMnomeqhdmaUjTkHxCs7Vf/1QxC41sgg4rTz8wsNUMJoPwjPldT535?=
 =?us-ascii?Q?eGt/S1b/uST3aKobYkdWd0PfNYFqi+iK1o11w6BhPAPZNs/j2/YYOTjLss8J?=
 =?us-ascii?Q?C4cE/YALPIzy7RMVgWfyCsApTUypKib9GiKjdPP7csw9J5Mn9rx9tPbpGODm?=
 =?us-ascii?Q?ukFSbsL01SfUPuYtArXke5J3yhrR3AycVMLnAuhQsy8itctMTD807qrztvCQ?=
 =?us-ascii?Q?cHSjiDuzV9stGjQbXGcP2mVkpDuuv+HmPuFzLW+fck77nV9t0lO0I589oJAx?=
 =?us-ascii?Q?HGb9S4WL/YJknaH5rf9aTHmHuijzsJq8jEtlTMzQaK5TUGWTKdWFjWLe5Ms8?=
 =?us-ascii?Q?pAxj7Uy7OQdrMrGjFbSnz5bp3e6K3CoN8rEQyLeB77RzPFPGlzoGG+k5sACF?=
 =?us-ascii?Q?FDHQu0/YV5e9/9wkR1y00Uwoglz2Lu9FgAkE/IOD8vMjNzQnKwDcGqLG87BH?=
 =?us-ascii?Q?TzlQM9LYyZczBE/l8uW1dJ2SF14jl5P0S08ZDr/OMDD+Ty2mrwKI2KvV6m+L?=
 =?us-ascii?Q?AfZzpryHnxag5gfg4FC3IycA+E4LQT3bIZ9Xp5ZMTsPeZetarBWELApbwe2h?=
 =?us-ascii?Q?NGwQOSKYxm4ztIDScJwWoIfJQ/zcLA7u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cdR5D3AP8Nq6tgA+7kSc0V2tkbhXBFBEl3Lconp6jFvyaiOoK4w6jOOYTrOc?=
 =?us-ascii?Q?RNqbvw4dmZYnVQNlPlN7K4WWIHk04A1Di4GPVZZ4qWuFFII1H3t80RPns/VQ?=
 =?us-ascii?Q?hRcck03TVwM5F6Mvqk5qavpYS5zrjr9YiT03jNFgc/ebe2y0rPBq480MOZzW?=
 =?us-ascii?Q?1kkrtXvY8cNvVBemo6b1bU2D+Rlj3hG5nvqvY8Jf/IAJctltm/UeGm3yZ0iD?=
 =?us-ascii?Q?J+Qk/0tKFJBUj28gH7M+6bbrYkGSkwkIL1l4UzGVImZ/IpJGAhfslgkFKmyw?=
 =?us-ascii?Q?sgQ7AhO85xvKCiNAPWcN4XleHrhqi4WSSaYxFxCSkPAToHyyUFaXDpXGN4Kz?=
 =?us-ascii?Q?+lgE1j/eil8h9hHmQ88CiFxekgbHa3AW+nC//NsCX5tOBRzLWX2Nth2QNH/i?=
 =?us-ascii?Q?6DSqGGCVPHm8UDE1WlpN5uSUqTAnmi83gu7KtmqLiFNgJ+8WHWerYtq5A189?=
 =?us-ascii?Q?vSwTi19i3uUEKpYhn9VzpVM+CRKelI6Zv1fOJLNhLcP84qrXaodYnd7h1XQS?=
 =?us-ascii?Q?6B7aAPpk486jFFvI7RHzOV71dZZVldsQgHZIuLZj6GGIzt1bnrYtWCoBaHHi?=
 =?us-ascii?Q?yriWkY3bpARlFo8hEA5lqhYQLUklw3pyKhyEK6g3yOFgmZlD6hED5wMIaitv?=
 =?us-ascii?Q?DkhExzvISWI43DDVGWxD1W6E5IfGE0UVXVghXY4od41UjSxDrfTe29mcjr8V?=
 =?us-ascii?Q?jBhwP5Xu0lAmljbClK/PNrvWfTxZFnXP0wZTUXJlZ/r+tE53YY9/CzaIiTOD?=
 =?us-ascii?Q?o0M/xLhuK/xQonoJfOUjxp3U0uKy8XYAHyd1Sz6VJ9JnbqNlOK2kYDZtsqC0?=
 =?us-ascii?Q?vM9tUsi/btO4N8Y0U+KWmtR+9lNEH/KhYprDF7brTAgCye/1LZMWPS42iXk7?=
 =?us-ascii?Q?oxVO3ymKltW/LcXe8hYOI4X+H+5nmBSdVG3oXjj+Tdri5MTA3ISLXe7PeZV2?=
 =?us-ascii?Q?L0thU1gDhi2zPU7kcNftnBVt/hrL0bC++VB0krunXERfiKgb2NOyY+pCheiu?=
 =?us-ascii?Q?NJ2lHQPm27hK8r84ZYTj6HCeqUOy4QxHJLqecTJBNUwklShdoEFwkVNWPODU?=
 =?us-ascii?Q?OsZQz4G01kxXCmVg5WyzW4w5yg2p2EvSPv6EZCFcc2I9d52k9g2kKkPfLx9T?=
 =?us-ascii?Q?Tny0gVk4mBq4mKZBTWqmZ99srT+3xonGefh0ChaorcJphuyTedSPRTN6CUmR?=
 =?us-ascii?Q?UmOZS/4paUwEi1x/717P7ODGzqDR9qYUJeIXwFvx9yvZda5NkT9cMT68XR0q?=
 =?us-ascii?Q?wg2r348fcAv/o8hcBeC9oYZFHPXkh8EehMIDmj1Gwf5U8FtNMXm4dPksMcDk?=
 =?us-ascii?Q?cDGIqsOLbxim6qg7szyTwGVqm28fdKbHri18XEC0AwUjJoX+dFvnnySY+tti?=
 =?us-ascii?Q?V4VxaLt/UKOx6CKM6QtQyTNw+INJn7ssCQHUayc7tjhuxFuObPL9xdzGBrU9?=
 =?us-ascii?Q?b8CiIwPw5TMJNQ4rBmgu9+u3BWcbtVzn34b0Vmr6rdGZnAt6R+lbNbD+FJJj?=
 =?us-ascii?Q?jSyDwO7eAMYenO1tBFCm/PMzSuOuipQJN8ObeCUJsWjgpL9cPxrWEkFXMfdP?=
 =?us-ascii?Q?n6qy2zCoBKIL7rwda4uqi9lnYPBe6nUEDlbl0hYM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98982666-ebcb-4f8d-2b7f-08dd20b42c30
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 05:07:16.7441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2JoQTxqMpy+gp6C1M5qYqQa+w70rOGEyGG1nRXYRFTBDuM1nEYHuBrNBX9SxLAG1NMwrcUm/jErth6Q2ih5gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10232

On Thu, Dec 19, 2024 at 11:54:11AM +0100, Nikolaus Voss wrote:
>clk_imx8mp_audiomix_reset_controller_register() in the
>"if !CONFIG_RESET_CONTROLLER" branch had the first
>argument missing. It is an empty function for this branch
>so it wasn't immediately apparent.
>
>Fixes: 6f0e817175c5 ("clk: imx: clk-audiomix: Add reset controller")
>Cc: <stable@vger.kernel.org> # 6.12.x
>Signed-off-by: Nikolaus Voss <nv@vosn.de>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
