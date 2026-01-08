Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2574A22D5;
	Thu,  8 Jan 2026 12:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767874177; cv=none; b=GdtE7k/rKmM45YkJcnsKEcTzinl4h3CU/Y7wCr8cp6Wsx3hkAyU41pKYRBhIvrWgIHBsV4q00S427PCItUi6OaL+inrIad+2YZpP7cjFUOTOta75uMmAYoImcv4Ud2ocyO3BAviJxmJj3x/5hyNg8hSDwbfq23wa0Ar498HZiCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767874177; c=relaxed/simple;
	bh=q0TlDqpr415sq727uuVVX4LyTiAOn5O9CGBq1T+5u5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W1VwkMheHpwMxfiP+jGoWEBY47HwvBWSfKEe8VF/ndHEFSZoZBL2B/WaINAlnr+Ht6i5gFomeoO7yjtc7EUq35s/uvgU2DUZ0E2fT5/Y7lIpNv3db58fPTV203jy8SH1LYuVbrM3TxHB1h5HiMsPWxpOyDsrqJOvud9zOjr3ttc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=X6DBAXPG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X6DBAXPG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767874168;
	bh=q0TlDqpr415sq727uuVVX4LyTiAOn5O9CGBq1T+5u5k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X6DBAXPGYo6G7Y2+a2GriXbE3SBz4uZEUzVNJiatCA25v20IsluEZJEpDAs1lM48v
	 rvU8IAIQDxDViRGTGd8HXh7uOs9Fyj0OVdtzoC/6Z3uB5LPQr9PoMzUm+xvA4/f+d1
	 DjXTs7qgGRyf0J+Hq+YGuaRRN8FArMODeHh8S9fU80u44nyQdZCam0jvzaciS/CdO9
	 VREtv9ox10zpqn+px+AO+O8LwbwCSAVce6Hn9H2jXXmsq82Hr3IQ8deRop4VeKx9kI
	 rTPlWxHBN9etr7LzfOheJ0BMt73xKUYxfqVPs4FXNpEhKPwsJax1VkJeFFWzmQ09Jc
	 Lo8ql6Lv4Y+6g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C9B5A17E13D8;
	Thu,  8 Jan 2026 13:09:27 +0100 (CET)
Message-ID: <f73a57bf-8527-4d1d-9f2e-78fe3c9973cb@collabora.com>
Date: Thu, 8 Jan 2026 13:09:27 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 0/5] MediaTek PLL Refactors and Fixes
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Laura Nao <laura.nao@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/12/25 11:23, Nicolas Frattaroli ha scritto:
> This series refactors all users of mtk-pll, just so we can enable
> runtime power management for the clock controllers that want it. It's
> also generally more useful to have the struct device in the pll code,
> rather than the device node.
> 
> Also fix up MT8196 mfgpll to declare its parent-child relationship with
> mfg_eb, and fix the common clock framework core to take
> CLK_OPS_PARENT_ENABLE into account for the recalc_rate op as well.
> 
> The reason why this is all in the same series is that it grew out of me
> first modelling this as an RPM clock for mfgpll, which Angelo disagreed
> with, so I did some investigation and it seems MFG_EB indeed is a parent
> clock. However, the earlier refactoring to pass the device pointer down
> is still useful.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Changes in v3:
> - Make device_node forward declaration a device forward declaration
> - Remove forward declarations of struct clk_ops and struct
>    clk_hw_onecell_data. (clk-provider.h include remains as it's needed
>    for a complete type of clk_hw)
> - Move PLL_PARENT_EN flag to individual mfgpll definitions.
> - Link to v2: https://lore.kernel.org/r/20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com
> 
> Changes in v2:
> - Drop bindings patch
> - Drop mfgpll RPM patch
> - Add patch to also transition pllfh to passing device
> - Add fixes patch to make CLK_OPS_PARENT_ENABLE also apply to the
>    recalc_rate operation
> - Remodel mfgpll's mfg_eb dependency as parent-child with
>    CLK_OPS_PARENT_ENABLE
> - Link to v1: https://lore.kernel.org/r/20250929-mtk-pll-rpm-v1-0-49541777878d@collabora.com
> 
> ---
> Nicolas Frattaroli (5):
>        clk: Respect CLK_OPS_PARENT_ENABLE during recalc
>        clk: mediatek: Refactor pll registration to pass device
>        clk: mediatek: Pass device to clk_hw_register for PLLs
>        clk: mediatek: Refactor pllfh registration to pass device
>        clk: mediatek: Add mfg_eb as parent to mt8196 mfgpll clocks
> 
>   drivers/clk/clk.c                            | 13 +++++++++++++
>   drivers/clk/mediatek/clk-mt2701.c            |  2 +-
>   drivers/clk/mediatek/clk-mt2712-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-mt6735-apmixedsys.c |  4 ++--
>   drivers/clk/mediatek/clk-mt6765.c            |  2 +-
>   drivers/clk/mediatek/clk-mt6779.c            |  2 +-
>   drivers/clk/mediatek/clk-mt6795-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-mt6797.c            |  2 +-
>   drivers/clk/mediatek/clk-mt7622-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-mt7629.c            |  2 +-
>   drivers/clk/mediatek/clk-mt7981-apmixed.c    |  2 +-
>   drivers/clk/mediatek/clk-mt7986-apmixed.c    |  2 +-
>   drivers/clk/mediatek/clk-mt7988-apmixed.c    |  2 +-
>   drivers/clk/mediatek/clk-mt8135-apmixedsys.c |  3 ++-
>   drivers/clk/mediatek/clk-mt8167-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 14 +++++++-------
>   drivers/clk/mediatek/clk-mt8183-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-mt8186-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-mt8188-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-mt8192-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-mt8195-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-mt8195-apusys_pll.c |  3 ++-
>   drivers/clk/mediatek/clk-mt8196-apmixedsys.c |  3 ++-
>   drivers/clk/mediatek/clk-mt8196-mcu.c        |  2 +-
>   drivers/clk/mediatek/clk-mt8196-mfg.c        | 15 ++++++++-------
>   drivers/clk/mediatek/clk-mt8196-vlpckgen.c   |  2 +-
>   drivers/clk/mediatek/clk-mt8365-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-mt8516-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-pll.c               | 19 +++++++++++++------
>   drivers/clk/mediatek/clk-pll.h               | 15 ++++++++-------
>   drivers/clk/mediatek/clk-pllfh.c             | 13 ++++++++-----
>   drivers/clk/mediatek/clk-pllfh.h             |  2 +-
>   32 files changed, 87 insertions(+), 59 deletions(-)
> ---
> base-commit: adff43957b0d8b9f6ad0e1b1f6daa7136f9ffbef
> change-id: 20250929-mtk-pll-rpm-bf28192dd016
> 
> Best regards,


