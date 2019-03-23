Return-Path: <SRS0=a61j=R2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B53C43381
	for <linux-clk@archiver.kernel.org>; Sat, 23 Mar 2019 21:16:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE2F121873
	for <linux-clk@archiver.kernel.org>; Sat, 23 Mar 2019 21:16:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gmEfLE7T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728193AbfCWVQt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Mar 2019 17:16:49 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55216 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728186AbfCWVQs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Mar 2019 17:16:48 -0400
Received: by mail-wm1-f68.google.com with SMTP id f3so5299071wmj.4
        for <linux-clk@vger.kernel.org>; Sat, 23 Mar 2019 14:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mihn/aKPHlaD2O85e+r6TuyfAnA4mSgmIhLj+KW2M0s=;
        b=gmEfLE7TIBFCp0klT2SSwh+BuFEP50TfMJwf5RlXXSoONQIaYgb8v7uYW7P9dlt0/T
         VzU7a800z4kGX9EhFE1H09yClH6B7PdwTyqc2nXEh6+Jw1ls5xC05KWH/gOsSARuSh8L
         uBJyhaCqdqczuyvvvrIi+awhPwGceOXDJNrP+YWyv67MqFtpM6L5rhUV2yPdxOnbhn/q
         MGZFQEp06/0JKa4qg362Q228Ce0V2T3sdQVL2AS7kvtdHg30QLR7P9plR6qJT8/XBO83
         3/Kva2OJIOiSgtTaOqHMSz85suMHzazYw6MBe8YV1Pu+0NZSaXjUf5YdPf13pCci4QZG
         wLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mihn/aKPHlaD2O85e+r6TuyfAnA4mSgmIhLj+KW2M0s=;
        b=SYG/LZmn9P/G9BYCyZHAccI7cSbghIwy4hYfMThKBU4zjtMPXWq5W9fFm3EVjM6TH+
         f02q3LIYFhAGSKqXmBySDKC5usbcMCbsjFCQvmd5yYIHRgpXVCC2pe0bi8JIkLThmPwg
         4SbvZ92xjLUB627aMdFSYsrx7G3N90KiDQWuKcOw35Vi2HeyJwk8/Sc/sqWWR6s+ruFL
         GvqiHSaYuKRPUOFbJi7mFLkzwCnNSMrK3GUxU2EV8HeMOpWsLY8LvXZsjjEmM3KaJH6k
         9mtmCuyBSEwzmP075eZZqBZJ+c9AG1XrdK+0rEVzc/dF4MqNK6fGdP5mWLHlpcTS4XBx
         NwrA==
X-Gm-Message-State: APjAAAUSoHAhp3SuYUlDcEJCslC7yjua+ngNq/EuXxNlfxlz+Z0hoEOb
        dVNEoLX4UxyfsjgkJZdjnY7MfA==
X-Google-Smtp-Source: APXvYqzCYoBPN4HjfozKFyEQU00XlpcXPojNll2yPipzrHj0j/ePOesLnlEZh8WPb/+GnX+KettfgA==
X-Received: by 2002:a1c:304:: with SMTP id 4mr6433825wmd.97.1553375806057;
        Sat, 23 Mar 2019 14:16:46 -0700 (PDT)
Received: from localhost.localdomain (cag06-8-78-203-165-84.fbx.proxad.net. [78.203.165.84])
        by smtp.gmail.com with ESMTPSA id y66sm8050503wmd.37.2019.03.23.14.16.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 23 Mar 2019 14:16:45 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     matthias.bgg@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     sean.wang@kernel.org, ryder.lee@mediatek.com,
        hsin-hsiung.wang@mediatek.com, wenzhen.yu@mediatek.com,
        chaotian.jing@mediatek.com, yong.mao@mediatek.com,
        jjian.zhou@mediatek.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-clk@vger.kernel.org, stephane.leprovost@mediatek.com,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 04/24] soc: mediatek: pwrap: add missing check on rstc
Date:   Sat, 23 Mar 2019 22:15:52 +0100
Message-Id: <20190323211612.860-5-fparent@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190323211612.860-1-fparent@baylibre.com>
References: <20190323211612.860-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The variable rstc is set only when the SoC PWRAP have the
PWRAP_CAP_RESET capability. Check whether rstc is set before
using it to avoid errors.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 8236a6c87e19..b3ba2301f569 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1478,7 +1478,8 @@ static int pwrap_init(struct pmic_wrapper *wrp)
 {
 	int ret;
 
-	reset_control_reset(wrp->rstc);
+	if (wrp->rstc)
+		reset_control_reset(wrp->rstc);
 	if (wrp->rstc_bridge)
 		reset_control_reset(wrp->rstc_bridge);
 
-- 
2.20.1

