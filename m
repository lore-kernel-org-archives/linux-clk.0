Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F8CC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 18 Apr 2022 16:14:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240134AbiDRQR2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Apr 2022 12:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231966AbiDRQR0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Apr 2022 12:17:26 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 860BB2716E
        for <linux-clk@vger.kernel.org>; Mon, 18 Apr 2022 09:14:43 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id lc2so27633584ejb.12
        for <linux-clk@vger.kernel.org>; Mon, 18 Apr 2022 09:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zAbDaa3Fzu9udWXpswwoBO6ZRwmj5/ZIXRUmVima/oE=;
        b=uQ10tyQ9nN6m9mdOspDehNtUVfIpJfsiM3KKZDqVH5Iis/qjfN1f99uKoVsjMiIdAV
         eUXQ0XQ1+hlvzs0EB1UZj1T2eDYsX6rYMl40bNn/Q2W5ipoDmqbwF+7XqOcIPSBhciby
         yHqNwH6U2qnvmRCe86ujlXfKb8H5f70frnuTEaCwByXAQE2LmcKcRrgeUnopvjhMy0SC
         VDXM2izKAQoAVdqLBjmvqP1CmtFSUfibAQC/AJ6ZbQHwA5FFW1qPD/6lmD54QIyzEvDG
         +Wju7hf9MEcn9mImA9u3zAl9cxR41KUFjbQJwfs1/zWz0hVqKJVLreRUD3ToCg5HdszK
         9kOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zAbDaa3Fzu9udWXpswwoBO6ZRwmj5/ZIXRUmVima/oE=;
        b=4e+J7FHciwuQb2OH5TTFgb0qyeeDVg/Yrp6Ew2S8HoFyxw4RXq8WCRJcy8S7BS0U0O
         b3JwCw/kW0X5H/Mu8bNp57hSBOrUUHN16s6AOR/YpIaIe1i4+YgauKngE+eYBqZ5B6pU
         rQSxml2BHptuZDiT7LRlp9YltZd17e9CX9heKZWUJfu2H3oPMAEBeFXtJCrk4Pyc/Bf3
         +y6YlxIGpxdazlBE0osQVmKt4zNxUZwCEWzm8GqWjX7Su4ugZCpK5Xy4eHuh2WvLBbHR
         fZDx6r23+ccx/oeZ/pIf/XqHayPpkp6EIU3OF9AhNKT+Wm7jODT+38u5/Hv9lHckB5eI
         I/8g==
X-Gm-Message-State: AOAM531Ztvg2fZrv212GvSQBKWez2TaKe2oi54e1btRJodf+NgurUQ7g
        GCcgF1xvG6m3xTudvNvhxkjvlA==
X-Google-Smtp-Source: ABdhPJxmQV6eL13LYTzh1dUddKu2BYtaTh62Jqj75DXsClvOz7hbK4WIbDGZIWagL3ln8AWtFG6DJQ==
X-Received: by 2002:a17:906:5fc6:b0:6e8:86bd:64ab with SMTP id k6-20020a1709065fc600b006e886bd64abmr9483259ejv.538.1650298482132;
        Mon, 18 Apr 2022 09:14:42 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q8-20020a056402040800b004227b347ee3sm5411760edv.56.2022.04.18.09.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 09:14:41 -0700 (PDT)
Message-ID: <2af6f2b3-9a75-c4a7-8c8f-31d94e0001e7@linaro.org>
Date:   Mon, 18 Apr 2022 18:14:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 2/3] clk: sprd: Add dt-bindings include file for UMS512
Content-Language: en-US
To:     Cixi Geng <gengcixi@gmail.com>, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, orsonzhai@gmail.com,
        baolin.wang7@gmail.com, zhang.lyra@gmail.com
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220418125630.2342538-1-gengcixi@gmail.com>
 <20220418125630.2342538-3-gengcixi@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220418125630.2342538-3-gengcixi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/04/2022 14:56, Cixi Geng wrote:
> From: Cixi Geng <cixi.geng1@unisoc.com>
> 
> This file defines all UMS512 clock indexes, it should be included in the
> device tree in which there's device using the clocks.
> 
> Signed-off-by: Cixi Geng <cixi.geng1@unisoc.com>
> ---
>  include/dt-bindings/clock/sprd,ums512-clk.h | 397 ++++++++++++++++++++
>  1 file changed, 397 insertions(+)
>  create mode 100644 include/dt-bindings/clock/sprd,ums512-clk.h
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
