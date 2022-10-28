Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D615ECAAA1
	for <linux-clk@archiver.kernel.org>; Fri, 28 Oct 2022 00:06:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiJ1AGn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 20:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbiJ1AGl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 20:06:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B56EA79638;
        Thu, 27 Oct 2022 17:06:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4F07E6248B;
        Fri, 28 Oct 2022 00:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2BAC433B5;
        Fri, 28 Oct 2022 00:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666915599;
        bh=jx0BSCw6+jHyj/GIl4C+B8mB3o5ImwoK8edY4LEBpVM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GLUVOAiASoopt2C5HovDBuvNk58ohZc8ruDa4jC5ecG166JLuijUKJJm1eFLGxhZx
         l/sIHDr1otR9RBjJksk8ODELeTiHaSxY0rOmlGzePeGLd9QtULeRRYdXH4WwxzmN55
         n3SH3+cEEviu2IAcVsxj6JHWJnaxqcfYI6LVrBLyNL0FtkskccItbufinu7hb1o8X1
         yTsjrJBkYC7lrnnPMHD8BFQ6p7kxr0QFaZ9Xs9Hhf5IzP2mGuv92BZnv9TAU5ldWyv
         dXMpO5rS5PrXyc2G25wAyKEAZiOffYEw72GmpY4GDnuDwP02Wf67FSaP050CFwq9AV
         PZOjNEcdb5WGA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221018-clk-range-checks-fixes-v1-1-f3ef80518140@cerno.tech>
References: <20221018-clk-range-checks-fixes-v1-0-f3ef80518140@cerno.tech> <20221018-clk-range-checks-fixes-v1-1-f3ef80518140@cerno.tech>
Subject: Re: [PATCH 1/4] clk: Remove WARN_ON NULL parent in clk_core_init_rate_req()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Maxime Ripard <maxime@cerno.tech>, linux-clk@vger.kernel.org
To:     Maxime Ripard <maxime@cerno.tech>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 27 Oct 2022 17:06:37 -0700
User-Agent: alot/0.10
Message-Id: <20221028000639.9E2BAC433B5@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-10-18 06:52:56)
> If a clock has CLK_SET_RATE_PARENT, but core->parent is NULL (most
> likely because it's orphan), callers of clk_core_init_rate_req() will
> blindly call this function leading to a very verbose warning.
>=20
> Since it's a fairly common situation, let's just remove the WARN_ON but
> keep the check that prevents us from dereferencing the pointer.
>=20
> Interestingly, it fixes a regression on the Mediatek MT8195 where the
> GPU would stall during a clk_set_rate for its main clock. We couldn't
> come up with a proper explanation since the condition is essentially the
> same.
>=20
> It was then assumed that it could be timing related since printing the
> warning stacktrace takes a while, but we couldn't replicate the failure
> by using fairly large (10ms) mdelays.
>=20
> Fixes: 262ca38f4b6e ("clk: Stop forwarding clk_rate_requests to the paren=
t")
> Reported-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Applied to clk-fixes
