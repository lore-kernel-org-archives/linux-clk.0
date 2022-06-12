Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57715CCA473
	for <linux-clk@archiver.kernel.org>; Sun, 12 Jun 2022 19:31:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234391AbiFLTbT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 12 Jun 2022 15:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234959AbiFLTaP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Jun 2022 15:30:15 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B96CF41FBE
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:14 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id gd1so3858668pjb.2
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ssmxgu7/WVcfzUuifiGObu7zWoTqolOirVs5XPrVt3A=;
        b=Kzap7XLBwCwfSpamfeUSffG16sJvbz6zF7IytsvdbWKYE9MT4FMzGtU7FKCj7A21Px
         h8AGQ/GjAz/k8Sd1Q8OjKCIIrYnucTQ+TdTF7RPbYXxM6dU53Uzd3ieFbRmtq8nZNBR+
         q4SilJSh0QVuorQzbyB2QWOg4pRNsQwrIpC+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ssmxgu7/WVcfzUuifiGObu7zWoTqolOirVs5XPrVt3A=;
        b=G1JYKCUvUkhwrB3KbfzooLmgjckWQUSUAWmbUsGmasDsjIoaIQTE3r3x3fLfzap6JX
         Uv9RogtaYKFFoodXA/hJxU/3GRvz6r3EMPuoTrAkx+sIl7zF+xvK76gC7bnS2G0VdE3U
         y5UtZ32XtSL2hSafdDaNdkrDSBtI8XnE5m0tdr9u52NFt3VIrgYWMBQdnIGFp32733t9
         YS9FCNLLyamhdNKcl+KzSwv8j+UYEzqqFar3HIJv8S8Gnb4fVu+xz7iidsBz6yCZaeFj
         RTt1AkJHnENBX0NOjXzTJN41JqFshp49LjVQ+cMwmTBqMV9hUMSvkqI12Wpp7IBYKNeJ
         iz3g==
X-Gm-Message-State: AOAM533IY/sK8mwHZLfF5zTn2kZ4dId6yNQs/kaFj40j4ubj76PUsdba
        ka9rNJHXclkmuM6s4ojICqIs+g==
X-Google-Smtp-Source: ABdhPJzweDtxhwKJRSdLbgbvFVJldlf7U7zT4zMbctp+XLX8Qwlxs8JwOzOdJi31hXPUxMJC0sZ9JA==
X-Received: by 2002:a17:90a:7023:b0:1e8:a692:b3e9 with SMTP id f32-20020a17090a702300b001e8a692b3e9mr11592198pjk.176.1655062214211;
        Sun, 12 Jun 2022 12:30:14 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.243])
        by smtp.gmail.com with ESMTPSA id i62-20020a628741000000b0050dc76281bdsm3603607pfe.151.2022.06.12.12.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 12:30:14 -0700 (PDT)
From:   Doug Brown <doug@schmorgal.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
Subject: [PATCH 08/12] clk: mmp: pxa168: fix GPIO clock enable bits
Date:   Sun, 12 Jun 2022 12:29:33 -0700
Message-Id: <20220612192937.162952-9-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220612192937.162952-1-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

According to the datasheet, only bit 0 of APBC_GPIO should be controlled
for the clock enable. Bit 1 is marked as reserved (always write 0).

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 drivers/clk/mmp/clk-of-pxa168.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mmp/clk-of-pxa168.c b/drivers/clk/mmp/clk-of-pxa168.c
index d779b3f89656..eb6a651d2366 100644
--- a/drivers/clk/mmp/clk-of-pxa168.c
+++ b/drivers/clk/mmp/clk-of-pxa168.c
@@ -182,7 +182,7 @@ static struct mmp_param_mux_clk apbc_mux_clks[] = {
 static struct mmp_param_gate_clk apbc_gate_clks[] = {
 	{PXA168_CLK_TWSI0, "twsi0_clk", "twsi0_mux", CLK_SET_RATE_PARENT, APBC_TWSI0, 0x3, 0x3, 0x0, 0, &twsi0_lock},
 	{PXA168_CLK_TWSI1, "twsi1_clk", "twsi1_mux", CLK_SET_RATE_PARENT, APBC_TWSI1, 0x3, 0x3, 0x0, 0, &twsi1_lock},
-	{PXA168_CLK_GPIO, "gpio_clk", "vctcxo", CLK_SET_RATE_PARENT, APBC_GPIO, 0x3, 0x3, 0x0, 0, &reset_lock},
+	{PXA168_CLK_GPIO, "gpio_clk", "vctcxo", CLK_SET_RATE_PARENT, APBC_GPIO, 0x1, 0x1, 0x0, 0, &reset_lock},
 	{PXA168_CLK_KPC, "kpc_clk", "kpc_mux", CLK_SET_RATE_PARENT, APBC_KPC, 0x3, 0x3, 0x0, MMP_CLK_GATE_NEED_DELAY, &kpc_lock},
 	{PXA168_CLK_RTC, "rtc_clk", "clk32", CLK_SET_RATE_PARENT, APBC_RTC, 0x83, 0x83, 0x0, MMP_CLK_GATE_NEED_DELAY, NULL},
 	{PXA168_CLK_PWM0, "pwm0_clk", "pwm0_mux", CLK_SET_RATE_PARENT, APBC_PWM0, 0x3, 0x3, 0x0, 0, &pwm0_lock},
-- 
2.25.1

