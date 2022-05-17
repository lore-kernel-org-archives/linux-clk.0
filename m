Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B68C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 17 May 2022 19:25:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350254AbiEQTZ1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 May 2022 15:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241252AbiEQTZ0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 May 2022 15:25:26 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E04442ED0
        for <linux-clk@vger.kernel.org>; Tue, 17 May 2022 12:25:22 -0700 (PDT)
Received: from wf0416.dip.tu-dresden.de ([141.76.181.160] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1nr2oq-0004AJ-Nv; Tue, 17 May 2022 21:25:20 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 5.19
Date:   Tue, 17 May 2022 21:25:19 +0200
Message-ID: <8148508.MhkbZ0Pkbq@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

please find below some Rockchip clock changes for 5.19.

I've split out the conversion from txt to yaml into a separate tag
which'll follow shortly.

Please pull, thanks
Heiko

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.19-rockchip-clk1

for you to fetch changes up to b21445db9818ccb9fa1c0ba81fd3705eb8d347e3:

  dt-binding: clock: Add missing rk3568 cru bindings (2022-05-14 12:40:41 +0200)

----------------------------------------------------------------
Some fixes for recent yaml conversion of clock bindinds
and making the hclk_vo critical for rk3568.

----------------------------------------------------------------
Johan Jonker (4):
      dt-bindings: clock: fix some conversion style issues for rockchip,rk3399-cru.yaml
      dt-bindings: clock: replace a maintainer for rockchip,rk3399-cru.yaml
      dt-bindings: clock: use generic node name for pmucru example in rockchip,rk3399-cru.yaml
      dt-bindings: clock: fix rk3399 cru clock issues

Peter Geis (1):
      dt-binding: clock: Add missing rk3568 cru bindings

Sascha Hauer (1):
      clk: rockchip: Mark hclk_vo as critical on rk3568

 .../bindings/clock/rockchip,rk3399-cru.yaml        | 33 ++++++++--------------
 .../bindings/clock/rockchip,rk3568-cru.yaml        | 13 +++++++++
 drivers/clk/rockchip/clk-rk3568.c                  |  1 +
 3 files changed, 26 insertions(+), 21 deletions(-)



