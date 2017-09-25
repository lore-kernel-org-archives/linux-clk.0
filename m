Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <7fa950f5-01b5-fa9b-e4e9-4ed944f46e32@users.sourceforge.net>
References: <566ABCD9.1060404@users.sourceforge.net> <2927869.3rNkSDiBcX@avalon>
 <bd139d45-f7c1-ac79-6b38-93b1eb1f3e9a@users.sourceforge.net>
 <64106728.50RHrbMaf7@avalon> <7fa950f5-01b5-fa9b-e4e9-4ed944f46e32@users.sourceforge.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Sep 2017 12:02:04 +0200
Message-ID: <CAMuHMdVg5NdPAPqgBcbbwuLKsQVsg68+MOXN6U+72HZ8W3HETA@mail.gmail.com>
Subject: Re: [PATCH] clk/Renesas: Delete an error message for a failed memory
 allocation in three functions
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michael Turquette <mturquette@baylibre.com>, Simon Horman <horms+renesas@verge.net.au>,
	Stephen Boyd <sboyd@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Markus,

On Mon, Sep 25, 2017 at 10:34 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 25 Sep 2017 10:10:51 +0200
>
> The script "checkpatch.pl" pointed information out like the following.
>
> WARNING: Possible unnecessary 'out of memory' message
>
> Thus fix affected source code places.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.15, split in two commits:
  - clk: renesas: rcar-gen2: Delete error message for failed memory allocation
  - clk: renesas: mstp: Delete error messages for failed memory allocations

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
