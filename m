Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F3A0C433DB
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 13:15:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E05042311C
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 13:15:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391568AbhAZNPX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 08:15:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391884AbhAZMrW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2021 07:47:22 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 458A1C0698C2
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:45:47 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id c127so2614839wmf.5
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PGeifpJKwjmOW+Ep9Ua2GRyOjoW8Ji8HLmvStTZxjac=;
        b=v/GZXImGJGb/kVvhK0npWRAIjwWvAMSPszbanie2gyQyaHIgNwv+GU3OY5PEDCFNvb
         Pdc4HM2L/mZ726eJc04eNfiTzO4Z89LCNDfVMeHPSFU3MY1VHTFI6+/myba3re2O/8Zi
         c6h/JKld/C95nLyWd2MAKMotO9aJeyjdcfO5QrDqoAchQcQg5NFB0on4wIzTMMqcT2GU
         CFT5LRCbrpOnA4+gIOhhegepdFDJMwbIYFrbkwXajcdkASOpNhqkyYtwiJ1gM8Zb7ecv
         rBjrxYe5yH1RmYRdRFxfUp/TSCEX4bn8VDsyg4XFIOKnnsI2fQ98NaAipX4yDM/ozDbO
         lpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PGeifpJKwjmOW+Ep9Ua2GRyOjoW8Ji8HLmvStTZxjac=;
        b=HMZ0LJkztoMwK0ito0uwvoTdm3QQk0v7hk5ENzRWc1Wh54viXwTZ/oSyHk58saJu0U
         ed1VXdl5U762JdPuE06VPK8sW50JgjjIoy9mt+KwQzIUafCoDwRNzNa6ZSgq8AN7mf4V
         30/J1xNCKvAXxPpS7xMHRE3E+xTn99EqycQoWu3MQUImHKKpwUsOUIdHGBquPO3hF4v7
         GTXm3HpRPVMp6S0VooiryFkTHs1IE93zVDelT6N/OkLLZ71QxOInITqUXrkCLqt0cnI7
         h9BlEQ2XKkTr6G39YnXJAOvXq0NqRWMyl8n2FPNyEFFzKEmtew4lIaidCuBsHXMcIXmL
         0Vfw==
X-Gm-Message-State: AOAM530Slil8WEA+yGAm2N/3aw/IuK9/1EAU2hIWJv1igN7hY21dmrSD
        n2dVEyUyfsztC7CRJgZjiagJMg==
X-Google-Smtp-Source: ABdhPJxXTxLgbK5EkVRfr+MJjeLWFuHWBUr/C2CyGD6BUSoJivoD9uH6eJohEpOALz25PXoDpvXWJw==
X-Received: by 2002:a1c:f706:: with SMTP id v6mr4568060wmh.85.1611665145981;
        Tue, 26 Jan 2021 04:45:45 -0800 (PST)
Received: from dell.default ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id i131sm3263073wmi.25.2021.01.26.04.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 04:45:45 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 01/21] clk: zynq: pll: Fix kernel-doc formatting in 'clk_register_zynq_pll's header
Date:   Tue, 26 Jan 2021 12:45:20 +0000
Message-Id: <20210126124540.3320214-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/zynq/pll.c:187: warning: Function parameter or member 'name' not described in 'clk_register_zynq_pll'
 drivers/clk/zynq/pll.c:187: warning: Function parameter or member 'parent' not described in 'clk_register_zynq_pll'
 drivers/clk/zynq/pll.c:187: warning: Function parameter or member 'pll_ctrl' not described in 'clk_register_zynq_pll'
 drivers/clk/zynq/pll.c:187: warning: Function parameter or member 'pll_status' not described in 'clk_register_zynq_pll'
 drivers/clk/zynq/pll.c:187: warning: Function parameter or member 'lock_index' not described in 'clk_register_zynq_pll'
 drivers/clk/zynq/pll.c:187: warning: Function parameter or member 'lock' not described in 'clk_register_zynq_pll'

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: "Sören Brinkmann" <soren.brinkmann@xilinx.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/zynq/pll.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/zynq/pll.c b/drivers/clk/zynq/pll.c
index dcb2037a95964..54f4184de89af 100644
--- a/drivers/clk/zynq/pll.c
+++ b/drivers/clk/zynq/pll.c
@@ -173,12 +173,12 @@ static const struct clk_ops zynq_pll_ops = {
 
 /**
  * clk_register_zynq_pll() - Register PLL with the clock framework
- * @name	PLL name
- * @parent	Parent clock name
- * @pll_ctrl	Pointer to PLL control register
- * @pll_status	Pointer to PLL status register
- * @lock_index	Bit index to this PLL's lock status bit in @pll_status
- * @lock	Register lock
+ * @name:	PLL name
+ * @parent:	Parent clock name
+ * @pll_ctrl:	Pointer to PLL control register
+ * @pll_status:	Pointer to PLL status register
+ * @lock_index:	Bit index to this PLL's lock status bit in @pll_status
+ * @lock:	Register lock
  * Returns handle to the registered clock.
  */
 struct clk *clk_register_zynq_pll(const char *name, const char *parent,
-- 
2.25.1

