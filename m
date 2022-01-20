Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F565C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jan 2022 14:22:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345786AbiATOWV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jan 2022 09:22:21 -0500
Received: from foss.arm.com ([217.140.110.172]:39876 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345742AbiATOWT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 20 Jan 2022 09:22:19 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C83DA1FB;
        Thu, 20 Jan 2022 06:22:18 -0800 (PST)
Received: from [10.57.68.26] (unknown [10.57.68.26])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DD693F766;
        Thu, 20 Jan 2022 06:22:16 -0800 (PST)
Message-ID: <5d839338-6072-9c52-1893-2f804d937ea1@arm.com>
Date:   Thu, 20 Jan 2022 14:22:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From:   Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
To:     Stephen Boyd <sboyd@kernel.org>,
        Alyssa Rosenzweig <alyssa@collabora.com>
Cc:     Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
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
Content-Language: en-GB
In-Reply-To: <20220119021844.3C225C340E5@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2022-01-19 02:18, Stephen Boyd wrote:
> Quoting Robin Murphy (2022-01-18 07:01:46)
>> On 2022-01-18 07:19, Chen-Yu Tsai wrote:
>>> Hi,
>>>
>>> On Fri, Jan 14, 2022 at 9:47 PM Alyssa Rosenzweig <alyssa@collabora.com> wrote:
>>>>
>>>>>> That links to an internal Google issue tracker which I assume has more
>>>>>> information on the bug. I would appreciate if someone from Google or
>>>>>> MediaTek could explain what this change actually does and why it's
>>>>>> necessary on MT8192.
>>>>>>
>>>>>> At any rate, this register logically belongs to the MT8192 "infra" clock
>>>>>> device, so it makes sense to set it there too. This avoids adding any
>>>>>> platform-specific hacks to the 3D driver, either mainline (Panfrost) or
>>>>>> legacy (kbase).
>>>>>
>>>>> Does this really have anything to do with clocks?
>>>>
>>>> I have no idea. MediaTek, Google, please explain.
>>>>
>>>>> In particular, "ACP" usually refers to the Accelerator Coherency Port
>>>>> of a CPU cluster or DSU, and given the stated symptom of the issue
>>>>> affected by it, my first guess would be that this bit might indeed
>>>>> control routing of GPU traffic either to the ACP or the (presumably
>>>>> non-coherent) main interconnect.
>>>>
>>>> I'd easily believe that.
>>>
>>> As Robin guessed, "ACP" here does refer to the Accelerator Coherency Port.
>>> And the bit in infracfg toggles whether ACP is used or not.
>>>
>>> Explanation from MediaTek in verbatim:
>>>
>>> -------------------------------------------------------------------------
>>> The ACP path on MT8192 is just for experimental only.
>>> We are not intended to enable ACP by design.
>>>
>>> But due to an unexpected operation, it was accidently opened by default.
>>> So we need a patch to disable the ACP for MT8192.
>>> -------------------------------------------------------------------------
>>
>> Aha! That's great, thanks ChenYu!
>>
>> Stephen, my thinking here is that if this feature controls the GPU
>> interconnect, and only matters when the GPU is going to be used (as
>> strongly implied by the downstream implementation), then the GPU driver
>> is the only interested party and may as well take responsibility if
>> there's no better alternative.
>>
>> I'd agree that if there was already a "base" infracfg driver doing
>> general system-wide set-and-forget configuration then it would equally
>> well fit in there, but that doesn't seem to be the case.
> 
> Wouldn't this first set-and-forget configuration fit that bill? We can't
> have a "base" driver because why?

Sure, everything has a starting point somewhere, it just means more work 
for someone to have to do. I'm not that person - I'm just here as a 
curious reviewer asking questions to help refine the abstraction - so I 
chose to lean towards the pragmatic side here given what I know about 
how much Alyssa enjoys kernel development ;)

>> Short of trying
>> to abuse the bp_infracfg data in the mtk-pm-domains driver (which
>> doesn't seem like a particularly pleasant idea), the code to poke a bit
>> into a syscon regmap is going to be pretty much the same wherever we add
>> it. There's already a bit of a pattern for MTK drivers to look up and
>> poke their own infracfg bits directly as needed, so between that and the
>> downstream implementation for this particular bit, leaving it to
>> Panfrost seems like the least surprising option.
>>
> 
> I'd prefer we leave the SoC glue out of device drivers for subsystems
> that really don't want to or need to know about the SoC level details.
> The GPU driver wants to live life drawing triangles! :) It doesn't want
> to know that the ACP path didn't work out on some SoC it got plopped
> down into. And of course GPU is the only interested party, because the
> SoC glue for the GPU is all messed up so GPU can't operate properly
> without this bit toggled. I wonder where the fix would end up if this
> port was shared by more than one driver. Probably back here in the
> closest thing there is to the SoC driver.

As I hoped to imply, I agree that that's a perfectly valid line of 
reasoning too. However it does gloss over certain other considerations 
like managing dependencies between the drivers such that it's not too 
cryptic for a user to configure a kernel that actually works as 
expected, and the GPU driver has a guarantee that the configuration 
really has been done by the point that it wants to start DMA, for instance.

> It's not as simple as poking bits in some SoC glue IO space
> unconditionally either. The GPU driver will need to know which SoC is
> being used and then only poke the bits if the affected SoC is in use. Or
> we'll have some DT binding update to poke the bit if some syscon
> property is present in the DT node. Either way, it's a set-and-forget
> thing, so the GPU driver will now have some set-and-forget logic for one
> SoC out of many that it supports; do it once at boot, grab a regmap,
> parse some more stuff to make sure it's needed, poke the bit, release
> the regmap, finally start drawing.

In this case we do happen to have this handy function called 
panfrost_probe() which already deals with one-off startup stuff :P

We also already have SoC-specific GPU compatibles because even without 
experimental interconnect easter eggs, people integrate these IPs in 
fairly involved ways and there's a fair degree of variety. However 
unless we want to be super-strict it's also not too hard to simply 
assume that if we can find a "mediatek,mt8192-infracfg" syscon then we 
set the MT8192 magic bit within it, and if we can't then we don't.

> Of course, I won't oppose the mess being moved somewhere outside of the
> subsystem I maintain ;-) I was mainly curious to understand why the
> regmap path is proposed.

Well, regmap because it's a syscon, so whoever's accessing it that 
should be via its existing regmap rather than going behind its back. To 
be fair, there is a nascent infracfg "driver" already (even if it's just 
two helper functions), so adding some new infrastructure in there is a 
clear possibility - the functionally-similar Rockchip GRF already has 
something comparable, for example - it's just somewhat more code and 
more work thinking through the additional reasoning, compared to piling 
SoC-specific GPU-related stuff into the place that already knows about 
SoC-specific GPU stuff. As things stand, if someone *is* prepared to 
take that on then it's fine by me!

FWIW, I have no desire to look more closely at the downstream driver, 
but I did notice in the context of the linked patch that there appeared 
to be some power-management-looking stuff as well as this magic bit, so 
if it's possible that that might be something we care about in future 
and mean we end up needing to poke syscons from Panfrost anyway, it 
might want factoring in to the decision.

Cheers,
Robin.
