Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BE5C001B0
	for <linux-clk@archiver.kernel.org>; Mon,  7 Aug 2023 08:41:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbjHGIlo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Aug 2023 04:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231164AbjHGIlh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Aug 2023 04:41:37 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36DDD1738
        for <linux-clk@vger.kernel.org>; Mon,  7 Aug 2023 01:41:33 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99c1d03e124so550573566b.2
        for <linux-clk@vger.kernel.org>; Mon, 07 Aug 2023 01:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691397691; x=1692002491;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MUj1t86IIglhpvqbCl+JW1p0KP0RIykK8lcH5sYs7WE=;
        b=uHaH2GdpgclUraDoPzTb4pV1nYPdWxfiaaGHpD8ip5S2erNhUbkFpcvX3tLQPwuJiE
         P4w4rynffTyS+jg2bYa24bS/McH0qUG3jz9KDhRnz2F5jH91vq9rmtL+Tk9O0eapCLd4
         L0Vk1ld06IK76WOh6X1ctPA1RF6HLNgNr+HQfD9oEfnOXkOc9mlLixdgJELnWCCVD3g8
         PN9Xmpj1Uys9VXyFqYLJdaWgPGTMGER4GOkL4uPDNdWW+1C0cELVq4G6zwyRCdF37L+u
         DYyG+mNCr5YKoucMXI07rg+RsfSmjKMQBuunc7mfZWG7kx4F7ULRa4mLEP9cRuGIGiVv
         qYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691397691; x=1692002491;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUj1t86IIglhpvqbCl+JW1p0KP0RIykK8lcH5sYs7WE=;
        b=JHrm24gfozqCC2JQF9vYfVxNs5a3eze6jb/gsW28lpjXfWTS3/p+22np55A/tq/X8b
         INT2PNOLKVhm4n18K/hNaTDZ53+4/zrsUifA41btIz4PxtMnlEb/fMe93IEjBJb8B1jt
         Ts9offXwXtbdgJxCYdKoi6ow82y3aaaHNuVjo/g0c12J1RxTTm3x6otHx9+WUcb3KmkG
         va0WC7kBMud63mNLroBvNq9imXn8IfJjHfrn2LsZFhez4Kk/gJKkMU5JP5wWKAa3Qbkg
         f8yAMptSuVkeMJ3W8cdg5G25bt7wY9KHrlEt8E8iqzCouyfNjioakjCIuxKNUMaeWk2Z
         1q2g==
X-Gm-Message-State: AOJu0Yw98o2c1h7+mmKEzEQe3ng+fzva5eZV1yWzdliIhLp38XxOXrUn
        tJBPhvRujT/Cp9lvK+VjdupNZw==
X-Google-Smtp-Source: AGHT+IHNAZnHDcoJmsBlY3w8kuDDoRD76fbpds8ZCkkKxNciisv0f5lhiixQKkV5SSVUmlWzXnq+Tg==
X-Received: by 2002:a17:907:2e0d:b0:99c:a07f:8c41 with SMTP id ig13-20020a1709072e0d00b0099ca07f8c41mr6204519ejc.28.1691397691504;
        Mon, 07 Aug 2023 01:41:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id v2-20020a1709063bc200b009890e402a6bsm4885380ejf.221.2023.08.07.01.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 01:41:31 -0700 (PDT)
Message-ID: <6caa3739-fb5a-28e5-38cc-9b22830775e0@linaro.org>
Date:   Mon, 7 Aug 2023 10:41:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RESEND PATCH v3 3/4] dt-bindings: clock: rk3588: export
 PCLK_VO1GRF clk id
Content-Language: en-US
To:     Elaine Zhang <zhangqing@rock-chips.com>, mturquette@baylibre.com,
        sboyd@kernel.org, kever.yang@rock-chips.com, heiko@sntech.de,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, huangtao@rock-chips.com
References: <20230807065942.9937-1-zhangqing@rock-chips.com>
 <20230807065942.9937-4-zhangqing@rock-chips.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230807065942.9937-4-zhangqing@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/08/2023 08:59, Elaine Zhang wrote:
> add PCLK_VO1GRF clk id.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  include/dt-bindings/clock/rockchip,rk3588-cru.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Consider dropping CLK_NR_CLKS

Best regards,
Krzysztof

