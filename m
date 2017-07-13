Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from outils.crapouillou.net ([89.234.176.41]:53754 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750920AbdGMKH2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jul 2017 06:07:28 -0400
To: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 01/18] clk: ingenic: Use const pointer to clk_ops in  struct
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Thu, 13 Jul 2017 12:07:25 +0200
From: Paul Cercueil <paul@crapouillou.net>
Cc: Ralf Baechle <ralf@linux-mips.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paul.burton@imgtec.com>,
        Maarten ter Huurne <maarten@treewalker.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@linux-mips.org, linux-clk@vger.kernel.org
Subject: 
In-Reply-To: <20170712232037.GR22780@codeaurora.org>
References: <20170607200439.24450-2-paul@crapouillou.net>
 <20170702163016.6714-1-paul@crapouillou.net>
 <20170702163016.6714-2-paul@crapouillou.net>
 <20170712232037.GR22780@codeaurora.org>
Message-ID: <ca4da3fa3067a7301f8fc1539e9e4362@crapouillou.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Le 2017-07-13 01:20, Stephen Boyd a écrit :
> On 07/02, Paul Cercueil wrote:
>> The CGU common code does not modify the pointed clk_ops structure, so 
>> it
>> should be marked as const.
>> 
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> ---
> 
> Sorry I forgot, did you want an ack for these clk patches or for
> me to take them through clk tree. If it's the ack case,
> 
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>
> 
> for patches 1 through 6.

I think ACK; then Ralf can take them in 4.13 :)

Thanks,

-Paul
