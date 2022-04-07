Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F027AC433F5
	for <linux-clk@archiver.kernel.org>; Thu,  7 Apr 2022 09:02:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238003AbiDGJE4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Apr 2022 05:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243697AbiDGJEh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Apr 2022 05:04:37 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A212CFD6DB
        for <linux-clk@vger.kernel.org>; Thu,  7 Apr 2022 02:02:28 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id u3so6846185wrg.3
        for <linux-clk@vger.kernel.org>; Thu, 07 Apr 2022 02:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=USC7C7RCVNx7KuEUt+BY/YKNIMEfhL2JjE70IEcuxEE=;
        b=RG94Ae0RY0Ql8bXpoWaw7oEdKOADumRFMHqZyC8iQGSeS9kOIbxXBGx9jEKZL4+ZnE
         Dw5kxlQPY5pu0NDZ01Y5tOgZXeQOf/bzU5O1b96B0uyRHFv8GouQsMlYIOtojCErkI8X
         3eYdOpp4takmZCE++lSBbtRR549fY3PeDHvTbdEMi3l/22aM+r2YZt9jXtBSvTzg9vKR
         l5MQoYKuMxlE3w5/a8X6aYyH8f1KJu1yIUN4ySD7joybh1a3DbDjbJWxFgZKJzzbOryL
         y8lKxQyhMWVGIRzxGDFwXYkiJs3yn2Eo74Y1OOoIIjMn6tpQbXPKzud3d7l6F+lNqs+A
         nPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=USC7C7RCVNx7KuEUt+BY/YKNIMEfhL2JjE70IEcuxEE=;
        b=3xzZpe2c67bXI6kj2iVhbUYnkohyaRMVU5xHjHmTKc8Z60yvEm2Jfmp3KUZfhAWHTe
         4wsfnsDNW64ek0+QuE6nPcgjWJb9ieU0OueNjQUCoiLTY0FISTHI1sgcJ7VJ+J5H5DEE
         OeyklB+qvZCZ4vRgJ1jAKkbN5lpt7YaB/hiAeznKf75F9ZiyGJhmNqBNHbPhKnIX9vCd
         7yQzUUJMRkZukLT30CufgPaOtLNBhngO2G7K+h+LkUtF0GTPLTcEpqMiF1JAmf7wuupM
         YJE9hY1aigD7xhPJq3shKKdKNR/SVCgiesWswqrwYUVhffGSmf/u8MDuTJ6IqX09qQx/
         rYMw==
X-Gm-Message-State: AOAM530S9zibrKHcB62uk5wgyCdBqnYkcZZ3qcOZEtcww/11kts7NhSw
        GicXtPfTD6faplK9xO69CIlZOg==
X-Google-Smtp-Source: ABdhPJzF7coRnBfWLLqluJRervg9467q13ZsvflHJDge79gXpqC21tQ1cPoa/MFzvvpqmqoXL6xn1w==
X-Received: by 2002:a5d:64eb:0:b0:205:d418:4798 with SMTP id g11-20020a5d64eb000000b00205d4184798mr10078636wri.11.1649322146858;
        Thu, 07 Apr 2022 02:02:26 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ed2f:f020:f2a2:7d81:4e67:6c1c? ([2a01:e34:ed2f:f020:f2a2:7d81:4e67:6c1c])
        by smtp.googlemail.com with ESMTPSA id f13-20020a05600c4e8d00b0038c949ef0d5sm8640927wmq.8.2022.04.07.02.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 02:02:25 -0700 (PDT)
Message-ID: <66db272d-0bc0-8c77-a106-327cd0bd3405@linaro.org>
Date:   Thu, 7 Apr 2022 11:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/4] dt-bindings: thermal: qcom-tsens.yaml: add msm8960
 compat string
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220406002648.393486-1-dmitry.baryshkov@linaro.org>
 <20220406002648.393486-2-dmitry.baryshkov@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220406002648.393486-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/04/2022 02:26, Dmitry Baryshkov wrote:
> Add compatibility string for the thermal sensors on MSM8960/APQ8064
> platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
