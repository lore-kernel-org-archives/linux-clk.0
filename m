Return-Path: <SRS0=eFQB=QN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56781C282CC
	for <linux-clk@archiver.kernel.org>; Wed,  6 Feb 2019 17:47:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25663218B0
	for <linux-clk@archiver.kernel.org>; Wed,  6 Feb 2019 17:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1549475245;
	bh=lP+mz8DZ9VE4oAEkbTgi0Qy+WA94LwEJeeaejT+fX1M=;
	h=Cc:Subject:In-Reply-To:From:To:References:Date:List-ID:From;
	b=fjcz33XmeLpI+rbeNuJLi1J7Hilp2gNxpqENQih3af207HohNZP/ZpAQZcv7mV2wY
	 M1EjC6/+8GemzbKbwYaNHnWLh6llTG+HYm98dkJzbguhqT3Vxd6GQMM1H5/Ui6EAoV
	 yi2hbLQDZ5Efeq5loJYnllCu8HnP7pgsDWxzugyQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbfBFRrX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Feb 2019 12:47:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:53222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727580AbfBFRrU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 6 Feb 2019 12:47:20 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C08312073D;
        Wed,  6 Feb 2019 17:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1549475239;
        bh=lP+mz8DZ9VE4oAEkbTgi0Qy+WA94LwEJeeaejT+fX1M=;
        h=Cc:Subject:In-Reply-To:From:To:References:Date:From;
        b=HfY+VLVh2ldCo9SPJesH3QSKn944IV4fqHdkKE5AruE53dE1x+Ju1pA3umx24/ccl
         BLRzimKt0nJj/hiGdAj1gsrgtaDmy4l5OICMvIE1RZE9GfHazpJEElj4AbixGuqpPE
         1shBWJnXhQg4hrMo//tSFZo5A5omXZl/u92zqpmA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
User-Agent: alot/0.8
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, ssantosh@kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: ti,sci-clk: Add support for parsing clock info from DT
In-Reply-To: <ab8707fb-e632-5be9-9fdb-4b1fb3cb26ba@ti.com>
From:   Stephen Boyd <sboyd@kernel.org>
Message-ID: <154947523891.74891.8214442349263473281@swboyd.mtv.corp.google.com>
To:     Rob Herring <robh@kernel.org>, Tero Kristo <t-kristo@ti.com>
References: <1546954223-9738-1-git-send-email-t-kristo@ti.com> <1546954223-9738-2-git-send-email-t-kristo@ti.com> <20190121210449.GB7851@bogus> <7ce7bd25-b5c4-f99d-fda6-0f21376f2204@ti.com> <ab8707fb-e632-5be9-9fdb-4b1fb3cb26ba@ti.com>
Date:   Wed, 06 Feb 2019 09:47:18 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2019-02-05 00:25:40)
> On 22/01/2019 09:33, Tero Kristo wrote:
> > On 21/01/2019 23:04, Rob Herring wrote:
> >> At first, I thought this was an either/or thing. Use firmware or use D=
T,
> >> but it is really only get the clocks used in the DT from firmware.
> >>
> >> Why wouldn't you just always do that? I can think of 3 cases:
> >> reparenting, debug and overlays. This breaks reparenting and overlays,
> >> right? Debug could be handled with some userspace trigger to get all t=
he
> >> clocks.
> >=20
> > Re-parenting this does not break, as the scan still checks every=20
> > possible parent of a clock scanned. Overlays are broken for sure, as we=
=20
> > don't know which overlays we would be applying, and what clocks would b=
e=20
> > in them. Debug is kind of broken as we only scan a small portion of the=
=20
> > clocks.
> >=20
> >>
> >> Why scan any of the clocks up front? Why not just create the clocks on
> >> demand? If an unknown clock id is requested, then create the clock and
> >> query the firmware at that point. That would avoid the DT scan too.
> >> Maybe there's some issues in the clk framework preventing that, but
> >> that's not really a DT problem.
> >=20
> > The very initial version I did a couple of years back, did scan the=20
> > clocks based on need, and registered them dynamically. Stephen shot dow=
n=20
> > this based on the assessment that there might be locking issues with th=
e=20
> > common clock framework with this approach leading into potential=20
> > deadlock situations.

It's an interesting idea to limit the scope of clks that are registered
to only the leaf and whatever up to the root of the tree is involved in
the working set of the kernel.

>=20
> So Rob, what is the final call on this binding? Ack/NAK? If NAK, shall I =

> implement a kernel cmdline param to select the parsing method or what is =

> preferred? Doing it build time with a simple Kconfig seems too limiting.
>=20

Is the problem a performance problem where probing the firmware for all
the clks is costly and time intensive? So instead of doing that we're
describing some of the details in DT? Why can't we describe the clk tree
in C code with some data structure that indicates parent child linkages?
This is how every other SoC is doing this so far.

