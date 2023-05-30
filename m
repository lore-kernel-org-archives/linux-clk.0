Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897DAC7EE2F
	for <linux-clk@archiver.kernel.org>; Tue, 30 May 2023 10:28:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbjE3K2K (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 May 2023 06:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231460AbjE3K1r (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2023 06:27:47 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DE731712
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 03:25:54 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-30959c0dfd6so4288154f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 03:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685442352; x=1688034352;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vkw4yuYcd/6fz17L5CgIxbKkR70sSWZlSJ8WTXxy2UQ=;
        b=muTUhg7e8JQ0TBPhOp/oEEhXJj3eulvy+fxTk3/7sJd+npS3dqWMMYv5xngisJn0ru
         W8uPGfFqxcBriXD7cIJfuDRQQFPtIwMYBUq3BGtbhiP7MxW0y+EIZQ69kCKVYMHSzjaX
         v0APavwm39uiZmyppZHlKUSC+69wkfiZMDMwF1XeO1qEAcaevs02hohQEnVx5/aHb7T2
         Pbxipi4CerzC0qQkEWVG5usM5YOlQKLdyyh0qmG3qtwp30R8+7YRlV01W2+qjQkeI0eG
         JEvGSQywFnuNMevsnNzAm4uhQgSykZr8WG9M7c0drawzSNn5U7uF5HV03XBlU0cXjSNs
         aUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685442352; x=1688034352;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vkw4yuYcd/6fz17L5CgIxbKkR70sSWZlSJ8WTXxy2UQ=;
        b=KmTUBIwtj+au3Go0UbK0IHzb5UiSAAou08rpR4B6BOyjAkGi7ZXanq9kgZd40CBHGL
         u190d5p4436giUX+9W8t2uLvhN6mK7XBrLzQBHP2Zh+Qsc4qDmN5ZrJxF6bYtUxrrbQY
         bmwI951dOdFevwUsc3eA/LrN8ddBaY5ihWypaAZGSUVFBnFX1XqL42y5UkYDepSdyp6o
         +G8zLg0i+CMi/UYQ/nBBKU3tgVbLRXreHl2Ql6lbqJiNvWnFA6QIHRfEq1+0BriZATCe
         uh/qcskXlOYOKKM5A6FnvKsBrn3tx0DL0SGKrT8fJtQVltL6d4wiymwO+U+FszFlXS42
         Qfgw==
X-Gm-Message-State: AC+VfDwmJ5ASrFMv+T0rAyP+Uh0EPVjwRLUuS1mn3UBs+tI/9WSN/7qk
        qtwptobRX26u+VZNFZmIO0cybg==
X-Google-Smtp-Source: ACHHUZ6n52yyVYwzLBwekl/HrBhTIt4qjRT+tt3BVirlo0xYwYiNpYbioIzVyC/m9l3/pItsUnZCow==
X-Received: by 2002:adf:f20c:0:b0:30a:f3ca:17ad with SMTP id p12-20020adff20c000000b0030af3ca17admr1213582wro.66.1685442352514;
        Tue, 30 May 2023 03:25:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x2-20020adff0c2000000b0030af20aaa3fsm2818104wro.71.2023.05.30.03.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 03:25:51 -0700 (PDT)
Date:   Tue, 30 May 2023 13:25:47 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     shubhrajyoti.datta@amd.com
Cc:     linux-clk@vger.kernel.org
Subject: [bug report] clocking-wizard: Support higher frequency accuracy
Message-ID: <563faee5-cc16-4e57-870a-29516724ce7b@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Shubhrajyoti Datta,

The patch 595c88cda65d: "clocking-wizard: Support higher frequency
accuracy" from Mar 27, 2023, leads to the following Smatch static
checker warning:

	drivers/clk/xilinx/clk-xlnx-clock-wizard.c:286 clk_wzrd_dynamic_all_nolock()
	warn: sleeping in atomic context

drivers/clk/xilinx/clk-xlnx-clock-wizard.c
    254 static int clk_wzrd_dynamic_all_nolock(struct clk_hw *hw, unsigned long rate,
    255                                        unsigned long parent_rate)
    256 {
    257         struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
    258         unsigned long vco_freq, rate_div, clockout0_div;
    259         u32 reg, pre, value, f;
    260         int err;
    261 
    262         err = clk_wzrd_get_divisors(hw, rate, parent_rate);
    263         if (err)
    264                 return err;
    265 
    266         vco_freq = DIV_ROUND_CLOSEST(parent_rate * divider->m, divider->d);
    267         rate_div = DIV_ROUND_CLOSEST_ULL((vco_freq * WZRD_FRAC_POINTS), rate);
    268 
    269         clockout0_div = div_u64(rate_div,  WZRD_FRAC_POINTS);
    270 
    271         pre = DIV_ROUND_CLOSEST_ULL(vco_freq * WZRD_FRAC_POINTS, rate);
    272         f = (pre - (clockout0_div * WZRD_FRAC_POINTS));
    273         f &= WZRD_CLKOUT_FRAC_MASK;
    274 
    275         reg = FIELD_PREP(WZRD_CLKOUT_DIVIDE_MASK, clockout0_div) |
    276               FIELD_PREP(WZRD_CLKOUT0_FRAC_MASK, f);
    277 
    278         writel(reg, divider->base + WZRD_CLK_CFG_REG(2));
    279         /* Set divisor and clear phase offset */
    280         reg = FIELD_PREP(WZRD_CLKFBOUT_MULT_MASK, divider->m) |
    281               FIELD_PREP(WZRD_DIVCLK_DIVIDE_MASK, divider->d);
    282         writel(reg, divider->base + WZRD_CLK_CFG_REG(0));
    283         writel(divider->o, divider->base + WZRD_CLK_CFG_REG(2));
    284         writel(0, divider->base + WZRD_CLK_CFG_REG(3));
    285         /* Check status register */
--> 286         err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET, value,
    287                                  value & WZRD_DR_LOCK_BIT_MASK,
    288                                  WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
                                         ^^^^^^^^^^^^^^
The clk_wzrd_dynamic_all() function is holding a spinlock so we cannot
sleep here.

    289         if (err)
    290                 return -ETIMEDOUT;
    291 
    292         /* Initiate reconfiguration */
    293         writel(WZRD_DR_BEGIN_DYNA_RECONF,
    294                divider->base + WZRD_DR_INIT_REG_OFFSET);
    295 
    296         /* Check status register */
    297         return readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET, value,
    298                                  value & WZRD_DR_LOCK_BIT_MASK,
    299                                  WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
    300 }

regards,
dan carpenter
