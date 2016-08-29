Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20160829174940.GC19826@codeaurora.org>
References: <1472299279-27560-1-git-send-email-linus.walleij@linaro.org> <20160829174940.GC19826@codeaurora.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 29 Aug 2016 20:33:49 +0200
Message-ID: <CACRpkdYZiFhGV5sOvoXyHAYfx5kPsE_KPPL8XWuYd3XQ=-dYEw@mail.gmail.com>
Subject: Re: [PATCH 3/3 v3] clk: versatile/icst: support for AP baseboard clocks
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
	Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, Aug 29, 2016 at 7:49 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 08/27, Linus Walleij wrote:
>> @@ -143,6 +180,16 @@ static int vco_set(struct clk_icst *icst, struct ic=
st_vco vco)
>>               if (vco.r !=3D 22)
>>                       pr_err("ICST error: tried to use RDW !=3D 22\n");
>>               break;
>> +     case ICST_INTEGRATOR_AP_SYS:
>> +             mask =3D INTEGRATOR_AP_SYS_BITS;
>> +             val |=3D vco.v & 0xFF;
>
> drivers/clk/versatile/clk-icst.c: In function =E2=80=98icst_set_rate=E2=
=80=99:
> drivers/clk/versatile/clk-icst.c:185:7: warning: =E2=80=98val=E2=80=99 ma=
y be used uninitialized in this function [-Wuninitialized]
> drivers/clk/versatile/clk-icst.c:168:6: note: =E2=80=98val=E2=80=99 was d=
eclared here
>
>
> I assume it should just be val =3D instead?

Yeah :/

My biggest worry right now is why I'm not seeing these warnings.

I'll figure out how to get them and fix it.

Yours,
Linus Walleij
