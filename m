Return-Path: <SRS0=Ati7=SZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B26C10F03
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 22:41:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E9B5218D2
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 22:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556059283;
	bh=bKi7WrcGx1PvKwYuHbZuN/6EOidwoPXiXTADw2fgtvQ=;
	h=In-Reply-To:References:From:Subject:To:Cc:Date:List-ID:From;
	b=PVsYTtYDyX2QriH79u7fCpezsSiaYiRumH7l9M983CfHesWKfcIY45ICFiEUie5Ir
	 Vlw2vE6EMxeNLOkiM3aSJqRnrwqE19yZbqYBPnxO/dOvpVcIa0ydxV//U6htCSj8gj
	 zHuObv+d9VBNOvaG8MB7FuqNWbOWEHZPFWhGM0B4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfDWWlX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Apr 2019 18:41:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:42416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726075AbfDWWlW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 23 Apr 2019 18:41:22 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 60D95218D2;
        Tue, 23 Apr 2019 22:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556059281;
        bh=bKi7WrcGx1PvKwYuHbZuN/6EOidwoPXiXTADw2fgtvQ=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=ezQF19iN4dYSbHy/Zsq+nWiUl6xGtPwsPvSx2DGu1VM5Ns6qefHmAXj27ThFrfbpb
         JPC9jS9ParvweXyCIAKfZWXnf9MGMCt156wo90SSqDFgi3lHpIHvbrWrAy6EgxuPfM
         Ak1pXeOLF1odjSQOdFvWX0z0zb24l1fNIfLiz0dc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <79606818706359d32f34c7eb2523d6557747c262.camel@suse.de>
References: <79606818706359d32f34c7eb2523d6557747c262.camel@suse.de>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: Is exporting __clk_notify() acceptable?
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-clk@vger.kernel.org
Cc:     Eric Anholt <eric@anholt.net>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>
Message-ID: <155605928054.15276.8717660730583010316@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Tue, 23 Apr 2019 15:41:20 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Nicolas Saenz Julienne (2019-04-11 10:43:22)
> Hi,
> I'm working on implementing proper cpufreq support for Raspberry Pi and s=
tumbled
> upon an issue I'd like your opinion on:

You may want to work with Eric. I think Eric has been looking at
Raspberry Pi clk things from what I can recall.

>=20
> - Raspberry Pi's boot and other internal operations are operated by a fir=
mware
>   running in it's VPU/GPU (called Video Core 4).
>=20
> - Even though Raspberry Pi exports it's clock registers, we're unable to =
modify
>   them as we could clash with the firmware. Messing around with clocks be=
hind
>   the firmware's back would potentially void the board's warranty or even=
 break
>   it. So we're stuck using a firmware frequency scaling interface the boa=
rd
>   provides.
>=20
> - Some peripherals depend on VPU's clock (I2C, SPI, UART, ...). This cloc=
k is
>   updated by the firmware interface whenever we scale the frequency.

Ok. Got it.


>=20
> - A solution would be to set all these clocks as non cachable, and alert =
the
>   peripherals through the clock notifier before and after the frequency s=
caling
>   happens. This way they could reprogram their dividers. It would be trig=
gered
>   through a custom cpufreq driver that, with the knowledge of the possibl=
e VPU
>   frequencies, will pre-notify the peripherals, trigger the frequency sca=
ling
>   and post-notify the peripherals. In order to achieve this, I figured I =
need
>   to create an exported version of __clk_notify(), which would trigger
>   notifications both for the provided clock and it's children.
>=20
> In principle, would it be acceptable to export the function? Any alternat=
ives?

I don't think we want to export __clk_notify(). If anything we've been
trying to slowly remove the notifier chains that the clk framework
implements, so exporting it would be going in the wrong direction.

>=20
> Note that cpufreq notifiers are not an option as they provide the CPU clo=
ck
> change rates which are useless to the peripherals. Also note that the
> peripherals need to know the clock rate change in advance.
>=20

How does it work today? Do the peripherals set clk rates under the
assumption that the parent of the clk they're dealing with (I guess VPU
clk?) isn't going to change rate?

If that's right then I see two pitfalls. The first is that we probably
want to maintain the frequency of those child clks when the VPU clk
changes rate. The second is that we should integrate the VPU clk into
the clk framework so that when it changes rate, the new frequency
propagates down to the child clks. It could still use the firmware
interface to change the VPU clk in the clk provider driver. I suppose
cpufreq-dt could be layered on top of the VPU clk too so that it all
just becomes a clk tree management problem.

After that's in place, I recommend that the downstream/child device
drivers using clks that are children of the VPU clk migrate to
clk_rate_exclusive_get() and clk_set_rate_exclusive() APIs. Once all the
child clks are "owning" the rate they want their clks to be at, then we
need to fix the clk framework rate setting code-path to let the parent
VPU clk change rates from CPUfreq and work out how to achieve the
"exclusive", i.e. "locked", rates for the children. If we do that then
we should be in good shape and we can let the VPU clk change rate while
maintaining the child clk rates for devices like UART, i2c, etc.

