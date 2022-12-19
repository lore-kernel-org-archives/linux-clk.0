Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9005C10F1B
	for <linux-clk@archiver.kernel.org>; Mon, 19 Dec 2022 09:15:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbiLSJPC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Dec 2022 04:15:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231644AbiLSJOv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Dec 2022 04:14:51 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDFFBC9E
        for <linux-clk@vger.kernel.org>; Mon, 19 Dec 2022 01:14:43 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id p36so12666942lfa.12
        for <linux-clk@vger.kernel.org>; Mon, 19 Dec 2022 01:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P5wH9eG9rO1TDcm0Jhm27dvot1WZaz9XZs3TRsVSirI=;
        b=FlYykcQMSg70ePR8VX7PHwZ/2xsRYrXaDig2o5LcXKWdHbT01KfFQ8Xrmn0/C2Hg2s
         LZh4A+EFP7zn4921OKRVkUnSeE+onUkXGB4GoN6UQrNw1Eo71i4X51/faANAAbBH+5b0
         OfwV2T27AWcOftrnmrPoFuO+wXcsFXKd/fSNIaLduaewf8sY+ixgleDnd35WvWRAMdwV
         JaoJSINGwRsXQ1NaHBMnb6HLlo8NXFl9fsxLIPXkH4IeOYI9GwPdZczaXayWCDfgScqT
         RhhF34FGdhy3EiarnwC+z5Nc+S//zJoxboiMfWunUnHgYTmQS0MCfodOzHIAL/fR7yRk
         Iahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P5wH9eG9rO1TDcm0Jhm27dvot1WZaz9XZs3TRsVSirI=;
        b=of3VHJZrEs5VybyZVnvfs7doEV+4J8QIlk6XmWii/EVKDUv8o7BsSOtx9kCyzPbuY0
         OkN92Rw3ernTVYsvj/ElS3VkG8Dp20NQ33N2rY57O/Ty+zt7YGBlLnS6p6GrrjHY6SYm
         xuR8gr3OHRuZyHDjjkIm9MOEMQLv7scNEWz174SzumA0LtSloSxTOYnlx7Dmgi9XKVTY
         R3CcoMtjv/M/mrS2IKKnN/YVK1H1j5AbA66cpPprJwWLk5x34BC1KkR452sLtLdaGfQ6
         gCsCUVrLA8fvzXRIuHzTF+Emt/g94NWUP44YKUgYGQD8eOiQ0mzhajNPijPPtJ0Trq49
         OQ3Q==
X-Gm-Message-State: ANoB5pmqrDDM7SUakpO5nBcFy0K+0qj8vppAkIErtFuIoH78uCVsqD0X
        UmhShXNfJVo2tn3TaChnHj22zA==
X-Google-Smtp-Source: AA0mqf5NhRHJ05tUTEn0/n4WNIQ3B73/BMcIu7iqAbVk34VQoUvVAluKIUQuE3TYFSGOBHVoHsVN+Q==
X-Received: by 2002:a05:6512:32cd:b0:4b1:862b:5e71 with SMTP id f13-20020a05651232cd00b004b1862b5e71mr13273752lfg.33.1671441282368;
        Mon, 19 Dec 2022 01:14:42 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 8-20020ac25f48000000b004b590c768edsm1057012lfz.1.2022.12.19.01.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 01:14:41 -0800 (PST)
Message-ID: <411d85a3-86d1-b7fb-9cd0-00c79026d8d5@linaro.org>
Date:   Mon, 19 Dec 2022 10:14:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 03/15] dt-bindings: clock: qcom: gcc-qcs404: define
 clocks/clock-names for QCS404
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
 <20221217001730.540502-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221217001730.540502-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/12/2022 01:17, Dmitry Baryshkov wrote:
> Define clock/clock-names properties of the GCC device node to be used
> on QCS404 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

