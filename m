Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B3CC04A6A
	for <linux-clk@archiver.kernel.org>; Thu,  3 Aug 2023 10:28:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234641AbjHCK2g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Aug 2023 06:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235128AbjHCK2e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Aug 2023 06:28:34 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A3D02D5F
        for <linux-clk@vger.kernel.org>; Thu,  3 Aug 2023 03:28:28 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99bccc9ec02so116212166b.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Aug 2023 03:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691058506; x=1691663306;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i049ZInOq2yluY7bnih0rFbUzwff8GQ7+pLs9TQtg4c=;
        b=SBnEj775OYQGYsstUJRhRWBZ+LMYPsAxiMuRgw6FuxZlyBi31UWblxpPdOH3lnhPWI
         UjaRU3vAA/Od0zguMOpIOnoPVCl8aU+MbLhWoyfqValEr0VNRe3x2IEpbBGzdx6a0k7n
         NdCP/A3zaZeh+5A+cCRZdTzd23JACuornyv+82pmdGHvGTY+TdcbHKMeKXRblZHwg4lN
         tGkmv76brL+vM7Xjf+tv3oZhln56PnJyQI4JTffuyXwe67YrbvCqUbcY4jfzjeEr75B9
         NzPSp97EFemO926P8VGO2K2PUb0M4n4gG/KHn4EoOGbsXw1sD3i1sxFwudtl/svNIdDV
         DZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691058506; x=1691663306;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i049ZInOq2yluY7bnih0rFbUzwff8GQ7+pLs9TQtg4c=;
        b=kN33K4bEyQCFFBPMCWFSMI6qpswKk2MBissTB1AZE7VBvdPbJXb0L9PJ7hkJ6SE7mu
         DhYitzZnMV0r+sFLv2jEtyIUHrDhXF8iGTuOZcm2n93uPs//xvFmq3RgLZfNWAHIx+Pw
         dM2ohYubE1MYPiv+0GucfXFCJvZmCved4ALftg7gznYMLUG9YeAJLY0mHIKmwsnOiDaI
         /mL3ned6jHqWFx+On6aSR5UtINSprXC/mdVCn/6P/yjxkIPPEH9QXn5VzqVy4PhA3Cev
         HMh8yixCj+Ds0U//hLaI/L72ERx/QNBI5CTyjiqOWpFaEv1+EmS+g5W2xoakxfBfrRhu
         rtCw==
X-Gm-Message-State: ABy/qLaxbfZwxQzsIQmRD+G6FiTLMyjBBGrxBAL47Gt06uOaBJdqHqwS
        XAAO5uJiPSyu/k63/j8eHL0vxw==
X-Google-Smtp-Source: AGHT+IGU0fbx2qHT6v2F9ZfYl+51nPklKjasjpEt33Gk06n04Bpcu4ndxE96TZ9OMlprDL2+kWBiFw==
X-Received: by 2002:a17:906:51ca:b0:99c:56d1:7c71 with SMTP id v10-20020a17090651ca00b0099c56d17c71mr2732850ejk.26.1691058506577;
        Thu, 03 Aug 2023 03:28:26 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
        by smtp.gmail.com with ESMTPSA id i18-20020a170906115200b00992665694f7sm10291915eja.107.2023.08.03.03.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 03:28:26 -0700 (PDT)
Date:   Thu, 3 Aug 2023 13:28:20 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     daniel@0x0f.com
Cc:     linux-clk@vger.kernel.org
Subject: [bug report] clk: mstar: MStar/SigmaStar MPLL driver
Message-ID: <c1e89c69-3ddf-4a02-bd79-72872e42c01a@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Daniel Palmer,

The patch bef7a78da716: "clk: mstar: MStar/SigmaStar MPLL driver"
from Feb 11, 2021 (linux-next), leads to the following Smatch static
checker warning:

	drivers/clk/mstar/clk-msc313-mpll.c:134 msc313_mpll_probe()
	error: buffer overflow 'mpll->clk_data->hws' 7 <= 7

drivers/clk/mstar/clk-msc313-mpll.c
    106 
    107         mpll->clk_data = devm_kzalloc(dev, struct_size(mpll->clk_data, hws,
                                                                               ^^^
    108                         ARRAY_SIZE(output_dividers)), GFP_KERNEL);
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
->hws has 7 elements

    109         if (!mpll->clk_data)
    110                 return -ENOMEM;
    111 
    112         clk_init.name = dev_name(dev);
    113         clk_init.ops = &msc313_mpll_ops;
    114         clk_init.parent_data = &mpll_parent;
    115         clk_init.num_parents = 1;
    116         mpll->clk_hw.init = &clk_init;
    117 
    118         ret = devm_clk_hw_register(dev, &mpll->clk_hw);
    119         if (ret)
    120                 return ret;
    121 
    122         mpll->clk_data->num = NUMOUTPUTS;
    123         mpll->clk_data->hws[0] = &mpll->clk_hw;
    124 
    125         for (i = 0; i < ARRAY_SIZE(output_dividers); i++) {
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^
i is 0-6.

    126                 outputname = devm_kasprintf(dev, GFP_KERNEL, "%s_div_%u",
    127                                 clk_init.name, output_dividers[i]);
    128                 if (!outputname)
    129                         return -ENOMEM;
    130                 divhw = devm_clk_hw_register_fixed_factor(dev, outputname,
    131                                 clk_init.name, 0, 1, output_dividers[i]);
    132                 if (IS_ERR(divhw))
    133                         return PTR_ERR(divhw);
--> 134                 mpll->clk_data->hws[i + 1] = divhw;

Off by one.  Why is this i + 1 instead of just i?

    135         }
    136 
    137         platform_set_drvdata(pdev, mpll);
    138 
    139         return devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
    140                         mpll->clk_data);
    141 }

regards,
dan carpenter
