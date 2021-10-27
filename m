Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF28C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 27 Oct 2021 01:04:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C124C60FBF
	for <linux-clk@archiver.kernel.org>; Wed, 27 Oct 2021 01:04:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236578AbhJ0BHP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Oct 2021 21:07:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:53418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231916AbhJ0BHP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 Oct 2021 21:07:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C0A860F90;
        Wed, 27 Oct 2021 01:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635296690;
        bh=x0d6FSk92FAoqcWO55VPl0N19ahbIjJvAOEh8KoqoGI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=S7VLrU6Zlz6X913QMx6osGA5yx+xpkRsvA6Nem/fSLfKPiPHuhjZkM0xYxnb7j/j5
         fkpXZkIJa67RV/i6o6cT/fG+gqihXkr6wfod5LZt2ULjG5lrWevdSeUaHydfQni2d4
         K/aQBK8gKY+TQMXjn2xNzJvZAGBc18YDMYP57z/3fwKZojR20zXlAjnJvcgJu0yePv
         pDwQAtmRVjph8Bb6lzzwjk8vezi+VoUm+IXfKDrYkTb7n8zQVOAN2mzEyBPGMFrgET
         nZ1T/aYpxZBSEUK44r74o6FSJHwJj06RW5zR+4sD9YIgQhZtrnK2OAN/ecU1OC4dI0
         7KXclh/6uJINQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210921184803.1757916-2-linus.walleij@linaro.org>
References: <20210921184803.1757916-1-linus.walleij@linaro.org> <20210921184803.1757916-2-linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2 v3] clk: ux500: Add driver for the reset portions of PRCC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 26 Oct 2021 18:04:49 -0700
Message-ID: <163529668940.15791.10131506168217550612@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2021-09-21 11:48:03)
> The Ux500 PRCC (peripheral reset and clock controller) can also
> control reset of the IP blocks, not just clocks. As the PRCC is probed
> as a clock controller and we have other platforms implementing combined
> clock and reset controllers, follow this pattern and implement the PRCC
> rest controller as part of the clock driver.
>=20
> The reset controller needs to be selected from the machine as Ux500 has
> traditionally selected its mandatory subsystem prerequisites from there.
>=20
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-next
