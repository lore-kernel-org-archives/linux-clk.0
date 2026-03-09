Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19013072.outbound.protection.outlook.com [52.103.7.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A8C394478;
	Mon,  9 Mar 2026 22:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.7.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773094443; cv=fail; b=gMJ7KPe8jN64PipEj29K1NPlU1FyRUeiZvGd8NACuAPj3hnF1lrRdzjJAV3Ld4z+R24yWzd+rVZZMihHwsJMvodSpxMO+0TYIcPGMJO0ythdVP/0yoCGVUVUgjP333CZ0uxEFNsLaMcLLbaOA0AgSqCZ3kWVjeGaaoN1eoAsjgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773094443; c=relaxed/simple;
	bh=0x6jurovKCGFHa5Zw0rhr9UDwS3PoUL+CVJ+ngTPHsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d9SjaJoV63WhgGuRHeBbpu5nNLzUN4KCH0q54fNF2CQkFqLRtPcChdyyjLLgW+ah6SogsihMBzWsIXSSQEUb9WQ5EYSB6fKFECxIABZjUPT7PPU7V2VlnjPcTrKVqkxqaTTq/m7J29d6g4Ec3KNG0uzJ/e6sRnM+L8iVhwSDQGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=GqTmvIZ+; arc=fail smtp.client-ip=52.103.7.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="GqTmvIZ+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ueM/dgZy1Hrc0M9oCgekK0g6R6BXqzFRVfQ6ANs/HIRk31u+s6gUXnDX+LFJUneZEumAnFyCQRL+ztK0TI2qW0ANAKvTK0lbwu7FUDXSDLoLQYzaVdGIjYDE+dlnaLj+YkofLDG5We7YR4WxRCkfYl254jH9GmrGaKuin4GmW0KbCF8fa1yRfApS9NWe4Fo0aP3P3eAB54NqX1BNlFDAj3A25yvUZea4QmtrRtHUTixcXwF9hbWgwbDZFD5O9TwEuyPN3FE2UaES7cX7F+Dyo/pGZAgcpWz5GslYyhk9qqh8lSyBAsC0sWYU76yCkDPXoL9fIln6zyPtiO8TJ10L0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJvrGFiY4clwU1h+4b4sa6WVjBEBNe/SPrAo55/vaOA=;
 b=kH5rXDQILn1Q49Zzm+DynDrba+qkQROG9TcaEJ6YZByPL98uwq6GpW0I379HGLjZHccgYEioyOZjAoxHBO4sMYJrF9miJNjxFT7w9D9x9n8GwwNf83N5Q2ZipMXvQw3fdsv0Y2L01yiDOwgrn557hgpnvHuTyzxNccNlYOOQKq+1lA8gf8nG6twUfFN7cj+h2do9baUP87x6JpaTqyclHwxPPZYpqqXeKuYWO02t17kM7RNKGv2l1kUNaccAGSkA+uP2qcAuEon+YmFRahbyOL6BAEPiSQTHuGQ1XnjMO8rbPo8q11d0KPnBlQWFw8/Pa69utvuK0sVpViVoqtm0cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJvrGFiY4clwU1h+4b4sa6WVjBEBNe/SPrAo55/vaOA=;
 b=GqTmvIZ+TVN6hrHx6sNIcQVpl99jBX56KA8zAQZrfVMPBer33stc/ZCHqrgh06KIOJYQ9HdUMnNPF1lQQWcdtWXNkwFp7c9So2gim8HUpHeLWvTf+D+22tjqbUT8A9mQL4jFZ+D3Iz+4Rq5vflLaoAun8VAwqFt7kngvjiVmsYI/awxYBDC02HxSQ82GMbsdNleB2Nz9mHdCO5hkOWTby9bztdmtkSWN1o4eQtxoPCsBrZqYjiOpPHcn7SkJ7cpVq7Fo6hoeD/CsznQTQ/SfsFaRYRj9Uhn0PadXIqcK/6Pj2iJw9bBCkwFwMIfMGmBibnfIaPaLTg8F+MAeyYzMgg==
Received: from PH0PR19MB997338.namprd19.prod.outlook.com
 (2603:10b6:510:3b1::18) by PH0PR19MB5600.namprd19.prod.outlook.com
 (2603:10b6:510:14d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 22:13:58 +0000
Received: from PH0PR19MB997338.namprd19.prod.outlook.com
 ([fe80::fd22:ee23:3e25:3172]) by PH0PR19MB997338.namprd19.prod.outlook.com
 ([fe80::fd22:ee23:3e25:3172%7]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 22:13:58 +0000
Date: Mon, 9 Mar 2026 17:13:56 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, sboyd@kernel.org, zhangqing@rock-chips.com,
	sebastian.reichel@collabora.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de, andyshrk@163.com
Subject: Re: [PATCH v2 0/2] Bring dclk_vop2 in line with other VPs on RK3588
Message-ID:
 <PH0PR19MB99733868D977B5046133AC0DCAA579A@PH0PR19MB997338.namprd19.prod.outlook.com>
References: <20260304121426.1184680-1-heiko@sntech.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304121426.1184680-1-heiko@sntech.de>
X-ClientProxiedBy: SA9P221CA0026.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::31) To PH0PR19MB997338.namprd19.prod.outlook.com
 (2603:10b6:510:3b1::18)
X-Microsoft-Original-Message-ID: <aa9GJL6n7teTNtCs@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR19MB997338:EE_|PH0PR19MB5600:EE_
X-MS-Office365-Filtering-Correlation-Id: ed0e1e10-ca33-4334-c477-08de7e29296a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|39105399006|461199028|6090799003|19110799012|25031999004|37011999003|12121999013|23021999003|8060799015|15080799012|53005399003|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yhqxxuQgsDmvdp1I1FRhKM0/O8gLrJj/YoqyGwkpHErmsODsuPyVp/dM8f0N?=
 =?us-ascii?Q?5WNJ7tq0SdLh2haA+WkP7xjfoEdfgWseoJn0aSBgle7uorTPKKMheggFNUl3?=
 =?us-ascii?Q?FA/BtnX9FjiXYy1uhLw8vLJxA26kfxvsrg+PDVAeZ8PuIqwZ/Eg8Hs0+6vB5?=
 =?us-ascii?Q?OFdOv6aLzhyjSC3sgFuqBvhDghcLl/8y972X2zUbynBNfBsHJQKCi9NzQVHk?=
 =?us-ascii?Q?Z9QbATT21oTedqlHgJlQggAqnAq+nnG+LmxPs8E41whq5SfAsAMVAXADvu1f?=
 =?us-ascii?Q?yat4+Nj6oJ4/NPBuNsmWK4qGBgli3sxardfgQ4JtUe0FU9tDt25uswRXFxOk?=
 =?us-ascii?Q?ZFLed+BuSxNmHX6ei/hw6znvseSxLktzWgg8DS6X1t/Trk7f8HhMPOrjHPH1?=
 =?us-ascii?Q?hYLNc5LFFIBCxePCGv1I+oQ8xwj3WXPUzmcqmexT90wxJikzL5GVh1G2RQYG?=
 =?us-ascii?Q?6500yB4/Aua7jMa7zzT8mLIA2iMmT5zryx9c5Nm7ZXtO1eMHWEUypq5PVs0c?=
 =?us-ascii?Q?OYRH1+YJZqkSozc4LWTrJaf+0G1nIhCW7rqymGKLemxVooLn2gRIYy8YU+IC?=
 =?us-ascii?Q?3ds36IGmtYhFzlFEAuPX77oqDGPdagHFtZb9Lu71p5UuKuNy1Fzql2QFm4pK?=
 =?us-ascii?Q?J5Oy7tG7q+2d7qltaEewNDRmbON5bpPsEbyUDzcDMs+/mf/7rSEog6zuCWLC?=
 =?us-ascii?Q?5fhQbeGjoAQqAtFt93VeMUNCuz3qZzRC/Nv3k6wpifWoI560QU14dwLMyPpA?=
 =?us-ascii?Q?8U7gP9TP4Rqco3T1nGLGQfjlFYILQdm1TYaVViOuCqZojoYvSPDXO8zXqSS1?=
 =?us-ascii?Q?EylVtclp4wo5xNwLpEmlOIF0BepZy16XtF6w/0aHspxEUOC8nESLNs2fMgM6?=
 =?us-ascii?Q?P7fUwkh4cEV586fl5lz7HDffIy/6OyYQuROnFBGMil8RJuiWdRPZAaxbv6Nl?=
 =?us-ascii?Q?kTivz1rmH/sh2I/Vlycr4qzD6x+lqlijJNekfsOGgytaHjt+y4vNh2eF0k9v?=
 =?us-ascii?Q?etXOp6OZPUBhyleU1JHL506cnjXMGOKgLCaAXqErTTIe4NXpayZ0dr/jcE90?=
 =?us-ascii?Q?4Ssvv23O?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KYtcGifSc38mN3s/edhsxqHsg8nRCqVgLLgfrtxGlqhDxmVt7sYCFHKeKvYM?=
 =?us-ascii?Q?yCFdmD/xc8EHHDFuj46qkCYwzYr2DvO6zyRTuQIfWXSKxoTS7gilTS1AxAJH?=
 =?us-ascii?Q?cW5XNUI2Z712IjWguiqpQ+HZ2spWuetRedc9IsaCfxmOIMG3Lq8KXMvaValI?=
 =?us-ascii?Q?y6QdeuvWCKVCNGoQ3ULGwuYs9XTVR8oJKCKzaPHczUYEaUgWUn0PIVPD6dud?=
 =?us-ascii?Q?GAA2cwwSBKMgaPZ/uJpWDKOiZ8941l2SfbU96pltqdIsS66C5TRVLtn3Das2?=
 =?us-ascii?Q?dUjIAZwVp9ccKqGkPdPINf8fwThVywudLUtYlUz7nhTsQY5i6ckPu2bSsLD/?=
 =?us-ascii?Q?qFpu+BY79tCLIbShnhacqaLZRLVPABNg8rqeM+slHPEHf2uyNTUxtSH8o32o?=
 =?us-ascii?Q?hlJNo77dFtOzRcHZu5aM5dAJD+uUswzfL0PvZricPZMZtiaVNC5tQOpo50sc?=
 =?us-ascii?Q?2McfUAL8EvUbdC7FYSc1jajEORbXa34msmd/P92A5W+LL5EuOxN/KCqQ4ln4?=
 =?us-ascii?Q?o3tEKOqk4vecI1eIVkUsVr5QtPgPhOKPpIj0tFXgF2UW/eJEXlfEo3vYY0pG?=
 =?us-ascii?Q?ea5rC9au/TOz9o6CeqajvIrcQYL363d0wl6pXyU3L4prro5RpsBYkSKTDwca?=
 =?us-ascii?Q?zovp2tFb5dCGl+Z9eNdAHv2KYHxuQ74zK2X5Aia+Ao8FkSHuxQLP4xqVZ4gj?=
 =?us-ascii?Q?VbvZ5+PAchCjzObN+tW/8UdJeTMWEw9+1AzxLgYuL/F1HwT0Ex8oZSSIVwK4?=
 =?us-ascii?Q?Aq2bl2VD+Dd67fhORcG4imVePHc00Il/zFZV1tjvtSDi3aUP0uetH4vPSud0?=
 =?us-ascii?Q?gQPlbZmG1p1vxL6ljkc6F9dBkPPVBbcXK24Gonn8PP3ixszlM5cRLPh0u1c8?=
 =?us-ascii?Q?ctLznuUx0ukLiZRafq4ubRJ1yK6Y9/VFk2dZc1LuTeJIRTAYUesRoFtuFFe3?=
 =?us-ascii?Q?84Q2VlnX2bGa2VasFlrcHmcyUJ476YB2dbpcoCQ5v+8EQa1b7AjGixyD9HIX?=
 =?us-ascii?Q?DtcW8WN97RKR/b9efZrlLIXXvjJGfqgU2ksjK/mrhLrSYKrsydg4j46VHHUU?=
 =?us-ascii?Q?Ql7CiqyTJ621t5w6ivqXT6hhzOWUi6VnanDWtgMPI7e6ErrvT+PM4doms+wG?=
 =?us-ascii?Q?HHkkFv9R86x63XVj1AJt1l6JA3viNwg17mjIm+9ywJolnd5xdgaU38fOXYID?=
 =?us-ascii?Q?s2mqUWRhb1XjjXHrX1rDhuu6TOyby+Pl5Z3KDmeCrGZMZwnnEgPAxNbkynmM?=
 =?us-ascii?Q?gE3CIkhZueHdpVzapQdTHDi8dBRyc3Vmoo7J2wwVXDK4c2g5G+SkUvrs3fVE?=
 =?us-ascii?Q?/OKwhLGlM7/HvnPro7+Fyw86wR0r2dV6p30axNig2aQPGcYsnn+VkbNBPiVK?=
 =?us-ascii?Q?9NxZh4jhjtaTHaS/WmVffkLkOJ9/eBgil36DLhqiXFDWmwx5vQ=3D=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0e1e10-ca33-4334-c477-08de7e29296a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR19MB997338.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 22:13:58.9019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5600

On Wed, Mar 04, 2026 at 01:14:24PM +0100, Heiko Stuebner wrote:
> The dclk for VP2 behaves differently and its use can currently break
> other peripherals, so fix that and additionally allow it to drive
> the same outputs.
> 
> I've kept Quentin's Tested-by from v1, as the overall change is the same
> but did not transfer his Reviewed-by, as the series-structure changed.
> 
> 
> changes in v2:
> - split the actual fix for breakage and change of reparent handling
>   into two separate patches
> 
> Heiko Stuebner (2):
>   clk: rockchip: rk3588: Don't change PLL rates when setting
>     dclk_vop2_src
>   clk: rockchip: rk3588: Allow VP2 the same sourcing options as other
>     VPs
> 
>  drivers/clk/rockchip/clk-rk3588.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> -- 
> 2.47.3
> 

Tested-by: Chris Morgan <macromorgan@hotmail.com>
