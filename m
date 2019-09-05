Return-Path: <SRS0=zpb1=XA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54854C3A5A5
	for <linux-clk@archiver.kernel.org>; Thu,  5 Sep 2019 12:25:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 290A62184B
	for <linux-clk@archiver.kernel.org>; Thu,  5 Sep 2019 12:25:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731732AbfIEMZR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Sep 2019 08:25:17 -0400
Received: from gloria.sntech.de ([185.11.138.130]:40318 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731294AbfIEMZR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 5 Sep 2019 08:25:17 -0400
Received: from wf0413.dip.tu-dresden.de ([141.76.181.157] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1i5qp9-0003t7-6a; Thu, 05 Sep 2019 14:25:15 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock updates for 5.4
Date:   Thu, 05 Sep 2019 14:25:14 +0200
Message-ID: <1787421.rStINWtZbh@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

please find below rockchip clock changes for 5.4

Please pull

Thanks
Heiko


The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.4-rockchip-clk1

for you to fetch changes up to ac68dfd3c4836bb2636fd37f3e075ed218afdb2b:

  clk: rockchip: Add clock controller for the rk3308 (2019-09-05 12:43:39 +0200)

----------------------------------------------------------------
Removal of an unused variable vom rv1108 and addition of
clock driver for rk3308 arm64 soc.

----------------------------------------------------------------
Finley Xiao (3):
      dt-bindings: Add bindings for rk3308 clock controller
      clk: rockchip: Add dt-binding header for rk3308
      clk: rockchip: Add clock controller for the rk3308

Nathan Huckleberry (1):
      clk: rockchip: Fix -Wunused-const-variable in rv1108 clk driver

 .../bindings/clock/rockchip,rk3308-cru.txt         |  60 ++
 drivers/clk/rockchip/Makefile                      |   1 +
 drivers/clk/rockchip/clk-rk3308.c                  | 955 +++++++++++++++++++++
 drivers/clk/rockchip/clk-rv1108.c                  |   1 -
 drivers/clk/rockchip/clk.h                         |  13 +
 include/dt-bindings/clock/rk3308-cru.h             | 387 +++++++++
 6 files changed, 1416 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3308-cru.txt
 create mode 100644 drivers/clk/rockchip/clk-rk3308.c
 create mode 100644 include/dt-bindings/clock/rk3308-cru.h



