Return-Path: <vishnupatekar0510@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160202131947.GS4652@lukather>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-7-git-send-email-vishnupatekar0510@gmail.com> <20160202131947.GS4652@lukather>
From: Vishnu Patekar <vishnupatekar0510@gmail.com>
Date: Thu, 4 Feb 2016 16:51:06 +0800
Message-ID: <CAEzqOZvcy58T_uxvymGxuQXh_Goj3yHmgkmL4VL+x2_bycMgNg@mail.gmail.com>
Subject: Re: [PATCH 06/14] ARM: dts: sun8i-a83t: Correct low speed oscillator clocks
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	"pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>,
	"linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, Emilio Lopez <emilio@elopez.com.ar>,
	Jens Kuske <jenskuske@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Reinder de Haan <patchesrdh@mveas.com>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hello Maxime,


On Tue, Feb 2, 2016 at 9:19 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Sun, Jan 31, 2016 at 09:20:58AM +0800, Vishnu Patekar wrote:
>> From: Chen-Yu Tsai <wens@csie.org>
>>
>> The A83T does not have a 32.768 kHz low speed oscillator, either as
>> an external crystal or input. It has a 16 MHz RC-based (inaccurate)
>> internal oscillator, which is then divided by 512 for a clock close
>> to 32 kHz.
>>
>> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>
> You should have your SoB here.
>
> Is it ok to add it?
Yes, please add.
>
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
