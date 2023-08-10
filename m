Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A973C001B0
	for <linux-clk@archiver.kernel.org>; Thu, 10 Aug 2023 06:12:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233395AbjHJGL5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Aug 2023 02:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233386AbjHJGL4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Aug 2023 02:11:56 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06F310FE
        for <linux-clk@vger.kernel.org>; Wed,  9 Aug 2023 23:11:55 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fe501e0b4cso4657195e9.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Aug 2023 23:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691647914; x=1692252714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N48Tz5uXzvaHN9/qN3JfX8I4/w7VgPsbV3qQP+qe1tQ=;
        b=NiaZ9rdNmufbECzZZ87B+yprLA3NRl/R2PzxygOJHcFGcy2WzIj3IcU4zInyho5e0/
         c854lCFAyfPNxCY0Kt5FZOaF5CygOipP27pHXY3POE5Rm1jg3DB0Bqi7I/qk4L5DGk0r
         QU/3x7skzZ4VIhjfIyqoLo+doKDiCpB9RlVfMj/pdUNerajvb6RuUoYpiThmHfBMiXtO
         Eva5Zktvomy1Y3u1V2miFUaFd9j4gIqSLHPm/2D7A9tToV3ioY2wJACouLNeVZ2DZ9gJ
         OjCSNhpc4rkqitywFihe7PizS9deLQVVoSO4A0oEdM4cU8Wb4KQx/zFCoVGYrqLn2BP4
         nfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691647914; x=1692252714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N48Tz5uXzvaHN9/qN3JfX8I4/w7VgPsbV3qQP+qe1tQ=;
        b=YJTuSKffVwFTKb5FtkwRFsra+bE3QToojZbzTG8eXgtGaPYaWwsLaBNlqj0ldnTos+
         Rv0LoG81H0cG4fBpeReuCTs4L5GzobimfpHwEu8Ea4uo7N2aCkS7DvhwQIugridfZoS+
         OmQAdl3Bnb8L1L9LwCg06wnvPzqUd945DGSThUMAscWd0ydoyc1xMWDC6uVXdtO6wOSJ
         ubtCF79bAe12s8FgptxWsqiFj4VfEJHH1zjf+mavy+/wHo+tTFO5lx9WA4o4+dpHRTeI
         zFIOFhzcNylYlUB/S/hwP2DTbw/r77PjZDLoPE/TelxxR4GDdPtyNI1obQaacyb1jIOK
         vpOQ==
X-Gm-Message-State: AOJu0YzCVECJJe7dayq4Gq6v9HUo1ZzoRk6peSyMssiaySzbC4FDd70I
        TqqplK8cNlxksbHBGCCkj/QSXg==
X-Google-Smtp-Source: AGHT+IEBBWdm106nH7ySkZ0gAbbGmz1kcDFv16EgML6LFboSZyVkgvF7ZYZlHBKZKyVm845g2SGOUg==
X-Received: by 2002:a05:6000:12ce:b0:317:15f5:a1ca with SMTP id l14-20020a05600012ce00b0031715f5a1camr1282078wrx.10.1691647914293;
        Wed, 09 Aug 2023 23:11:54 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id y7-20020a5d6147000000b00317e77106dbsm967610wrt.48.2023.08.09.23.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 23:11:53 -0700 (PDT)
Message-ID: <5c852193-9298-af2e-2b7d-dbba29768fec@linaro.org>
Date:   Thu, 10 Aug 2023 08:11:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson: Convert axg-audio-clkc to
 YAML format
Content-Language: en-US
To:     Alexander Stein <alexander.stein@mailbox.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8294548.NyiUUSuA9g@kongar>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/08/2023 20:44, Alexander Stein wrote:
> Hi,
> 
> Am Mittwoch, 9. August 2023, 15:02:23 CEST schrieb Krzysztof Kozlowski:
>> On 09/08/2023 08:58, Jerome Brunet wrote:
>>>>> +      required:
>>>>> +        - '#reset-cells'
>>>>
>>>> else:
>>>>   properties:
>>>>     '#reset-cells': false
>>>> ???
>>>>
>>>>
>>>> You need to constrain the clocks per variant. Probably names are also
>>>> specific to each one, so the list of names can be moved here and you
>>>> keep just min/maxItems in the top level property.
>>>>
>>>
>>> input clock names and constraints are the same for all 3 variants.
>>
>> Then why do you have this huge, apparently unnecessary, oneOf? If it's
>> the same, then drop the oneOf and make number of clocks fixed.
> 
> But as far as I understand the number of clocks is not fixed. As Jerome pointed 
> out in the other post, it can have any combination of clocks and range from 1 
> up to 11, where 'pclk' is always 1st clock.
> I currently have no idea how to constraint that, despite limiting the number 
> of clock-names.

The same as in all other clock controllers (was also present on my list
of useful patterns - Variable length arrays (per variant)):
https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L57

Best regards,
Krzysztof

