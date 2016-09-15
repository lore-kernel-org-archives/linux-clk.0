Return-Path: <elfring@users.sourceforge.net>
Subject: Re: clk/Renesas-MSTP: Delete an error message for a failed memory
 allocation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <04cf79a5-df91-d8c2-83b2-ad9e9130ee7a@users.sourceforge.net>
 <CAMuHMdVtvg99JY=_+Wj7jpd82=5rKDKOVxg0TYW3wUQsUQzAOA@mail.gmail.com>
 <2927869.3rNkSDiBcX@avalon>
Cc: linux-clk <linux-clk@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Simon Horman <horms+renesas@verge.net.au>,
 Stephen Boyd <sboyd@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 Julia Lawall <julia.lawall@lip6.fr>, Wolfram Sang <wsa@the-dreams.de>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <bd139d45-f7c1-ac79-6b38-93b1eb1f3e9a@users.sourceforge.net>
Date: Thu, 15 Sep 2016 22:17:41 +0200
MIME-Version: 1.0
In-Reply-To: <2927869.3rNkSDiBcX@avalon>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

>>> Omit an extra message for a memory allocation failure in this function.
>>>
>>> Link:
>>> http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refacto
>>> r_Strings-WSang_0.pdf
>>>
>>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> There are two other memory allocation failures printed by drivers in the same 
> directory that, you'll get my ack

Does this kind of feedback express a general acceptance for the deletion
of similar error messages?


> if you extend this patch to remove the three messages in one go.

Does this wish influence the handling of suggested changes for the source file
"drivers/clk/renesas/clk-mstp.c" anyhow?
https://patchwork.kernel.org/patch/9332363/

Regards,
Markus
