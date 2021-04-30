Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D704C433B4
	for <linux-clk@archiver.kernel.org>; Fri, 30 Apr 2021 01:49:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 546FB613D8
	for <linux-clk@archiver.kernel.org>; Fri, 30 Apr 2021 01:49:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhD3Bts (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Apr 2021 21:49:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:41038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229577AbhD3Bts (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 29 Apr 2021 21:49:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD541613D8;
        Fri, 30 Apr 2021 01:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619747340;
        bh=iDnUCQQDJ3MIsmkOk4baseFwZTJouygmu6Enm0MvHgM=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=CoDv3rKfFJs8rJl4KW3Bjna/alIvJKUwxH/F2vxYAuklpKrNWERFe/Qx2DHp+a0QN
         BLOlM3A9Nx1gMh/TxdKWnbGqR54PvZMxR1NVWJ2LFIUgCcOfuIMQpSw+DmbvYxO8mU
         JBc0b31aeP8UBhce4duktmicc4kQWoSvaeyUXhHdqM0ZtTVI0Kw8kydExYzIcM8kX2
         hfwxJi5X11z1PsDUVJ8pUVA+qBx4WVkHYrHaPCZjxuRakJngqe76gDSxa1Al/pcYOf
         wviVsjaBA6m5tMa+XrHB25gCAgrrhdiYUtfYaPu3owFJ1WOavnmvGyFcQTPs/D/peN
         5zF1UEHvFQwbA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b8088e6d-cea3-6dfd-dffb-c1645cbc95cd@ivitera.com>
References: <fceb112b-2241-5f67-2b29-3dda161f7c48@ivitera.com> <e07b3b45-2500-4a0e-4874-3bc1ebe75918@ivitera.com> <161956915591.177949.3064618109796640887@swboyd.mtv.corp.google.com> <b8088e6d-cea3-6dfd-dffb-c1645cbc95cd@ivitera.com>
Subject: Re: Recommended method for changing clk params dynamically from user space?
From:   Stephen Boyd <sboyd@kernel.org>
To:     Pavel Hofman <pavel.hofman@ivitera.com>, linux-clk@vger.kernel.org
Date:   Thu, 29 Apr 2021 18:48:59 -0700
Message-ID: <161974733948.177949.2462163593797505108@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Pavel Hofman (2021-04-28 00:08:55)
> Dne 28. 04. 21 v 2:19 Stephen Boyd napsal(a):
> > Quoting Pavel Hofman (2021-04-24 01:00:47)
> >> Dne 23. 04. 21 v 9:38 Pavel Hofman napsal(a):
> >>> Hi, I would like to add some missing features to clk-si5341.c that I
> >>> need for my project. From user-space I need to tune delays at each
> >>> output (the driver does not control corresponding registers yet) and
> >>> fine-tune frequency while the clock is running (likely the nom/denom
> >>> values).
> >>>
> >>> IIUC all driver parameters are currently configured via DT. Please wh=
at
> >>> is the recommended method/best practice for changing clk params
> >>> dynamically from user space? SysFS, configFS? I would like to have the
> >>> patches accepted upstream eventually.
> >>>
> >>
> >> From what I have read sysfs seems the most suitable option. But I am
> >> surprised I could not find any driver-specific sysfs code in the clk
> >> drivers. Theoretically I could fine-tune the device via I2C directly
> >> from userspace but that feels wrong. Plus others could potentially
> >> benefit from the features added to the clk driver. Please any suggesti=
ons?
> >>
> >=20
> > So far there isn't a userspace clk interface. Clk control is fairly low
> > level so I think nobody has implemented it so far. This topic comes up
> > every year or two, so you can probably search the mailing list archives
> > if you're interested in previous discussions.
> >=20
> > Can you avoid implementing a userspace API? Are you implementing
> > userspace drivers?
> >=20
>=20
> Hi Stephen, thanks a lot for your info. I searched a bit and found
> https://www.spinics.net/lists/linux-clk/msg06704.html .
>=20
> I do not want to implement any userspace clock API, but user-space
> control of extended features of a specific chip, currently missing in
> the particular driver. Clock generators Si5340/1 (and many more, but
> they are not my focus) can adjust output skew/delay on each output.

Is the output skew/delay to control clk phase?

> Also
> they allow fine-tuning the frequencies while running, by tiny
> incremental steps. These features need to be controlled dynamically from
> user space, by the application using them.

Can you share more details on the application?

> None of the features iteract
> with the in-kernel clock API. The fine-tuning control would not change
> the set_rate/get_rate values, but adjust the real frequency, similarly
> to alsa control 'PCM Rate Shift 100000' in snd-aloop loopback. So my
> question is whether sysfs is the currently preferred interface for
> specific-module control like this, or what other method should be used.
>=20

Given that you're comparing to alsa control, is this for some audio
processing feature? Perhaps it needs to be controlled via alsa then and
eventually call into the clk driver to fine tune the clk that the
sound driver consumes.
