Return-Path: <gregory.clement@free-electrons.com>
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Michael Turquette <mturquette@baylibre.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Kevin Smith <kevin.smith@elecsyscorp.com>,  "linux-clk\@vger.kernel.org" <linux-clk@vger.kernel.org>,  "Stephen Boyd" <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 1/2] clk: mvebu: Remove corediv clock from Armada XP
References: <1455136849-7888-1-git-send-email-kevin.smith@elecsyscorp.com>
	<1455209620-6125-1-git-send-email-kevin.smith@elecsyscorp.com>
	<20160218011630.2278.67415@quark.deferred.io>
	<20160218091105.4a272bf9@free-electrons.com>
Date: Thu, 18 Feb 2016 18:54:41 +0100
In-Reply-To: <20160218091105.4a272bf9@free-electrons.com> (Thomas Petazzoni's
	message of "Thu, 18 Feb 2016 09:11:05 +0100")
Message-ID: <87twl5q4ym.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,=20
=20
 On jeu., f=C3=A9vr. 18 2016, Thomas Petazzoni <thomas.petazzoni@free-elect=
rons.com> wrote:

> Hello,
>
> On Wed, 17 Feb 2016 17:16:30 -0800, Michael Turquette wrote:
>> Quoting Kevin Smith (2016-02-11 08:53:52)
>> > There is no corediv clock on Armada XP, so this is unnecessary.
>> >=20
>> > Signed-off-by: Kevin Smith <kevin.smith@elecsyscorp.com>
>> > Cc: Michael Turquette <mturquette@baylibre.com>
>> > Cc: Stephen Boyd <sboyd@codeaurora.org>
>> > Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
>> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>=20
>> Acked-by: Michael Turquette <mturquette@baylibre.com>
>>=20
>> I'm fine to take both patches through the clk tree, or to have them go
>> through arm-soc. Let me know if you have a preference.
>
> I'll let Gregory Clement answer on this one. Since there is no build
> dependency with the stuff planned in arm-soc, I believe it's fine if
> you take them, but I'll let Greg give you the final answer since he is
> taking care of the mvebu stuff going to arm-soc.

Indeed I prefer that you take them in the clock tree.

Thanks,

Gregory

>
> Thanks for the review!
>
> Thomas
> --=20
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
