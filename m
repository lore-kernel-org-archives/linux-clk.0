Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B293DC001DE
	for <linux-clk@archiver.kernel.org>; Thu, 10 Aug 2023 07:46:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbjHJHqQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Aug 2023 03:46:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232651AbjHJHqP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Aug 2023 03:46:15 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6783C3
        for <linux-clk@vger.kernel.org>; Thu, 10 Aug 2023 00:46:14 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-523b066d7ceso116663a12.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Aug 2023 00:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691653573; x=1692258373;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=19pO42zYtVAjIJUNvAKR95B6FHPWJULLL//o6iFt8Lw=;
        b=NT9iYuJadAEBUURMezxlAJABIJG7XHwHSsk4A4nByjjLXwTUWcI+/vhUd9ttXiLSUI
         3skPu8zUdkHMr+RlsoNvNmlxvhlVszbPgmozoVkInrFQJz1T2nQdHPXfdQfStNX4W2zc
         vEvkNPgd3BmmPvcbeyb7G/dV1djZsu33fa3QXMq3gcCUz8ywbp+wKuCXqAjPsaSXs65a
         xEm0YfhCCulxzeNH1T6wDayhUGvIOvHh6qQKKPec+i3ncPhP1kpa5jl7TOIT2ub1sZSH
         CWjC/r0ZnZY59BwkR4yjf9EDqQEN6HaiZNzRbdHueUBOHf21UeVmrtlY6OdP9HkPC2+l
         IS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691653573; x=1692258373;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=19pO42zYtVAjIJUNvAKR95B6FHPWJULLL//o6iFt8Lw=;
        b=PKnMNbWZpwG1G2MzBhrH8CJRujZ+KIMtYuW8ur34sku8+tah1Y1iziXOasr7XnJqfi
         Zu1k6XOjvb65cV83qSQxnjfLtOU9M58/6HNbsy2zF0LcMexzvh9zhLro7Ki2wbHZWkvj
         8O0cbOHwPUTqs/n77UezC8lxHVUhLtxN/urrLC53ygrfX3/8qvLFv98rfndqHmwYeNO5
         /j/7LMnAR3tyDQlbKopop0NKSP+f/9LUYkWIXDLNfH+CvfpxhlGO4g5OCL0c1e8M/vEA
         WtX1C7PCI4ToowOhhIMhxop0sMSi8IWzVoY29qKttAq+oEpYg4VG3uMgaeEEPkEH6bH3
         pa/w==
X-Gm-Message-State: AOJu0Yy6xDwVwXiaFsJyjx30dCUrwuHZoCXNCaKlAmTm9KO5D2imUZW2
        ih3Yrnr0JEpXZ15bhlwMaaq8aw==
X-Google-Smtp-Source: AGHT+IHxCguYXiIXhyg9LIXORLa+jUyQIhnuWBFeMuRAxNn6NP1VOhTge75PznDcNXFAiuucGcCHOg==
X-Received: by 2002:a17:907:7709:b0:99b:c949:5ef8 with SMTP id kw9-20020a170907770900b0099bc9495ef8mr1294530ejc.54.1691653573089;
        Thu, 10 Aug 2023 00:46:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id ke10-20020a17090798ea00b00982a352f078sm548321ejc.124.2023.08.10.00.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 00:46:12 -0700 (PDT)
Message-ID: <d2225b8a-a622-3936-1e43-d5a9801c2cd7@linaro.org>
Date:   Thu, 10 Aug 2023 09:46:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson: Convert axg-audio-clkc to
 YAML format
Content-Language: en-US
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Alexander Stein <alexander.stein@mailbox.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230808194811.113087-1-alexander.stein@mailbox.org>
 <1j5y5obt0u.fsf@starbuckisacylon.baylibre.com>
 <a48b1a97-2286-d2f9-742e-d718adcf1eed@linaro.org> <8294548.NyiUUSuA9g@kongar>
 <5c852193-9298-af2e-2b7d-dbba29768fec@linaro.org>
 <1jwmy39wfs.fsf@starbuckisacylon.baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1jwmy39wfs.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/08/2023 09:32, Jerome Brunet wrote:
>>>> Then why do you have this huge, apparently unnecessary, oneOf? If it's
>>>> the same, then drop the oneOf and make number of clocks fixed.
>>>
>>> But as far as I understand the number of clocks is not fixed. As Jerome pointed 
>>> out in the other post, it can have any combination of clocks and range from 1 
>>> up to 11, where 'pclk' is always 1st clock.
>>> I currently have no idea how to constraint that, despite limiting the number 
>>> of clock-names.
>>
>> The same as in all other clock controllers (was also present on my list
>> of useful patterns - Variable length arrays (per variant)):
>> https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L57
> 
> In the example provided, the number and list of clocks required by each
> controller variant is fixed, if I'm reading it correctly
> 
> Here the controller (regardless of the variant) accepts a maximum 29
> clock inputs. Only pclk is required. It is valid to have any of 28
> optional clocks at index 2, 3, etc ...

I actually doubt that it is optional. These are valid clock inputs. I
could imagine they are optional depending on the use-case, like some
block being turned off or on... but then still the clock is there, just
not actively used.

Aren't you now describing existing Linux driver?

> I guess the question is how do you recommend to model that ?
> I can think of 'Anyof' with all the optional clocks repeated 28 times
> but that would be fairly ugly.


Best regards,
Krzysztof

