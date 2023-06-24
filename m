Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DC5EB64DA
	for <linux-clk@archiver.kernel.org>; Sat, 24 Jun 2023 09:31:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232903AbjFXJbZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 24 Jun 2023 05:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232748AbjFXJbY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 24 Jun 2023 05:31:24 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E77170B
        for <linux-clk@vger.kernel.org>; Sat, 24 Jun 2023 02:31:23 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-987341238aeso167454166b.3
        for <linux-clk@vger.kernel.org>; Sat, 24 Jun 2023 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687599081; x=1690191081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uwFIAccLIYNITGdMmhfyslt2bwDng0x/ZpNayYHghu8=;
        b=gc9/259HB7eikMHCQoNfzHBy/dycbEU/NjOFFnU8PbxsvPGyfNqoAKoAttafP2LK3K
         o8T887iu1nUWr8WHUlorPc2GkgFZqr90iFjwHQhPBsi2sF1sSxGB52kj4CmKlPDCq8BM
         9LbSM1ZwP1UK8Rl3mgeAq+IsMhGGArCApiHtotYKsX4U4up0ZEe9AnGqGORSAJmafl5M
         bpyubo+oVuadRCq3PFmiBKS/XJP3UBqd8FG+l06PHSS6AjgDQvzgQ7NXRzAqxLt8Hqy8
         JzWDz4sBifpXB99IaCL4BLgAR8765gFH3HZmDw32SGCMnXXJ3TcvvNyXRHLH6L50/stk
         fFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687599081; x=1690191081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwFIAccLIYNITGdMmhfyslt2bwDng0x/ZpNayYHghu8=;
        b=TjaOntvyHR7M5+cQfi3jocJmEpvLqsE+K23BPIBEEk2Nzky0BCbn8h/GvlbitvzNIO
         3ZiaPyKI+hnMzL7slSuRMvro9zAkh+NN4IDfxkY/SnRIy3y96Ps27ZNjDL7J6syOOGUV
         PwBi/6kZ2hMSp0OXmeYqp4ux3GO+lLas1PCzbdL278A+YqMgGzwazjEGt2aYqFnsLRGQ
         FW4d/ZQAopwix9p5I7HozegvGOIfc1kxMpF/6PFLVF0wqlo3gIR5msGm/fmg1hEDHQNY
         qhjSq07YR1t8t5ZL4daoM5Pp8R2X8YDlmsprdTg3lHYyb+tHuMRxw/rtq8CU1AMCiATa
         RXXA==
X-Gm-Message-State: AC+VfDwV9qIxXoZD2/og2Q5Buaooosk6HPcwZSkEtvCqHr7OTt1z4//4
        Lma79vH3BF4B3Or38/kwD/4g0g==
X-Google-Smtp-Source: ACHHUZ7LC+7hcCDvBte5xgktiTToiRBYnv91b8Sj+cbLeoDMK97jXgfSs6kpS0Rkuj/xi6REicP9TQ==
X-Received: by 2002:a17:907:5c2:b0:974:55a2:cb0b with SMTP id wg2-20020a17090705c200b0097455a2cb0bmr21160376ejb.55.1687599081475;
        Sat, 24 Jun 2023 02:31:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id p26-20020a170906229a00b00986bf50fe7asm699359eja.60.2023.06.24.02.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 02:31:20 -0700 (PDT)
Message-ID: <0747247e-22ac-f798-6d95-9cd14fb24cb1@linaro.org>
Date:   Sat, 24 Jun 2023 11:31:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 07/15] dt-bindings: display/msm: Add SM6125 MDSS
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-7-1d5a638cebf2@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-7-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/06/2023 02:41, Marijn Suijten wrote:
> Document the SM6125 MDSS.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

