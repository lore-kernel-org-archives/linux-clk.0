Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937CCC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jan 2022 22:40:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378094AbiATWkG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jan 2022 17:40:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233963AbiATWkE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jan 2022 17:40:04 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78BD5C061574
        for <linux-clk@vger.kernel.org>; Thu, 20 Jan 2022 14:40:03 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 85501836E6;
        Thu, 20 Jan 2022 23:39:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1642718400;
        bh=nMXU4nFL9yVrMj/CnHo6j6d2jD8UXK2gYXYrCUSDAfg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=qvoBCqBIApnpqjlmN+aJ8WDd6RQ2w1mZtXD22WizWcC6iE8R/He9kZqE3mo7PPyLz
         IgIw67cQ/SsQh58ik28lkfRUWTGYupRe5fnjrq7C0i7p31cY13K/K03aQcrwzMQEU6
         bcx7RrwvEnCj+2BpZK89SH8R5lXB4H9571bEH1tKiOc7eoiwpXSPqXPKMR9S+np2TS
         fhjbvRr8Dasqret3vEII56lwkeCF5tyEYoHkyeQs99EAaqZKVxiMu4a3HTbcWLaliG
         B/HuPb6JByz0ymRvnebC+BwFbghydc/7uBPSqhqWfzU0rwBvRmnJFxe2RAZtGVo9UX
         NTzCnWGtDW1Uw==
Message-ID: <2752700e-83ec-d844-e99e-73be8ff87ee9@denx.de>
Date:   Thu, 20 Jan 2022 23:39:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/5] clk: stm32mp1: Split ETHCK_K into separate MUX and
 GATE clock
Content-Language: en-US
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
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20220120220356.79C3CC340E0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 1/20/22 23:03, Stephen Boyd wrote:
> Quoting Marek Vasut (2022-01-18 12:29:54)
>> The ETHCK_K are modeled as composite clock of MUX and GATE, however per
>> STM32MP1 Reference Manual RM0436 Rev 3, Page 574, Figure 83. Peripheral
>> clock distribution for Ethernet, ETHPTPDIV divider is attached past the
>> ETHCK_K mux, and ETH_CLK/eth_clk_fb clock are output past ETHCKEN gate.
>> Therefore, in case ETH_CLK/eth_clk_fb are not in use AND PTP clock are
>> in use, ETHCKEN gate can be turned off. Current driver does not permit
>> that, fix it.
>>
>> This patch converts ETHCK_K from composite clock into a ETHCKEN gate,
>> ETHPTP_K from composite clock into ETHPTPDIV divider, and adds another
>> NO_ID clock "ck_ker_eth" which models the ETHSRC mux and is parent clock
>> to both ETHCK_K and ETHPTP_K. Therefore, all references to ETHCK_K and
>> ETHPTP_K remain functional as before.
>>
>> [1] STM32MP1 Reference Manual RM0436 Rev 3, Page 574,
>>      Figure 83. Peripheral clock distribution for Ethernet
>>      https://www.st.com/resource/en/reference_manual/dm00327659-stm32mp157-advanced-armbased-32bit-mpus-stmicroelectronics.pdf
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
>> Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> Cc: linux-clk@vger.kernel.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> To: linux-arm-kernel@lists.infradead.org
>> ---
> 
> Any cover letter?

If there is a need for V2, I will send one. Admittedly, I forgot one here.

> What is the merge strategy of this patch series?

Clock bits 1/5 and 2/5 can go through clock tree, DT bits through Alex's 
ST tree.

> Do I need to ack the patches?

I am waiting for AB/RB from ST, then they can be merged.

If you want to review the first two patches, sure, the top half of 2/5 
is probably the most interesting part, based on your suggestion from 
almost a year ago. The rest are clock controller hardware details.
