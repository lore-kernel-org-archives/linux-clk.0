Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C01C6FA86
	for <linux-clk@archiver.kernel.org>; Mon, 19 Sep 2022 06:58:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbiISG6G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Sep 2022 02:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiISG6B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Sep 2022 02:58:01 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6D01CB30
        for <linux-clk@vger.kernel.org>; Sun, 18 Sep 2022 23:58:00 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id u18so45403871lfo.8
        for <linux-clk@vger.kernel.org>; Sun, 18 Sep 2022 23:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=HixeEijgNdIfC96l5GNmM/ip3I7jc6GLlC/pGYJiNe0=;
        b=DUXv11xaW6oMqERHnBM7YEDFc0tGNDWY3rhOtm1JxwWar9ZNHZrSE4S7NMpm+8Yfop
         +rb3g4YutPawjYnK7H0D+AD+e+uh0+7u4Hv4HvuYbjIk0xK7XNHXwfmEWeBGLqZ29l66
         EVzkLTXDiyW9G3bhW+82POdEpJnkSZ2RWkHJrC+hcEevzfSUx4nbZ6xtVFRhwCbauucq
         NTjBuM3OG7TVNyWKekKqdQhkYPUSCbjIcERHVXvkzGsGMETfYtaOKpyzDNgT2mEeEfUn
         eeVSqsy15SNWZPtgSpT5H54q4viBIE9B6umjQg4cTSde3g4HlUh4hLvYDu1in4YGvHLH
         BcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=HixeEijgNdIfC96l5GNmM/ip3I7jc6GLlC/pGYJiNe0=;
        b=SBUxSFJaG7AaYHJZttxtwOPlkejkJL2k3v5Miy7p9ZIg8WEYWu0DRAYEKT4qEyCQH1
         LcqtjN498Ybe/Xnc5/HSgHqeWSnkZa33raLp7j2sXTxrXwdy6iNJUJUzgpVgRpekVhzw
         lOYywevo3lvJfvBQ+EsBVBpRXAnHBaVinDv6s+6jaD0Ll95EH9/4lD63YBJ3sqnCtCop
         Uo2aM1W3gp1xiucCcM2VZisTeK3wif3sknLZzcBP4g4ZqcFVrKW4AlJGdrtlcmFYwwiM
         DXHx8Qrz8Cnu54bqjWEuQ6/fT/RAkse1u+i2M2N4N2Q4bgXepWfkVgxcpHJZTkdCMTee
         PZ+w==
X-Gm-Message-State: ACrzQf1Rs7BwMrnjbHfm2bxvrXkY4Te/dUqfPNfiivubc09Qx08SqUH4
        0Bdd5jkwFxadU0nc/Z0HjnKgtA==
X-Google-Smtp-Source: AMsMyM5nZRKY7/6eiAda7e78HT4hWua3cDCMp6gdnKVGnPVMSuONGWGJSGCo4ZZQuN/ESUWvErWucQ==
X-Received: by 2002:a05:6512:3b23:b0:49f:59db:62fa with SMTP id f35-20020a0565123b2300b0049f59db62famr4623020lfv.79.1663570678448;
        Sun, 18 Sep 2022 23:57:58 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id e16-20020a05651236d000b00498ff4ae746sm5046224lfs.294.2022.09.18.23.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 23:57:57 -0700 (PDT)
Message-ID: <40700e39-9791-d2ad-8563-0ba2da982e10@linaro.org>
Date:   Mon, 19 Sep 2022 08:57:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3] dt-bindings: clock: convert rockchip,rk3128-cru.txt to
 YAML
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de
Cc:     zhangqing@rock-chips.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <4e69a06d-7b53-ab48-1e50-2b29ff3a54e6@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4e69a06d-7b53-ab48-1e50-2b29ff3a54e6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/09/2022 16:29, Johan Jonker wrote:
> Convert rockchip,rk3128-cru.txt to YAML.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> 
> Changed V3:
>   Fix xin24m clock-names position
> 
> Changed V2:
>   Use SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>   Add more clocks
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
