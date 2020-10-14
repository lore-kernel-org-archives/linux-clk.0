Return-Path: <SRS0=klTJ=DV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA66C433E7
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 17:16:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F176922200
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 17:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602695776;
	bh=GPUXWxygTTFK2yO2zrP4ocnR/PLfIqfLY8RH+LbjyTU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=lO3PPPV/jNRcxdXjspNr91F0uwyqYuycf8bIX0xrR/cmoN8F/aTIg9HX2osvRxOGw
	 HLHXRjRg2bLmo090F0QoGTopqAnFY7z/Xw22wczYeBPqVc4l0lIM2HTCeQHGW1B3Ld
	 Rsw0/O9sRm4L0mGBfQbS9OzPrvCCWYqu61MWR2uc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbgJNRQP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Oct 2020 13:16:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:48952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727162AbgJNRQP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Oct 2020 13:16:15 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 94F332173E;
        Wed, 14 Oct 2020 17:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602695774;
        bh=GPUXWxygTTFK2yO2zrP4ocnR/PLfIqfLY8RH+LbjyTU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jI4/ayXD7kygEXy/J2VfN+TNA01XyTmvWho35XqQRwkmDmI0Z0RyH4uJT4RUfPu//
         Fvmno32y1rerarRfrD+M2Qd8qG7+b1xjPG7q7e7rYIMeQHtFqQI+LgiPvlE6pgFU3B
         aNnfPaK7GdIarcDiCUctU/0IJU7aWxDbZu5ChYsE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CACPK8Xe-_hTey7hTJjG2-EcDsTN0qOw3bWBcrZZohEK3QOJuvg@mail.gmail.com>
References: <20200928070108.14040-1-ryan_chen@aspeedtech.com> <20200928070108.14040-2-ryan_chen@aspeedtech.com> <160264382296.310579.9835482254268204873@swboyd.mtv.corp.google.com> <CACPK8Xe-_hTey7hTJjG2-EcDsTN0qOw3bWBcrZZohEK3QOJuvg@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: aspeed: modify some default clks are critical
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        BMC-SW <bmc-sw@aspeedtech.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To:     Joel Stanley <joel@jms.id.au>
Date:   Wed, 14 Oct 2020 10:16:13 -0700
Message-ID: <160269577311.884498.8429245140509326318@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Joel Stanley (2020-10-13 22:28:00)
> On Wed, 14 Oct 2020 at 02:50, Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Ryan Chen (2020-09-28 00:01:08)
> > > In ASPEED SoC LCLK is LPC clock for all SuperIO device, UART1/UART2 a=
re
> > > default for Host SuperIO UART device, eSPI clk for Host eSPI bus acce=
ss
> > > eSPI slave channel, those clks can't be disable should keep default,
> > > otherwise will affect Host side access SuperIO and SPI slave device.
> > >
> > > Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> > > ---
> >
> > Is there resolution on this thread?
>=20
> Not yet.
>=20
> We have a system where the BMC (management controller) controls some
> clocks, but the peripherals that it's clocking are outside the BMC's
> control. In this case, the host processor us using some UARTs and what
> not independent of any code running on the BMC.
>=20
> Ryan wants to have them marked as critical so the BMC never powers them d=
own.
>=20
> However, there are systems that don't use this part of the soc, so for
> those implementations they are not critical and Linux on the BMC can
> turn them off.
>=20
> Do you have any thoughts? Has anyone solved a similar problem already?
>=20

Is this critical clocks in DT? Where we want to have different DT for
different device configurations to indicate that some clks should be
marked critical so they're never turned off and other times they aren't
so they're turned off?

It also sounds sort of like the protected-clocks binding. Where you
don't want to touch certain clks depending on the usage configuration of
the SoC. There is a patch to make that generic that I haven't applied
because it looks wrong at first glance[1]. Maybe not registering those
clks to the framework on the configuration that Ryan has is good enough?

[1] https://lore.kernel.org/r/20200903040015.5627-2-samuel@sholland.org
