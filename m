Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B5CECAAA1
	for <linux-clk@archiver.kernel.org>; Sun, 23 Oct 2022 12:43:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbiJWMnQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 23 Oct 2022 08:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbiJWMnO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 23 Oct 2022 08:43:14 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F13F748FE
        for <linux-clk@vger.kernel.org>; Sun, 23 Oct 2022 05:43:02 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id h24so4324781qta.7
        for <linux-clk@vger.kernel.org>; Sun, 23 Oct 2022 05:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=46zbXlP/ekvHlc+rvAlAXIoiwZK14KNjZ+MO6cDDUDg=;
        b=CrPBfYDHLhFnjyw/m99gjZW2ejknna7AAoRVlnzSRZ8oPMV5V6vCj8h69ZN6S2G4cO
         1SLFj/gNo+kjnJnaN/fyoW3KYBzh6FSLR6z9ODjNEV/5P7pDjt29+0fq3DKJ3TcUJY+W
         TpX53HFYSqjPWauCFUXw/rEpbYjnLlJ6uneDdfQ39IcQ126jX3dqSXStyiNVP6fJrHQ5
         +IZCSY2mmKcLZ1BoPKvuukX3gpBfrn1vPxV7QFfS0tdftmSYwa7JJW1D6DfxiudyisZI
         kJvtYhr0fjwqPd8TnbWaC9vemBmjx2+4SSfnKZwOcb/SudrrWPi0bhj00Rz+kDmdosb7
         zajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46zbXlP/ekvHlc+rvAlAXIoiwZK14KNjZ+MO6cDDUDg=;
        b=p7b87n6/aOcMSAQbcSyz7WACP4GNV3M7bf6m7QdGTeIUfIrsDXOLBYffrNyYCzqAl/
         w8DIX8dmQGE0pc5XNMypumZj4SppT8Q/R9tz6OXpQ+kt7EXS9zOWi/5SK3qpyoOJZitm
         Cq7IlrrbMgnVRBPGONLst+6+RvpHomOSw5EiSeal3hqj6BZG3e6iwakWLPCkQ+/Gd3Nd
         VlB3kIfxIQb4yELeRfzmE5McPoQzQXX7daDKhVAvk7lC4isYnJkGLxE86onksrUamHOH
         uxEB6/BjFKz47JcPuaZqQrFN2Ech45yCow3Ea0NSnXuauRV9JAtwI12zNQEMhBq8ymFR
         x2qg==
X-Gm-Message-State: ACrzQf3bZyzv+hMkwFX2B2wwwhYqq5BXjtwqlkTpCbnRENTcLf51qa2K
        phd+TQfg2v6YBaZ6rjyIGyxBLQ==
X-Google-Smtp-Source: AMsMyM5sqlLeKbh9d6cm57kQ7B7rzCmNIH0msPBvDSGGCXzax8aq6bRs/Fn8qMo3Lulo3ZV1XlzRcg==
X-Received: by 2002:a05:622a:4ca:b0:397:ccb4:5dc9 with SMTP id q10-20020a05622a04ca00b00397ccb45dc9mr23365287qtx.266.1666528979536;
        Sun, 23 Oct 2022 05:42:59 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id h10-20020ac8744a000000b0039953dcc480sm11023225qtr.88.2022.10.23.05.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 05:42:58 -0700 (PDT)
Message-ID: <732c9c23-e5bd-61f6-3fea-aebb95c9bb91@linaro.org>
Date:   Sun, 23 Oct 2022 08:42:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 2/3] dt-bindings: clock: Add Ingenic JZ4755 CGU header
Content-Language: en-US
To:     Siarhei Volkau <lis8215@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20221023123944.4103876-1-lis8215@gmail.com>
 <20221023123944.4103876-3-lis8215@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221023123944.4103876-3-lis8215@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/10/2022 08:39, Siarhei Volkau wrote:
> This will be used from the devicetree bindings to specify the clocks
> that should be obtained from the jz4755-cgu driver.
> 
> Signed-off-by: Siarhei Volkau <lis8215@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

