Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549B8C47081
	for <linux-clk@archiver.kernel.org>; Tue, 10 May 2022 13:40:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242237AbiEJNn5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 May 2022 09:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244847AbiEJNmL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 May 2022 09:42:11 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763691573B
        for <linux-clk@vger.kernel.org>; Tue, 10 May 2022 06:30:39 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id EFB875C01D9;
        Tue, 10 May 2022 09:30:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 10 May 2022 09:30:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1652189421; x=1652275821; bh=QrppD833yF
        AZQnysPpFBErbFBlVjw73rXp7B7+VJB5A=; b=L2tlMhdrTqlLn9cf44yEPTsU5G
        1Gp/R/0fxnzxCyUo/uIc6oUGUGgXTgu6dKzv6mbeOF6oTw/Cvz5CaO44UXqq8hF9
        ix4Ch/C5VFhw6uQ543H5KTq/7J5Gg7/O7hnjdL9YmTEvrUJbgsSaTRxtOuKUQRC4
        LgaFdweHtfpov+Sz2ihu3jitSHfEzWnZ6BSyZhM7JC0IKGeGtEgP/3pfS55tpOH4
        /PyeTKUpoJDfYbJE4nCkhIEtIqq8qoEexJH1/6g800GhUBFW8VIkamdEc7rkwDbT
        SjlhdwZrqYGeJVOdBjdlbQA9w0g4Di0ODZMx2NuSTJbpw4veu93dNkquikKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652189421; x=
        1652275821; bh=QrppD833yFAZQnysPpFBErbFBlVjw73rXp7B7+VJB5A=; b=x
        W3dUCPqCwXRIz5aDXYA1Vd5pWTOJlEAe6ysyi9NOgs+VwJFyCzEb84HMVDw915uQ
        mx9NRB//mzmoGzOC1UIQbVDTrzitqvLsCLtkEumjtT53Zt5X5k/zuIHzxyTRHvaC
        1MTjFFKhenGjXHKqxe80oPIGJLMbRIGwBueCkwyaaRQ4GFFZGqpDKuhkihB/hgHd
        WOYsuX4+zKNtwznV9UrVf+7aXamQqGeN3LN+D3avVRM3y1LelyJIb0XK5VMuE88g
        MRF0BRDyZziBN+mayudy1KeR0exl6aqHQ7bUE8Dqyzjm+YwJKY++DVBWNXXsYhLv
        JJiuZUYO8OtwJkdAXcHbQ==
X-ME-Sender: <xms:7Wh6YhDqUBGYHHuK9U9jObw9XaKWb0AIuUnrda5fBJtJ5fX49Zy7eA>
    <xme:7Wh6YvgkdAAKPAso7SzoxA2FWJRisNOG_2uvYwEPk3qkQvu9UJcA9n_X1itO-1uUd
    RUADMStilFkM7Fye3k>
X-ME-Received: <xmr:7Wh6YsnlqqY11EPJcW8wrHzU1kn0eHg3rQwu53CiMaZIq59yJxTbpkIw-Qs2r3j3q0fkVHK4rfl5Zp3uSwh7iNNI5V2fz42qfgmoLI4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedugdeitdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
    vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:7Wh6YrzYZelGKHRN3-wKPVPTL35RiJPVR8ErJe3DJoFiRKe5CQofaA>
    <xmx:7Wh6YmT0qfJHHoAfoDK5Od0Xd7HO66VTsc5GPotpnkw3TmB_FVHOMg>
    <xmx:7Wh6YuaCBYnPqL6mIIDSg-Q2bKomUiz_Sb7QjJd26Bq0jpcMyf2Orw>
    <xmx:7Wh6Yn-g0uCTDK7SuxFBu4mcnkWkuoZYUEXoWBUo47TIhFx2KDQuSA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 May 2022 09:30:21 -0400 (EDT)
Date:   Tue, 10 May 2022 15:30:19 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Guillaume Gardet <Guillaume.Gardet@arm.com>
Cc:     "Ivan T. Ivanov" <iivanov@suse.de>,
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
Message-ID: <20220510133019.h2urxj3feponfuku@houat>
References: <20220428065743.94967-1-iivanov@suse.de>
 <VI1PR08MB2847DA5DC2665EBA2756D7EB83C99@VI1PR08MB2847.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l3r2s4pzbz2a6nsn"
Content-Disposition: inline
In-Reply-To: <VI1PR08MB2847DA5DC2665EBA2756D7EB83C99@VI1PR08MB2847.eurprd08.prod.outlook.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--l3r2s4pzbz2a6nsn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, May 10, 2022 at 01:20:18PM +0000, Guillaume Gardet wrote:
> May I ask what's the status/plan of  this patch series?

As far as I know it hasn't been merged yet.

> It seems it has not been merged yet, and I know we are a bit late in
> the 5.18 schedule, but I think this is a good fix for 5.18.

Fix for what? I don't think this series fix any bug?

> And, this looks like to be a good candidate for a backport to stable
> kernels.

This is not going to be trivial to backmerge, it depends on 12c90f3f27bb
that isn't marked for stable

maxime

--l3r2s4pzbz2a6nsn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYnpo6wAKCRDj7w1vZxhR
xb83AQDTO9oUjINvODOCi4t1kRbFpgIjMvT4i/6eG9pNAwEY3gEAgIzvnC92+gf9
ht6P4tX6AijZ1uwa/NYgrOl95o+weQ0=
=lk8a
-----END PGP SIGNATURE-----

--l3r2s4pzbz2a6nsn--
