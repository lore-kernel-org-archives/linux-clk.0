Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACB2C38142
	for <linux-clk@archiver.kernel.org>; Wed,  1 Feb 2023 09:29:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbjBAJ3b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Feb 2023 04:29:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231656AbjBAJ33 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Feb 2023 04:29:29 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D72B3265BB
        for <linux-clk@vger.kernel.org>; Wed,  1 Feb 2023 01:29:27 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id q5so16701472wrv.0
        for <linux-clk@vger.kernel.org>; Wed, 01 Feb 2023 01:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bS8u9dCXaSOWNsP7B7Sh+H7V+3DTgLiBLBtS8ycyLEc=;
        b=LmmGVpowRS29RQUjxz4ZJFIt5f8Qs7RZanr1gRW76BGvy1BKPvxXtyL5tDtYEixLvq
         S27mgLjagerJEezr8drBZGER+VEgZXY7Hasgjr0LhdtiW/en+ZhUX6L16cY8guV2BG76
         dXsePUdP/goKeiLhu3XaDSdDvIB5vAy6sP7pDoCezOSR8nyaM7Kh50leLBvjNUa13eba
         +w+R2oumx+n9EKEO2/L6UVfDH+YIs27dT4/NQeFmzYYcmK8lWsBAi/hnTN6bx6ZoMfPx
         E7pl4H3y6HJ1S/co5awLWDbEiL6Egt/9gtFWoSul2zjHHpcXVhdOm4+1JpsZRipn9YFZ
         KMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bS8u9dCXaSOWNsP7B7Sh+H7V+3DTgLiBLBtS8ycyLEc=;
        b=w+vCcToIhncYa8kwFM4P5n/Z08tXCjTmOkVBDVC1SuCGB4MjcOkIkTP6dk4RcYS+ZA
         l+eDNCc5dLT6NCgpRyoHq09QrNOS4aD2ckcOPxyE6AJSbup3LQ0cJmuUarik4RIPc/uv
         AEh1ddPfaofAPu+6Jc9RkVe3+S68qWdV69SNHkN7Jr4dkk7C3mblYW6VV6hQLnG7+TNJ
         NkrHvDsILQ065SyNQK5hv9Pu8lvoj7PDBmjOHKOkn8VgTF5aHENjH7AJgo4oUWk23Q/m
         dKZEdC6L/I9PC6fx67aktAm4HrSKYfYmJmq+nA6q5RikgXGhjmirUWoGc/hmo+/yxnIA
         PSxg==
X-Gm-Message-State: AO0yUKV9yAKe7xCymYcFDO/+D6+wji78wPHBCxCzULrDBQ87onBOYZ9B
        bernrfuw/jzsQLmoKNcZlGRGFQ==
X-Google-Smtp-Source: AK7set81cMnSNDvxJINFe7dfS34mhVEhPHLeliCWQnE2YDzX/9iwv01Ne9fckDEuo9bFuRsiZYUJMw==
X-Received: by 2002:a5d:4561:0:b0:2bf:65ac:ebcc with SMTP id a1-20020a5d4561000000b002bf65acebccmr1580523wrc.17.1675243766435;
        Wed, 01 Feb 2023 01:29:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z12-20020adff74c000000b00291f1a5ced6sm17010536wrp.53.2023.02.01.01.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 01:29:26 -0800 (PST)
Message-ID: <13a4bd83-e4a3-c423-4d4e-32ea94c71e68@linaro.org>
Date:   Wed, 1 Feb 2023 10:29:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2 1/5] dt-bindings: scm: Add compatible for IPQ9574
Content-Language: en-US
To:     Poovendhan Selvaraj <quic_poovendh@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        robimarko@gmail.com, dmitry.baryshkov@linaro.org,
        nfraprado@collabora.com, broonie@kernel.org,
        quic_gurus@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_devipriy@quicinc.com
References: <20230201090529.30446-1-quic_poovendh@quicinc.com>
 <20230201090529.30446-2-quic_poovendh@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201090529.30446-2-quic_poovendh@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/02/2023 10:05, Poovendhan Selvaraj wrote:
> Add the scm compatible string for IPQ9574 SoC
> 
> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> Co-developed-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
> Signed-off-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
> Signed-off-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>

I don't think this improved. This patch adds one line with one value -
one new compatible. Are you sure that three people were working on
exactly that line and that compatible? Especially that it is essentially
copy-paste of other compatibles so there is nothing to work on here?

Best regards,
Krzysztof

