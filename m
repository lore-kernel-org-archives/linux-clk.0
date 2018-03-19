Return-Path: <jeffy.chen@rock-chips.com>
Message-ID: <5AAF35A8.3040107@rock-chips.com>
Date: Mon, 19 Mar 2018 11:59:36 +0800
From: JeffyChen <jeffy.chen@rock-chips.com>
MIME-Version: 1.0
To: Vladimir Zapolskiy <vz@mleia.com>, linux-kernel@vger.kernel.org,
 broonie@kernel.org, alexandre.belloni@bootlin.com
CC: Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
 Joseph Lo <josephl@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 lee.jones@linaro.org, Emil Renner Berthing <kernel@esmil.dk>,
 Heiko Stuebner <heiko@sntech.de>,
 Brian Norris <briannorris@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 linux-rockchip@lists.infradead.org,
 Kate Stewart <kstewart@linuxfoundation.org>,
 linux-input@vger.kernel.org, Will Deacon <will.deacon@arm.com>,
 Matthias Kaehlcke <mka@chromium.org>,
 devicetree@vger.kernel.org, stephen lu <lumotuwe@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arvind Yadav <arvind.yadav.cs@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@st.com>, linux-clk@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v5 3/4] clk: lpc32xx: Set name of regmap_config
References: <20180312095142.30854-1-jeffy.chen@rock-chips.com> <20180312095142.30854-4-jeffy.chen@rock-chips.com> <23a9cbf8-9b1d-f7ec-b980-a16c9b2c4d84@mleia.com>
In-Reply-To: <23a9cbf8-9b1d-f7ec-b980-a16c9b2c4d84@mleia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Vladimir,

On 03/19/2018 05:57 AM, Vladimir Zapolskiy wrote:
>> >  static struct regmap_config lpc32xx_scb_regmap_config = {
>> >+	.name = "lpc32xx-scb",
> please rename it to "scb", LPC32xx SoC name is already known from the context.
>
> When it's done, feel free to add to the next version my
>
> Acked-by: Vladimir Zapolskiy<vz@mleia.com>
>

ok, will do, thanks:)
