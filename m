Return-Path: <SRS0=CNvH=EI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09ADFC2D0A3
	for <linux-clk@archiver.kernel.org>; Mon,  2 Nov 2020 21:32:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79171208A9
	for <linux-clk@archiver.kernel.org>; Mon,  2 Nov 2020 21:32:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="n8iCUXfN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgKBVcK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Nov 2020 16:32:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgKBVcK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Nov 2020 16:32:10 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA640C0617A6;
        Mon,  2 Nov 2020 13:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=h3oMtEYvKdbDjFLUL7+0fGhfLoWgk1F2RuoMLSxSJj8=; b=n8iCUXfNz9t/awYKgJl8XKY1Rz
        C7+agVs/l/NJuZGTOxEu1flJFNZNFrNLGn4mvMorpeT3er/qmhizLO7OqfArlm5YqCSank7agxRlc
        94/ACmeDTQDRWWiHhmambyYagPqx092ouWGPSz+8NpjAah+uw1byjU1f3o4H7jN5PkyeXmC11fOws
        P1AkoObQeRtwN3hI0pJSc1pqZ5pvizvIHBvzLj/5tJxGKJopPIzh+ZbsTJGOpcVUZI8SqSOymwy/9
        Px3zu//bTfgHWDHBttj21iE666RW38k5khcMrc1lHZzx/Fbi53oiglAHCua4mECXxr5XuzJ+qzj0s
        JSb4tABg==;
Received: from [2601:1c0:6280:3f0::60d5]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kZhQs-0004oc-6V; Mon, 02 Nov 2020 21:32:06 +0000
Subject: Re: [PATCH] clk: imx: scu: Fix compile error with module build of
 clk-scu.o
To:     =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <208469.1604318525@turing-police>
 <6e5a8fdb-0a02-5eae-ca1f-37df8a454e34@infradead.org>
 <238534.1604350899@turing-police>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0b61c4f4-b389-c853-6e09-ee603455e583@infradead.org>
Date:   Mon, 2 Nov 2020 13:31:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <238534.1604350899@turing-police>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/2/20 1:01 PM, Valdis Klētnieks wrote:
> On Mon, 02 Nov 2020 09:15:20 -0800, Randy Dunlap said:
> 
>> also
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> However, this driver does not directly use <linux/module.h>.
> 
> Just my luck - I looked at 3 or 4 other things that include of_platform.h
> and they all *did* include module.h.
> 
>> platform_device.h #includes <linux/device.h>, which is where the
>> problem lies:
>>
>> <linux/device.h> uses macros that are provided by <linux/module.h>
>> so <linux/device.h> should #include <linux/module.h>.
>>
>> and that fixes this commit:
>>
>> commit 4c002c978b7f2f2306d53de051c054504af920a9
>> Author: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Date:   Mon Dec 9 20:33:03 2019 +0100
>>
>>     device.h: move 'struct driver' stuff out to device/driver.h
> 
> OK.. who's going to do that? Me, or Randy, or Greg?

You could go ahead... I began on it yesterday but didn't finish
testing, although I did see the same build error that the 0day
bot reported, so I don't know what it's going to take to fix that.


-- 
~Randy

