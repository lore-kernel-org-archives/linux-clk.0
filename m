Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35861C4332F
	for <linux-clk@archiver.kernel.org>; Thu, 17 Nov 2022 09:09:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239450AbiKQJJh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Nov 2022 04:09:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239064AbiKQJJg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Nov 2022 04:09:36 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C383013EB2
        for <linux-clk@vger.kernel.org>; Thu, 17 Nov 2022 01:09:34 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id g12so1806901lfh.3
        for <linux-clk@vger.kernel.org>; Thu, 17 Nov 2022 01:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gnoCx3Qk52LXU2uGKSR88WRS2OS29nXSAokefTOA0+o=;
        b=rrhkft9l0QfRs+A08xV/mWc3xIOURd1iiDjCw1+jxB+FEPiFBhsHUxO1cs98f6KP0z
         Q1l3AUZp0eWxRQ9C6nuqqY6DfTrIzv67K8NeEWEPPeZRaIZOR0a2HLMsM0008uf7knJs
         rr2bpy1bQvAtZma7tpY2+5iQSOsA3l4+5HPoxRj5zx1SiW/BarjSGJDcum/07jyIkQyo
         xUU0HKdnhiZyigFkydOTVEPlPAASEM2ZaOEjEMT1VhyDEDhxCsMoVvDoFh+zmeaZVLnv
         hGvLuXWb6jQ1mdNlOnw2rub6tJyMoTZsBec/AG05P/eQ7wJ6SLrebj1+/46DHVpW6Qr6
         MtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gnoCx3Qk52LXU2uGKSR88WRS2OS29nXSAokefTOA0+o=;
        b=D+QejYSwjS40X4GnoLIrBPMSd3lGnCjK53kWn+DMEK/LL1KEcgsZoY4O9raGOi6sYe
         ZjojiP6/6hYhOqvPWAM3fPuOwxoYOCzqGgFImT9sKqw4CgQQ2KfIJBT1HIoYGRgAU+BU
         H5BAZQD7xXEp+C/l4J4MmLD+BpVJ6KmDJ1lgZEiOA/TlJRT/na3nPB32LHr4EHScIkma
         smtFODEsjju6o0oNsBUCjmtOhddFRzHldI2GHIaM+HZJ0/1L12S0UX4HAIziNPMzkGFV
         iGHltrFKm6IRRRxJ3oBaVT+Ru2V0iMpLYoPInt9/QzhSgau5MZSYBdcWlT1uPM8mKas6
         7+iw==
X-Gm-Message-State: ANoB5pnFM1ZmFs8V6YuFeHzfNONAJwT+XLBAtrKvIBzOUe1MVPaTJkuQ
        Rhc5QecuQhrPRpQpCDZzvSzTSw==
X-Google-Smtp-Source: AA0mqf4nUhvYgqzSgvdO8wcVo5x8pSESMmMj37WUL35JSd9AEKoeMCQQaTebiJZGK1UF/1wy6j3usg==
X-Received: by 2002:ac2:4f13:0:b0:4a2:5c46:4b4d with SMTP id k19-20020ac24f13000000b004a25c464b4dmr632558lfr.433.1668676173218;
        Thu, 17 Nov 2022 01:09:33 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b17-20020a196451000000b00498f23c249dsm55894lfj.74.2022.11.17.01.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 01:09:32 -0800 (PST)
Message-ID: <5897972f-9851-8ac5-6856-464f00e845ff@linaro.org>
Date:   Thu, 17 Nov 2022 10:09:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/9] dt-bindings: clock: Add RPMHCC bindings for SM8550
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20221116104716.2583320-1-abel.vesa@linaro.org>
 <20221116104716.2583320-6-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116104716.2583320-6-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/11/2022 11:47, Abel Vesa wrote:
> Add bindings and update documentation for clock rpmh driver on SM8550.

Subject: drop second, redundant "bindings".

> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>


With above:
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

