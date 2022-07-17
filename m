Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E4B6CCA479
	for <linux-clk@archiver.kernel.org>; Sun, 17 Jul 2022 03:08:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233640AbiGQDIm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 16 Jul 2022 23:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233476AbiGQDIg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 16 Jul 2022 23:08:36 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A059C15724
        for <linux-clk@vger.kernel.org>; Sat, 16 Jul 2022 20:08:35 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1013ecaf7e0so15580371fac.13
        for <linux-clk@vger.kernel.org>; Sat, 16 Jul 2022 20:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gIxUE5cXSV3+QGx/oRwxtYuDWIYOJbAf1W0ycXXi4ag=;
        b=lX11eWz3WxHgwgSc4EqDi3y/9st0DQwgDeuy/rZs4c8JS8PbbTm35VgxaJm6HfHtNB
         RFjBvtgcUEY4xktxvmdIwhmE6CIysuC9QW3dFirii4jdwzyH62qb4/Bksd9cNccQHoXZ
         7/Uyz0ijvljcoj9zvv+cDXzae2x9YtJ/NAAljWH7UBvkO82F/CHGBBllaXi2kcIHdPx2
         iwceKVnKHfC9dCiTFquH9WVn14+pmvhU/a78h/S3ooeb1T5QZbffZZjPkuEEKBC1lacp
         eD7RZxlUDVvXy3GRH7LzlV3n7Ok5zzLYPZgVtOu5BX0sW/CJT9a7OI7/DPlhQmU80joN
         l5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gIxUE5cXSV3+QGx/oRwxtYuDWIYOJbAf1W0ycXXi4ag=;
        b=d5jlPf5ZzsbV8yVvG93yY/FygP2ET48ZxP3MFBmMwSFLdv0Wt+6KPP1aF3qGsIesUf
         G4mhIAI3rFn95BpSP2cgMcXRP/aJuhCCXvoLAYRvwRZAjaq+GnQ/7sXsXGKN5a5pC6GY
         o5jmH2sURt/YYhzF9d5DwJljmC9352PRpSjiVnjkYM73A7mWo18yOzs9pyZ8kZ6LPnye
         z6wl6kKYcbYWF8pKtjfQdmo9DDjc4FSV0Iz+StgSqVmFKOM/Lyo3MTbHe797GPv8v/9J
         +vU9FXuXmYeMfLE/bjWt56f92INX2RMwPkgNN5ey06tc8veaoC4YDXopA8BqFcmPuiQJ
         Nryw==
X-Gm-Message-State: AJIora/Tq3tOmF4AJgtytKAZJItRsZtVkBHNCcIMcSSqp6cUxWEn1VAw
        c9KSzE3T8R9Jdpf6lmNtLSGzbA==
X-Google-Smtp-Source: AGRyM1slwpooy2vZuZujiQWhMlKWXik47foLA/lsehdf1RlFAm9Q1KkX3Xjeh/nCMpsfeTfdniynmw==
X-Received: by 2002:a05:6870:c1cb:b0:10b:f2d0:e0bf with SMTP id i11-20020a056870c1cb00b0010bf2d0e0bfmr13334505oad.143.1658027315355;
        Sat, 16 Jul 2022 20:08:35 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z203-20020a4a49d4000000b0043577be222bsm3203928ooa.22.2022.07.16.20.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 20:08:34 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     vkoul@kernel.org, Ren Zhijie <renzhijie2@huawei.com>,
        mturquette@baylibre.com, sboyd@kernel.org, robert.foss@linaro.org,
        agross@kernel.org, jonathan@marek.ca, konrad.dybcio@somainline.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] clk: qcom: fix build error initializer element is not constant
Date:   Sat, 16 Jul 2022 22:08:25 -0500
Message-Id: <165802729676.1737676.8397755968659757422.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220714121144.71062-1-renzhijie2@huawei.com>
References: <20220714121144.71062-1-renzhijie2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 14 Jul 2022 20:11:44 +0800, Ren Zhijie wrote:
> CONFIG_CC_VERSION_TEXT="x86_64-linux-gnu-gcc (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
> make ARCH=x86_64 CROSS_COMPILE=x86_64-linux-gnu-, will be failed, like this:
> 
> drivers/clk/qcom/gpucc-sm8350.c:111:2: error: initializer element is not constant
>   gpu_cc_parent,
>   ^~~~~~~~~~~~~
> drivers/clk/qcom/gpucc-sm8350.c:111:2: note: (near initialization for ‘gpu_cc_parent_data_0[0]’)
> drivers/clk/qcom/gpucc-sm8350.c:126:2: error: initializer element is not constant
>   gpu_cc_parent,
>   ^~~~~~~~~~~~~
> drivers/clk/qcom/gpucc-sm8350.c:126:2: note: (near initialization for ‘gpu_cc_parent_data_1[0]’)
> make[3]: *** [drivers/clk/qcom/gpucc-sm8350.o] Error 1
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: fix build error initializer element is not constant
      commit: b5eb8cde863cdf455436c7ba3fb7362c49e1e64e

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
