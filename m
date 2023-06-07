Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A9CC7EE2E
	for <linux-clk@archiver.kernel.org>; Wed,  7 Jun 2023 18:37:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232859AbjFGShc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Jun 2023 14:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232357AbjFGSha (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Jun 2023 14:37:30 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7564C212B
        for <linux-clk@vger.kernel.org>; Wed,  7 Jun 2023 11:37:11 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-977c72b116fso753920666b.3
        for <linux-clk@vger.kernel.org>; Wed, 07 Jun 2023 11:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686163030; x=1688755030;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TBJvAcEQG2LY1vEFF1IyEE7RE0JoBORvfJiXnm2YgHM=;
        b=qrWeIk4YwcZ/UP+m3nmcJ36ROhF2tdABqHxKNMe5BdbmFqzTHXpZ7BuVvAtn6yqK/L
         ALPZQnxm1/nS8iSTebGIQexO+ajZd0VjL9GP+LfB9dwmBCGkLLbhO8diXgDzfX9VnEy9
         neI7aHWUOKygd7ijcszY01vUrIiP2AqDbCCULt/jVPrp+Q5xInjGaYTwisoftEKwXDJz
         eBzpT0E/PpX5CIiYmHj/Trw68oW2FqdWHqfC8hsHYuelvU52sYDUB8VwEyTQvYyDtb/k
         +d8ubF6geMCquX3h4qgXNT1Oc8PiKyK6F/ZXQnKBC++F7TaqLRqiROVdKtWdTgceUjxf
         aHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686163030; x=1688755030;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBJvAcEQG2LY1vEFF1IyEE7RE0JoBORvfJiXnm2YgHM=;
        b=Qn2mf9UR+qOY0PG5AV8YAVkV/PJhpSjIBCJCGEOlAnL/neq5XksVRdrQTJPs1e7eMV
         eP466ZWVgGflPCPHjohMac7GWf/66pgLNwPHehRnXwTkDdVvRuJEwafKrzAOPKOXm/Ju
         t8zVVHZhjrYv8I6/b2wVLfsF6XjNSuPJEltZ63rwPMpEX0Gq+njLqqKyUWU78oc6y6jy
         W/u9JlRPREonHxqV8+ZA8c+f8be2VIBgJhLspNvoZuZT21HfD8Cp8daJOZiZJho5trN6
         ihoh/gqbfqbRPNXtNvQR0ygqbmdUXnaM2MVpOECOVdcEMU75CWr6prTH+nNL77Xx5xlE
         IgYA==
X-Gm-Message-State: AC+VfDxlWVWtgSJ9/g66c7xCPBOJEOfFe9IewbckfkWv4sXgDDUxpxgL
        a4MZF6pgAtGVTowzBetEpsz/Zw==
X-Google-Smtp-Source: ACHHUZ4ZTFG+XhRWtjV8bpPXmdRsoCVVFTbyApWlPN15wkPN8gqENfBjyZhOMvcU//hPfzQqyCf1Qg==
X-Received: by 2002:a17:907:a426:b0:96f:912e:5ec4 with SMTP id sg38-20020a170907a42600b0096f912e5ec4mr7063552ejc.16.1686163029840;
        Wed, 07 Jun 2023 11:37:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id os20-20020a170906af7400b0097887b68c17sm803492ejb.98.2023.06.07.11.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 11:37:09 -0700 (PDT)
Message-ID: <cba3834a-8ed3-b3a8-32cc-b0397fa5ae41@linaro.org>
Date:   Wed, 7 Jun 2023 20:37:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 5/9] phy: qcom-m31: Introduce qcom,m31 USB phy
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, catalin.marinas@arm.com,
        will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        p.zabel@pengutronix.de, arnd@arndb.de, geert+renesas@glider.be,
        neil.armstrong@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, rafal@milecki.pl, quic_srichara@quicinc.com,
        quic_varada@quicinc.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
References: <cover.1686126439.git.quic_varada@quicinc.com>
 <636308462efb579734de829fb6e9cbda81b982f7.1686126439.git.quic_varada@quicinc.com>
 <f007fbf0-b1a7-cb44-d662-c30bf114365e@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f007fbf0-b1a7-cb44-d662-c30bf114365e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/06/2023 13:20, Dmitry Baryshkov wrote:
> On 07/06/2023 13:56, Varadarajan Narayanan wrote:
>> Introduce CONFIG_PHY_QCOM_M31_USB for including the M31 phy driver
>>
>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> 
> Is there any reason to keep Kconfig, Makefile and driver in different 
> commits?

KPI? Yearly objectives/goals?

Best regards,
Krzysztof

