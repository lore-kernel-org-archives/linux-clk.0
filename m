Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E859C4361B
	for <linux-clk@archiver.kernel.org>; Sat, 19 Dec 2020 23:51:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60F9123602
	for <linux-clk@archiver.kernel.org>; Sat, 19 Dec 2020 23:51:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbgLSXuv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Dec 2020 18:50:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:36290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726802AbgLSXuv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 19 Dec 2020 18:50:51 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608421810;
        bh=OnVTxRHiIpiS3AunEzq0PeGVf63FpzZxdOlsmlQfjBE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=t7qxJUi1SNL++dDGMUGlWte/eq5JYa/kZiE3x3ZVHKmlsGI8xZGmnYWNzZleywZyA
         npZHG9bquQGStJc/TQGlmgxJokJHb4bAO4DrpsejKIfs+w7F3o5rvM2fRaFPHs+3f4
         fRisrVqhXcL3EOOg1aKf6/AMKWMAve8KNqHgnXr4VG3bW3qtVGnuN5GykgAdnn3MFa
         YMQPPKjErB7oV/fH60K4v+xjfThKHybt4hr4WDtW4UqYpSJK45zs+pLg2y5QAbywEd
         QywG0TOX1opMC8JWrgGsW/rRE75W6UX1XDKw9mC/3mmJ1Z1G3lqLDT+f0D9iBOX1tm
         eAaSjAIjbYpKg==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201130091033.1687-1-s.hauer@pengutronix.de>
References: <20201130091033.1687-1-s.hauer@pengutronix.de>
Subject: Re: [PATCH resend] clk: si5351: Wait for bit clear after PLL reset
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>
To:     Sascha Hauer <s.hauer@pengutronix.de>, linux-clk@vger.kernel.org
Date:   Sat, 19 Dec 2020 15:50:09 -0800
Message-ID: <160842180913.1580929.4780279179860483552@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sascha Hauer (2020-11-30 01:10:33)
> Documentation states that SI5351_PLL_RESET_B and SI5351_PLL_RESET_A bits
> are self clearing bits, so wait until they are cleared before
> continuing.
> This fixes a case when the clock doesn't come up properly after a PLL
> reset. It worked properly when the frequency was below 900MHz, but with
> 900MHz it only works when we are waiting for the bit to clear.
>=20
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---

Applied to clk-next
