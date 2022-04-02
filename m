Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140A2C433FE
	for <linux-clk@archiver.kernel.org>; Sat,  2 Apr 2022 16:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358500AbiDBQzd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Apr 2022 12:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358504AbiDBQz3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Apr 2022 12:55:29 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA3031924
        for <linux-clk@vger.kernel.org>; Sat,  2 Apr 2022 09:53:34 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id yy13so11893993ejb.2
        for <linux-clk@vger.kernel.org>; Sat, 02 Apr 2022 09:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dV6IVGS3xtBoxp634iqApehAfhXnWGthz6shqxCHOJY=;
        b=xdCYaefrFlgRlWY5ZjIWEPHiKgKiA2vtfKW5Y0euF0sTobQvj6xyFrwMM+OihanzMQ
         ilQsufRYRAEIlM2T49HA+RfTPyPPDWnu2rz1AD5YTkxF1Fq6YcU4b3Yr+w1RrMb2pmxV
         CdRFcuDC9GCG35nhFY8oiKRnthT7LDr6jR65x80PxMvEkZpkzmQu3alNSsrKTlkbwNN5
         9zrd9pjRMKKpUsBc9kGpP+eqidZxM4CVfPg+xsBhZbgRSrwE3WZcNys1K8igE87KY9uo
         nYPsO2ARW+fP4qk09EkwaWHG2QUSrWuUgFGV0K9CndlDWuYxwBc/xbBftOXMZ9YBDN+3
         amfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dV6IVGS3xtBoxp634iqApehAfhXnWGthz6shqxCHOJY=;
        b=fZcBKDuVanV/SG6Og200XgXimhawpmiQ1/O6Wn9a3xhVWR6etuJV6QncAmFkvI2ZQ2
         1YKIKrtcX94+0tG5HYnakoaaYu0LOP9DjQv8jAArphTj2Gf5aa0bI1jDBscfoUcz3CTE
         7SeTthZydt5lRNvtCAx5viPrkAz66AsLMaTQLO2hV+o61J4kS/n0DiFIXBTs/mzjw8Gv
         NCWsNHuD52vut4kUYVkCfqdJkIahQrKo7+fpxG9ZsgTF3hNs34m8glpfTBdgHc3IKZFr
         qnm9BMvOSmDwUk0l7k0+9g+gI3h/0/M1xN371nW7fdP8dK/VtRrWx1yqZvBHmm3bUFjt
         vyQw==
X-Gm-Message-State: AOAM531IuYn7qnvPtjnA0kKYzA/NreF/+y0p1cxKBAakf/DEERosc86U
        HrNTh9gO+hm5q6OaVtTMWJItag==
X-Google-Smtp-Source: ABdhPJwW+flQxA9xtEkBX7qU0QCW5KZc7m8vrd2rx8wwd40a3h5hQL51tp8x90gPY50XAaSj7eyo9w==
X-Received: by 2002:a17:907:3e22:b0:6e7:d37:204e with SMTP id hp34-20020a1709073e2200b006e70d37204emr1516442ejc.375.1648918412768;
        Sat, 02 Apr 2022 09:53:32 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id u3-20020a17090657c300b006d01de78926sm2293742ejr.22.2022.04.02.09.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 09:53:32 -0700 (PDT)
Message-ID: <9fab978d-d24f-575b-959b-acfe05c5c4f3@linaro.org>
Date:   Sat, 2 Apr 2022 18:53:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 13/16] arm64: dts: rockchip: fix compatible string
 rk3328 cru node
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de,
        zhangqing@rock-chips.com
Cc:     robh+dt@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220402143636.15222-1-jbx6244@gmail.com>
 <20220402143636.15222-14-jbx6244@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220402143636.15222-14-jbx6244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/04/2022 16:36, Johan Jonker wrote:
> The rockchip,rk3328-cru.txt file was converted to YAML.
> A DT test of the rk3328 cru node gives notifications regarding
> the compatible string. Bring it in line with the binding by
> removing some unused fall back strings.

I explained to you on your v1, syscon is not a fallback compatible.

> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> index 9c76c288b..8ceac0388 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> @@ -756,7 +756,7 @@
>  	};
>  
>  	cru: clock-controller@ff440000 {
> -		compatible = "rockchip,rk3328-cru", "rockchip,cru", "syscon";

Please do not resend the same patch without changes and without
finishing the discussion. This looks wrong (and external references you
gave support this). What does this resend means? Discussion is over?

Best regards,
Krzysztof
