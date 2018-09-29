Return-Path: <SRS0=2F0X=ML=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCEEC43143
	for <linux-clk@archiver.kernel.org>; Sat, 29 Sep 2018 15:01:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 38EF22073F
	for <linux-clk@archiver.kernel.org>; Sat, 29 Sep 2018 15:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38EF22073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728197AbeI2VaP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 29 Sep 2018 17:30:15 -0400
Received: from mail.bootlin.com ([62.4.15.54]:55287 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728242AbeI2VaP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 29 Sep 2018 17:30:15 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 451772075C; Sat, 29 Sep 2018 17:01:27 +0200 (CEST)
Received: from localhost (unknown [212.145.226.70])
        by mail.bootlin.com (Postfix) with ESMTPSA id 065D8203DA;
        Sat, 29 Sep 2018 17:01:26 +0200 (CEST)
Date:   Sat, 29 Sep 2018 17:01:27 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock changes for 4.20
Message-ID: <20180929150127.aky3bijls3ncyunt@flea>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="emsbbyebnlbred5r"
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--emsbbyebnlbred5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Here are our usual set of changes for the next merge window.

Thanks!
Maxime

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-clk-for-4.20

for you to fetch changes up to 8b2a37870419f4aa6e6f837aa8ec627eae984010:

  dt-bindings: clock: sun50i-a64-ccu: Add PLL_VIDEO0 macro (2018-09-05 09:1=
9:59 +0200)

----------------------------------------------------------------
Allwinner clock changes for 4.20

Our usual set of changes for the Allwinner SoCs clock support.

The most notable changes are:
  - A bunch of changes and fixes to support the A64 display engine
  - Some fixes to support the A83t display engine

----------------------------------------------------------------
Icenowy Zheng (3):
      clk: sunxi-ng: h6: fix bus clocks' divider position
      clk: sunxi-ng: sun50i: h6: Add 2x fixed post-divider to MMC module cl=
ocks
      clk: sunxi-ng: a64: Add max. rate constraint to video PLLs

Jagan Teki (2):
      clk: sunxi-ng: a64: Add minimal rate for video PLLs
      dt-bindings: clock: sun50i-a64-ccu: Add PLL_VIDEO0 macro

Jernej Skrabec (5):
      clk: sunxi-ng: Add maximum rate constraint to NM PLLs
      clk: sunxi-ng: h3/h5: Add max. rate constraint to pll-video
      clk: sunxi-ng: r40: Add max. rate constraint to video PLLs
      clk: sunxi-ng: nkmp: Add constraint for maximum rate
      clk: sunxi-ng: a83t: Add max. rate constraint to video PLLs

Rongyi Chen (1):
      clk: sunxi-ng: h6: fix PWM gate/reset offset

 drivers/clk/sunxi-ng/ccu-sun50i-a64.c      | 48 ++++++++++++++-------------
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h      |  4 ++-
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c       | 49 +++++++++++++++-----------=
--
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c      |  2 ++
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c        | 25 +++++++-------
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c       | 52 +++++++++++++++-----------=
----
 drivers/clk/sunxi-ng/ccu_nkmp.c            |  7 ++++
 drivers/clk/sunxi-ng/ccu_nkmp.h            |  1 +
 drivers/clk/sunxi-ng/ccu_nm.c              |  7 ++++
 drivers/clk/sunxi-ng/ccu_nm.h              | 30 +++++++++++++++++
 include/dt-bindings/clock/sun50i-a64-ccu.h |  1 +
 11 files changed, 142 insertions(+), 84 deletions(-)

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--emsbbyebnlbred5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluvk8YACgkQ0rTAlCFN
r3TuExAAgOYaYFE6G2XqU6El0hFKEFMBWLC98p97GX0NdF5+VRYZSAkAwhybKuA7
/6Hkr+7orwx3xEoiaSD/4oASHprw1IG+ch8zG1p243w7RkIeYYE4abEoojgcs0hZ
RaKjFd7lvqxbqJH+1zp7uuRDG04SrL466UHTX+HG6hEKxtDsyLbYifnmzf2f24LN
Sutj1eGGpSgUQziJu/e2JZo13vO4syW8Krs0/jGxpOB5EUA+PVUu7D9s5xS0kKy2
srCS9p1MFgeZIH9oXMy0r1h/cgXCOPkYWE1ru1clj0S0dvjSE6TjvLbDSgGOxQP9
dz1FlhFu3HFuGwDPkEf6j/9nl6WidYZu4HaAHbUynDFeqazUYwW7Nac7YnK8t7lq
ZvsHo0Z7d8x9uG6hjArcqA9LfKOLFMjT444mazDqkVKnRE0LSzQFWUkj/7tVexas
diQePkPlYs+UJda0xa8x0ltQnVhwt6WWYcDvHmwr13qK9C902tyjWaBposG8SaTp
BBhOSEe8XQEgt9eho53mIzeW/qS3jnxUtXfM/e6TI83CQP854WFLzU3Y0oaz3n5C
Q1BbjU8A5/dL1PvY+quQ/8e5VVka4SfizRgslLG+0lTTxkI4lhvEU8S6HS20Gjw0
ToQNJNxfGKA6h84KP5DHihxImhXwedFb5/sg6TJ1iF3YQfZsB5s=
=uPWz
-----END PGP SIGNATURE-----

--emsbbyebnlbred5r--
