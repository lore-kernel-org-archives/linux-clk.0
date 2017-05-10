Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87a86lgagf.fsf@eliezer.anholt.net>
References: <20170508193348.30236-1-eric@anholt.net> <CACRpkdZUQX2MBiyd=m9P6HsxnNsf446RNR=R3-O_zm5GQXXOOg@mail.gmail.com>
 <87a86lgagf.fsf@eliezer.anholt.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 May 2017 14:33:11 +0200
Message-ID: <CACRpkdYJW7N7h_kmZ8hpM0srfKaxLsSuH1yxiC40zS1mCSMQ2Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/pl111: Register the clock divider and use it.
To: Eric Anholt <eric@anholt.net>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Russell King <linux@armlinux.org.uk>,
	linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, May 9, 2017 at 8:18 PM, Eric Anholt <eric@anholt.net> wrote:
> Linus Walleij <linus.walleij@linaro.org> writes:
>
>> On Mon, May 8, 2017 at 9:33 PM, Eric Anholt <eric@anholt.net> wrote:
>>
>>> This is required for the panel to work on bcm911360, where CLCDCLK is
>>> the fixed 200Mhz AXI41 clock.  The rate set is still passed up to the
>>> CLCDCLK, for platforms that have a settable rate on that one.
>>>
>>> v2: Set SET_RATE_PARENT (caught by Linus Walleij), depend on
>>>     COMMON_CLK.
>>>
>>> Signed-off-by: Eric Anholt <eric@anholt.net>
>>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Thanks.  Waiting on an ack from clock folks, then we'll be ready to go,
> I think.

Mike/Stephen?

It would be nice to have this queued in -next quite early in the v4.13
development cycle, so I can start looking into migrating the rest of the
old fbdev users to this.

BCM911360 seems like some oddity, there is not even a pictur of
it online, but I guess it's a cool little gadget :)

Yours,
Linus Walleij
