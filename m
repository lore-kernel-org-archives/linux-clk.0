Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20160211151246.GO31506@lukather>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
	<1454203266-4450-2-git-send-email-vishnupatekar0510@gmail.com>
	<CACRpkdbCgOBQw28d=qc1fAURY3x8UdoWqiMtXMZ=uWLaQj-nbg@mail.gmail.com>
	<20160211123648.GN31506@lukather>
	<CACRpkdaGZ4-S1A9zUUaBXXEazyJf_uZ4ESiBhw-CpozXMxfDHg@mail.gmail.com>
	<20160211151246.GO31506@lukather>
Date: Tue, 16 Feb 2016 00:23:37 +0100
Message-ID: <CACRpkdb7=x2bJP1nXpF2bP3U0t+NUHiuw_aeTAhbR8OXOrHn6A@mail.gmail.com>
Subject: Re: [PATCH 01/14] pinctrl: sunxi: Add A83T R_PIO controller support
From: Linus Walleij <linus.walleij@linaro.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Vishnu Patekar <vishnupatekar0510@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Jon Corbet <corbet@lwn.net>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>,
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

On Thu, Feb 11, 2016 at 4:12 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Thu, Feb 11, 2016 at 02:47:57PM +0100, Linus Walleij wrote:

>> Can you guys supply a MAINTAINERS entry for the sunxi
>> stuff?
>
> We have one, and Chen-Yu is listed as co-maintainer:
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/MAINTAINERS#n911

Modified request:
can you put in F: wildcards there to match the files pertaining to
the sunxi platform, so that scripts/find-maintainer.pl finds them.

Yours,
Linus Walleij
