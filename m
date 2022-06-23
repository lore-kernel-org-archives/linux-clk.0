Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01408CCA483
	for <linux-clk@archiver.kernel.org>; Thu, 23 Jun 2022 16:05:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbiFWQEm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jun 2022 12:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbiFWQEX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 12:04:23 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED92944A17;
        Thu, 23 Jun 2022 09:04:21 -0700 (PDT)
Received: from jupiter.universe (unknown [95.33.159.255])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 4852766017DF;
        Thu, 23 Jun 2022 17:04:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1656000260;
        bh=zjDrFX45JCbBeibf/cBhGS7s1nuAsOUhgqAPOq3rbRg=;
        h=From:To:Cc:Subject:Date:From;
        b=TsVNhEoI98MAUIQkJPaWhfmD0sdrYQpC9cvsXv9JHQ2bszl61qUYPSFzqLaCIzbKl
         DnKHf1MNcqrXJxPp6tNjpiTpYWloHzYVKMppk77y7yvlzugkg+EXFmQXs2K8cKvyaE
         h6JyEzZ0qpeNhAhlGSphPZD9S3QL2o//zwnMhUChwjZhVAH7+SKty8lPjM/SrZL+gS
         mh2A9vLHm6fhZ0cESUWBLOUNOarnznhZF4Ek71lKIMGVhyWj3jWKFaXtUyYaCoWp7w
         By6hvtCCzmlYAupqHtZtiqUYHO7j8rYvKvJ6/iXDcflnBqg68C0fbHaw6GTC/lIQ0F
         D68Sy+350fvng==
Received: by jupiter.universe (Postfix, from userid 1000)
        id C0904480122; Thu, 23 Jun 2022 18:04:17 +0200 (CEST)
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
Subject: [PATCH 0/5] RK3588 Clock and Reset Support
Date:   Thu, 23 Jun 2022 18:03:24 +0200
Message-Id: <20220623160329.239501-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

RK3588 Clock and Reset Support

This has been part of a bigger patchset adding basic rk3588 support.
Since that gets more and more out of hand, I'm now sending patches
for each subsystem as individual patchset. Previou patchet:

https://lore.kernel.org/all/20220504213251.264819-1-sebastian.reichel@collabora.com/

Changes:
 * Sync'd against latest downstream changes
 * Update bindings according to Rob's comments, except for license
   (no feedback from Rockchip)

-- Sebastian

Elaine Zhang (5):
  dt-binding: clock: Document rockchip,rk3588-cru bindings
  clk: rockchip: add register offset of the cores select parent
  clk: rockchip: add pll type for RK3588
  clk: rockchip: clk-cpu: add mux setting for cpu change frequency
  clk: rockchip: Add clock controller for the RK3588

 .../bindings/clock/rockchip,rk3588-cru.yaml   |   59 +
 drivers/clk/rockchip/Kconfig                  |    8 +
 drivers/clk/rockchip/Makefile                 |    1 +
 drivers/clk/rockchip/clk-cpu.c                |   69 +-
 drivers/clk/rockchip/clk-pll.c                |  218 +-
 drivers/clk/rockchip/clk-rk3588.c             | 2530 +++++++++++++++++
 drivers/clk/rockchip/clk.h                    |   65 +
 include/dt-bindings/clock/rk3588-cru.h        | 1516 ++++++++++
 8 files changed, 4457 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
 create mode 100644 drivers/clk/rockchip/clk-rk3588.c
 create mode 100644 include/dt-bindings/clock/rk3588-cru.h

-- 
2.35.1

