Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096F6C433E9
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 10:45:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE96A23332
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 10:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733019AbhATKdg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Jan 2021 05:33:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731411AbhATJcN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jan 2021 04:32:13 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B7BC061794
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:30:50 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id 7so15117060wrz.0
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mIiZ6UdkfZ1pzms9iuBNbuiycjVakqbZxBNbxqLfJT0=;
        b=XmAXV4QTvia9d7Vz/pwW/8VDwM1KnqnvenvY8gWiIM4kU7VmW018gvcjDYTBZDGLvn
         UNJcx0c3Lwhntubpnh/K+KYhcJaeWY30f+AL9iD/SAeDtsB+S61sU2SMHk4dn5mOwoS/
         gkuzsCjm1midnauwlSPHSouHc3o7UsEj4f9W0dnnIiKfXnzmqv8zUTrmowL2VUJ7/PcX
         ltN/5JSGkyzRH5oWfc+tLKMCHxJvUC2JP9R0B39FOMBN5sBg/4OF6GEtcKxF+osaJtry
         HvD73sMOxl1aYjWXlzgbgZ61Eb+G6SNv9ppWLJiTsd4DVDv9n9S2C8z0CY6ankFpaOJP
         ey1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mIiZ6UdkfZ1pzms9iuBNbuiycjVakqbZxBNbxqLfJT0=;
        b=U31vJe4hTJk3C7IrhhiueVjOazfxbmdomLIEOwk1LYCNLauV8TrFYw1rB+X3sGsInq
         q+tkxWxGhOGd78Agyo3MOwka2Mo6D7XQUzew5oKBeIMEExZ6FhTMbTR6ovs0sQ0Up/ty
         RC7J5tFgu7UtQLXAzMKg8EotWHocYH/vaNK59cZRF0u8G4O83JRWFHBc/I8bff3IDXna
         ztVQqx+TNC0W+yvyo55QWIvK+yC/ZVASP4s70GC609o/LDiq4VqGqKP4EVEgBg32T2KR
         63vza1awdUEoxVrgqflijTRd2Efetq5X4eQqFVXkQZKEHNBZNgyYQqZVKsry4tTUas49
         HFtg==
X-Gm-Message-State: AOAM530/mQhNCvjBatDza03U0Nt9nev4TZzA0oOBS5u08hoWu69nkayy
        jOjpc3eacQ7DZrvZxKQLcyRGcg==
X-Google-Smtp-Source: ABdhPJzb9TpEAlS6uB5qzU34JkRauMRiiiQnVSqfLKRcLm1T15iP+zYNBDZVnTR85MF/1qEjQkO7nQ==
X-Received: by 2002:a5d:6311:: with SMTP id i17mr6328988wru.195.1611135048804;
        Wed, 20 Jan 2021 01:30:48 -0800 (PST)
Received: from dell.default ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id z130sm2889201wmb.33.2021.01.20.01.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:30:48 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 04/20] clk: rockchip: clk-half-divider: Demote non-conformant kernel-doc header
Date:   Wed, 20 Jan 2021 09:30:24 +0000
Message-Id: <20210120093040.1719407-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120093040.1719407-1-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/rockchip/clk-half-divider.c:168: warning: Function parameter or member 'name' not described in 'rockchip_clk_register_halfdiv'
 drivers/clk/rockchip/clk-half-divider.c:168: warning: Function parameter or member 'parent_names' not described in 'rockchip_clk_register_halfdiv'
 drivers/clk/rockchip/clk-half-divider.c:168: warning: Function parameter or member 'num_parents' not described in 'rockchip_clk_register_halfdiv'
 drivers/clk/rockchip/clk-half-divider.c:168: warning: Function parameter or member 'base' not described in 'rockchip_clk_register_halfdiv'
 drivers/clk/rockchip/clk-half-divider.c:168: warning: Function parameter or member 'muxdiv_offset' not described in 'rockchip_clk_register_halfdiv'
 drivers/clk/rockchip/clk-half-divider.c:168: warning: Function parameter or member 'mux_shift' not described in 'rockchip_clk_register_halfdiv'
 drivers/clk/rockchip/clk-half-divider.c:168: warning: Function parameter or member 'mux_width' not described in 'rockchip_clk_register_halfdiv'
 drivers/clk/rockchip/clk-half-divider.c:168: warning: Function parameter or member 'mux_flags' not described in 'rockchip_clk_register_halfdiv'
 drivers/clk/rockchip/clk-half-divider.c:168: warning: Function parameter or member 'div_shift' not described in 'rockchip_clk_register_halfdiv'
 drivers/clk/rockchip/clk-half-divider.c:168: warning: Function parameter or member 'div_width' not described in 'rockchip_clk_register_halfdiv'
 drivers/clk/rockchip/clk-half-divider.c:168: warning: Function parameter or member 'div_flags' not described in 'rockchip_clk_register_halfdiv'
 drivers/clk/rockchip/clk-half-divider.c:168: warning: Function parameter or member 'gate_offset' not described in 'rockchip_clk_register_halfdiv'
 drivers/clk/rockchip/clk-half-divider.c:168: warning: Function parameter or member 'gate_shift' not described in 'rockchip_clk_register_halfdiv'
 drivers/clk/rockchip/clk-half-divider.c:168: warning: Function parameter or member 'gate_flags' not described in 'rockchip_clk_register_halfdiv'
 drivers/clk/rockchip/clk-half-divider.c:168: warning: Function parameter or member 'flags' not described in 'rockchip_clk_register_halfdiv'
 drivers/clk/rockchip/clk-half-divider.c:168: warning: Function parameter or member 'lock' not described in 'rockchip_clk_register_halfdiv'

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/rockchip/clk-half-divider.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-half-divider.c b/drivers/clk/rockchip/clk-half-divider.c
index ccd5c270c2132..64f7faad2148f 100644
--- a/drivers/clk/rockchip/clk-half-divider.c
+++ b/drivers/clk/rockchip/clk-half-divider.c
@@ -145,7 +145,7 @@ static const struct clk_ops clk_half_divider_ops = {
 	.set_rate = clk_half_divider_set_rate,
 };
 
-/**
+/*
  * Register a clock branch.
  * Most clock branches have a form like
  *
-- 
2.25.1

