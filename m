Return-Path: <marek.vasut@gmail.com>
Return-Path: <marek.vasut@gmail.com>
Subject: Re: [PATCH V2 1/2] clk: vc5: Add bindings for IDT VersaClock
 5P49V5923 and 5P49V5933
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20170112010324.28068-1-marek.vasut@gmail.com>
 <CAMuHMdWTGyRc82fPZ-k28=-2PzpkQooKPcB9OF0BctDuw7qbZA@mail.gmail.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <3859b9ac-17c9-15a4-7362-e56997d67e62@gmail.com>
Date: Thu, 12 Jan 2017 14:47:00 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWTGyRc82fPZ-k28=-2PzpkQooKPcB9OF0BctDuw7qbZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 01/12/2017 09:25 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi!

> On Thu, Jan 12, 2017 at 2:03 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> Add bindings for IDT VersaClock 5 5P49V5923 and 5P49V5933 chips.
>> These are I2C clock generators with optional clock source from
>> either XTal or dedicated clock generator and, depending on the
>> model, two or more clock outputs.
>>
>> Signed-off-by: Marek Vasut <marek.vasut@gmail.com>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Stephen Boyd <sboyd@codeaurora.org>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>> V2: Add mapping between the clock specifier and physical pins of the chip
>> ---
>>  .../devicetree/bindings/clock/idt,versaclock5.txt  | 65 ++++++++++++++++++++++
>>  1 file changed, 65 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/idt,versaclock5.txt
>>
>> diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
>> new file mode 100644
>> index 000000000000..87e9c47a89a3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
>> @@ -0,0 +1,65 @@
> 
>> +==Mapping between clock specifier and physical pins==
>> +
>> +When referencing the provided clock in the DT using phandle and
>> +clock specifier, the following mapping applies:
>> +
>> +5P49V5923:
>> +       0 -- OUT0_SEL_I2CB
>> +       1 -- OUT1
>> +       2 -- OUT2
>> +
>> +5P49V5933:
>> +       0 -- OUT0_SEL_I2CB
>> +       1 -- OUT1
>> +       2 -- OUT4
> 
> I'm a bit puzzled by the use of "OUT4".

You're not the only one, but at least you're not the one banging your
head against the desk while glaring into the scope and seeing nonsense
on one of the channels :-)

> According to the datasheets, both '5923 and '5933 have OUT1 and OUT2.
> The '5933 datasheet has a single reference to OUT4 ("The OUT1 to OUT4 clock
> outputs"), but that may be a copy and paste error from a datasheet for a part
> with 4 outputs.

The physical VC5 5P49V5933 devkit has OUT0 , OUT1 and OUT4 . At first, I
thought it was laziness in the PCB design -- because there are VC5s with
up to 4 outputs and the devkit PCB is identical for all of them,
except some components are not populated -- but that is not correct.

They actually use (inside of the chip) output1 with fod1 and output4
with fod4 for the 5933 and they use output1 with fod1 and output2 with
fod2 on the 5923 . This became obvious after I took a look into the IDT
clock commander software, which has a visualization of the chip and
there are two "unpopulated" positions between out1 and out4 in case of
the 5933 while on 5923 the unpopulated positions are below out2 .

I have no explanation as for why they did this, it's just unsystematic.

> Apart from that:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 


-- 
Best regards,
Marek Vasut
