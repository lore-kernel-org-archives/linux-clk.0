Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08973C433ED
	for <linux-clk@archiver.kernel.org>; Mon, 12 Apr 2021 18:52:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C007F61357
	for <linux-clk@archiver.kernel.org>; Mon, 12 Apr 2021 18:52:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244132AbhDLSwn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Apr 2021 14:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236725AbhDLSwm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Apr 2021 14:52:42 -0400
X-Greylist: delayed 481 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 12 Apr 2021 11:52:24 PDT
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D594C061574
        for <linux-clk@vger.kernel.org>; Mon, 12 Apr 2021 11:52:24 -0700 (PDT)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 7CB5B804E7;
        Mon, 12 Apr 2021 20:44:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1618253059;
        bh=xMG6BTUE5ZgzzqLZvUnx6xiOQaciyho/Imrz9gX7Bk8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=r37IU84yI5jkSJ+xCmUJimctQUJzDrTgi5g2Y2qLI42bd+PU8XIvCTaQ6nXr0elCz
         Ii5U8zH9qDZWRyfPGuy3dwWqMDa5jV82lIu0VDY5SiIGWOL/LYnGf3DPFONrOFLBng
         7Vd+8oPmbPlqavDxTDCnsW4MoO8mLHdouTlDl++HNd+dlUMmR/X7hM5xjdi1hKK3VI
         szDzgXfAAa3PJ+4hTOOlCg4oLBoSamaYc5wGRAv0NL7gv5O90eFmUHUwouczU7xuCT
         6y1jO+FdwLgsHIYmdSnYrpU5G61blUJ0fl5D5AryaxkSPzCmzeY/gIswlAHwvjf6sn
         AQNgekXEek82g==
Subject: Re: [PATCH 0/7] ARM: dts: stm32: clk: Switch ETHRX clock parent from
 ETHCK_K to MCO2 on DHCOM SoM
To:     Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Christophe Roullier <christophe.roullier@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Stephen Boyd <sboyd@kernel.org>
References: <20210408185731.135511-1-marex@denx.de>
 <b81d6a69-713f-eda7-0837-d6e80d691c6a@foss.st.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <2c410c1b-2a1d-b291-a128-c5d5979be1ef@denx.de>
Date:   Mon, 12 Apr 2021 20:44:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <b81d6a69-713f-eda7-0837-d6e80d691c6a@foss.st.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4/12/21 10:09 AM, Alexandre TORGUE wrote:
> Hi Marek

Hello Alex,

[...]

>> All the above still only discusses the clock part of the problem. Even if
>> the clock cyclic dependencies could be solved, it would be necessary to
>> resolve legacy dwmac st,eth-clk-sel and st,eth-ref-clk-sel DT properties
>> and avoid DT ABI break.
> 
> Thanks for those clear explanations and for this series. As discussed, 
> this approach looks good to me as it doesn't break our current strategy 
> for dwmac clock integration. I don't know if those cyclic redundancies 
> will be fixed one day but we can have a look on dwmac DT properties (the 
> gain to change them, the effort to keep the backward compatibility, code 
> readability, ...).
> 
> Your DT patches looks good. I'll merge them soon.
+CC Stephen ; the DT patches depend on the clock driver changes. Would 
it make sense to pick the clock patches through the same tree or how 
should that be handled ?

[...]
