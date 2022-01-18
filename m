Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FCAC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jan 2022 18:34:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347952AbiARSeq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jan 2022 13:34:46 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:36506
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347872AbiARSee (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jan 2022 13:34:34 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 141C53FFDD
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 18:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642530873;
        bh=2sNtXURDOFY5YeHmaa+6rq6KkuL9DgoBnkrsKI2ksQ0=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=AvegWNprzGdxTR8Rufkkmbqm9b4UBJYgg4ICYSeXlyVNzehsflUzYG0C6LvxE3/t5
         HEIHFsvobPKmtKlFbHcWN3DZbWT2H99yRx8GXuHQLtbA1VTjAUWmIguYFZZ4N0wOLi
         GtgdpoLDXa5vcVUd8+ixUX2KcWskyXUbjyL3ExZrw7WqWpBIgzYfXffy/wq25c2CXk
         TRi1FIV88kjktmJBFmixGjy1eP5n+jI02ZucCEg6o4z1XqkXIvk4cTAXpeOqtxDog8
         71jRkiTIjxt7A5EBgrwcg83BgjPHC4jRmuQyMfkGdAtAfwf5myjczJwTfegOz0GZqz
         55S3g45yI4nzA==
Received: by mail-ed1-f72.google.com with SMTP id cf15-20020a0564020b8f00b0040284b671c6so6718306edb.22
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 10:34:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2sNtXURDOFY5YeHmaa+6rq6KkuL9DgoBnkrsKI2ksQ0=;
        b=2ur0ZLGKQ2w1YsJpiZxGaiWjPvTvEgc3Npl6Fze2pdg5Pj85jKqZ12/qwKgowA+Sjd
         LjOziVzB8rLBiYf4Y0VCwxBa81sEik3Zf9yIeHRN73RWqu6GROHOm5EspI/REfnDZpdV
         UA0XF3zxIZF1rIIVLlH/wPoeASvgMGNySaKoTUUoH3jhr5FHuWOdU1BeDBzEaaF5kIUq
         Kpiyz3v2V3VFZlferkADY1A7U6nxUXG6fobY6m/9+gK7Tu3tshJrwviM0xge/HOHTtdF
         Lgz+LWFLwJ2sptbUVKcBchEftsmmBHXkyo/UiUig3MyCj7EWmPOhYO3Utnvc8GeUhEig
         uO7A==
X-Gm-Message-State: AOAM532u9AaK5GWYMZ8c/Hg7NTv3UF4xp11hOp2Yx6dhtCcccqpsw82V
        xEovygU87rcsTQnUEXxYR76ypD0C2pXK1IhLlfaf0QBy7/YApaUo/MYvXbkOjwcwRRLTnNZVuDY
        Acbq0hlJTu8i8DA6shB7IKr0unuaj9cWjURl3MA==
X-Received: by 2002:a50:d69e:: with SMTP id r30mr1416871edi.284.1642530872196;
        Tue, 18 Jan 2022 10:34:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFfk4qysqwQQ+JBGYnqeMFUI+XaHpezXkBv6eaAh0acQ0crMg2NxWfal3ZD4TuQozsNPJjAA==
X-Received: by 2002:a50:d69e:: with SMTP id r30mr1416854edi.284.1642530872062;
        Tue, 18 Jan 2022 10:34:32 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id l10sm5590235ejh.102.2022.01.18.10.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:34:31 -0800 (PST)
Message-ID: <3c400f9f-9d02-050e-cf21-c3376bf15127@canonical.com>
Date:   Tue, 18 Jan 2022 19:34:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 06/16] clk: samsung: fsd: Add cmu_fsys0 clock
 information
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, Shradha Todi <shradha.t@samsung.com>,
        Jayati Sahu <jayati.sahu@samsung.com>,
        Ajay Kumar <ajaykumar.rs@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150037epcas5p1624361eb48fa14cdf9ed88de6f890db4@epcas5p1.samsung.com>
 <20220118144851.69537-7-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-7-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/01/2022 15:48, Alim Akhtar wrote:
> CMU_FSYS0 block has IPs like UFS, EQOS, PCIe etc, lets add
> the related clock information for the same.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> Signed-off-by: Jayati Sahu <jayati.sahu@samsung.com>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-fsd.c | 302 ++++++++++++++++++++++++++++++++++
>  1 file changed, 302 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
