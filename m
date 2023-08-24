Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3979C27C40
	for <linux-clk@archiver.kernel.org>; Thu, 24 Aug 2023 07:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240271AbjHXHFE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Aug 2023 03:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbjHXHEe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Aug 2023 03:04:34 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4439110F
        for <linux-clk@vger.kernel.org>; Thu, 24 Aug 2023 00:04:31 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99d937b83efso830530366b.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Aug 2023 00:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692860670; x=1693465470;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=epDel6TpPlgTi6sKB5gJ0l72hGnrt57/HnyL5WYVXDQ=;
        b=KunHaC32uuSn1ziqE8KkBJSfNk48n7Be1u2t8yEB5C4r7BpE9/tCow/xRQFLAg23Qj
         3b7kuORbbrgXKbEp3/NxQgls1lhJoLTMJJGw2d+A6jWaSDmtXAZjeAoC2IrAUDwIdaP7
         bT9MuOHBlHcWKQAW9sxKJMK7Hj1xw0+adGhJQH19cG/ubssUL2yPV0Kz1MLUOMvH0qvP
         jjQA0UmK8TnGH4whqUywmLDPI5SvJC2J0nvZmS++A0GcxmP9DM5/WYH7/pDAuLkEUs3X
         Ys9/1jvAiN1e5NN+EtU+tiDraomqHeBI0nUnAjJ5Q78PPDDgiJo7thwmKxiZuwXmfkeS
         zO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692860670; x=1693465470;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=epDel6TpPlgTi6sKB5gJ0l72hGnrt57/HnyL5WYVXDQ=;
        b=gIOUMYAtdH/i+5D6SwaIoCEWZb7cRIoUVZn3+knwP+22goYSWA81UhSnFeXY2tA/8f
         XRFG2VHkjq6dsRKSaWK3EgdsEyQXCKI/T70M1ojFC0lp4z55yb1o1qsh50WYSYPHywd2
         TJ9NDKhbguNl6fOsnHJZZX0W3/FkumeZaNCgwCleGu/fvzaChqHdbz7rqeRTGt2wF46q
         veS564BK3BDvStp8dMtPwl8fH06K16CXSsyjgyydPKmnQooy9qSocU54WvTaAf57WUS6
         kSKQJdTI2JkHL6/9vRxJJxyv/g03LFNZGj3dYJ4v1LS/2BYzyoVWN9QvW76e4GC0vvgK
         OKpw==
X-Gm-Message-State: AOJu0YxU8ukPJ66Q485eGpee73NnIPmkwpFa5xQEYHH1lwNIhYcKqB2Z
        OH4BKSI/ExKfQ9bs4aYJjVWy2Q==
X-Google-Smtp-Source: AGHT+IE6R8i7XgIiAOlH2YmrMpDPdKnhhvHKTIFGgOMKQWjbC1Id3mCTDOtL8JrM7L+8mawHUqjSCg==
X-Received: by 2002:a17:906:310d:b0:99b:ed53:5c12 with SMTP id 13-20020a170906310d00b0099bed535c12mr10628973ejx.17.1692860669780;
        Thu, 24 Aug 2023 00:04:29 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id lz16-20020a170906fb1000b0099297782aa9sm10416058ejb.49.2023.08.24.00.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 00:04:29 -0700 (PDT)
Message-ID: <9edcfc47-ed89-8074-6bde-d747ae73de25@linaro.org>
Date:   Thu, 24 Aug 2023 09:04:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/3] clk: twl: add clock driver for TWL6032
Content-Language: en-US
To:     Andreas Kemnade <andreas@kemnade.info>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     bcousson@baylibre.com, conor+dt@kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org, tony@atomide.com
References: <20230819134147.456060-1-andreas@kemnade.info>
 <20230819134147.456060-3-andreas@kemnade.info>
 <a65a7d976be4212ef71fe32c4ed2dacb.sboyd@kernel.org>
 <20230823165159.108875d0@aktux>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230823165159.108875d0@aktux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/08/2023 16:51, Andreas Kemnade wrote:
> On Tue, 22 Aug 2023 15:34:59 -0700
> Stephen Boyd <sboyd@kernel.org> wrote:
> 
>> Quoting Andreas Kemnade (2023-08-19 06:41:46)
>>> diff --git a/drivers/clk/clk-twl.c b/drivers/clk/clk-twl.c
>>> new file mode 100644
>>> index 0000000000000..deb5742393bac
>>> --- /dev/null
>>> +++ b/drivers/clk/clk-twl.c
> [...]
>>> +
>>> +static struct platform_driver twl_clks_driver = {
>>> +       .driver = {
>>> +               .name = "twl-clk",
>>> +               .of_match_table = twl_clks_of_match,
>>> +       },
>>> +       .probe = twl_clks_probe,
>>> +       .remove_new = twl_clks_remove,
>>> +};
>>> +
>>> +module_platform_driver(twl_clks_driver);
>>> +
>>> +MODULE_DESCRIPTION("Clock driver for TWL Series Devices");
>>> +MODULE_ALIAS("platform:twl-clk");  
>>
>> This alias is unnecessary?
>>
> The question is whether this driver should have a separate dt
> node (and if a separate node, then one per clock as the clk-palmas
> driver) or not. See Rob's review of the binding document.
> So we have basically #clock-cells = <1>; in the twl parent
> and a call to mfd_add_device() there in the former case and I guess
> that alias is needed then.
> 

You should not need the alias in any of these cases. platform alias for
platform driver means you have incomplete tables and use alias instead
of tables. Preference is to use tables.

Best regards,
Krzysztof

