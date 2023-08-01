Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD694C0015E
	for <linux-clk@archiver.kernel.org>; Tue,  1 Aug 2023 20:36:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbjHAUg7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Aug 2023 16:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjHAUg5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Aug 2023 16:36:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F23852101
        for <linux-clk@vger.kernel.org>; Tue,  1 Aug 2023 13:36:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 80C2E616D4
        for <linux-clk@vger.kernel.org>; Tue,  1 Aug 2023 20:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8AEDC433CA;
        Tue,  1 Aug 2023 20:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690922215;
        bh=C3Q3fpNul09zgv9Lt6WpMg8m6tEKp9nwXBI/SgNW4ck=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=X+WmOvEgmUvBmnsWOGqaQHxod1LrsbDcWgVLYNdNj7AYGqDwTOGQKgKoYRU136Zsx
         kLgzEsLhgp/usDhedMH82EVS9YYuIRUf0hV2ylrfWBYCjOuYi/PkMmBQQ5Ks1maXd2
         lZlYt6JRW+SI4/0KNRR6Y7I93iGHv7+NGWQhH57WlYW7gSxpt7ct5gNSzB0QsuiOdL
         Zol4BzN7gTWEeQAYZgxoxhytJxvNlg3l4XwG0WUCgf3mEMujUQfPiLfxbCc/2EEki7
         ZRTHCD5IMf7qlV3H4y9OTPxZ2Vrh3rxBFefwiT3HyMVMT0LCuyeEnIyOGgcAyVBuAm
         8aEeMsfLOCM1A==
Message-ID: <8822a688a478a8b2812c52abeee7321b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230721071846.111663-1-u.kleine-koenig@pengutronix.de>
References: <20230721071846.111663-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] clk: versaclock3: Switch to use i2c_driver's probe callback
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
        kernel@pengutronix.de
To:     Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date:   Tue, 01 Aug 2023 13:36:53 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2023-07-21 00:18:46)
> The previous mass switch of clk drivers done in commit 62279db5a323
> ("clk: Switch i2c drivers back to use .probe()") was based on v6.4-rc1
> Since then this driver was added which needs to be converted back in the
> same way before eventually .probe_new() can be dropped from struct
> i2c_driver.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next
