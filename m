Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A95C433E0
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 01:08:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B17364F96
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 01:08:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbhCQBH4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Mar 2021 21:07:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:49508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232374AbhCQBGm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Mar 2021 21:06:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46A0964EFC;
        Wed, 17 Mar 2021 01:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615943202;
        bh=etM6EonOQ37rooBRvfkW08PwTfwbsMEucMYsLYsb6ro=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RC+JJ7wV3hCa2TZIbGKAwIGF5N2+2ir1/MgU6Hw9GVXkvF0fZEB+mvgpMULsGPOg1
         a81so27BuA2Y4cuqwQ/wm2pjbNHp7Hmuxoxdks/IKoG+rU9MxOBEK8yO97GBuvKKBO
         47pT0sknrQUs6FCiQLuI58ylgkJUXhiieYLqZsv+zaavuyngMu/L10uCSdyQvnTpbP
         R505CpJKh1DEiplMQX9xIPaePR0y1m0JyndnxfUI9Hu9HRrgt/hlNEW1OfaXmKGpTR
         m1G6BPLz6jlWsUkNS6GrSUgmvwIQ0gMpB9TxC7+2oZdg1DPfvYTHotqUoZ8rgKKVJL
         K7xANRuJpFCZg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210303084527.rziaoiqsr7r4bhcv@gilmour>
References: <20210225155909.1853812-1-maxime@cerno.tech> <20210225155909.1853812-2-maxime@cerno.tech> <161472713858.1478170.9594904338107431350@swboyd.mtv.corp.google.com> <20210303084527.rziaoiqsr7r4bhcv@gilmour>
Subject: Re: [PATCH 1/8] clk: Add range accessors
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
        Phil Elwell <phil@raspberrypi.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Tim Gover <tim.gover@raspberrypi.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
To:     Maxime Ripard <maxime@cerno.tech>
Date:   Tue, 16 Mar 2021 18:06:40 -0700
Message-ID: <161594320095.1478170.16988206902476583714@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2021-03-03 00:45:27)
> Hi Stephen,
>=20
> On Tue, Mar 02, 2021 at 03:18:58PM -0800, Stephen Boyd wrote:
> > Quoting Maxime Ripard (2021-02-25 07:59:02)
> > > Some devices might need to access the current available range of a cl=
ock
> > > to discover their capabilities. Let's add those accessors.
> >=20
> > This needs more than two sentences to describe what's required.
> >=20
> > >=20
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  drivers/clk/clk.c   | 30 ++++++++++++++++++++++++++++++
> > >  include/linux/clk.h | 16 ++++++++++++++++
> > >  2 files changed, 46 insertions(+)
> > >=20
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 8c1d04db990d..b7307d4f090d 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -2407,6 +2407,36 @@ int clk_set_max_rate(struct clk *clk, unsigned=
 long rate)
> > >  }
> > >  EXPORT_SYMBOL_GPL(clk_set_max_rate);
> > > =20
> > > +long clk_get_min_rate(struct clk *clk)
> >=20
> > I need to read the rest of the patches but I don't see the justification
> > for this sort of API vs. having the consumer constrain the clk frequency
> > that it wants. Is the code that's setting the min/max constraints not
> > the same as the code that's calling this API? Would an OPP table better
> > serve this so the device knows what frequencies are valid?s Please
> > provide the use case/justification in the commit text.
>=20
> The patch that uses it is the patch 4
>=20
> The issue I'm trying to solve is that all the RaspberryPi have a
> configuration file for the firmware, and the firmware is in charge of
> the clocks communicating through a mailbox interface.
>=20
> By default, one of the main clocks in the system can only reach 500MHz,
> and that's the range reported by the firmware when queried. However, in
> order to support display modes with a fairly high bandwidth such as 4k
> at 60Hz, that clock needs to be raised to at least 550MHz, and the
> firmware configuration has a special parameter for that one. Setting
> that parameter will increase the range of the clock to have proper
> boundaries for that display mode.
>=20
> If a user doesn't enable it and tries to use those display modes, the
> display will be completely blank.
>=20
> There's no way to query the firmware configuration directly, so we can
> instead query the range of the clock and see if the firmware enables us
> to use those modes, warn the user and ignore the modes that wouldn't
> work. That's what those accessors are here for

How does the clk driver query the firmware but it can't be done
directly by the drm driver?=20

>=20
> > Why two functions instead of one function to get both min and max?
>=20
> Since we have clk_set_min_rate and clk_set_max_rate, it made sense to me
> to mirror that, but I'd be happy to change if you think otherwise
>=20

Does using clk_round_rate() work just as well?
