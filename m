Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39239C6FD1A
	for <linux-clk@archiver.kernel.org>; Tue,  7 Mar 2023 15:22:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbjCGPWY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Mar 2023 10:22:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbjCGPWC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Mar 2023 10:22:02 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D056238667
        for <linux-clk@vger.kernel.org>; Tue,  7 Mar 2023 07:19:44 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id cw28so53683702edb.5
        for <linux-clk@vger.kernel.org>; Tue, 07 Mar 2023 07:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678202380;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8A0oGiHbXpdCnrD62ngIGsGezBV7Cv5UAeMhuYzoX0g=;
        b=geizSapugaHROWrVGsQnWr/dCZU7wvrng7DV4SGe0KUZQRQWMXwkcUewE5Tef8ieGJ
         sP/aaySqxkcdOBhNUZEjzrPgIk1EOAgNvxomRk3PNyS7gUYoREdgw/vdXPAMU81pV1Bx
         W07fBPFUZTLpRkpjPpDXIbjrt1S0GuZgaepvulXj2NHtmGoJ14PxUQScmEdhNzrY8kIN
         zGCZpncBYk+rQ/YOixtmgv414Rc7JOI4xeCFhf0Ur4ABKMu2ofDG37/ToifS8WMajiQL
         yMblVdBGmFJIIBHh25vkvO/4sVFKo/Fjhl/ToJGsd1eZGjlRVSfSNcSpePZUEa9WHns0
         CmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678202380;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8A0oGiHbXpdCnrD62ngIGsGezBV7Cv5UAeMhuYzoX0g=;
        b=Uxe5RDdJb/hF5nVITY+WbkbUJcNMqQfztvPOxDpIW8QsdxvdAEuxxHdqxoJG61ENKC
         TrK4mmSmzkstNQWc0ht4iZm20P3z1dWlvx/1vgzvY0EuXrS4cDfutLhKo5AJ9vTV3+vi
         7SoeKWq8NL+GV23sgi4yYp9zGpfPFxLPth0wEcfKquevLiOEfHPPVEOcSEASvdnOLVM0
         92PUYPavITaijfsyUJWxtmbF/aFKOk1tSZam7LHbo4N+C4fRiX9au93M2Xip03BHA5Dy
         VLvVbkE34jw3aoyxd2Mp0ZAa8AQI+XiMTQZYfS1U53r9g9DuJ3q/RBz0W6/CsOHRzKxH
         AmXw==
X-Gm-Message-State: AO0yUKXzK9TRkAZP5dlgk34ib5FWJTp8+XTJPW+TgP1RME2wOtJa8GqQ
        nNXfeokRKX95z0nyL3piH7uDzQ==
X-Google-Smtp-Source: AK7set83GaVEvUkFlsR9cXM91TEHzQDTNBEkuKX58uHQUXifG2PlIRuHuvOT0pNDQQwGucSVBhKhKA==
X-Received: by 2002:a05:6402:1357:b0:4ad:7bd3:bb43 with SMTP id y23-20020a056402135700b004ad7bd3bb43mr15205289edw.21.1678202380303;
        Tue, 07 Mar 2023 07:19:40 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:a60f:e604:c252:1f3d? ([2a02:810d:15c0:828:a60f:e604:c252:1f3d])
        by smtp.gmail.com with ESMTPSA id d17-20020a50f691000000b004c0cc79f4aesm6856641edn.92.2023.03.07.07.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 07:19:39 -0800 (PST)
Message-ID: <95c57098-aa37-a203-2ed3-f36449abefea@linaro.org>
Date:   Tue, 7 Mar 2023 16:19:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 05/11] dt-bindings: clock: qcom: gcc-ipq9574: Add Q6 gcc
 clock control
Content-Language: en-US
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jassisinghbrar@gmail.com, mathieu.poirier@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_gurus@quicinc.com,
        loic.poulain@linaro.org, quic_eberman@quicinc.com,
        robimarko@gmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <1678164097-13247-1-git-send-email-quic_mmanikan@quicinc.com>
 <1678164097-13247-6-git-send-email-quic_mmanikan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1678164097-13247-6-git-send-email-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/03/2023 05:41, Manikanta Mylavarapu wrote:
> Add support for the QDSP6 gcc clock control used on IPQ9574
> based devices. This would allow mpd remoteproc driver to control
> the required gcc clocks to bring the subsystem out of reset.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  include/dt-bindings/clock/qcom,ipq9574-gcc.h | 159 ++++++++++---------
>  1 file changed, 83 insertions(+), 76 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/qcom,ipq9574-gcc.h b/include/dt-bindings/clock/qcom,ipq9574-gcc.h
> index c89e96d568c6..8bd6350ecd56 100644
> --- a/include/dt-bindings/clock/qcom,ipq9574-gcc.h
> +++ b/include/dt-bindings/clock/qcom,ipq9574-gcc.h
> @@ -138,80 +138,87 @@
>  #define WCSS_AHB_CLK_SRC				129
>  #define GCC_Q6_AHB_CLK					130
>  #define GCC_Q6_AHB_S_CLK				131
> -#define GCC_WCSS_ECAHB_CLK				132
> -#define GCC_WCSS_ACMT_CLK				133

That's an ABI break, if file was accepted. Or a very weird change
anyway, if it wasn't (why adding entry and immediately changing it?).

Best regards,
Krzysztof

