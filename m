Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B60C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 15 Feb 2022 15:22:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbiBOPW3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Feb 2022 10:22:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239112AbiBOPW3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Feb 2022 10:22:29 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 04D4689CF9
        for <linux-clk@vger.kernel.org>; Tue, 15 Feb 2022 07:22:19 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C16541396;
        Tue, 15 Feb 2022 07:22:18 -0800 (PST)
Received: from [10.57.70.89] (unknown [10.57.70.89])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 336CB3F66F;
        Tue, 15 Feb 2022 07:22:14 -0800 (PST)
Message-ID: <9f05238c-4649-0673-21eb-7b7562d0d5c1@arm.com>
Date:   Tue, 15 Feb 2022 15:21:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
Content-Language: en-GB
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
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
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <c69fcd5d-a79b-ed0e-e803-63bebe987390@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2022-02-15 10:44, AngeloGioacchino Del Regno wrote:
> Il 20/01/22 15:27, Alyssa Rosenzweig ha scritto:
>>> We also already have SoC-specific GPU compatibles because even without
>>> experimental interconnect easter eggs, people integrate these IPs in 
>>> fairly
>>> involved ways and there's a fair degree of variety. However unless we 
>>> want
>>> to be super-strict it's also not too hard to simply assume that if we 
>>> can
>>> find a "mediatek,mt8192-infracfg" syscon then we set the MT8192 magic 
>>> bit
>>> within it, and if we can't then we don't.
>>
>> We need a MT8192-specific compatible for the GPU anyway due to "unique"
>> power management requirements, this is why the MT8183 before it has a
>> specific GPU compatible. So I'm not worried about the compatible.
>>
> 
> Thing is, as it was explained, this is about a unwanted SoC 
> misconfiguration,
> hence this is very specific to one SoC, which *happens to* integrate a 
> Mali GPU.
> 
> I agree with Stephen's reasoning - also in my opinion, the panfrost 
> driver should
> be dedicated to managing the Mali GPUs and *not* the SoCs on which it is 
> present,
> so disabling the Accelerator Coherency Port for MFG should be performed 
> inside of
> files that are dealing with the specific SoC that requires this 
> configuration (or,
> if you want, quirk).
> 
> Simply put, though, as you already perfectly know, there is no driver 
> that is
> dedicated to exclusively manage the "extra" INFRA bits, so here's what 
> I've been
> thinking for a while; my logical reasoning:
> - Doing it in the IOMMU driver may seem at a first glance to make some 
> sense,
>    but then, does this really have anything to do with the IOMMU? I 
> don't think so;
> - Performing the disablement in mtk-pm-domains is very shady... there's 
> nothing
>    that screams "power" in that;
> - This doesn't scream "clocks" either, I understand that;
> - As far as I understand this specific thing won't happen anymore (or at 
> least,
>    not in MediaTek land, but I also don't expect to see this on other 
> SoCs).
> 
> Getting back to MediaTek-land, only MT8192 is (and will ever be) 
> affected, from
> what I understand... and there is one driver that is very specific to, 
> targets
> only, and would probe only on MT8192 - which also happens to manage the 
> very same
> iospace that we also want to poke at to disable this bit......
> 
> ... clk-mt8192!

The only trouble with that argument is that it falls apart under the
slightest scrutiny ;)

The relevant parts of the power domain, IOMMU and GPU drivers are every
bit as SoC-specific as the clock driver, and it is the generic syscon
driver which owns and manages the actual MMIO space.

All in all this has now convinced me that it *is* worth the slight extra
effort to put random infracfg stuff in the random infracfg stuff place.
And by "slight" I mean it turns out I've spent longer writing this prose
than bashing out the illustrative diff below, which is the last opinion
I shall have on this matter. Feel free to take it and fix it, or do 
anything else if you prefer :)

Cheers,
Robin.

----->8-----
diff --git a/drivers/soc/mediatek/mtk-infracfg.c 
b/drivers/soc/mediatek/mtk-infracfg.c
index 0590b68e0d78..af22d0f3d547 100644
--- a/drivers/soc/mediatek/mtk-infracfg.c
+++ b/drivers/soc/mediatek/mtk-infracfg.c
@@ -72,3 +72,20 @@ int mtk_infracfg_clear_bus_protection(struct regmap 
*infracfg, u32 mask,

  	return ret;
  }
+
+static int __init mtk_infracfg_init(void)
+{
+	struct regmap *infracfg;
+
+	/*
+	 * MT8192 has an experimental path to route GPU traffic to the DSU's
+	 * Accelerator Coherency Port, which is inadvertently enabled by
+	 * default. It turns out not to work very well, so disable it.
+	 */
+	infracfg = syscon_regmap_lookup_by_compatible("mediatek,mt8192-infracfg");
+	if (infracfg)
+		regmap_set_bits(infracfg, MT8192_INFRA_CTRL,
+				MT8192_INFRA_CTRL_DISABLE_MFG2ACP);
+	return 0;
+}
+postcore_initcall(mtk_infracfg_init);
diff --git a/include/linux/soc/mediatek/infracfg.h 
b/include/linux/soc/mediatek/infracfg.h
index 4615a228da51..94f0f338ce49 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -147,6 +147,9 @@
  #define INFRA_TOPAXI_PROTECTEN_SET		0x0260
  #define INFRA_TOPAXI_PROTECTEN_CLR		0x0264

+#define MT8192_INFRA_CTRL			0x290
+#define MT8192_INFRA_CTRL_DISABLE_MFG2ACP	BIT(9)
+
  #define REG_INFRA_MISC				0xf00
  #define F_DDR_4GB_SUPPORT_EN			BIT(13)

