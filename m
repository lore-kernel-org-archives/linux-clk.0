Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069B9C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jan 2022 22:11:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237654AbiARWLD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jan 2022 17:11:03 -0500
Received: from phobos.denx.de ([85.214.62.61]:56444 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233791AbiARWLD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 18 Jan 2022 17:11:03 -0500
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id C8BA68386E;
        Tue, 18 Jan 2022 23:11:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1642543861;
        bh=fqeXuE/XXckCu93jIWdmh4PNY5CzdbtbGiAytW9ROWU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=WVZquKiTV2WFiyKZt8pTsDiB3ai/OFk96h9GqpqbjpGwJ7vY3VbOsushJsPwvNt3C
         BOK+ffrVqhAkF5dp9IMBZGPKUTIFGtVu/7VsTSR0ILJ7WUyY8YJQHd44GGqv+kTXQw
         cLBH6ard8rJxB26DMW4nxfeWxRyv51Y3KVSzfLDQM6g8+F4+yHZ8IwsS6acMIpZbYU
         18Semowie0hFEQL0yavuiiMg0cbNa3sHjPt2jnrjYeRJRCMLt4IR7Lmi+yF4LhyLZC
         d8j5yw7fG4O4lwqz/1cCU7zZm8zvDnPkhTe6mQXZzpASH0+yaXqe+snUcEJ3k04GIQ
         96eF3hEYJhx0g==
Message-ID: <8d02eb84-704e-ea67-0050-78c40f930094@denx.de>
Date:   Tue, 18 Jan 2022 23:11:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/7] clk: stm32mp1: Split ETHCK_K into separate MUX and
 GATE clock
Content-Language: en-US
To:     "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>,
        Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Christophe Roullier <christophe.roullier@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Stephen Boyd <sboyd@kernel.org>
References: <20210408185731.135511-1-marex@denx.de>
 <20210408185731.135511-2-marex@denx.de>
 <2b10f5d9-54cb-ce83-b7aa-f4ec8e67c001@foss.st.com>
 <92dd5798-8f5a-66e4-06bc-e3beb16690f5@denx.de>
 <d168aed8-aebd-1bee-aa72-3a3601718cad@foss.st.com>
 <e27dbccd-518f-7718-8cf7-cc9c8adb8a56@denx.de>
 <6416577a-ea06-a014-543a-9ef86aae603d@foss.st.com>
 <2281af74-33a0-df45-968b-baa1ddd9d6e0@denx.de>
 <8481872c-9ee0-c759-3ab0-5209165ad9b2@foss.st.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <8481872c-9ee0-c759-3ab0-5209165ad9b2@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4/19/21 09:46, gabriel.fernandez@foss.st.com wrote:

Hello again,

[...]

I sent out an rebased (and much shorter) patch series now:

https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=606380

-- 
Best regards,
Marek Vasut
