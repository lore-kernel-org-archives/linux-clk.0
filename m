Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FBBCDB47E
	for <linux-clk@archiver.kernel.org>; Wed, 18 Oct 2023 16:19:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbjJRQTA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Oct 2023 12:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbjJRQS6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Oct 2023 12:18:58 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97ECCBD;
        Wed, 18 Oct 2023 09:18:57 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3af957bd7e9so4469881b6e.3;
        Wed, 18 Oct 2023 09:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697645937; x=1698250737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJC+C4OtuULaekIgETfG9hZQeFdTuWayXpQ5YRaiN4w=;
        b=G5zmypFqA3kaSIyWkg2Fp4WqmSKcCNILEj2uDt2wuso629ge8RvQTzGr6M5FlWi9nD
         QsDw5rxCePQlmZptnrV514HxSbdun5vjrFDm31n36zMs6as0zCs3kzE5JD661h2d9bUw
         NSESLEmmcifyejN55MmCRXk9qxSh7QZtfxD4JkGEWbIJSEgFZY36pR5VMxRDzQc8dgK5
         XklxKZk6Qmgm9+6lerUYLMFt1ke3CTylH2b/TpmNfZfVnCrDQiMl2hUqpmh18fIq7VRd
         oa9UBWj6BXGYZ9N+pk0LQhnp5SYPTXnusR0+bTqnOICSDsaVrJYVjxK6MlK04OgaMV4m
         y2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697645937; x=1698250737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJC+C4OtuULaekIgETfG9hZQeFdTuWayXpQ5YRaiN4w=;
        b=sbJzl33JazW+1QbZHbuwOySE0qA6U9iaBWHzztCrfL4npjLq1wwCQtNiCD0YWJ6VfN
         t0YVxdhHj5gGNUOTcpfOhMvdGcieeJUhEgQ5o1t7ivPlrn3o07mmORc8Pp2WLOYJLl1O
         rNigBsmlnVuC/q5SMHBiNWh+PsidjaMrF3t92YRkfrf9Hx8GDB/JwAfaz0YpoZzqsXkC
         hNLYSV3BG+35xIjc++kJoDd6bnNX6ros/z9fAH+d7riFIT8ObB6hEaiM56P5wHWfY7J8
         7xKGCHdzkkQdtBi5xJWew6yJJwZKEJ/95DzUUyF5RDMklMVDKWpue1QpdSWM9mqAqPDI
         Cnbw==
X-Gm-Message-State: AOJu0YyL15jWkTpuBaFEVCAN0wj94F/xWZzqXsul4/w/GzJ1+G9D5AbT
        NIgYQng4+QJ8HLY8ndci5vM=
X-Google-Smtp-Source: AGHT+IEyC/5eqkKVkMLwJ6n6DXED2z+hXcF3NA1uSNWAQv0tYW9JWBm7ZuVXNvSMVxSCboUAsi626g==
X-Received: by 2002:a05:6808:211e:b0:3ae:1298:257a with SMTP id r30-20020a056808211e00b003ae1298257amr7454580oiw.1.1697645936910;
        Wed, 18 Oct 2023 09:18:56 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id db14-20020a056808408e00b003afe584ed4fsm697390oib.42.2023.10.18.09.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 09:18:56 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-rockchip@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, sebastian.reichel@collabora.com,
        sboyd@kernel.org, mturquette@baylibre.com, daniel@ffwll.ch,
        airlied@gmail.com, sam@ravnborg.org, neil.armstrong@linaro.org,
        heiko@sntech.de, conor+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 3/5] clk: rockchip: rk3568: Add PLL rate for 115.2MHz
Date:   Wed, 18 Oct 2023 11:18:46 -0500
Message-Id: <20231018161848.346947-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018161848.346947-1-macroalpha82@gmail.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add support for a PLL rate of 115.2MHz so that the Powkiddy RK2023 panel
can run at a requested 60hz (59.99, close enough).

I have confirmed this rate fits with all the constraints
listed in the TRM for the VPLL (as an integer PLL) in Part 1 "Chapter
2 Clock & Reset Unit (CRU)."

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/clk/rockchip/clk-rk3568.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index db713e1526cd..bfbcbb744327 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -79,6 +79,7 @@ static struct rockchip_pll_rate_table rk3568_pll_rates[] = {
 	RK3036_PLL_RATE(148500000, 1, 99, 4, 4, 1, 0),
 	RK3036_PLL_RATE(135000000, 2, 45, 4, 1, 1, 0),
 	RK3036_PLL_RATE(119000000, 3, 119, 4, 2, 1, 0),
+	RK3036_PLL_RATE(115200000, 1, 24, 5, 1, 1, 0),
 	RK3036_PLL_RATE(108000000, 2, 45, 5, 1, 1, 0),
 	RK3036_PLL_RATE(101000000, 1, 101, 6, 4, 1, 0),
 	RK3036_PLL_RATE(100000000, 1, 150, 6, 6, 1, 0),
-- 
2.34.1

