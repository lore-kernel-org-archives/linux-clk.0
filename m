Return-Path: <manabian@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1440527643-2960-1-git-send-email-manabian@gmail.com>
References: <1440527643-2960-1-git-send-email-manabian@gmail.com>
Date: Mon, 19 Oct 2015 00:01:31 +0200
Message-ID: <CAGhQ9VwSdO341GukHFmNKRhCiTEL8e-Yu0140-aNWbn8X3axDQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix unused clock disabling on LPC18xx
From: Joachim  Eastwood <manabian@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Joachim Eastwood <manabian@gmail.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On 25 August 2015 at 20:34, Joachim Eastwood <manabian@gmail.com> wrote:
> I have finally managed to track down the reason for the hang that would
> occur when disabling clocks on lpc18xx under certain conditions. These
> conditions depend on boot mode used, what the boot loader does and if
> certain devices are enabled.
>
> One of reasons why it took me a while was that my primary platform was
> not affected by it and the data sheet has a rather misleading typo.
>
> The hang will occur if the boot rom/loader doesn't setup USB0 clocks
> and if certain AMBA devices are enabled (PL022 SSP and maybe others).
>
> Cause of the hang is that the CCU registers can not be accessed if the
> base (parent) clock is not enabled. To make sure the parent is running
> a check for this has been added to the is_enabled clk_ops callback.
> Since clocks in the CGU can be cascaded this check must also be added
> here.
>
> Maybe this check to see if the parent clock is running clock be added
> to the clk core and enabled with a flag(?) For now this patch set fixes
> the issue seen on lpc18xx.
>
> Changes since v2:
>  - Add clk.h to cgu since it uses clk_get_parent().
>  - Rebase on clk-next
>
> Joachim Eastwood (2):
>   clk: lpc18xx-ccu: fix potential system hang when disabling unused clocks
>   clk: lpc18xx-cgu: fix potential system hang when disabling unused clocks
>
>  drivers/clk/nxp/clk-lpc18xx-ccu.c | 14 +++++++++++++
>  drivers/clk/nxp/clk-lpc18xx-cgu.c | 43 ++++++++++++++++++++++++++++++++++++---
>  2 files changed, 54 insertions(+), 3 deletions(-)

Ping?


regards,
Joachim Eastwood
