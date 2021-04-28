Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D75C433ED
	for <linux-clk@archiver.kernel.org>; Wed, 28 Apr 2021 07:09:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAAE5613D9
	for <linux-clk@archiver.kernel.org>; Wed, 28 Apr 2021 07:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhD1HJt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Apr 2021 03:09:49 -0400
Received: from cable.insite.cz ([84.242.75.189]:56827 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229643AbhD1HJt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 28 Apr 2021 03:09:49 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 3BC12A1A3D402;
        Wed, 28 Apr 2021 09:09:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1619593742; bh=m93DZ6vGAhK3eEyLN3awDsNXgKtPi23jyiFDBQvJMjs=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=HHYQ9JBMS6hiNMFtTGfMtzQZgTocMAeQayva+tsJ0z98L56++l0DrhMIwqaxWE88U
         t8zS6UQ8YWmAy5gizq15VLODX1nrG5GWMs8+IWE3NKRGTGM4Az/bPdu4M175dEKCIj
         SW9rqUpqq9BXP6s9KFXqrHKenQFVdZgy806Q/UhQ=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id g0Su7RjkHKNw; Wed, 28 Apr 2021 09:08:56 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 58403A1A3D401;
        Wed, 28 Apr 2021 09:08:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1619593736; bh=m93DZ6vGAhK3eEyLN3awDsNXgKtPi23jyiFDBQvJMjs=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=NiUf61lmeOb6mCtokBj2HaHhpua19N02bcgFYoIN3/FJytEnToro6vIXGaxu90qII
         Az/wwSpTsGDD8naJSFltVefs/uPvg66QfIpWo6Oo450ORY6o7zsSI6JvPxD5yRoNWA
         HGfXAuOT5LS3jwRdbiU0+P3Ncgo6ekhGhdUn1m+s=
Subject: Re: Recommended method for changing clk params dynamically from user
 space?
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
References: <fceb112b-2241-5f67-2b29-3dda161f7c48@ivitera.com>
 <e07b3b45-2500-4a0e-4874-3bc1ebe75918@ivitera.com>
 <161956915591.177949.3064618109796640887@swboyd.mtv.corp.google.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <b8088e6d-cea3-6dfd-dffb-c1645cbc95cd@ivitera.com>
Date:   Wed, 28 Apr 2021 09:08:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161956915591.177949.3064618109796640887@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dne 28. 04. 21 v 2:19 Stephen Boyd napsal(a):
> Quoting Pavel Hofman (2021-04-24 01:00:47)
>> Dne 23. 04. 21 v 9:38 Pavel Hofman napsal(a):
>>> Hi, I would like to add some missing features to clk-si5341.c that I
>>> need for my project. From user-space I need to tune delays at each
>>> output (the driver does not control corresponding registers yet) and
>>> fine-tune frequency while the clock is running (likely the nom/denom
>>> values).
>>>
>>> IIUC all driver parameters are currently configured via DT. Please what
>>> is the recommended method/best practice for changing clk params
>>> dynamically from user space? SysFS, configFS? I would like to have the
>>> patches accepted upstream eventually.
>>>
>>
>> From what I have read sysfs seems the most suitable option. But I am
>> surprised I could not find any driver-specific sysfs code in the clk
>> drivers. Theoretically I could fine-tune the device via I2C directly
>> from userspace but that feels wrong. Plus others could potentially
>> benefit from the features added to the clk driver. Please any suggestions?
>>
> 
> So far there isn't a userspace clk interface. Clk control is fairly low
> level so I think nobody has implemented it so far. This topic comes up
> every year or two, so you can probably search the mailing list archives
> if you're interested in previous discussions.
> 
> Can you avoid implementing a userspace API? Are you implementing
> userspace drivers?
> 

Hi Stephen, thanks a lot for your info. I searched a bit and found
https://www.spinics.net/lists/linux-clk/msg06704.html .

I do not want to implement any userspace clock API, but user-space
control of extended features of a specific chip, currently missing in
the particular driver. Clock generators Si5340/1 (and many more, but
they are not my focus) can adjust output skew/delay on each output. Also
they allow fine-tuning the frequencies while running, by tiny
incremental steps. These features need to be controlled dynamically from
user space, by the application using them. None of the features iteract
with the in-kernel clock API. The fine-tuning control would not change
the set_rate/get_rate values, but adjust the real frequency, similarly
to alsa control 'PCM Rate Shift 100000' in snd-aloop loopback. So my
question is whether sysfs is the currently preferred interface for
specific-module control like this, or what other method should be used.

Thanks a lot,

Pavel.
