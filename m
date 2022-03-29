Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D13C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 29 Mar 2022 18:36:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236831AbiC2SiT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Mar 2022 14:38:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239098AbiC2SiS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Mar 2022 14:38:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF2C149256
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 11:36:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D1836615AB
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 18:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C2DC2BBE4;
        Tue, 29 Mar 2022 18:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648578994;
        bh=co1fKkv//lGfDS+oBrPiKgkY8CLEI1s1T1nAftpKtYg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CejQ9oqZWnEBSihzCuShDOHOMBINovx0SS7qxT3kNvK5bgdUtIc8JUfO7AoHDVmbX
         lxPEszf59U16zn48W6akylLlwyOPLTo51UMfeGLxPu286+3/7S22XYGLmT9q8MAP3I
         rgHHvY+HYWIuHd2omcd8gmBdVvkZJwJPpTb0B/lAy34Y2uzrr9vldWng2yNrj20t3M
         YTqanGpHByW4uQrBdqXYYB38sVUq178XSUDb0omzrBAsEQMxikZjvaMhvL+dVMfIto
         3inoqOtc0SFzVn4/Sya8hUJnOOryH0IU8+4XlnJpHxEAKP3p946yMJmFYMhkmiOh7G
         YRHA6HI6rPwbg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220325161144.1901695-3-maxime@cerno.tech>
References: <20220325161144.1901695-1-maxime@cerno.tech> <20220325161144.1901695-3-maxime@cerno.tech>
Subject: Re: [PATCH v2 2/3] clk: test: Test clk_set_rate_range on orphan mux
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Tue, 29 Mar 2022 11:36:32 -0700
User-Agent: alot/0.10
Message-Id: <20220329183634.34C2DC2BBE4@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-03-25 09:11:43)
> A bug recently affected the Tegra30 where calling clk_set_rate_range()
> on a clock would make it change its rate to the minimum.
>=20
> This was due to the clock in question being a mux that was orphan at
> registration, which lead to the clk_core req_rate being 0, and the
> clk_set_rate_range() function then calling clk_set_rate() with req_rate,
> effectively making that clock running at the minimum rate allowed, even
> though the initial rate was within that range.
>=20
> Make a test suite to create a mux initially orphan, and then make sure
> that if our clock rate was initially within a given range, then
> enforcing that range won't affect it.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Applied to clk-next
