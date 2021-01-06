Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF34C433E6
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jan 2021 16:52:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD4C32313F
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jan 2021 16:52:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbhAFQw0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Jan 2021 11:52:26 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:33729 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727582AbhAFQwZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jan 2021 11:52:25 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 736995C0069;
        Wed,  6 Jan 2021 11:51:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 06 Jan 2021 11:51:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=hu51lVRj1Iabt8QO0VuSrFpFDpQ
        QAgLDjzPJAVKSgm0=; b=FH+G1hioHXRAUIM4dVvMRp4slK9GAJR06a9n/3sYvsg
        p/LBkbGfNdmso0q6W57J9lzZg4enosTZuM7WhuvT15ylcKSf5+eFInwuCpk0nv/U
        YxAIbH9MpEfIQvNown5C5hyralvCYnvCBNGyQFRHatM2OSEXLW7L5ZCeTvVvEKHv
        QKPHb19S7CERy+CbQt5eRUXyD+DpF9sRtexhrAL8gRO1xzPpMZSz5p43EdmXMp81
        5OT/KImXH21fHVbTnkbsg9GnudpU5+NGMvGo/JaLFdPr3wTQ58qY8amZugnbUvm0
        k4ogq5p/mY4oPPNk52Xet4zO3IoayYmeX0V2nSTNwZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=hu51lV
        Rj1Iabt8QO0VuSrFpFDpQQAgLDjzPJAVKSgm0=; b=q4Wi4RYSRtVrz8wjgLK0TI
        l3ba/rYinfJTOdWCb+qfVlqyBCVyU5kybgHIaFrfSuLWZkLlcdzWZrJNHIwrY98A
        dRxss01xQDQ6IgF+V6XlC8SkgxHt7g2F/LSv4bAllPoTtFKNgxZ/9kqcjWnBsjyw
        6R6khCebU3MMt2y3u4PX0rXc0XuNvvD1hZ9Mty7Tg+0g6wl7C/V+I5UTYr2/VLMY
        7JUWILYzI+oKc7/kOzhPzKxqIRDblSecISCOc7/Pz2bvmpxp+58Q+PhBhSTPgjU0
        /wp2wcTKvd9nUGx3WX+GpR6YMQeAhKL3nWkmVPGktNOxoNu5Qrrhx0MRXxCXi+lw
        ==
X-ME-Sender: <xms:mer1X1WEJMj_geLhkrR6Jl5oLoeJBWcs-rClWGzoEMBrlwTmzdrcOw>
    <xme:mer1X1nSwgI3C76vSqj27WRIlLt1gXwOiDhIt98jx9ngQKaYD7L3-bGwC0Ee5hrd8
    3SGovhqvn3n2vaZoTI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdegtdcutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgvucft
    ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
    hnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeguden
    ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mer1XxbeW0WjYVrcbTufFGpd8MI-NxGeRdFAzfRmCLAYgBoIOpLnBg>
    <xmx:mer1X4W_0CbJoWmO48w0r-P48_TzNwajNj_fJyNs_hbalukLKsvfpA>
    <xmx:mer1X_nN0jPdv5yqnbzAA7Gwk5MnjIXASKSkx5QzLox3kR9kP4IPrQ>
    <xmx:m-r1X9aoP5x3HpRXVvrMIhY3bAV1pl41OXBaAaYE-T-DdKO_Gsg0TQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id A7E0A240069;
        Wed,  6 Jan 2021 11:51:37 -0500 (EST)
Date:   Wed, 6 Jan 2021 17:51:36 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Icenowy Zheng <icenowy@aosc.io>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH] clk: sunxi-ng: h6: Fix CEC clock
Message-ID: <20210106165136.fx3padj7sdyn7tau@gilmour>
References: <20210106143246.11255-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xfsnqdu3my3helxo"
Content-Disposition: inline
In-Reply-To: <20210106143246.11255-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--xfsnqdu3my3helxo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2021 at 02:32:46PM +0000, Andre Przywara wrote:
> The CEC clock on the H6 SoC is a bit special, since it uses a fixed
> pre-dividier for one source clock (the PLL), but conveys the other clock
> (32K OSC) directly.
> We are using a fixed predivider array for that, but fail to use the right
> flag to actually activate that.
>=20
> Fixes: 524353ea480b ("clk: sunxi-ng: add support for the Allwinner H6 CCU=
")
> Reported-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Applied, thanks!
Maxime

--xfsnqdu3my3helxo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/XqmAAKCRDj7w1vZxhR
xdCfAQDEv+hWrm0qShV7GKoJxeAbcQNR9YzIYTSre4qrQTmyrAEAt1259acpYtZ6
8JFL/YMPN3/g0gEBqNJTPHWOgGh39Qo=
=kJLK
-----END PGP SIGNATURE-----

--xfsnqdu3my3helxo--
