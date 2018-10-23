Return-Path: <SRS0=m775=ND=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF31ECDE44
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 11:07:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D578B2075D
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 11:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D578B2075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbeJWTaV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Oct 2018 15:30:21 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:48461 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbeJWTaV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Oct 2018 15:30:21 -0400
Received: from localhost.localdomain ([37.4.249.153]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MOiLv-1fxgki2ced-00QAez; Tue, 23 Oct 2018 13:06:55 +0200
Received: from localhost.localdomain ([37.4.249.153]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MOiLv-1fxgki2ced-00QAez; Tue, 23 Oct 2018 13:06:55 +0200
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
Subject: [PATCH 1/3] clk: bcm2835: make license text and module license match
Date:   Tue, 23 Oct 2018 13:06:06 +0200
Message-Id: <1540292769-5905-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540292769-5905-1-git-send-email-stefan.wahren@i2se.com>
References: <1540292769-5905-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:3Nt3Bld7M3I37ZrwRHGbEI4JTKE+xuEEpwMPM0YcHUQtjC0pmoT
 /Rg4tMhn3COycw49Lann/iTYz6Obuug31sMyDGkbCRRkjHbzpmt3tlF8d356gdFpdaZza+4
 H651dGmOsQkNP+sLAJUh2aYJI6NIK+DSA2JbyO9gBCeBCf52z3+zzVR1SK3OodKd1cqWQnp
 Ff6v4kF/53r41LtePBTTQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:2TLN/yBkFd8=:WkIoLL0ZAsWh4B015zazAD
 TBEQsmE8zCYA8OEWuAlDWuVXeMq+z5ScRHyeXungoBVLw4FYbvawKz/p3yk7LghFML8lvNQ6X
 tQbRwKeyDksAhrUZTnG5q2NG8qjg1yXkoyMIss7vi0KkHNiEHkt0zJy9SEiDU0mFUCfR1KhIK
 k25fQOE8MOvJm5RI0lM7ZAg1HCP2Pubcu7o15KKL9zAaPNIzrdnbNAx2S5hgeMSOscfYChnIT
 8kCTcP8dlSDFnAqhPpQx5qVg5IaHDRnpoIY/bnESKPSkMBQ8apSZO0pRFbB/KcetORgQwaOde
 EdwOLPy+63CirbTry+WUNyadB7GKNjqniXXmZZnSXa2AHHfgQOorfYEgR8To7M1yegZW7Y387
 U7xvf+v0v+K5FErqHP2y8SqP1sSa8a2S7HxqbLxkHfb9WzajyhvT9LMF2fX6/V03mbYKbb9l5
 Ej7/CuGn7GXubdu8G/Hn7p+2SZOGzwZBu6zzpwnwl3AyMqIcgL51X50O86YPgaWjtnKWWBc9x
 7EcySOQyh4+VmZH/aFd5EMw8RbaE5kBUo1mWoZq+MqmKQpRcaFeKoIPzWOCpBKUgwowZjo5/s
 ZomiI+rhQ5RVNLs85YMd8htEuhPJm7IVDjQjE3K0+VsJYW/wPXz9Z4jZdUKv5zg4ilS/1F8Ry
 KB0boJz2egI/41iPqDvUkG9HCN5cxMTfTn652pxQlt4HZbnuhNdLaasZ0BAioLIokDmw=
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The license text is specifying GPL v2 or later but the MODULE_LICENSE
is set to GPL v2 which means GNU Public License v2 only. So choose the
license text as the correct one.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/clk/bcm/clk-bcm2835-aux.c | 2 +-
 drivers/clk/bcm/clk-bcm2835.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835-aux.c b/drivers/clk/bcm/clk-bcm2835-aux.c
index f225ad2..e01d557 100644
--- a/drivers/clk/bcm/clk-bcm2835-aux.c
+++ b/drivers/clk/bcm/clk-bcm2835-aux.c
@@ -79,4 +79,4 @@ builtin_platform_driver(bcm2835_aux_clk_driver);
 
 MODULE_AUTHOR("Eric Anholt <eric@anholt.net>");
 MODULE_DESCRIPTION("BCM2835 auxiliary peripheral clock driver");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 7bef066..6b6d836 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -2206,4 +2206,4 @@ builtin_platform_driver(bcm2835_clk_driver);
 
 MODULE_AUTHOR("Eric Anholt <eric@anholt.net>");
 MODULE_DESCRIPTION("BCM2835 clock driver");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
-- 
2.7.4

