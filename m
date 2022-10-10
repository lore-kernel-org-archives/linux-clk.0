Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C149BC433FE
	for <linux-clk@archiver.kernel.org>; Mon, 10 Oct 2022 14:50:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiJJOuS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Oct 2022 10:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiJJOuR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Oct 2022 10:50:17 -0400
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com [64.147.123.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8651E65257
        for <linux-clk@vger.kernel.org>; Mon, 10 Oct 2022 07:50:16 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id AE40C2B067BD;
        Mon, 10 Oct 2022 10:50:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 10 Oct 2022 10:50:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1665413413; x=1665420613; bh=UZJYyyNohv
        RtRwUXORzIZPkS1DXmvIlxWUy5T0uB62c=; b=cII+bgh5kbhWuzCF3I5A1luIEr
        cYP6XDEgOaXMjCWlYXW3l+nNg0Gueu7Eu54hUmsBBu9+wfd21OVVpkJJlRECfTzR
        rcGQx7GCKcoLmNIVrm9KlLTcGCxDIT2kp7vX9lKpJjhgzj+8Yzvcio7kdqyMvAHO
        GLnONS0ECSHfvXrlFQ/OACqcY2sJ6lgCvIW+XND6SaRzUtIZy7V2kOYRWDtdaBqy
        0DZifoaNh5glI1rv1RlfYA7kA+wHI0m0BRI6CkbeH4Wv7KLGNuNsCUiQSpvjYvJa
        DVZZV4zpEi/pDUugJbkD01U81cxCWUOhcUDNePwcgesrH+7u3wESsIOXaTBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1665413413; x=1665420613; bh=UZJYyyNohvRtRwUXORzIZPkS1DXm
        vIlxWUy5T0uB62c=; b=V6Ffw0PL2pOQMvJ3+lkv1XO/2OWRD7bZGq42g+EWkMQI
        qlDn1sqoWx1cxf1b6+WFssoYrE0eLo1ILURCu8HkaHzGMEoddnHQ+EokFjtoH/25
        HISoNRBzWkd6KhInfEfGa2JpWyekSpO0xoDtEFDXpKeCsCgBSoyvUKS2Z0H5Nc1p
        2+b/+TFPWjId1o+cXB05KlNyAqO4CqoJeE4xkI/Lhri3bg7b/s4HtckmuFyr8VkU
        2VCL0KJULnDC9pbfdOshx4/z1hGVzbgeTDiWS1TzbLhDoaxLCIN1CIkBNGw+QZ8z
        mw7+pyDcQOlO3/0mYZM/J40obe1NRQYKV3ZqirJQzQ==
X-ME-Sender: <xms:JDFEY01uxKT6vTu8m1jeeGQNzcrcDgj4mjJkQCwsD3W89pZyYr__ew>
    <xme:JDFEY_FArl9aktBInkSR3VYEKo13D8qPD9CgW9tltDwbX_CCwXTZM-SSF--nbbd5_
    kefHjRes9Q08qoGD1g>
X-ME-Received: <xmr:JDFEY86EFh8kbnMa1LbbTvEEWyenVoSX1su-uFyQxkWff3s7AwjCKkrCRyho>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejgedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
    geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:JDFEY90Ls86Q84jbyvWiWSvzM_qPmldjo1nE77Gp_Pf1nZuGNWyEdg>
    <xmx:JDFEY3Ff5LCP44eaey-vZxNa2jqze_IU3o55Osh5EiSuYBkCrUfRzg>
    <xmx:JDFEY2_FDvqF_QZ_aJcVzRXZ6iBO73YuSjgvEqufc6Dca4yprNV5UA>
    <xmx:JTFEY_XlVTOgxefbqD7L5uhQbJIzZ0T2al-cYvUhc-HwzEOykZD9fbljamY>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Oct 2022 10:50:11 -0400 (EDT)
Date:   Mon, 10 Oct 2022 16:50:10 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mark Brown <broonie@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        kernelci-results@groups.io, bot@kernelci.org,
        gtucker@collabora.com,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux Kernel Functional Testing <lkft@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: next/master bisection: baseline.login on rk3328-rock64
Message-ID: <20221010145010.ibodo56smlokfouu@houat>
References: <634095b3.a70a0220.ad568.42a8@mx.google.com>
 <Y0QNSx+ZgqKSvPOC@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2ri6brd6tzvydgrd"
Content-Disposition: inline
In-Reply-To: <Y0QNSx+ZgqKSvPOC@sirena.org.uk>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--2ri6brd6tzvydgrd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Mon, Oct 10, 2022 at 01:17:15PM +0100, Mark Brown wrote:
> On Fri, Oct 07, 2022 at 02:10:11PM -0700, KernelCI bot wrote:
>=20
> The KernelCI bisection bot found a boot problem on today's -next=20
> on rk3328-rock64 with a defconfig plus debug fragments triggered by
> cb1b1dd96241f ("clk: Set req_rate on reparenting").  The log doesn't
> show any obvious warnings but simply stalls out after:
>=20
> [  258.676722][    T1] pps_core: LinuxPPS API ver. 1 registered
> [  258.684929][    T1] pps_core: Software ver. 5.3.6 - Copyright 2005-200=
7 Rodolfo Giometti <giometti@linux.it>
> [  258.788655][    T1] PTP clock support registered
> [  259.246358][    T1] EDAC MC: Ver: 3.0.0
>=20
> It seems like the performance of the system has been dramatically
> reduced, current mainline boots with the same kernel config show we're
> reaching that point after only 5s:
>=20
> [    5.577047][    T1] PTP clock support registered
> [    5.585556][    T1] EDAC MC: Ver: 3.0.0
>=20
> and getting to a prompt after a bit over a minute which is much more
> viable.

Thanks for the report

It might be related to https://lore.kernel.org/linux-clk/0acc7217-762c-7c0d=
-45a0-55c384824ce4@samsung.com/

I've sent a series that might address this issue:
https://lore.kernel.org/linux-clk/20221010-rpi-clk-fixes-again-v1-0-d87ba82=
ac404@cerno.tech/

Let me know if it fixes things for you

Maxime

--2ri6brd6tzvydgrd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY0QxIgAKCRDj7w1vZxhR
xVqTAQDlOPyzVA0FDeBqQPsbo2lgUtItcYX65tyghjRd1OYmFQEAsHhx/P90gzRu
STX1i1/UWS2bUf8sKMEkkup5Wo0KKAk=
=pj7j
-----END PGP SIGNATURE-----

--2ri6brd6tzvydgrd--
