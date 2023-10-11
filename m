Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F97CD6E59
	for <linux-clk@archiver.kernel.org>; Wed, 11 Oct 2023 10:30:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231628AbjJKKae (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Oct 2023 06:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231597AbjJKKad (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Oct 2023 06:30:33 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974FE98
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 03:30:31 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c008042211so82073071fa.2
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 03:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697020230; x=1697625030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xzHKCgjb8/zw/flLxHNtdD2jh+riVKfmw0ipQhtOwLE=;
        b=pqfTt118gv/2PLnUGZUncLjgvEzV3FvIdVs5DF6QNEp9JxMDSL16mzP44q+5XJJfji
         DPQa8VUBr4PnWejYa40KeTLKFgJu8dMv5VWSBSFQezceQ1WUhw9d0Wzk1cwMqDHUMpKX
         YwvOCExdX+ZChSFuhv5AuHGE0PJKpZsI+JFmP8DmMJBO++9E8799dUUljHLMWp1K6FRG
         tcE+1mrmcCxpVVHbnXQUPkevDayDxTeIV6+BOP4qp+BZEV6GHhgJ1fhSz/8EKmdFcoTC
         Q+m5SC/bD3mpmo/Xd4gWktc3hXZoFyymdCDI/Hv3Ki5GnZEjUV8/W70CwN6uxQN6wYZb
         J+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697020230; x=1697625030;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xzHKCgjb8/zw/flLxHNtdD2jh+riVKfmw0ipQhtOwLE=;
        b=IZil1XOYf2mK7ADDswUw9d1QLMshs+ZwO16rALo7UAGaL+WiGN5/ehB9kn3blSq4bF
         hj3TG+W/CSvVVjN0RS+BwsgTdVQ+HCizwkUeWbhaNjJsSvILCst4KEVBf6LI+g9Rr2Eh
         3WeG968vqukohrVRswWumkKYQRtikFxM7ILbuMkzgknOYBqLjRkmZ/06paoNds/yWNM+
         k+OfvUoWHCvL1qVFfKKH49x0fXnR0NZBEtRJrm4TAVy6j0ojZQLQOcmZ/hp70v00bFcw
         BBfW3LtnUxVB3y7m3KgL9IpXA26RkdyVktblBV8GU+w2Wh/FnMRSJx2+rHMAsH093b9X
         13Cw==
X-Gm-Message-State: AOJu0YwAVkPLev93mtMfKKi2Q6HdUxrEaAgzZtSVpmCmreAg8ZuMnOjo
        JXNJBQKawHDLeb0BJDi1pZ1Etw==
X-Google-Smtp-Source: AGHT+IEaw7rwDtUJYy85sJqrAFyVJ8Sl98KLuplFuXyA7yQPW41U0XXgksBo+0yN9rEAMltSVET/gA==
X-Received: by 2002:a05:6512:457:b0:503:35af:3058 with SMTP id y23-20020a056512045700b0050335af3058mr15408059lfk.52.1697020229684;
        Wed, 11 Oct 2023 03:30:29 -0700 (PDT)
Received: from [87.246.221.93] (netpanel-87-246-221-93.pol.akademiki.lublin.pl. [87.246.221.93])
        by smtp.gmail.com with ESMTPSA id v1-20020a056512096100b0050480e8a676sm2213434lft.268.2023.10.11.03.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 03:30:29 -0700 (PDT)
Message-ID: <3c7115dc-f9b4-42ab-8923-098d96b75e86@linaro.org>
Date:   Wed, 11 Oct 2023 12:30:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/4] clk: qcom: Add ECPRICC driver support for QDU1000
 and QRU1000
Content-Language: en-US
To:     Imran Shaik <quic_imrashai@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20231011090028.1706653-1-quic_imrashai@quicinc.com>
 <20231011090028.1706653-4-quic_imrashai@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231011090028.1706653-4-quic_imrashai@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 10/11/23 11:00, Imran Shaik wrote:
> Add ECPRI Clock Controller (ECPRICC) support for QDU1000 and QRU1000 SoCs.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
[...]

> +static int __init ecpri_cc_qdu1000_init(void)
> +{
> +	return platform_driver_register(&ecpri_cc_qdu1000_driver);
> +}
> +subsys_initcall(ecpri_cc_qdu1000_init);
module_platform_driver?

Konrad
