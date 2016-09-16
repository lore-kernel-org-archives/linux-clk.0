Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.web.de ([217.72.192.78]:55096 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751081AbcIPGBQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 16 Sep 2016 02:01:16 -0400
Subject: Re: clk/Renesas-MSTP: Rename jump labels in cpg_mstp_attach_dev()
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <1575ddf1-bd1a-fe98-046a-a586eb30fe47@users.sourceforge.net>
 <e28d35f9-e519-5f3b-c27d-958605b5b851@users.sourceforge.net>
 <CAMuHMdVLx5fha0J4zc6J-ytK=J-12iRsaybbxo07wvPaQxTcpg@mail.gmail.com>
Cc: linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Julia Lawall <julia.lawall@lip6.fr>, linux-doc@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <e1a76426-5529-7eaa-6862-62359c699493@users.sourceforge.net>
Date: Fri, 16 Sep 2016 08:00:43 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVLx5fha0J4zc6J-ytK=J-12iRsaybbxo07wvPaQxTcpg@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

> "Choose label names which say what the goto does or why the goto exists."
> 
> I prefer the "why" over the "what".

Does your opinion indicate also that you would appreciate another adjustment
around the quoted sentence from "Chapter 7: Centralized exiting of functions"
of the document "CodingStyle"?

Would you like to achieve that the potential for confusion will be reduced
a bit more there?


> And the "indent labels with a single space" rule will be removed soon,

I am unsure on how this "story" will evolve further.

Will the indentation rules become any more precise for Linux source code?


> as there's no longer a technical reason for it after
> https://lkml.org/lkml/2016/9/7/316

The software update "Set git diff driver for C source code files" is also
interesting for current versions.

Will language-specific rules which are supported by recent Git software
influence any capabilities for the command "diff --show-c-function"?

Regards,
Markus
