Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BBEC433B4
	for <linux-clk@archiver.kernel.org>; Wed, 21 Apr 2021 08:58:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5900561447
	for <linux-clk@archiver.kernel.org>; Wed, 21 Apr 2021 08:58:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235762AbhDUI7Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Apr 2021 04:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237743AbhDUI7P (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Apr 2021 04:59:15 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F4A3C06174A
        for <linux-clk@vger.kernel.org>; Wed, 21 Apr 2021 01:58:43 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id b10so41326800iot.4
        for <linux-clk@vger.kernel.org>; Wed, 21 Apr 2021 01:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=xfIthxn5Cj403Bm7HXQsSVRsL492qnjnUjshlFM6QX8=;
        b=twi2SJyu0c4uwVjzk7Az0V2KCvGVHwkOBeP9NFFojwX6d3hFIhiE2o7bw1PXaNSubY
         LfmuhdEspNZZ2uLN34iUEl9nOtoNd0pb3qngDijdcxjwHmR6u5gj0CypGhw9mod25xeD
         T28kHKMaqr/tgfFW4S5t2XibaoISJR8x8tR2/OltFJMHbb0eTATf1YldM7StvsGMxEo2
         c/cS7r7FQmzFiSNl1iyRHmK0taTj+WPE9FY6gVBMqwKjREifTBD18xr/K/YgN5SzPFQi
         0c0BonvZsNGMhjmRJ76me8Pf4XTOlZa2oCD4Bb8tpUqQVmQvnr6C4qy24AfL4ZVrT5eA
         8oTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=xfIthxn5Cj403Bm7HXQsSVRsL492qnjnUjshlFM6QX8=;
        b=UAJViBzqlfLrq2d7+4zKkKjmhBzfjjx2kSH3nBWyM1XsTM0oCdBNWYvXs3NEl4wS1x
         IebMsZ9+exNn3Dh9Q8tf+73ymTtJgSFk0+hD5G6FPfwQNNurBzdLpEKqLzEEmBldb37Q
         GQW1MYxOct4bgt/qs5TkFp8x0oBUwP1vEfir/vNiIxOVz5WHST9uTpw79r5xMODF9CI5
         Jupz/CRJIQool0d+VLehJJc/ibu25Q7FBJC2TYLLYs9+32ICyWSPmuPt7v/gf7vXgeOP
         PBcsb9j3v/obtvKF26r+dhYQ2YjeFqIQlm9rfe9mLG4pU1C9/bRELrSJy0mm6CyKg1u4
         9/tA==
X-Gm-Message-State: AOAM5303hppEN3RJrKJiesz9EFffBhTP3df0xfyXwxlYSCkBpbkIDenM
        cAKSmfKihh0OSCL5ShK38rzoXFld8TH4tuOWCJQ=
X-Google-Smtp-Source: ABdhPJzJ2ZLoN4FPZTQNk7lRhck8dMYSNqpvfpxPiiJocxq51UJvO3ntYsOAi6zPKbUhCdx58aBKk/0ZmYEQh2rRMak=
X-Received: by 2002:a5d:9694:: with SMTP id m20mr22497008ion.40.1618995522579;
 Wed, 21 Apr 2021 01:58:42 -0700 (PDT)
MIME-Version: 1.0
From:   Zhengxun Li <zhengxunli.mxic@gmail.com>
Date:   Wed, 21 Apr 2021 16:58:26 +0000
Message-ID: <CACY_kjR9rvB3dZ9dUAoa9mEp9P=aiYzy7jW1w24t2RUL5OUNUw@mail.gmail.com>
Subject: Re: [PATCH v11 2/5] clk: clocking-wizard: Add the clockwizard to clk directory
To:     shubhrajyoti.datta@xilinx.com
Cc:     git@xilinx.com, gregkh@linuxfoundation.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev,
        michals@xilinx.com, mturquette@baylibre.com, robh+dt@kernel.org,
        sboyd@kernel.org, zhengxunli.mxic@gmail.com, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Shubhrajyoti,

Overflow still occurs.

+static int clk_wzrd_dynamic_reconfig_f(struct clk_hw *hw, unsigned long rate,
+       unsigned long parent_rate)
+{
+ int err;
+ u32 value, pre;
+ unsigned long rate_div, f, clockout0_div;
+ struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+ void __iomem *div_addr = divider->base + divider->offset;
+
+ rate_div = DIV_ROUND_DOWN_ULL(parent_rate * 1000, rate);

rate_div = DIV_ROUND_DOWN_ULL((u64)parent_rate * 1000, rate);

+ clockout0_div = rate_div / 1000;
+
+ pre = DIV_ROUND_CLOSEST((parent_rate * 1000), rate);

pre = DIV_ROUND_CLOSEST_ULL((u64)parent_rate * 1000, rate);

The rest looks good to me.

Thanks,
Zhengxun Li
