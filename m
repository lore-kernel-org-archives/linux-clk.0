Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <SG2PR06MB0919563D4CD793A18AC3D839D8DE0@SG2PR06MB0919.apcprd06.prod.outlook.com>
References: <1454322472-6696-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<CAMuHMdX7HBvGzeqsCVw6bUXBvXa5uMdiZ8GJD75bGezVz2WOxA@mail.gmail.com>
	<SG2PR06MB0919563D4CD793A18AC3D839D8DE0@SG2PR06MB0919.apcprd06.prod.outlook.com>
Date: Mon, 1 Feb 2016 12:15:42 +0100
Message-ID: <CAMuHMdUr-nrP3z4qXiSwnwP-Exjcy3=fOh0NVgPBDmuF94fAQw@mail.gmail.com>
Subject: Re: [PATCH] clk: shmobile: r8a7795: Add USB-DMAC clocks
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Shimoda-san,

On Mon, Feb 1, 2016 at 12:06 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>> From: geert.uytterhoeven@gmail.com [mailto:geert.uytterhoeven@gmail.com] On Behalf Of Geert Uytterhoeven
>> > --- a/drivers/clk/shmobile/r8a7795-cpg-mssr.c
>> > +++ b/drivers/clk/shmobile/r8a7795-cpg-mssr.c
>> > @@ -124,6 +124,8 @@ static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
>> >         DEF_MOD("pcie0",                 319,   R8A7795_CLK_S3D1),
>> >         DEF_MOD("usb3-if1",              327,   R8A7795_CLK_S3D1),
>> >         DEF_MOD("usb3-if0",              328,   R8A7795_CLK_S3D1),
>> > +       DEF_MOD("usb-dmac0",             330,   R8A7795_CLK_S3D2),
>> > +       DEF_MOD("usb-dmac1",             331,   R8A7795_CLK_S3D2),
>>
>> The datasheet is not very clear about whether the module clock is based of s3d1
>> (266 MHz) or s3d2 (133 MHz), but given the comment "... it is recommended to
>> allow several tens of clocks if operating at 260 MHz ..." in section 75.2.2
>> "DMA0/1 Software Reset Register" of the datasheet, I'm inclined to believe s3d1
>> would be correct.
>
> According to the HW team (in case of gen2 though):
>
> In gen2 (In gen3 I assumed)
>  ZS (S3D1)     : For using DRAM access
>  HP (S3D2)     : For using register access
>  48MHz (50MHz) : For using USB transfer
>
> So, I also think that s3d1 would be correct.
> What do you think?

Thanks, that makes two of us :-)
Hence please use s3d1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
