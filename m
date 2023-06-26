Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704A1EB64DA
	for <linux-clk@archiver.kernel.org>; Mon, 26 Jun 2023 10:58:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbjFZK6R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Jun 2023 06:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbjFZK6N (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jun 2023 06:58:13 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2208E5;
        Mon, 26 Jun 2023 03:58:05 -0700 (PDT)
Received: from [185.109.152.99] (helo=phil.sntech)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1qDjus-0000At-Fh; Mon, 26 Jun 2023 12:57:54 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     linux-rockchip@lists.infradead.org,
        Alibek Omarov <a1ba.omarov@gmail.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: rk3568: Add PLL rate for 101MHz
Date:   Mon, 26 Jun 2023 12:57:36 +0200
Message-Id: <168777705004.859243.10620399650392356181.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230614134716.1055862-1-a1ba.omarov@gmail.com>
References: <20230614134716.1055862-1-a1ba.omarov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 14 Jun 2023 16:47:16 +0300, Alibek Omarov wrote:
> This patch adds PLL setting for not so common resolution as 1920x720-50.00,
> which can be set using 2500 horizontal signals and 808 vertical.
> 
> 

Applied, thanks!

[1/1] clk: rockchip: rk3568: Add PLL rate for 101MHz
      commit: 294580c9b921946f0f6b964326ccbf2d1cd78f7a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
