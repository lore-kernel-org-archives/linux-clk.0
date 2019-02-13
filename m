Return-Path: <SRS0=hoZU=QU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFE8C282C2
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 09:59:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C323222BA
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 09:59:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Cizw0xtO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732524AbfBMJ7B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Feb 2019 04:59:01 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36586 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727511AbfBMJ7B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Feb 2019 04:59:01 -0500
Received: by mail-wr1-f66.google.com with SMTP id o17so1756661wrw.3
        for <linux-clk@vger.kernel.org>; Wed, 13 Feb 2019 01:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cTVgMV4QN/O1VM1NLUgFFlyBDlQnQrXLeyqpgio8zrY=;
        b=Cizw0xtOihKs5jdEPG671F9h5Q28JsSdgKfgLpEe1KZkcMhya3OViJAHAhztxklVes
         YcD+j0uGl0Abe7ASFnYhyPWB97FZrP0W8WbhO7HFc2A5rB6XtF/txUQSTn59Q4dgeGpg
         AEcFCzhQEsGEBRAnxn7KcAdsI1GJmzp0+eu4NBzq3itNeLmGLAVQWmRSjQxm0uLAiV0+
         8hLsFiatl3HnaY0wpAYKnkjcePUn2AgeLueOVI3McHAjjmnL5im0EJLrcCxBdSey85dn
         tJ+ypfJrQISv35VeDgfzQJjvAB5cwkJ2N59ZZ6WWUDeSusMt0AH57Xqnn0jR0kQO7maz
         OtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cTVgMV4QN/O1VM1NLUgFFlyBDlQnQrXLeyqpgio8zrY=;
        b=WS8dqKXdGyfKkjIGrmHnvYeS5+dIhG1/D4N2f9Jy/XRtHlyFum2fj9uIk4m+auk/0l
         KWynIj0peJKYLlHJhlQOxJjpG8bSJFfNkGIUbxlivji3TdIsLhTKvH4F9xYoE4imVa+X
         3JXf0obcnp+sbqqIlChfTV+CYuhRB8ktXBln2lnvfe/0RsX4DqeJMKtIbP/o3E4WI3V7
         /PoaHFmfa0Fxne2URrxCtbnUEadJY2Z9LKdxEWuD6cU39sHV6bzz9WHe2b0QkMfOoYyT
         pfemBZ1eSTWTkI8+BoD7zD6gRAXW7ZaQSuOisRq1jKfdRtEZYdHxj6Ll6DcxvBhMwFPn
         rbyg==
X-Gm-Message-State: AHQUAuYkLXj4nQn3irZTPhDNZdBnsciW8cmn88Wr22BLD4Dhs1qxb8NY
        6DuJb+qAEqu4o5MCMNRrI6y8RQ==
X-Google-Smtp-Source: AHgI3IaLLNDjLhSH2mNv/pSNiss75mv4YTJlPuylODIHgSKJqE9uCLBuBgdrl6w9J20IByguEfVPYg==
X-Received: by 2002:adf:a4c9:: with SMTP id h9mr1888592wrb.254.1550051939768;
        Wed, 13 Feb 2019 01:58:59 -0800 (PST)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id k23sm2839467wmj.32.2019.02.13.01.58.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Feb 2019 01:58:59 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Maxime Jourdan <mjourdan@baylibre.com>
Subject: [PATCH] dt-bindings: clock: axg-audio: unexpose controller inputs
Date:   Wed, 13 Feb 2019 10:58:35 +0100
Message-Id: <20190213095835.17448-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove the bindings ID of the clock input of the controller. These
clocks are purely internal to the controller, exposing them was a
mistake. Actually, these should not even be in the provider and have
IDs to begin with.

Unexpose these IDs before:
 * someone starts using them (even if there no valid reason to do so)
 * the actual clocks are removed. The fact that they exist is just the
   result of an ugly hack. This will be resolved in CCF when we can
   reference DT directly in parent table.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-audio.h              | 20 ++++++++++++++++++++
 include/dt-bindings/clock/axg-audio-clkc.h | 20 --------------------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.h b/drivers/clk/meson/axg-audio.h
index 7191b39c9d65..644f0b0fddf2 100644
--- a/drivers/clk/meson/axg-audio.h
+++ b/drivers/clk/meson/axg-audio.h
@@ -60,6 +60,26 @@
 #define AUD_CLKID_MST5			6
 #define AUD_CLKID_MST6			7
 #define AUD_CLKID_MST7			8
+#define AUD_CLKID_SLV_SCLK0		9
+#define AUD_CLKID_SLV_SCLK1		10
+#define AUD_CLKID_SLV_SCLK2		11
+#define AUD_CLKID_SLV_SCLK3		12
+#define AUD_CLKID_SLV_SCLK4		13
+#define AUD_CLKID_SLV_SCLK5		14
+#define AUD_CLKID_SLV_SCLK6		15
+#define AUD_CLKID_SLV_SCLK7		16
+#define AUD_CLKID_SLV_SCLK8		17
+#define AUD_CLKID_SLV_SCLK9		18
+#define AUD_CLKID_SLV_LRCLK0		19
+#define AUD_CLKID_SLV_LRCLK1		20
+#define AUD_CLKID_SLV_LRCLK2		21
+#define AUD_CLKID_SLV_LRCLK3		22
+#define AUD_CLKID_SLV_LRCLK4		23
+#define AUD_CLKID_SLV_LRCLK5		24
+#define AUD_CLKID_SLV_LRCLK6		25
+#define AUD_CLKID_SLV_LRCLK7		26
+#define AUD_CLKID_SLV_LRCLK8		27
+#define AUD_CLKID_SLV_LRCLK9		28
 #define AUD_CLKID_MST_A_MCLK_SEL	59
 #define AUD_CLKID_MST_B_MCLK_SEL	60
 #define AUD_CLKID_MST_C_MCLK_SEL	61
diff --git a/include/dt-bindings/clock/axg-audio-clkc.h b/include/dt-bindings/clock/axg-audio-clkc.h
index fd9c362099d9..eafb0de8466b 100644
--- a/include/dt-bindings/clock/axg-audio-clkc.h
+++ b/include/dt-bindings/clock/axg-audio-clkc.h
@@ -7,26 +7,6 @@
 #ifndef __AXG_AUDIO_CLKC_BINDINGS_H
 #define __AXG_AUDIO_CLKC_BINDINGS_H
 
-#define AUD_CLKID_SLV_SCLK0		9
-#define AUD_CLKID_SLV_SCLK1		10
-#define AUD_CLKID_SLV_SCLK2		11
-#define AUD_CLKID_SLV_SCLK3		12
-#define AUD_CLKID_SLV_SCLK4		13
-#define AUD_CLKID_SLV_SCLK5		14
-#define AUD_CLKID_SLV_SCLK6		15
-#define AUD_CLKID_SLV_SCLK7		16
-#define AUD_CLKID_SLV_SCLK8		17
-#define AUD_CLKID_SLV_SCLK9		18
-#define AUD_CLKID_SLV_LRCLK0		19
-#define AUD_CLKID_SLV_LRCLK1		20
-#define AUD_CLKID_SLV_LRCLK2		21
-#define AUD_CLKID_SLV_LRCLK3		22
-#define AUD_CLKID_SLV_LRCLK4		23
-#define AUD_CLKID_SLV_LRCLK5		24
-#define AUD_CLKID_SLV_LRCLK6		25
-#define AUD_CLKID_SLV_LRCLK7		26
-#define AUD_CLKID_SLV_LRCLK8		27
-#define AUD_CLKID_SLV_LRCLK9		28
 #define AUD_CLKID_DDR_ARB		29
 #define AUD_CLKID_PDM			30
 #define AUD_CLKID_TDMIN_A		31
-- 
2.20.1

