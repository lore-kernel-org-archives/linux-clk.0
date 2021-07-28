Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCB7C432BE
	for <linux-clk@archiver.kernel.org>; Wed, 28 Jul 2021 20:06:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAE8860F5E
	for <linux-clk@archiver.kernel.org>; Wed, 28 Jul 2021 20:06:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbhG1UGT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Jul 2021 16:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbhG1UGS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Jul 2021 16:06:18 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05BFC061765
        for <linux-clk@vger.kernel.org>; Wed, 28 Jul 2021 13:06:16 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id z6-20020a9d24860000b02904d14e47202cso3375829ota.4
        for <linux-clk@vger.kernel.org>; Wed, 28 Jul 2021 13:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RgQV2POnTNhownKZPlBpXU10D8P77Sy5Oy1xD8WPPn0=;
        b=FrrKJ3i9URl+r8rqdK4/pScXSbV1pGBeQ8X/yVyMtpzQL0IH9u2yLQz0LcljmC4zfk
         nUsdiUtfPuoc/EVFZvUmVPinS7Zq09Y53PsMa6reMrjsSLxu9PRSvvVmaZj6PR/UQ2Xm
         uNZoa2ol0vwgDymYyGv6Pt6E8VCyEHp5IzUaX0+r0NqPb8vUPmRIYOE9+F109f2Mo/+6
         JPayvBjfHPPPJxMf5ij43EfzAjPnahmg/pwlKJ6j2fzO6P5XpydNC+2kwU6LwxpWbS4J
         A92hqvW+Dr3AHch23CLzyF1aJFPoFezn0tiFrIAKnw9H/BZ6VKZUvcQQTQnn1MdszEt0
         YQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RgQV2POnTNhownKZPlBpXU10D8P77Sy5Oy1xD8WPPn0=;
        b=is43QeHjzw1rAN88NsVnysHX2ZsHlBqynXo3opgTiekvTAJWpOnJScK5fV/W5l3quj
         sXEiO0wrWMi4Oi6KDjfNzN3R54SCJNNKunfVclOHRFo973cezI0BvTwfnY6twcvoqg4R
         3/3bXMg8EwdgoKi4sPKbInfZUZuWzHRwHioKFcQlujczGO8DcMq7EVK/FtAZGuw9Nuc+
         jTwsqPhWS6UK4NC/SrEyWo78bNNCYMNAD1AavAAUBvVInOanmGkMGMl2sGdwVf1suPH1
         FQ0tfGxGN5cuI72toURWSh+P+uTkNW0oL+1gSlBDwL3xBLT6RV31RrjFE6KMHV4Q2GbA
         Mj1g==
X-Gm-Message-State: AOAM533IOytH4MxRqRpMHh98Yf5PIgxWGSJPnmO/70AZ9CSbjdD8DPNA
        FgyS8xhWhYooiDV/4x00Ilqlbw==
X-Google-Smtp-Source: ABdhPJzQXfs+1VxjlRn+p1VmmVBgmBHUbC1ZA3IFjmSDDXTdl7sQL291fsv4jcT5kBuGPKI+wpkAoA==
X-Received: by 2002:a9d:64d9:: with SMTP id n25mr1167735otl.174.1627502776188;
        Wed, 28 Jul 2021 13:06:16 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n202sm203165oig.10.2021.07.28.13.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 13:06:15 -0700 (PDT)
Date:   Wed, 28 Jul 2021 13:04:25 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/5] PM: runtime: add devm_pm_runtime_enable helper
Message-ID: <YQG4SVwUI21HugbG@ripper>
References: <20210728142445.774158-1-dmitry.baryshkov@linaro.org>
 <20210728142445.774158-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728142445.774158-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 28 Jul 07:24 PDT 2021, Dmitry Baryshkov wrote:

> Add helper function handling typical driver action: call
> pm_runtime_enable at the probe() time and disable it during remove().
> 

This says what the patch does, but it doesn't say why we would like
these helpers - i.e. the fact that it's quite common across the kernel
to have error handlers and remove functions that simply has to do
pm_runtime_disable().

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/base/power/runtime.c | 17 +++++++++++++++++
>  include/linux/pm_runtime.h   |  4 ++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 8a66eaf731e4..ec94049442b9 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -1447,6 +1447,23 @@ void pm_runtime_enable(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(pm_runtime_enable);
>  
> +static void pm_runtime_disable_action(void *data)
> +{
> +	pm_runtime_disable(data);
> +}
> +
> +/**
> + * devm_pm_runtime_enable - devres-enabled version of pm_runtime_enable.

() on the function name.

> + * @dev: Device to handle.

Returns: 0 on success, negative errno on failure

Regards,
Bjorn

> + */
> +int devm_pm_runtime_enable(struct device *dev)
> +{
> +	pm_runtime_enable(dev);
> +
> +	return devm_add_action_or_reset(dev, pm_runtime_disable_action, dev);
> +}
> +EXPORT_SYMBOL_GPL(devm_pm_runtime_enable);
> +
>  /**
>   * pm_runtime_forbid - Block runtime PM of a device.
>   * @dev: Device to handle.
> diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
> index aab8b35e9f8a..222da43b7096 100644
> --- a/include/linux/pm_runtime.h
> +++ b/include/linux/pm_runtime.h
> @@ -59,6 +59,8 @@ extern void pm_runtime_put_suppliers(struct device *dev);
>  extern void pm_runtime_new_link(struct device *dev);
>  extern void pm_runtime_drop_link(struct device_link *link);
>  
> +extern int devm_pm_runtime_enable(struct device *dev);
> +
>  /**
>   * pm_runtime_get_if_in_use - Conditionally bump up runtime PM usage counter.
>   * @dev: Target device.
> @@ -253,6 +255,8 @@ static inline void __pm_runtime_disable(struct device *dev, bool c) {}
>  static inline void pm_runtime_allow(struct device *dev) {}
>  static inline void pm_runtime_forbid(struct device *dev) {}
>  
> +static inline int devm_pm_runtime_enable(struct device *dev) { return 0; }
> +
>  static inline void pm_suspend_ignore_children(struct device *dev, bool enable) {}
>  static inline void pm_runtime_get_noresume(struct device *dev) {}
>  static inline void pm_runtime_put_noidle(struct device *dev) {}
> -- 
> 2.30.2
> 
