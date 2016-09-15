Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <50646b53-663f-f77f-a79e-2422b5687688@users.sourceforge.net>
References: <566ABCD9.1060404@users.sourceforge.net> <1575ddf1-bd1a-fe98-046a-a586eb30fe47@users.sourceforge.net>
 <b945de99-815a-b380-e13c-17b01e0febad@users.sourceforge.net>
 <CAMuHMdX=We-N--Fc0KWD_p8AmnBMYDW9b560VGKi+SZ5k85e9A@mail.gmail.com> <50646b53-663f-f77f-a79e-2422b5687688@users.sourceforge.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Sep 2016 22:48:06 +0200
Message-ID: <CAMuHMdWgK7HSqL+XWdrzDZkvmg5rb3MtykYNkS1amm5HgnOBAg@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk/Renesas-MSTP: Less function calls in
 cpg_mstp_clocks_init() after error detection
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk <linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michael Turquette <mturquette@baylibre.com>, Simon Horman <horms+renesas@verge.net.au>,
	Stephen Boyd <sboyd@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Sep 15, 2016 at 10:40 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>>> * Split a condition check for memory allocation failures so that
>>>   each pointer from these function calls will be checked immediately.
>>>
>>>   See also background information:
>>>   Topic "CWE-754: Improper check for unusual or exceptional conditions"
>>>   Link: https://cwe.mitre.org/data/definitions/754.html
>>>
>>> * Return directly after a call of the function "kzalloc" failed
>>>   at the beginning.
>>
>> Both calls are already close together.
>
> Can it be that an other software development concern is eventually
> overlooked because of this "neighbourship" (or is categorised with
> a lower priority)?
>
> I suggest to reconsider this design detail if it is really acceptable
> for the safe implementation of such a software module.
>
> * How much will it matter in general that one function call was performed
>   in this use case without checking its return values immediately?
>
> * Should it usually be determined quicker if a required resource like
>   memory could be acquired before trying the next allocation?

Note that if memory allocation fails in this driver, the system won't
boot at all. So even not checking for allocation failures at all could be
acceptable.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
