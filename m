Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB166C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 30 Mar 2022 10:43:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234733AbiC3KpI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Mar 2022 06:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245511AbiC3KpH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Mar 2022 06:45:07 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2CCF6562
        for <linux-clk@vger.kernel.org>; Wed, 30 Mar 2022 03:43:21 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id pv16so40684003ejb.0
        for <linux-clk@vger.kernel.org>; Wed, 30 Mar 2022 03:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KCxDqLSxzyDOEnmL6jtfhBEBuw6ObSbdwq4kewCKiFg=;
        b=uPfsuHyRZSs815VjijzSUnxTUU0jm752wTIu8uqLddRlETyKxAZzbaFvNwngy0Ql2f
         P9qpWyA+qZofr4imE8H5O+NOtM8aD49zjcSC1CUaDCPFdzm+o9vHgfW8JdEzoawBes5z
         VnZGawaCUbcmxcQ4TdJqzndgZUYXEhCe0tbXkrLpEq6tcza5S5DMmdxvmcERdHsgDIIg
         7abAgWElCyDGc8L+cCv19dWYs8Q81ANjSQ+4Y0Uu6a7KV4sisKvcc0JYdoyH2Ql9Layd
         VHo7hezGsSqhocqN2VoGhGBfYYcwGPT4sBmwPuxtUSjUPBTNmFZzmmjofoK5b7tTNViy
         cf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KCxDqLSxzyDOEnmL6jtfhBEBuw6ObSbdwq4kewCKiFg=;
        b=h3WVI2PNPbcVSZujyeAae17kUayFi7DuUdydXGzHD7sNGcCw20fmfBz3M03WiNnv0v
         NVfEhNApYYwO/pyzwoyvSum6p43+KVuM3dRl3vZBL7GE5Yg43QiSWV7kRRuFoqgkXr/M
         +YELG9SIfI20sFcFzbx99r5ImgUkvgw/4UIeYoShxan4WasCFTQSy3/+7h4Z5ZFpB1L2
         KjOeIEJLJlBRwzCKgEF2busFMeSkFg1606KsptsEpjTFjEE01Fz6u0QKXJ9SDR/eTs6T
         dPTAgWyR45i4tG7hpMm+rL6m3pr0nMwTisiAjJGNTkDUNdG0BCwiKjngBCozAG5U5mZC
         Zz/Q==
X-Gm-Message-State: AOAM532T3swbD5Fm7HZcaSjA9IvknDR1coO24URdweJHKEyFZ6Za4+2F
        Ig4WGtgCvplwpDmrM8yiPNHEGQ==
X-Google-Smtp-Source: ABdhPJxDT18SOqk3+S4iqEhKmkiwQcvrgMb7nQ6+vr+Bgo1Up1b20fw96aHYy+9277zmDjWFsLk/vQ==
X-Received: by 2002:a17:907:a40d:b0:6e1:4055:2c91 with SMTP id sg13-20020a170907a40d00b006e140552c91mr7417567ejc.404.1648637000528;
        Wed, 30 Mar 2022 03:43:20 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id v26-20020a50955a000000b00418ebdb07ddsm9823734eda.56.2022.03.30.03.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 03:43:20 -0700 (PDT)
Message-ID: <c6b2e54f-4f57-e5d2-a1ba-ce71fe8ddafc@linaro.org>
Date:   Wed, 30 Mar 2022 12:43:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] dt-bindings: clock: convert rockchip,px30-cru.txt to
 YAML
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de,
        zhangqing@rock-chips.com
Cc:     robh+dt@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220330103923.11063-1-jbx6244@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220330103923.11063-1-jbx6244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/03/2022 12:39, Johan Jonker wrote:
> Convert rockchip,px30-cru.txt to YAML.
> 
> Changes against original bindings:
>   Use compatible string: "rockchip,px30-pmucru"
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> 
> Changed V2:
>   add allOf:if:then: constraining
> ---
>  .../bindings/clock/rockchip,px30-cru.txt      |  70 -----------
>  .../bindings/clock/rockchip,px30-cru.yaml     | 119 ++++++++++++++++++
>  2 files changed, 119 insertions(+), 70 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/rockchip,px30-cru.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,px30-cru.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
