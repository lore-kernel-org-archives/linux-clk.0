Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C4AC3DA66
	for <linux-clk@archiver.kernel.org>; Fri, 25 Aug 2023 12:30:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244823AbjHYM3x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Aug 2023 08:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244894AbjHYM3i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Aug 2023 08:29:38 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB8272704
        for <linux-clk@vger.kernel.org>; Fri, 25 Aug 2023 05:29:12 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so4002499a12.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Aug 2023 05:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692966523; x=1693571323;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FhBMwE3MHaDX6ND3qGNugUwUVOyYbmNTlBBuciUOviU=;
        b=aH7vGVSRCLDmoTWkEC7IZ1dxd68MnPouE/QYJjQCkH/C4i+4dEEIkFZ0acfdePNkR/
         1KY+w5wnDJ9OBswFzVzNrZcVEFeqKaM1++X68UMw85vIhod7QZoq6j5/hl7povGcq1MB
         DwS0FpeG3lY+v+lVl8qkUv4Px1o3JPYtZx6Eyzmyj2/DtKN/RTIQWW/Sbv7rrxiYgfUM
         xOBPiRs4VAlyBeqXdcbHOgnE74hdirl4kLDlm4hgaXbQz9067XeSrb/tb3VkYiRySopS
         eYoI8M0aaR6NtTDDwzd83LRqTmqT6XXTOQwde8zpezccRUBD4rYB4rpI7F+Aik8p3BLF
         J8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692966523; x=1693571323;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FhBMwE3MHaDX6ND3qGNugUwUVOyYbmNTlBBuciUOviU=;
        b=YWFbV/PrP05P/L1EAflW9p8SqqHhajcmRg95mfamzUdilgYm4NRHosWCGMxwNCsTmp
         vUM5Q1c8j6jv9wpnibX1WKfQVzLDsZ7uF2/95KEeN1U1xctzgo51GX20OiMoQy7glnC5
         R0J4XK7z/wsTwecY6VhDfCy4jOy4DwUi1vIjLY+8zU6YF5l5FsJIjxgNczQNVfkE0p3w
         b+0bzw5T3f6ejl0g8/e3/DfPzt93XUSmJymLtYpmmKP5iBskKgkbIydNgzUdBy9YPe23
         YniHMJP09xI8+m69YAUMy3lGRxaDwOfZDROf9R/yIfPWO2RZaWoeb11+L+3+P7n7OSC7
         N/gQ==
X-Gm-Message-State: AOJu0YzSCYf4mBRP/7CcTFDCIs+1HcspcPHEhFRYsX3sV5F1hxDhcTQI
        Q+wc2oX438S3HEUFhub8jObaxQ==
X-Google-Smtp-Source: AGHT+IElSbp36KrzVD5bvYcQ7Jekn8F93SVqrRsyyl1c1Vm8K052ePheCMZItL9tFxamFHFADIvCdA==
X-Received: by 2002:a05:6402:11c8:b0:51e:5bd5:fe7e with SMTP id j8-20020a05640211c800b0051e5bd5fe7emr22520456edw.17.1692966523565;
        Fri, 25 Aug 2023 05:28:43 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id h11-20020aa7c60b000000b005227e53cec2sm957223edq.50.2023.08.25.05.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 05:28:43 -0700 (PDT)
Message-ID: <da744640-9f06-69cd-16fc-44ddd1e8c7c2@linaro.org>
Date:   Fri, 25 Aug 2023 14:28:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V2 2/7] dt-bindings: clock: gcc-ipq9574: Add definition
 for GPLL0_OUT_AUX
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, andersson@kernel.org,
        agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, arnd@arndb.de, geert+renesas@glider.be,
        nfraprado@collabora.com, rafal@milecki.pl, peng.fan@nxp.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc:     quic_saahtoma@quicinc.com
References: <20230825091234.32713-1-quic_devipriy@quicinc.com>
 <20230825091234.32713-3-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230825091234.32713-3-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/08/2023 11:12, Devi Priya wrote:
> Add the definition for GPLL0_OUT_AUX clock.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>  include/dt-bindings/clock/qcom,ipq9574-gcc.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/clock/qcom,ipq9574-gcc.h b/include/dt-bindings/clock/qcom,ipq9574-gcc.h
> index 08fd3a37acaa..f5749bf53898 100644
> --- a/include/dt-bindings/clock/qcom,ipq9574-gcc.h
> +++ b/include/dt-bindings/clock/qcom,ipq9574-gcc.h
> @@ -216,4 +216,5 @@
>  #define GCC_CRYPTO_AHB_CLK				207
>  #define GCC_USB0_PIPE_CLK				208
>  #define GCC_USB0_SLEEP_CLK				209
> +#define GPLL0_OUT_AUX					210

Although you remove here blank line...

Best regards,
Krzysztof

