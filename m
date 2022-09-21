Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D9A9C6FA8B
	for <linux-clk@archiver.kernel.org>; Wed, 21 Sep 2022 09:12:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiIUJMI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Sep 2022 05:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbiIUJMG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Sep 2022 05:12:06 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7E128C452
        for <linux-clk@vger.kernel.org>; Wed, 21 Sep 2022 02:12:04 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id s10so6187679ljp.5
        for <linux-clk@vger.kernel.org>; Wed, 21 Sep 2022 02:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ZjHHQRJGwuqbDb8JIxiASWCllE12kTjIQC60uJoZPaI=;
        b=YuErZJV2pcu4GLKPVzROsL/ZFPM/2cBi3CO3JcxSL0sLn2a0aoSKkQ49biOU3vQFl4
         rFuD5jTF7kr/tV/QRX8D7qFA4+NjcdWbKqSzzSyPvg2lSv6TrOUf3HyOY0NbL0s4aWHy
         2ZmoNFiV9Dv8RFiDbHC6rVPqvP9/ldz9T9uENNTe17wpDE28tSUHmDwCWExEO7+1m0mO
         ipGEVyO8kYnFhGKEO4gt8A1wYCvy8+23sKy+bq9zQSJuILIqOP1SZx0Ng6Y4pEZGQPfw
         IqU4IdRvxGTPaDsvwhCU02Pr40YgjsYT6mGUkHsACiHdCUGtJC23f+kBzWr2ZhbmixBh
         kLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ZjHHQRJGwuqbDb8JIxiASWCllE12kTjIQC60uJoZPaI=;
        b=39nNHPC+e62i6Sz8+bBe2RS90lPDGiHTC1hO/XK7kF0UjIvlXqLyKASLCDY69EpgDK
         GrGIEvmKpPbMr0CCWLy7hjMZJ2UdFSy+KDcZ3zjgf+M/pK3jJt+IbWLJoj3dBzSm07wD
         vV8ItwEstPn611WD++FVlF0kPMxPlTMKEJjCoGNEkbh++Fbb3/BARQpjqZDR6u0L0aGj
         oke3HjuSNjAPsDxBEyyU69QOh4xm2bXyzVu1Gh7gw9Ig6+SaRcO/2THHqRrEHq/zz7wn
         4g1aLy9qRo4kJ+3tPb3IxzpgMEFbGaNCkHs6OhuM2Xyc78VJIMhGI7K8EhKhLNRCzjBO
         ontw==
X-Gm-Message-State: ACrzQf2oS0hrDW7yU+xYysG+c8/ujSYqXi+XgIERTZX6wNzsIqH07xlM
        WudwsafRyeXjVywB+TMZ3OOjryg814ylNA==
X-Google-Smtp-Source: AMsMyM65d5eh3QTDjIdjafQW8dzPMN1JuhFSyd33DcYi8WKHjVw2P4dSaMoRtYcFZO8HGZNMKcwuxQ==
X-Received: by 2002:a05:651c:1043:b0:26c:565b:2942 with SMTP id x3-20020a05651c104300b0026c565b2942mr3569911ljm.440.1663751523110;
        Wed, 21 Sep 2022 02:12:03 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m14-20020ac24ace000000b0049462af8614sm347898lfp.145.2022.09.21.02.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 02:12:02 -0700 (PDT)
Message-ID: <7f8f15bf-806f-a638-f35b-a66d2cb93db7@linaro.org>
Date:   Wed, 21 Sep 2022 11:12:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 2/3] dt-bindings: clock: add SM6375 QCOM global clock
 bindings
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220921001303.56151-1-konrad.dybcio@somainline.org>
 <20220921001303.56151-2-konrad.dybcio@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921001303.56151-2-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/09/2022 02:13, Konrad Dybcio wrote:
> Add device tree bindings for global clock controller for SM6375 SoCs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v3:
> - bring back clocks and compatible as required
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

