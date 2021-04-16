Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E496C433ED
	for <linux-clk@archiver.kernel.org>; Fri, 16 Apr 2021 13:40:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4525E610FA
	for <linux-clk@archiver.kernel.org>; Fri, 16 Apr 2021 13:40:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235603AbhDPNk0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Apr 2021 09:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235329AbhDPNkZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Apr 2021 09:40:25 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D59EC061574
        for <linux-clk@vger.kernel.org>; Fri, 16 Apr 2021 06:40:00 -0700 (PDT)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 1C1AD80040;
        Fri, 16 Apr 2021 15:39:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1618580395;
        bh=DN06i9gmQHIuoZz210y9kvpT4840BC3hd/m62B1VvN4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=TajBG8AI4SLYPrzCwKsT9w5k5ZfUP7vUfNeyfML+GHI4gifEehnvEYV6QSDze/0s8
         s3TG+HINLPIUP4gk+vEl1ay/3aDDak9fIicnzEZEn3sUd6u+TSquKaRDzX5Qh+bxfI
         Lyynlu+JZtUpf0iDNGvd7rUYLJnInG2DMjsui9X3ltNwm6Mm3Xw/FlBdcHIiAE2RwK
         Ka46HdHB3uUFQrur1kG02lB6UBIKpr08Ezwz/gN2PTGBATHbQNk4LPv6D7D1T5erzN
         E88SnY85kaDmkwfu3s4fOeU+uPOfWuCv/NoEbZabDcifnDbq/AO3VwDDLrsHIdamGD
         +8EsmuqBZ0XlA==
Subject: Re: [PATCH 2/7] clk: stm32mp1: The dev is always NULL, replace it
 with np
To:     "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20210408185731.135511-1-marex@denx.de>
 <20210408185731.135511-3-marex@denx.de>
 <a1768f19-fd80-abd7-03ee-8e47c124a271@foss.st.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <362315e2-1398-4d11-e179-0ab7ca64e591@denx.de>
Date:   Fri, 16 Apr 2021 15:39:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <a1768f19-fd80-abd7-03ee-8e47c124a271@foss.st.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4/16/21 8:44 AM, gabriel.fernandez@foss.st.com wrote:
> Hi Marek,

Hello Gabriel,

> I have a patch-set in progress using $dev (convertion into module driver).
> 
> https://patchwork.kernel.org/project/linux-clk/list/?series=421767
> 
> Then rebase of your patch, [PATCH 4/7] clk: stm32mp1: Add parent_data to 
> ETHRX clock, can be done easily.

I suspect the aforementioned patchset will have to be reworked, since 
the current approach to push SCMI onto every system and renumerate the 
clock has been rejected, because it caused DT ABI break and boot 
problems on many systems.

btw please don't top-post.

> Best regards
> Gabriel
> 
> On 4/8/21 8:57 PM, Marek Vasut wrote:
>> Instead of passing around $dev to all the registration functions, which
>> is always NULL, pass around struct device_node pointer $np. This way it
>> is possible to use of_clk_hw_register*() functions and/or register clock
>> with associated $np pointer.
[...]
