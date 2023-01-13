Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5D8C54EBE
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 15:09:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbjAMPJt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 10:09:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbjAMPJ0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 10:09:26 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E0B7A41EB
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 07:00:11 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id u19so52877486ejm.8
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 07:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nS91eXlAnjiMj88u7y4etQkD7FYD30yOBtDOqeWl1RI=;
        b=wOuyW6N2Mx8g42Uoi9tdjcu0uUhDMRGAD+7VTa5uVk28bs1w/TWjH0vnwMKGizov80
         BRFj04/TtRVA1B40ip1jbwcacBvlGIiudiPjAyqSDXRoy5LnMB2R2vQ9XBmAsJ6TWqNX
         pX3SPoTDyGCOAOCAVo9QZGejRZAlmpALqnmF/DOajsqsceHhsdJ1cmovM+IRoKyV1rdt
         4XPEgHX7YVcw+TvttKv7d3maWBzXwk/5HFAdr7j47slxAy/kmQtTswJos+zKyCehDyek
         e/v0qxEn/vnfg7FX3bgjAEzG8V+s8MylLEfWi4GP5swCa8ffLg6MErP7ovLemEQJYxuO
         cJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nS91eXlAnjiMj88u7y4etQkD7FYD30yOBtDOqeWl1RI=;
        b=2U1K7ZUO3sRX3JPydr7UBehhGrq3/r+bzHn5eyYgypaja5D5TG0DtkRqXm5ac4mL84
         rn79YISm3NOeppLkXjJnJt0kiOZ3xHU4zxJdHqr2WGLDAj/fdvcBio15wL40wf/YF6Ag
         fPsVdiRNlWzNV1Jpt3YRrwLzoQc/4zU0tOTutXVnnDeGFAeEKujvoN9ALeBgguBvHvcz
         mr7O1eiXQqaYbd19150GO8XfimIWdU9kW241DJ2heEF1UibJTd3FZ2h3ijEaybGe0OAD
         sdclTXX7azThiNTWU/9nmzN89mVV3HCfD7Nr8NsaO5tkU2fRJaE8SayXAuiuvhKXnbLk
         Fmow==
X-Gm-Message-State: AFqh2kqaKDHbtZS+nDu1mlTNBetyZsrqlX2jmYEujtwAnfC9NCxpPNWn
        RBbXB6xXVC6tx0+BDGljnZdWiA==
X-Google-Smtp-Source: AMrXdXsWX8HUJt6uHUEBIf4LBeWwMEFhTHD/ZQm32MweHVaxizG2md5tcw/+0pa5J+VC2VZlCfmmYQ==
X-Received: by 2002:a17:907:2a57:b0:84d:2fdf:a41b with SMTP id fe23-20020a1709072a5700b0084d2fdfa41bmr16430423ejc.50.1673622010042;
        Fri, 13 Jan 2023 07:00:10 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090631d600b00779cde476e4sm8586330ejf.62.2023.01.13.07.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 07:00:09 -0800 (PST)
Message-ID: <117ff817-196d-6be7-01b7-7f2ba9111daf@linaro.org>
Date:   Fri, 13 Jan 2023 16:00:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 5/6] dt-bindings: mailbox: Add compatible for IPQ9574
Content-Language: en-US
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, jassisinghbrar@gmail.com,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230113143647.14961-1-quic_devipriy@quicinc.com>
 <20230113143647.14961-6-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113143647.14961-6-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/01/2023 15:36, devi priya wrote:
> Add the mailbox compatible string for IPQ9574 SoC
> 
> Co-developed-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

