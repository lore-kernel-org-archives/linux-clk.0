Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D5F5C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 18 Oct 2021 20:01:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57BD3610A1
	for <linux-clk@archiver.kernel.org>; Mon, 18 Oct 2021 20:01:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232159AbhJRUDT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Oct 2021 16:03:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:43038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230415AbhJRUDQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 18 Oct 2021 16:03:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07BF461038;
        Mon, 18 Oct 2021 20:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634587265;
        bh=ND4nONknV1sQlC0sVLhYSw9ZA+Ygnsc/erHXNn2DGi8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hFR3rzkRliqXOVanehUd81P7LznNLjcSTrsD7SlWNETqLkUqr+/fpa5I7GSIqK70O
         4nNNe/qAkGO6ZLFoVB/1OfJJw9rWuMrNAlox7cC9SS1Iy/YZiSfqjcktkjCZP4Fqvc
         jzLZZaSpKbdaXmYcz3/NK5v9Ao+8qgdd196+G0wlfY/MyzzjPEB7ZkhCqac8W//KmK
         9nmLLdT1DghcAD8kewbLsvkWSghXtz80WEDXEyyLJF1O1/ThOKWlVT7M9GeDnasZhX
         XHfW7e/1WEXtfp/Fb5O91CpStmGOd7wn6gPyHh5ARqQdFx1gKCAOhFevyL2brEWnw3
         aNZqMrnge2QVQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211016105022.303413-2-martin.blumenstingl@googlemail.com>
References: <20211016105022.303413-1-martin.blumenstingl@googlemail.com> <20211016105022.303413-2-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH clk-fixes v1 1/2] clk: composite: Also consider .determine_rate for rate + mux composites
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, knaerzche@gmail.com,
        mturquette@baylibre.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-clk@vger.kernel.org
Date:   Mon, 18 Oct 2021 13:01:03 -0700
Message-ID: <163458726377.1767887.8064107515338216758@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Martin Blumenstingl (2021-10-16 03:50:21)
> Commit 69a00fb3d69706 ("clk: divider: Implement and wire up
> .determine_rate by default") switches clk_divider_ops to implement
> .determine_rate by default. This breaks composite clocks with multiple
> parents because clk-composite.c does not use the special handling for
> mux + divider combinations anymore (that was restricted to rate clocks
> which only implement .round_rate, but not .determine_rate).
>=20
> Alex reports:
>   This breaks lot of clocks for Rockchip which intensively uses
>   composites,  i.e. those clocks will always stay at the initial parent,
>   which in some cases  is the XTAL clock and I strongly guess it is the
>   same for other platforms,  which use composite clocks having more than
>   one parent (e.g. mediatek, ti ...)
>=20
>   Example (RK3399)
>   clk_sdio is set (initialized) with XTAL (24 MHz) as parent in u-boot.
>   It will always stay at this parent, even if the mmc driver sets a rate
>   of  200 MHz (fails, as the nature of things), which should switch it
>   to   any of its possible parent PLLs defined in
>   mux_pll_src_cpll_gpll_npll_ppll_upll_24m_p (see clk-rk3399.c)  - which
>   never happens.
>=20
> Restore the original behavior by changing the priority of the conditions
> inside clk-composite.c. Now the special rate + mux case (with rate_ops
> having a .round_rate - which is still the case for the default
> clk_divider_ops) is preferred over rate_ops which have .determine_rate
> defined (and not further considering the mux).
>=20
> Fixes: 69a00fb3d69706 ("clk: divider: Implement and wire up .determine_ra=
te by default")
> Reported-by: Alex Bee <knaerzche@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---

Applied to clk-fixes
