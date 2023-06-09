Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AD6C7EE29
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jun 2023 01:42:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbjFIBmC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jun 2023 21:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237849AbjFIBmB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jun 2023 21:42:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3C891FDF
        for <linux-clk@vger.kernel.org>; Thu,  8 Jun 2023 18:42:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A85D9652B0
        for <linux-clk@vger.kernel.org>; Fri,  9 Jun 2023 01:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B947C433D2;
        Fri,  9 Jun 2023 01:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686274919;
        bh=Blv6dPaNV6B5z253fACg5yaRsVMDky16HTaMjMq5h2M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tp61NcGHqi34JJPqm2VVuFxHS1g+lFB6wqXcyZsjHa9H1/+rPBH8dv2bzUPZYrfkr
         U4K4SDk8u6O3JNaN1ujINXjtsHfpoXOa9maO5LqhVwwpuS0Db0o+YC1yvKgaoAklGg
         WEmIG3S5w7Lx685S9mR/Oxg17BBnAa0KBoR82t4kTqPRZXgFhCqda6oKV4TvzSnyJu
         Aa7kguDSHWvfi6X9IlPH74dUfzVch4nkL1pa97f6ZMGyuu+X70ilGgvn8SxXl5X1Ox
         EJuTgkg2wpWmJt8exlBg97nJQeOeBkbdJc440Xtt2ZjqpZOQx7NERfbyIMBPSfWZWI
         V5hUybW+kVPJQ==
Message-ID: <e8a1f3244395dc707a1d741e2d166a7b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221018-clk-range-checks-fixes-v4-7-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech> <20221018-clk-range-checks-fixes-v4-7-971d5077e7d2@cerno.tech>
Subject: Re: [PATCH v4 07/68] clk: test: Add a determine_rate hook
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 08 Jun 2023 18:41:56 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2023-05-05 04:25:09)
> The single parent clock in our kunit tests implements a mux with a
> set_parent hook, but doesn't provide a determine_rate implementation.
>=20
> This is not entirely unexpected, since its whole purpose it to have a
> single parent. When determine_rate is missing, and since
> CLK_SET_RATE_PARENT is set for all its instances, the default behaviour
> of the framework will be to forward it to the current parent.
>=20
> This is totally fine as far as the tests are concerned, but we'll start
> to mandate a determine_rate implementation when set_parent is set, so
> let's fill it with __clk_mux_determine_rate() which will have the same
> behavior.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/clk_test.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index b3ed3b0e4c31..a154ec9d0111 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -104,6 +104,23 @@ static const struct clk_ops clk_dummy_minimize_rate_=
ops =3D {
>  };
> =20
>  static const struct clk_ops clk_dummy_single_parent_ops =3D {
> +       /*
> +        * FIXME: Even though we should probably be able to use

Are we ever going to fix this?

> +        * __clk_mux_determine_rate() here, if we use it and call
> +        * clk_round_rate() or clk_set_rate() with a rate lower than
> +        * what all the parents can provide, it will return -EINVAL.
> +        *
> +        * This is due to the fact that it has the undocumented
> +        * behaviour to always pick up the closest rate higher than the
> +        * requested rate. If we get something lower, it thus considers
> +        * that it's not acceptable and will return an error.
> +        *
> +        * It's somewhat inconsistent and creates a weird threshold
> +        * between rates above the parent rate which would be rounded to
> +        * what the parent can provide, but rates below will simply
> +        * return an error.
> +        */
> +       .determine_rate =3D __clk_mux_determine_rate_closest,
>         .set_parent =3D clk_dummy_single_set_parent,
>         .get_parent =3D clk_dummy_single_get_parent,
