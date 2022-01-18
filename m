Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E466C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jan 2022 15:02:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345936AbiARPCQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jan 2022 10:02:16 -0500
Received: from foss.arm.com ([217.140.110.172]:58848 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345584AbiARPBz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 18 Jan 2022 10:01:55 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0D0B1FB;
        Tue, 18 Jan 2022 07:01:54 -0800 (PST)
Received: from [10.57.67.190] (unknown [10.57.67.190])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 723883F766;
        Tue, 18 Jan 2022 07:01:52 -0800 (PST)
Message-ID: <69525223-7d90-5714-bbe9-4d7f0b9a293d@arm.com>
Date:   Tue, 18 Jan 2022 15:01:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
Content-Language: en-GB
To:     Chen-Yu Tsai <wenst@chromium.org>,
        Alyssa Rosenzweig <alyssa@collabora.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        linux-mediatek@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ikjoon Jang <ikjn@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Nick Fan <Nick.Fan@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>
References: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com>
 <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com> <YeF/AYZ0DuKGwLLk@maud>
 <CAGXv+5H9BsNUdiY6zMH6THKKMvRdPypNtUEVviMHQEjgNGDk_A@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CAGXv+5H9BsNUdiY6zMH6THKKMvRdPypNtUEVviMHQEjgNGDk_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2022-01-18 07:19, Chen-Yu Tsai wrote:
> Hi,
> 
> On Fri, Jan 14, 2022 at 9:47 PM Alyssa Rosenzweig <alyssa@collabora.com> wrote:
>>
>>>> That links to an internal Google issue tracker which I assume has more
>>>> information on the bug. I would appreciate if someone from Google or
>>>> MediaTek could explain what this change actually does and why it's
>>>> necessary on MT8192.
>>>>
>>>> At any rate, this register logically belongs to the MT8192 "infra" clock
>>>> device, so it makes sense to set it there too. This avoids adding any
>>>> platform-specific hacks to the 3D driver, either mainline (Panfrost) or
>>>> legacy (kbase).
>>>
>>> Does this really have anything to do with clocks?
>>
>> I have no idea. MediaTek, Google, please explain.
>>
>>> In particular, "ACP" usually refers to the Accelerator Coherency Port
>>> of a CPU cluster or DSU, and given the stated symptom of the issue
>>> affected by it, my first guess would be that this bit might indeed
>>> control routing of GPU traffic either to the ACP or the (presumably
>>> non-coherent) main interconnect.
>>
>> I'd easily believe that.
> 
> As Robin guessed, "ACP" here does refer to the Accelerator Coherency Port.
> And the bit in infracfg toggles whether ACP is used or not.
> 
> Explanation from MediaTek in verbatim:
> 
> -------------------------------------------------------------------------
> The ACP path on MT8192 is just for experimental only.
> We are not intended to enable ACP by design.
> 
> But due to an unexpected operation, it was accidently opened by default.
> So we need a patch to disable the ACP for MT8192.
> -------------------------------------------------------------------------

Aha! That's great, thanks ChenYu!

Stephen, my thinking here is that if this feature controls the GPU 
interconnect, and only matters when the GPU is going to be used (as 
strongly implied by the downstream implementation), then the GPU driver 
is the only interested party and may as well take responsibility if 
there's no better alternative.

I'd agree that if there was already a "base" infracfg driver doing 
general system-wide set-and-forget configuration then it would equally 
well fit in there, but that doesn't seem to be the case. Short of trying 
to abuse the bp_infracfg data in the mtk-pm-domains driver (which 
doesn't seem like a particularly pleasant idea), the code to poke a bit 
into a syscon regmap is going to be pretty much the same wherever we add 
it. There's already a bit of a pattern for MTK drivers to look up and 
poke their own infracfg bits directly as needed, so between that and the 
downstream implementation for this particular bit, leaving it to 
Panfrost seems like the least surprising option.

Cheers,
Robin.
