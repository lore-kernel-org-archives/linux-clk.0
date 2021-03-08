Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1615C433DB
	for <linux-clk@archiver.kernel.org>; Mon,  8 Mar 2021 20:03:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F14165260
	for <linux-clk@archiver.kernel.org>; Mon,  8 Mar 2021 20:03:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbhCHUDB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Mar 2021 15:03:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbhCHUCd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Mar 2021 15:02:33 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB12C061760
        for <linux-clk@vger.kernel.org>; Mon,  8 Mar 2021 12:02:32 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id b7so16574841edz.8
        for <linux-clk@vger.kernel.org>; Mon, 08 Mar 2021 12:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3t+/FGTFmIQyffd5lnhNae0bF0FU3qV628NjTAJ6fqE=;
        b=gfrGxsctj7ZgdCnjBxZzvzOU616fh/vzNa6UCLMa0GN0zjbz5QSFtF6qTKVMimAaoI
         QhKxVI51bWGOap7MLvgcUlqAIi4le1i+TDXZDDSs1NALQfBw6biPjSEzE79xNFPda7fe
         IQYUh3fImXPDcH/e/yq2x1VfZ0L0zDngwciu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3t+/FGTFmIQyffd5lnhNae0bF0FU3qV628NjTAJ6fqE=;
        b=Hi2Fg2L7mTu56XeHmQKctHknEGgQ3058HcsgapsomyT/RKKw5DRT9Gp5BLE/niQUce
         KTWQiR3DqgMU+1FcbO5ZodPj2vZc+oJd2PzZP3OuyvBhtPHHc/xMYMo5ibLraERev659
         t3weMyEznX4HMRQzJciEIL1efAbrM2c5nRqsnMHKQ1G7bj1Lnzfa1DDauLsqjnCaoaQS
         oQhMQi5oWYTGlwQrVr9sYO7pPOGLQTfBRcT1h1UrteiEXhIV5dZbGMkjSv2dmkipLSxC
         V25ol+EunTNyUoQKoarWX1iAmUtHviSS2yAv9GDlJTcosIhpFFDrCjfDo6/njVplJcMA
         rNHg==
X-Gm-Message-State: AOAM530zdRAY0/H6iAbq3uY1G1LfFZxBtsBE2jxz7OTZ1QuF0TwWOv/O
        bBZ3urFZvgraYJqt2KuzNjv9gA==
X-Google-Smtp-Source: ABdhPJz/N2WXkp/XWbteDUOpmfs9kTJ7J7qctEPtW6OeYiZrs1L3DFi1SC7Cg9aRy5AoqQKH3np2jA==
X-Received: by 2002:a05:6402:b2d:: with SMTP id bo13mr292159edb.120.1615233751171;
        Mon, 08 Mar 2021 12:02:31 -0800 (PST)
Received: from [192.168.1.149] ([80.208.71.141])
        by smtp.gmail.com with ESMTPSA id jj16sm7158657ejc.19.2021.03.08.12.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 12:02:30 -0800 (PST)
Subject: Re: [PATCH 1/2] dt-bindings: misc: add binding for generic ripple
 counter
To:     Rob Herring <robh@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-clk@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
References: <20210226141411.2517368-1-linux@rasmusvillemoes.dk>
 <20210226141411.2517368-2-linux@rasmusvillemoes.dk>
 <20210308172153.GA2505339@robh.at.kernel.org>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <12be138b-631a-4f82-aae9-6bbdc7bc2bcf@rasmusvillemoes.dk>
Date:   Mon, 8 Mar 2021 21:02:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210308172153.GA2505339@robh.at.kernel.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/03/2021 18.21, Rob Herring wrote:
> On Fri, Feb 26, 2021 at 03:14:10PM +0100, Rasmus Villemoes wrote:
>> While a ripple counter can not usually be interfaced with (directly)
>> from software, it may still be a crucial component in a board
>> layout. To prevent its input clock from being disabled by the clock
>> core because it apparently has no consumer, one needs to be able to
>> represent that consumer in DT.
> 
> I'm okay with this as it is describing h/w, but we already 
> 'protected-clocks' property which should work.

Hm. Unless
https://lore.kernel.org/lkml/20200903040015.5627-2-samuel@sholland.org/
gets merged, I don't see how this would work out-of-the-box.

Note that I sent a completely different v2, which made the gpio-wdt the
clock consumer based on feedback from Guenter and Arnd, but that v2
isn't suitable for our case because it post-poned handling of the
watchdog till after i2c is ready, which is too late. Somewhat similar to
https://lore.kernel.org/lkml/20210222171247.97609-2-sebastian.reichel@collabora.com/
it seems.

>> +
>> +Required properties:
>> +- compatible: Must be "linux,ripple-ctr".
> 
> Nothing linux specific about this.

True, but I was following the lead of the existing gpio-wdt binding. Is
there some other "vendor" name one can and should use for completely
generic and simple components like these? "generic"?

Rasmus
