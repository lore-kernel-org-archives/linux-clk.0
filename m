Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <152106382662.179530.17640698731932597086@swboyd.mtv.corp.google.com>
References: <1519985872-3809-1-git-send-email-geert+renesas@glider.be> <152106382662.179530.17640698731932597086@swboyd.mtv.corp.google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Mar 2018 10:27:33 +0100
Message-ID: <CAMuHMdVPXzJcJLkdH2+Qzz11dT95=3FrgZUR9n4Co7mC=7vEig@mail.gmail.com>
Subject: Re: [git pull] clk: renesas: Updates for v4.17
To: Stephen Boyd <sboyd@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Wed, Mar 14, 2018 at 10:43 PM, Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Geert Uytterhoeven (2018-03-02 02:17:52)
>> The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:
>>
>>   Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)
>>
>> are available in the git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.17-tag1
>>
>> for you to fetch changes up to 7ce36da900c0a2ff4777d9ba51c4f1cb74205463:
>>
>>   clk: renesas: cpg-mssr: Add support for R-Car M3-N (2018-02-26 09:13:29 +0100)
>>
>> ----------------------------------------------------------------
>> clk: renesas: Updates for v4.17
>>
>>   - Update legacy DT Kconfig default,
>>   - Add support for CPU (Z/Z2) clocks on R-Car H3 and M3-W,
>>   - Add support for the watchdog module clocks on R-Car Gen2 and RZ/G1,
>>   - Add support for the new R-Car M3-N and V3H SoCs.
>>
>> Thanks for pulling!
>>
>
> Thanks. Pulled into clk-next.

Thanks!

> Did you need to use clk_readl() or was it just copy-paste? I hope we can
> get rid of that function at some point.

That's an oversight. I will get rid of them in the second pull request
for v4.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
