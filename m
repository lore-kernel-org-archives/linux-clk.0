Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DA1C433C1
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 08:12:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B3BC619D3
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 08:12:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234321AbhCaILg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 Mar 2021 04:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234317AbhCaILc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 Mar 2021 04:11:32 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B02C061574
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 01:11:31 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id l12-20020a9d6a8c0000b0290238e0f9f0d8so18182775otq.8
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 01:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dB0gWAEfZHKWfkYzrwK4EeStUrUWxM9Hj/xXv+mALOI=;
        b=NfAdeXgL3iBuXyT9lp5nzsqiQkroT5annb1uZOmXLpNXmjk+hpy6F0F+FRveH5r1/1
         XUzWiLPwYLgMQpX7ndNKM/1Qb31qLumbWtNZQusMYrgg8eMH1glsHsq/VJKJN5v2OYR8
         qlBQFWstfKVN2XnQPUDzNgkhphm66qbGOBTBFija6FUExwqS3l/h9zS9h/dnZ35ZwNPY
         xKL9YsEOPaF9+P7hWg1B/adoSFuYlqcuzoKUqDELe9HIeVvQKUk279LunGX4e4WH6Z0g
         6bohdzIgiulsiOxgbI7yia63Elb8jGWDWKhOgYMlcQwDermLHfQijNchYgbhutEiOEjD
         /VVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dB0gWAEfZHKWfkYzrwK4EeStUrUWxM9Hj/xXv+mALOI=;
        b=TUF6jUoqawk4s0kuB5wu7ArYvzG4Jlm38raVp1XNp86dLSA6Ugd8aEMnMihOjSrb+P
         A07dW716urRjzKE4x4tBcyEXG4RVgd6/X+g4QkELho8N71rBD54OuoKHtitLx3ORERDo
         VtlZtRnBbq0yMcKQ7FaXdu3hsShoI+K+y2FKJVFd+mB20c+pmu9yPIhA36ot0bg/Fa/q
         VYTkykF17HglIq6z2coX770ZReQU7so8aGL85zEvt8ROnZLAtJtAHraiFamxEICSEWCC
         0BvacVV7YqcPSS6rDi8WKh63sg0Nu4rV9TkWjUIWSpqsKV0EhDzU/1iNwjbA8yVgPvw7
         JKpQ==
X-Gm-Message-State: AOAM532rIHUJ/dwe0CKinjRCAGXY+vJcwE0Tfd7s6g6LKdz5KsV46AKP
        UwFW6r32tSgfTQsdCdUaQ+fpyDdQv7hrbOEpmWoY6A==
X-Google-Smtp-Source: ABdhPJwncnEGkqPa53glb2cwgGqHNjR8JoKY4ey9u94NBOGSLTlyqhNGXBFQt2Q3v3VffMEnW3Ti9RMoqF56AIEeisY=
X-Received: by 2002:a9d:6249:: with SMTP id i9mr1781965otk.166.1617178290874;
 Wed, 31 Mar 2021 01:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201209094916.17383-1-zong.li@sifive.com> <87v99qyjaz.fsf@igel.home>
 <CANXhq0oLxFK1431WmTj5HRO5k_omYkQZCBTG+HORTk9=W_XyNg@mail.gmail.com>
 <CANXhq0p90Cgha_zLzxamK9mxmVPn3effh_cZq_CTLrcAkKZg2Q@mail.gmail.com>
 <87lfaj7cki.fsf@igel.home> <871rc4on36.fsf@igel.home> <CANXhq0pDge0BPgAjoLrX7Y2qtofb3dhV1_CPHBaCg0o4cEMrbQ@mail.gmail.com>
 <87a6qrk2pw.fsf@igel.home> <CANXhq0rOeAWnRYHAYKJfDeY4kYz6+5mU_dJSqU67+2p9u0STHQ@mail.gmail.com>
 <874kgyfetu.fsf@igel.home> <CANXhq0rE-ZcPBp02Pvozpk_s-j6NhxHUmso75uz6ji9bejO8gA@mail.gmail.com>
 <87h7kukzy4.fsf@igel.home>
In-Reply-To: <87h7kukzy4.fsf@igel.home>
From:   Zong Li <zong.li@sifive.com>
Date:   Wed, 31 Mar 2021 16:11:20 +0800
Message-ID: <CANXhq0r5_xhFu3W9mUFkp_7BYUVBzvHZE1A6jpBDcL_KwTc1cA@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Pragnesh Patel <pragnesh.patel@openfive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Michael Turquette <mturquette@baylibre.com>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Mar 29, 2021 at 6:37 PM Andreas Schwab <schwab@linux-m68k.org> wrot=
e:
>
> On M=C3=A4r 29 2021, Zong Li wrote:
>
> > Yes, I could get the network problem by using the defconfig you
> > provided, the system hung up when executing 'ifconfig' immediately
> > after installing macb driver module, the network can work by only
> > reverting the commit 732374a0b440d9a79c8412f318a25cd37ba6f4e2. But the
> > network is fine by using the mainline's defconfig, this is a little
> > bit weird, I will check that and try to find the difference.
>
> My guess would be that it is an init dependency problem between the phy
> driver and the clock driver, which causes the clock to be enabled too
> late.
>

I found that the gemgxlpll was disabled immediately by power
management after macb driver install. The mainline's defconfig doesn't
enable CONFIG_PM, so the network is fine on it. The opensuse defconfig
enables CONFIG_PM, and the patch
732374a0b440d9a79c8412f318a25cd37ba6f4e2 added the enable/disable
callback functions, so the gemgxlpll PLL, I have no idea why power
management disable it, I would keep trace it.

By the way, I tried to disable CONFIG_PM on oenpsuse defconfig, the
system didn't hang anymore, on the contrary, I enable CONFIG_PM on
mainline's defconfig, I expect that the system would hang up as well,
unfortunately, I cannot boot successfully by just enabling CONFIG_PM
easily.


> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint =3D 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC=
1
> "And now for something completely different."
