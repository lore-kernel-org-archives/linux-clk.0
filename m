Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553E1C35273
	for <linux-clk@archiver.kernel.org>; Tue,  5 Apr 2022 08:32:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234863AbiDEI02 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Apr 2022 04:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235569AbiDEIVa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Apr 2022 04:21:30 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D506B1135;
        Tue,  5 Apr 2022 01:19:16 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id E7E0F40008;
        Tue,  5 Apr 2022 08:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649146754;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=gBBcrea6oNIhsEnPpSlFuY4QZoj0/iMHz+J0UUkxKRY=;
        b=CdCVpZU3J/sIn0TmgYyzGKy49SE1EiapBfEdUtRkhvvhAorR2B1YWt5jSvDMLTAbz5xOe9
        t/XCaq8QhEaN00PCYqu8S0AgI+iblyIDypag7d43AYAHZ9+XnTar2Lal217N+Jbtd9dMni
        xyM+9C4vNcahF4TIpYUq8X8o/evk9daigq+/OR25OYTf92HIUsmxm6j6sDX3lnCyeOCNW7
        s6yQsWV3np8mqkNMk1JhhoUgV1lB5zSW6bKMGmHooGTQ7Qyq5FaMYM7i22psEcKnszBCa2
        xioPe3xyVli0IQbsWbQVtqWKd7P36cRNICrH+hKu/HgGLiid4AiJLsju3hz6Qg==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-renesas-soc@vger.kernel.org, dmaengine@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v7 0/9] RZN1 DMA support
Date:   Tue,  5 Apr 2022 10:19:02 +0200
Message-Id: <20220405081911.1349563-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

Here is a first series bringing DMA support to RZN1 platforms. Soon a
second series will come with changes made to the UART controller
driver, in order to interact with the RZN1 DMA controller.

Stephen acked the sysctrl patch (in the clk driver) but somehow I feel
like it would be good to have this patch applied on both sides
(dmaengine and clk) because more changes will depend on the addition of
this helper, that are not related to DMA at all. I'll let you folks
figure out what is best.

Cheers,
Miquèl

Changes in v7:
* This time, really added Stephen's Acks (sorry for the error).
* Moved an error check to get rid of one mutex_unlock/lock call as
  suggested by Ilpo.
* Split the patch adding the dmamux driver as advised by Vinod. One
  patch introduces the dmamux driver, the other populates the children
  of the system controller. As the original patch got acked by Stephen
  Boyd, I moved his tag to the patch touching the clock controller only.

Changes in v6:
* Added Stephen's acks.
* Fixed an extra newline added in the middle of nowhere.
* Rebased on top of v5.18-rc1.

Changes in v5:
* Used gotos in rzn1_dmamux_route_allocate().
* Changed the prefix to "dmaengine:".
* Dropped the partial transfers fix.
* Added Rob's acks.

Changes in v4:
* Freed "map" in the error path of the dmamux driver.
* Improved a bit the style as requested by Prabhakar.
* Dropped a __maybe_unused.
* Reorder the includes.
* Added a dependency on ARCH_RZN1.
* Added Rob's Ack.
* Added a reg property to the dmamux binding file.
* Referenced the dmamux binding from the system controller file.
* Called of_platform_populate from the end of the system controller
  (clock) driver probe in order to probe the dmamux if it was
  populated.
* Added DMA properties to all the relevant UARTs.

Changes in v3:
* Added Reviewed-by tags.
* Exported the set_dmamux* symbol properly.
* Dropped a useless check in the probe and moved the sysctrl_priv
  assignation to the end of the probe.
* Renamed the dmamux driver
* Added a couple of missing MODULE_ macros in the dmamux driver.
* Decided to use a regular platform init call instead of the
  arch_initcall() initially proposed.
* s/%d/%u/ in printk's when appropriate.
* Used a hardcoded value instead of dmamux->dmac_requests when
  appropriate.
* Changed the variable name "master" to "dmac_idx" to be more
  descriptive.
* Dropped most of the of_* calls in favor of #define's.
* Fixed a typo.
* Exported two symbols from 8250_dma.c.

Changes in v2:
* Clarified that the 'fix' regarding non aligned reads would only apply
  to the DEV_TO_MEM case.
* Fix the DMA controller compatible string (copy-paste error).
* s/syscon/sysctrl/ as advised by Geert.
* Disabled irqs when taking the spinlock from the clocks driver.
* Moved the DMAMUX offset inside the driver.
* Removed extra commas.
* Improved the style as suggested by Andy.
* Removed a dupplicated check against the device node presence.
* Reduced the number of lines of code by using dev_err_probe().
* Created a Kconfig symbol for DMAMUX to fix the two robot reports
  received and be sure there was no useless overhead with other
  platforms.
* Exported the serial8250_{tx,rx}_dma() symbols.


Miquel Raynal (9):
  dt-bindings: dmaengine: Introduce RZN1 dmamux bindings
  dt-bindings: clock: r9a06g032-sysctrl: Reference the DMAMUX subnode
  dt-bindings: dmaengine: Introduce RZN1 DMA compatible
  soc: renesas: rzn1-sysc: Export function to set dmamux
  dmaengine: dw: dmamux: Introduce RZN1 DMA router support
  clk: renesas: r9a06g032: Probe possible children
  dmaengine: dw: Add RZN1 compatible
  ARM: dts: r9a06g032: Add the two DMA nodes
  ARM: dts: r9a06g032: Describe the DMA router

 .../clock/renesas,r9a06g032-sysctrl.yaml      |  11 ++
 .../bindings/dma/renesas,rzn1-dmamux.yaml     |  51 ++++++
 .../bindings/dma/snps,dma-spear1340.yaml      |   8 +-
 MAINTAINERS                                   |   1 +
 arch/arm/boot/dts/r9a06g032.dtsi              |  40 +++++
 drivers/clk/renesas/r9a06g032-clocks.c        |  36 +++-
 drivers/dma/dw/Kconfig                        |   9 +
 drivers/dma/dw/Makefile                       |   2 +
 drivers/dma/dw/platform.c                     |   1 +
 drivers/dma/dw/rzn1-dmamux.c                  | 157 ++++++++++++++++++
 include/linux/soc/renesas/r9a06g032-sysctrl.h |  11 ++
 11 files changed, 325 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/renesas,rzn1-dmamux.yaml
 create mode 100644 drivers/dma/dw/rzn1-dmamux.c
 create mode 100644 include/linux/soc/renesas/r9a06g032-sysctrl.h

-- 
2.27.0

