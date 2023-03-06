Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF04BC61DA4
	for <linux-clk@archiver.kernel.org>; Mon,  6 Mar 2023 14:41:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbjCFOlJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Mar 2023 09:41:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjCFOlI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 09:41:08 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C5B623C46
        for <linux-clk@vger.kernel.org>; Mon,  6 Mar 2023 06:40:49 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id cy23so39368070edb.12
        for <linux-clk@vger.kernel.org>; Mon, 06 Mar 2023 06:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678113639;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h8/OqabBqWxSxxWh8IusQWHm+EO3XXKrX2gitUuiz1s=;
        b=fTpHWoLUn9LY5y6BovIzgpbDQEukouIZZtcXljfTxtjB5DuWyEnmGjN0KNId6o93cv
         dde0ILT+PnB4CdfKYCuiv7dxrNp6yMgsJEh8QO11LBwLgjh6a8GHOOdquzI/zdpmsmYw
         Fud5J0hdLfxH71OvAYwf10ckKy0W3HUcITN2dnLo/mFoAI7A5NmUfMG/QTbxSPnvHE3u
         DznN4JAsFrGx0S1nf7U0AVKE4HhoDTCNLldUDxEh1rd/GK6dvtWbyEkLfrAs3kU3t9ec
         sUlOXJY1jkgCXR9MWVoU9ukmvKad7LYmzrIrsfqGbUcP8o02QIWifR9Js08hzz7bzs6r
         J2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678113639;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h8/OqabBqWxSxxWh8IusQWHm+EO3XXKrX2gitUuiz1s=;
        b=zznHQYmJeHQiXXgm1Nt49errCV38G/+SMoN1Ej0p2QGf04dj1eikvfUte0G1aRkEP+
         zSIsycPy+qcMdJxSb9xlU3xM6aBYiuOWnkjqhjv/zNFLAVtLPbrCsCu839K/1jjCqwby
         3Rf6c1pq3ibEPkOk5mPPgr4StT+URlo4GSaOf6C6FO3Zk8ClPphBtWV1A0Rueoqyf9B8
         2hy3fhMdrKwzq8BQ0O9rE1ZrptV214Se4rxkcp7mnsnCDHNYjrvVU7MENir2uNQQ6Xor
         EP644z6x8eYzpOL/o+SyY59HDi7OdHKmWc8HTLXmgXnYaL9ZigTzsG7RTFPPfHMRkk/r
         Kx3Q==
X-Gm-Message-State: AO0yUKXA+xPvAcugy/3WD8dNoaHpNVIF6yXwv/WYsegFhqV/45BF4u62
        WujtHmhf3fgHisvaYEBEO4ITDA==
X-Google-Smtp-Source: AK7set+2ChOr3Kiru9i9Lzc6XjI6rDtWbCby2ejpVSHpx6Blm5Ch5m1fpl+Nl8mkBfZG3PzeaciUxg==
X-Received: by 2002:a05:6402:716:b0:4ab:554:37ea with SMTP id w22-20020a056402071600b004ab055437eamr9546782edx.4.1678113638798;
        Mon, 06 Mar 2023 06:40:38 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:c1e7:5006:98ac:f57? ([2a02:810d:15c0:828:c1e7:5006:98ac:f57])
        by smtp.gmail.com with ESMTPSA id j19-20020a508a93000000b004c3e3a6136dsm5191048edj.21.2023.03.06.06.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 06:40:38 -0800 (PST)
Message-ID: <f26c7ad2-a000-901e-d6d4-74c9ce1032cd@linaro.org>
Date:   Mon, 6 Mar 2023 15:40:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/6] clk: samsung: Remove np argument from
 samsung_clk_init()
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230223041938.22732-1-semen.protsenko@linaro.org>
 <20230223041938.22732-3-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230223041938.22732-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/02/2023 05:19, Sam Protsenko wrote:
> The code using `np' argument was removed from samsung_clk_init(). Remove
> that leftover parameter as well.
> 
> No functional change.
> 
> Fixes: d5e136a21b20 ("clk: samsung: Register clk provider only after registering its all clocks")

Fixes should come before any other patches, so backporting is
easier/possible.

I assume there is no dependency here with patch 1/6, so I just reversed
their order and applied.


> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>


Best regards,
Krzysztof

