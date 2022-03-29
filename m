Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E06EC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 29 Mar 2022 18:36:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233791AbiC2SiI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Mar 2022 14:38:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239098AbiC2SiH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Mar 2022 14:38:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D834149256
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 11:36:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B3A6C615E8
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 18:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA63C340ED;
        Tue, 29 Mar 2022 18:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648578982;
        bh=AnH8MP08QutuRCP888O90BHOE4sdqIl4fDN7zQzWQRk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Jdh7P5PenES8gh43B5oOqr7+NDU6WOMZqIdzRK8AT3UkA+iEWObrCNQelp2HIqi6b
         mAJxAlYEkl8Ik9pGlTQIlDFkPBRzWNB6d3MgBSOUi2PGwCLKNHj3FBi9yWgZJpfK3c
         aDYNm8Nt2n1C9izwDcK0LOlvOFzjOmGckMdVGwdh0j/hlIi+6wlAtHiaz/vk8kvdKY
         wTWlDqGhzFSsiY6ecS98jcA+wNJOnVjSw+06GrB9N0H17mPLrU6wxVV/7YQGfJiABK
         JzYgWLCe49QPW9h8zqNbD8EDk7rJilUUML9b4gBqPj3RkRU72J7Pj1TCadqBRAMa2w
         EvJGOP1yZf9Og==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220325161144.1901695-2-maxime@cerno.tech>
References: <20220325161144.1901695-1-maxime@cerno.tech> <20220325161144.1901695-2-maxime@cerno.tech>
Subject: Re: [PATCH v2 1/3] clk: Initialize orphan req_rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Tue, 29 Mar 2022 11:36:19 -0700
User-Agent: alot/0.10
Message-Id: <20220329183621.EAA63C340ED@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-03-25 09:11:42)
> When registering a clock that doesn't have a recalc_rate implementation,
> and doesn't have its parent registered yet, we initialize the clk_core
> rate and req_rate fields to 0.
>=20
> The rate field is later updated when the parent is registered in
> clk_core_reparent_orphans_nolock() using __clk_recalc_rates(), but the
> req_rate field is never updated.
>=20
> This leads to an issue in clk_set_rate_range() and clk_put(), since
> those functions will call clk_set_rate with the content of req_rate to
> provide drivers with the opportunity to change the rate based on the new
> boundaries. In this case, we would call clk_set_rate() with a rate of 0,
> effectively enforcing the minimum allowed for this clock whenever we
> would call one of those two functions, even though the actual rate might
> be within range.
>=20
> Let's fix this by setting req_rate in clk_core_reparent_orphans_nolock()
> with the rate field content just updated by the call to
> __clk_recalc_rates().
>=20
> Fixes: 1c8e600440c7 ("clk: Add rate constraints to clocks")
> Reported-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com> # T30 Nexus7
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Applied to clk-next
