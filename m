Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B4FC6FD1F
	for <linux-clk@archiver.kernel.org>; Thu, 16 Mar 2023 12:37:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjCPMh0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Mar 2023 08:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbjCPMhY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Mar 2023 08:37:24 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1697A17EA
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 05:37:21 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id m18-20020a05600c3b1200b003ed2a3d635eso1017033wms.4
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 05:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112; t=1678970240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=514h8Ll5c2ZEp3l/zYfk/oJdo5XaAivqw3cyq8ZPZSw=;
        b=bhaldaQm/jln74qCapYv4qWtRbz2JpUYOl7nJhAgaRQtWdo0utw7U6PPRr/WNU9ooN
         dkviyz7Feenie0jg+2ekmn/dWx/Fvr8ASEBufpH0kVO7bGe0a/TCqqi2je96INnirGao
         qRHprIeFmDro+yQ8ZfoxolaTbKIN+QKK1sYR28doKNZBTfrVXQ7H7PG+w2HtORe2FtOw
         0XTbf76G0iwlvLQLjZBfn0KPaUTyWnP63Coa861PBv+ck/cPuBT7VI5C2BbaFIxdIaba
         ciP8KUOHfcmZ2Xui2StYR/UfxTJlKHcIAB0bPA9r+dr1P/ZLsLRCKCGXkhmJWf2YEend
         5MCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678970240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=514h8Ll5c2ZEp3l/zYfk/oJdo5XaAivqw3cyq8ZPZSw=;
        b=vj+gioksuEAXjxZ3wz1D98ju/sy8q/OtqWvhz/qNjQ/FJ/8Cz+eL0sQXWUgO3gosNc
         2djuNM/Tm5Y5YDaT9rExNTauuKfzrk6uIuWFPlrfiIXxHFZWgt1gLkTDdprANGWy8tbi
         5ksqzokH33ZZKVw5CeIC3w6nyY8A+epdgexfXFI0anZPO5+qUUrBHXGshvzq2z6j0VjX
         Y62wia9+B3P6Cms26/hLzgwYLB0SOklClt/bQ6TU1NkEmqrKeIa48otUzM354v2bt8+4
         OeJ5kK3TbnRJZWOAg0f5I/xlJifM5rMJn7mJwUOHCdtQk5uwVK7v5nCYUW3RpBBKhUap
         qcrw==
X-Gm-Message-State: AO0yUKVJAdaKMu55KMJfP2I3jP4YxMVqziZmVrai7aQM2JqyVhsfeeP8
        1IZMj8ilZVFzApAvFmTfbQxjqg==
X-Google-Smtp-Source: AK7set8ekJppoTaEs+bnyNw+oQE2sm8fXEl7zubfiVhYZ+bLOFl9uW5yvLguLiixXLXTFVdWY1gnVQ==
X-Received: by 2002:a05:600c:ccf:b0:3eb:36fa:b78d with SMTP id fk15-20020a05600c0ccf00b003eb36fab78dmr21637699wmb.23.1678970240433;
        Thu, 16 Mar 2023 05:37:20 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id k3-20020a7bc403000000b003ed1f69c967sm4950954wmi.9.2023.03.16.05.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 05:37:19 -0700 (PDT)
Date:   Thu, 16 Mar 2023 13:37:18 +0100
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
Message-ID: <ZBMNfjJjY9TL2Vif@nanopsycho>
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

Why is this mandatory? I'm now working on mlx5 implementation, don't
really know what to put here for SyncE. The type of the pin SyncE tells
all I need. I would like to avoid description fill-up.


>+		ret = -EINVAL;
>+		goto release;
>+	}
>+	pin->prop.description = kstrdup(prop->description, GFP_KERNEL);
>+	if (!pin->prop.description) {
>+		ret = -ENOMEM;
>+		goto release;
>+	}

[...]
