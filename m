Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1082BC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jun 2022 09:39:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232989AbiF2Jjk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jun 2022 05:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232982AbiF2Jji (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jun 2022 05:39:38 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49C413B3F9
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 02:39:37 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id AAC2C5C0490;
        Wed, 29 Jun 2022 05:39:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 29 Jun 2022 05:39:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1656495575; x=1656581975; bh=lI98Umqfcs
        ODEkfZkHcq2rhqQrksAwLMNcx3obm7EAc=; b=jEQugzibNBevmZdfihjY2MdCeW
        SqrZRHLZiwPT/kqk9taaFGE3YTrY+7T9DCOVo4wyQVQnVa23momReD3JhJa6XigJ
        HY9laYQbhcd0yark1bnRFGN3FjDd3q6QkTZoVjqeGtApEYrxgc0lH3xYO8m35H4M
        AYzdOMYhSdCZgZ3vAUvJqWtPjolUWF8+IsEDu4m+byhjEYJ4UmaZeCE5GLHwfVnu
        wWhM3esCjy1uLKu2Y9kgbE3B8SHRoXuvkFTMgeOabZgVWGlvDc0aHJcZ9NPz+b1L
        ox8rFceVNvUcpB6zMPk0ujLCAclSg7h7pYJqdqQbVk9asMDDLUcfewbOXaXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656495575; x=1656581975; bh=lI98UmqfcsODEkfZkHcq2rhqQrks
        AwLMNcx3obm7EAc=; b=W+mFafEDuIffofNcCjsSizodPd1IiXfJPfHDsSlu48PZ
        simCxoDFKszeQkEVHo6abYrGSkDXh+qpD7kRs4QAeE2fN4rZ4q0p2T+9QP1Xwozn
        vOeV1VgU2yAURF53jrXAeNS1LsA6qvFd8oxogne/6uf5rpF9FzlBQ0iHPJXE+Iyc
        FjktfLF1o+NibwK+u8p+Ep/tcn9KpVHGXH32FasTLCnbQI5Q2u3Kp9c6Aeik7uWw
        0H5QGEQszSHYRbYroS1M0gijOnRPWMLHfimyN44sohkhzjaDTAtVpgoVZWNusjoc
        MfPGpPuLn8+/2RW5mcS97BfHOvqd4bfk7Wfn5vnpsg==
X-ME-Sender: <xms:1h28YgsIfsUuoIn9pT6UNks6OQBgZ3JZqen2zbJlZu0tK87sXfgwVA>
    <xme:1h28Ytdq_Y2qrYj39KG-43YdUnPfvOb_T-N-SzbvFbaQlTl1nDlEkbnHQ-45rSop8
    LlJEM2vtYz0qwAzRfU>
X-ME-Received: <xmr:1h28Yrz_dwpmj5NyiwBZO_xTCRm3ZOwTZ8sThxEdWRguiiA_yMfMK4XwTDK92VVSI1oguRCK6goqMRMBWIC5k990ZVIdObLfRJBiWis>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1h28YjM3DlNKKCULWJeXzn5hwMAjdvqWd6HGGO0DIqCmaX3GwFfa_g>
    <xmx:1h28Yg8X7XsLv8-omNAThhwqf6pMZG-iog8IkNuftgvG-DOdbaFodg>
    <xmx:1h28YrXnZIvg_fXGP_nWk0HmXbHbMzo2tl5O1uIh7tUDqW3xXnLB8A>
    <xmx:1x28YraKO3NTqlGoBL19zJhF25KsTM_8oaoQWpwEljz3v2IhXgX40g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 05:39:33 -0400 (EDT)
Date:   Wed, 29 Jun 2022 11:39:32 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v5 24/28] clk: Test the clock pointer in clk_hw_get_name()
Message-ID: <20220629093932.evp555m2w4gawkpx@houat>
References: <20220516132527.328190-1-maxime@cerno.tech>
 <20220516132527.328190-25-maxime@cerno.tech>
 <20220629091351.9293BC34114@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="n6svgzvz3cgqdxgc"
Content-Disposition: inline
In-Reply-To: <20220629091351.9293BC34114@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--n6svgzvz3cgqdxgc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 29, 2022 at 02:13:49AM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-05-16 06:25:23)
> > Unlike __clk_get_name(), clk_hw_get_name() doesn't test wether passed
> > clk_hw pointer is NULL or not and dereferences it directly. This can
> > then lead to NULL pointer dereference.
>=20
> Why do you have a NULL clk_hw pointer? Is there some caller that is
> simplified with this patch?

I encountered it while debugging the clock tree and assumed it would be
a good idea, but I don't another reason.

I'll drop it

Maxime

--n6svgzvz3cgqdxgc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYrwd1AAKCRDj7w1vZxhR
xZHEAP4tnRCKT0W20KZK/qMzUjhM3jpUVuY2G0JJTgbE82ZrlAEApNqqqp2XylHV
DpLuVti1jzcXfcF4Sw7TVgyzwCkeCQk=
=x26B
-----END PGP SIGNATURE-----

--n6svgzvz3cgqdxgc--
