Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:36568 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753320AbdDEHJW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Apr 2017 03:09:22 -0400
MIME-Version: 1.0
In-Reply-To: <20170405013815.GK18246@codeaurora.org>
References: <1491214089-14093-1-git-send-email-geert+renesas@glider.be> <20170405013815.GK18246@codeaurora.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Apr 2017 09:09:20 +0200
Message-ID: <CAMuHMdWSLKjcyQP25mPCwn8EV1xzAyC=AipT8E0DbeVoEeemAw@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm: dts: renesas: Drop _clk suffix from clock node names
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Wed, Apr 5, 2017 at 3:38 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 04/03, Geert Uytterhoeven wrote:
>> The current practice is to not add _clk suffixes to clock node names in
>> DT, as these names are used as the actual clock names.
>>
>> This patch removes the remaining offenders in the various Renesas DTSes.
>
> This changes the names in the clk framework too though? If you're
> ok with that I'm ok too.

Yes, that's my main motivation doing this: it's a bit silly to have some clocks
show up in /sys/kernel/debug/clk/clk_summary with a "_clk" suffix.

> Acked-by: Stephen Boyd <sboyd@codeaurora.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
