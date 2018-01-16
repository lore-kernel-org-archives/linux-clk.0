Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <ce14077b-2b8b-f8a7-2107-78b1d9dcab27@st.com>
References: <1515759368-16946-1-git-send-email-patrice.chotard@st.com>
 <1515759368-16946-5-git-send-email-patrice.chotard@st.com>
 <CACRpkdYVDpmEmrF=Zk1zX8RCRnPDieTgPuCen6KQ4ttFpAm+Yg@mail.gmail.com> <ce14077b-2b8b-f8a7-2107-78b1d9dcab27@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Jan 2018 08:38:33 +0100
Message-ID: <CACRpkdY88umqVBcFNy7Z6vgHztRr7MbAjh-AWz0nYgFXoOwCLQ@mail.gmail.com>
Subject: Re: [PATCH 04/14] mmc: mmci: Add STM32 variant
To: Patrice CHOTARD <patrice.chotard@st.com>
Cc: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Alexandre TORGUE <alexandre.torgue@st.com>, linux-mmc <linux-mmc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Andrea Merello <andrea.merello@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jan 15, 2018 at 6:17 PM, Patrice CHOTARD <patrice.chotard@st.com> wrote:

>>> +       {
>>> +               .id     = 0x00880180,
>>> +               .mask   = 0x00ffffff,
>>> +               .data   = &variant_stm32,
>>> +       },
>>
>> Since ux500 was 480180 I wonder what variants 5,6,7 are...
>
> What is the rule to define the id ?

These four bits mean "revision".

The number comes from hardware, so the ST ASIC department
has some person who is responsible for revising the VHDL or
Verilog code that this hardware is compiled from, and that person
is bumping the version.

Theoretically it is a "company function" or something bureaucratic
like that updating the hardware so I guess it could be several
people following procedure who have updated this number in the
hardware over the years.

But I bet it is a single person in Grenoble who has been doing
the MMC/SD block since it appeared.

Yours,
Linus Walleij
