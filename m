Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E3FC4332F
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 15:39:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbiI3PjF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 11:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbiI3PjE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 11:39:04 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 462CF1A0D26;
        Fri, 30 Sep 2022 08:39:03 -0700 (PDT)
Received: from jupiter.universe (dyndsl-091-096-057-200.ewe-ip-backbone.de [91.96.57.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 8750766022E9;
        Fri, 30 Sep 2022 16:39:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1664552341;
        bh=xIwabsaIowPHOkc7UXM9S9J+Zyzi42pHGnL8JPyUxHs=;
        h=From:To:Cc:Subject:Date:From;
        b=EFVHbz6pCL+JkEKmkwqaQmKhxpyq5uJnGVEy2bqGyvc7grGcjCMrxxGzj3nyVd8p3
         r4nUNEUcUhgcFwTvp4moJg7a2+eC5DP764oUYeQRHWjfE5EBxotgFA1XFc9z3wPO4I
         gWX3iNyMVTxUQ1LnY0EbCKATDvmLQPt8eUxMnQEfVrMJdYV185s/w0t35SqDXDbAh4
         aY6JukMCCU3e8iOyD2gg8ctIm1D3qxXvq7i91ezW7+PENme0WbYAvVDwhBktwazHwe
         RPcWnA50koWR/lYqYRnL0BYU88HoVB1sUX2NsD/P/t4CjZkhv9GPco/vaKFjGkZXbW
         wCs4iF0xkIsQA==
Received: by jupiter.universe (Postfix, from userid 1000)
        id F41D4480140; Fri, 30 Sep 2022 17:38:58 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        kernel@collabora.com
Subject: [PATCHv2 0/9] RK3588 Clock and Reset Support
Date:   Fri, 30 Sep 2022 17:38:48 +0200
Message-Id: <20220930153857.299396-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

This has been part of a bigger patchset adding basic rk3588 support.
Since that gets more and more out of hand, I'm now sending patches
for each subsystem as individual patchset.

Changes since PATCHv1:
 * https://lore.kernel.org/all/20220623160329.239501-1-sebastian.reichel@collabora.com/
 * split dt-binding header addition into its own patch (requested by Heiko)
 * split dt-binding header into clock and reset one (requested by Krzysztof)
 * use reset identifier instead of register offset (requested by Krzysztof)
  * (involves adding lookup table support to rockchip CRU reset code)
 * use linear, gapless clock identifier (requested by Krzysztof)
 * reword the DT binding description

Changes since PATCHv0:
 * https://lore.kernel.org/all/20220504213251.264819-1-sebastian.reichel@collabora.com/
 * Sync'd with latest downstream changes
 * Update bindings according to Rob's comments, except for license
   (no feedback from Rockchip)

-- Sebastian

Elaine Zhang (5):
  dt-bindings: clock: add rk3588 cru bindings
  clk: rockchip: add register offset of the cores select parent
  clk: rockchip: add pll type for RK3588
  clk: rockchip: clk-cpu: add mux setting for cpu change frequency
  clk: rockchip: add clock controller for the RK3588

Sebastian Reichel (4):
  dt-bindings: clock: add rk3588 clock definitions
  dt-bindings: reset: add rk3588 reset definitions
  clk: rockchip: simplify rockchip_clk_add_lookup
  clk: rockchip: add lookup table support

 .../bindings/clock/rockchip,rk3588-cru.yaml   |   58 +
 drivers/clk/rockchip/Kconfig                  |    8 +
 drivers/clk/rockchip/Makefile                 |    1 +
 drivers/clk/rockchip/clk-cpu.c                |   69 +-
 drivers/clk/rockchip/clk-pll.c                |  218 +-
 drivers/clk/rockchip/clk-rk3588.c             | 2531 +++++++++++++++++
 drivers/clk/rockchip/clk.c                    |   14 +-
 drivers/clk/rockchip/clk.h                    |   88 +-
 drivers/clk/rockchip/rst-rk3588.c             |  857 ++++++
 drivers/clk/rockchip/softrst.c                |   34 +-
 .../dt-bindings/clock/rockchip,rk3588-cru.h   |  766 +++++
 .../dt-bindings/reset/rockchip,rk3588-cru.h   |  754 +++++
 12 files changed, 5364 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
 create mode 100644 drivers/clk/rockchip/clk-rk3588.c
 create mode 100644 drivers/clk/rockchip/rst-rk3588.c
 create mode 100644 include/dt-bindings/clock/rockchip,rk3588-cru.h
 create mode 100644 include/dt-bindings/reset/rockchip,rk3588-cru.h

-- 
2.35.1

