Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C3BC6FD1C
	for <linux-clk@archiver.kernel.org>; Tue, 14 Mar 2023 09:30:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbjCNJaN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Mar 2023 05:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbjCNJaI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Mar 2023 05:30:08 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 517EA12CF4
        for <linux-clk@vger.kernel.org>; Tue, 14 Mar 2023 02:30:06 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id l1so13627135wry.12
        for <linux-clk@vger.kernel.org>; Tue, 14 Mar 2023 02:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112; t=1678786205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o8V5CcLaIIx69q/4n/y9EnU07a2ryv7HSzjXQiidp/o=;
        b=4GOXd4xGHb0FiE8xd2Gz2cxlK1qqemTQyEmEzFHlIcv282xVkNAow0ji76wCtBoKtN
         mvrEgJSJoLyDwQejcx4XwbNrcOdTZ4xrAH8hZYs57XwwF63tzV4d5cw2fVBZTIHdKzdT
         iyp3BSmVNbL06cz8yGcfNGEcM/3Fn+7uSMTeS9yAQy8tj9//BDWANchbAHs6M06ra0OF
         RKrIHuGG4iVoe9/a5lYowzH20SBZtbGpxeseJcZoL2fUJkGc2kNiX+m3w5io3IvIK1zn
         rO+SqfdbKaYIBPFj/FR0EGkmHotabBbBAKy36cV68Hgp6p4KrovwonPi5LruIp2e9D4N
         Kn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678786205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8V5CcLaIIx69q/4n/y9EnU07a2ryv7HSzjXQiidp/o=;
        b=oj/TG6/eyfSBLbgt/8aomSBTwslf+XCtjiLUErCtACmTkJ/gGwKRe/N1GgYmbzMIPz
         0YkkdHr+IlpVh1vvDwoy7mCwzRcHUTdHwoBnrvYrGfZ7ljFTwty7aj1znY0iBfNg5TG6
         vhIsSTfmi/AAztcZeyBF93UX7VCqd++yGAKU1yhVmzOqPqE7f17Bjym9Be3lJXdAzn3c
         f2xxAEdfVrCqqTZVZt2ipDvbx8q8aEhYD+I60U2DCEMpY2PJHNg75YODPUaW1Hiiru9y
         oQiVaEoxPLx5UPRUNQP+l7k1oPohV0MGCiohBq1LmqnLY5MfH1IaQTax8VAzjEaIa3H8
         tzyg==
X-Gm-Message-State: AO0yUKURURmCDkDUH4nGYRZx8L4Fxc2ikUtdU6mQATfKJ0ZIivLxh/yE
        iyzr4Z6D6T/9QhCFCD1Bpo6lVw==
X-Google-Smtp-Source: AK7set9P9j4NR2knpezskSyByqskTsKqLKNLMGBXu1k+IbCbEYd8mz6Iaow2TwGlnIjdSvyQtRVUBQ==
X-Received: by 2002:a5d:5962:0:b0:2cf:e4ab:3725 with SMTP id e34-20020a5d5962000000b002cfe4ab3725mr3326038wri.51.1678786204657;
        Tue, 14 Mar 2023 02:30:04 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id g16-20020a5d46d0000000b002be505ab59asm1538249wrs.97.2023.03.14.02.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 02:30:04 -0700 (PDT)
Date:   Tue, 14 Mar 2023 10:30:03 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadfed@meta.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>
Subject: Re: [PATCH RFC v6 2/6] dpll: Add DPLL framework base functions
Message-ID: <ZBA+m254jlGHEtJw@nanopsycho>
References: <20230312022807.278528-1-vadfed@meta.com>
 <20230312022807.278528-3-vadfed@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230312022807.278528-3-vadfed@meta.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Sun, Mar 12, 2023 at 03:28:03AM CET, vadfed@meta.com wrote:

[...]


>+struct dpll_pin *
>+dpll_pin_alloc(u64 clock_id, u8 device_drv_id,	struct module *module,
>+	       const struct dpll_pin_properties *prop)
>+{
>+	struct dpll_pin *pin;
>+	int ret;
>+
>+	pin = kzalloc(sizeof(*pin), GFP_KERNEL);
>+	if (!pin)
>+		return ERR_PTR(-ENOMEM);
>+	pin->dev_driver_id = device_drv_id;
>+	pin->clock_id = clock_id;
>+	pin->module = module;
>+	refcount_set(&pin->refcount, 1);
>+	if (WARN_ON(!prop->description)) {
>+		ret = -EINVAL;
>+		goto release;
>+	}
>+	pin->prop.description = kstrdup(prop->description, GFP_KERNEL);
>+	if (!pin->prop.description) {
>+		ret = -ENOMEM;
>+		goto release;
>+	}
>+	if (WARN_ON(prop->type <= DPLL_PIN_TYPE_UNSPEC ||
>+		    prop->type > DPLL_PIN_TYPE_MAX)) {
>+		ret = -EINVAL;
>+		goto release;
>+	}
>+	pin->prop.type = prop->type;
>+	pin->prop.capabilities = prop->capabilities;
>+	pin->prop.freq_supported = prop->freq_supported;
>+	pin->prop.any_freq_min = prop->any_freq_min;
>+	pin->prop.any_freq_max = prop->any_freq_max;
>+	xa_init_flags(&pin->dpll_refs, XA_FLAGS_ALLOC);
>+	xa_init_flags(&pin->parent_refs, XA_FLAGS_ALLOC);
>+	ret = xa_alloc(&dpll_pin_xa, &pin->idx, pin,
>+		       xa_limit_16b, GFP_KERNEL);
>+release:
>+	if (ret) {
>+		xa_destroy(&pin->dpll_refs);
>+		xa_destroy(&pin->parent_refs);
>+		kfree(pin->prop.description);
>+		kfree(pin->rclk_dev_name);
>+		kfree(pin);
>+		return ERR_PTR(ret);
>+	}

This is odd flow. Just return 0 before "release" and have the goto-label
dedicated to error path only.

>+
>+	return pin;
>+}

[...]
