Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D153EC433F5
	for <linux-clk@archiver.kernel.org>; Sat, 22 Jan 2022 01:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbiAVBve (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Jan 2022 20:51:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231830AbiAVBvd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Jan 2022 20:51:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40195C06173B
        for <linux-clk@vger.kernel.org>; Fri, 21 Jan 2022 17:51:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D3200B820D4
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE5CC340E1;
        Sat, 22 Jan 2022 01:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642816288;
        bh=dwqSmHbgQBbdmi7kXp2atdyOFk+xExYfoELE799mcYU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MCPDaSOV7Cd7TZjUNR8+vw/y5a4+m5JcRc5F11dgo/ngYoiKjm/IAqW2HBp0KLYH6
         xCDRgIsFdAs1fLelnHO2PBIXpP46VLF3lGsItrppkBEp3FypMlGP096tetHuN8qsek
         pzp818rl1sJKkxwFqeRVk/lDweMsmPaY/ZDjlWfH+CVwnmCByLiLaRfhPBvLjZt8Mv
         N9ZlKNyooGvJKx58Jwcl861MH3CbUwKcZsXZNZ42iTlEGRdSWRvjoSFEw0ZSLriszD
         hg8tZANVfZgB0RLUgsggVCKmJHwPhGT4POkzOTB5Sha57uytuHUts/gq2nXhY4Eqj1
         3TnXO5JLApBzQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAGS_qxpHuN5nyn8V7LGeZ1VTzboCgDwrz=p3TFPi73tZ0pWOBQ@mail.gmail.com>
References: <20220120143417.543744-1-maxime@cerno.tech> <20220120143417.543744-2-maxime@cerno.tech> <20220120213118.40F0AC340E3@smtp.kernel.org> <CAGS_qxq9qFjx+Su_E5sQF5tsgPCyhzGMFEMZbVqPN=N6U+s+9g@mail.gmail.com> <20220121043408.6C186C340E1@smtp.kernel.org> <CAGS_qxpHuN5nyn8V7LGeZ1VTzboCgDwrz=p3TFPi73tZ0pWOBQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] clk: Add Kunit tests for rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>, kunit-dev@googlegroups.com
To:     Daniel Latypov <dlatypov@google.com>
Date:   Fri, 21 Jan 2022 17:51:26 -0800
User-Agent: alot/0.10
Message-Id: <20220122015128.6AE5CC340E1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Latypov (2022-01-20 21:25:03)
> On Thu, Jan 20, 2022 at 8:34 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Daniel Latypov (2022-01-20 13:56:39)
> > > On Thu, Jan 20, 2022 at 1:31 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > KUnit doesn't have hard technical limitations in this regard.
> > >
> > > You could have something like this
> > >
> > > static void my_optional_kunit_test(struct kunit *test)
> > > {
> > > #ifdef CONFIG_OPTIONAL_FEATURE
> > >
> > > # else
> > >   kunit_skip(test, "CONFIG_OPTIONAL_FEATURE is not enabled");
> > > #endif
> > > }
> > >
> > > I think it's just a matter of what's least confusing to users.
> >
> > Ok, I see. Is there some way to have multiple configs checked into the
> > tree so we can test different kernel configuration code paths? This
>=20
> Multiple kunitconfigs?
> There's no restrictions on those
>=20
> $ ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/clk
> $ ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/clk/kunitcon=
fig.foo
> $ ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/clk/kunitcon=
fig.bar
>=20
> The first one will assume drivers/clk/.kunitconfig.
> But there's no reason you need to have a file called that.
> One could just have multiple standalone kunitconfigs, named however they =
like.
>=20
> --kunitconfig is new enough (5.12+) that there's no real conventions yet.
>=20
> Another option is
> $ ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/clk \
>    --kconfig_add=3DCONFIG_RARELY_USED=3Dy
>=20
> This is another case where we can do whatever is least confusing.

Got it, thanks.

>=20
> > discussion isn't really relevant to this patch so we can take this up in
> > another thread if you like.
> >
> > >
> > > >
> > > > Maybe kunit should check that there was an EXPECT on return from the
> > > > test. Daniel?
> > >
> > > Sorry, I'm not sure I understand the question.
> > >
> > > Are you saying you want kunit to flag cases like
> > >   static void empty_test(struct kunit *) {}
> > > ?
> >
> > Yes. I'd like kunit to enforce that all tests have at least one
> > EXPECT_*() in them.
>=20
> I totally understand the rationale.
> It's a bit misleading to say PASSED if no expectation/assertion passed.
> One might want a NO_STATUS (or maybe SKIPPED) result instead.
>=20
> But other unit test frameworks act the way KUnit does here, so there's
> an argument for consistency with others so users don't have to have a
> whole new mental model.

Ok if other test frameworks don't care then there's nothing to do.
