Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DCAC433FE
	for <linux-clk@archiver.kernel.org>; Sat,  1 Oct 2022 10:40:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiJAKkP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 1 Oct 2022 06:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiJAKkL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 1 Oct 2022 06:40:11 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A08CE19031
        for <linux-clk@vger.kernel.org>; Sat,  1 Oct 2022 03:40:06 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id A489F5C0189;
        Sat,  1 Oct 2022 06:40:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sat, 01 Oct 2022 06:40:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1664620803; x=
        1664707203; bh=b/+Ttgoaang+cJhHV5IX3sd+XwgOFB5wO7nsllJd+kQ=; b=b
        vfSxuhVzgjkSf4TqamudQc+iFtYwFoyYLs3ZbIGaq4O9PnsbowGKM72cyYGnwqAp
        NYhxxdGi/XY8XQEXlvT8auTuycJ1E7JbvOzFX+brmSZb5M9Gq7e30QgixWQbOchJ
        FeEeKjBxit8P5Ul9E0miak/mEBAlMpHP27FMCrsx3H4vLFXU1GDQMtTetcXjGdVN
        ZrsinqnZtnCnmR6Eqi0+2SZ3vsK33wpXGlXRIdmeX6suBGGq9e8DNsxxBri8UWKG
        Qh+ou+mNrX0c8YlCTcQWvOJ7DdB7NkRw+PqFsRGe4pYPviYTDKaB0OiI2oMCmPs2
        NeDn+PE93zvKd1v6dkuLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664620803; x=
        1664707203; bh=b/+Ttgoaang+cJhHV5IX3sd+XwgOFB5wO7nsllJd+kQ=; b=G
        gOmEqYmC2hfiDfCuRCAFyR1ni6Y9BMmlsvvWQ74CJRyOWh4qbeYSGRWAoJOMR2x/
        1R1N/3psvIaOFoXwyKB3bI2lfo6NtL463K4/V0SOalwzelFBRxEMIRry33yhA43c
        jGtlgGSeVnRMdSqaXZ+ZT4tj1+y7MaKI3T9g2+LyJyctXbypJsei2snr3CB2UHcl
        VKeeLZy5lxMl449VktUDovRja9+zk5NPbArO/ve3bKjKUz1AgFdY0j/Nh2pc2zQL
        yUPWnUQYFcQnw2F0cBnyLt5j4cKfd++aKbevheFisbxTzCtvXazA7N2nTcSImuIk
        iRfYgB2XrAy8Y4L1tx/zQ==
X-ME-Sender: <xms:Axk4Y6U97VMFgCpl7SPF3YSZxJ28kQFAfZ7sOWZc79X0-DTU31pQ4A>
    <xme:Axk4Y2mZdxMg3K1zYy-IL8LqoTyWpZROa7iDUAjy1IY-38THWajfxFgbCXJvlZHDI
    E4jgDel-G2h8UfDGXA>
X-ME-Received: <xmr:Axk4Y-b_7C83jgEbIOh5EgwCwPqGxPQpvtGs7ukYNU1X2wRGdMqRKYQuAi-j>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehgedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddunecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepjeevffdtheevvdefveffffejkedtgfekvdeigfefhfefgfethfejjeei
    geeiueegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
    tghh
X-ME-Proxy: <xmx:Axk4YxUFvfbExITT6x3Qa0iiwpOun7WzJnx23fv8hBbDx7avgjjo6g>
    <xmx:Axk4Y0nMqwJ_6O-qxp7KzwSwVIvhMCzuVuc8JSZI3ZxyVXc9rWwO-g>
    <xmx:Axk4Y2ct4p5pIIkQHm-L5IEvZxyRon51huiUqIgzACK0Fn4UYMlaJg>
    <xmx:Axk4Y_9KhmqMQapnXJrxLNLwVeCLj91b9Aw8uYDquGQZ00m2CmF1Gw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 1 Oct 2022 06:40:02 -0400 (EDT)
Date:   Sat, 1 Oct 2022 12:40:01 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Quanyang Wang <quanyang.wang@windriver.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Michal Simek <michal.simek@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>
Subject: Re: [PATCH] clk: zynqmp: pll: Fix divider calculation to avoid
 out-of-range rate
Message-ID: <20221001104001.r7r2utwymm32tv53@houat>
References: <20220928201656.30318-1-laurent.pinchart@ideasonboard.com>
 <11481209-7c8f-7543-1e04-5723ffc2ccd4@windriver.com>
 <20221001000503.23268C433D6@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221001000503.23268C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi

On Fri, Sep 30, 2022 at 05:05:01PM -0700, Stephen Boyd wrote:
> +Maxime
>=20
> Quoting Quanyang Wang (2022-09-28 18:05:10)
> > Hi Laurent,
> >=20
> > I have sent a patch as below to fix this issue which set rate failed an=
d=20
> > it's in linux-next repo now.
> >=20
> > https://lore.kernel.org/linux-arm-kernel/20220826142030.213805-1-quanya=
ng.wang@windriver.com/T/
> >=20

It looks to me that the fundamental issue is that, in some situations,
the round_rate implementation can return a rate outside of the
boundaries enforced on a clock.

I think that's the current behaviour (that was there prior to my
patches) to reject any rate outside of the boundaries in
clk_calc_new_rates() makes it clear that it's not something we should
allow.

I'm a bit two-minded on this though. All the failures of that test I've
seen actually turned out to be bugs, so I guess it's useful, but it's
also true that for rounding errors it's a bit overkill. We could also
relax that check and warn instead of failing.

> > As for the frequency gap between the requested rate and the actual, it'=
s=20
> > because of the commit:
> >=20
> > commit 948fb0969eae8
> > Author: Maxime Ripard <maxime@cerno.tech>
> > Date:=A0=A0 Fri Feb 25 15:35:26 2022 +0100
> >=20
> >  =A0=A0=A0 clk: Always clamp the rounded rate
> >=20
> > And I haven't figured out how to fix it.

Again, it boils down on whether or not we should allow a rate outside of
boundaries. If we don't and if the clock can't do better, then yeah, the
rate difference is fairly big but we can't do better.

> Maxime has some more patches to fix this and they're in linux-next.
> Maybe those fix this problem?

I don't think they will fix it. However, depending on the outcome of
that discussion I can send more fixes your way :)

Maxime
