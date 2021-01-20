Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9591BC433DB
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 10:45:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C24B23332
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 10:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730406AbhATKbU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Jan 2021 05:31:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731369AbhATJb1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jan 2021 04:31:27 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B47D8C061575
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:30:46 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id v184so2191679wma.1
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bN1EA9Jtu/mSRFpfLqJ4hYJd1C2lXhS1XjJCl6CFg1g=;
        b=zFYfx91XPKACjv/flqRWziV33Y4m/EmmyZgP+idh0JI5dCaeislX7SISmaLy2s4VR7
         TIc1ogI7o6CjxnsWalSTE5E/3mDU/Dt9phL15/9AbLNEQW72xnXogiNhgutU8MmGoO93
         Jv4du5hB7Px9HKxcCnEB1RVI476qeKJqLJo8S6/DiBQJ72je2SmV2umD81hzKuyPpm7k
         LbS+mWh5mZyQUje328YOPnyARiClql6txorS+c+WVnuF4iSZJCSE7JIz3KQJRmL5wwsC
         hmSNKVZDLydPhFLGljT+Jfv+sefoEExI+oL65ad3J1xNjCFPK4zzlSzB7xU349ywBE/U
         7msQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bN1EA9Jtu/mSRFpfLqJ4hYJd1C2lXhS1XjJCl6CFg1g=;
        b=RH2mI0jMBU4zFb4KeCrFsutqYR5j8A0A9LtEtkAGvmsQNXtOSbyLKsYJDmrBT9yV33
         HtXsHwU0SN7OhpXT6fFFXQLNxSshcicRBJ8LL6yB1sVejGrPg2weaKdloPKk6bx0NdzM
         WgwRD8P9HqiImMmwQ1k7WDmXKJYm9NSwaQjMKmdGT1nqvbJ1ruhmN11DMxzxO9Axr/du
         lLPhuNmtzbD36iSXzSp5KhGnlcv3uafusY7se1js9rYH7kxXctZAnAGEzEN+0NCJqBPj
         C+gZJr1c6fzc4/ZhSmh2PckCtHMaUA4VGoyKfCUvSytW2xHZSax42RmQ+7uCknrpAhF8
         g4nQ==
X-Gm-Message-State: AOAM530GNtXl93tYlV+oSWx1nothiyMafAk2Zn52G2Its7WLvSQyU5rS
        kWs0YKHIf4Rm1f+kmkPMeeix9w==
X-Google-Smtp-Source: ABdhPJy0QU7f/Vsm0leMTTjzvUhzClwhW+2h4hj2Ui406VthDvXgvODPTyr3pTl1F0dkQzpvKhwYUg==
X-Received: by 2002:a1c:9d8b:: with SMTP id g133mr3413636wme.44.1611135045419;
        Wed, 20 Jan 2021 01:30:45 -0800 (PST)
Received: from dell.default ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id z130sm2889201wmb.33.2021.01.20.01.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:30:44 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Xing Zheng <zhengxing@rock-chips.com>,
        Thomas Abraham <thomas.ab@samsung.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 01/20] clk: rockchip: clk: Demote non-conformant kernel-doc headers
Date:   Wed, 20 Jan 2021 09:30:21 +0000
Message-Id: <20210120093040.1719407-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120093040.1719407-1-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/rockchip/clk.c:45: warning: Function parameter or member 'name' not described in 'rockchip_clk_register_branch'
 drivers/clk/rockchip/clk.c:45: warning: Function parameter or member 'parent_names' not described in 'rockchip_clk_register_branch'
 drivers/clk/rockchip/clk.c:45: warning: Function parameter or member 'num_parents' not described in 'rockchip_clk_register_branch'
 drivers/clk/rockchip/clk.c:45: warning: Function parameter or member 'base' not described in 'rockchip_clk_register_branch'
 drivers/clk/rockchip/clk.c:45: warning: Function parameter or member 'muxdiv_offset' not described in 'rockchip_clk_register_branch'
 drivers/clk/rockchip/clk.c:45: warning: Function parameter or member 'mux_shift' not described in 'rockchip_clk_register_branch'
 drivers/clk/rockchip/clk.c:45: warning: Function parameter or member 'mux_width' not described in 'rockchip_clk_register_branch'
 drivers/clk/rockchip/clk.c:45: warning: Function parameter or member 'mux_flags' not described in 'rockchip_clk_register_branch'
 drivers/clk/rockchip/clk.c:45: warning: Function parameter or member 'div_offset' not described in 'rockchip_clk_register_branch'
 drivers/clk/rockchip/clk.c:45: warning: Function parameter or member 'div_shift' not described in 'rockchip_clk_register_branch'
 drivers/clk/rockchip/clk.c:45: warning: Function parameter or member 'div_width' not described in 'rockchip_clk_register_branch'
 drivers/clk/rockchip/clk.c:45: warning: Function parameter or member 'div_flags' not described in 'rockchip_clk_register_branch'
 drivers/clk/rockchip/clk.c:45: warning: Function parameter or member 'div_table' not described in 'rockchip_clk_register_branch'
 drivers/clk/rockchip/clk.c:45: warning: Function parameter or member 'gate_offset' not described in 'rockchip_clk_register_branch'
 drivers/clk/rockchip/clk.c:45: warning: Function parameter or member 'gate_shift' not described in 'rockchip_clk_register_branch'
 drivers/clk/rockchip/clk.c:45: warning: Function parameter or member 'gate_flags' not described in 'rockchip_clk_register_branch'
 drivers/clk/rockchip/clk.c:45: warning: Function parameter or member 'flags' not described in 'rockchip_clk_register_branch'
 drivers/clk/rockchip/clk.c:45: warning: Function parameter or member 'lock' not described in 'rockchip_clk_register_branch'
 drivers/clk/rockchip/clk.c:180: warning: Function parameter or member 'hw' not described in 'rockchip_fractional_approximation'
 drivers/clk/rockchip/clk.c:180: warning: Function parameter or member 'rate' not described in 'rockchip_fractional_approximation'
 drivers/clk/rockchip/clk.c:180: warning: Function parameter or member 'parent_rate' not described in 'rockchip_fractional_approximation'
 drivers/clk/rockchip/clk.c:180: warning: Function parameter or member 'm' not described in 'rockchip_fractional_approximation'
 drivers/clk/rockchip/clk.c:180: warning: Function parameter or member 'n' not described in 'rockchip_fractional_approximation'

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Xing Zheng <zhengxing@rock-chips.com>
Cc: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/rockchip/clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index 336481bc6cc72..049e5e0b64f62 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -24,7 +24,7 @@
 #include <linux/rational.h>
 #include "clk.h"
 
-/**
+/*
  * Register a clock branch.
  * Most clock branches have a form like
  *
@@ -170,7 +170,7 @@ static int rockchip_clk_frac_notifier_cb(struct notifier_block *nb,
 	return notifier_from_errno(ret);
 }
 
-/**
+/*
  * fractional divider must set that denominator is 20 times larger than
  * numerator to generate precise clock frequency.
  */
-- 
2.25.1

