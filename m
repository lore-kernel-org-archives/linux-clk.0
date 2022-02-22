Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03733C43217
	for <linux-clk@archiver.kernel.org>; Tue, 22 Feb 2022 13:52:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232588AbiBVNw0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Feb 2022 08:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232578AbiBVNwZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Feb 2022 08:52:25 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B8C9ADA4
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 05:51:59 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id e8so11711922ljj.2
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 05:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=NsGSasV71blvFAQsUeTICtCaC8t3lLOY7dmm0my+M4s=;
        b=AJ/I/oj0OYUCwVJAmn4np80YsTakFowMhpIW/OjZXOW89NFj1/PftD135TnJ8Z/LI/
         phCp6HJjvpEUnJRHfF9K1BgyGXwxoB6W5MDk854iU3af6RUr/kHXTpiG/NzsQyTOh+gD
         kMP4OuIvponFrwXI617qzjNjPPsVrSYGnPYmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NsGSasV71blvFAQsUeTICtCaC8t3lLOY7dmm0my+M4s=;
        b=OfLaJbU89SiSmbGj3RzKSu+wIwejWkHhAUCrTtp+uhS9ZXBSUHygDvsmcJ7zr0Q8vu
         tamLDSuaCa382rBQVu4oUT4AyVrJ+WHGin+AkDr1Cg1qyqKEUNd7e61yeJcnIfH0FVWH
         JCtdtbZzmqmFQM8kpc+AxyF/d4W0BSHHxgSpLSg6qkQHfBxaFCZ8LVl+DNDifOIo+xlo
         FZ6VD4choRjTZB/tIWRTUPo7FtLU+l1IF6iewtTp+1d/bDkJO1HuVuumaggBtj8wG3Ig
         I6PFQbyNo6MVZZO/4rNAr1ONgpYt4HHvLDbMXN6t6VPyignxlwXPO4brYfga0TR81v5X
         n7+Q==
X-Gm-Message-State: AOAM533nd7MEHFTCIxwBBDNIyg4kEJDKoBJg2yxnZ7MoK0NM1+VhpaMO
        VkzNB3YSZY+o3hRuxX12TgjcKA==
X-Google-Smtp-Source: ABdhPJxI+23Gdjl0KlMs6D0D/n7roxfjb4Eu5X3j0I3KcmM67FZxrBTBWvYuS399uuQpiLuHrCVJmg==
X-Received: by 2002:a2e:880a:0:b0:244:7dd:9256 with SMTP id x10-20020a2e880a000000b0024407dd9256mr18390534ljh.525.1645537917845;
        Tue, 22 Feb 2022 05:51:57 -0800 (PST)
Received: from [172.16.11.74] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id a28sm1382796lfm.251.2022.02.22.05.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 05:51:57 -0800 (PST)
Message-ID: <708eabb1-7b35-d525-d4c3-451d4a3de84f@rasmusvillemoes.dk>
Date:   Tue, 22 Feb 2022 14:51:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFT PATCH 0/3] Fix kfree() of const memory on setting
 driver_override
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
References: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/02/2022 14.27, Krzysztof Kozlowski wrote:
> Hi,
> 
> Drivers still seem to use driver_override incorrectly. Perhaps my old
> patch makes sense now?
> https://lore.kernel.org/all/1550484960-2392-3-git-send-email-krzk@kernel.org/
> 
> Not tested - please review and test (e.g. by writing to dirver_override
> sysfs entry with KASAN enabled).

Perhaps it would make sense to update the core code to release using
kfree_const(), allowing drivers to set the initial value with
kstrdup_const(). Drivers that currently use kstrdup() or kasprintf()
will continue to work [but if they kstrdup() a string literal they could
be changed to use kstrdup_const].

Rasmus
