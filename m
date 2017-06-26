Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from outils.crapouillou.net ([89.234.176.41]:53134 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750752AbdFZNuO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jun 2017 09:50:14 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Mon, 26 Jun 2017 15:50:11 +0200
From: Paul Cercueil <paul@crapouillou.net>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Ralf Baechle <ralf@linux-mips.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paul.burton@imgtec.com>,
        Maarten ter Huurne <maarten@treewalker.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@linux-mips.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 04/15] clk: Add Ingenic jz4770 CGU driver
In-Reply-To: <20170607205943.GO20170@codeaurora.org>
References: <20170607200439.24450-1-paul@crapouillou.net>
 <20170607200439.24450-5-paul@crapouillou.net>
 <20170607205943.GO20170@codeaurora.org>
Message-ID: <639b492cc57200bab14572ac591ef8af@crapouillou.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

Le 2017-06-07 22:59, Stephen Boyd a écrit :
> On 06/07, Paul Cercueil wrote:
>> Add support for the clocks provided by the CGU in the Ingenic JZ4770
>> SoC.
>> 
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>

[...]

>> diff --git a/include/dt-bindings/clock/jz4770-cgu.h 
>> b/include/dt-bindings/clock/jz4770-cgu.h
>> new file mode 100644
>> index 000000000000..54b8b2ae4a73
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/jz4770-cgu.h
> 
> Can you split this file off into a different patch? That way clk
> tree can apply clk patches on top of a stable branch where this
> file lives by itself.

Oops, I forgot that in the v2.

The jz4770-cgu.c file includes and uses 
<dt-bindings/clock/jz4770-cgu.h>, so I don't think
it would make sense to split it, since it wouldn't compile without it.
