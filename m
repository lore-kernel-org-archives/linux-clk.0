Return-Path: <inguin@gmx.de>
Subject: Re: [PATCH v2] clk: at91: utmi: set the mainck rate
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, mturquette@baylibre.com,
 sboyd@codeaurora.org, nicolas.ferre@microchip.com,
 alexandre.belloni@free-electrons.com, linux-kernel@vger.kernel.org
References: <20170904095226.29336-1-ludovic.desroches@microchip.com>
From: Ingo van Lil <inguin@gmx.de>
Message-ID: <cc938b2c-1cb7-f7ad-1336-dbb01b2aec9c@gmx.de>
Date: Mon, 4 Sep 2017 19:53:57 +0200
MIME-Version: 1.0
In-Reply-To: <20170904095226.29336-1-ludovic.desroches@microchip.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 09/04/2017 11:52 AM, Ludovic Desroches wrote:

> +	/* SFR node missing is not necessarily an issue. */
> +	regmap_sfr = syscon_regmap_lookup_by_compatible("atmel,sama5d2-sfr");
> +	if (IS_ERR(regmap_sfr))
> +		regmap_sfr = NULL;

What about SAMA5D3? That chip has an UTMICKTRIM register, too (SAMA5D4
doesn't, though).

Otherwise the patch looks good and works fine on both my boards (SAMA5D2
16MHz and SAMA5D3 12MHz).

Regards,
Ingo
