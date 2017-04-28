Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:35089 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424320AbdD1H2X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Apr 2017 03:28:23 -0400
MIME-Version: 1.0
In-Reply-To: <20170428051430.GB18349@verge.net.au>
References: <1493141785-29117-1-git-send-email-geert+renesas@glider.be>
 <20170426071305.GC25517@verge.net.au> <20170426073418.GE25517@verge.net.au>
 <CAMuHMdXJVbBCsFPvYRMPktW1cG7Qm-7fBxSAqcaG-5V9gw0tnQ@mail.gmail.com> <20170428051430.GB18349@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Apr 2017 09:28:20 +0200
Message-ID: <CAMuHMdV3jCudFEfRMseDf_efdEPCKMKV02TVEvq5SKfaFY45hg@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: Provide dummy rcar_rst_read_mode_pins() for compile-testing
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Simon,

On Fri, Apr 28, 2017 at 7:14 AM, Simon Horman <horms@verge.net.au> wrote:
> On Wed, Apr 26, 2017 at 02:35:58PM +0200, Geert Uytterhoeven wrote:
>> On Wed, Apr 26, 2017 at 9:34 AM, Simon Horman <horms@verge.net.au> wrote:
>> > On Wed, Apr 26, 2017 at 09:13:06AM +0200, Simon Horman wrote:
>> >> On Tue, Apr 25, 2017 at 07:36:25PM +0200, Geert Uytterhoeven wrote:
>> >> > If the R-Car RST driver is not included, compile-testing R-Car clock
>> >> > drivers fails with a link error:
>> >> >
>> >> >     undefined reference to `rcar_rst_read_mode_pins'
>> >> >
>> >> > To fix this, provide a dummy version.  Use the exact same test logic as
>> >> > in drivers/soc/renesas/Makefile, as there is no Kconfig symbol (yet) to
>> >> > control compilation of the R-Car RST driver.
>> >>
>> >> Adding a Kconfig symbol would be a bit cleaner IMHO.
>> >
>> > I now see you are doing so in other patches :)
>>
>> Indeed. I went with this quick fix, as drivers/soc/renesas doesn't have
>> a Kconfig file yet, and introducing a Kconfig symbol would thus be more
>> intrusive.
>
> Thanks. Given that it doesn't appear that the problem resolved by this fix
> manifests at this time I have queued it up for v4.13 rather than as a fix
> for v4.12. Let me know if you'd like me to revisit that decision.

I had hoped you could still queue it as a fix for v4.12...

This is one of the blockers for enabling compile-testing of the R-Car clock
drivers in v4.13.  Of course some of the other blockers may not make v4.12
neither.

Instead of  postponing it to v4.13, you could as well drop it, and wait for
the better solution in "[RFC] soc: renesas: Rework Kconfig and Makefile
logic".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
