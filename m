Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1A8C64ED6
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 08:18:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjB0ISx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 03:18:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbjB0ISv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 03:18:51 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75892C152
        for <linux-clk@vger.kernel.org>; Mon, 27 Feb 2023 00:18:49 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id bt28so5222835wrb.8
        for <linux-clk@vger.kernel.org>; Mon, 27 Feb 2023 00:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bsW3cnQpkFobawAQ7KjeQDh+HS+MtSdRuN5mmJGO6qY=;
        b=AvK6jRRFSOt+n1ffk6vJiwQQbHRxm6AsUV4wS/6KkGBvs66zYKTlWus5yEfviTpYj6
         kJZmRRJHnVEhrYd6U5vOfL2OeeA6L8yxahgkOTypIndNySrIRwma+cFKU4gdmqzHhtba
         AQcZ53uLv8cR3wDcLmBxCw5q0AtqAd0sCWemgcLoCq4qw8Cw0mUwx5Gy9pampSN+hYwC
         KIErNwb/4X4n3mqxYKRlJBiKDTV9UAJu4J8qi0WnWHk1FBcdWeNCBk+UP1Wepv8rjP0A
         EYJlb3YLIayqD4oRkMCTU9DAcFg1tIWEZ9aLHKyexcBQNMxSW3WJEy8yrn+8KO2GG5Ig
         mpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bsW3cnQpkFobawAQ7KjeQDh+HS+MtSdRuN5mmJGO6qY=;
        b=UdVemFr0bgddS/wjepYkdwkYmnVVuMDB+nNeMPRfGKvPVM60AVKMLUdvm5GWRAj5H/
         sF0XdPn5/VVBT1uPqE/T1jfSHRv2zSRUrU44u2uqciCxOL6glEKFDZb6ctFzJ1YShd3B
         dsnLz2Juia4hQ+1XhreYiitooEXqGFT1VQdj2AeAUaa6/kTqTlE6AGF0KW/IsdmubGt6
         1DkzG1fUSsF+l2eiyo0bcN1xw6+GnrHOjP6HrvsuHG2cRMPmxTJmbtWh9ZLhc55mGcdK
         +cpPP+SkweC7v8/t4ZLww3U+ru15lh1UwnHEgae9/tqT9zUz+yTSWFZruxn91rCbwPAg
         HF8Q==
X-Gm-Message-State: AO0yUKXwjztQEYAE1RS7WvBn5KnUkf/BGe2yx3B9vLE4HbB5VXxbByf2
        RHTgGiUE/gEMSyaeSbtZB4QUoQ==
X-Google-Smtp-Source: AK7set8ztKjRC0ujf94Tndq6Vka4BGloWzDiY0mYTjekowUIvGqF2ZicFqfLVVh6E3awOAZNvHwYrQ==
X-Received: by 2002:a5d:6d0b:0:b0:2c5:68a9:843f with SMTP id e11-20020a5d6d0b000000b002c568a9843fmr6963601wrq.4.1677485927974;
        Mon, 27 Feb 2023 00:18:47 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i12-20020adfefcc000000b002c54f4d0f71sm6314277wrp.38.2023.02.27.00.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 00:18:47 -0800 (PST)
Message-ID: <52d479ff-14c6-b65d-952b-e7753fee2dea@linaro.org>
Date:   Mon, 27 Feb 2023 09:18:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: Add MediaTek MT6735 clock
 bindings
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Golle <daniel@makrotopia.org>,
        Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Edward-JW Yang <edward-jw.yang@mediatek.com>,
        Johnson Wang <johnson.wang@mediatek.com>,
        Fabien Parent <fparent@baylibre.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
References: <20230225094246.261697-1-y.oudjana@protonmail.com>
 <20230225094246.261697-2-y.oudjana@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230225094246.261697-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/02/2023 10:42, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add clock definitions for the main clock controllers of MT6735 (apmixedsys,
> topckgen, infracfg and pericfg).
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  MAINTAINERS                                   | 10 +++
>  .../clock/mediatek,mt6735-apmixedsys.h        | 16 ++++
>  .../clock/mediatek,mt6735-infracfg.h          | 25 ++++++
>  .../clock/mediatek,mt6735-pericfg.h           | 37 +++++++++
>  .../clock/mediatek,mt6735-topckgen.h          | 79 +++++++++++++++++++
>  5 files changed, 167 insertions(+)

You should squash it with other part of binding. What is the reason
behind splitting one binding into three patches?

Best regards,
Krzysztof

