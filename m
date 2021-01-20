Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B37C4332E
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 10:45:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DD2023332
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 10:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733199AbhATKh4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Jan 2021 05:37:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729711AbhATJdQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jan 2021 04:33:16 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D62C0617A7
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:30:59 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id m4so22349623wrx.9
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gy/ffcyv+jl5ONvP440UlkfrpqU6FIgU7urCShkm4OI=;
        b=omrjd7cTKpQWFzEGTXkrvtiMN99fcr7fPH9QowfCoqdRDMi4DGMHuYbRe0o8Vpkcpz
         AnGbBrW+y7BidiYzHJPHlN9brc2hxwAaPFMC+EXyUaR1H6kGVAbe/j+6yuO5HH1kACUD
         kNC9+HZEdQNLMDCFU6QBoI9lspdy4T5P3heJdr8+Qx518iDZOzs0M3OTbcl85v5Zv/84
         p6bpZgxdTNIQcaSC3IKiPUVoTusuls4s18jwTg4Ea5Lp2vkFt/DxbFaB78uRA+7G2J/u
         +3kl2OS+4J5O/2MLYbvL9FRuasdVreN+1ZiFXB27tP4sq6Xdi16QB3501oFlV8wcVhn+
         6qZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gy/ffcyv+jl5ONvP440UlkfrpqU6FIgU7urCShkm4OI=;
        b=IG+0pZWipm+jxPydSKuF5qZOGhtd05LC++3l43MhF2TBIXM3H207LHYqr6X2IaPdhf
         IYZsvFnA6tz9qW16huST0VfxH5hltJs6wEuwmIH6wuf2Mbm5SH4iFq6EQsSpCqfZRqRc
         GCM60gm2dEsglHrDgcoDSroPO72P2B8klTW1/FHLPIC0bNDCbCkQr6BaRXg76XR00Ecp
         Plufd+Mgi9PVThRqDGZKyXHmueZrlH0cT3oG+0KH/P3owF6qbkmj2TSl2Q5mwQsRtSKq
         51aWXBL1zNM/L5Q85ZzhhMzcZ64GkBCVcaUhpBIKO1TItd1ohNKtNB5mE5U5JoSNycnX
         A/UA==
X-Gm-Message-State: AOAM531GwFhz5zEXPouyzSBQACM+lefZ8rjUGyJ7IErU17gpKdflA/u7
        4ylb6kIZvGgPlPupk1wyJzvfdg==
X-Google-Smtp-Source: ABdhPJzsRP1NA0gWnWpOHahAdgA06LuJTvTyN73FXH9LjfMxfAdG8Yd/nWhryNZda9bpTi1lrPua7A==
X-Received: by 2002:adf:a34d:: with SMTP id d13mr8480701wrb.194.1611135058083;
        Wed, 20 Jan 2021 01:30:58 -0800 (PST)
Received: from dell.default ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id z130sm2889201wmb.33.2021.01.20.01.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:30:57 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Stephen Gallimore <stephen.gallimore@st.com>,
        Pankaj Dev <pankaj.dev@st.com>, linux-clk@vger.kernel.org
Subject: [PATCH 12/20] clk: st: clkgen-fsyn: Fix worthy struct documentation demote partially filled one
Date:   Wed, 20 Jan 2021 09:30:32 +0000
Message-Id: <20210120093040.1719407-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120093040.1719407-1-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/st/clkgen-fsyn.c:186: warning: Function parameter or member 'data' not described in 'st_clk_quadfs_pll'
 drivers/clk/st/clkgen-fsyn.c:466: warning: Function parameter or member 'regs_base' not described in 'st_clk_quadfs_fsynth'
 drivers/clk/st/clkgen-fsyn.c:466: warning: Function parameter or member 'lock' not described in 'st_clk_quadfs_fsynth'
 drivers/clk/st/clkgen-fsyn.c:466: warning: Function parameter or member 'data' not described in 'st_clk_quadfs_fsynth'
 drivers/clk/st/clkgen-fsyn.c:466: warning: Function parameter or member 'chan' not described in 'st_clk_quadfs_fsynth'
 drivers/clk/st/clkgen-fsyn.c:466: warning: Function parameter or member 'md' not described in 'st_clk_quadfs_fsynth'
 drivers/clk/st/clkgen-fsyn.c:466: warning: Function parameter or member 'pe' not described in 'st_clk_quadfs_fsynth'
 drivers/clk/st/clkgen-fsyn.c:466: warning: Function parameter or member 'sdiv' not described in 'st_clk_quadfs_fsynth'

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Stephen Gallimore <stephen.gallimore@st.com>
Cc: Pankaj Dev <pankaj.dev@st.com>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/st/clkgen-fsyn.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/st/clkgen-fsyn.c b/drivers/clk/st/clkgen-fsyn.c
index f1adc858b5907..dd6062e043e02 100644
--- a/drivers/clk/st/clkgen-fsyn.c
+++ b/drivers/clk/st/clkgen-fsyn.c
@@ -172,10 +172,10 @@ static const struct clkgen_quadfs_data st_fs660c32_D = {
  *                                  ST quad channel frequency synthesizer block
  *
  * @hw: handle between common and hardware-specific interfaces.
- * @ndiv: regmap field for the ndiv control.
  * @regs_base: base address of the configuration registers.
  * @lock: spinlock.
- *
+ * @data: local driver data
+ * @ndiv: regmap field for the ndiv control.
  */
 struct st_clk_quadfs_pll {
 	struct clk_hw	hw;
@@ -426,7 +426,7 @@ static struct clk * __init st_clk_register_quadfs_pll(
  * parent - fixed parent.  No clk_set_parent support
  */
 
-/**
+/*
  * struct st_clk_quadfs_fsynth - One clock output from a four channel digital
  *                                  frequency synthesizer (fsynth) block.
  *
-- 
2.25.1

