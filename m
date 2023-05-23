Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA8DC77B75
	for <linux-clk@archiver.kernel.org>; Tue, 23 May 2023 07:42:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbjEWHm2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 May 2023 03:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231929AbjEWHm1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 May 2023 03:42:27 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9869E94
        for <linux-clk@vger.kernel.org>; Tue, 23 May 2023 00:42:24 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-510f3db1cd8so1001756a12.1
        for <linux-clk@vger.kernel.org>; Tue, 23 May 2023 00:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684827742; x=1687419742;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3RG61/5+/WSVFHjkPw5mlqbSw7Nb1Tx6G3f5gWMvqU=;
        b=pwoo+Ug/wK+S8XcSbWP9wKgfJ91G8J/lzEpcbk/vzPMhhstlGmmE/SIppkD1vMDHSB
         m8+GabWzFmjcOcHWQnN1zXkf7LlYf0p7qvFSry939MZ519HVgwtiPJUVznDRbOAAEtVH
         swn7Mkz76VMLytFuP0dFFM2MBtNor5Ih6DuKZ9isCSR48BlTBfjZKJcpxSOCxSQ35IWu
         lJk1Fdj7oyYVMjhslPdSs/ShWgPiRD2JDCwYYVNM8T/QRrA2DWmbrmlENWmITUzLx/3f
         R0Hpk3K2TBhCNrb3DoYNh/cmcTbw1I+klvyz4bUHZ7Kt5mnk5x/TSGjKhMRQsNoCqfrh
         Pdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684827742; x=1687419742;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J3RG61/5+/WSVFHjkPw5mlqbSw7Nb1Tx6G3f5gWMvqU=;
        b=ctASt+R8JAFfOebrtMeYdsrprt3eP2XKfWVZPXgNbUtV3a4+r0vK2H/ibBqCghsP7y
         nNFefFGS5SiM1fnNoRLFAbwTICUssMLPysqOHVYBQsuVAG1rbsNYeWvGQndflsNMppNe
         Fv7Ip/UcwfvMtQs3FQU92IfKY2fLe9RkutitxBTnmZEajGBDM2s7K/ns1o9BOuq6fGLW
         CCzsBCjCXMv5iEHRmtUqX6RcfnXsPkHt9X1ubu9/xS8zyDP3vu2zgfqb4aqbQ/5fZyjj
         VhGYneHgrWfqYYO291276tE57e5AkGe4cyovXprefHvOfZV6gLkwqrjlX7pZZwsF1eiI
         BeuQ==
X-Gm-Message-State: AC+VfDz/tM2hZSNWb7gx4ssdi9s9chM5ZCJ1P5RTsgM36TvfGBScwAjH
        6DObCzfRK0z6LyVcKFTzg0Wdpdc7eSmVfnI92mw=
X-Google-Smtp-Source: ACHHUZ6HRyf/NCQ88ZSlgqg8T9QJtsOCFVuwQZlk584ddQWpQWfvPDdxbTa3oq+weEAWe7eT4qiSBg==
X-Received: by 2002:a2e:4941:0:b0:2ab:bd1:93da with SMTP id b1-20020a2e4941000000b002ab0bd193damr4648474ljd.10.1684827059258;
        Tue, 23 May 2023 00:30:59 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
        by smtp.gmail.com with ESMTPSA id s16-20020a2e81d0000000b002aecfa8c58bsm1494161ljg.40.2023.05.23.00.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 00:30:58 -0700 (PDT)
Message-ID: <552d20f5-ed3c-2f69-2715-ab64914e131d@linaro.org>
Date:   Tue, 23 May 2023 09:30:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dt-bindings: clock: qcom: Accept power-domains for GPUCC
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230523010348.63043-1-quic_bjorande@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230523010348.63043-1-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 23.05.2023 03:03, Bjorn Andersson wrote:
> In many designs the power-domains provided by the GPU clock controller
> are powered by some GFX rail, add power-domains as a valid property to
> allow this to be specified.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
You may also wanna add some runtime pm enable calls in the driver

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  Documentation/devicetree/bindings/clock/qcom,gpucc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> index 1e3dc9deded9..a00216b3b15a 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> @@ -50,6 +50,9 @@ properties:
>        - const: gcc_gpu_gpll0_clk_src
>        - const: gcc_gpu_gpll0_div_clk_src
>  
> +  power-domains:
> +    maxItems: 1
> +
>    '#clock-cells':
>      const: 1
>  
