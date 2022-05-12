Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54654C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 07:57:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351237AbiELH5l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 03:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241283AbiELH5l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 03:57:41 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43FFB6899C
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 00:57:39 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 355975C018E;
        Thu, 12 May 2022 03:57:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 12 May 2022 03:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1652342259; x=1652428659; bh=3NM4bFbvpz
        WASbZzhF5oHSoIaiw4/r4yhtIx8wsyYNg=; b=BCjX3Zr/OuLFYiXOpytLZcUFY1
        9elPRDujoeE7ycNW2AWSxn9fNvFvBZPW9Qf4CXD1cAhBZX9iCcbwIFGUpTNie9wT
        tWyTdDJUNXoIWnGUASCBN+iXD/U7jAGRoxJKxKQbEaMRwcmIjZeBzcKunajl/Ptt
        8y17eVlgLj/t7mJfx44IhdNitEHh2G7L38qm+sL303j+aVkeSaJSwB9Iq4QmMu7G
        gTu03BY+cRsE/C8S1OkL6xhhS81sCRidGSR6o8htQvD+AUU09n4QDY5Beo5eqDZy
        lWuwfCg1/M+yBcaluXunMit+TTBsDnBN01WcPu80U+WiUaKM0po5Q81B/JAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652342259; x=
        1652428659; bh=3NM4bFbvpzWASbZzhF5oHSoIaiw4/r4yhtIx8wsyYNg=; b=r
        OZwLvJ06tbvpbqJ7oT+HvEOcl8gjI0mHuiGDrP2yP32MOEC3wa8d6E93R2nVKu7b
        pB+Prbe215sCUcMRJvPq/W/MOStC9WtSBgYUCdF5H4hH7r8doa78TRHbo2TAyyfE
        3LsrC6WwFM2R9TJIdm0ejoxYtEOpFuXLHuVut+3EQcjFBYZ2V6jQR7joe7XS2MVP
        Mxy3g1r1S/VkF2YUxw1axgoblL42v31PF1/6I17O1Vi4p96Mcf6nDBpxsTytqIa1
        UKQ/v4zTixmsQmRYhIFJdBDpqL6N/zkyXalO/RQeeJ4ssje2vZK7TVM6mzMXJ7xx
        8roYayxTN44nJ4GME+Dig==
X-ME-Sender: <xms:8r18YjzdOit6FhhuvXqJVFKU4bIWJWsuZDv6AHpFj86wdWSPisSw4Q>
    <xme:8r18YrQ2Go51dybgzmnBOQ_YF4L8tOUD99YOuJq-ACVGx-IGjqtepxZVS98sGd-y2
    rDNXaj5qbCzJquhix4>
X-ME-Received: <xmr:8r18YtVan4s1ou8c2UgJHlCaqT23ucuDcw5HKlZWkkxd6ewzpwRf2xEHGQpqvglt7SwDTJ4TfeY8Pl08rJS0V3wiU7h6NxOzHGt9rHE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeeigdduvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:8r18Yth2tFUgc5yBSZCVkUaJJIwaSGYkkFmBRipdbzMIQXFlQZC2FA>
    <xmx:8r18YlBuALyCibyhIQhQpchDdti7lr25HAoBy6_LpVXUSXRy9HTtFg>
    <xmx:8r18YmJ08QHCBJBCooTfm-DfUBhnTEYlJdZmtAHj16u9AWBZG-9nQQ>
    <xmx:8718Yp40n0mOsVhLvgoXycz6vFj_u4Mmx88JFiBFpbRyuxVi43QCKA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 03:57:38 -0400 (EDT)
Date:   Thu, 12 May 2022 09:57:37 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Guillaume Gardet <Guillaume.Gardet@arm.com>,
        "Ivan T. Ivanov" <iivanov@suse.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, nd <nd@arm.com>
Subject: Re: [PATCH v4 0/3] clk: bcm: rpi: Add support for three more clocks
Message-ID: <20220512075737.mpipy7rmixwfwpyl@houat>
References: <20220428065743.94967-1-iivanov@suse.de>
 <VI1PR08MB2847DA5DC2665EBA2756D7EB83C99@VI1PR08MB2847.eurprd08.prod.outlook.com>
 <20220510133019.h2urxj3feponfuku@houat>
 <6066bd9d-b53b-0a91-7440-98244c2d55c2@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yvbqt5jup6los6vy"
Content-Disposition: inline
In-Reply-To: <6066bd9d-b53b-0a91-7440-98244c2d55c2@i2se.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--yvbqt5jup6los6vy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2022 at 08:10:50AM +0200, Stefan Wahren wrote:
> Am 10.05.22 um 15:30 schrieb Maxime Ripard:
> > Hi,
> >=20
> > On Tue, May 10, 2022 at 01:20:18PM +0000, Guillaume Gardet wrote:
> > > May I ask what's the status/plan of  this patch series?
> > As far as I know it hasn't been merged yet.
> >=20
> > > It seems it has not been merged yet, and I know we are a bit late in
> > > the 5.18 schedule, but I think this is a good fix for 5.18.
> > Fix for what? I don't think this series fix any bug?
>
> This seems to be a "fix" for the Frankenstone scenario: mainline kernel +
> vendor DT

Did we ever support this?

I don't think we did, so even though it can be nice to improve that
situation, I don't think it's worth sending this to stable

Maxime

--yvbqt5jup6los6vy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYny98QAKCRDj7w1vZxhR
xcLJAP9LqC5QfSw4LNEmBmCtW3ZTb8rdaR7mvJDs69FGEesnkwD+MBxozmU3YV/Z
XVGYVZPVfifmMmkcgOfiKfChYRxWnwo=
=bxXn
-----END PGP SIGNATURE-----

--yvbqt5jup6los6vy--
