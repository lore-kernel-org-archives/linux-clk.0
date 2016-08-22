Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20160812182036.GA26431@rob-hp-laptop>
References: <1470820172-12840-1-git-send-email-linus.walleij@linaro.org> <20160812182036.GA26431@rob-hp-laptop>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 Aug 2016 11:05:54 +0200
Message-ID: <CACRpkdbtdTqmTu1A_BZy9zmcSxnasOkCFWRBmAk1jE_kGZxGOg@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: versatile add DT bindings for the ICST CM variants
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, Aug 12, 2016 at 8:20 PM, Rob Herring <robh@kernel.org> wrote:

[Fixed spelling mistakes]

>> +The ARM Integrator/AP and Integrator/CP core modules and baseboard contain
>> +special versions of the serial interface that only connects the low 8 bits
>> +of the VDW (missing one bit), hardwires RDW to different values and sometimes
>> +als hardwire the output divider. They therefore have special compatible
>
> s/als/also/
>
> I don't see what is special here. Different h/w is supposed to have
> different compatible strings. I'd word this more, so that you don't have
> to change it again if another compatible string is added.

OK I'll try to come up with something to that effect, the reason it was
not like that from the beginning is my universe is expanding and step
by step gaining knowledge of how this thing has been used by ARM.

I'll try to write something generic about hardwired divisor lines and
compatible strings telling how they are wired.

Yours,
Linus Walleij
