Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B7D0C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 24 Feb 2022 22:54:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbiBXWy4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Feb 2022 17:54:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbiBXWyz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Feb 2022 17:54:55 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2FF820A94A
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 14:54:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4583861BB9
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 22:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98298C340E9;
        Thu, 24 Feb 2022 22:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645743262;
        bh=J5WUYL6r67hbpOfvtJWsxq4O1SZMxD0DDiqe9fp/yMg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iFcUFWOqakTGjKMf6oz1B978K8zXZIe+/MLjdN8zUZMPknZOrMNuSkXex7WvgZC33
         CTqQEKYFzTCjgDzDgevs/hWZ3aPk1p5ESW3tgGtwjWrEzW2OCac3w/p0e+suX2xPXJ
         /ZMSgrPEkw7LjYIcEOJZXNbESnzBNK5C0VPoft+NoGRx+yu8PrE8GccJZ1xSLogevU
         IrKeOCzbqQqh0s5anewazovCkYr7B0piI/x7JtKNH+e4TWQGkVe+2sfunEFjbIVFP8
         OTRZQF6BbBcyN4dQ2+SKljH0nbcs1xMrKdtXsa76GErT3KUyYcapOUQXs92tOGcvyY
         QZMOJ7KsinqwA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAGS_qxqNU+rGFuALEpmqqmtD+LsTQ4R3_WWL3M70Ar-_af6OnA@mail.gmail.com>
References: <20220223105600.1132593-1-maxime@cerno.tech> <20220223105600.1132593-3-maxime@cerno.tech> <CAGS_qxqNU+rGFuALEpmqqmtD+LsTQ4R3_WWL3M70Ar-_af6OnA@mail.gmail.com>
Subject: Re: [PATCH v6 02/12] clk: Introduce Kunit Tests for the framework
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com
To:     Daniel Latypov <dlatypov@google.com>,
        Maxime Ripard <maxime@cerno.tech>
Date:   Thu, 24 Feb 2022 14:54:20 -0800
User-Agent: alot/0.10
Message-Id: <20220224225422.98298C340E9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Latypov (2022-02-23 14:50:59)
> On Wed, Feb 23, 2022 at 2:56 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Let's test various parts of the rate-related clock API with the kunit
> > testing framework.
> >
> > Cc: kunit-dev@googlegroups.com
> > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Tested-by: Daniel Latypov <dlatypov@google.com>
>=20
> Looks good to me on the KUnit side.
> Two small nits below.
>=20
> FYI, I computed the incremental coverage for this series, i.e.:
> 1) applied the full series
> 2) computed the absolute coverage
>=20
> $  ./tools/testing/kunit/kunit.py run  --kunitconfig=3Ddrivers/clk
> --make_options=3DCC=3D/usr/bin/gcc-6 --kconfig_add=3DCONFIG_DEBUG_KERNEL=
=3Dy
> --kconfig_add=3DCONFIG_DEBUG_INFO=3Dy --kconfig_add=3DCONFIG_GCOV=3Dy
> $ lcov -t "clk_tests" -o coverage.info -c -d .kunit/ --gcov-tool=3D/usr/b=
in/gcov-6

This is cool. Thanks! Is it possible to add some 'coverage' command to
kunit so we don't have to recall this invocation?

>=20
> 3) intersected that with the total diff

This would also be cool to do automatically with a revision range.

>=20
> Incremental coverage for 3/9 files in --diff_file
> Total incremental: 99.29% coverage (281/283 lines)
>   drivers/clk/clk.c: 84.62% coverage (11/13 lines)
>   drivers/clk/clk_test.c: 100.00% coverage (269/269 lines)
>   include/linux/clk.h: 100.00% coverage (1/1 lines)
>=20
> Missing lines are drivers/clk/clk.c:2397-8, i.e. this part of the diff:
> +       if (ret) {
> +               /* rollback the changes */
> +               clk->min_rate =3D old_min; <- 2397
> +               clk->max_rate =3D old_max; <- 2398
>=20
> These are from before and were just moved around.

We could trigger a failure in the provider when the rate is set, and
then we could call round_rate() again and make sure the boundaries from
before are maintained.
