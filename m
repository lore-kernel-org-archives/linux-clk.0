Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27419C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 24 Feb 2022 22:44:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235424AbiBXWo4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Feb 2022 17:44:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233083AbiBXWoz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Feb 2022 17:44:55 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9218429DD63
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 14:44:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 48811B829DA
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 22:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9F5C340E9;
        Thu, 24 Feb 2022 22:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645742662;
        bh=B/pu4UvmtEiJpC/lplC4L+U3yPJWpzR28r3SzwFzf7U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LMiys3Nqw1YwjzE9EnFjtUaoznubelzLA1fiQokFi21vjHZ5bTN098fYCIt1OVqfi
         ToQZa7ezwApC648kYlBvlT6NaP0B660lBlzHXFNr4oshdLVDYSuu0FNlHVnTz+5dz5
         1Z2QPdWaZJhQWKrFSuDUdowRP/3i8ajfhBbOC7YoDdPOLIWP/W4WdtmW0aSdEIMyqI
         Jv0XuDGSK6V8BWcEzDzeelwSwcW/K0y8rGCihptyPrKFQgBtZTkwovFWceLl8d0nnE
         fGorn749YxyiK5PbWNZNYBNo8Zq9BsjbPKMZtjXK7aWP+T/vxlfWPf+sKTqN7/ZC3C
         /oDJ3mEjQcFdw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220221163001.k4nstaxtbmlxgz3j@houat>
References: <20220125141549.747889-1-maxime@cerno.tech> <20220125141549.747889-4-maxime@cerno.tech> <20220218223422.4FA9DC340E9@smtp.kernel.org> <20220221163001.k4nstaxtbmlxgz3j@houat>
Subject: Re: [PATCH v4 03/10] clk: Use clamp instead of open-coding our own
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>
To:     Maxime Ripard <maxime@cerno.tech>
Date:   Thu, 24 Feb 2022 14:44:20 -0800
User-Agent: alot/0.10
Message-Id: <20220224224422.DA9F5C340E9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-02-21 08:30:01)
> On Fri, Feb 18, 2022 at 02:34:20PM -0800, Stephen Boyd wrote:
> > Quoting Maxime Ripard (2022-01-25 06:15:42)
> > > The code in clk_set_rate_range() will, if the current rate is outside=
 of
> > > the new range, will force it to the minimum or maximum. This is
> > > equivalent to using clamp, while being less readable. Let's switch to
> > > using clamp instead.
> > >=20
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  drivers/clk/clk.c | 6 +-----
> > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 7bb5ae0fb688..150d1bc0985b 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -2365,11 +2365,7 @@ int clk_set_rate_range(struct clk *clk, unsign=
ed long min, unsigned long max)
> > >                  *   this corner case when determining the rate
> > >                  */
> > > =20
> > > -               if (rate < min)
> > > -                       rate =3D min;
> > > -               else
> > > -                       rate =3D max;
> > > -
> > > +               rate =3D clamp(clk->core->req_rate, min, max);
> >=20
> > This isn't equivalent. The else arm is taken if rate >=3D min and rate =
is
> > set to max, whereas clamp() will leave the rate unchanged if rate >=3D =
min
> > && rate < max.
>=20
> This can't happen, since we're in an if block that is (rate < min ||
> rate > max), so at this point if rate is not less than min, it is
> greater than rate. Thus, it's equivalent to clamp.
>=20
> Still, the commit message could be better, I'll rephrase it.

Perfect! Should probably add a comment above the clamp as well just in
case someone decides to move it out of that if block.
