Return-Path: <joel.stan@gmail.com>
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <1506344081.30138.32.camel@aj.id.au>
References: <20170921042641.7326-1-joel@jms.id.au> <20170921042641.7326-6-joel@jms.id.au>
 <1506344081.30138.32.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Sep 2017 16:13:38 +1000
Message-ID: <CACPK8Xf6_hVgzakTYUrTND52fAeJrEi92Q+mdwOKjwACVLqN6Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: aspeed: Add reset controller
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>,
	Rick Altherr <raltherr@google.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Mon, Sep 25, 2017 at 10:54 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 2017-09-21 at 13:56 +0930, Joel Stanley wrote:
>> +static const u8 aspeed_resets[] = {
>> +     25, /* x-dma */
>> +     24, /* mctp */
>> +     23, /* adc */
>> +     22, /* jtag-master */
>> +     18, /* mic */
>> +      9, /* pwm */
>> +      8, /* pci-vga */
>> +      2, /* i2c */
>> +      1, /* ahb */
>
> Bit of a nit, but given you define macros for the indices, maybe use designated
> initialisers and drop the comments.

Done. And that way I'd notice that I missed the define for the ADC :)

Cheers,

Joel
