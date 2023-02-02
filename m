Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48937C63797
	for <linux-clk@archiver.kernel.org>; Thu,  2 Feb 2023 09:05:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjBBJFM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Feb 2023 04:05:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231939AbjBBJFL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Feb 2023 04:05:11 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50273F75E
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 01:05:09 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id t7so1030953wrp.5
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 01:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aas7g+6SlCahM4/JlKt9tccnwstoDHT1GhyyZDuflH0=;
        b=KQzCWLPYLz6sS6DcKgNPc6EFZAxwOkCbtTsexR217dSXUPbHC3nYi2WxD9DQDjED05
         ffQv1kIBRUlDvjY399KnyQs2maAWoJV0bEQBlNxBtJZLWbxODpZrpFPQPIi3Lx8jKOWy
         s4o6+XeIpUuyggvq+nOxU9B3lR6HK3+/QXK2RhkFdLgj9I6RM6tb3VOGxbO4p7h9pJD8
         /G5nJNrbnLjvxBit8PEoSrElFW5YRSVBfWsYN2r6C8tiIHfTinvZFgqQjbbk4nmuXRvm
         LXG7kjYnd32dZn8O8uMcCgkqiPvkwVySm+eLsUN7E8IWquoWwLrXMBwfNkvS54U1og81
         tymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aas7g+6SlCahM4/JlKt9tccnwstoDHT1GhyyZDuflH0=;
        b=a56YKjP3E30dWkK1c8hCutMhVlOV56IFEu7arfIPyhD/vMdn+8ZUZ/gcE5f7HRne4V
         ZMN8yj8mN3iBUUDbo/BK92cV6iWdDnuB9efqDqugRNGmgzPQKfTR+OupdLV8wFD8Y3Dm
         wH57Rsm1cVbGaOXCjKamXFJSs+TIhdpF1yp96e87WiIJDavdl5vxpmsdKMJF64Gr/Vci
         BxjIIqowzRMAevYc6AZMlpOZQPA/lq0urXVLi4FdutJh1cpgJBuYZyHfWIoDcznLgNsY
         pyctGtWtjODffbTMrhyY6/9vuSQNIlLNXUR09Hoj1kGOGN8nsumeRLD+UAOYAQ1xPW+w
         u8Aw==
X-Gm-Message-State: AO0yUKUb9lZycdE5GAa55XBDz+WHcy9WCpqnXktJS2+1Ozz/diZSn+9R
        Qb5mnHd30eCE+eHOTzwFBInmJw==
X-Google-Smtp-Source: AK7set8ZOU9bRmC1mxzolKIaIbHjOQkCc9aGTdJjEUm4NNeCFulVKYIvbggDfwzjSNz4W+mMWkA4Yw==
X-Received: by 2002:a5d:6850:0:b0:2bf:e443:ea6e with SMTP id o16-20020a5d6850000000b002bfe443ea6emr4661447wrw.57.1675328707834;
        Thu, 02 Feb 2023 01:05:07 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f9-20020a056000128900b002bf95500254sm8356055wrx.64.2023.02.02.01.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 01:05:07 -0800 (PST)
Message-ID: <b8703dbe-9b4e-86e7-b24d-ff3b3c315327@linaro.org>
Date:   Thu, 2 Feb 2023 10:05:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V5 7/7] arm64: defconfig: Enable IPQ9574 SoC base configs
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230202083031.10457-1-quic_devipriy@quicinc.com>
 <20230202083031.10457-8-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202083031.10457-8-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/02/2023 09:30, Devi Priya wrote:
> Enables clk & pinctrl related configs

"for Qualcomm IPQ9574 SoC".

Because defconfig is for all sub-architectures, thus IPQ9574 is
non-obvious for most of people.

With above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

