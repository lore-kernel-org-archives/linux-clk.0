Return-Path: <SRS0=m775=ND=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81BC3C67863
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 11:07:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5570C2075D
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 11:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5570C2075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbeJWTaX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Oct 2018 15:30:23 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:34537 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbeJWTaW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Oct 2018 15:30:22 -0400
Received: from localhost.localdomain ([37.4.249.153]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N336L-1fTao92B7V-013LF9; Tue, 23 Oct 2018 13:06:56 +0200
Received: from localhost.localdomain ([37.4.249.153]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N336L-1fTao92B7V-013LF9; Tue, 23 Oct 2018 13:06:56 +0200
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Florian Meier <florian.meier@koalo.de>,
        Chris Boot <bootc@bootc.net>,
        Martin Sperl <kernel@martin.sperl.org>,
        Eric Anholt <eric@anholt.net>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 3/3] spi: bcm2835: make license text and module license match
Date:   Tue, 23 Oct 2018 13:06:08 +0200
Message-Id: <1540292769-5905-4-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540292769-5905-1-git-send-email-stefan.wahren@i2se.com>
References: <1540292769-5905-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:PEMAF2+1ZpZBLAStRvotJdENaprOzKeQy5pL9T8W1c6KFgsl26T
 IhkSVaOUHZI5nLUayHym49l1JD/irBbZUK0YG0XqwCXeVSopozgzVGwBYileBAecssNXF5y
 Zv4ZwEz9dewEkJThWtdt5CFXi/VrRFiTVshsQEp7nQbaazabL2HP4pqPk+sn8jS7jcy6o/3
 Sm5yIbbFWEOmIBw2J/O7A==
X-UI-Out-Filterresults: notjunk:1;V01:K0:2gE4XsoLKWw=:YkCO1h95OWRGzJ4WNycAgi
 LHc1bjmSsoXoRe8Nyz+H/0Sd322yQpDaZVw3NyPgOfj5ObDhu6N+RgzV63tTACGKaxswerVby
 KqDPPbFw+dzeIyS4RPPP0ZdTmZEzk1rK63pMpO5euSqmTFpaw4pAT9jNjjhyIvNR4I/CcKMYO
 Kf72VKKNizqq+jMYIFueoMhatT2JGau+E8E3JwDj73Y+JhORRNaVtE9O+2Uy+cPj3bVtUPRGt
 wFylAKJFUgM5TwXjGLwy7jAKblcA7rRsNmDL3KAHigsuVSuP1dmkziRTifxXMfAFuv6mdq6TY
 Gy04FpynwZXaOoUaELwckc0MeiqKq6B07ReycKXT9EU4yanG9LZ+CBYXhU1EQRRNtGU5iXp1Z
 uRufcj8HilKy8sy2ZjrSRNv1zbXbk8Hw3lSqZunYJ21+T+36iyMQWAB25zG7HRt1LOvW6E0u6
 f8DpG9M3bBusFn4NwLc0ijqFOBUW/HlRZ9jdbCesZwT2rMG96ilC/nLuXjaPnWSnCnVQ3iBBb
 81Bt1QRKrPews53DFNmewojsnOPo8QmH4hSHM2aIfkjuy+2Lbja+gMMbXhvOWmPphrcnOzPQv
 8V3BFQj9ZOo2RWiv7Kb4/N516fhsnNO+CpFMIEbKE3VXequaqFcHEpV4tytT5gAoZlanLTuww
 gJ/ZhO9ZJVjD91AsFEug325snpjhDjFSHEr2JMFF8YTC+Q77PXI7pciYtA1iDZ3DF2Ag=
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The license text is specifying GPL v2 or later but the MODULE_LICENSE
is set to GPL v2 which means GNU Public License v2 only. So choose the
license text as the correct one.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/spi/spi-bcm2835.c    | 2 +-
 drivers/spi/spi-bcm2835aux.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
index f35cc10..b0b87ff 100644
--- a/drivers/spi/spi-bcm2835.c
+++ b/drivers/spi/spi-bcm2835.c
@@ -843,4 +843,4 @@ module_platform_driver(bcm2835_spi_driver);
 
 MODULE_DESCRIPTION("SPI controller driver for Broadcom BCM2835");
 MODULE_AUTHOR("Chris Boot <bootc@bootc.net>");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
diff --git a/drivers/spi/spi-bcm2835aux.c b/drivers/spi/spi-bcm2835aux.c
index 3094d81..671e374 100644
--- a/drivers/spi/spi-bcm2835aux.c
+++ b/drivers/spi/spi-bcm2835aux.c
@@ -542,4 +542,4 @@ module_platform_driver(bcm2835aux_spi_driver);
 
 MODULE_DESCRIPTION("SPI controller driver for Broadcom BCM2835 aux");
 MODULE_AUTHOR("Martin Sperl <kernel@martin.sperl.org>");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
-- 
2.7.4

