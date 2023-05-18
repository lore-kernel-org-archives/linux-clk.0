Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D94E3C77B7D
	for <linux-clk@archiver.kernel.org>; Thu, 18 May 2023 14:43:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbjEROnX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 May 2023 10:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbjEROnW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 May 2023 10:43:22 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6CB2E1
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 07:43:20 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-965ab8ed1c0so330483066b.2
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 07:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684420999; x=1687012999;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c5mg0bYNmMZvR4XH2KepYJHCkc1QT01FXeVw0nsFkdI=;
        b=OE2AED9qmZeTEF4yTzRED57SFPtPzoTevCrBoA2Q6K6gvRvkQLMs6JKlvgW9jETwAT
         sp6LZGN/xQgYPx1elInzgtAzdG3z1OgVoXHWSSNpCjuCdDfXNhiIlxI8jFzKwreq+KpV
         t6vYmcjPbdFqMFTTLhtX607igdRWV+UuwJtM/wr4dgzRLg/qiMlIl1Kx51TJzB7pYgAZ
         w8R0wayIPAPMVBatVENiYy3xTDjOGl2vTYWhqnLXez6YZhMYHZSJnQ/RBJ5IrvEVWH1A
         Eavd23Glvi7/xu8ZnLh7ObYJnhLaX02jGOwI4obyur9GDUNATueJv8JPtxU/pQQMBtJ5
         Q0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684420999; x=1687012999;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c5mg0bYNmMZvR4XH2KepYJHCkc1QT01FXeVw0nsFkdI=;
        b=GFtnq5e9qa8KyqFtzdNlpu0B+XsQyzYG2wfnHxc9bREWLmFzP6dzVKy6hmHpOAwtOV
         Kd3+etPMPlsoiF9snNNX+SYbH+agcAkQVkuo8Le4jl5UrCAeFBwIxREBtfu0DmA2+BSs
         Zf8NUD/N+gFKfdmJ8DD3KucM0mbH7Rx9YRdmNftU/EqVZ1RRGfl/gEe87EK+QwmA/4AM
         xS/1UIEUsbug18zh69USdIYIghDgro7jRNNbONU9i/KN97dCchROtmISki5BNoJx7c5P
         gR5HEuFxhbEc287MtuO4dWQtji0IqHPQMeyNr32TUvXLz4t3Dk1np6GYEwkEfyjGls0t
         uMtw==
X-Gm-Message-State: AC+VfDw1oJdpO0Df0VdRKud4c+sbyhsGgPiSU4mjL7ySEqcbJpl+t+ZW
        ciI1+1Gb3v24I59jyrCbtvDOtw==
X-Google-Smtp-Source: ACHHUZ45LkdJN1RAMofvHRAMOL/5aJwIIPt/2VGC/d6xWczG4Bg4nJDUcgLltbg0DwlPo+UOxleaXg==
X-Received: by 2002:a17:906:d542:b0:96b:e92:4feb with SMTP id cr2-20020a170906d54200b0096b0e924febmr15567096ejc.60.1684420999310;
        Thu, 18 May 2023 07:43:19 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7e24:6d1b:6bf:4249? ([2a02:810d:15c0:828:7e24:6d1b:6bf:4249])
        by smtp.gmail.com with ESMTPSA id zm10-20020a170906994a00b0094a82a236cbsm1031416ejb.129.2023.05.18.07.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 07:43:18 -0700 (PDT)
Message-ID: <1fe6d202-f180-b76f-bf8e-98280355ae5a@linaro.org>
Date:   Thu, 18 May 2023 16:43:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V3 4/4] arm64: dts: qcom: ipq9574: Enable crypto nodes
Content-Language: en-US
To:     Anusha Rao <quic_anusha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        thara.gopinath@gmail.com, herbert@gondor.apana.org.au,
        davem@davemloft.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        bhupesh.sharma@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_poovendh@quicinc.com
References: <20230518141105.24741-1-quic_anusha@quicinc.com>
 <20230518141105.24741-5-quic_anusha@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230518141105.24741-5-quic_anusha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/05/2023 16:11, Anusha Rao wrote:
> Enable crypto support for ipq9574.
> 
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

