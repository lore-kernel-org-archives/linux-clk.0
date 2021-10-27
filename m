Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DCAC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 27 Oct 2021 13:26:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EAD7610A0
	for <linux-clk@archiver.kernel.org>; Wed, 27 Oct 2021 13:26:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235285AbhJ0N2u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Oct 2021 09:28:50 -0400
Received: from gloria.sntech.de ([185.11.138.130]:46572 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229585AbhJ0N2u (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 27 Oct 2021 09:28:50 -0400
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mfiwe-0003TD-TQ; Wed, 27 Oct 2021 15:26:20 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     linux-rockchip@lists.infradead.org
Cc:     sboyd@kernel.org, kernel@esmil.dk, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, heiko@sntech.de
Subject: [PATCH 0/2] clk: rockchip: cleanup errors in (module-)driver handling
Date:   Wed, 27 Oct 2021 15:26:14 +0200
Message-Id: <20211027132616.1039814-1-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Recent conversions or inclusions of rk3399 and rk3568 as platform-drivers
and subsequently allowing them to be built as modules introduced some
problems.

These two patches try to correct them.

Heiko Stuebner (2):
  Revert "clk: rockchip: use module_platform_driver_probe"
  clk: rockchip: drop module parts from rk3399 and rk3568 drivers

 drivers/clk/rockchip/Kconfig      | 4 ++--
 drivers/clk/rockchip/clk-rk3399.c | 6 +-----
 drivers/clk/rockchip/clk-rk3568.c | 6 +-----
 3 files changed, 4 insertions(+), 12 deletions(-)

-- 
2.30.2

