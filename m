Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3FFC43334
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jun 2022 11:52:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239789AbiFTLw2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jun 2022 07:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232170AbiFTLw1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jun 2022 07:52:27 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47BD2175AB
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 04:52:26 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id s12so20603648ejx.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 04:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HQBxg+vJAkyScNUksmlcWLxdpFJoVetEdX4xGbyCgmg=;
        b=JtyNFOcbA6QtHh2w/cOv9IU2gpAx00sWazdD4qoR2aAIF6JX7CRS1cGIbq/J7bDq4C
         Mkn/tpxWSM3xpoKOcBjurOfWVBRcKXQpXR+RYS07j/B4k8ZOMGscwXpccAM1Fh9D6SI6
         j8jQXbU7sJrKYBYwck4N8TwVRhLnFp587JgZhJhZUn7tq61i93eWDsszRTwsF9qPaK+e
         ccVV6KHMQY3/LL8T8XR09QbsL3B6Kc/PigrRy/SgUm7kAzBfQtIuoC14lr8sgi1bOdLC
         DwZU1/3yOh7oviPkLERCY2+qquTxVDp2PuJi0xsDRrSwsP+Txe+2l5hPa9AN9sd2uz8h
         xlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HQBxg+vJAkyScNUksmlcWLxdpFJoVetEdX4xGbyCgmg=;
        b=200FcqIlP/BExFkF0rQTuXdQRqRXDgyP0Ek9RTzOUlwlK8uJg46TlFf7q6CP6Qe7ky
         3fAE3/YPT0OVuhSsjn3PaIUM5KtUJ9Vk1CnuwF46k2kqo0nlHNnx2SOQcGDDUQAC22ES
         slfV5TlI6pi2i4u3Gvn29YnCEtTgRZUJFs8MgazOVrV44I/NOGgaxIwXQ3UIzf9CjmjG
         pTeBB5a0QkVLNFpxrS31huvKZz48sWwJQCkfpbTMMHQcrY+pIPjZB7AcPc47IloklSFd
         Lo+Y12arrvl5ysXiFRFCIYgesyJPIxcrOXtlJunC47o5pEGpBX7v0BlWPitD9bkOkVoC
         DVQA==
X-Gm-Message-State: AJIora8S4yk0pqwegFXIG6UGInaTU5myBtNjV7NylGQ2/Jw0oJ3Q6NfV
        cH6r+1+38tFJD7fcownXLYxAPw==
X-Google-Smtp-Source: AGRyM1vodcBo3hxJA9Wyq+rKasaZFTEM1w4eBha+Y81mAYw28/jYmtmSkoSp+timQ3u/KJTCPdcmgA==
X-Received: by 2002:a17:907:86ac:b0:708:9c4a:c6e9 with SMTP id qa44-20020a17090786ac00b007089c4ac6e9mr20672289ejc.297.1655725944892;
        Mon, 20 Jun 2022 04:52:24 -0700 (PDT)
Received: from [192.168.0.209] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id dm22-20020a05640222d600b00435681476c7sm6704219edb.10.2022.06.20.04.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 04:52:24 -0700 (PDT)
Message-ID: <2f58a543-3611-cb9c-c804-908569748a76@linaro.org>
Date:   Mon, 20 Jun 2022 13:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8660: add pxo/cxo clocks to the
 GCC node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
 <20220620110739.1598514-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220620110739.1598514-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/06/2022 13:07, Dmitry Baryshkov wrote:
> Add pxo/cxo clocks to the GCC device tree node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-msm8660.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
