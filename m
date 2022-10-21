Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697EEC38A2D
	for <linux-clk@archiver.kernel.org>; Fri, 21 Oct 2022 18:52:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiJUSwP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Oct 2022 14:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbiJUSwO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Oct 2022 14:52:14 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7C092623DA
        for <linux-clk@vger.kernel.org>; Fri, 21 Oct 2022 11:52:12 -0700 (PDT)
Received: from [192.168.1.139] ([37.4.248.17]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MvKTJ-1p3cb830vB-00rHmL; Fri, 21 Oct 2022 20:51:59 +0200
Message-ID: <b93952bd-7f4d-45b0-92b7-f49606ac9782@i2se.com>
Date:   Fri, 21 Oct 2022 20:51:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: BCM2835 clock driver, power domains and CLK_SET_RATE_GATE
To:     maxime@cerno.tech
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>, linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>
References: <20221021140505.kjmw5x4s6qhnrfif@houat>
Content-Language: en-US
From:   Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20221021140505.kjmw5x4s6qhnrfif@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:/WhiNc5Co9B6JvLGDvw+CCM8MV/3Nv5HvwbyRBRKSRisr+cA+Ff
 BbS7xqKoc6pDvcum9e4oGI8XnwrMFtGtLA7GJRqkagTmdabCAHYEgsjJ7q6Cay52LPm2/74
 c+cg3pwS/BgYST24dgKvnoeQoZZDMr1c/DYKPLoKrsfRB3LdvZT/muw8ad8vlTBgk2QIYPx
 OJBBqOBTnh2Yl2tCrtU6g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7VdAL8VmeYU=:Cn0Bs+dInBtoZkTKdrPBY2
 1Lu32Q4e6IbLvJt3v1HLetG9ICWr1de0toiGBIbdfzsZ6WSIpcGDIQLt3WyGOee/y622gzDDH
 X3P3P5Tk/grzFKD5bFtE/0HSAIZeWOTZPhaG8d70a4086gZNOHrq2V2KboSmBkK622ORFlHw0
 4/nG9rJACA9TYF91I26x0MpSVBKRri5mXNYwtzA93Zq3WjKypq3e7yT1fkSQWx8Mo9j90hQ5p
 isBjJxDShRC9vn+y//dC0XvljqHanFt5AFVQzKKcAavWIIiLPmBndGMlz4KhRAymJJ3gEzJu2
 N7D26U6REWA26qJIn9nvyReLp8jQ+9KVzPsc8o00zqsWxX6/btZOoZ1+3EhoeV2B4/bR+ZprD
 rtpTKxGoBhiW/A3vI6tmQQi5WEW6u42Kkbv2ZInPo7Lt86ZLEGBOgbOZVFbADUeVQrzkYHLYg
 rLj+qrgun8yQ1s0aVh4yAuSqdFr0GtopecR9pvBQbG39qSvElnbyRZuZ16yxlQ4SZzn3XmDRK
 kP3nqTbFkdtCtawBhyecvT1Dyssf7mITY9Txu1Ony1NcWsSccgFTKwtrT33UEAtS0rmxx0HVZ
 7oQlyrCxJ7OSR0h/P/5nD6vOSx0LxI0/ioC1Tmp0z1cL1fVMhRMz5iyd3sinwY4FnVdk5PVsI
 zwYilzd5QOJD5orAkfpVHZaxtt8OVAueCyyW3XzWGUTACRbTid/mTmahu+Iw4ia2L2erw15AR
 GMLXRguxvvKnfAWSLzFDb+Ha9MMnHzNXJTpO7iECajNJxEwtv3iD+G29WEwLcz8LSlLyM/1uK
 NXV6vuwa9pt0t+eKt+Q2Vydszz2LQ==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

Am 21.10.22 um 16:05 schrieb maxime@cerno.tech:
> Hi,
>
> I had to fix a regression today that was mostly due to the fact that
> clk-bcm2835 and clk-raspberrypi have fairly diverging behaviour.
>
> https://lore.kernel.org/dri-devel/20221021131339.2203291-1-maxime@cerno.tech/
>
> The "fix" is rather suboptimal and I'd like to address it properly.
>
> Even though the commit message tries to explain everything and why other
> solutions wouldn't work, the underlying cause is that clk-bcm2835 has a
> bunch of restrictions that I don't really get and we have to work
> around. I'm not sure I have the full picture either, so please take the
> following with a grain of salt.
>
> The first one is that the HSM clock discussed in that patch is part of
> the HDMI power domain, so it has to be powered for the clock to retain
> its configuration.
>
> The side effect is that we need to initialize the clock at boot time so
> that it has some rate. This is pretty important since that clock feeds
> the register and thus a failure to initialize would lock the CPU on a
> register access.
>
> The second one is that since clk-bcm2835 has CLK_SET_RATE_GATE, we have
> to call clk_set_min_rate() before clk_prepare_enable(), or
> clk_set_min_rate() is likely to fail.
>
> So we need in runtime_resume to call clk_set_min_rate with an absolute
> minimum for the HDMI controller to be functional and then enable the
> clock.
>
> But then, since we have enabled the HSM clock by the time
> pm_runtime_resume_and_get in vc4_hdmi_encoder_pre_crtc_configure()
> returns, the clock is enabled so we can't adjust its rate based on the
> resolution after the runtime_resume.
>
> But if we do it before runtime_resume, then the clk_set_min_rate() call
> in runtime_resume will override the "resolution rate" with the "absolute
> minimum" rate.
>
> Removing CLK_SET_RATE_GATE would solve this entirely, since we could
> move the pre_crtc_configure clk_set_min_rate() call after
> runtime_resume, and it would work just fine.
>
> But the interaction with the power domain is weird to me. I'm not even
> sure how it's even supposed to work if one has to disable the clock (and
> its power domain?) to change the rate, but the configuration won't stick?
>
> So I guess my question is how can we untangle this a bit so that we can
> simplify the users of that driver?

sorry, but i'm unable to help you here. This is out of my scope :-(

Stefan

>
> Thanks!
> Maxime
