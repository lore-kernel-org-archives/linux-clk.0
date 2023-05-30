Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E750C7EE29
	for <linux-clk@archiver.kernel.org>; Tue, 30 May 2023 11:04:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231754AbjE3LEE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 May 2023 07:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbjE3LEE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2023 07:04:04 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CECD6D9
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 04:04:02 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-96f5d651170so1066771566b.1
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 04:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685444641; x=1688036641;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sJpPcvlhDr55XVdV13FrZJDCixqh9Kz7L+e3bwYKNW0=;
        b=eYmzjC9fjdboCt4Xpc1iRgGhbX0DwkZwyCCYJEoSymGBuYMlTQ902mIbm3+WH3VYLA
         RTFkAhI1YXZvlZlryC5dxg0/KK/Qe3Czy5QvtLngJAFjxA5fgKVZfJGDLkV8kIhyAl/G
         hujYth1n/g/GjHkdWwotfFFTWShqfywSzRZPiMYgjdqEb+5Cude8j+tTtj/V+H2bMsdc
         ASD7wE5L+EdaA6yTgh+G+sIc8aDo5XvE75uuh6LNepuJAIcx+WchpxT5Go0Fzd31eziI
         W0/QWSyKlmEk8g2vJs1Ro/DGzpXY7ObUS0Hc4IrljLe43/5GTWi3roiT+8ha/jLU8IqN
         rF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685444641; x=1688036641;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJpPcvlhDr55XVdV13FrZJDCixqh9Kz7L+e3bwYKNW0=;
        b=M1KoOlOn0im9ZLVNseTxhhUhqX8jLMNx8O5kgWj61Je2J5ThT8xa5Uo1TTX55KcPR+
         e3apwrMbTao47VQaTZR1YNfRqmC+dME5N6wqDesC/0i4FgiFwZo1e70xgd7AfrfsMxYl
         2pkBH/ZbzYeGuDeEBTr4AYw4vTHhpHaiI2qJr5f4bMdWDIjMTGFOez1RZ/NvK7pwMqSN
         JaQWTw41IYutlP9+WYqKBWq/uIfbYofnt+gyuSG4ajnUTjtjxymIYBdyk793VnveTope
         3TUZ8GBUBdTXMqe7dwLn7K2O0yHr72rlZfP5ns3WiJVGW+cL+v/fpbfb9Aekrzw7e2VR
         CZGA==
X-Gm-Message-State: AC+VfDz8iyfmPhXa3hQm/7IJgF8vTcNKZgNR/g5xk8JAJlc+DnYIGiDh
        wHkSgzGfujKoP/LFAZB+NfGaxw==
X-Google-Smtp-Source: ACHHUZ47aLpUcTUH2+3Tb4gKZeBxw7El92S1s3TQBI7H0P8ZOWBOqOvi1F1laf1lx80mffdjpGOLOg==
X-Received: by 2002:a17:906:6a04:b0:973:93c3:16a1 with SMTP id qw4-20020a1709066a0400b0097393c316a1mr9228224ejc.19.1685444641154;
        Tue, 30 May 2023 04:04:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id h26-20020a1709062dda00b00969f2d5267asm7225424eji.114.2023.05.30.04.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 04:04:00 -0700 (PDT)
Message-ID: <46944bf1-3a07-0db7-2702-f6b7d54b611a@linaro.org>
Date:   Tue, 30 May 2023 13:03:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V2 06/13] clk: qcom: ipq5018: remove q6 bring up clocks
Content-Language: en-US
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, jassisinghbrar@gmail.com,
        mathieu.poirier@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, quic_eberman@quicinc.com, quic_mojha@quicinc.com,
        kvalo@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com, quic_varada@quicinc.com,
        quic_devipriy@quicinc.com
References: <20230521222852.5740-1-quic_mmanikan@quicinc.com>
 <20230521222852.5740-7-quic_mmanikan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230521222852.5740-7-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/05/2023 00:28, Manikanta Mylavarapu wrote:
> Since Q6 firmware takes care of it's bring up clocks
> in multipd model, remove from gcc driver.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-ipq5018.c | 414 ---------------------------------
>  1 file changed, 414 deletions(-)
> 

So here is explanation - your patchset is not bisectable.

What's more, I really wonder now why these clocks were added if firmware
handles them?

Best regards,
Krzysztof

