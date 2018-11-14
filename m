Return-Path: <SRS0=4aIB=NZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B235C43441
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 22:50:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3DD7E2145D
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 22:50:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="Ww1YUrbR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DD7E2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728375AbeKOIzj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Nov 2018 03:55:39 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:38748 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728140AbeKOIzi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Nov 2018 03:55:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=kAy+oLAemqrlJ13Gpq7CoMwjn6y0dI9dqYr71OsbxvQ=; b=Ww1YUrbRFmEu
        0HoqaYftpmVppBuDQHjPOhDqcudyKkoPyid9tx3cc4TzcvNqOH0HDxoZFFlsRw4OglUZRX8SWtvcN
        CJJ1mBYzpBwbHaSV/U4b219nkHIViJpoVpzT+jiYndvudSKyRSmH+KRC6Pn77QYCl7JFXjX/IAG72
        Vay7E=;
Received: from [64.114.255.97] (helo=finisterre.ee.mobilebroadband)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1gN3cu-0004b3-OG; Wed, 14 Nov 2018 22:27:13 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
        id EDCDD440078; Wed, 14 Nov 2018 22:27:06 +0000 (GMT)
From:   Mark Brown <broonie@kernel.org>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Florian Kauer <florian.kauer@koalo.de>,
        Martin Sperl <kernel@martin.sperl.org>,
        Mark Brown <broonie@kernel.org>,
        Florian Meier <florian.meier@koalo.de>,
        Chris Boot <bootc@bootc.net>,
        Martin Sperl <kernel@martin.sperl.org>,
        Eric Anholt <eric@anholt.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-spi@vger.kernel.org
Subject: Applied "spi: bcm2835: make license text and module license match" to the spi tree
In-Reply-To:  <1540292769-5905-4-git-send-email-stefan.wahren@i2se.com>
Message-Id: <20181114222706.EDCDD440078@finisterre.ee.mobilebroadband>
Date:   Wed, 14 Nov 2018 22:27:06 +0000 (GMT)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The patch

   spi: bcm2835: make license text and module license match

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 22bf6cd2ca4df283812a521d3cb534993072cd44 Mon Sep 17 00:00:00 2001
From: Stefan Wahren <stefan.wahren@i2se.com>
Date: Tue, 23 Oct 2018 13:06:08 +0200
Subject: [PATCH] spi: bcm2835: make license text and module license match

The license text is specifying GPL v2 or later but the MODULE_LICENSE
is set to GPL v2 which means GNU Public License v2 only. So choose the
license text as the correct one.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Acked-by: Florian Kauer <florian.kauer@koalo.de>
Acked-by: Martin Sperl <kernel@martin.sperl.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-bcm2835.c    | 2 +-
 drivers/spi/spi-bcm2835aux.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
index f35cc10772f6..b0b87ff936c7 100644
--- a/drivers/spi/spi-bcm2835.c
+++ b/drivers/spi/spi-bcm2835.c
@@ -843,4 +843,4 @@ module_platform_driver(bcm2835_spi_driver);
 
 MODULE_DESCRIPTION("SPI controller driver for Broadcom BCM2835");
 MODULE_AUTHOR("Chris Boot <bootc@bootc.net>");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
diff --git a/drivers/spi/spi-bcm2835aux.c b/drivers/spi/spi-bcm2835aux.c
index 3094d818cf06..671e374e1b01 100644
--- a/drivers/spi/spi-bcm2835aux.c
+++ b/drivers/spi/spi-bcm2835aux.c
@@ -542,4 +542,4 @@ module_platform_driver(bcm2835aux_spi_driver);
 
 MODULE_DESCRIPTION("SPI controller driver for Broadcom BCM2835 aux");
 MODULE_AUTHOR("Martin Sperl <kernel@martin.sperl.org>");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
-- 
2.19.1

