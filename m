Return-Path: <SRS0=m775=ND=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20924C46475
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 11:07:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB98E2080A
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 11:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB98E2080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbeJWTaU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Oct 2018 15:30:20 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:60541 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbeJWTaT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Oct 2018 15:30:19 -0400
Received: from localhost.localdomain ([37.4.249.153]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N1Ofr-1fU8lv0K6d-012mkD; Tue, 23 Oct 2018 13:06:56 +0200
Received: from localhost.localdomain ([37.4.249.153]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N1Ofr-1fU8lv0K6d-012mkD; Tue, 23 Oct 2018 13:06:56 +0200
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
Subject: [PATCH 2/3] dma: bcm2835: make license text and module license match
Date:   Tue, 23 Oct 2018 13:06:07 +0200
Message-Id: <1540292769-5905-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540292769-5905-1-git-send-email-stefan.wahren@i2se.com>
References: <1540292769-5905-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:cz8lcGXoVNwvwhk/lxYSFyBj3GjDvFOdEwm6ULai/iDf6jrZwbp
 SuLXM/ifs0bJhUbOnWeQJRFXOkVZXplTzuQGi9hgmYZ9TBlmLLYyrg+xGqyNtpTX5W7jmAb
 pZZCQPv1HMhQNsCcswINcsqMNA7jTNNB9DgwFEmaPi6VXMUA2o7f58Hgj4XAqnfiVcZG2S+
 QlDME31LhjI8EkY7b6T4g==
X-UI-Out-Filterresults: notjunk:1;V01:K0:cUQs40UsEas=:a08/1xekanqV0wX8DXfDkm
 bPazghj/q3FQdeM1y31zX9qH6mSvqQf6SXMwicYhhOQV4QWEpln7aFqHHvx6AI3KVyFvJHx99
 X/z24PBPiVXf/N1hHQ6MHgESno/lXKv+WEQ+tKuHXhAzFJZvfEqlO/N2Tb79r/ZrYPc80R8J7
 dzXv6hgoF+nWXE243wpq/zotz3qvRAWvPUu2qEej1CpP/1Vu968XOwIBazMb3N1rJPhZcBK/F
 4T7/0qw6TKxb+zzwHBXdTQu6+VkgmaVoRf24rKJe+UssOdcHAmEpCLZPwIrcKAFwXFzXg2cVy
 +UEnR1lduLhPE37HaQiefLCMYluHWDMVRKdFoT3oE2KeuWkVtMz0JviRQwqGJKalb/B+Ecxbc
 nwY+Nxt3P+V5Vgucfm7O/0xemXmYAGJcZbqOACKoMzG98rUNjXgALRR3ea4bjopnnZ4TAp+vY
 7N+GZdxyLPWii/OR7LZ+7VmZTl3mP+1gDq+MH8r5AqgGNgVW/xNia96MmQ7QLEP+SkM5sumHR
 jJ/G2t7oiE6HVN3P6ZgtdqV95MoePjkKmJAmSywEaIRShDHvieAi/M2dbt5aG0Au0B0bYrIPe
 5qegiuw9IPPTtHKr7KP/XbV26oZiF3l3JAMEeYsnkIvbuvDyrweyBkE3OfWTjUYqcl0h/mkc4
 /Edry/2qDWzqDibm5Yn4D+L/IckNsVrmhe/I8xHdkah9XdyO9BiUYbq41halrtbXeAig=
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The license text is specifying GPL v2 or later but the MODULE_LICENSE
is set to GPL v2 which means GNU Public License v2 only. So choose the
license text as the correct one.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/dma/bcm2835-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 847f84a..112b071 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -1064,4 +1064,4 @@ module_platform_driver(bcm2835_dma_driver);
 MODULE_ALIAS("platform:bcm2835-dma");
 MODULE_DESCRIPTION("BCM2835 DMA engine driver");
 MODULE_AUTHOR("Florian Meier <florian.meier@koalo.de>");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
-- 
2.7.4

