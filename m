Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A955CE95A8E
	for <linux-clk@archiver.kernel.org>; Mon,  9 Oct 2023 12:01:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346437AbjJIMBP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Oct 2023 08:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346415AbjJIMBL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Oct 2023 08:01:11 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B1BCA
        for <linux-clk@vger.kernel.org>; Mon,  9 Oct 2023 05:01:07 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32003aae100so3323147f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Oct 2023 05:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696852866; x=1697457666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1dQhgAOJRNqoOh1Ien+h0xhg7sd11cwuiObrfM0AE80=;
        b=xRHRdrOBS7i3FSEfOc0nQZDmpxypTmFqSxHK4neDlGWtXksaLgdUcZ0iXazzFx+JUg
         VZwo/2sqGbE53guSpgOzTC/9PHsw/O9CTev4niZU6T9ja78osZMZog5zbH0nSxP/9209
         54gtl3pmcpEyCwakaQbjf4RuES2Mvi0KR7oVrWhMjyGPNn2K79AV8kmDaWjVp8m8/4bb
         gMtSpOoMvH/9C9Nk6U0t0lf/z0U0hLYaVT/pUXok0rWWJuR5AIkG17oQ1FjxqvwTCIkE
         kv658P3oxVN9Mfh1NVp+U+C81bxT5/bWJDHBcp7dN9stHjrq5zEYLGgbWwJ+aSFfSTGK
         7hIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696852866; x=1697457666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1dQhgAOJRNqoOh1Ien+h0xhg7sd11cwuiObrfM0AE80=;
        b=wDMJtW2cm4S6R8KAnXBwzeeOqgPgyALjEaBKNJRyraNlrIIkp/2TnDTq5N9xyhsRx5
         2Z4gQiuq6cqf4mjzsc2B1WXpK0/mLqdWY6a8hty6IVFJxFI26NKPlPCZypg3CmiguMwZ
         1SzTWjvSGsJVEHK+9oTXYK3Umcnbd3m9fVuFYJR4j1WIgd3VzZCmQh1mXeF4kM1VPnRi
         1P5oe772DyxCctUorKI81P2kTn3qVnzozZaAv0hIXGx0s5eGaV1pzrTSaDxREPBS9JYK
         uWHYe70Vtk7M9RpeorJFa3esUbGTHzFSLEtcjBp88xq4O3YaegOM8QW0XyiwRMGXEFXD
         SdBg==
X-Gm-Message-State: AOJu0YzAxQNnL5n5/V5ZzMYvKbUFOHkZL6Ck00dD19i1KvSAo38FT3Aq
        DaILBRYlOwJASlJr1DjG5nJyLw==
X-Google-Smtp-Source: AGHT+IH7e7GhrAvk0ajA9tZ0NEiTbxzb/d1XRPhB3D/cod7tcEkZk77rF0aFAvoTRaN60f7E0kWhBw==
X-Received: by 2002:a5d:658e:0:b0:329:6b53:2c82 with SMTP id q14-20020a5d658e000000b003296b532c82mr7129118wru.31.1696852864934;
        Mon, 09 Oct 2023 05:01:04 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.123])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d6b0b000000b00324853fc8adsm9384768wrw.104.2023.10.09.05.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 05:01:04 -0700 (PDT)
Message-ID: <5c2442e7-8e03-433e-9b6e-bc9aa6881cd3@linaro.org>
Date:   Mon, 9 Oct 2023 13:01:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/21] arm64: dts: google: Add initial Google gs101 SoC
 support
Content-Language: en-US
To:     Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com
Cc:     andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-19-peter.griffin@linaro.org>
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231005155618.700312-19-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi, Peter,

On 10/5/23 16:56, Peter Griffin wrote:

> +	serial_0: serial@10a00000 {
> +		compatible = "samsung,exynos850-uart";

This deserves a SoC specific compatible so that any further quirks or
incompatibilities can be easily addressed.

Cheers,
ta
