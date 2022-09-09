Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69771C6FA82
	for <linux-clk@archiver.kernel.org>; Fri,  9 Sep 2022 13:01:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiIINBE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Sep 2022 09:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbiIINBD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Sep 2022 09:01:03 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E1D0AC24F
        for <linux-clk@vger.kernel.org>; Fri,  9 Sep 2022 06:01:01 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id by6so1708434ljb.11
        for <linux-clk@vger.kernel.org>; Fri, 09 Sep 2022 06:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Mg3txqS0o9ZOlGHNSrkPUQM1um7fLqJGDZf1iSImWqY=;
        b=fEurl2AoKDp8uH+DgeMTANTpTYlip4MGCjMq0eHe8A5l3EO1DQzG2lSsuz+dLhai/n
         ea3Q408/tyTb8DgMghCQ5JAE+2lPipbvypeOf4q8fkKeQRzrMLDMwlDB6zjjcFGqO6bi
         uX+wPweMMBugEb9IFFCm8jG7LtcEbyCPs4cA0m+J5jgso5JTnXCCPz4yZnnH0kzU4Dhb
         em2lsyJkonbmResfZz3H8jFcK/toUffkDZlEzcd11d6/IhesZXF0uq9HLlQZ8sGG9LO3
         JLNqOoRatrHLGIl84T115r56BU9n5RiwLp6OwTAVjsG7Byggofh23gZwZkmSSUzKFrqr
         lTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Mg3txqS0o9ZOlGHNSrkPUQM1um7fLqJGDZf1iSImWqY=;
        b=QNAtCE/CRis+b+1NIbSZIcU/3ME4h6x2K0+BmOM3NNMfc2QCrGRhdAVPp40i3ycKE5
         +GymUNfF4XVoqsXnH/fARS/8CALCrvURtcA3swof8qZ4/3Z2GiD4OzjXVfqTWpjaNEDu
         M11XkpKVtTHArqGNpObIy2aLw3NN/EAFu7MKS8+lPtQQ5sgXsynrAGeRwHSTDS3zqaZq
         Sa4rXgoV6C9lWkOUU3D7f7XZSs8iG7q3zOWzkyeHe81gCNW1uUx+FIwHWeVZ7/l00l+x
         Lqfn1B+ezm8+1ZpcHD1gF38iALRGR35wndqC2lw88w7K2ckzwL850m8JSKCUD11t2AWc
         o2qg==
X-Gm-Message-State: ACgBeo3DHqaEzIdq6kDP5Ar2pcgpiqZMXkBT2Nz7kuWAA12yoEhv9Ets
        fhQYT1tPwVj7MBgSrSrv3StLMQ==
X-Google-Smtp-Source: AA6agR4bOG6NESFIlzYoGPBriGrr9nCmZmY4e/QzdatojrAqefqsYyz9DiMqZSw3nuPiJqheJ9A9YQ==
X-Received: by 2002:a2e:84ca:0:b0:25d:77e0:2566 with SMTP id q10-20020a2e84ca000000b0025d77e02566mr4244292ljh.78.1662728455720;
        Fri, 09 Sep 2022 06:00:55 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k14-20020a2ea26e000000b00261bfa93f55sm81222ljm.11.2022.09.09.06.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 06:00:54 -0700 (PDT)
Message-ID: <94cab0e7-17c3-17c0-87ab-c33959ad1923@linaro.org>
Date:   Fri, 9 Sep 2022 15:00:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 5/5] ARM: dts: qcom-msm8660: fix node names for fixed
 clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220909105136.3733919-1-dmitry.baryshkov@linaro.org>
 <20220909105136.3733919-6-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909105136.3733919-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/09/2022 12:51, Dmitry Baryshkov wrote:
> Fix node names for three fixed clocks to follow the
> no-underscores-in-name rule. To remain compatible with the drivers
> expecting to find the old clock names, add clock-output-names
> properties.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
