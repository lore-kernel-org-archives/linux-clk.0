Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <CACRpkda1gYciHz79ZaFsQmZdq8PwxtoR2LwCO3LteCGbNQE=gA@mail.gmail.com>
References: <1458144276-31108-1-git-send-email-vishnupatekar0510@gmail.com>
	<1458144276-31108-2-git-send-email-vishnupatekar0510@gmail.com>
	<CACRpkdaFekCnRKoYQ=Fq1LT0FcH7RobwkLi_G1YfXJAb=4RTHQ@mail.gmail.com>
	<CAEzqOZugVOGarjy9NjDOhwJeU6P26Ch2aX13Tec2N0z2Gb9g7A@mail.gmail.com>
	<CACRpkda1gYciHz79ZaFsQmZdq8PwxtoR2LwCO3LteCGbNQE=gA@mail.gmail.com>
Date: Tue, 22 Mar 2016 14:16:20 +0100
Message-ID: <CACRpkda-B=dVUguBSifkV_ZxzoJwawn+X-oCPjD=r8k0yWdfSg@mail.gmail.com>
Subject: Re: [PATCH v4 01/13] pinctrl: sunxi: Add A83T R_PIO controller
From: Linus Walleij <linus.walleij@linaro.org>
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jon Corbet <corbet@lwn.net>,
	=?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Russell King - ARM Linux <linux@arm.linux.org.uk>, Emilio Lopez <emilio@elopez.com.ar>,
	Jens Kuske <jenskuske@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Reinder de Haan <patchesrdh@mveas.com>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, Mar 22, 2016 at 2:12 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Mar 17, 2016 at 4:34 PM, Vishnu Patekar
> <vishnupatekar0510@gmail.com> wrote:
>> On Thu, Mar 17, 2016 at 10:51 PM, Linus Walleij
>
>>> I think I already merged this?
>>
>> AFAIK, this one is not yet merged. At least, you did not say it's merged. :)
>
> Sorry, confused it with the plain A83T controller...

Sadly it does not apply so please rebase and resend this patch
after v4.6-rc1 is out.

Yours,
Linus Walleij
