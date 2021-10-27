Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0086FC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 27 Oct 2021 01:04:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D26DF60F92
	for <linux-clk@archiver.kernel.org>; Wed, 27 Oct 2021 01:04:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232410AbhJ0BHJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Oct 2021 21:07:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:53324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231916AbhJ0BHJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 Oct 2021 21:07:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6E8B6044F;
        Wed, 27 Oct 2021 01:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635296684;
        bh=h3QnYI4QuEO1g+mS2YM6Ddme2u+3Vi1yYQp93XN8Fh4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LC+kjEimaSnPfo0htITbTV9Ja3xfVHp5X6NxrKQMhV469i8+MSzZ7mqFksUFjfEJm
         CO8YuD8Rq7Pq1zbtK/DRFDy49teOYrCkn5Ysz2lqwg28D7k4gTVOFbDrXdKLBxI7/i
         Flm3Luidh7+xXDPiFUFRXclwYoLm4N/B50uFVVXdippZhW8Xc9HcT4gGQKUj+isVOE
         es9LfQuUBVgCyJUPs7jgQHOzbYxbqAnbamHFipHASWs67f4lBT104z3PP9MtjvX1aD
         fwaT3tPr+VK30YBxkM/fA9+sNH4G2FULpLDvib+7/EVWtCTE+W8JchfBMPej/Jp7Hd
         wXobHojh6hcZw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210921184803.1757916-1-linus.walleij@linaro.org>
References: <20210921184803.1757916-1-linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2 v3] dt-bindings: clock: u8500: Rewrite in YAML and extend
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 26 Oct 2021 18:04:43 -0700
Message-ID: <163529668347.15791.5359586615125882902@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2021-09-21 11:48:02)
> This rewrites the ux500/u8500 clock bindings in YAML schema and extends t=
hem
> with the PRCC reset controller.
>=20
> The bindings are a bit idiomatic but it just reflects their age, the ux500
> platform was used as guinea pig for early device tree conversion of platf=
orms
> in 2015. The new subnode for the reset controller follows the pattern of =
the
> old bindings and adds a node with reset-cells for this.
>=20
> Cc: devicetree@vger.kernel.org
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-next
