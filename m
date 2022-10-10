Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D743CC433FE
	for <linux-clk@archiver.kernel.org>; Mon, 10 Oct 2022 15:40:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbiJJPkq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Oct 2022 11:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbiJJPkl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Oct 2022 11:40:41 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77A7154664
        for <linux-clk@vger.kernel.org>; Mon, 10 Oct 2022 08:40:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id A128BCE10D7
        for <linux-clk@vger.kernel.org>; Mon, 10 Oct 2022 15:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A231C433C1;
        Mon, 10 Oct 2022 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665416436;
        bh=u81HyZi81ObKBDqZ7yaeKaqvbUgBi3fhElyhdvpLRPQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oGl8MHulktg/+c1soT4EDA076cciFI4SFZy51EIBm8hjq+AJvc46iRDz7RhK9U1QZ
         OB8zXPvPqaqWvJ8SDV6fZha+jNV+9D/XUUSWDSIg89FDPDOOr5RmGM2FumwkYhDjeN
         Q8F9kxI7oyTtbMz/vtymfw3zplHyFi+cs9fD7GFo6oui9xT2xidhhNX9YbiFyeeekd
         dh6udjILxylzzzUtLki7FOu6GluIv1RwslaVpwJZviZVyuOti9hlBY6VLS2FCa3d7m
         vmH8ZJZaZ2p3hhPhnGx19qBuz4TW5CHZv+7x4jP2+hbcJOo2azGrRnHOVxSNLPEH5q
         sTP4MD/Imw4sw==
Date:   Mon, 10 Oct 2022 16:40:30 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        kernelci-results@groups.io, bot@kernelci.org,
        gtucker@collabora.com,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux Kernel Functional Testing <lkft@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: next/master bisection: baseline.login on rk3328-rock64
Message-ID: <Y0Q87tddypPtzZB3@sirena.org.uk>
References: <634095b3.a70a0220.ad568.42a8@mx.google.com>
 <Y0QNSx+ZgqKSvPOC@sirena.org.uk>
 <20221010145010.ibodo56smlokfouu@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3kVr78dl4QxJzwCb"
Content-Disposition: inline
In-Reply-To: <20221010145010.ibodo56smlokfouu@houat>
X-Cookie: This sentence no verb.
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--3kVr78dl4QxJzwCb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2022 at 04:50:10PM +0200, Maxime Ripard wrote:
> On Mon, Oct 10, 2022 at 01:17:15PM +0100, Mark Brown wrote:
> > On Fri, Oct 07, 2022 at 02:10:11PM -0700, KernelCI bot wrote:

> > The KernelCI bisection bot found a boot problem on today's -next=20
> > on rk3328-rock64 with a defconfig plus debug fragments triggered by
> > cb1b1dd96241f ("clk: Set req_rate on reparenting").  The log doesn't

> Thanks for the report

> It might be related to https://lore.kernel.org/linux-clk/0acc7217-762c-7c=
0d-45a0-55c384824ce4@samsung.com/

> I've sent a series that might address this issue:

> https://lore.kernel.org/linux-clk/20221010-rpi-clk-fixes-again-v1-0-d87ba=
82ac404@cerno.tech/

> Let me know if it fixes things for you

Unfortunately I can't schedule tests directly, the board is in the
Baylibre lab so I've CCed Corentan and Kevin who might be able to help.
You should be able to see results via KernelCI for any tree that's
included and runs the debug builds (including -next).

--3kVr78dl4QxJzwCb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNEPO4ACgkQJNaLcl1U
h9BOeQf5ATCyLzcvuAj6Ca7y5rmsO40P/SQUBKysLkjHYyRS0ZGs34pACiSVMu4F
2mxZMh3v0mi/ffxLRu9ElwU0k4vjK1ZILNmMRz7+a7ypIprU7B0difvH/s+LEcM+
O/lxuNk0ABodoOk355QqFOfiXv/f9UtXbKFHxgtF7DZWkBNaHS2uVPHNI2/QYizj
/jhuohwgLF47FEM+QoXpUdCKQtixRnIeOlzIDUzRjx/4gXbUmMgx2nWs2rESz0fx
34OERFcf5nkrYFjKtELUfDnvtRqSXjg/7Lpb6OJgsqfYiRMamUVI7z2ilkZHbTVC
G4y13Pi+Pu2eEf80oZfsv1xK+PoRvg==
=vkd8
-----END PGP SIGNATURE-----

--3kVr78dl4QxJzwCb--
