Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DA4C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 29 Mar 2022 11:42:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235985AbiC2Lnr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Mar 2022 07:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235960AbiC2Lnq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Mar 2022 07:43:46 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 960C08EB56
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 04:42:03 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id p26-20020a05600c1d9a00b0038ccbff1951so883438wms.1
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 04:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fn3HErbG840xG/1DKf1d2N6ycfhrWzL++y+Zz1CDgxE=;
        b=A6EragmFzz3EYNnm8I82VYWua3eXUT9qcZVuJQFeiLO+cc5t2h+KlWVF9LPy7eCWF/
         D6KG0X5veZP48rwSL5Zra3r8CFZW53W0HFFO6XYwfGwUE3eAPS1hzsbYblKMjxt0eWfE
         8aYJxfqvdaA1M6ozoBLp8gODm8f0nKwNnq1fZLyLr8LkymQ2r43oOyKlL+aXqwDVYfPZ
         wmyVWybFtiZ9AuIkXlGA+pGgrIp2nwwHJdwBT7By+EuQqY2GBW/l+lv6ToYTOlCib84k
         cncfkrPcCRDtNjt7YA3+4+wAopwNJPY/giu2SF/OqLxsyMQUbSUaR4TdnQGBgGjjHBec
         h5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fn3HErbG840xG/1DKf1d2N6ycfhrWzL++y+Zz1CDgxE=;
        b=VAa0WsCrnQwXWL8e1hEt3yf/iEpM8Tqqo6HS18e+mwaeELAZh+HSPfxhNRxZuO7LGR
         HD2dUxyot3Fh6UmjyFxht20m3L/VGl+Maf9i6gaNvEEIyP7L0UGnfhLnns12Ue7R634C
         ETCGfodA0Ek21G9LRhAAKSnUg0lhAhyWlAjnqOoE0k7vDdriGP7l9n3F73Lv6bIONeER
         6PiF//lcCIf0TgMq7fOcpTESia8GYR/Dg+HUxBAf+tzLzJbMkelLWLcclJ8C88FgaPWq
         nBmh8o3uYp2WMeTQabOR5JfdV4eUi3lK6BgVSwWVGi2gW9k7Y2jXPtfW+XJ173YAalxI
         9SXw==
X-Gm-Message-State: AOAM533jHyYT0PoD8wlTgiPDebcXxDp3fAWTkz9JRVn7I/+q8v9e7v2a
        /iUK/yXSZkV0cswNczhmKT1O5w==
X-Google-Smtp-Source: ABdhPJzOwx9Bn0AwRaBTztslHHWpRbx/LvUGOgOn/gOyid0v0Tw2biM6UgFrN4vigQJNapEEpwX+rQ==
X-Received: by 2002:a05:600c:1d0f:b0:38c:8ff8:e703 with SMTP id l15-20020a05600c1d0f00b0038c8ff8e703mr6339433wms.202.1648554122148;
        Tue, 29 Mar 2022 04:42:02 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id o14-20020a5d47ce000000b00203e0a21c16sm17397744wrc.3.2022.03.29.04.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 04:42:01 -0700 (PDT)
Message-ID: <9e1aed7c-a702-2ee7-f3f7-f2f3e2b17e29@linaro.org>
Date:   Tue, 29 Mar 2022 13:42:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: convert rockchip,
 rk3288-cru.txt to YAML
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de,
        zhangqing@rock-chips.com
Cc:     robh+dt@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220329113657.4567-1-jbx6244@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220329113657.4567-1-jbx6244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/03/2022 13:36, Johan Jonker wrote:
> Current dts files with RK3288 'cru' nodes are manually verified.
> In order to automate this process rockchip,rk3288-cru.txt has to be
> converted to YAML.
> 
> Changed:
>   Add properties to fix notifications by clocks.yaml for example:
>     clocks
>     clock-names
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---

You missed my review tag. The changes between v1 and v2 were minor, so
please always include it in your next versions or resends.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
