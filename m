Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C312EC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 24 Feb 2022 22:30:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232868AbiBXWbX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Feb 2022 17:31:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232184AbiBXWbX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Feb 2022 17:31:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED66249F00
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 14:30:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9EC49B829D3
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 22:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243A5C340E9;
        Thu, 24 Feb 2022 22:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645741850;
        bh=4QkG0AaRxMosVfJXxDTZvlsV/0gw0ZugrI9o5IjzLP8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=t9GFYfjKD7qzd0aPafe6MZszJCahUnHqNsLrEtKdzz4+1+WRfnxN7/keOyvTkqKtK
         8CYq8UW94SVk29dj6wA5wSZSOiR0XNlADGOAyBfk+gGHv1dDg1xnwWhm7sRbV4d6Xv
         6zMLzz/bgFv2Xd5v98NDSP+ci/SaV73vrvB/E9M9DX1aUDJD5zJt0BanNSQb1yZMZ6
         nW4GpckGkGa0RacB5ZfV3L4AktsGAOjoTMjIW7ax0RkbkGXPw697AgKUtFt8g8ekos
         lBagiooRW0FTxdDM5VvckOZiomXiZ9oeyOsf7xenBWieqUwel2nbxVEa1xF0XXp00b
         Mx+7giie3nrYw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220221151259.xoiyvafhkfpq5zlt@houat>
References: <20220125141549.747889-1-maxime@cerno.tech> <20220125141549.747889-2-maxime@cerno.tech> <20220219022048.19E1BC340E9@smtp.kernel.org> <20220221151259.xoiyvafhkfpq5zlt@houat>
Subject: Re: [PATCH v4 01/10] clk: Introduce Kunit Tests for the framework
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>, kunit-dev@googlegroups.com
To:     Maxime Ripard <maxime@cerno.tech>
Date:   Thu, 24 Feb 2022 14:30:48 -0800
User-Agent: alot/0.10
Message-Id: <20220224223050.243A5C340E9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-02-21 07:12:59)
> Hi Stephen,
>=20
> Thanks for your review
>=20
> On Fri, Feb 18, 2022 at 06:20:46PM -0800, Stephen Boyd wrote:
> > It would also be good to add a test that tries to set the clk rate with
> > clk_set_rate() after a range has been set that is outside the acceptable
> > range and verify that it fails, and one that tries to set it within the
> > range and make sure it succeeds (and changes it to be exactly what was
> > set).
>=20
> Do we expect it to fail though?
>=20
> If we do:
>=20
> clk_set_range_range(clk, 1000, 2000);
> clk_set_rate(3000);
>=20
> The current behaviour is that the rate is going to be rounded to 2000,
> but it doesn't fail.
>=20
> Or is it what you meant by fail? ie, that the return code is 0, but the
> rate isn't what we asked for?

Yeah sorry for not being clear. I meant that it would be constrained to
the range from before.

>=20
> > We want to test the failure paths as well, to make sure we don't start
> > causing them to pass, unless it's expected.
>=20
> Do you have any other failure condition you want to test? I already
> tried to come up with those I could think of, but I clearly missed some
> if you said that :)

Not really! :)
