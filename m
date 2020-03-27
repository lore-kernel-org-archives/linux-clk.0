Return-Path: <SRS0=mPu9=5M=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF989C43331
	for <linux-clk@archiver.kernel.org>; Fri, 27 Mar 2020 06:20:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA34B20716
	for <linux-clk@archiver.kernel.org>; Fri, 27 Mar 2020 06:20:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgC0GUN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Mar 2020 02:20:13 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57206 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbgC0GUN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Mar 2020 02:20:13 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: myjosserand)
        with ESMTPSA id 8D9F6290B99
Subject: Re: [PATCH 1/2] ARM: Rockchip: Handle rk3288/rk3288w revision
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20200302155703.278421-1-mylene.josserand@collabora.com>
 <20200302155703.278421-2-mylene.josserand@collabora.com>
 <2221545.2vEflg7qi2@diego>
 <CAMuHMdXJQqaCcMko9GUAeUiYQzmy3vnX42yVQNPzhj5ijtFuYA@mail.gmail.com>
 <5802ec08-5e6a-8547-ee8e-dde630791235@collabora.com>
 <CAMuHMdVKFT7eNK0RUi3miJ08O9FMAVs5Qz=YmbHH5-9UUzLNPw@mail.gmail.com>
From:   Mylene Josserand <mylene.josserand@collabora.com>
Message-ID: <5efe50ad-a88e-bc8c-de08-3be355ad9e53@collabora.com>
Date:   Fri, 27 Mar 2020 07:20:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVKFT7eNK0RUi3miJ08O9FMAVs5Qz=YmbHH5-9UUzLNPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Geert,

On 3/26/20 4:31 PM, Geert Uytterhoeven wrote:
> Hi Mylene,
> 
> On Thu, Mar 26, 2020 at 2:50 PM Mylene Josserand
> <mylene.josserand@collabora.com> wrote:
>> On 3/6/20 11:45 AM, Geert Uytterhoeven wrote:
>>> On Wed, Mar 4, 2020 at 12:00 PM Heiko Stübner <heiko@sntech.de> wrote:
>>>> Am Montag, 2. März 2020, 16:57:02 CET schrieb Mylène Josserand:
>>>>> Determine which revision of rk3288 by checking the HDMI version.
>>>>> According to the Rockchip BSP kernel, on rk3288w, the HDMI
>>>>> revision equals 0x1A which is not the case for the rk3288 [1].
>>>>>
>>>>> As these SOC have some differences, the new function
>>>>> 'soc_is_rk3288w' will help us to know on which revision
>>>>> we are.
>>>>
>>>> what happened to just having a different compatible in the dts?
>>>> Aka doing a
>>>>
>>>> rk3288w.dtsi with
>>>>
>>>> #include "rk3288.dtsi"
>>>>
>>>> &cru {
>>>>           compatible = "rockchip,rk3288w-cru";
>>>> }
>>>>
>>>> I somehow don't expect boards to just switch between soc variants
>>>> on the fly.
>>>>
>>>> Also, doing things in mach-rockchip is not very future-proof:
>>>>
>>>> (1) having random soc-specific APIs spanning the kernel feels wrong,
>>>>       especially as at some point it might not be contained to our own special
>>>>       drivers like the cru. I cannot really see people being enthusiastic if
>>>>       something like this would be needed in say the core Analogix-DP bridge ;-)
>>>
>>> Indeed.  You're better of registering an soc_device_attribute using
>>> soc_device_register(), after which any driver can use soc_device_match()
>>> to differentiate based on the SoC revision.
>>
>> Thank you for this suggestion. The issue is that clocks are registered
>> at an early stage of the boot so using initcalls is too late for the
>> clock differentiation :(
> 
> IC, rk388 is still using CLK_OF_DECLARE().
> What about converting it to a platform driver, registered from e.g.
> subsys_initcall()?
> If you need some clocks early (e.g. for timers), you can do split
> registration, with the early part still using CLK_OF_DECLARE().
> That should work, assumed the timer clocks don't need differentiation.
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

oh, nice, thanks for the help!
I will try that and send a new version if it is working fine.

Best regards,
Mylène
