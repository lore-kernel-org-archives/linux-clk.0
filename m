Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9D3C77B7C
	for <linux-clk@archiver.kernel.org>; Wed, 19 Apr 2023 10:55:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232732AbjDSKzc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Apr 2023 06:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232713AbjDSKz3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Apr 2023 06:55:29 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50DB1146F4
        for <linux-clk@vger.kernel.org>; Wed, 19 Apr 2023 03:55:02 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4edbd6cc46bso2647740e87.2
        for <linux-clk@vger.kernel.org>; Wed, 19 Apr 2023 03:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681901700; x=1684493700;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lh/sqHL3qHKRy6dQR9+KQaAuRIDGOMEf4MBRJHiB854=;
        b=N5fsIoDmgtEt/kcUKU0QATGP7wRO0N11y0zOW5T0Yg/sEWU0itWCnApN8KjjAMbJ4H
         UzpUmzhkgUkI5YoWZfKAhnGC9ZlN1K7h+V9rYKUdmh6VG8drZXpIuQdiW4Yl0e9bW7kv
         KcIOzhLrfnws8zkxXZRbc5Fs/hXR+rdLUTj3ighFEs90DZqUGK1SAUZgbWBy3rqGuLhQ
         eA7ovAOYp0/UXNxbl0cLAOvECynlzfdOKHj2GwTdJmbKQsIesQVODgcYrVMkakn+OXyp
         ZInZYY442RScnrYcIw/0pA0sBdTRlTDHWMwKPz1wLBTHCAKDxpJpPc+C6yGrm6XoNnMi
         OGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681901700; x=1684493700;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lh/sqHL3qHKRy6dQR9+KQaAuRIDGOMEf4MBRJHiB854=;
        b=EtGgTyn/asMLLraF/l8nPLU6XXMjOmVDmnssljDSKM9hRjU7ULy9hmi5dFGVv8wZ5l
         F3cefc108uO0auiaI1nKL7AuMlOQ8HzqZI25BWTbEyT4D1qa2+gO4ub+oevzezX19bPr
         excvHv99ZvM/1g8C27Q4L9JLGSWqmEQ9q5xqBYOfsTKxD4T8n8t0sM9j2pQ+2uqDIvTB
         E23MgMGLXCLZipS4NkZb9UDF7DDEp9XXx5QRt+uM6gYcdzwwci6qFHqV1skufRfHLbXb
         yZIJkxJ4a+guRtALd+ZFZHU3mMh65ZpCGll2EizynPD+pEtzZsk1qFySlmOsBYqPpQ4m
         bM6g==
X-Gm-Message-State: AAQBX9cgzSsC1enTfUUnuXbzVDYxBAc8iZAvWQP6ZQX6pp0da2rooIJ6
        vxAu8zSz3tvPwpTZmp2njExzRw==
X-Google-Smtp-Source: AKy350Z6ikEpiz+UqB2/wfMi4ArQIxiTpGKOyPcyl4zyXnvhdgCwOAbXSMbb9famVCg8NVkkDb/ZBQ==
X-Received: by 2002:a05:6512:204:b0:4db:d97:224d with SMTP id a4-20020a056512020400b004db0d97224dmr3921802lfo.19.1681901699942;
        Wed, 19 Apr 2023 03:54:59 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id e7-20020ac25467000000b004edc20b8929sm1243763lfn.69.2023.04.19.03.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 03:54:59 -0700 (PDT)
Message-ID: <65e285d0-e3a8-030d-ee9e-28b875526288@linaro.org>
Date:   Wed, 19 Apr 2023 12:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V2 4/4] arm64: dts: qcom: ipq9574: rename al02-c7 dts to
 rdp433
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_arajkuma@quicinc.com,
        quic_anusha@quicinc.com, quic_poovendh@quicinc.com
References: <20230417053355.25691-1-quic_devipriy@quicinc.com>
 <20230417053355.25691-5-quic_devipriy@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230417053355.25691-5-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 17.04.2023 07:33, Devi Priya wrote:
> Rename the dts after Reference Design Platform(RDP) to adopt
> standard naming convention.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  Changes since V9:
> 	- Renamed the Board Device Tree Source to use the RDP numbers
> 
>  arch/arm64/boot/dts/qcom/Makefile                               | 2 +-
>  .../boot/dts/qcom/{ipq9574-al02-c7.dts => ipq9574-rdp433.dts}   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename arch/arm64/boot/dts/qcom/{ipq9574-al02-c7.dts => ipq9574-rdp433.dts} (97%)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index e0e2def48470..f926e7e1aa7d 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -9,7 +9,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c2.dtb
> -dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-al02-c7.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-asus-z00l.dtb
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> similarity index 97%
> rename from arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts
> rename to arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> index 2c8430197ec0..2ce8e09e7565 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * IPQ9574 AL02-C7 board device tree source
> + * IPQ9574 RDP433 board device tree source
>   *
>   * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
>   * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
