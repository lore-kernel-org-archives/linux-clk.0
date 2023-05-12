Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D877C77B7F
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 07:22:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239958AbjELHWq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 May 2023 03:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231315AbjELHWp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 May 2023 03:22:45 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F251710F5
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 00:22:43 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-94f4b911570so1518029866b.0
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 00:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683876162; x=1686468162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2/aA9jsvMbpCOcwE4/U6yU5Ge888LhQRk+VU/TYiZuA=;
        b=ewIWYIPJ8NTOphY0GZu6ffx9FkoFeva5FYwZc7xleZNadJ3RtRWP4OIeBvPanFW9o9
         02AqkiutjULhqvpof3ywrhMZL0A6xlgd4tWElwu5GVmaBYLbkt30VZ2hOe1ZqxM6PZyu
         jNzYQKg8tTCxC7hSjp64kgjVcTLlKmKB7egs7a6wcrW8mP1dI8rgvPK8GWzXkXqcQLxH
         JbKlNiBCPzMdpCHnqMBoiGtCszsOXjT4vS6stbyvd7BtgQdTMayk0GuTnrwh3kJswg8h
         hM/One6Zuc/QUFJk8taEpmR8EIndNsrQaAxnIwq0JADW6YSJH1UGutk1n13Dc2L2bm37
         K0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683876162; x=1686468162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/aA9jsvMbpCOcwE4/U6yU5Ge888LhQRk+VU/TYiZuA=;
        b=k42YwYGcZfdtsaHAMhz60VYLIgjQkgX8Tf3RejTPexR6nmWGaaWcefkloeVzDUTM4r
         BjgEOL6Nz9SmCBaw5db7KtB0Od4FthrEGOlnTHb54MKHlOZcyYe6MR6Adl73LJcScDJp
         TYsv1vyWSb/z7tFLig5A7hEJ80J7eWo/17abHQYGR/vtHm11CBt8RO2izVz84G+OColY
         M+5N1ZiYElEdSuWf6+qH86SLW/R/GDiWKbEsz1CtGpZjIhYqfARtc9/47cCnfAX5GD1h
         f/XDizUYwS91T2NxgEQwRbyRI8/9J4w4uT6zJoiwmUpEaUESVTvAI8vU1tO/9qO24NPB
         6jsQ==
X-Gm-Message-State: AC+VfDzp/juMN6hvXzP7JAbi8+XUQqP5Glu4+7xi6dCCDPEVk4lNnagJ
        6MD3DeKu65k5yYJqdHOl9Ta4Ng==
X-Google-Smtp-Source: ACHHUZ5u/Ss9b/bDnf30cMr1Nmq4PVgDVeqifi4CE7DHWwxByGSpw/29SsjXdeKlZd4l1OONhLjuyQ==
X-Received: by 2002:a17:907:26c1:b0:94a:6071:d613 with SMTP id bp1-20020a17090726c100b0094a6071d613mr20353616ejc.64.1683876162474;
        Fri, 12 May 2023 00:22:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id gz20-20020a170907a05400b0095342bfb701sm5115319ejc.16.2023.05.12.00.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 00:22:41 -0700 (PDT)
Message-ID: <72c8f49e-ad3e-9241-f2dc-cd523ea19d14@linaro.org>
Date:   Fri, 12 May 2023 09:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 7/7] riscv: dts: starfive: jh7110: Add PLL clock node
 and modify syscrg node
Content-Language: en-US
To:     Xingyu Wu <xingyu.wu@starfivetech.com>,
        Conor Dooley <conor@kernel.org>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-8-xingyu.wu@starfivetech.com>
 <c432c26b-27d3-80dc-fe6b-457996234871@linaro.org>
 <0463378b-60d8-ee05-2a2e-1e709b882bae@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0463378b-60d8-ee05-2a2e-1e709b882bae@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/05/2023 09:15, Xingyu Wu wrote:
> On 2023/5/12 14:37, Krzysztof Kozlowski wrote:
>> On 12/05/2023 04:20, Xingyu Wu wrote:
>>> Add the PLL clock node for the Starfive JH7110 SoC and
>>> modify the SYSCRG node to add PLL clocks input.
>>
>>
>>> @@ -465,6 +469,12 @@ syscrg: clock-controller@13020000 {
>>>  		sys_syscon: syscon@13030000 {
>>>  			compatible = "starfive,jh7110-sys-syscon", "syscon", "simple-mfd";
>>>  			reg = <0x0 0x13030000 0x0 0x1000>;
>>> +
>>> +			pllclk: clock-controller {
>>> +				compatible = "starfive,jh7110-pll";
>>> +				clocks = <&osc>;
>>> +				#clock-cells = <1>;
>>
>> This should be part of previous patch. You just added that node. Don't
>> add half of devices but entire device.
>>
> 
> So do I merge the patch 6 and patch 7 into one patch and add syscon and
> clock-controller together?

I am okay with adding users of clocks in separate patch, but the clock
controller - so part of SYS - should be added when adding SYS.

Best regards,
Krzysztof

