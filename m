Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: clk/Renesas-MSTP: Delete an error message for a failed memory
 allocation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa@the-dreams.de>
References: <566ABCD9.1060404@users.sourceforge.net>
 <2927869.3rNkSDiBcX@avalon>
 <bd139d45-f7c1-ac79-6b38-93b1eb1f3e9a@users.sourceforge.net>
 <64106728.50RHrbMaf7@avalon>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Julia Lawall <julia.lawall@lip6.fr>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <2b8208ee-6119-4de0-9591-1c467833d59d@users.sourceforge.net>
Date: Fri, 16 Sep 2016 07:21:12 +0200
MIME-Version: 1.0
In-Reply-To: <64106728.50RHrbMaf7@avalon>
Content-Type: text/plain; charset=windows-1252
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

>> Does this wish influence the handling of suggested changes for the source
>> file "drivers/clk/renesas/clk-mstp.c" anyhow?
>> https://patchwork.kernel.org/patch/9332363/
> 
> Yes, please submit a new version of this patch that removes all the memory 
> allocation error messages from drivers/clk/renesas/ in one go.

I find this kind of feedback a bit surprising and it seems to be promising
to increase software development in this design direction.
Have you got any corresponding scripts for the semantic patch language
prepared to make such a source code adjustment safer (and a bit more convenient
with the help of the Coccinelle software)?

I am also curious on how the change acceptance will evolve for the other
three update steps from this patch series when this one indicates further
software update opportunities already.

Regards,
Markus
