Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <1465870678-30128-5-git-send-email-wens@csie.org>
References: <1465870678-30128-1-git-send-email-wens@csie.org> <1465870678-30128-5-git-send-email-wens@csie.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 14 Jun 2016 10:20:40 +0800
Message-ID: <CAGb2v66_SrKjQ_t_rL68QUVZQ=8hBoCTb8tbwCeBWz84kTabcQ@mail.gmail.com>
Subject: Re: [PATCH 03/10] mfd: Add driver for X-Powers AC100 audio codec /
 RTC combo IC
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	rtc-linux@googlegroups.com, linux-kernel <linux-kernel@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jun 14, 2016 at 10:17 AM, Chen-Yu Tsai <wens@csie.org> wrote:
> The AC100 is a multifunction device with an audio codec subsystem and
> an RTC subsystem. These two subsystems share a common register space
> and host interface.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Self-NACK. A last minute fix up resulted in a compile error.

I'll send v2 later. Sorry for the noise.

Regards
ChenYu
