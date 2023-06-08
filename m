Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458C8C7EE25
	for <linux-clk@archiver.kernel.org>; Thu,  8 Jun 2023 09:00:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234806AbjFHI7o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jun 2023 04:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234429AbjFHI7n (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jun 2023 04:59:43 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 508C11984
        for <linux-clk@vger.kernel.org>; Thu,  8 Jun 2023 01:59:41 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f738f579ceso1909005e9.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Jun 2023 01:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686214780; x=1688806780;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=HtzbVfqW0SjuZKyPfBVRRJzNRxgu1Q7jWMIx+yfKlSY=;
        b=OwUHzZAfyLsLDi5eRkoShFrB0mdzg2SB/HuM0M9zJVRq1drRtWiHfoQVh7n7y9NpCW
         YOZTGpPhEoS6adlGyclhA5D9QlDJFO0wUFGVEd/exvjOuXJHjPzLDUGMDqRUTixOR4o2
         W6Cf3K6MbNOMKJdDEz48SxlnakQFHbbJF/eDuIunt9jAsTNIBResuP3RVw9Qu1oflCUD
         9d1cHXYHqK2x3oZUtoLqm8ElvlwvvW1D9qnKjprrpvxKerSxrqCbr6QHkYc3IF1cx3cZ
         sFhxK1Y1nLNGXORpNpG23ZEe3e27apENyuu0cMFc3VJY+7Qq4ezwC+S8eom3sLQR7Chw
         ZNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686214780; x=1688806780;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtzbVfqW0SjuZKyPfBVRRJzNRxgu1Q7jWMIx+yfKlSY=;
        b=VBUw2Ay0egGVz+FplTQsnArPolJeJZhVqU6/zkbIyACG/m+BnG57d/YvLeGBjH5a0H
         eCtV0tCmucn6ko2UPz/Xo0W+GqFCDkYErkJt3nwbqIlMXpJI4ChUoqbcubWqEq6Fxhx8
         JK9/shOb+q9usYLRPWHT93439B6zVBr8RDp7Ky3VjK9DNUumUZXdOLyPo84Wkvkw2sTv
         1oi4u1Y33rBNmj+PIZ0oZCkjcxfWlzHfl3Wdn1YKGwZ/htHM3gKen5lEpxrGLix7AjVf
         0n3BJEhrkFSQeYfglMgm/6TdzT1HaEPja9c9DkFdihosEtgynAWIxCDfuaSMGRmWc+9G
         Frfw==
X-Gm-Message-State: AC+VfDxzqcUDa4+FZziWO7cVMcN/Ox6W5cekm5CikiEDfunjUGFcW57W
        oIDtCRJuMh5wcQKIkWC5v6xQzQ==
X-Google-Smtp-Source: ACHHUZ7AJ6r0vLW9SSK7hlu7p9NSBYgD9rpD8nNz7jKun8PAWYhsC9D2tlLPOuzTNzAhNm/64JH+7w==
X-Received: by 2002:adf:e6c8:0:b0:30a:e161:86c6 with SMTP id y8-20020adfe6c8000000b0030ae16186c6mr6060111wrm.51.1686214779694;
        Thu, 08 Jun 2023 01:59:39 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c1-20020a5d5281000000b0030aded83385sm955693wrv.27.2023.06.08.01.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 01:59:39 -0700 (PDT)
References: <20230517070215.28463-1-yu.tu@amlogic.com>
 <20230517070215.28463-4-yu.tu@amlogic.com>
 <1j5y804q7u.fsf@starbuckisacylon.baylibre.com>
 <73acf297-3f60-1ce1-2f05-af048aa37199@amlogic.com>
User-agent: mu4e 1.8.13; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     kelvin.zhang@amlogic.com, qi.duan@amlogic.com
Subject: Re: [PATCH V9 3/4] clk: meson: S4: add support for Amlogic S4 SoC
 PLL clock driver
Date:   Thu, 08 Jun 2023 10:53:31 +0200
In-reply-to: <73acf297-3f60-1ce1-2f05-af048aa37199@amlogic.com>
Message-ID: <1jttvi9vnq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


>>> +
>>> +static struct clk_regmap s4_fclk_div4 = {
>>> +     .data = &(struct clk_regmap_gate_data){
>>> +             .offset = ANACTRL_FIXPLL_CTRL1,
>>> +             .bit_idx = 21,
>>> +     },
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "fclk_div4",
>>> +             /*
>>> +              * For more information, please refer to s4_fixed_pll_dco.
>>> +              */
>> While div2 and div3 got an explanation from previous SoCs, they others -
>> like div4/div7/etc ... - have been able to cope with rw ops so far.
>> Why is the S4 different for all these clocks ?
>
> The chip was changed fixed pll for security reasons.
>
> Fixed PLL registers are not writable in the kernel phase. Write of fixed
> PLL-related register will cause the system to crash.
>

That is definitely worth mentionning

>> Requiring RO ops (or fishy clock flags) is usually a sign that a clock
>> is used without an appropriate driver.
>>

Neil is currently dealing with the dt-bindings, please
* Adjust your patchset accordingly
* Wait for his v2 to land, you'll need it.

>>> +             .ops = &clk_regmap_gate_ro_ops,
>>> +             .parent_hws = (const struct clk_hw *[]) {
>>> +                     &s4_fclk_div4_div.hw
>>> +             },
>>> +             .num_parents = 1,
>>> +     },
>>> +};
>>> +
