Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 892B4C433ED
	for <linux-clk@archiver.kernel.org>; Fri, 16 Apr 2021 14:54:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67AC261107
	for <linux-clk@archiver.kernel.org>; Fri, 16 Apr 2021 14:54:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235784AbhDPOyt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Apr 2021 10:54:49 -0400
Received: from phobos.denx.de ([85.214.62.61]:48620 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233916AbhDPOyt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 16 Apr 2021 10:54:49 -0400
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id BF6C88021B;
        Fri, 16 Apr 2021 16:54:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1618584863;
        bh=tGW8k9n+DrgLob+pFcJl5r0dMLozm+K8pSnhN1jjcA0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Gw8Ez3MN3JFpeqxRJubEowpMM3rcSR1LHCICML+/vmhHLXKsHgCiCxq6vcHZZXBXF
         K2Frmh0xlOIMrXTe9XNWk3NmwexQJkc7+TjbRQaxregB6rlIfUMzJoLwQMWOtxJ+GP
         EX1vr3WD+dyj98npvDXMVT8v4I1hhqVqHVwM9pLk8u6+QgC8re/jCzYIATASyFHYfR
         wk0mkeCAJjmlpwzEmQP56+KxK+GCOw8IFe7mPUhz9N6coXo0UngokjzFTEdr4qAL+D
         KfVHsE7llYm+Dbyv+pWQKQ+mmyyrHfPiTuSKOYGx3cSWlSRoq6sPmFBOM3Bq9MO1Iz
         424uXFD9PcnyQ==
Subject: Re: [PATCH 2/7] clk: stm32mp1: The dev is always NULL, replace it
 with np
To:     Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Christophe Roullier <christophe.roullier@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20210408185731.135511-1-marex@denx.de>
 <20210408185731.135511-3-marex@denx.de>
 <a1768f19-fd80-abd7-03ee-8e47c124a271@foss.st.com>
 <362315e2-1398-4d11-e179-0ab7ca64e591@denx.de>
 <ffcd327e-c5b7-089c-1009-cfc97219495b@foss.st.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <4fc3589d-8602-6567-9800-71f2fd21e450@denx.de>
Date:   Fri, 16 Apr 2021 16:54:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <ffcd327e-c5b7-089c-1009-cfc97219495b@foss.st.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4/16/21 4:39 PM, Alexandre TORGUE wrote:
> Hi Marek

Hello Alexandre,

> On 4/16/21 3:39 PM, Marek Vasut wrote:
>> On 4/16/21 8:44 AM, gabriel.fernandez@foss.st.com wrote:
>>> Hi Marek,
>>
>> Hello Gabriel,
>>
>>> I have a patch-set in progress using $dev (convertion into module 
>>> driver).
>>>
>>> https://patchwork.kernel.org/project/linux-clk/list/?series=421767
>>>
>>> Then rebase of your patch, [PATCH 4/7] clk: stm32mp1: Add parent_data 
>>> to ETHRX clock, can be done easily.
>>
>> I suspect the aforementioned patchset will have to be reworked, since 
>> the current approach to push SCMI onto every system and renumerate the 
>> clock has been rejected, because it caused DT ABI break and boot 
>> problems on many systems.
> 
> SCMI patches for clock drivers will be pushed (and merged one day :)). 
> We only drop the DT part which will be done through dtbo in 
> uboot/tfa/optee.
If the result works for both options (without SCMI and opt-in with 
SCMI), then that's fine. Does the aforementioned patchset already 
implement that ?

If so (or if there is a rebase + repost of the above patchset which 
does), then I am happy to rebase this one on top.

-- 
Best regards,
Marek Vasut
