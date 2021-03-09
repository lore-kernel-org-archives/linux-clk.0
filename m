Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A48EC433E0
	for <linux-clk@archiver.kernel.org>; Tue,  9 Mar 2021 09:04:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 526F065165
	for <linux-clk@archiver.kernel.org>; Tue,  9 Mar 2021 09:04:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbhCIJDc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Mar 2021 04:03:32 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:59595 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbhCIJDA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Mar 2021 04:03:00 -0500
Received: from mail-wr1-f70.google.com ([209.85.221.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lJYGZ-0003tz-FD
        for linux-clk@vger.kernel.org; Tue, 09 Mar 2021 09:02:59 +0000
Received: by mail-wr1-f70.google.com with SMTP id v13so6126236wrs.21
        for <linux-clk@vger.kernel.org>; Tue, 09 Mar 2021 01:02:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rQi3mMyCx5V6nVRVkrOz/LCzu7P2PiFtdcIbz05GpxM=;
        b=nDcR76nf8uLjHGy50rJ/cXCGNS+7JD6jKxcKDan5ItyB/XGOOqb5JJgbRBu2738vjq
         PCfpnn51MG5XI+Cd1wWLbKbax1655Rf6vNCIzcFcygKef/+OtF5SxC/dbcap9N99RSGW
         GvYmBH5GlUtq7muI3124LkZa7vGZugBilJ3rQ+Uf07+gPztnvbbXQGyvzw9kn0YePoWp
         mc/4dmwHSolRMegnRlvRaDsmpM6Ykbg1CUCkMfdsC5RDTP11vbjUy8lJYrE6ui7t9KGy
         85ylrH28HPW/Eks1Tca7zHByjefmIlHGVvpk6QKJnQqEclgSEdRXAi6Hc7un9Po7Cc91
         bx2Q==
X-Gm-Message-State: AOAM531AXzBemvcZsS6KC4Y1M3NdpWuDKF8whH6J1RbyWHc52qQfj3j4
        FzOJIEzp0hhnZDgJL1eGr0+iyNCoHTbJLNyB8ZSsqe94VBzcp/KQCwxAeBTnxVs/EXbQp06iNMU
        2728YDoFF2S8bgMxN5SeUbM/5urENBWf6UuiHmQ==
X-Received: by 2002:adf:aa08:: with SMTP id p8mr26511772wrd.232.1615280579206;
        Tue, 09 Mar 2021 01:02:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyK7Ib4y+Oq/NBTnNNAXU1SyTnxC1WzGjqyRuPWJZbtvY6SWvvZ4QuBGaz00HnFgPsH5ZSIcw==
X-Received: by 2002:adf:aa08:: with SMTP id p8mr26511747wrd.232.1615280578985;
        Tue, 09 Mar 2021 01:02:58 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id p16sm26521729wrt.54.2021.03.09.01.02.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 01:02:58 -0800 (PST)
Subject: Re: [PATCH 3/3] clk: socfpga: allow compile testing of Stratix 10 /
 Agilex clocks
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-arm-kernel@lists.infradead.org
References: <20210308182339.379775-1-krzysztof.kozlowski@canonical.com>
 <20210308182339.379775-4-krzysztof.kozlowski@canonical.com>
 <9c8109f7-47b3-a865-5bd7-656b7c3c318f@canonical.com>
Message-ID: <7e4fb9fb-493f-2f05-20fe-e9d8cc6a4ed2@canonical.com>
Date:   Tue, 9 Mar 2021 10:02:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <9c8109f7-47b3-a865-5bd7-656b7c3c318f@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 09/03/2021 09:49, Krzysztof Kozlowski wrote:
> On 08/03/2021 19:23, Krzysztof Kozlowski wrote:
>> The Stratix 10 / Agilex / N5X clocks do not use anything other
>> than OF or COMMON_CLK so they should be compile testable on most of
>> the platforms.
>> 
>> Signed-off-by: Krzysztof Kozlowski 
>> <krzysztof.kozlowski@canonical.com> --- drivers/clk/Makefile |  5 
>> +---- drivers/clk/socfpga/Kconfig | 22 ++++++++++++++++------ 2 
>> files changed, 17 insertions(+), 10 deletions(-)
>> 
>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile index 
>> 12e46b12e587..9b582b3fca34 100644 --- a/drivers/clk/Makefile +++ 
>> b/drivers/clk/Makefile @@ -104,10 +104,7 @@ obj-y					+= renesas/ 
>> obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/ 
>> obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/ 
>> obj-$(CONFIG_CLK_SIFIVE)		+= sifive/ -obj-$(CONFIG_ARCH_SOCFPGA) +=
>> socfpga/ -obj-$(CONFIG_ARCH_AGILEX)		+= socfpga/ 
>> -obj-$(CONFIG_ARCH_N5X)			+= socfpga/
>> -obj-$(CONFIG_ARCH_STRATIX10) += socfpga/ +obj-y					+= socfpga/
>> obj-$(CONFIG_PLAT_SPEAR)		+= spear/ obj-y					+= sprd/
>> obj-$(CONFIG_ARCH_STI)			+= st/ diff --git
>> a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig index
>> 4922cc35f4cc..de7b3137e215 100644 --- a/drivers/clk/socfpga/Kconfig
>> +++ b/drivers/clk/socfpga/Kconfig @@ -1,13 +1,23 @@ #
>> SPDX-License-Identifier: GPL-2.0 +config COMMON_CLK_SOCFPGA +	bool
>> "Intel SoCFPGA family clock support" if COMPILE_TEST
> 
> Kernel test robot found here wrong configuration - possibility to 
> disable the clocks with compile test. I'll send a v2.

Uh, that's not that easy. Intel created three different arm64 architectures
for one real arm64 architecture... I guess it was driven by
the marketing but here we are - the solution would be to have entries like:

bool "Intel SoCFPGA family clock support" if COMPILE_TEST && !ARCH_AGILEX && !ARCH_N5X && !ARCH_SOCFPGA && !ARCH_STRATIX10
...
bool "Intel Stratix / Agilex / N5X clock controller support" if COMPILE_TEST && !ARCH_AGILEX && !ARCH_N5X && !ARCH_STRATIX10
...
bool "Intel Agilex / N5X clock controller support" if COMPILE_TEST && !ARCH_AGILEX && !ARCH_N5X
...

I think it looks wrong. The stratix/agilex/n5x are basically flavors of
socfpga from Linux point of view. This is the same architecture for Linux
kernel, from high level point of view. Instead of going with unified ARCH_SOCFPGA
(like all other platforms, e.g. Renesas, NXP), the Intel create three
different kernel-wide arm64 ARCH_xxx symbols.

It's too much. How about converting all these arm64 Intel platforms to ARCH_SOCFPGA?

Best regards,
Krzysztof
