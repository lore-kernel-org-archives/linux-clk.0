Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648F3C48BD1
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jun 2021 14:55:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F268613EE
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jun 2021 14:55:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbhFKO5D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Jun 2021 10:57:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:53852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231555AbhFKO5D (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 11 Jun 2021 10:57:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B20A7611CD;
        Fri, 11 Jun 2021 14:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623423305;
        bh=tyRd2iKhXdWd2APAupfUWzpcuCFBRtPPHsVq01oaevE=;
        h=Date:From:To:Cc:Subject:From;
        b=kBdpO+auuA3t53ipU10LCIFGI4o9CuWzW5RzIJjj3hqbHN4Oc8PohBSFsNR0eW0f6
         cOp7ERS2GsWDAnLvU/cQ+SienY0+H7RPJRtZ7gRElHl6UuEwdCLNym2UDsah4r7P7P
         +hS4V1KByg3T4E/WeQgiPjMcPwtzWCDo3kg97ew6g/YrRV4/ORiodJnZ/RUWhR5uzX
         yBTOZhPSzcFjJlOmN8e6zwz9XiRdm9JWBboNdj3xxIWvdiao+fXD4BURlRjsgamj81
         IbQGFaiELm+rDaz7DB/Q0nUqw+r54lZn7SmW7AMMyzo43styFohhROKUjo/6yddS5Q
         ZDRy6jSqHvUmQ==
Date:   Fri, 11 Jun 2021 16:55:02 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Clock Fixes for 5.13
Message-ID: <eede2490-c702-4a9d-97d0-217424727a09.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="o8HGiXk6Ix1TOh80"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--o8HGiXk6Ix1TOh80
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags=
/sunxi-clk-fixes-for-5.13-1

for you to fetch changes up to 47e4dc4e63e1dcb8eec01c4214bcefc248eb72ed:

  clk: sunxi-ng: v3s: fix incorrect postdivider on pll-audio (2021-05-24 13=
:57:37 +0200)

----------------------------------------------------------------
One patch to fix a divider on the v3s Audio PLL=20

----------------------------------------------------------------
Tobias Schramm (1):
      clk: sunxi-ng: v3s: fix incorrect postdivider on pll-audio


 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)



--o8HGiXk6Ix1TOh80
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYMN5RgAKCRDj7w1vZxhR
xUirAP9D82H/lTcHzXATNKSz83j/HMY0+xNK2KKtm8jctmSSEwEA8dKmXFRGoUFN
6qdAcFR/AU0lyUNa0TefTUt2dXLMSwE=
=u/n1
-----END PGP SIGNATURE-----

--o8HGiXk6Ix1TOh80--
