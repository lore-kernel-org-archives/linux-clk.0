Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EF0C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 23 Apr 2022 07:50:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232732AbiDWHwz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Apr 2022 03:52:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbiDWHwy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Apr 2022 03:52:54 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC2F11A23
        for <linux-clk@vger.kernel.org>; Sat, 23 Apr 2022 00:49:57 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id F1A8B3200E18;
        Sat, 23 Apr 2022 03:49:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 23 Apr 2022 03:49:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1650700195; x=
        1650786595; bh=RQsrgMNJZbk1zySuTjzEuD13WkW46FIxt4e2qfCMsA4=; b=g
        R7WJ/zdP3UUFrfMxwfhhD8sBVE5+kvUJ9oHn0nXH8WV97qgsnekBI+9mLKrPXDuW
        rPYQ7o5nGzreN/g9NdAMHoSAKO1fkWl+tFmGQhlGYf5/lMoRB7P3L2zCzoQthVHH
        7Rhne2ZyHfdy5hN5ht3kGkaR6LJCuvq6ujG5KhOti3z5/L7VC3eukoe/eg0nz7m7
        h3rtga00zLTH72GSZSEp/njl8mqPtl79bF3laRQEhOctAeTwtdO+nAoStcvY+NZo
        lJx3fKpqEmIWGpeEVY2cGOvxF3MUhYx8h2acLVl/livGH5ZorcFDx7aNUbnoUhez
        yVLqtSiBPBdHqGFcte/pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1650700195; x=1650786595; bh=RQsrgMNJZbk1z
        ySuTjzEuD13WkW46FIxt4e2qfCMsA4=; b=mKklID96sPDxH9gOBTuRAbaqGGV4C
        ttC6tOd+SW2nZ7KneMiSNg0XMo8ywGeiNL47yZuca02bbRwB2xtD/Up4rw1of/xZ
        Fz5wTMxOsCrYKrjIDRAkfbMzvEcD50PqqEabUN9WGrKpBhbzQdxlV1rO6OFngluM
        a5fwJsT1B6C09K2UWdiQ5VMIPXxQ0d9ApZ+kg1M5FJduv5AGCCJusB4jWy0FXso+
        jYEYpeuZfBZMJjMcZL6eL99sZFevvJy3Xwvs3q4eKO7AZKzhc/E/oOeCbnQJfQW5
        XlfAOk5BY3sV1sPP5Q9wJrp8kVYy7UbBy+InlWiOaZ4F0bctB9vGiD3AQ==
X-ME-Sender: <xms:oq9jYjTOUFCqzYzrNi0ChYRybPCfjtisp47XZg-rlPNuKSNkdMK7Qw>
    <xme:oq9jYkygkEOYEbSZ4KnHAKweHqI1g6QV8PVKvlWQ20HiLDnaM_TiGI_gFHaSDpu53
    t1_WVYoMmSwyWbfprc>
X-ME-Received: <xmr:oq9jYo3gCFo1k91xn0u_4cLwkUxZz_8vpj5VtU6uvLr8ELzWl4XSf_DW1OauzaGjPNWBp7cVFqk7lGvK417kg1-7DzOMeU9LV_JX9Fg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdehgdduvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnheptefgleeggfegkeekgffgleduieduffejffegveevkeejudektdduueet
    feetfefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:oq9jYjC2ZdxGsYc_G1XJAEIp3uY9a6Fdi1kC1tlgsJAOOjjphRM8MA>
    <xmx:oq9jYsh2gQkmD-KjP8tUgfrhctuqDz6Wysrn7qlgg6vab9w58TMQ_Q>
    <xmx:oq9jYnrfHc55HfZTFoQZbjI65ZVSz8R4qdCboucZVjjvKPYCmpjlJA>
    <xmx:o69jYlUGlcVNviUKmLvCmaN5tWDtqQajSN2ULTiMqZF2keuGUmeheg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 23 Apr 2022 03:49:53 -0400 (EDT)
Date:   Sat, 23 Apr 2022 09:49:51 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 22/22] clk: Prevent a clock without a rate to register
Message-ID: <20220423074951.xlzpg4n26qjjdjvc@houat>
References: <20220408091037.2041955-1-maxime@cerno.tech>
 <20220408091037.2041955-23-maxime@cerno.tech>
 <20220423041235.3F8A2C385A0@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220423041235.3F8A2C385A0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Apr 22, 2022 at 09:12:33PM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-04-08 02:10:37)
> > A rate of 0 for a clock is considered an error, as evidenced by the
> > documentation of clk_get_rate() and the code of clk_get_rate() and
> > clk_core_get_rate_nolock().
> >=20
> > The main source of that error is if the clock is supposed to have a
> > parent but is orphan at the moment of the call. This is likely to be
> > transient and solved later in the life of the system as more clocks are
> > registered.
> >=20
> > The corollary is thus that if a clock is not an orphan, has a parent th=
at
> > has a rate (so is not an orphan itself either) but returns a rate of 0,
> > something is wrong in the driver. Let's return an error in such a case.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/clk/clk.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >=20
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 8bbb6adeeead..e8c55678da85 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -3773,6 +3773,16 @@ static int __clk_core_init(struct clk_core *core)
> >                 rate =3D 0;
> >         core->rate =3D core->req_rate =3D rate;
> > =20
> > +       /*
> > +        * If we're not an orphan clock and our parent has a rate, then
> > +        * if our rate is 0, something is badly broken in recalc_rate.
> > +        */
> > +       if (!core->orphan && (parent && parent->rate) && !core->rate) {
>=20
> It's possible that it is an orphan at time of registration, so this
> check doesn't even cover the case when it is parented by a later clk
> registration. How would we error out when parenting the clk to the
> parent if recalc_rate then starts returning 0? It doesn't seem possible
> to implement this.

Like I said in my cover letter, this was mostly to spark a discussion :)

Indeed, that case you mentioned wouldn't be covered by this check. I
don't think this patch is reasonable either :)

I mostly wanted to discuss whether you felt like it was something that
was ok or not. If it isn't, I think a good way forward would be to add a
bunch of pr_warn messages to mention that something is fishy and to
clarify the doc.

Hopefully, it will raise both the attention of developers of already
in-tree drivers to fix this, and will prevent new drivers from
introducing more of that behavior.

If the issue persists we could then take stronger measures some time in
the future if needs be?

Maxime
