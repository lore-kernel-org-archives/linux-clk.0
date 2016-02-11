Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1454203266-4450-2-git-send-email-vishnupatekar0510@gmail.com>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
	<1454203266-4450-2-git-send-email-vishnupatekar0510@gmail.com>
Date: Thu, 11 Feb 2016 12:59:47 +0100
Message-ID: <CACRpkdbCgOBQw28d=qc1fAURY3x8UdoWqiMtXMZ=uWLaQj-nbg@mail.gmail.com>
Subject: Re: [PATCH 01/14] pinctrl: sunxi: Add A83T R_PIO controller support
From: Linus Walleij <linus.walleij@linaro.org>
To: Vishnu Patekar <vishnupatekar0510@gmail.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jon Corbet <corbet@lwn.net>,
	=?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>,
	Russell King - ARM Linux <linux@arm.linux.org.uk>, Emilio Lopez <emilio@elopez.com.ar>,
	Jens Kuske <jenskuske@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Reinder de Haan <patchesrdh@mveas.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Sun, Jan 31, 2016 at 2:20 AM, Vishnu Patekar
<vishnupatekar0510@gmail.com> wrote:

> The A83T has R_PIO pin controller, it's same as A23, execpt A83T
> interrupt bit is 6th and A83T has one extra pin PL12.
>
> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>

Maxime, can you look at this patch?

Yours,
Linus Walleij
