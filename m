Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09748C54EF1
	for <linux-clk@archiver.kernel.org>; Fri,  6 Jan 2023 09:40:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233882AbjAFJj6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Jan 2023 04:39:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232990AbjAFJjb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Jan 2023 04:39:31 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1357A5F918
        for <linux-clk@vger.kernel.org>; Fri,  6 Jan 2023 01:32:01 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id m3so687396wmq.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Jan 2023 01:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v982tKjruzjnEGR+qtBvwCfxbuiittS57VqGvWmNxEA=;
        b=xaCDj00Zx5JE+B4HrORfAr0IUeuE5ge23LPipHcZiC+zhR+ezzDiRV+IkbNT1CNAfz
         rcZpOyT+Fjty9jGTicbtHTPGVD6+xBAHsPfRj7SmGkCbqgYflh6KN0ngzQiHkZ/wb0g2
         GQwNtJiRUz9XyhjzUb4XRYeJXa/9JHTqgG/f+6ZMzLL5EV9512q02xKq0HL9ZrKmbdZo
         qIf8MnF2ucYuTihFjPM26qK+eqI35YBoIWuZGBJN6rDpvJLAJAOqN2ynjxDf85eUp+9L
         w/mouXYO4yJKgYvCtgK5fOo2+VuFObrE8U8Z4zW0W4w58uztuEn9Gk10ZqHfObAvhaQr
         g5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v982tKjruzjnEGR+qtBvwCfxbuiittS57VqGvWmNxEA=;
        b=ylnZZcruxDCtgG/euOjq1i/uF185efA70CDX1MB+LgIjV3ocqKSV/PgXZk81xZmc2j
         KLcY7tdXgchGaRF7DOftMdJ4werMHkp9mFPoRaxNxA7ybbJZC5Y2Wkry2J7yDSAelwnt
         3MNR74m3U5mnMMnFqaQyEn3EQZcZ6Irltqj4p0mwH0Iu0hPMdN1uPbSZDSjemCf/RxVC
         NeGJjyAozzVcP+m+PqWI7QrgGA6W8bHV0VMYvQngv7tARiUh7LsDCD3E97cAM31iTHkO
         lTMja352ac836TAkSMvt9y1IGaSos9D7dFPkez2cqiLort0gk7KqXuy+kivKjUGH2bAj
         TZPQ==
X-Gm-Message-State: AFqh2kppIJAJE467EQAsbkbrsecm1Tm3E1fcO5hewGrJ90UZ2bmlDbou
        dd89SRNRs6wO2N82HO7iqxSuTA==
X-Google-Smtp-Source: AMrXdXvYSLjYzCElzyzK7yhn2iQbRJ2DGluk25DvaH9fz9jVXIzkSfkiBzSZ7TwN2v8AjLBXVXylQw==
X-Received: by 2002:a05:600c:798:b0:3d3:5737:3b0f with SMTP id z24-20020a05600c079800b003d357373b0fmr47719090wmo.36.1672997519650;
        Fri, 06 Jan 2023 01:31:59 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id iv14-20020a05600c548e00b003b47b80cec3sm6203606wmb.42.2023.01.06.01.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 01:31:58 -0800 (PST)
Message-ID: <bb52b82d-5149-c512-ad30-3b993221bd78@linaro.org>
Date:   Fri, 6 Jan 2023 10:31:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] dt-bindings: clock: document SM8550 DISPCC clock
 controller
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230103-topic-sm8550-upstream-dispcc-v1-0-81bfcc26b2dc@linaro.org>
 <20230103-topic-sm8550-upstream-dispcc-v1-1-81bfcc26b2dc@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-dispcc-v1-1-81bfcc26b2dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/01/2023 14:53, Neil Armstrong wrote:
> Document device tree bindings for display clock controller for
> Qualcomm SM8550 SoC.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/clock/qcom,sm8550-dispcc.yaml         | 106 +++++++++++++++++++++
>  include/dt-bindings/clock/qcom,sm8550-dispcc.h     | 101 ++++++++++++++++++++
>  2 files changed, 207 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> new file mode 100644
> index 000000000000..06c04656cb55
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm8550-dispcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display Clock & Reset Controller for SM8550
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +description: |
> +  Qualcomm display clock control module provides the clocks, resets and power
> +  domains on SM8550.
> +
> +  See also:: include/dt-bindings/clock/qcom,sm8550-dispcc.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm8550-dispcc
> +
> +  clocks:
> +    minItems: 3

Clock inputs should be optional if we can really treat them optional,
e.g. reparent to something else or just adjust list of parents. Since
the driver has fixed parent data, it suggests these are not really
optional and they are all in the hardware (always).


Best regards,
Krzysztof

