Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40173C64EC4
	for <linux-clk@archiver.kernel.org>; Thu,  9 Mar 2023 00:51:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjCIAvG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 19:51:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjCIAue (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 19:50:34 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F5F49B9B2
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 16:50:27 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id z5so209750ljc.8
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 16:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678323027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ut0NKrrmJpcZE86pvln2zJpYj/UO7+bDI29L6LGhRzI=;
        b=fpYZce9XoDJK0bMS6sLsPQ/4JRC0SZEJQRJd8/vpYY7RD7FRlsdKS3EMvoY/2+uGEx
         Q4Vu8LBZaLBFO1e8aMQh9S1V+VPlk1luw3NOWDxtGaUaXSN1/JoJamYbxlffZ5VfSMJW
         yZ4N9FB6p7cjA5ekK+GCNHyGbugy6fDxReetFh/OOcjb+E8NBCSk9no5JZxFcANndXem
         zxA4Qj2rnqXRlyu1QbbQ0PUm6CNTYlhSyv5LIgKeWL8hOvT3E3Lp3biZrAU4fq6EK8D9
         dmU0ZRq1fS5bE/zE2tNuPTaIyiUvtEqRcMI8eexaIQlU2ZOlWKTh0kMeBmRv1OnbZgY8
         eIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678323027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ut0NKrrmJpcZE86pvln2zJpYj/UO7+bDI29L6LGhRzI=;
        b=RPS+yWJ6zFp+sF4No8k4bNCQL4toQg41siSrp4FnH9FV2NPHA1z7/vzfgeAiFX6E3M
         wmMXZgw6AwVJ6O/XqQABQsGooncxBPMzNxsT+UC9Dpeq+V3aXUbiwFuufXq4/34W07VL
         hYqOncjXA3MgFRRfqKGx+ubcfbSC0Pu9IijIL/v0n971hWj4z0K3YQn/KkOw2rFaUu1K
         1G+CeLy9lEjU1pBRVfa61eSF/WNy/Vma8TV+rQmPxqV1V6r6N/yH471tvgUgcZZ9OKDW
         lxXK4D5phtoVINUFiJOD4nWQgVQ8RH0wQjwMaViK84zDMy/nvTp5LfFW4uxcSIn+6ZPq
         Hegg==
X-Gm-Message-State: AO0yUKVuGX8NmHgw66VMhLBFj8QsFXPvzWnPPDMxORkV/5y2fMuCUs54
        S/WfO+3G/ekrWglH8PtXeSoKyg==
X-Google-Smtp-Source: AK7set+HnokK5N0HIox0l7I9KqzxZ8YkRzgaK8HIrha8WK8EtKzLjssiWL2lWWJV2dHWjfPc5yQ8RA==
X-Received: by 2002:a05:651c:1720:b0:293:4fe3:8f97 with SMTP id be32-20020a05651c172000b002934fe38f97mr5661884ljb.20.1678323027009;
        Wed, 08 Mar 2023 16:50:27 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t22-20020a2e9c56000000b00295da33c42dsm2771053ljj.15.2023.03.08.16.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 16:50:26 -0800 (PST)
Message-ID: <3ad9123f-5a39-cf2e-b8e3-68d8f3129215@linaro.org>
Date:   Thu, 9 Mar 2023 02:50:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFT v2 08/14] clk: qcom: smd-rpm: Separate out a macro for
 defining an AO clock
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
 <20230303-topic-rpmcc_sleep-v2-8-ae80a325fe94@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-8-ae80a325fe94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/03/2023 23:35, Konrad Dybcio wrote:
> To declare a keepalive variant of a bus clock, it will be useful to
> have a reusable macro which will ease defining a keepalive variant
> of an AO clock with an IS_CRITICAL flag. Introduce it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

