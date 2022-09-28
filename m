Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509D4C54EE9
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 17:13:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234579AbiI1RNF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 13:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234437AbiI1RMd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 13:12:33 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70238EEEA6
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 10:12:29 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id i26so21331284lfp.11
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 10:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=5kRE4HIl4yd6yot9Qh7CT0RKBxSrc6Cx0jn4OI8AxWM=;
        b=Zi1kzUu+ibmRth2YxgcBFjTjBcnGQF4hegED+CR2BWpD3uV4PXQ+/Ic+AbO0YKqLtY
         j5cbzCQjTeoAtbqMQIgPJ4NPJhk40VaVTO1fPU6/fM5HWvj51hqdfhCKbddf38RfZGe4
         vLv5znO9YUbF8ZeUTy7e6D2AZY+KtOpE+mIb2rIjGF7EKeST/3D7BdDCgKflMntud4vE
         +J02S6QlWMhRAKrDbyZjfxNpQ/USCmMbJc9A3yVJI8zvQrbHDtuNu66HtdN8YVJGCvMG
         io6L2mdEZJgIIekxOfAfApR4kMgRi7vbTwiENDou0bMrBhFENaht5v1XFe1QqNB6SA1p
         KYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5kRE4HIl4yd6yot9Qh7CT0RKBxSrc6Cx0jn4OI8AxWM=;
        b=6sS4s2M6w/gk62G0umcID8B/009GqZvG808dz26Xj0IWJehDCa6ohUn+Up+LC5Jrv/
         uKi6lCnaL2oAzc+TN/98RAjFSgG/1KSinoN7TBxwKMorRcbNUOfp+EBSyix6hHt4ZkSM
         zuGJK/mYeMkwRU/27ipIEkHpQ1rypMkLPwueQFhkK4OI3oJe3q240t9mVQFhadeNY7BH
         YvvfWWWluwJ5A8Yc7LFvAlNHR2IXB0Agu7+BxGWMTV+HATKuG9pmFvQdhSgevuOy/t8T
         Ia1cxA/gIhF1s+Hl0eEAojye/pDD4db+jw0ku7NRdbgQ78yS8Vc2I4f6W93dGTq3DEu0
         9cNw==
X-Gm-Message-State: ACrzQf03/kRuL5pGPVmzgCLfw/eCmzYUqEPxqfQvUxBWaTbbRrAbAzJ+
        ohItkMUsS65pltiwdg//OQGMAw==
X-Google-Smtp-Source: AMsMyM5ZQ3mZirTPCfjxx2g8etOmmzLUOJNAkr9WrQMRnF90WGq+P2T4AB6GjsYEg6J4n4dCjH2OuA==
X-Received: by 2002:a05:6512:32c7:b0:49f:53f2:a51a with SMTP id f7-20020a05651232c700b0049f53f2a51amr15234758lfg.236.1664385145257;
        Wed, 28 Sep 2022 10:12:25 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o22-20020ac25e36000000b004946c99e78asm521688lfg.277.2022.09.28.10.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:12:24 -0700 (PDT)
Message-ID: <b04d42c1-1ce5-702a-3153-ab5d2179870c@linaro.org>
Date:   Wed, 28 Sep 2022 19:12:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 02/11] dt-bindings: clocks: qcom,mmcc: define
 clocks/clock-names for MSM8974
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
 <20220928145958.376288-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928145958.376288-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/09/2022 16:59, Dmitry Baryshkov wrote:
> Define clock/clock-names properties of the MMCC device node to be used
> on MSM8974 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

