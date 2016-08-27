Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20160825200632.GQ19826@codeaurora.org>
References: <1471857574-13125-1-git-send-email-linus.walleij@linaro.org>
 <1471857574-13125-3-git-send-email-linus.walleij@linaro.org> <20160825200632.GQ19826@codeaurora.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 27 Aug 2016 14:02:39 +0200
Message-ID: <CACRpkdZkzz_TTnw1wYwLdc__SRh_-wvAPgnhPKcV18ZKd4tQcg@mail.gmail.com>
Subject: Re: [PATCH 3/3 v2] clk: versatile/icst: support for AP baseboard clocks
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
	Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Aug 25, 2016 at 10:06 PM, Stephen Boyd <sboyd@codeaurora.org> wrote=
:
> On 08/22, Linus Walleij wrote:
>> @@ -143,6 +180,17 @@ static int vco_set(struct clk_icst *icst, struct ic=
st_vco vco)
>>               if (vco.r !=3D 22)
>>                       pr_err("ICST error: tried to use RDW !=3D 22\n");
>>               break;
>> +     case ICST_INTEGRATOR_AP_SYS:
>> +             mask =3D INTEGRATOR_AP_SYS_BITS;
>> +             val &=3D ~0xFF; /* Uses 8 bits */
>
> drivers/clk/versatile/clk-icst.c: In function =E2=80=98icst_set_rate=E2=
=80=99:
> drivers/clk/versatile/clk-icst.c:185:7: warning: =E2=80=98val=E2=80=99 ma=
y be used uninitialized in this function [-Wuninitialized]

Sorry, a dangling oneliner. Resent only this patch as v3.

Yours,
Linus Walleij
