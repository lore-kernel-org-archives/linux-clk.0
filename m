Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB7AC7619A
	for <linux-clk@archiver.kernel.org>; Wed,  5 Apr 2023 19:13:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234485AbjDETNR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Apr 2023 15:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234448AbjDETNP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Apr 2023 15:13:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B863C4EE8;
        Wed,  5 Apr 2023 12:13:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 38CB562AED;
        Wed,  5 Apr 2023 19:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944D4C4339C;
        Wed,  5 Apr 2023 19:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680721992;
        bh=g7YM6++deJJ1OVDShMe3rsNwkCW83YRBl4vJieZdUCY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rQv93tAAdfe032Ci5oj4n+5Jaap71RV6OuYnH92ZGdIwyu84R1zY7KY9Ev7sQqGB+
         7d24pSgGWbu0lwCLiYjEei3qh6ZUUTYT+txsTM3sqWc1+fQ+Ez6/pN5OxI2yTiE9AD
         VSTPLYu2np21SZbd4MvsHSHFkiKg0WyzIm7FXrHuE4w/HNcHIpPjNumCJwA48Q6ZEu
         3y+ErvubNKMVKFdWcFMXHFKtIjPYOqG2PWmpTctxhbst/956SpWuTXVwijT0jVcvNx
         4eV8Rp0S/RRf1fb/PKcbKLYYOnTmnPRp8l+mZSEvJ0yGQzF+WjVYiWom3VCXjqW+5l
         rS+fdocoMV7ag==
Message-ID: <eb9db30505b469e44ffbc98bcfccdb85.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0fd6357242c974259c9e034c6e28a0391c480bf0.1680423909.git.christophe.jaillet@wanadoo.fr>
References: <cover.1680423909.git.christophe.jaillet@wanadoo.fr> <0fd6357242c974259c9e034c6e28a0391c480bf0.1680423909.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v2 1/4] clk: Compute masks for fractional_divider clk when needed.
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        abelvesa@kernel.org, festevam@gmail.com, heiko@sntech.de,
        kernel@pengutronix.de, linux-imx@nxp.com, mturquette@baylibre.com,
        peng.fan@nxp.com, s.hauer@pengutronix.de, shawnguo@kernel.org
Date:   Wed, 05 Apr 2023 12:13:10 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Christophe JAILLET (2023-04-02 02:42:04)
> There is no real need to pre-compute mmask and nmask when handling
> fractional_divider clk.
>=20
> They can be computed when needed.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied to clk-next
