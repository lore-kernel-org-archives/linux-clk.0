Return-Path: <andi.shyti@samsung.com>
Date: Tue, 16 Aug 2016 15:06:07 +0900
From: Andi Shyti <andi.shyti@samsung.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-clk@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: clk: update file names containing
 referenced structures
Message-id: <20160816060552.2kqetu6kgrsflvyu@samsunx.samsung>
References: 
 <CGME20160812124132epcas1p41e2e94ea2d3929882b2cb0d4ba5efb15@epcas1p4.samsung.com>
 <1471005685-505-1-git-send-email-geert+renesas@glider.be>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
In-reply-to: <1471005685-505-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Hi Geert,

> Commit 'b09d6d991' removes include/linux/clk-private.h and
> re-arranges the clock related structures contained in it in
> different files. The documentation has not been updated
> accordingly, thus it wasn't anymore consistent.
> 
> Place the structures referenced by Documentation/clk.txt in the
> correct files and update their contents to the latest status.
> 
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> [geert: Fix path to clk.c, whitespace, more clk_core, ...]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Take over from Andi,
>   - Correct path to clk.c,
>   - Drop whitespace changes,
>   - Replace clk by clk_core where appropriate,
>   - Update to_clk_gate(),
>   - Drop final reference to clk-private.h.

Thanks for taking care! Somehow it disappeared from my todo list :)

Andi
