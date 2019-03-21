Return-Path: <SRS0=PHVF=RY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B87DC4360F
	for <linux-clk@archiver.kernel.org>; Thu, 21 Mar 2019 09:20:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DBC2C218A2
	for <linux-clk@archiver.kernel.org>; Thu, 21 Mar 2019 09:20:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NxT3grqE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbfCUJUQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Mar 2019 05:20:16 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52294 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727878AbfCUJUP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Mar 2019 05:20:15 -0400
Received: by mail-wm1-f68.google.com with SMTP id a184so1910347wma.2
        for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2019 02:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a13ZCqVQ9Qq8CVb+4cp9xxMfE1waIVXpEmAmUnocBdY=;
        b=NxT3grqEnyQWOciiShXMcuRe1MBTnyKTPU4eU3RssPUKhXonGAfEiDBZb9n7JUWt/H
         bi5Y35WBPaklECD6WGXLU1Ib48SKmXnXWQwgZr3/nHVhr97oJ40OMDZlIbB9bj72G8UY
         RCQkHx0NKqBxWPcNAq1/PAVVcuHM1nLU1ZVSUkK0ElaDIckBdzoKbrTMh2XAAfpxzRfy
         JhNsx1lDH0+Uo+e4hnvMzurqFYB2SjTYvb/mZyC+pbbGIWOwy+gttzntFr4DYMJOk3X7
         bQoVz0nI1lbptgzB98mAA6NnpIeYDIJX2uCbs7tYgzFH71mLueto6ug0nZJwHOoZ2zPa
         LqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a13ZCqVQ9Qq8CVb+4cp9xxMfE1waIVXpEmAmUnocBdY=;
        b=HhkGHBSrG3CsQ9WgNNOIT/ldZjDewTUuphf0DgN2hApxDgazEZGzebN38B4gH2AP5I
         hkwK4xB0CRqGZeGeBfFt6cD4kUqQMTj+NixmQN+ianvEaIoz6OjOnWEYZZsmTE8bbPGF
         /FRsvXOF2rMJwu5NZtKcGsrrzBGP3/sS90FpMqhRiFtut4L2JIsYoIMzwiLXE2LnanMj
         gjQ4MSZNyQxjd3Xl6aWJ+jbeJ6Sj9F0R9HnJ0qb7EJj27uPzDz545LSi/asZzeq03o6E
         yOMIFkujnAUGxMEW7SR5gp63YHLbfaiDzJTLFLJ+ge+76xvmSY8SUWzgd7pYT97pqYuY
         oOrw==
X-Gm-Message-State: APjAAAXiQ+Z/x2ehiZrPBOk5XP4oEd5Kv7E+WzSOkydt8rain7+XJ+5G
        Bav6fCTGQyBRXfUzvs2vyUU+mw==
X-Google-Smtp-Source: APXvYqxu8US7yXzDevwqVfT6B9zqri5df90reiZceECH0E7xSyoESY5nA+pytEpdD6luw8g4GZz4lQ==
X-Received: by 2002:a1c:c013:: with SMTP id q19mr1614303wmf.93.1553160013851;
        Thu, 21 Mar 2019 02:20:13 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id x63sm6883959wmf.22.2019.03.21.02.20.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 21 Mar 2019 02:20:13 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: g12a-aoclk: expose CLKID_AO_CTS_OSCIN
Date:   Thu, 21 Mar 2019 10:20:10 +0100
Message-Id: <20190321092010.14382-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When submitted v2 of the G12A AO-CLK IDs, the CLKID_AO_CTS_OSCIN was moved
to the internal non-exported bindings, but this clock is necessary for
the second AO-CEC-B module since it embeds the 32768Hz dual-divider
clock generator unlike the AO-CEC-A module.

Export it back to the public bindings.

Fixes: be3d960b0aeb ("dt-bindings: clk: add G12A AO Clock and Reset Bindings")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a-aoclk.h          | 1 -
 include/dt-bindings/clock/g12a-aoclkc.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a-aoclk.h b/drivers/clk/meson/g12a-aoclk.h
index 666b4493822c..a67c8a7cd7c4 100644
--- a/drivers/clk/meson/g12a-aoclk.h
+++ b/drivers/clk/meson/g12a-aoclk.h
@@ -17,7 +17,6 @@
  * will remain defined here.
  */
 #define CLKID_AO_SAR_ADC_DIV	17
-#define CLKID_AO_CTS_OSCIN	19
 #define CLKID_AO_32K_PRE	20
 #define CLKID_AO_32K_DIV	21
 #define CLKID_AO_32K_SEL	22
diff --git a/include/dt-bindings/clock/g12a-aoclkc.h b/include/dt-bindings/clock/g12a-aoclkc.h
index 5ac66a2eee0f..e916e49ff288 100644
--- a/include/dt-bindings/clock/g12a-aoclkc.h
+++ b/include/dt-bindings/clock/g12a-aoclkc.h
@@ -28,6 +28,7 @@
 #define CLKID_AO_CLK81		15
 #define CLKID_AO_SAR_ADC_SEL	16
 #define CLKID_AO_SAR_ADC_CLK	18
+#define CLKID_AO_CTS_OSCIN	19
 #define CLKID_AO_32K		23
 #define CLKID_AO_CEC		27
 #define CLKID_AO_CTS_RTC_OSCIN	28
-- 
2.21.0

