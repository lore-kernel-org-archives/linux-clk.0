Return-Path: <jdelvare@suse.de>
Date: Tue, 24 Jan 2017 13:58:36 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias
 Brugger <matthias.bgg@gmail.com>, James Liao <jamesjj.liao@mediatek.com>,
 Erin Lo <erin.lo@mediatek.com>, Stephen Boyd <sboyd@codeaurora.org>, Shunli
 Wang <shunli.wang@mediatek.com>, Michael Turquette
 <mturquette@baylibre.com>
Subject: Re: [PATCH] clk: mediatek: Fix MT2701 dependencies
Message-ID: <20170124135836.17f32ade@endymion>
In-Reply-To: <c3da261a-eb85-9b30-d5e2-05863d2efad2@suse.de>
References: <20170109113621.31d384c9@endymion>
	<c3da261a-eb85-9b30-d5e2-05863d2efad2@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hallo Andreas,

On Mon, 9 Jan 2017 21:08:50 +0100, Andreas F=C3=A4rber wrote:
> Another aspect here is that this is a 32-bit SoC but it propagates into
> the arm64 configs, so maybe (ARCH_MEDIATEK && !ARM64) || COMPILE_TEST?
>=20
> Same for mt2701 pinctrl.

I took a look and the pinctrl situation is different:

config PINCTRL_MT2701
	bool "Mediatek MT2701 pin control" if COMPILE_TEST && !MACH_MT2701
	(...)
	default MACH_MT2701

So the user will not be prompt about it on ARM64 (unless build-testing)
because MACH_MT2701 isn't set on ARM64. The only issue with this
construct is that you end up with useless symbols defined in the
configuration file (they can only be "n".) So I would argue that the
following is preferred:

config PINCTRL_MT2701
	bool "Mediatek MT2701 pin control"
	(...)
	depends on MACH_MT2701 || COMPILE_TEST
	default MACH_MT2701

And same for the other 3 PINCTRL_MT* options. Yes, that means the user
will be asked about the options on Mediatek kernels, but actually I
believe this is desirable, as advanced users should be allowed to
disable specific drivers if they know what they are doing. Other users
can just stick to the default.

--=20
Jean Delvare
SUSE L3 Support
