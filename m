Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E2BC433FE
	for <linux-clk@archiver.kernel.org>; Wed, 30 Mar 2022 17:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349131AbiC3RjI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Mar 2022 13:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241526AbiC3RjH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Mar 2022 13:39:07 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA790C6827
        for <linux-clk@vger.kernel.org>; Wed, 30 Mar 2022 10:37:20 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id b15so25322319edn.4
        for <linux-clk@vger.kernel.org>; Wed, 30 Mar 2022 10:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=37nZjpO60xxhw+JhGH6lR+UcPHceWR6JokhRQOsZJzc=;
        b=Y9OImyp0CCzDW/sTETs6Oeh2Q8dOngiPcTEP4MIS7vr96udYAzC8rHKECvJDt9Eqzl
         4iukmxPudcgcFH0/jRiF2Q7fGJuzrWddCoVl5lEdBWbtZ6raVW08IvYiThZ3+PJ6lBCW
         5Lwz0bIWijGZ/1V4jIy8BFVXf6M8XSkrl4NrOf/uBcQ1fL+StwDXfNPnoOz25WnKKavD
         eVuIaibiVjpIICWqLyuGzG1WxP3PhlOjDWgbTTmGpbX/fubtIR1AfA4Nzdk1h8aIgA3j
         egKxhxYEMU6YyRo5jnrAroMzW0mT8otY02piLFs7NdeAdHpFFss8nCbWEmUbpxBKR9Wb
         kbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=37nZjpO60xxhw+JhGH6lR+UcPHceWR6JokhRQOsZJzc=;
        b=MnZg2IewFsxLQcqGDwr+R/9UVRE98rKPMRtaToonHVWMnzxu/pdSi1mOED/RMANg/8
         oGCCmTmRm3PaLhtyXEbgFdq1lPx3tkfwdmXODtRyGVhuun9fGqR9sF2H+J62TJ1graWQ
         Z2XKYwntemgKOjy3TZ4dyCfbKxvl7Hjbi6hJeHDoZW/mSzS4btY3e2Y2HInZy/4dee9F
         IlRR8lUzY42J4Dw5+aJilu5aZbVO5L5u5/jpMx2T8iZ+n69GHItUiGCfOjBFd4PnIUpL
         WZ0Ope2Ul8EDZmNWjYD+9QZD7kEMKNyPsJnJXI7uh9X1OLoB3s0VE9p3Gz70IAGnfAWE
         kIBw==
X-Gm-Message-State: AOAM530kTNDPSagDRZtZdwrncHMrkPd9dWQXuwfSKSX27pLJtfpaXF3A
        kts9iUqYa5SQVgnyq7wm6YeaHA==
X-Google-Smtp-Source: ABdhPJz7vZ9tC2lfdY7bX8RqCZsPKm+v2cUMHBva3FJdit23w5ftndodH19y545GvEWK2Lzj6vutNg==
X-Received: by 2002:a50:ff02:0:b0:418:e736:e003 with SMTP id a2-20020a50ff02000000b00418e736e003mr12208703edu.370.1648661839135;
        Wed, 30 Mar 2022 10:37:19 -0700 (PDT)
Received: from [192.168.0.164] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id bx5-20020a0564020b4500b00418fca53406sm9911169edb.27.2022.03.30.10.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 10:37:18 -0700 (PDT)
Message-ID: <569026b9-b73d-b8fb-c32f-8ed920bb73f4@linaro.org>
Date:   Wed, 30 Mar 2022 19:37:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 1/3] dt-bindings: clock: convert
 rockchip,rk3228-cru.txt to YAML
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de,
        zhangqing@rock-chips.com
Cc:     robh+dt@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220330121923.24240-1-jbx6244@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220330121923.24240-1-jbx6244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/03/2022 14:19, Johan Jonker wrote:
> Convert rockchip,rk3228-cru.txt to YAML.
> 
> Changes against original bindings:
>   Add clocks and clock-names because the device has to have
>   at least one input clock.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../bindings/clock/rockchip,rk3228-cru.txt    | 58 ---------------
>  .../bindings/clock/rockchip,rk3228-cru.yaml   | 74 +++++++++++++++++++
>  2 files changed, 74 insertions(+), 58 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3228-cru.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3228-cru.yaml
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
