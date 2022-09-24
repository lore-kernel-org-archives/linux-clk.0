Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA833C07E9D
	for <linux-clk@archiver.kernel.org>; Sat, 24 Sep 2022 11:17:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbiIXLR0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 24 Sep 2022 07:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbiIXLRY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 24 Sep 2022 07:17:24 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6343B5F9E
        for <linux-clk@vger.kernel.org>; Sat, 24 Sep 2022 04:17:22 -0700 (PDT)
Received: from p508fdd76.dip0.t-ipconnect.de ([80.143.221.118] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1oc39r-0007rw-Cl; Sat, 24 Sep 2022 13:17:19 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 6.1 #1
Date:   Sat, 24 Sep 2022 13:17:18 +0200
Message-ID: <6719652.G0QQBjFxQf@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

please find below a pull-request with some Rockchip stuff.

Mainly the support for the clock-controller for the rv1126,
another yaml conversion and relicensing the bindings to
gpl2+MIT following DT guidelines.

Please pull.

Thanks
Heiko


The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:

  Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.1-rockchip-clock1

for you to fetch changes up to fffa0fa4d029c10406d417dd33f630bee4b12c02:

  dt-bindings: clock: rockchip: change SPDX-License-Identifier (2022-09-23 20:48:01 +0200)

----------------------------------------------------------------
A mux-variant clock using the table variant to select parents, clock
controller for the rv1126 soc, conversion of rk3128 to yaml and relicensing
of the yaml bindings to gpl2+MIT (following dt-binding guildelines)

----------------------------------------------------------------
Elaine Zhang (1):
      clk: rockchip: Add MUXTBL variant

Heiko Stuebner (1):
      Merge branch 'v6.1-shared/clkids' into v6.1-clock/next

Jagan Teki (3):
      clk: rockchip: Add dt-binding header for RV1126
      dt-bindings: clock: rockchip: Document RV1126 CRU
      clk: rockchip: Add clock controller support for RV1126 SoC

Johan Jonker (2):
      dt-bindings: clock: convert rockchip,rk3128-cru.txt to YAML
      dt-bindings: clock: rockchip: change SPDX-License-Identifier

 .../bindings/clock/rockchip,px30-cru.yaml          |    2 +-
 .../bindings/clock/rockchip,rk3036-cru.yaml        |    2 +-
 .../bindings/clock/rockchip,rk3128-cru.txt         |   58 -
 .../bindings/clock/rockchip,rk3128-cru.yaml        |   76 ++
 .../bindings/clock/rockchip,rk3228-cru.yaml        |    2 +-
 .../bindings/clock/rockchip,rk3288-cru.yaml        |    2 +-
 .../bindings/clock/rockchip,rk3308-cru.yaml        |    2 +-
 .../bindings/clock/rockchip,rk3368-cru.yaml        |    2 +-
 .../bindings/clock/rockchip,rk3399-cru.yaml        |    2 +-
 .../bindings/clock/rockchip,rv1108-cru.yaml        |    2 +-
 .../bindings/clock/rockchip,rv1126-cru.yaml        |   62 ++
 drivers/clk/rockchip/Kconfig                       |    7 +
 drivers/clk/rockchip/Makefile                      |    1 +
 drivers/clk/rockchip/clk-rv1126.c                  | 1138 ++++++++++++++++++++
 drivers/clk/rockchip/clk.c                         |   27 +-
 drivers/clk/rockchip/clk.h                         |   36 +
 include/dt-bindings/clock/rockchip,rv1126-cru.h    |  632 +++++++++++
 17 files changed, 1981 insertions(+), 72 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3128-cru.txt
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3128-cru.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1126-cru.yaml
 create mode 100644 drivers/clk/rockchip/clk-rv1126.c
 create mode 100644 include/dt-bindings/clock/rockchip,rv1126-cru.h



