Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C36DC7EE2E
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 01:17:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjFMBRE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 21:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjFMBRE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 21:17:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AFD410E2
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 18:17:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3329D61EFA
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 01:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D7FC433EF;
        Tue, 13 Jun 2023 01:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686619021;
        bh=7SzDyHgSvLs9hAyeoHGMI9HnRp1QzeqiDLrMooyir4w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=F5PMyAY7YaMkPxGHijQUFkb1H6D+NVbsG8udS554vetRuMFQYFsZpA83LUgvZEqRV
         10FHhhJaqnQsg5o2BrmtvnvoOQN4TV+w+GEmy3g5Eczis71Ib2At4cNW6C2VuoMpKM
         U9A8Si1bf+66lS6fTdi7iLBVAhrZb4gXSfi0Lkt55F7fSr7v4lTk5gJgbUm7mUJEko
         Ck0ud3q+H6Y+cKUPxaV47nEGhMVr4nhJuI2pROUFxJz0ce5FRxjSLH0Ohz1vvazcih
         Uj4iI1a6GRo7AvXnFt8Va9lJjE8NL25E8bHe2Kw1+a89K1KTYVph1/G9r2LiaiS/4M
         i1Iq/RqC+DBNw==
Message-ID: <96f6fe9fe5e7cc7e2bbeb652c0bf0c51.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230526060955.1130253-1-u.kleine-koenig@pengutronix.de>
References: <20230526060955.1130253-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] clk: si521xx: Switch i2c driver back to use .probe()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de
To:     Michael Turquette <mturquette@baylibre.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Mon, 12 Jun 2023 18:16:59 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2023-05-25 23:09:55)
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
> convert back to (the new) .probe() to be able to eventually drop
> .probe_new() from struct i2c_driver.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next
