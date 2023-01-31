Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE65C636D4
	for <linux-clk@archiver.kernel.org>; Tue, 31 Jan 2023 19:31:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbjAaTbn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Jan 2023 14:31:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231917AbjAaTbm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Jan 2023 14:31:42 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0750B42BCC
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 11:31:41 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso6417581wms.5
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 11:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8jbLQVc6c4NcLPpk4YcrEqS6jnb0zXu0aRxcozDrrDw=;
        b=ObyGEWDLK93TYPF0rI0cs3Ra6+/KcHG+nugypmJtapYohin0cVPYmSKl927VH5BZ6f
         tTbG7iU0vS8UGGKFVv/FMuS1X02C6tFQ8Kor8WycYtV9zkKeP+tf8xNYorbuSzEyMnjq
         Hs2ZEAYId9c1NvUxK/D4qbR8dNv7uJ06NiTRo2/3j8HVVqtgL/bfZLAqb/YBQ9HebI9i
         /e6l2+O80ehfwjOuKQoluOfPWA/X1iv1hTcXrkAD0GFKKyoBF0taQVxuYymXkMa8y7JB
         Alx4e9xAm1gv3SMAz+5IyYrnPaeCLborGilT21rLf9TlzeYTK2QnKkb3oamw/HLcpxOF
         BfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8jbLQVc6c4NcLPpk4YcrEqS6jnb0zXu0aRxcozDrrDw=;
        b=U4u4UmrHC1k8oB/nIUYLdu51RGkwgKtrLU0vSbQg70kt9Lds6ARmQnZnjTmrgB0Lzc
         8UjORw9g4ioMHSrPBwghrDVOtBQyCsXoSA1uUU1aZQUvvjdGqEK0z8svPcckPcLjfEF1
         BBXnrlncTqY/pyoYPN6nmk1r22FqhJK4njBouASXZquR3QYgOG8w4vxQfdwc03apBecH
         199kSW332+/A8ED2NPIEeEj8Ol9NmkVL7NRFYFEunRWdooCIS6WZlxdz819AcOtQBAY0
         BUAXmmirn6O6AY92MxCdKqhXgDVwO62YbLGSDS+bpTjsOLVAJCJSrSL9xW0QwI3DR9V7
         ++zg==
X-Gm-Message-State: AO0yUKWc43IKLWasehHPhXZRUKSyPuE/Thc5lTDbUyLX9zV2cDZBhVba
        Z3+1dwMxmIj+Wq7bingUhDqtkQ==
X-Google-Smtp-Source: AK7set9vJ0aBsq1GVkQMrZJF464MEAl8JPMUuQEAOZYkmfSVWb2hMh+knkqFl4MERo+XBGRi/BRtkQ==
X-Received: by 2002:a05:600c:3d95:b0:3dc:4636:7426 with SMTP id bi21-20020a05600c3d9500b003dc46367426mr14611454wmb.13.1675193499383;
        Tue, 31 Jan 2023 11:31:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c468b00b003dc4050c97bsm189428wmo.3.2023.01.31.11.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 11:31:38 -0800 (PST)
Message-ID: <f87d1721-c6d6-fc7d-bcdf-f66755b89966@linaro.org>
Date:   Tue, 31 Jan 2023 20:31:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2 1/9] dt-bindings: pinctrl: qcom: add IPQ5332 pinctrl
Content-Language: en-US
To:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, arnd@arndb.de, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, nfraprado@collabora.com,
        robimarko@gmail.com, quic_gurus@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230130114702.20606-1-quic_kathirav@quicinc.com>
 <20230130114702.20606-2-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230130114702.20606-2-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/01/2023 12:46, Kathiravan Thirumoorthy wrote:
> From: Kathiravan T <quic_kathirav@quicinc.com>
> 
> Add device tree bindings for IPQ5332 TLMM block.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

