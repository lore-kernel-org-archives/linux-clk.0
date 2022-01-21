Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25B4C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 21 Jan 2022 13:12:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238586AbiAUNMy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Jan 2022 08:12:54 -0500
Received: from phobos.denx.de ([85.214.62.61]:48760 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238548AbiAUNMx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 21 Jan 2022 08:12:53 -0500
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id C0A0180FDE;
        Fri, 21 Jan 2022 14:12:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1642770772;
        bh=gOK+KoEhV8IsdAelX1RAzCZ18FHAlg4FPukwYmI3h3s=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=dfiZbczjWnURcFUKrVbh1NvK3+/OK3rAACUbr03OT4mfbUH0cMFDYwrVZl/fKJtnZ
         lxTpshd6TUAFNhBL5rqHahOY4SKgt/90jXJLmXBRLHbZ6NlJYLqYb5czupzgmDPo3D
         vxOpPIeaJCe4KBj7+nZR0BT3f0AoNHFvbDivsq3ae1pfaoA3xqFzOo1VrepS3FmZ0f
         FunJ5Vyec9tCAmH8Fr1Ik21gMCdxcBJWe/GNuGzYPb+3/XMWo90+cAbS6dBAIdVKuV
         5KdBZ4O6ItLVYW95hqS0xikmhdAKxwnU8vtpYhqX/q3XszqhpvFxhIWDSdxjBkBXrO
         wfip5NHOzxsAQ==
Message-ID: <6bf770a8-9a87-9806-d1a1-9564e018817c@denx.de>
Date:   Fri, 21 Jan 2022 14:12:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/5] clk: stm32mp1: Split ETHCK_K into separate MUX and
 GATE clock
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
To:     Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     jneuhauser@dh-electronics.com,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20220118202958.1840431-1-marex@denx.de>
 <20220120220356.79C3CC340E0@smtp.kernel.org>
 <2752700e-83ec-d844-e99e-73be8ff87ee9@denx.de>
In-Reply-To: <2752700e-83ec-d844-e99e-73be8ff87ee9@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 1/20/22 23:39, Marek Vasut wrote:
> On 1/20/22 23:03, Stephen Boyd wrote:
>> Quoting Marek Vasut (2022-01-18 12:29:54)
>>> The ETHCK_K are modeled as composite clock of MUX and GATE, however per
>>> STM32MP1 Reference Manual RM0436 Rev 3, Page 574, Figure 83. Peripheral
>>> clock distribution for Ethernet, ETHPTPDIV divider is attached past the
>>> ETHCK_K mux, and ETH_CLK/eth_clk_fb clock are output past ETHCKEN gate.
>>> Therefore, in case ETH_CLK/eth_clk_fb are not in use AND PTP clock are
>>> in use, ETHCKEN gate can be turned off. Current driver does not permit
>>> that, fix it.
>>>
>>> This patch converts ETHCK_K from composite clock into a ETHCKEN gate,
>>> ETHPTP_K from composite clock into ETHPTPDIV divider, and adds another
>>> NO_ID clock "ck_ker_eth" which models the ETHSRC mux and is parent clock
>>> to both ETHCK_K and ETHPTP_K. Therefore, all references to ETHCK_K and
>>> ETHPTP_K remain functional as before.
>>>
>>> [1] STM32MP1 Reference Manual RM0436 Rev 3, Page 574,
>>>      Figure 83. Peripheral clock distribution for Ethernet
>>>      
>>> https://www.st.com/resource/en/reference_manual/dm00327659-stm32mp157-advanced-armbased-32bit-mpus-stmicroelectronics.pdf 
>>>
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
>>> Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>> Cc: Stephen Boyd <sboyd@kernel.org>
>>> Cc: linux-clk@vger.kernel.org
>>> Cc: linux-stm32@st-md-mailman.stormreply.com
>>> To: linux-arm-kernel@lists.infradead.org
>>> ---
>>
>> Any cover letter?
> 
> If there is a need for V2, I will send one. Admittedly, I forgot one here.
> 
>> What is the merge strategy of this patch series?
> 
> Clock bits 1/5 and 2/5 can go through clock tree, DT bits through Alex's 
> ST tree.
> 
>> Do I need to ack the patches?
> 
> I am waiting for AB/RB from ST, then they can be merged.
> 
> If you want to review the first two patches, sure, the top half of 2/5 
> is probably the most interesting part, based on your suggestion from 
> almost a year ago. The rest are clock controller hardware details.

So if you want to pick 1/5 and 2/5 via clock tree with A-B from Gabriel, 
please do.
