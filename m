Return-Path: <SRS0=Qq/y=WT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F2BC3A5A3
	for <linux-clk@archiver.kernel.org>; Fri, 23 Aug 2019 14:29:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8C860233A2
	for <linux-clk@archiver.kernel.org>; Fri, 23 Aug 2019 14:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566570569;
	bh=neuhXkbS6PcmZgpyRUaDknwhA7w4jll4/SFaK+dRv7U=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=x9AlR8woCL0CUob/GR8n1Qklb2pi9L73CcpKDie1t7SSHrltVI7eTQzaePor/mazN
	 YynrfWK+fTRKxf849vFX95d6J1C9cnQB0nmsmKIEvPsDvl4YiIv5VTNPtNDk+jxYCf
	 mugHF4I1C0j0hz0BQbOn+1NqWzdwC3VD5ZsdaisI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395308AbfHWO33 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Aug 2019 10:29:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:50516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390586AbfHWO32 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 23 Aug 2019 10:29:28 -0400
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5ED7E23429;
        Fri, 23 Aug 2019 14:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566570567;
        bh=neuhXkbS6PcmZgpyRUaDknwhA7w4jll4/SFaK+dRv7U=;
        h=Date:From:To:Cc:Subject:From;
        b=2Zb0OwPvwmEAjIwKZJqCfxtoJOrBZ/X8rEl1CR+rKKuQY51Tz1CEY6FMXkIEk9jv5
         C1bEX3tsV+bB6ccfCO9Wd1prmQLf55uuQXgGuV8tXatcMnWno2kw41kLJ8AS3fmIqe
         MZd8kj0dWiJXArrknqN8W2sK9rIaDn/lVnicrT8M=
Date:   Fri, 23 Aug 2019 16:29:25 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: [GIT PULL] Allwinner Clock Changes for 5.4
Message-ID: <237561e9-4ca2-44d3-9f43-e5cee1c5fd4c.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h22gnxmw6ilrowwv"
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--h22gnxmw6ilrowwv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags=
/sunxi-clk-for-5.4-1

for you to fetch changes up to 65818ad0815f3a2ba6a41327cce8b600ee04be32:

  clk: sunxi-ng: h6: Allow I2S to change parent rate (2019-08-21 17:20:31 +=
0800)

----------------------------------------------------------------
Allwinner clock changes for 5.4

A few patches to enable the V3 SoC and fix the i2s clock for the H6.
-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXV/4KAAKCRDj7w1vZxhR
xZxLAP4rYe6+3IudHSM+x7cqAJrtfOFFS+IBOYeNckIY0Hy8XgD/e6mGyYDk7dr8
VCmWuG8nD2u9XAVaxo07ouiOwzEpBgw=3D
=3DD+Jq
-----END PGP SIGNATURE-----

----------------------------------------------------------------
Icenowy Zheng (4):
      clk: sunxi-ng: v3s: add the missing PLL_DDR1
      dt-bindings: clk: sunxi-ccu: add compatible string for V3 CCU
      clk: sunxi-ng: v3s: add missing clock slices for MMC2 module clocks
      clk: sunxi-ng: v3s: add Allwinner V3 support

Jernej Skrabec (1):
      clk: sunxi-ng: h6: Allow I2S to change parent rate


 Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml |   1=
 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c                                 |   8=
 +-
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c                                 | 250=
 ++++++-
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h                                 |   6=
 +-
 include/dt-bindings/clock/sun8i-v3s-ccu.h                            |   4=
 +-
 include/dt-bindings/reset/sun8i-v3s-ccu.h                            |   3=
 +-
 6 files changed, 260 insertions(+), 12 deletions(-)



--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--h22gnxmw6ilrowwv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXV/4RQAKCRDj7w1vZxhR
xX8fAP4kzDKJub2krkOqgK5e9w6RFgMvk4BWkRXlJJ2I+3PNQAD/fhLRIFq3uODU
jwC+3QIQl8TJ7wlTHbIwoecJDv6KIgo=
=u2Wj
-----END PGP SIGNATURE-----

--h22gnxmw6ilrowwv--
