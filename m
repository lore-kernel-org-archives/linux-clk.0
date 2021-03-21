Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EBD4C433E0
	for <linux-clk@archiver.kernel.org>; Sun, 21 Mar 2021 20:15:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D47C261947
	for <linux-clk@archiver.kernel.org>; Sun, 21 Mar 2021 20:15:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbhCUUPA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 21 Mar 2021 16:15:00 -0400
Received: from gloria.sntech.de ([185.11.138.130]:43662 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230512AbhCUUOq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 21 Mar 2021 16:14:46 -0400
Received: from p508fc3a3.dip0.t-ipconnect.de ([80.143.195.163] helo=phil.fritz.box)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lO4T7-0007Oi-L3; Sun, 21 Mar 2021 21:14:37 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     linux-rockchip@lists.infradead.org, sboyd@kernel.org,
        zhangqing@rock-chips.com, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Subject: Re: [PATCH 1/2] clk: rockchip: drop parenthesis from ARM || COMPILE_TEST depends
Date:   Sun, 21 Mar 2021 21:14:30 +0100
Message-Id: <161635763247.767241.6758144246841811873.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210315112502.343699-1-heiko@sntech.de>
References: <20210315112502.343699-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 15 Mar 2021 12:25:01 +0100, Heiko Stuebner wrote:
> As suggested by Stephen in the series adding the rk3568 clock controller
> the depends works just as well without the parenthesis around the depends.
> 
> So to make everything look the same, drop them from existing entries too.

Applied, thanks!

[1/2] clk: rockchip: drop parenthesis from ARM || COMPILE_TEST depends
      commit: e8c51b90f22031bf3f24d1f06d23bafac250bb62
[2/2] clk: rockchip: drop MODULE_ALIAS from rk3399 clock controller
      commit: 40f29839d8bef5aecaa772afa8e5f2ff8434b49f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
