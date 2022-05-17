Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DACC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 17 May 2022 19:31:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352700AbiEQTbV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 May 2022 15:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344775AbiEQTbU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 May 2022 15:31:20 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7D901581F
        for <linux-clk@vger.kernel.org>; Tue, 17 May 2022 12:31:17 -0700 (PDT)
Received: from wf0416.dip.tu-dresden.de ([141.76.181.160] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1nr2ua-0004C1-3u; Tue, 17 May 2022 21:31:16 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 5.19 #2
Date:   Tue, 17 May 2022 21:31:15 +0200
Message-ID: <5781991.QJadu78ljV@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

please find below a pull-request converting a number of Rockchip
clock controllers to yaml, which shound go on top of the previous
pull request.

In the discussion Stephen had comments about the optional clocks, that
have a circular dependency (xin24m -> cru -> i2c -> rtc -> xin32k -> cru) .
After everyone put in their argument, the discussion itself just stopped.

I've picked up the conversion patches anyway, as this is the status-quo
in terms of modelling clocks on Rockchip, so the yaml conversion doesn't
change anything in either direction and just transforms what is in the
kernel right now into the yaml format which will improve devicetree checks
a lot and also reduce the number of warnings emitted by the checker.

So hopefully please pull :-)
Thanks
Heiko


The following changes since commit b21445db9818ccb9fa1c0ba81fd3705eb8d347e3:

  dt-binding: clock: Add missing rk3568 cru bindings (2022-05-14 12:40:41 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.19-rockchip-clk2

for you to fetch changes up to 32a214cd8ccbc361319bcd00b0b1b05a6b53bc61:

  dt-bindings: clock: convert rockchip,rk3368-cru.txt to YAML (2022-05-17 21:05:43 +0200)

----------------------------------------------------------------
Conversion from txt to Yaml for a number of Rockchip
clock bindings.

----------------------------------------------------------------
Johan Jonker (8):
      dt-bindings: clock: convert rockchip,rv1108-cru.txt to YAML
      dt-bindings: clock: convert rockchip,rk3288-cru.txt to YAML
      dt-bindings: clock: convert rockchip,rk3188-cru.txt to YAML
      dt-bindings: clock: convert rockchip,px30-cru.txt to YAML
      dt-bindings: clock: convert rockchip,rk3308-cru.txt to YAML
      dt-bindings: clock: convert rockchip,rk3036-cru.txt to YAML
      dt-bindings: clock: convert rockchip,rk3228-cru.txt to YAML
      dt-bindings: clock: convert rockchip,rk3368-cru.txt to YAML

 .../bindings/clock/rockchip,px30-cru.txt           |  70 ------------
 .../bindings/clock/rockchip,px30-cru.yaml          | 119 +++++++++++++++++++++
 .../bindings/clock/rockchip,rk3036-cru.txt         |  56 ----------
 .../bindings/clock/rockchip,rk3036-cru.yaml        |  72 +++++++++++++
 .../bindings/clock/rockchip,rk3188-cru.txt         |  61 -----------
 .../bindings/clock/rockchip,rk3188-cru.yaml        |  78 ++++++++++++++
 .../bindings/clock/rockchip,rk3228-cru.txt         |  58 ----------
 .../bindings/clock/rockchip,rk3228-cru.yaml        |  74 +++++++++++++
 .../bindings/clock/rockchip,rk3288-cru.txt         |  67 ------------
 .../bindings/clock/rockchip,rk3288-cru.yaml        |  85 +++++++++++++++
 .../bindings/clock/rockchip,rk3308-cru.txt         |  60 -----------
 .../bindings/clock/rockchip,rk3308-cru.yaml        |  76 +++++++++++++
 .../bindings/clock/rockchip,rk3368-cru.txt         |  61 -----------
 .../bindings/clock/rockchip,rk3368-cru.yaml        |  78 ++++++++++++++
 .../bindings/clock/rockchip,rv1108-cru.txt         |  59 ----------
 .../bindings/clock/rockchip,rv1108-cru.yaml        |  75 +++++++++++++
 16 files changed, 657 insertions(+), 492 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/rockchip,px30-cru.txt
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,px30-cru.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3036-cru.txt
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3036-cru.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3188-cru.txt
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3188-cru.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3228-cru.txt
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3228-cru.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.txt
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3288-cru.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3308-cru.txt
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3308-cru.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3368-cru.txt
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3368-cru.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1108-cru.txt
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1108-cru.yaml



