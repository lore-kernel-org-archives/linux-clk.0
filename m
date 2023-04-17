Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3ECC77B72
	for <linux-clk@archiver.kernel.org>; Mon, 17 Apr 2023 23:18:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjDQXSV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Apr 2023 19:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjDQXST (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Apr 2023 19:18:19 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A8ED448B;
        Mon, 17 Apr 2023 16:18:15 -0700 (PDT)
Received: from [77.22.52.211] (helo=phil.lan)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1poY6o-0007Ri-7z; Tue, 18 Apr 2023 01:18:06 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-rockchip@lists.infradead.org
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        kernel@collabora.com, Peter Geis <pgwipeout@gmail.com>,
        Finley Xiao <finley.xiao@rock-chips.com>,
        Stephen Boyd <sboyd@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
        linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCHv2 0/2] Improve RK3588 clocks and power domains support
Date:   Tue, 18 Apr 2023 01:18:04 +0200
Message-Id: <168177346834.4012366.5864006914556584984.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230403193250.108693-1-sebastian.reichel@collabora.com>
References: <20230403193250.108693-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 3 Apr 2023 21:32:48 +0200, Sebastian Reichel wrote:
> After this patchset the power-domain support for RK3588 is basically on par
> with the downstream implementation. More importantly the clock controller
> change unblocks support for any IP blocks using linked clocks. The clock
> controller change must be applied before the power-domain change to avoid
> accessing unclocked registers.
> 
> Changes since PATCHv1:
>  * https://lore.kernel.org/all/20230331163058.5688-1-sebastian.reichel@collabora.com/
>  * Replace dsb(sy) with wmb() to fix COMPILE_TEST build on !arm64; direct replacement
>    would be mb(), but write memory barrier should be enough here as far as I can tell
>  * Added Tested-by from Vincent Legoll
> 
> [...]

Applied, thanks!

[1/2] clk: rockchip: rk3588: make gate linked clocks ignore unused
      commit: 64042c28c3bb6729df8e2fda89bc7ebbe3790907

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
