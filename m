Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A75C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 29 Mar 2022 11:43:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235996AbiC2LpI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Mar 2022 07:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235999AbiC2LpH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Mar 2022 07:45:07 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C81FBAE4B
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 04:43:22 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id d7so24387783wrb.7
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 04:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=B/lDSRmBt45ew7slN8pGHqNMcMQbF9rbjhPBwDXjCYQ=;
        b=pNjNmuRreTl0CTr39zOVQwrheRMDsU81PfQLCqwPmqVnaGzMEDTBUK0mQlmQ6+0Jaw
         ZHZ9nngJ95xQ09Ws3DREeamVFTVS1JTXo9EiQce4XCdlfNwDNxb72RjcY+CPculwyezx
         QbY9+2blqFt2yejbMciRwZt3ZRedCh9rnnHh5xWmkuVy+TjYLmlEna3WRCfQNeaAXHqT
         VsaZcvzSojKsvcYUpcRU8CLlQEY9SvmYRa90xshcjaT35XnOWpiY8mRQQFswiSSUFNdM
         YR4CIrWNBxoQoWqU3y2UTuw39M70Bzgx5xytJzwQYL/Xr6NLUqzjKEV9wdnoDvg1imAa
         Zq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=B/lDSRmBt45ew7slN8pGHqNMcMQbF9rbjhPBwDXjCYQ=;
        b=CEkN29TL6o7DPSIDH/Gg31a2HYZoW1//w7iWom7ufZCuUh7qVoYfplfPDl+7KnMqeJ
         AGVhXJbF1/T47Ebao12CU4tRzabIpOaaCNwaybmv7RJ2YxOB2sndW8Q+7nbrt9GH29o/
         4SwRNqKx9IQYIIuOq2sc1wNeZBLQorcAkLS3C1k7APfdJojXwd7rUIY/Uq5LIGVH4jR1
         n9aylZr0Vlgi6JuamcRvJyUyk+UyIly8PTBGLXP1us4MTqKPjgzw/+VqG/kYX+gksxmO
         dhkIimioBSEPyoFxzw6ZKSl4cgBuISuYllOuZgfa70lgop8PsqvnTzj9Q7XYt5LHMyDl
         Q/wA==
X-Gm-Message-State: AOAM533SP/lzYOEQ4FsLDmbMMn/hoQUDmdreif5iFsX2x7tf7x4emRZA
        niFKM2SV+nynU311tARBc2Y/aA==
X-Google-Smtp-Source: ABdhPJypjAXnuentZlRpL2zBiRpa923vpXbWo7NUVcxVtz+EmSJ4zia7oIlJmVSKa0y8npilo+lpCQ==
X-Received: by 2002:adf:fbc6:0:b0:203:8dff:f49e with SMTP id d6-20020adffbc6000000b002038dfff49emr30167362wrs.72.1648554201399;
        Tue, 29 Mar 2022 04:43:21 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id i9-20020a5d5849000000b002058631cfacsm15436766wrf.61.2022.03.29.04.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 04:43:20 -0700 (PDT)
Message-ID: <5ea0386f-5322-4efd-c0d0-0ba0ff526bae@linaro.org>
Date:   Tue, 29 Mar 2022 13:43:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: convert rockchip,
 rk3188-cru.txt to YAML
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de,
        zhangqing@rock-chips.com
Cc:     robh+dt@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220329111323.3569-1-jbx6244@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220329111323.3569-1-jbx6244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/03/2022 13:13, Johan Jonker wrote:
> Current dts files with RK3188/RK3066 'cru' nodes are manually verified.
> In order to automate this process rockchip,rk3188-cru.txt has to be
> converted to YAML.
> 
> Changed:
>   Add properties to fix notifications by clocks.yaml for example:
>     clocks
>     clock-names
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> 

It's the second patchset without my review. What's happening here?

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
