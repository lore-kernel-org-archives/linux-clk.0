Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA9EC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 11 Oct 2022 03:43:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbiJKDn3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Oct 2022 23:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbiJKDnX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Oct 2022 23:43:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D8F7C756;
        Mon, 10 Oct 2022 20:43:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6780CB811DC;
        Tue, 11 Oct 2022 03:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19207C433C1;
        Tue, 11 Oct 2022 03:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665459800;
        bh=bxa0HrQkzuVZ51l2hFXD2hZgY4L8PLAznrhILi/Wcek=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=q/a0ZeDTowmyvsW3FarZq4eYMZn+FFNL0MSsH0WVferqYNKHpdtfXUVve78UyP3G6
         YimLNz/AWNX5FEyT/8epD3bcUNf8zPyshZGuxkGfBl4V8kob762C3UWYOGOOC7T2jB
         yAO3JeqoFUil0CeiFK4M9TJqTC219+FXz2w9V57eM8trnCcGjNNtz6RDdDUm//Q/JF
         d1NPP2Y12KQKcbm7ZaTbx7ZRWUye53MooKHDYcJJTR+IBN8AxRwCWATeNiCq0NUFFn
         F+oe5SkSa8DzMN0u0L2a9A/XRNHY8atI+TkRAyILbhQ8kyugULfZvSHHcVxvNX4maX
         p8XZrBmuuwlbQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221010-rpi-clk-fixes-again-v1-1-d87ba82ac404@cerno.tech>
References: <20221010-rpi-clk-fixes-again-v1-0-d87ba82ac404@cerno.tech> <20221010-rpi-clk-fixes-again-v1-1-d87ba82ac404@cerno.tech>
Subject: Re: [PATCH 1/2] clk: Update req_rate on __clk_recalc_rates()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 10 Oct 2022 20:43:18 -0700
User-Agent: alot/0.10
Message-Id: <20221011034320.19207C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-10-10 07:47:38)
> Commit cb1b1dd96241 ("clk: Set req_rate on reparenting") introduced a
> new function, clk_core_update_orphan_child_rates(), that updates the
> req_rate field on reparenting.
>=20
> It turns out that that function will interfere with the clock notifying
> done by __clk_recalc_rates(). This ends up reporting the new rate in
> both the old_rate and new_rate fields of struct clk_notifier_data.
>=20
> Since clk_core_update_orphan_child_rates() is basically
> __clk_recalc_rates() without the notifiers, and with the req_rate field
> update, we can drop clk_core_update_orphan_child_rates() entirely, and
> make __clk_recalc_rates() update req_rate.
>=20
> However, __clk_recalc_rates() is being called in several code paths:
> when retrieving a rate (most likely through clk_get_rate()), when changing
> parents (through clk_set_rate() or clk_hw_reparent()), or when updating
> the orphan status (through clk_core_reparent_orphans_nolock(), called at
> registration).
>=20
> Updating req_rate on reparenting or initialisation makes sense, but we
> shouldn't do it on clk_get_rate(). Thus an extra flag has been added to
> update or not req_rate depending on the context.
>=20
> Fixes: cb1b1dd96241 ("clk: Set req_rate on reparenting")
> Link: https://lore.kernel.org/linux-clk/0acc7217-762c-7c0d-45a0-55c384824=
ce4@samsung.com/
> Link: https://lore.kernel.org/linux-clk/Y0QNSx+ZgqKSvPOC@sirena.org.uk/
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reported-by: Mark Brown <broonie@kernel.org>
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Applied to clk-next
