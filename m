Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DDAC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 11:56:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbiGKL4E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 07:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGKL4D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 07:56:03 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26D73247E
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 04:56:01 -0700 (PDT)
Received: from [192.168.1.107] ([37.4.249.155]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MPrXf-1nyZx41n6Z-00Msxu; Mon, 11 Jul 2022 13:55:37 +0200
Message-ID: <c131ad48-aaea-7d56-6370-5131c11251d6@i2se.com>
Date:   Mon, 11 Jul 2022 13:55:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 0/3] clk: bcm: rpi: Add support for three more clocks
Content-Language: en-US
To:     "Ivan T. Ivanov" <iivanov@suse.de>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Guillaume Gardet <Guillaume.Gardet@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, nd <nd@arm.com>
References: <20220428065743.94967-1-iivanov@suse.de>
 <VI1PR08MB2847DA5DC2665EBA2756D7EB83C99@VI1PR08MB2847.eurprd08.prod.outlook.com>
 <20220510133019.h2urxj3feponfuku@houat>
 <ce3e2e21-dc54-1f77-fdbb-6d3627917830@i2se.com>
 <b5c560cf5610fa8da1cfd7ef06ca6bac@suse.de>
From:   Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <b5c560cf5610fa8da1cfd7ef06ca6bac@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:p/+h/V05rq6PEONcSaAvhJ0YwM2fc3XX4/s5J2mu6wc9Yc1Wl9B
 ACwAwYP4XRc5onQoUiOkEgX7TSvfMebABnYdMC6x6ReEHuCHZDx4ls4IOP0hKhlSQOtD5kR
 7z8rVrlGqM0l3jIPt8+fLDyrsg3kLYeMFtYVxGJc9T5TY35kVbTp6dLWAwhTUp40JMw/ngz
 ZVD2Ilhpo0c2jRciuGyvA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hWfTAZ/Hpg4=:p1L0f3VxThNwqkRhekJHAU
 bQWOdGTpaEm35yF6gJbVVqRQrinGZzA9obgOQ7tAcbZdvejR5ZTLKdIWTHXkZa8nRerVp4d49
 +UcgNmTYH1VPafV43Fg40Z67i2wealNvpzZ70TzvrwFRAFVllXc/FPOQ928iuv+AeaR2Iua1w
 w1UFeaCQpdK9QArecDThO9KtB0bwTX9FzQ2eMYs/wWwQCh9xRe5NuMkgJxRED9jWiyFjrwCq7
 nODOCaSxLgNBH7nfa8JvACnMZMZnAp3MYtRMuvP2dK7WrSiuuUVY/QfGa4zhWnY+DSLr5Eusw
 mos9N2PuhEzgB2ZBUiTWpMrkjBfoj2PQBszbh9fecFGMz5OZhWpqRyzXLdzWYctg3Gjrt9bOr
 AQopPOmFCjJ1dyvkluYrrFCZc6PSQAXcqUwiIh3nXdrT3c5WVj1payOt++WP7vzqPvOgPFatA
 YqC+CEt/Em1RUJoQzDYZfIql7st59Hi/h/9rfYxaTUkLfDSnSdMkIxAgIgghK+I/YCDp00nSp
 FytqaMnmfwRWVMEOyiP7CxbIU82AdzInvke1uQd+bAgzNP67mveoSWTmJpCApv8UDtFsiQABX
 wTtGeikNdqPtxVAwo16pvZNeXOp7AgOLguKlPnfJbCnDC7K+6g31jjxQqJvIACTo2ppmGij1X
 00EWpBLMvDNw28GJE4rdjPzvX1kiGcigXf2TO0kAbUUkVrJC+4SDCnk3G8E+p6Ub3KXPa+934
 n0N4vUpbaMxiSDmzf2OUNPb5qPRBnbsuokasKcRu5D1SwjfhgQeMqTpvbBk=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Am 11.07.22 um 09:02 schrieb Ivan T. Ivanov:
>
> Hi,
>
> On 2022-07-10 14:12, Stefan Wahren wrote:
>> Hi,
>>
>> Am 10.05.22 um 15:30 schrieb Maxime Ripard:
>>> Hi,
>>>
>>> On Tue, May 10, 2022 at 01:20:18PM +0000, Guillaume Gardet wrote:
>>>> May I ask what's the status/plan of this patch series?
>>> As far as I know it hasn't been merged yet.
>>>
>>>> It seems it has not been merged yet, and I know we are a bit late in
>>>> the 5.18 schedule, but I think this is a good fix for 5.18.
>>> Fix for what? I don't think this series fix any bug?
>>
>> i think this series (or at least parts of it) is a workaround for this
>> issue [1].
>
> No, not really. Bug which this patch set fixes is this one [2].

Both are related. In your case the device tree defines a clock ID which 
isn't define in the kernel driver. So the behavior (abort probing in 
case of invalid DTB) is correct to me. But the log message isn't helpful 
to end users.

This is broken by design, since we need to synchronize videocore 
firmware, kernel and DTB at the same time. Maybe this works for 
Raspberry Pi OS, but not for all users.

We need to fix this driver before add new clocks.

> When using downstream dtb and up to date bootloader index 15 is
> valid id RPI_FIRMWARE_VEC_CLK_ID which is used by vc4 module.
I think this only applies to the downstream kernel. AFAIK the 
bcm2835-clk is still used for VEC in mainline.
>
>>
>> We better fix the root cause of the potential out of bounds access in
>> clk-raspberrypi properly. I will send a patch soon.
>
> If not mistaken after last rework driver already handle this properly.
> clk-raspberrypi.c:362

No, this doesn't prevent the possible out of bounds access, what i mean. 
It's the condition of the while loop.

Best regards

>
> Regards,
> Ivan
>
>>
>> [1] - https://github.com/raspberrypi/firmware/issues/1688
>
> [2] https://bugzilla.suse.com/show_bug.cgi?id=1196632
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
