Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EB6C6FA91
	for <linux-clk@archiver.kernel.org>; Tue, 20 Sep 2022 08:30:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbiITI3l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Sep 2022 04:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbiITI3W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Sep 2022 04:29:22 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D2D8F38
        for <linux-clk@vger.kernel.org>; Tue, 20 Sep 2022 01:29:20 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id a14so2071257ljj.8
        for <linux-clk@vger.kernel.org>; Tue, 20 Sep 2022 01:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=q+qrPK+uK1obP1R6zQ8ccqdr8h0WGw3mEokOpZ/9RYA=;
        b=n4IcFmsbbihK7kruJhyLwMW46OUSjv2IxTDfKhMes67u/4zkET/1ALtl+oJO+Xrxwd
         +fw1SxdX1YZZv3p4eZl+jA+8QbBV7dkb12yt/5Hquel7h2Yz5G0s8GKt6ueCoCpRrslA
         nvcktY8/j1lS+x+CA4L34Re41UNQjJVrbgPL2C/twRwMVIVi4S0QtfHABx9u20S5U0cZ
         vzwz8TwQIOylB2QfJ8PjK2+Y0cVtp49OVK83vitzZQ9AXut+gu84Nta5LKyepMvz0YOX
         oEHGLpSsQ/g/jd4xg24rnoBKr91ZOTfLpCsIEFeyqeeSan9BEAGN6W84gtnMcqwE6YUe
         c7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=q+qrPK+uK1obP1R6zQ8ccqdr8h0WGw3mEokOpZ/9RYA=;
        b=GWDL/Tm6vL8e8YUjWP3qlvF5pvEXrtHdRMQZZntaxrBtMK5hczKJ3N32iFgYo+r7ME
         cugP5c3cyzrVvb14Eas0H47or1Mq0twtzg6C9imnOFLv06H2ovGPVCVFaw6WTEUmUULI
         N4DnD8uYqyfthwxDNmsP7JL3vgkMifMgKxtK93sGqlcfQ+6RX/PC32enfHEP3XlsgsWK
         n/EaBCZQELMpM+5SAUbxTRRYnDJB/OqP1u4patfExm15TljKUCsEEXpvKGLOOr5+GaTD
         QDxHKw1xLaP7o3Z/1GI8kfDRCpkpig4TcqY+ygdaDBX9NGDqJMPyZx55Pk5ulErPk64a
         nNbA==
X-Gm-Message-State: ACrzQf2a81Va7a2h/SyQdCCFf7hqqoA6go2bdOXBN3HSNv2aWbgtjcJg
        cDtrkHOVerBlJcyc826DSQzcaQ==
X-Google-Smtp-Source: AMsMyM6Kprnea7sEuwFMLOSo98vZQJ0lIlpS+dzRwKlUGKUEeFJ1HWosA9iODloVAjdcsbyI3bN3UA==
X-Received: by 2002:a2e:b009:0:b0:26c:3fba:c3b8 with SMTP id y9-20020a2eb009000000b0026c3fbac3b8mr5183171ljk.114.1663662558375;
        Tue, 20 Sep 2022 01:29:18 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b21-20020a056512071500b00494978b0caesm190823lfs.276.2022.09.20.01.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 01:29:17 -0700 (PDT)
Message-ID: <a94b0149-5e49-3aab-540b-ebc1b70b0799@linaro.org>
Date:   Tue, 20 Sep 2022 10:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] dt-bindings: clock: add rpmhcc bindings for sdm670
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220920023709.4865-1-mailingradian@gmail.com>
 <20220920023709.4865-2-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920023709.4865-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/09/2022 04:37, Richard Acayan wrote:
> The Snapdragon 670 uses the RPMh mailbox for some clocks. Document its
> support.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
