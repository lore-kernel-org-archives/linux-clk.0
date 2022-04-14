Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A7CC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 14 Apr 2022 18:32:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344599AbiDNSfS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Apr 2022 14:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343590AbiDNSfR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Apr 2022 14:35:17 -0400
X-Greylist: delayed 368 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 14 Apr 2022 11:32:51 PDT
Received: from mxout02.lancloud.ru (mxout02.lancloud.ru [45.84.86.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F85EEA749
        for <linux-clk@vger.kernel.org>; Thu, 14 Apr 2022 11:32:51 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru DFC32233D6F3
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH V2] clk: renesas: Fix memory leak of 'cpg'
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Haowen Bai <baihaowen@meizu.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1649837953-10984-1-git-send-email-baihaowen@meizu.com>
 <2ed01eb3-ff46-425c-75dc-81729a5c30a8@omp.ru>
 <CAMuHMdVCRRbhYEnk4bjvPugrosw4mNQCcHQqsNrx0RhFL+dJDQ@mail.gmail.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <ad8972c2-5261-406a-c98e-d8c3d382fc7d@omp.ru>
Date:   Thu, 14 Apr 2022 21:26:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVCRRbhYEnk4bjvPugrosw4mNQCcHQqsNrx0RhFL+dJDQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4/14/22 12:32 PM, Geert Uytterhoeven wrote:

[...]
>>> Fix this issue by freeing the cpg when exiting the function in the
>>> error/normal path.
>>>
>>> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
>>> ---
>>> V1->V2: free both cpg&clks.
>>>
>>>  drivers/clk/renesas/clk-r8a73a4.c | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>>    2 patches with the same name won't do -- you always need to include the chip name
>> part of the file name in the subject (in this case r8a73a4).
> 
> Oh, they were for multiple drivers?

   I counted 3! :-)

> I hadn't even noticed , as Gmail collapsed them all into the same thread...

   Hm, they weren't actually posted in the same thread...

> Gr{oetje,eeting}s,
> 
>                         Geert
[...]

MBR, Sergey
