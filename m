Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A3D2C19F2A
	for <linux-clk@archiver.kernel.org>; Thu, 11 Aug 2022 09:09:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234496AbiHKJJR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Aug 2022 05:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234307AbiHKJJQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Aug 2022 05:09:16 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D21208E9A7
        for <linux-clk@vger.kernel.org>; Thu, 11 Aug 2022 02:09:15 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id j3so11493576ljo.0
        for <linux-clk@vger.kernel.org>; Thu, 11 Aug 2022 02:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=OuNBLM8BAbWtCheZfxDwqu8ugdq6TeyCqLVXqfB8AQU=;
        b=tRUbUgQ7Z4NEozErrjbYsFQdh3BOQSl1mcSUnYMrjW47LdxtNSXjhsWqZXEfOx68BY
         ZX/pRtHyTEIsM66BtZYKj9F06QIufj0ZJtheFfth7sujngmdNxQ67mlJiYYW6OQhWG4V
         GllVC/j/0Hmc/VbLqRC+ULH8iWdR6m3XdanHE1MInU7VCiZlt10ld8/TXsp3ofZ2HXPT
         Jt4VtmbqpVKZtnZATOMuLLhtxyROJy9z+Ycx8QdA+bd0I+D4EF4g+2gtsFERHnpYWLdG
         dHBXWtvTaG/cTvHkGBtoLLxb4WAtLr7+3aDd3OA10tm+NvgBkiQQrtfb5LkeXCqA1GjG
         KAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=OuNBLM8BAbWtCheZfxDwqu8ugdq6TeyCqLVXqfB8AQU=;
        b=TRYTlu0Uk5uOcqZPacdJh6SC4IEIsH1Umv+hVsbF20FovG4xW1+Qa4FUM2568nbL8m
         2NS0J4Y/dfFmrL3vxR22UjKshisr1jRyT4K6Rp8W9I75W1kZMxXM0aTTj4+5NsDBGmdd
         UBYv10BC8dlQePxl7opIjik9a0eXl6GGpEMD0k0cnKaYAOlJ5JqanvY8YThLt5G8z0Ud
         CZfuC9D/4l8aQtz1L2KIr0kw0M68iTW3dRcixanawtUyVUDCuxueTWn3x2tTUCl+oR7W
         p4s4q42TeLhulk44gI1POUzLHT2lljBogRWBkfk7a7ZuhW+ARpNxEzRcgL3CSsyK8jBv
         FTOA==
X-Gm-Message-State: ACgBeo3ZxiyUjrBV4sCYe0bdkL8GTRnRkqymSAbSbLf/MlJYCQ7zexY4
        w1ZrbM8PvPRvknYTZK+JZ9p5Dw==
X-Google-Smtp-Source: AA6agR7YslF70qu+nSE+gMvlKJgMKIhfnR3xp3n4p+4AlNM0wWjwnr4uY7K9QMoK8NtwKqFjnn/dFQ==
X-Received: by 2002:a2e:9d91:0:b0:25e:dd34:f5d6 with SMTP id c17-20020a2e9d91000000b0025edd34f5d6mr6679686ljj.501.1660208955427;
        Thu, 11 Aug 2022 02:09:15 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id v18-20020a2ea612000000b0025e4e2a5bbesm743871ljp.1.2022.08.11.02.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 02:09:14 -0700 (PDT)
Message-ID: <080c6442-b45f-242a-6535-1f833fbf6cca@linaro.org>
Date:   Thu, 11 Aug 2022 12:09:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add Qualcomm SC8280XP GPU binding
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220811042855.3867774-1-bjorn.andersson@linaro.org>
 <20220811042855.3867774-2-bjorn.andersson@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220811042855.3867774-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/08/2022 07:28, Bjorn Andersson wrote:
> Add compatible for the Qualcomm SC8280XP GPU.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
