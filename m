Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-vk0-f49.google.com ([209.85.213.49]:35766 "EHLO
        mail-vk0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751977AbeCOQUG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Mar 2018 12:20:06 -0400
Received: by mail-vk0-f49.google.com with SMTP id r197so3793473vke.2
        for <linux-clk@vger.kernel.org>; Thu, 15 Mar 2018 09:20:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <b0b083c6-3a99-c0ed-9f1b-bba203eaa6bc@rock-chips.com>
References: <1521104071-19595-1-git-send-email-hl@rock-chips.com>
 <18794d71-ec37-7af4-3de6-7a43a5c66010@rock-chips.com> <df78009d-924f-6b9c-6bf6-f1f69d162708@rock-chips.com>
 <b0b083c6-3a99-c0ed-9f1b-bba203eaa6bc@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 15 Mar 2018 09:20:04 -0700
Message-ID: <CAD=FV=UaGaE0FX7ofQgSqsyir08psc0-EkHq9_WTW7EQvTZPog@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: assign correct id for pclk_ddr and hclk_sd
 in rk3399
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: hl <hl@rock-chips.com>, Derek Basehore <dbasehore@chromium.org>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Brian Norris <briannorris@chromium.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        diander@chromium.org, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Thu, Mar 15, 2018 at 6:40 AM, Shawn Lin <shawn.lin@rock-chips.com> wrote:
> [Correct Doug's email address]
>
> On 2018/3/15 17:12, hl wrote:
>>
>> Hi Shawn,
>>
>>
>> On Thursday, March 15, 2018 05:01 PM, Shawn Lin wrote:
>>>
>>> Hi Huang,
>>>
>>> On 2018/3/15 16:54, Lin Huang wrote:
>>>>
>>>> Assign id PCLK_DDR to pclk_ddr, id HCLK_SD to hclk_sd, so we can
>>>> assign frequency for them in dts.
>>>
>>>
>>> I'm curious under which condition that we need assign frequency for
>>> hclk_sd?
>>
>> We may set CPLL frequency higher than 800MHz, with that we need assign
>> clock
>> to hclk_sd, otherwise it will exceed 200MHz, since we use the default cru
>> register value to get hclk_sd for now.
>> you can check
>>
>> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/956678/5
>
>
> Okay, thanks for pointing me to the actual user case.
> I'm fine with that, however, what I am thinking now is:
>
> (1) It's worth elaborating more in the commit msg.

Seems like a nice idea to me.


> (2) The reason you need set hclk_sd is that it depends on the
> defualt settings but lack real owner to explicitly set it to <=200MHz.

Actually, in the case of hclk_sd there _is_ an owner to set it to <=
200 MHz.  I'll comment on the gerrit review, but the assigned clock
for hclk_sd probably belongs in the node "sdmmc: dwmmc@fe320000".

...but in any case, you still need the clock ID to do that.


> So my another question is if that is more about aspect of power
> consumption, then it looks okay to me. But if that is a SoC limitation,
> then we are under risk for that. Either we should never rely on the
> default settings, or we should set its rate range after registering this
> clock provider.

I have always wondered about perhaps encoding the min/max clock rate
for each clock somewhere in the source code.  Then whenever we change
clock rates we could enforce that we don't ever go past this min/max.
In think, in theory, this is possible by registering for all the right
callbacks / notifications.  ...but I suspect that doing in a generic /
performant way might be very difficult.  Specifically, whenever a
clock changes you may need to make all sorts of decisions about
re-parenting and also checking whether all your children are out fo
spec.

So without encoding the min/max and having it magically auto-resolve,
the best we can do is just to assign a sane clock rate.  If there's no
subsystem owning this clock then doing so at clock init time is sane
(and that's what we do with many clocks).  If a subsystem owns it,
doing it when the subsystem is probed is sane.


So, to summarize, I'm happy with this change.  I wouldn't mind a
little more justification in the CL description but personally I won't
make a big deal about it.

Reviewed-by: Douglas Anderson <dianders@chromium.org>


-Doug
