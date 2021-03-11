Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE57C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 07:09:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D22C86501F
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 07:09:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbhCKHIy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Mar 2021 02:08:54 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:48085 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231643AbhCKHIv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Mar 2021 02:08:51 -0500
Received: from mail-wr1-f72.google.com ([209.85.221.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lKFRB-0001hX-VP
        for linux-clk@vger.kernel.org; Thu, 11 Mar 2021 07:08:50 +0000
Received: by mail-wr1-f72.google.com with SMTP id s10so9094145wre.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Mar 2021 23:08:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zgH3nywQ4QyohOt2SMlSyPyC9OdZbO8xrqdRqBr6msM=;
        b=ks450i3fo7nfU0c/KfHrbuaW2m1fNfdUe0Gf1OOt8uFG14ECkoU6BoOEX6q4XcAnSy
         BUoH+seh5U5us7hfSB/zxYQlkNRLyx504noeY05eu5Eo7KQ0EqhbdCoxPwiK59dKNrFe
         Lu3TLPOMoNzopmJ/iMcjOwnGheBSeUD0HL55zWEkb21W1x0fVp+g/Ckbr3n6i6DlN2G5
         6oQTcMYu9V/ZBF5thv7rwqPtYxfbiJ92aTFAsbvD3IEOEK2dfZcAxCpTptj1N0+PMA8Z
         Ms6p9yq6cZaE96k9Ny5LAgYgztgT05myO4MphQTyh6H6xBNM0IL84P7sbsuvQY7MSRWI
         IvNQ==
X-Gm-Message-State: AOAM531nmVMkpW12rquOpiklIoH8uipplt2m0vgXJSleaL+7Q1g4PJtY
        rE00naZMz5QBV9QBoyWznq2oLQQGZjA5dvuHKBtvBDTHtVDTI3vsg/bYifXeBbjwPNkIk7Trc/T
        1HpkyYeywd7XMJGYHxs344HXuFn6spoB3mEZdGw==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr6850400wmc.65.1615446529706;
        Wed, 10 Mar 2021 23:08:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFSUTjS1JFmjO0hMPLkEAzm/KPuXrtY7IKz/mXB9yfWR7YE3pRWw0tap7L6t6boQLro+3hFQ==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr6850370wmc.65.1615446529545;
        Wed, 10 Mar 2021 23:08:49 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id a6sm2515137wmm.0.2021.03.10.23.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 23:08:49 -0800 (PST)
Subject: Re: [RFC v2 3/5] arm64: socfpga: rename ARCH_STRATIX10 to
 ARCH_SOCFPGA64
To:     Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc:     Tom Rix <trix@redhat.com>, Lee Jones <lee.jones@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Moritz Fischer <mdf@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-edac@vger.kernel.org, linux-fpga@vger.kernel.org,
        Networking <netdev@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com, arm-soc <arm@kernel.org>,
        SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
 <20210310094527.GA701493@dell>
 <35c39c81-08e4-24c8-f683-2fa7a7ea71de@redhat.com>
 <1c06cb74-f0b0-66e5-a594-ed1ee9bc876e@canonical.com>
 <CAK8P3a1CCQwbeH4KiUgif+-HdubVjjZBkMXimEjYkgeh4eJ7cg@mail.gmail.com>
 <52d0489f-0f77-76a2-3269-e3004c6b6c07@canonical.com>
 <ba2536a6-7c74-0cca-023f-cc6179950d37@canonical.com>
 <CAK8P3a1k7c5X5x=-_-=f=ACwY+uQQ8YEcAGXYfdTdSnqpo96sA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <fb0d8ca3-ac46-f547-02b0-7f47ff8fff6b@canonical.com>
Date:   Thu, 11 Mar 2021 08:08:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1k7c5X5x=-_-=f=ACwY+uQQ8YEcAGXYfdTdSnqpo96sA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/03/2021 17:42, Arnd Bergmann wrote:
> On Wed, Mar 10, 2021 at 4:54 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>> On 10/03/2021 16:47, Krzysztof Kozlowski wrote:
>>> This edac Altera driver is very weird... it uses the same compatible
>>> differently depending whether this is 32-bit or 64-bit (e.g. Stratix
>>> 10)! On ARMv7 the compatible means for example one IRQ... On ARMv8, we
>>> have two. It's quite a new code (2019 from Intel), not some ancient
>>> legacy, so it should never have been accepted...
>>
>> Oh, it's not that horrible as it sounds. They actually have different
>> compatibles for edac driver with these differences (e.g. in interrupts).
>> They just do not use them and instead check for the basic (common?)
>> compatible and architecture... Anyway without testing I am not the
>> person to fix the edac driver.
> 
> Ok, This should be fixed properly as you describe, but as a quick hack
> it wouldn't be hard to just change the #ifdef to check for CONFIG_64BIT
> instead of CONFIG_ARCH_STRATIX10 during the rename of the config
> symbol.

This would work. The trouble with renaming ARCH_SOCFPGA into
ARCH_INTEL_SOCFPGA is that still SOCFPGA will appear in many other
Kconfig symbols or even directory paths.

Let me use ARCH_INTEL_SOCFPGA for 64bit here and renaming of 32bit a
little bit later.

Best regards,
Krzysztof
