Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1456419926-8732-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
References: <1456419926-8732-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Date: Fri, 26 Feb 2016 10:29:26 +0100
Message-ID: <CAMuHMdXbcjuQxxkAj+dF85YerPXjQwwvNPVSMK9LXs3bL6SGiw@mail.gmail.com>
Subject: Re: [PATCH 0/3] CAN & CAN FD clk support for r8a7795 SoC
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org,
	linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Paterson <chris.paterson2@renesas.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Ramesh,

On Thu, Feb 25, 2016 at 6:05 PM, Ramesh Shanmugasundaram
<ramesh.shanmugasundaram@bp.renesas.com> wrote:
> This patch set adds CAN & CAN FD clk support for r8a7795 SoC.
>
> This set is based on linux-next repo(tag: next-20160225).
>
> Ramesh Shanmugasundaram (3):
>   clk: shmobile: r8a7795: Add CAN peripheral clock
>   clk: shmobile: r8a7795: Add CANFD clock
>   clk: shmobile: r8a7795: Add CAN FD peripheral clock
>
>  drivers/clk/shmobile/r8a7795-cpg-mssr.c | 4 ++++
>  1 file changed, 4 insertions(+)

Thank you, I will queue this next renesas-drivers, and clk-shmobile-for-v4.7.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
