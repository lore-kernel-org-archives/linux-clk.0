Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F0BC76196
	for <linux-clk@archiver.kernel.org>; Sun,  2 Apr 2023 14:31:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbjDBOby (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 Apr 2023 10:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230478AbjDBObt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 Apr 2023 10:31:49 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C01526260;
        Sun,  2 Apr 2023 07:31:26 -0700 (PDT)
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1piyjo-0000D5-8B; Sun, 02 Apr 2023 16:31:20 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     mturquette@baylibre.com, sboyd@kernel.org, abelvesa@kernel.org,
        peng.fan@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v2 1/4] clk: Compute masks for fractional_divider clk when needed.
Date:   Sun, 02 Apr 2023 16:29:39 +0200
Message-ID: <2636550.q0ZmV6gNhb@diego>
In-Reply-To: <0fd6357242c974259c9e034c6e28a0391c480bf0.1680423909.git.christophe.jaillet@wanadoo.fr>
References: <cover.1680423909.git.christophe.jaillet@wanadoo.fr>
 <0fd6357242c974259c9e034c6e28a0391c480bf0.1680423909.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Sonntag, 2. April 2023, 11:42:04 CEST schrieb Christophe JAILLET:
> There is no real need to pre-compute mmask and nmask when handling
> fractional_divider clk.
> 
> They can be computed when needed.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


