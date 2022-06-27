Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E21C43334
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jun 2022 11:34:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235805AbiF0LeT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jun 2022 07:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236345AbiF0Ldk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 07:33:40 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75207DEB9
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 04:30:59 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id g26so18480941ejb.5
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 04:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=l3ShECmhHBYGtTaNrFh8O7lxelsTpiudcEC3xdylX/o=;
        b=WG2zDq3HZTzjze3fkNGpZfPEgvmcUtHem+gHJYjTO0HPeF4CD44nnkEuFvvCywvYqp
         ywzkxVoh8JcH5fPkpgVweha1HGaZA0CFPnLZvf+Wrz/HWMij5gJV9OqKQ/HzcL3kXizt
         cdem3MiT4P03vfxMWkkN8hId/4oyFwf4SkzZY57uUYj4Vnp3C9uDNNaOCVT+RXc/pC7/
         NHm5F77NS/bNifp61dq/7p5cVlvfxhs3x0Tq4Z0AiBXgOSCk/AKcgf/60M0XL6PChFEf
         05hG4QrYDKxZHZJNVZuu85kIyPCszfyt+eoCea0TGsBqHRage2Eab1AqaFFulCkrWeLX
         kcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=l3ShECmhHBYGtTaNrFh8O7lxelsTpiudcEC3xdylX/o=;
        b=3XILOxXmBAjBY7TUKaSCk7C7vghRDzT+e4OXy48gceOl1KpaBcA5pGWZE0FvuCJfAZ
         H3lkeXnLlXl2E6LGUlfYfJ0swmnwu2NHFemGdaz5YQX1mr2JOjjOMY8JLb5tfOYWEJ2n
         cQdpMGs8y67oMUlDU6rpdEBryLCfw8LGUt2a9ie2neFCxS/BSWi6jlhxtom1gEu7VOv7
         /a/C/fEYbTOwHhM/PjBDdwAqCvdTE8j5fhOOMaJm/GYIKdLik1Fbv6Qzl3B1wiSui+Ka
         YH4Y7KCO34mKDw94i1mv042kssKdxJ2WTuiK2Fk155vnFcCoDcm4tmwkrkxPXLm1ywRE
         Stmw==
X-Gm-Message-State: AJIora8h5i96kiDKaQu3/wr/UrhNSWyRurVybItiOqVippvuYePqA0OC
        N/bU8Zhu8X2Gf+XO8Rl7hHNflg==
X-Google-Smtp-Source: AGRyM1tS8F9/rptbLxOmuVEwJVg2EzfiYgzVz7ce4tu0rkW1+TrZ16suB/FnT+SU4tQ9fOBTUVGd2Q==
X-Received: by 2002:a17:907:6294:b0:6e1:ea4:74a3 with SMTP id nd20-20020a170907629400b006e10ea474a3mr12573216ejc.168.1656329458079;
        Mon, 27 Jun 2022 04:30:58 -0700 (PDT)
Received: from [192.168.0.249] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a27-20020a170906275b00b00722e57fa051sm4886163ejd.90.2022.06.27.04.30.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 04:30:57 -0700 (PDT)
Message-ID: <6d7b0ea7-7918-aea4-6f2f-46d4870d92ad@linaro.org>
Date:   Mon, 27 Jun 2022 13:30:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] clk: samsung: exynosautov9: add missing gate clks for
 peric0/c1
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220627005210.6473-1-chanho61.park@samsung.com>
 <CGME20220627005413epcas2p37d6b3cbea055cecade47ad304b40b7e3@epcas2p3.samsung.com>
 <20220627005210.6473-3-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220627005210.6473-3-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/06/2022 02:52, Chanho Park wrote:
> "gout_peric0_pclk_1" and "gout_peric1_pclk_1" should be added to peric0
> and peric1 respectively.

Where is exactly the bug? The commit msg suggests that they were added
to different block, but there is no code removal.

> 
> Fixes: f2dd366992d0 ("clk: samsung: exynosautov9: add cmu_peric0 clock support")
> Fixes: b35f27fe73d8 ("clk: samsung: exynosautov9: add cmu_peric1 clock support")
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynosautov9.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Best regards,
Krzysztof
