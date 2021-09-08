Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B591C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  8 Sep 2021 07:29:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C1AF61051
	for <linux-clk@archiver.kernel.org>; Wed,  8 Sep 2021 07:29:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350137AbhIHHbC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Sep 2021 03:31:02 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:55749 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1350239AbhIHHbC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Sep 2021 03:31:02 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 6AADC5C0165;
        Wed,  8 Sep 2021 03:29:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 08 Sep 2021 03:29:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=zl4qWDv3hBeKNfeDvBa9wBQOLjd
        2Vf+IDhYJglXmnFY=; b=mdSqzTaRG37YGHG4cgb8VtODKGh57yc9/pk13MOqxfR
        WhgLBJmpiJxY5xh7Olk11Gidh9MaWMWgt+nb5YOS1GM/WYaf8p7e5fu7o2VCDB8X
        DgR7sJ0+AhD4WJCe3aClYpkK90S9wayDtUmLc7i+3UsOkGcbcdf6hMSRPsWgW00e
        XIcrAcRZXtXw6TiDkQrcmEhcX09rj2e/YE7Rh4W9Kxn2YRJgN4Ahn0TMeiiCpJEB
        5XzC/QTGOEmrVOcLWOKACHTnOVCKfcT7k4v7zwTxz8gSnxgvKdYssOqHLhRLJm8s
        ppiwYoNrVLqkcJkrZ1chsYyltpoi2WE1x6QYUQnxdsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zl4qWD
        v3hBeKNfeDvBa9wBQOLjd2Vf+IDhYJglXmnFY=; b=Py+6L/1AxNyGprZOObdbyi
        4RtXCSySaz74EyPSXMkwtnfdZkgGi3eXIK8cW2ECD45BtmkZGiMNlzmHSFzgPE4D
        edFdCFVN0NEo3CwBT5VsX3uhdlS7UDG5sJf+tN8qcpQIsv5dar+41wNHyjakqRoV
        6UD8MyHpmd9YObfPkFsbHlXLzYpWvPL3pbIbTxLEeKvdPGbsm6Z03ALck/7VYBbv
        SzwEmOH5MuwHi0beextKLkm2u6uJsU7oqJCfIB78dx4hS1ltyyIZ9eryx3uVMTIs
        HjjAolPx1F8AdMhGQ9rmKoVz08xdWAiv1cIgvHFaSejOiOxEuqU7ytg41nrMqyKg
        ==
X-ME-Sender: <xms:cWY4YUXWFSGKV5Sz0nms45byqxKwMsAS-Gjix5hqQMZNR0CvRhy8xQ>
    <xme:cWY4YYlVYFqhYS71y7LaiLnN1aVwG1WyG4iZwQVR42qd-ctrDvwHhxnrkFWSBX8D1
    4mwqfJYmtBAQWKprmk>
X-ME-Received: <xmr:cWY4YYbZiaemYydTeB5xOsg2xtTukX5p9C-WpBsuyS-6JCnCjtRv17D4aTrZP9hAX-4wMI5uNBKX1ISS5F8RpomcPA6sz_aEmV2b>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefiedguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
    heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cWY4YTVuiy8mLNoZ3Jc07fhnZQJIHaD0Ig1gN8K0HfYvCgJny-Dx6Q>
    <xmx:cWY4YelOgU4rODPd6XN_xK-sMJjaEOSXjNu5VbArSM3Vi46_kO0wWg>
    <xmx:cWY4YYeLpuccqFzQT5qbcUoY2hBfQVU166pOwEdMFXVzA5zbbk5PPw>
    <xmx:cmY4YQVUnseWzGGSEaRl20cuM8T7DbIjqXeVDTttcJ1_w6GzVeEK5w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Sep 2021 03:29:53 -0400 (EDT)
Date:   Wed, 8 Sep 2021 09:29:52 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: ccu-sun9i-a80: Make use of the helper
 function devm_platform_ioremap_resource()
Message-ID: <20210908072952.77h4ziwjt5lztfr5@gilmour>
References: <20210907085235.4815-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2e6p4rncvkyvqwyg"
Content-Disposition: inline
In-Reply-To: <20210907085235.4815-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--2e6p4rncvkyvqwyg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 07, 2021 at 04:52:35PM +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
>=20
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Applied, thanks
Maxime

--2e6p4rncvkyvqwyg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYThmcAAKCRDj7w1vZxhR
xfxtAP99pYa7E7C5G+0PE84NfI+4XVXwVlKHbWAMcB76zShAdwD/dbFyKf2r/qTJ
wPBNRHU9nhB1/XzgjfulayttruuuEAo=
=hDUd
-----END PGP SIGNATURE-----

--2e6p4rncvkyvqwyg--
