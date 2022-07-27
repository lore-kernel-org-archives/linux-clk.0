Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53600C19F2B
	for <linux-clk@archiver.kernel.org>; Wed, 27 Jul 2022 13:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbiG0NnD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Jul 2022 09:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231767AbiG0NnA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Jul 2022 09:43:00 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 761B03E778
        for <linux-clk@vger.kernel.org>; Wed, 27 Jul 2022 06:42:59 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id t22so20781429lfg.1
        for <linux-clk@vger.kernel.org>; Wed, 27 Jul 2022 06:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=d6dqqop2vynaGEoBxYQ5azwnb7G+A1ThTymWUCXdRyI=;
        b=MJhONHLKLWhkwP6aGRVTH84Te9BCOHlTZFTtfPGfP3YKM/PkKAoxkD34bZS3Ss7jt8
         u89rjXGpyglz31n2dMWdTTuLe1VXRLFZXN99vIVGpF0hB0EwKmJFPh/OxZciq2DAJtPU
         qWXuNi/UQtc6tq9mr8F/xhanPEXXZtvfMtsbX4Pb5cwWYeHgeuD58/nqfj7zCVE7towx
         y3IEPWig0IOYHt3+RRqlPqsTNHsEv4UWhLYjLsYLwEjSv1SBXXOhIwisCHiXvtb9O1GU
         /9egxkXrbUBrFMUmxVI3fyAaOCo3mW2EqFYqL9NhSauYsrfWe37UNGLVva3193W4M1pa
         dkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=d6dqqop2vynaGEoBxYQ5azwnb7G+A1ThTymWUCXdRyI=;
        b=5E5cMn/HgTJI1a03XYhTEXkMuMi+ovK2OdoFD3qIHMPE2eTy9G9iJJRNszXCkbhXES
         cjXZWkln+WHjat0VMxEg37QMpdr8HLLXUZZUllYq8s6ZcuJ0OKUgzWEgFH8hxStfc89D
         8MRLh05MzVmFsmnBUShMDjxLv8njYaDw2MqYa0xR6cSmuBQurC2bnlGRJzRVYPIDI2ID
         FPpbiT9ZXiNOx96/UncuA5Na1OiVvGvrwpG2yOa8T8ivAGP0k9xrb0rV3w8iv+ihluHD
         XqHq0vT1f+4/QK8goljmEPvOJQMGA9zY0jsh7ZCp6XukK0b3Rt/yPDp4GGyQ3yrYOBrd
         0OhA==
X-Gm-Message-State: AJIora/8/HCiZPYseICDTqzm8VpO3vafDctsac8VN2V7j5GCZK/38lM1
        O5wSg6st0pOXbb3uu87rWwWd7A==
X-Google-Smtp-Source: AGRyM1t9hSJ0xL6l2h7B5F3QkcPXe5D0nv0IWHb/R0ncyU3Xyq01Ywgyvf+weED12LC81MK3ZAEuLw==
X-Received: by 2002:a05:6512:3983:b0:48a:83ad:5f70 with SMTP id j3-20020a056512398300b0048a83ad5f70mr6606113lfu.283.1658929377734;
        Wed, 27 Jul 2022 06:42:57 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id a31-20020a2ebe9f000000b0025df0dcdab6sm2997079ljr.8.2022.07.27.06.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 06:42:57 -0700 (PDT)
Message-ID: <51df865b-1684-77ad-1b64-51475ddd6144@linaro.org>
Date:   Wed, 27 Jul 2022 15:42:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: clock: gpio-gate-clock: Convert to
 json-schema
Content-Language: en-US
To:     Conor Dooley <conor.dooley@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Jyri Sarha <jsarha@ti.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220727131015.2073100-1-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220727131015.2073100-1-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/07/2022 15:10, Conor Dooley wrote:
> Convert the simple GPIO clock gate Device Tree binding to json-schema
> and fix-up references to this file in other text format bindings.
> Jyri Sarha is the file's only editor/author so they have been added as
> maintainer of the new yaml binding.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> The original file does not specifiy dual licensing, but when Geert did
> the gpio-mux-clock conversion the yaml binding was created with dual,
> so I have done the same thing here.
> ---
>  .../bindings/clock/gpio-gate-clock.txt        | 21 ----------
>  .../bindings/clock/gpio-gate-clock.yaml       | 42 +++++++++++++++++++


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
