Return-Path: <SRS0=1SIp=RQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8B9C43381
	for <linux-clk@archiver.kernel.org>; Wed, 13 Mar 2019 13:55:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D16A2087C
	for <linux-clk@archiver.kernel.org>; Wed, 13 Mar 2019 13:55:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KKIcVuiS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbfCMNzH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Mar 2019 09:55:07 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54063 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbfCMNzH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Mar 2019 09:55:07 -0400
Received: by mail-wm1-f66.google.com with SMTP id e74so2136771wmg.3
        for <linux-clk@vger.kernel.org>; Wed, 13 Mar 2019 06:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d/XcG1evH1WLkyrTUwfyNJFSPc+4/xkbOCaOxw4Zna0=;
        b=KKIcVuiSg58QhTbCMj+bu+T/HGR0cNEZIvnK6O17f1iSwyS56caeS33GyZ/o8BP1fz
         8f2h6883+nC/DMfXiS5+Z3EF+cHhOXBgnP7CXrWrqhNeyJUcph0EallekUARYaN3YCnT
         AEDhJeklV5sw1Ujk0HGLDD4gR9tKmZgo4HvRynoen94p8revoKYmpN9FcbXJohPgCSpH
         CAr8TrZCn7mrKi68AJSpahYDMasKhFYznl5fZwPeBl/lwo5TTH+vQSf0pq4uz7Q43pTB
         W8DF4dO21PxkMzVZGGm0ibZrNVe3AKtfaJWqB2AuOoyYRc7fHWEcQUGoyNWy1VQfoQIM
         sXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d/XcG1evH1WLkyrTUwfyNJFSPc+4/xkbOCaOxw4Zna0=;
        b=TJETWqT1sOvlibdF0852Yw5PZVEuKWn+WIHXNpBitchYdX66NWmDSf8X+LLP3f8ON4
         rhCELjfktajvnxMU9W6McL2SmsPfl3dHiAFFiFAHfAI/paq32CZ/y/KwG8duk/OuUOQb
         IfWQub1IMT2kpsav07uXz8CTHt53jj5k+tfV6iw8UcXfuZzN94HfRAJkH0Rpj4gzIWhT
         idsd09uMPYNILVwcLOwx5zsZSsLLKEXm6Y0mYMotIdrAtXmZMQiBgeF6OkDd9kRLrzO/
         mIxkKDNI4PVH53/dsoLJlFwGgTjk7gJoGlRXbAf1G8Xg0jVPN2YfP0mqQgMxpcocdoKF
         O1jw==
X-Gm-Message-State: APjAAAX7Rg6sUXkI1+xdkA8v9BPXVDu9Mk2Zc2jmlqtbLGed62udw4Jz
        OnDEOzzIJe2YjSbjs29MZbCEig==
X-Google-Smtp-Source: APXvYqy861EIsMqnM3GMUNQwAgzamaE1WJuJZgpTU4We/AYfmMtHTiEca8tFB0OcsSPtD9R42ybGHQ==
X-Received: by 2002:a1c:a007:: with SMTP id j7mr2296073wme.25.1552485306152;
        Wed, 13 Mar 2019 06:55:06 -0700 (PDT)
Received: from localhost.localdomain (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id l5sm2216071wmi.24.2019.03.13.06.55.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 13 Mar 2019 06:55:05 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson-g12a: fix VPU clock parents
Date:   Wed, 13 Mar 2019 14:55:03 +0100
Message-Id: <20190313135503.3198-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

First two VPU clock parents are wrong, fix it here.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 0e1ce8c03259..9b0151993bcc 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -960,7 +960,7 @@ static struct clk_regmap g12a_sd_emmc_c_clk0 = {
 /* VPU Clock */
 
 static const char * const g12a_vpu_parent_names[] = {
-	"fclk_div4", "fclk_div3", "fclk_div5", "fclk_div7",
+	"fclk_div3", "fclk_div4", "fclk_div5", "fclk_div7",
 	"mpll1", "vid_pll", "hifi_pll", "gp0_pll",
 };
 
-- 
2.20.1

