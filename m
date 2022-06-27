Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E674C43334
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jun 2022 23:24:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241901AbiF0XYH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jun 2022 19:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237413AbiF0XYF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 19:24:05 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDCCD23169
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 16:24:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 2F588CE1412
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 23:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81710C34115;
        Mon, 27 Jun 2022 23:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656372241;
        bh=85r9R7R+0EgQGKeG2WuXCrWFlGzJPgl07GZmZn+q1f4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=d8/ZV3ipGMkdPTv7zcJjwauVwTyBfYdaYhuZoROaS8lW/T/vj6VkuAF1fnG5cJxEP
         idPEcEgTMnT3gXMpGLEEqMT1XURYdRKhUPEu2z0P5pNRQ/riC4GrXiWvGz+a0IpxO6
         upX5Q1xwGCRq+N88du9SQLc2/sC6kXTct4erqzlf96oRsDOlVx91r1iWayaTHz0oKQ
         WjVceMx28rb8G9OyWLKSoCs43dFZiOjJamM2ioBCGA1m+ctXy9xerfdRYUKumo/L+o
         GxiKleLwX3W7STlT9BrtBNqpW3uKXsuQxTQBN8FK37poCoVfc6Kayozp2Mk8fcT2gg
         P2MWtBS/LLHkQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220516132527.328190-4-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech> <20220516132527.328190-4-maxime@cerno.tech>
Subject: Re: [PATCH v5 03/28] clk: Introduce clk_get_rate_range()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Mon, 27 Jun 2022 16:23:59 -0700
User-Agent: alot/0.10
Message-Id: <20220627232401.81710C34115@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-05-16 06:25:02)
> With the recent introduction of clock drivers that will force their
> clock rate to either the minimum or maximum boundaries, it becomes
> harder for clock users to discover either boundary of their clock.
>=20
> Indeed, the best way to do that previously was to call clk_round_rate()
> on either 0 or ULONG_MAX and count on the driver to clamp the rate to
> the current boundary, but that won't work anymore.
>=20
> Since any other alternative (calling clk_set_rate_range() and looking at
> the returned value, calling clk_round_rate() still, or just doing
> nothing) depends on how the driver will behaves, we actually are
> punching a hole through the abstraction provided by the clock framework.
>=20
> In order to avoid any abstraction violation, let's create a bunch of
> accessors that will return the current minimum and maximum for a given
> clock.

Why does a clk consumer need to know the rate range? I don't see any
information in the commit text about that.
