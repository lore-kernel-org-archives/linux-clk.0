Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D97C2B9F4
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 06:46:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0C54613CE
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 06:46:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbhFQGsZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jun 2021 02:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbhFQGsY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jun 2021 02:48:24 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52064C061574;
        Wed, 16 Jun 2021 23:46:16 -0700 (PDT)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id AAF3980488;
        Thu, 17 Jun 2021 08:46:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1623912372;
        bh=3LNfs60VA3LWGoKvJHHA7RUoJIcB6us5WIZF6Y71+WE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=iX/QAqFuWzws1E3uJHmDU8HiUsCiAZxrQizvt0BAf8wrzClAibk/h2Gtl4JLsau+R
         b0eG0v9xvyEWVNwgdKxDc6d23nFofOmx4n6UTX/LsPpm7c4ZyZ9nUqr2vXb/CBChFP
         PmPwgIZVWyLJFUJ9nPGY2fWX5b1SHLYxN9w2hSnykM+zIN42qoGrB/MOYAliN+MBOw
         Cz4AJsLTewLK5CtmYQNCmkPw/wFnYfpvUcJyOroNYtzdy5V4E7hX3OpOsbUwPkme1R
         NiOMXfVdUKLB3SxuIZmBZuZqcfUq1ID4CyCqzF57FdADP88lXqvz5pecOX47xXTdvl
         BD1ZEI8OPu2ng==
Subject: Re: [RESEND PATCH v3 11/11] clk: stm32mp1: new compatible for secure
 RCC support
To:     gabriel.fernandez@foss.st.com,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Etienne Carriere <etienne.carriere@foss.st.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com>
 <20210617051814.12018-12-gabriel.fernandez@foss.st.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <14a81ad2-d646-30ca-46f0-d2078b09c4f2@denx.de>
Date:   Thu, 17 Jun 2021 08:46:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210617051814.12018-12-gabriel.fernandez@foss.st.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 6/17/21 7:18 AM, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Platform STM32MP1 can be used in configuration where some clock
> resources cannot be accessed by Linux kernel when executing in non-secure
> state of the CPU(s).
> In such configuration, the RCC clock driver must not register clocks
> it cannot access.
> They are expected to be registered from another clock driver such
> as the SCMI clock driver.
> This change uses specific compatible string "st,stm32mp1-rcc-secure"
> to specify RCC clock driver configuration where RCC is secure.

Should this really be a new compatible string or rather a DT property ? 
I think the later, since this is the same clock IP, only operating in 
different "mode" , no ?
