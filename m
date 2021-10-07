Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4438FC433FE
	for <linux-clk@archiver.kernel.org>; Thu,  7 Oct 2021 13:07:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2581861090
	for <linux-clk@archiver.kernel.org>; Thu,  7 Oct 2021 13:07:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233114AbhJGNJn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Oct 2021 09:09:43 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:50604
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240998AbhJGNJm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Oct 2021 09:09:42 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0520840005
        for <linux-clk@vger.kernel.org>; Thu,  7 Oct 2021 13:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633612067;
        bh=FORzsUXne7M2qBjMCfFLm5GuHPWnU7ify0SwCg4gAzA=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=VoAXT2NkGH7omN1mbgVrrSFl52l83rF1rNv6TYxonlMixwxbgJHlEfEUe2GqebwB1
         hX0zRceU1wzMxmec+zik0wUoNIx6hSQ+O9bFDpHKotJQ+O5pcVXKTzA/rkQQ3RAOfq
         m6Bgy9a8YTh+79ckN3jOSrIKyENclye/8YHiieobdKbF0hU5j8poj66Zo/Sx7ECpXR
         cjW2G5FZGLeRrLdslWOxg3CM/kpdV5HtjqMMzwG/HtOTzk/zbUEmDa67LfOZNAYK6d
         P5uOsrtrz6PU1oaWYx1s+RIDGOIQBI9L55GzhDcpqt7+1k4wKq1yfwgBOXhlvKhwMx
         dNOb33tL3Zwsw==
Received: by mail-wr1-f72.google.com with SMTP id k2-20020adfc702000000b0016006b2da9bso4638289wrg.1
        for <linux-clk@vger.kernel.org>; Thu, 07 Oct 2021 06:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FORzsUXne7M2qBjMCfFLm5GuHPWnU7ify0SwCg4gAzA=;
        b=qUN21aFoE/Z3Y4+xvl+q273rI1l9PJUvA65FIr92BK82HQZ0K0q5X8qKFhnUAO2R9s
         PYj8J7iScslzGU2SzLnjwnzkCwMQurEYH0jUsvyBf01qapNoV63Yeo6po/CKNhIjhk7r
         K/QEDsw7VrjQwseW9MkWkZZiKYG1SE6djRFRkkZxoxwlW9sRZu03oKOZDgyHFJlRUlBG
         U7Zs02k1GDs4Az1Pp6thuE21OyzWfVDXQ7c6ee923ttw7jyE13r3WR6rDdGHAKvGY7iY
         InDK7Hhb8y9xOZ3z+BSWZ6v12ZnBSwitbfL2VoNBRvstni1faWzeZjbrrIzs1Lp9Rqvn
         OIUA==
X-Gm-Message-State: AOAM533iBfeoJE5u+Mm99203vHuGpoQUi9BihZRWNrfNob5JjlpB6H4P
        3bA2va/674hRxWBJ4ZTiM1Qee9Olx9V/cSHvbI5qiTzWNj4htgbpnc/YUUnWLeMPUulPfAERCrp
        eOhZOOJtBmzKdiebZH1nolxd0W5iZcpZ3ObYDDA==
X-Received: by 2002:adf:b355:: with SMTP id k21mr5428721wrd.380.1633612064188;
        Thu, 07 Oct 2021 06:07:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5pF3b8+6MeNpQSCXgOMr7rU57lLrOb+1ZGnujvyw0abYwmsBGvSJGW2lo9jvHE2DDTsCMuQ==
X-Received: by 2002:adf:b355:: with SMTP id k21mr5428054wrd.380.1633612059354;
        Thu, 07 Oct 2021 06:07:39 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id d2sm24198585wrc.32.2021.10.07.06.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 06:07:38 -0700 (PDT)
Subject: Re: [PATCH v3 10/10] dt-bindings: mfd: samsung,s5m8767: document buck
 and LDO supplies
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
References: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
 <20211006132324.76008-11-krzysztof.kozlowski@canonical.com>
 <CAPLW+4migQ+3NBsHgMd04N-Fc71CTzxoUMS3HN2S8377qFDa6g@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <25ecf19b-eb40-ada6-2469-b0c29820b498@canonical.com>
Date:   Thu, 7 Oct 2021 15:07:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4migQ+3NBsHgMd04N-Fc71CTzxoUMS3HN2S8377qFDa6g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/10/2021 22:02, Sam Protsenko wrote:
> On Wed, 6 Oct 2021 at 16:24, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Document the properties with regulator supplies for bucks and LDOs.  At
>> least one board uses it (Exynos5250 Arndale).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>  .../bindings/mfd/samsung,s5m8767.yaml         | 38 +++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
>> index b2529a48c890..12dea5aac8b6 100644
>> --- a/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
>> @@ -96,6 +96,44 @@ properties:
>>      description: |
>>        GPIO specifiers for three host gpio's used for dvs.
>>
>> +  vinb1-supply:
>> +    description: Power supply for buck1
>> +  vinb2-supply:
>> +    description: Power supply for buck1
> 
> Nitpick: all those vinb* are for buck1, or that's a typo (here and below)?

Copy paste and needs fixing. Thanks for checking.

> 
>> +  vinb3-supply:
>> +    description: Power supply for buck1
>> +  vinb4-supply:
>> +    description: Power supply for buck1
>> +  vinb5-supply:
>> +    description: Power supply for buck1
>> +  vinb6-supply:
>> +    description: Power supply for buck1
>> +  vinb7-supply:
>> +    description: Power supply for buck1
>> +  vinb8-supply:
>> +    description: Power supply for buck1
>> +  vinb9-supply:
>> +    description: Power supply for buck1
>> +

Best regards,
Krzysztof
