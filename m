Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E886C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 08:03:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343585AbiD1IGa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 04:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238942AbiD1IG2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 04:06:28 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 254BE7E584
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 01:03:13 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 595915C01D9;
        Thu, 28 Apr 2022 04:03:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 28 Apr 2022 04:03:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1651132991; x=1651219391; bh=cFNRvmAWW2
        txFOxUkA5ueDoxjaCjMFHXn6pIUMby7sk=; b=mlLbl2f8AetnzPq/jnoCwR55ox
        g8viSgMspcWV9aKZ76jFX2zsBqqSNabC+LfWbnrNrQgqdRp1kwISJfcGCB4TkjzV
        1pvhIYbpNCP4rfLcQc3SXdJR8zGDeFJyEjesqrYgycKr3mbBTPlsDdKf8OfVgMzz
        EQkXOr0V/yxXTZXSz5P3U+9KWzeEKWK2CyMOpiYwPDI6Y1FrGzAcp53oR2sEiG8d
        4oZcbvEORr7r6kYSIsyh3wvrb1UYo9yu8CStFX3/vC9iZcRDWNaRUCAN/YUWjpSP
        cA1H4cq4YvSgjijNdF/vY8X2/t7afT4QGq3S6V9ieyIpbsqon3pNdKxgc6LQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651132991; x=
        1651219391; bh=cFNRvmAWW2txFOxUkA5ueDoxjaCjMFHXn6pIUMby7sk=; b=b
        2bC9orxtKX04I7y0XUin1BsIAehwxAIZoPEbQ8v5jn/CKYVHCMeJK3chLBLIyZ3R
        ofUx31JDGi8NLpfVB8PtI29WsK3nOZwZ5hU5kZAxDVLoz+Mnjlb0ZJyf3s5qw0xQ
        q/4sMYfwviaa4doV+1Hg0wpe0BG8AUj7WbrnE2DgrAEMfY4N0XPq2h4F9R2VNg2i
        egzWivPYpEGm1YdEq2aGlwYEQjTsKp93gmY1mOytnNKD3sXJikgL+wmkd6IjfrRl
        XdkWTi9i0BMpCf09oaV8Hh0b0IuBPTQ2cYFVNhy24gKfhyTUEPDTfzO3CSOD+s+V
        LmxHs0PJhRmHOQlO1f60A==
X-ME-Sender: <xms:PkpqYsfewRsb92AH4uUtM_lHakKOh0VkMzYyQOB_yy3yjxpX7mfnaw>
    <xme:PkpqYuPAHDkf7ujtumuXARHDV3TmQyBYvU0RR7c0SxAXj1C-J8kHS2lcRtOMAcBc-
    fXY34y4iv_9FeuFKBc>
X-ME-Received: <xmr:PkpqYthqLslCM1xnlYWiULg0YQWIX_2nPyY6ISnyd9PcrVzUG3n4zi4ghT9Eu3opgllbEWoFVQDSfVoIOHO2aVpbVwxWw2L4wj6cXOU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigdduvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PkpqYh_6xHCIqeJ8vZ3bMi5ELcX1jV4kI_xQPP_LSsh3JL5pFdLyRw>
    <xmx:PkpqYosdbq_0zIUvRwvQo13hFfVk3X9bmUiEix7qtPO1EdJ-aHpz1Q>
    <xmx:PkpqYoESeOfayaqgg2HVxxLrupX8Ia1ckdCfruMiJUJRaGDPwL7zKw>
    <xmx:P0pqYqLgGD_YdXzMqDqqvk74KvayTYcvmfHN9RiUePAuB0fvpcdN_w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 04:03:10 -0400 (EDT)
Date:   Thu, 28 Apr 2022 10:03:08 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     "Ivan T. Ivanov" <iivanov@suse.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Guillaume GARDET <guillaume.gardet@arm.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Dom Cobley <popcornmix@gmail.com>
Subject: Re: [PATCH v4 3/3] clk: bcm: rpi: Add support for VEC clock
Message-ID: <20220428080308.3dtpjgnpzbupqs44@houat>
References: <20220428065743.94967-1-iivanov@suse.de>
 <20220428065743.94967-4-iivanov@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="n6olxlboqz3mwztn"
Content-Disposition: inline
In-Reply-To: <20220428065743.94967-4-iivanov@suse.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--n6olxlboqz3mwztn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2022 at 09:57:43AM +0300, Ivan T. Ivanov wrote:
> From: Dom Cobley <popcornmix@gmail.com>
>=20
> Platform driver clk-bcm2835 gets an inaccurate clock for VEC (107MHz).
> Export VEC clock trough clk-raspberrypi which uses the right PLL to
> get an accurate 108MHz.
>=20
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> [iivanov: Adapted on top of v5.17-rc6]
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--n6olxlboqz3mwztn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYmpKPAAKCRDj7w1vZxhR
xWqEAQDRM1aJ1Natt1F8upr7B/HY8YdYSM76MO71wUuXqZ7AxwD/RaEP4G25d2W+
eXEiexzSJfP7M9zt9Ohxks5uAp6QdA4=
=AL+t
-----END PGP SIGNATURE-----

--n6olxlboqz3mwztn--
