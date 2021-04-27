Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531BEC433B4
	for <linux-clk@archiver.kernel.org>; Tue, 27 Apr 2021 17:07:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C482613DC
	for <linux-clk@archiver.kernel.org>; Tue, 27 Apr 2021 17:07:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236172AbhD0RIR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Apr 2021 13:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236279AbhD0RIJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Apr 2021 13:08:09 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2546BC061574;
        Tue, 27 Apr 2021 10:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=2Z+EfoLqOBtnltnlA2u82HBsjGCzlQ5xCYdLzak28VE=; b=j/w/B0X+MzMF/1PAxftgLNIxOH
        b/BwpYu8Rw4erCBS29WORYMPsE/VL0ITbRt30JGfvHjcBInMBeEfGDOaG7NIEJs2MJdjTK5SGYrGx
        Rir55JAp3v9Qpy3rFmVKMiFgLOmtwV2+JlhMomnPcOkdCcDQDS8v+7pO+D/I4ysAoR0ftlAn8PlxL
        7sOqMj6SApj4AUvnJLWWiTD5FR+yq+4oqgoc7ysFIP7rb9zkComXbyAfJTvAxxF6SD8ufiYnmuiHn
        n1zzE4A4pG7QwKXPSLL3ogJZW1Aq4Vy3/QQfyE7ZiDT4mlwR29LxEp/B2Flp1UVBMbKCd9knLCuhf
        a5gUNcXg==;
Received: from [2601:1c0:6280:3f0::df68]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lbRAx-007B32-8f; Tue, 27 Apr 2021 17:07:12 +0000
Subject: Re: [PATCH] clk: <linux/clk.h>: correct clk_get_parent()
 documentation
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210427031342.5333-1-rdunlap@infradead.org>
 <20210427093809.GU1463@shell.armlinux.org.uk>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9574eefa-84ed-8674-f575-be47d2a51a1c@infradead.org>
Date:   Tue, 27 Apr 2021 10:07:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210427093809.GU1463@shell.armlinux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4/27/21 2:38 AM, Russell King - ARM Linux admin wrote:
> On Mon, Apr 26, 2021 at 08:13:42PM -0700, Randy Dunlap wrote:
>> Make the kernel-doc return value agree with both the stub implementation
>> in <linux/clk.h> and the non-stub function in drivers/clk/clk.c.
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Russell King <linux@armlinux.org.uk>
>> Cc: linux-clk@vger.kernel.org
>> ---
>> There are several drivers that call clk_get_parent() and use its
>> return value as though it returns an ERR_PTR(). I am working on a
>> patch series to fix those.
> 
> The whole premise of the CLK API is that:
> 
> - clk values that IS_ERR() returns true are errors
> - clk values that IS_ERR() returns false are valid
> 
> and that is that - nice, simple, easy to understand. So the
> documentation is correct. If clk_get_parent() needs to return an
> error, it does so by returning an error-pointer, not by returning
> NULL.

Hm, so the 6 drivers that do this are OK then, if
clk_get_parent() returns NULL?


	parent = clk_get_parent(clk);
	if (IS_ERR(parent)) {
		dev_err(cpu_dev, "Cannot get parent clock for CPU0\n");
		clk_put(clk);
		return PTR_ERR(parent);
	}

	/* Get parent CPU frequency */
	base_frequency =  clk_get_rate(parent);

boom?

-- 
~Randy

