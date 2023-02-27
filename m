Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FDBC7EE32
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 18:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjB0SkE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 13:40:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbjB0SkD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 13:40:03 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A702196B
        for <linux-clk@vger.kernel.org>; Mon, 27 Feb 2023 10:40:02 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id u6so4487503ilk.12
        for <linux-clk@vger.kernel.org>; Mon, 27 Feb 2023 10:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVRZ9O/xeg4wvwaNlAos7VzArnRbqSw6RvITnKjvv3o=;
        b=OCf1tJpoZBimcQbIcNpDBt/mvRM6YLDEVQ+vNB2XgrlMV1TUJyD6z4NFxQPO3wD11E
         TtD2Lazai5TYeiokozdyymD0ge+a+06FSh8ZYKB2LQDDjsiafWLi9Qnn8JoOGGkRMwvB
         F6QrRCzKjEm6JulYpxblbcLOcC4Qq4yNonJRISV/988jadh/PMOZTClBLNhGbMytLqel
         PYPIn3+NRWNgDzx8sIJFcQhPP8H0EGMPLkuHfjJqRehy/ooApr3rz0BASB3yg4uZ/Zxb
         TS4d2IFDKv7iNXRH/lQYExn9iud1qxC6MYwn7klEjp7NtENCf2lJMKtAWJG3D9jw5fPO
         Yz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVRZ9O/xeg4wvwaNlAos7VzArnRbqSw6RvITnKjvv3o=;
        b=Zw+TaY28/Z9lJVDvXnC2R0jT8Bd8nmyGTkHfYFLikc/vojGLQSmwhydv/ZN4Eo/EUj
         i6LKMEJ3zwe6HtOZX3txmGjGAUjP5Jy8dYul9h93gjt2ku/VLQF76iFylPE4351ZBA4D
         hh+6WXhDoBwOX1txjgR1C7RRmkrfm/CZt7C2ekAu8xs4IEOEB0iHuCe2moTtSkjSKyeT
         aSveF9pCQfj5k4nUf9wpLhgO5vhFQ3AZB9yzFpvX04a5bs1PYj+UbQHnPHctax/ubQZ8
         pVE+bSNrDUFfDZtAzCdUZq9y9l9LIgspHObbNUFSo2hpiWzvUseNDqdIaI5Ojb0qdmu4
         DPvQ==
X-Gm-Message-State: AO0yUKUCkq1tg/BWb3CAuLz1L8k74pFVO7KNzEyAORZJCNOlU85tcoOX
        gsHyOYGBqXE8CLgKy0Lmc4r9Gw==
X-Google-Smtp-Source: AK7set+xvC4SuSCk/6xKyfNThoKXIM58aHFlkB3JprMaUJb+RkHI9w3pcDJaAbTJpeRSDXmBPLJLMw==
X-Received: by 2002:a05:6e02:1a07:b0:315:554e:e73b with SMTP id s7-20020a056e021a0700b00315554ee73bmr362875ild.21.1677523201466;
        Mon, 27 Feb 2023 10:40:01 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id t5-20020a02ab85000000b003ab21c8fa84sm2331202jan.121.2023.02.27.10.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 10:40:01 -0800 (PST)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH 2/4] clk: renesas: r9a06g032: drop unused fields
Date:   Mon, 27 Feb 2023 13:39:34 -0500
Message-Id: <20230227183937.377612-3-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227183937.377612-1-ralph.siemsen@linaro.org>
References: <20230227183937.377612-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop three unused fields from the clock descriptor structure, and update
the macros for filling such structures accordingly.

The values for such fields are kept in the source code, now unused, in
case they are needed later.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---

 drivers/clk/renesas/r9a06g032-clocks.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 75a095a15c03..8a1ab9da19ae 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -28,8 +28,9 @@
 #define R9A06G032_SYSCTRL_DMAMUX 0xA0
 
 struct r9a06g032_gate {
-	u16 gate, reset, ready, midle,
-		scon, mirack, mistat;
+	u16 gate, reset, ready, midle;
+	/* Unused fields omitted to save space */
+	/* u16 scon, mirack, mistat; */
 };
 
 enum gate_type {
@@ -67,14 +68,18 @@ struct r9a06g032_clkdesc {
 	};
 };
 
+/*
+ * The last three arguments are not currently used,
+ * but are kept in the r9a06g032_clocks table below.
+ */
 #define I_GATE(_clk, _rst, _rdy, _midle, _scon, _mirack, _mistat) { \
 	.gate = _clk, \
 	.reset = _rst, \
 	.ready = _rdy, \
 	.midle = _midle, \
-	.scon = _scon, \
-	.mirack = _mirack, \
-	.mistat = _mistat \
+	/* .scon = _scon, */ \
+	/* .mirack = _mirack, */ \
+	/* .mistat = _mistat */ \
 }
 #define D_GATE(_idx, _n, _src, ...) { \
 	.type = K_GATE, \
-- 
2.25.1

