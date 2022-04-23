Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FFFC433EF
	for <linux-clk@archiver.kernel.org>; Sat, 23 Apr 2022 04:03:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbiDWEFx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Apr 2022 00:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232700AbiDWEFw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Apr 2022 00:05:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8A11E1DEC
        for <linux-clk@vger.kernel.org>; Fri, 22 Apr 2022 21:02:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 184AD61D3F
        for <linux-clk@vger.kernel.org>; Sat, 23 Apr 2022 04:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648EFC385A9;
        Sat, 23 Apr 2022 04:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650686570;
        bh=EaealstA6xcVL/byEnpL9K0FRngWXVIiZ7ZmOk+eQgU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uzSqnnzHP15Fgw67h1bceREc/sZEjANz8E74A3vx/fopdZAAY3OdKt82yj3wEzJhW
         ANRww7AkQvdpENGn3ZO5jtAOFoTtCR5QxLQvWMj4QaNM9+/ORLUrQbB7GBOwYglHQ3
         0QjgsEF5EkLmSzNskrC9GLFm5/VUtvGGZ4DUFI6r6vBEKsKmVdORLltyUAr5RNnSi9
         FrHFq9kwxtTvgDkdqhFsEp5aVsSqHuJPqv/O3miTCad9VELuhDOW/6OWxWaIXPp99x
         Yf4pY24hES1HWmC5aL5qCi28oyBNfLPUVnZfAHjqSef+wp4hU71Y/R2eDLnCFHIOHY
         Ebf7wFZEXNEhw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220408091037.2041955-17-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech> <20220408091037.2041955-17-maxime@cerno.tech>
Subject: Re: [PATCH 16/22] clk: Remove redundant clk_core_init_rate_req() call
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Fri, 22 Apr 2022 21:02:48 -0700
User-Agent: alot/0.10
Message-Id: <20220423040250.648EFC385A9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-04-08 02:10:31)
> Since all the users of clk_core_round_rate_nolock() will now properly
> initialize, there's no need for it to initialize the request itself.

Probably this needs to be combined with the previous patch.

>=20
> This is even dangerous, as if the clock cannot change its rate by itself
> and has CLK_SET_RATE_PARENT, clk_core_round_rate_nolock() will call
> itself with the parent clock but the client clk_rate_request structure.
>=20

I think the next sentence is part of the single sentence paragraph
above.

> We will then reinitialize the child request with the parent context
> (parent, boundaries, etc.), which is an issue if the parent ever changes
> its own parent or parent rate.

The parent of the parent can't be the parent of the child, i.e. itself.
I guess this is only a problem if clk_core_init_rate_req() starts
setting min/max? We want to leave those members unchanged so that the
rate request can flow up through the tree and be modified when rounding
rates from a grandchild. That's why the child req is passed up to the
parent if the child can't round itself. The boundary of the child is
moved to the parent.

Definitely the rate should be clamped through a parent to the
grandparent taking into account any of their constraints. Perhaps the
bug is that __clk_determine_rate() doesn't clamp to boundaries like
clk_hw_round_rate() does by calling clk_core_get_boundaries() and then
mixing in the new requests boundaries.
