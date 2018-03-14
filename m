Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXyEBaaGq8yS8Xdxj-0s-CirV3htBaVpN_oK_n9iWLArg@mail.gmail.com>
References: <1516107034-6600-1-git-send-email-fabio.estevam@nxp.com> <CAMuHMdXyEBaaGq8yS8Xdxj-0s-CirV3htBaVpN_oK_n9iWLArg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 14 Mar 2018 08:54:39 -0300
Message-ID: <CAOMZO5DjQVkQeNfz7mYQwp8HtnWqKgWvj4NKZpB77x_WJwRyPA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: Print the clock name and warning cause
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Wed, Jan 17, 2018 at 6:14 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, Jan 16, 2018 at 1:50 PM, Fabio Estevam <fabio.estevam@nxp.com> wrote:
>> When getting the clock related warnings, it is useful to know what
>> is the clock name that is causing the problem and the cause of the
>> problem.
>>
>> Add the clock name and the the warning cause to the log, so that the
>> output becomes clearer like this:
>>
>> [    2.383969] ------------[ cut here ]------------
>> [    2.388720] WARNING: CPU: 0 PID: 1 at drivers/clk/clk.c:814 clk_core_disable+0xd4/0xf8
>> [    2.396658] uart4_ipg_gate already disabled
>>
>> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Any comments, please?
