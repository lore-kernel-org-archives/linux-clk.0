Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7388C433B4
	for <linux-clk@archiver.kernel.org>; Mon,  3 May 2021 07:38:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE07E61153
	for <linux-clk@archiver.kernel.org>; Mon,  3 May 2021 07:38:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbhECHjB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 May 2021 03:39:01 -0400
Received: from cable.insite.cz ([84.242.75.189]:36168 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230364AbhECHjB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 3 May 2021 03:39:01 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 5A35EA1A3D401;
        Mon,  3 May 2021 09:38:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1620027485; bh=x5nI6Y/TftiwHufO8w7oc+3ZTayQxrZ6H7uCE7zZPWk=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=COFx/rLwjjwIJjubWFMGZ3Y9vAA0GwN46HxRJEUuqrvvFHb2bOAj5kQlfy0uDfqEH
         7Z9MGaNmW8nd4hVS7TKrxPyQ7PmuOISOKJvzoN4qPoR/rNoz+SKQyOHqROgU1poNIx
         jDFm5i43fW6c/LEFYRz4ea+T56zOYfuHV+HGyNsg=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id H3Zu7aK6qZ3F; Mon,  3 May 2021 09:37:59 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 9CA3EA1A3D400;
        Mon,  3 May 2021 09:37:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1620027479; bh=x5nI6Y/TftiwHufO8w7oc+3ZTayQxrZ6H7uCE7zZPWk=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=I2N697IiCL+rHrKNXZaVOhGnbPvVgiybmZB7Ci2qlj7ByE8wcfGqWY6KyXeUguupY
         H2U8+DD+mf8fuIFP7L3/b+FVP9IuTJDsoi5T4y5DexHWybcm9kh6fRn/RwUWn1UVPA
         rogQyon6GQncNF6pkCPQXB5cxlQOgAUZLsz5DfHc=
Subject: Re: Recommended method for changing clk params dynamically from user
 space?
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
References: <fceb112b-2241-5f67-2b29-3dda161f7c48@ivitera.com>
 <e07b3b45-2500-4a0e-4874-3bc1ebe75918@ivitera.com>
 <161956915591.177949.3064618109796640887@swboyd.mtv.corp.google.com>
 <b8088e6d-cea3-6dfd-dffb-c1645cbc95cd@ivitera.com>
 <161974733948.177949.2462163593797505108@swboyd.mtv.corp.google.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <4fc66ca5-7ec3-130a-975e-2d84610878e1@ivitera.com>
Date:   Mon, 3 May 2021 09:37:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161974733948.177949.2462163593797505108@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dne 30. 04. 21 v 3:48 Stephen Boyd napsal(a):
> Quoting Pavel Hofman (2021-04-28 00:08:55)
>> Dne 28. 04. 21 v 2:19 Stephen Boyd napsal(a):
>>> Quoting Pavel Hofman (2021-04-24 01:00:47)
>>>> Dne 23. 04. 21 v 9:38 Pavel Hofman napsal(a):
>>>>> Hi, I would like to add some missing features to clk-si5341.c that I
>>>>> need for my project. From user-space I need to tune delays at each
>>>>> output (the driver does not control corresponding registers yet) and
>>>>> fine-tune frequency while the clock is running (likely the nom/denom
>>>>> values).
>>>>>
>>>>> IIUC all driver parameters are currently configured via DT. Please what
>>>>> is the recommended method/best practice for changing clk params
>>>>> dynamically from user space? SysFS, configFS? I would like to have the
>>>>> patches accepted upstream eventually.
>>>>>
>>>>
>>>> From what I have read sysfs seems the most suitable option. But I am
>>>> surprised I could not find any driver-specific sysfs code in the clk
>>>> drivers. Theoretically I could fine-tune the device via I2C directly
>>>> from userspace but that feels wrong. Plus others could potentially
>>>> benefit from the features added to the clk driver. Please any suggestions?
>>>>
>>>
>>> So far there isn't a userspace clk interface. Clk control is fairly low
>>> level so I think nobody has implemented it so far. This topic comes up
>>> every year or two, so you can probably search the mailing list archives
>>> if you're interested in previous discussions.
>>>
>>> Can you avoid implementing a userspace API? Are you implementing
>>> userspace drivers?
>>>
>>
>> Hi Stephen, thanks a lot for your info. I searched a bit and found
>> https://www.spinics.net/lists/linux-clk/msg06704.html .
>>
>> I do not want to implement any userspace clock API, but user-space
>> control of extended features of a specific chip, currently missing in
>> the particular driver. Clock generators Si5340/1 (and many more, but
>> they are not my focus) can adjust output skew/delay on each output.
> 
> Is the output skew/delay to control clk phase?

The skew controls delay of the clk signal for the given output. So
basically it is phase, but enumerated in fractions of the internal
oscillator.

> 
>> Also
>> they allow fine-tuning the frequencies while running, by tiny
>> incremental steps. These features need to be controlled dynamically from
>> user space, by the application using them.
> 
> Can you share more details on the application?

Audio analyzer (DAC, ADC, clock, protection, ranging, etc.). Fine-tuning
the frequency can be used e.g. for sampling an analog oscillator with
slowly drifting frequency. Clock skew is required for adjusting delays
introduced by the various HW components so that all synchronous clock
signals reaching the DAC/ADC correct delays against each other. It will
take some experimentation and hard-coding the values in the device tree
config is not practical.

> 
>> None of the features iteract
>> with the in-kernel clock API. The fine-tuning control would not change
>> the set_rate/get_rate values, but adjust the real frequency, similarly
>> to alsa control 'PCM Rate Shift 100000' in snd-aloop loopback. So my
>> question is whether sysfs is the currently preferred interface for
>> specific-module control like this, or what other method should be used.
>>
> 
> Given that you're comparing to alsa control, is this for some audio
> processing feature? Perhaps it needs to be controlled via alsa then and
> eventually call into the clk driver to fine tune the clk that the
> sound driver consumes.

The alsa controls in snd-aloop are directly used by that module. In my
case the alsa driver would have to know how to operate specific features
of the specific clk driver, yet serving just as a proxy for the
controls. The alsa driver itself needs only the standard clk API for its
operation. IMO controlling the specific clock features directly is
correct as the features are provided by the specific clock HW and do not
interact with the standard clock API.

Nevertheless, in the end I decided to control all the Si5340 features
via I2C from my userspace application (incl. clk frequency settings),
avoiding the existing kernel Si5340 driver alltogether.

Thanks a lot,

Pavel.

