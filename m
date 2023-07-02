Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AECEB64DA
	for <linux-clk@archiver.kernel.org>; Sun,  2 Jul 2023 10:44:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbjGBKoT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 Jul 2023 06:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjGBKoS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 Jul 2023 06:44:18 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D5D1E54
        for <linux-clk@vger.kernel.org>; Sun,  2 Jul 2023 03:44:17 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so6103707a12.0
        for <linux-clk@vger.kernel.org>; Sun, 02 Jul 2023 03:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688294655; x=1690886655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kr463YdK4TueQEsVEF6h6lfHtlC9u7gWIjzonOPSpWY=;
        b=lAmo/htwhnr3meiTy6buZajTjmyBMZGOcsAN7c1z+G9I8Zp2AsDtuXny9NQlz4uL8C
         00Xqe+4m3aYUamayF/Zhdhu1Nq12H9R1/PBmdmPO/vXYGTg7FAl0/S1zFiuMw1jm91kb
         cJks7JHr9QsFUpahsfuSPDY2JlhHcWnrA2AYzGmJA6dnLsSl+1KZ4UHOU/LGZzji3kzx
         EaU5u18quTmRGKWto4Q8jVPBNQdsw0mN3sZrfNKBihzNzI1kenLTEoryrOO3LOKeXSCE
         kZtHwrozSUM3U1I+vDCbpDQd8Fq6MtUEXf6wsZ/aYFXzfTmP2kKPYtsv8/pAE5Z0U3DY
         mSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688294655; x=1690886655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kr463YdK4TueQEsVEF6h6lfHtlC9u7gWIjzonOPSpWY=;
        b=gWTZIXUVCNauW/CQ3Z9uHZ8AeEdHil9Qg9cA05t8xM6RPE+HZNXJVgGldHsqVMNHPi
         obmCMbbkhNZqjkqOfegvFxo/k/zn+vrrIXfdK3d8H/J/BKy/KGsbCi7byHCnGD135ZgJ
         8Ooc3/hJfA/K0sdgRBkr/LLdJtBp3xAOdEJurM9nfXBNXWyVS+414QprWMD9ziyd3eaL
         ls0Q7ASo9Vl3V4W3jWP8bCbswWelP0DuBHIHEyas1tFQPKAbCX2k2zaJuwSwAkAkLZfk
         LPvt6dGntSy2JccF87noGN0EROvTUSx1DFDRR6567SGfDIVSUplEKjRm5tCS3fUgqDLL
         7Bpw==
X-Gm-Message-State: AC+VfDxgDykqXgGbY5Oi2QqBHl+j9+y3wn3eVfNCcFPsVZHdNKjc/4A9
        NtTloAi3fkHCrAXMSyCkfDAdmw==
X-Google-Smtp-Source: ACHHUZ5YtWdGr8CtiyE5+4zncb/6RbLT+pffZLWaUK/5zaKkRbOmvN3mhkPyS7MUdOe3iXe1x2Q0HA==
X-Received: by 2002:a17:906:6a0f:b0:991:d414:d889 with SMTP id qw15-20020a1709066a0f00b00991d414d889mr11713340ejc.15.1688294655476;
        Sun, 02 Jul 2023 03:44:15 -0700 (PDT)
Received: from [192.168.10.214] ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id c15-20020a170906528f00b0098866a94f14sm10405513ejm.125.2023.07.02.03.44.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 03:44:15 -0700 (PDT)
Message-ID: <5d13ddb3-e81e-2ce6-a4f6-90e2210b8def@linaro.org>
Date:   Sun, 2 Jul 2023 12:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: imx93: Add PDM IPG clk
Content-Language: en-US
To:     Jacky Bai <ping.bai@nxp.com>, abelvesa@kernel.org,
        peng.fan@nxp.com, sboyd@kernel.org, shawnguo@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20230628061724.2056520-1-ping.bai@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230628061724.2056520-1-ping.bai@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/06/2023 08:17, Jacky Bai wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> Add PDM IPG clk.
> 
> Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  include/dt-bindings/clock/imx93-clock.h | 3 ++-


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

