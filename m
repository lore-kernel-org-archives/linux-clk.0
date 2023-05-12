Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF18C7EE23
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 06:37:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240110AbjELGha (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 May 2023 02:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240105AbjELGh3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 May 2023 02:37:29 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA1FA24A
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 23:37:15 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-50bc570b4a3so17208005a12.1
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 23:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683873434; x=1686465434;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SKQArbr+xtf09epgIWVQVcaD67YWPhsZPgDsQF54Z/Y=;
        b=X2+gtVsUYPPuW7qdNKW5Y27uqHZ/RayroYk7RhEolPL+QdJq526rPdIj/Nn24VmYMM
         XGr2lAtGekbx/bx2h9MDx+nn5heWlUi2F1LtoWbz6abxpfDSY0XpWTmaw/O3hUFYEvLc
         1RSx5oYmYjazJkGlfhXGDE10S7gXfqbnDIcVmWQCJJfNLKqZO/rkZDJeksu7+B69h0rz
         Uqq3oZOuHuUDGXkQLZSP2hnTgqXLtav2r5KFd9i5/pHM3AA8yl2OR8bSSi0eIgGb2OMl
         pk314ZM8gMCnfor+NJGY/zmmgrVqI5kbP8/h8pGzQDHSoghB0VpB4MBMamrL3H00TZRG
         GliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683873434; x=1686465434;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SKQArbr+xtf09epgIWVQVcaD67YWPhsZPgDsQF54Z/Y=;
        b=jzQTtQovFtXlokaWNRjy02/9Np4TzaVoJCW0VWW80ieF+Fo1TGlMNN7Q6A6eYFJO7o
         rnZ9Yjgb6EM+HHkqQCBMFWR151BvHbIrzU0ljHGLp+/mHjf3JrxCcEQjqFGNVgTFru4U
         2orPmcjIeiQ8h4Ipq+S5accGUwb7lMtLAHD0MefZ38GeuGBPZ3UqkIEiQqVb9Ags+yMY
         VSwfKb0SuixxEi47hqrcmLv094UbyQuv1wxW8Tz7QBdjolJd8lk5trln3TGyIBtSfdF0
         kWK0+Kxm1sDXXeQa3llsiVm+AeKl887HX7Z1ZoCoisppYHXrPAxbiKr8+6oQ9bdnPTu2
         licA==
X-Gm-Message-State: AC+VfDzKBi5rbG4xLRMrZ+zAZ7X/qfci1xPYcfn96qTqjDIxf66YXu0Q
        lnYEU8Dd4WvpeKdFSlfxAN2bmg==
X-Google-Smtp-Source: ACHHUZ6Qir9jHw9lbKC6t++22DfOfrTK74YUqakGyuC6Q1hQEyqV2RCesGT5QfSt+aq1kGIfLATB2w==
X-Received: by 2002:a05:6402:1016:b0:50d:f9b1:6918 with SMTP id c22-20020a056402101600b0050df9b16918mr3020743edu.9.1683873433648;
        Thu, 11 May 2023 23:37:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id ca16-20020aa7cd70000000b0050bc9ffed66sm3740060edb.53.2023.05.11.23.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 23:37:13 -0700 (PDT)
Message-ID: <c432c26b-27d3-80dc-fe6b-457996234871@linaro.org>
Date:   Fri, 12 May 2023 08:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 7/7] riscv: dts: starfive: jh7110: Add PLL clock node
 and modify syscrg node
Content-Language: en-US
To:     Xingyu Wu <xingyu.wu@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-8-xingyu.wu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512022036.97987-8-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/05/2023 04:20, Xingyu Wu wrote:
> Add the PLL clock node for the Starfive JH7110 SoC and
> modify the SYSCRG node to add PLL clocks input.


> @@ -465,6 +469,12 @@ syscrg: clock-controller@13020000 {
>  		sys_syscon: syscon@13030000 {
>  			compatible = "starfive,jh7110-sys-syscon", "syscon", "simple-mfd";
>  			reg = <0x0 0x13030000 0x0 0x1000>;
> +
> +			pllclk: clock-controller {
> +				compatible = "starfive,jh7110-pll";
> +				clocks = <&osc>;
> +				#clock-cells = <1>;

This should be part of previous patch. You just added that node. Don't
add half of devices but entire device.

Best regards,
Krzysztof

