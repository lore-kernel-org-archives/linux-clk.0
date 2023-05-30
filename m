Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8317C77B7A
	for <linux-clk@archiver.kernel.org>; Tue, 30 May 2023 15:41:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbjE3Plk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 May 2023 11:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232005AbjE3Plj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2023 11:41:39 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC9E7F7
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 08:41:37 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5149e65c244so3355829a12.3
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 08:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685461296; x=1688053296;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NdIKL13IA/VVIsQg9Ntg/oyG9VIy1QB/RtS37gRRRL0=;
        b=ExG7Of/p5LzWELs3RzPcRUT+B9JnbICl/gtisRaUY1+U4nFtbtObZcyg4/Yq2G+eRn
         6+0VQGjCVhFS2ghQf8A670yuZM1pmiLyOonfv26T5uww1wj0Yn4U5av8hB02X98fkimE
         T/sy4spO9m+cgyrk7ZdLgeoIGz5kl/s+yDPv9cE8DA0QsQYG/YlDUcqU6+gpLYebrqqo
         TpUJ9OG/KDpCqq8+LZkbYwO1MCrKkLkT+0lhRRYp2YZAw7yGQYQHbLytz1V/qFoijhmc
         1UCb1ZtWaEW8B1VsjGIxbMCpbR8Wun5E4vMVNYjFsgdJjBmI6sV0JqprbuVZl3HfvYH8
         om1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685461296; x=1688053296;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NdIKL13IA/VVIsQg9Ntg/oyG9VIy1QB/RtS37gRRRL0=;
        b=DFSUFz3rv3IodWdU/SBL/rDtbANZVZbg1ThBWN96ptJIJMXY4nNbLYjrNGiJCOdAYf
         mLsgqc+8RLKdKEMDYOXN45mnz30s3MFJvtrqaRjmBFW9MQA0TFjBrqeYkPoxnHtq8/F2
         pjVLlHII+OP7YcJKTqiG6zV6LOBZckuA7+53BKRRniMIVRQ00axOh/PsmwHurfFtEmB5
         f6k3IRjzH+8VBxB9ec25CbF9VpZs+le+nJ4gTOPMjNbgaOSsp8+kfxLyNnm9yX17Qq+l
         GmtX7O2VHyShqKqCgtXm+WqKrCLxatGxLv39ZV/8GXymZoZPiXbt5RcKtrCX4nooMN7s
         0Yrg==
X-Gm-Message-State: AC+VfDxbetuM5wpXmLn9+goOne7vGMgwLEm4KovZmnqMNmtX07FmajYP
        TY1zuqVXo7gJxrD1dlKinR8SWg==
X-Google-Smtp-Source: ACHHUZ5SVmLH37Vc2JWRV45jsNFz+5foPXXKBAt6V1LgNBqBZ1+IO9RB1ouM9aLjaX8SOPbnsXd8dg==
X-Received: by 2002:a17:907:3e2a:b0:973:940e:a00f with SMTP id hp42-20020a1709073e2a00b00973940ea00fmr3151496ejc.6.1685461296486;
        Tue, 30 May 2023 08:41:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id j13-20020a170906254d00b0096a6be0b66dsm7430567ejb.208.2023.05.30.08.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 08:41:36 -0700 (PDT)
Message-ID: <3d5e627d-726f-9db6-0a59-aee72d4c4ff3@linaro.org>
Date:   Tue, 30 May 2023 17:41:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: clock: sm6375-gpucc: Add VDD_GX
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230529-topic-sm6375gpuccpd-v1-0-8d57c41a6066@linaro.org>
 <20230529-topic-sm6375gpuccpd-v1-1-8d57c41a6066@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230529-topic-sm6375gpuccpd-v1-1-8d57c41a6066@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/05/2023 15:14, Konrad Dybcio wrote:
> The GPUCC block on SM6375 is powered by VDD_CX and VDD_GX. If the latter
> rail is not online, GX_GDSC will never turn on. Describe the missing
> handles.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,sm6375-gpucc.yaml      | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Best regards,
Krzysztof

