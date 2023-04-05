Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A36D6C7619A
	for <linux-clk@archiver.kernel.org>; Wed,  5 Apr 2023 16:05:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238882AbjDEQFP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Apr 2023 12:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237481AbjDEQFO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Apr 2023 12:05:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C07065BC
        for <linux-clk@vger.kernel.org>; Wed,  5 Apr 2023 09:05:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7538063D40
        for <linux-clk@vger.kernel.org>; Wed,  5 Apr 2023 16:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332BFC433EF;
        Wed,  5 Apr 2023 16:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680710705;
        bh=sNSqkINxFI7A8wFSv179kl/bjwEC7TLZju7EuQ1QQEI=;
        h=Date:From:To:Cc:Subject:From;
        b=jy/9OyLr7LVbwEuVaPmVcNXhOB5xrE4mgZlQlsgycdFg+AwwB5RR77CVqzemKaV88
         S/8tHF7OFIa8Q7RQ7kUeLU4Hg9k4pTFhXuztU5GU2mpuYUeBCx9P2lymWuW/4EzPyV
         bNn1aSE6soxFu3pqURKQPqYkv3QhEXDGlPQquqsQZE6uqgj5YlvgScY4vdxAsW5ld0
         mWWxZsNfETKPJqLTR+AS5ePHOIu0M9VcwNM8wuI/cpJB2isJEsFgTCe3o/NwGcqTZV
         X2OjjaPxfO/HBI0aL66sn4WRgWswVkPD1pkeDRlPoLu6FTbnw3gy0hGZ9DEA7V+29m
         G0UIiTakGVpOg==
Date:   Wed, 5 Apr 2023 17:05:01 +0100
From:   Conor Dooley <conor@kernel.org>
To:     sboyd@kernel.org, p.zabel@pengutronix.de
Cc:     linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
        hal.feng@starfivetech.com, emil.renner.berthing@canonical.com,
        conor@kernel.org, mturquette@baylibre.com
Subject: [GIT PULL] Initial clk/reset support for JH7110 for v6.4
Message-ID: <20230405-constant-dreamily-0128e071c665@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VxiQgXSLDZ82ap6c"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--VxiQgXSLDZ82ap6c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Stephen, (and Philipp if you want I guess?),

Here's a PR for the StarFive JH7110 clk/reset bits since I'd like to
take the DT this cycle & depend on the binding headers.

I've picked up R-B tags from Emil on all that patches, despite him being
listed as an author, as things have changed quite a lot since he was
involved in writing things many months ago.

The base here is -rc2 rather than -rc1 as -rc1 has issues booting on
this platform. Please pull and all that lark..

Cheers,
Conor.

The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-jh7110-clk-reset-for-6.4

for you to fetch changes up to 63a30e1f44d5e3afbb47efe8a15fd86feeb62b4b:

  MAINTAINERS: generalise StarFive clk/reset entries (2023-04-05 15:52:25 +0100)

----------------------------------------------------------------
Initial JH7110 clk/reset support

A rake of patches, initially worked on by Emil & later picked up by Hal
that add support for the sys/aon clock & reset controllers on StarFive's
JH7110 SoC.
This SoC is largely similar to the existing JH7100, so a bunch of
refactoring is done to share as many bits as possible between the two.
What's here (plus the already applied pinctrl bits) should be sufficient
to boot a basic initramfs.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Emil Renner Berthing (13):
      dt-bindings: clock: Add StarFive JH7110 system clock and reset generator
      dt-bindings: clock: Add StarFive JH7110 always-on clock and reset generator
      clk: starfive: Factor out common JH7100 and JH7110 code
      clk: starfive: Rename clk-starfive-jh7100.h to clk-starfive-jh71x0.h
      clk: starfive: Rename "jh7100" to "jh71x0" for the common code
      reset: Create subdirectory for StarFive drivers
      reset: starfive: Factor out common JH71X0 reset code
      reset: starfive: Extract the common JH71X0 reset code
      reset: starfive: Rename "jh7100" to "jh71x0" for the common code
      reset: starfive: jh71x0: Use 32bit I/O on 32bit registers
      clk: starfive: Add StarFive JH7110 system clock driver
      clk: starfive: Add StarFive JH7110 always-on clock driver
      MAINTAINERS: generalise StarFive clk/reset entries

Hal Feng (3):
      clk: starfive: Replace SOC_STARFIVE with ARCH_STARFIVE
      reset: starfive: Replace SOC_STARFIVE with ARCH_STARFIVE
      reset: starfive: Add StarFive JH7110 reset driver

 .../bindings/clock/starfive,jh7110-aoncrg.yaml     | 107 +++
 .../bindings/clock/starfive,jh7110-syscrg.yaml     | 104 +++
 MAINTAINERS                                        |  22 +-
 drivers/clk/Makefile                               |   2 +-
 drivers/clk/starfive/Kconfig                       |  33 +-
 drivers/clk/starfive/Makefile                      |   6 +-
 drivers/clk/starfive/clk-starfive-jh7100-audio.c   |  74 +--
 drivers/clk/starfive/clk-starfive-jh7100.c         | 716 ++++++---------------
 drivers/clk/starfive/clk-starfive-jh7100.h         | 112 ----
 drivers/clk/starfive/clk-starfive-jh7110-aon.c     | 156 +++++
 drivers/clk/starfive/clk-starfive-jh7110-sys.c     | 490 ++++++++++++++
 drivers/clk/starfive/clk-starfive-jh7110.h         |  11 +
 drivers/clk/starfive/clk-starfive-jh71x0.c         | 333 ++++++++++
 drivers/clk/starfive/clk-starfive-jh71x0.h         | 123 ++++
 drivers/reset/Kconfig                              |   8 +-
 drivers/reset/Makefile                             |   2 +-
 drivers/reset/reset-starfive-jh7100.c              | 173 -----
 drivers/reset/starfive/Kconfig                     |  20 +
 drivers/reset/starfive/Makefile                    |   5 +
 drivers/reset/starfive/reset-starfive-jh7100.c     |  74 +++
 drivers/reset/starfive/reset-starfive-jh7110.c     |  70 ++
 drivers/reset/starfive/reset-starfive-jh71x0.c     | 131 ++++
 drivers/reset/starfive/reset-starfive-jh71x0.h     |  14 +
 include/dt-bindings/clock/starfive,jh7110-crg.h    | 221 +++++++
 include/dt-bindings/reset/starfive,jh7110-crg.h    | 154 +++++
 25 files changed, 2297 insertions(+), 864 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
 delete mode 100644 drivers/clk/starfive/clk-starfive-jh7100.h
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-aon.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-sys.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110.h
 create mode 100644 drivers/clk/starfive/clk-starfive-jh71x0.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jh71x0.h
 delete mode 100644 drivers/reset/reset-starfive-jh7100.c
 create mode 100644 drivers/reset/starfive/Kconfig
 create mode 100644 drivers/reset/starfive/Makefile
 create mode 100644 drivers/reset/starfive/reset-starfive-jh7100.c
 create mode 100644 drivers/reset/starfive/reset-starfive-jh7110.c
 create mode 100644 drivers/reset/starfive/reset-starfive-jh71x0.c
 create mode 100644 drivers/reset/starfive/reset-starfive-jh71x0.h
 create mode 100644 include/dt-bindings/clock/starfive,jh7110-crg.h
 create mode 100644 include/dt-bindings/reset/starfive,jh7110-crg.h

--VxiQgXSLDZ82ap6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZC2cLQAKCRB4tDGHoIJi
0lbzAQDfmv4s4TWUytYT+wpNfRfL91KsrUTqRM6RxNFhK728YgD9Ems0KgF/+RSI
il/aq997LhB3O5joLUCnUUAkaHQy+ws=
=rSdZ
-----END PGP SIGNATURE-----

--VxiQgXSLDZ82ap6c--
