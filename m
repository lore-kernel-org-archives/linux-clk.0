Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99E8C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 15 Feb 2022 16:12:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241428AbiBOQNB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Feb 2022 11:13:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240258AbiBOQNA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Feb 2022 11:13:00 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F99FAF1E8
        for <linux-clk@vger.kernel.org>; Tue, 15 Feb 2022 08:12:50 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 2A68E1F44327
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1644941568;
        bh=+R067hTr4DcfXduf0obDMT7YVwH1DSHSbxv1zGgPcAI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ShWCL+I6upqWYD2RXrdnVEJmBpn2nBU73c4LgFFeAI7oJRdPPwvPWdlQw1uQ8qWf9
         ngrpzFHP2Tat3G8YDTG65dDgf4OOxaFCyjL6hWiLavV0u4hnvCdoSfm1Gro2HCKXpJ
         jCUCTVovJXtNRNgN9b/j63dKHBfdGvDPq6KqUUJ4IGOAlpYaJHN4uCqOyCzHazaK3p
         lewQmTDtREMg69Q3eAGXbQ/q2+NhCDoKH7LAfW96rCo8QnWcr+f7rb27YfDNidAwD2
         RphpFJhD4T8dPxs62mXRckpEkNW4890zHVAtbeJKJ70NVxrgRUEw9VlFCIPmWGg6Eq
         Y7UwpLFr24e9Q==
Message-ID: <5da08d82-a7a1-d9c2-1966-52dfacf45ca5@collabora.com>
Date:   Tue, 15 Feb 2022 17:12:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
Content-Language: en-US
To:     Robin Murphy <robin.murphy@arm.com>,
        Alyssa Rosenzweig <alyssa@collabora.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        linux-mediatek@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ikjoon Jang <ikjn@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Nick Fan <Nick.Fan@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Chen-Yu Tsai <wenst@chromium.org>
References: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com>
 <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com> <YeF/AYZ0DuKGwLLk@maud>
 <CAGXv+5H9BsNUdiY6zMH6THKKMvRdPypNtUEVviMHQEjgNGDk_A@mail.gmail.com>
 <69525223-7d90-5714-bbe9-4d7f0b9a293d@arm.com>
 <20220119021844.3C225C340E5@smtp.kernel.org>
 <5d839338-6072-9c52-1893-2f804d937ea1@arm.com> <YelxN/zpdkukBBqy@maud>
 <c69fcd5d-a79b-ed0e-e803-63bebe987390@collabora.com>
 <9f05238c-4649-0673-21eb-7b7562d0d5c1@arm.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <9f05238c-4649-0673-21eb-7b7562d0d5c1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Il 15/02/22 16:21, Robin Murphy ha scritto:
> On 2022-02-15 10:44, AngeloGioacchino Del Regno wrote:
>> Il 20/01/22 15:27, Alyssa Rosenzweig ha scritto:
>>>> We also already have SoC-specific GPU compatibles because even without
>>>> experimental interconnect easter eggs, people integrate these IPs in fairly
>>>> involved ways and there's a fair degree of variety. However unless we want
>>>> to be super-strict it's also not too hard to simply assume that if we can
>>>> find a "mediatek,mt8192-infracfg" syscon then we set the MT8192 magic bit
>>>> within it, and if we can't then we don't.
>>>
>>> We need a MT8192-specific compatible for the GPU anyway due to "unique"
>>> power management requirements, this is why the MT8183 before it has a
>>> specific GPU compatible. So I'm not worried about the compatible.
>>>
>>
>> Thing is, as it was explained, this is about a unwanted SoC misconfiguration,
>> hence this is very specific to one SoC, which *happens to* integrate a Mali GPU.
>>
>> I agree with Stephen's reasoning - also in my opinion, the panfrost driver should
>> be dedicated to managing the Mali GPUs and *not* the SoCs on which it is present,
>> so disabling the Accelerator Coherency Port for MFG should be performed inside of
>> files that are dealing with the specific SoC that requires this configuration (or,
>> if you want, quirk).
>>
>> Simply put, though, as you already perfectly know, there is no driver that is
>> dedicated to exclusively manage the "extra" INFRA bits, so here's what I've been
>> thinking for a while; my logical reasoning:
>> - Doing it in the IOMMU driver may seem at a first glance to make some sense,
>>    but then, does this really have anything to do with the IOMMU? I don't think so;
>> - Performing the disablement in mtk-pm-domains is very shady... there's nothing
>>    that screams "power" in that;
>> - This doesn't scream "clocks" either, I understand that;
>> - As far as I understand this specific thing won't happen anymore (or at least,
>>    not in MediaTek land, but I also don't expect to see this on other SoCs).
>>
>> Getting back to MediaTek-land, only MT8192 is (and will ever be) affected, from
>> what I understand... and there is one driver that is very specific to, targets
>> only, and would probe only on MT8192 - which also happens to manage the very same
>> iospace that we also want to poke at to disable this bit......
>>
>> ... clk-mt8192!
> 
> The only trouble with that argument is that it falls apart under the
> slightest scrutiny ;)
> 
> The relevant parts of the power domain, IOMMU and GPU drivers are every
> bit as SoC-specific as the clock driver, and it is the generic syscon
> driver which owns and manages the actual MMIO space.
> 
> All in all this has now convinced me that it *is* worth the slight extra
> effort to put random infracfg stuff in the random infracfg stuff place.
> And by "slight" I mean it turns out I've spent longer writing this prose
> than bashing out the illustrative diff below, which is the last opinion
> I shall have on this matter. Feel free to take it and fix it, or do anything else 
> if you prefer :)
> 

Hello Robin,

I am a bit ashamed to admit that I haven't fully considered the option of putting
the random infracfg stuff in the random infracfg stuff place.

This solution looks like being the most sensible thing that we can actually do to
patch up this bit.

Thanks a lot for the advice!!

Cheers,
Angelo

> Cheers,
> Robin.
> 
> ----->8-----
> diff --git a/drivers/soc/mediatek/mtk-infracfg.c b/drivers/soc/mediatek/mtk-infracfg.c
> index 0590b68e0d78..af22d0f3d547 100644
> --- a/drivers/soc/mediatek/mtk-infracfg.c
> +++ b/drivers/soc/mediatek/mtk-infracfg.c
> @@ -72,3 +72,20 @@ int mtk_infracfg_clear_bus_protection(struct regmap *infracfg, 
> u32 mask,
> 
>       return ret;
>   }
> +
> +static int __init mtk_infracfg_init(void)
> +{
> +    struct regmap *infracfg;
> +
> +    /*
> +     * MT8192 has an experimental path to route GPU traffic to the DSU's
> +     * Accelerator Coherency Port, which is inadvertently enabled by
> +     * default. It turns out not to work very well, so disable it.
> +     */
> +    infracfg = syscon_regmap_lookup_by_compatible("mediatek,mt8192-infracfg");
> +    if (infracfg)
> +        regmap_set_bits(infracfg, MT8192_INFRA_CTRL,
> +                MT8192_INFRA_CTRL_DISABLE_MFG2ACP);
> +    return 0;
> +}
> +postcore_initcall(mtk_infracfg_init);
> diff --git a/include/linux/soc/mediatek/infracfg.h 
> b/include/linux/soc/mediatek/infracfg.h
> index 4615a228da51..94f0f338ce49 100644
> --- a/include/linux/soc/mediatek/infracfg.h
> +++ b/include/linux/soc/mediatek/infracfg.h
> @@ -147,6 +147,9 @@
>   #define INFRA_TOPAXI_PROTECTEN_SET        0x0260
>   #define INFRA_TOPAXI_PROTECTEN_CLR        0x0264
> 
> +#define MT8192_INFRA_CTRL            0x290
> +#define MT8192_INFRA_CTRL_DISABLE_MFG2ACP    BIT(9)
> +
>   #define REG_INFRA_MISC                0xf00
>   #define F_DDR_4GB_SUPPORT_EN            BIT(13)
> 

