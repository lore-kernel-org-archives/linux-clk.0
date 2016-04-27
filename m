Return-Path: <joel.stan@gmail.com>
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <4956403.scaVRGhPEf@diego>
References: <1461225849-28074-1-git-send-email-joel@jms.id.au>
 <1461225849-28074-4-git-send-email-joel@jms.id.au> <4956403.scaVRGhPEf@diego>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Apr 2016 18:01:00 +0930
Message-ID: <CACPK8XfvLR+yZv77C0Eq=RsPOufrwvQjdPtBhnufNc=eJRLZYg@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] doc/devicetree: Add Aspeed clock bindings
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, mturquette@baylibre.com,
	sboyd@codeaurora.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Apr 21, 2016 at 8:50 PM, Heiko St=C3=BCbner <heiko@sntech.de> wrote=
:
> [+clock-related patches should include clock-maintainers and lists]

Thanks.

> Am Donnerstag, 21. April 2016, 17:34:01 schrieb Joel Stanley:
>> +For example:
>> +
>> +     clk_clkin: clk_clkin {
>> +             #clock-cells =3D <0>;
>> +             compatible =3D "fixed-clock";
>> +             clock-frequency =3D <48000000>;
>> +     };
>> +
>> +     clk_hpll: clk_hpll {
>> +             compatible =3D "aspeed,g4-hpll-clock";
>> +             #clock-cells =3D <0>;
>> +             reg =3D <0x1e6e2008 0x4>;
>> +     };
>> +
>> +     clk_apb: clk_apb@1e6e2008 {
>> +             #clock-cells =3D <0>;
>> +             compatible =3D "aspeed,g4-apb-clock";
>> +             reg =3D <0x1e6e2008 0x4>;
>> +             clocks =3D <&clk_hpll>;
>> +     };
>
> You have both the hpll and apb_clk in the same register (probably even mo=
re
> clocks?) and separate clock instances where each instance will of_iomap t=
he
> register itself (and thus multiple times in general).

Yep. I agree that's not ideal.

>
> From what I remember exposing the clock controller as one block (instead =
of
> declaring each clock individually in the dts) is still the preferred way =
but I
> don't think I can find Mike's mail from back then easily.

I can't picture how that would look. I took my lead from the moxart
clock driver; is there a better example that I should follow?

Cheers,

Joel
