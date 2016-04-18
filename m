Return-Path: <robh@kernel.org>
Date: Mon, 18 Apr 2016 12:19:27 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Kurz <akurz@blala.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
	Philippe Reynes <tremyfr@gmail.com>
Subject: Re: [PATCH 2/2] ARM: i.MX35 clk: Introduce DT include for clock
 provider
Message-ID: <20160418171927.GA26734@rob-hp-laptop>
References: <1460669450-11729-1-git-send-email-akurz@blala.de>
 <1460669450-11729-2-git-send-email-akurz@blala.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1460669450-11729-2-git-send-email-akurz@blala.de>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Apr 14, 2016 at 11:30:50PM +0200, Alexander Kurz wrote:
> Use clock defines in order to make devicetrees more human readable
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  .../devicetree/bindings/clock/imx35-clock.txt      |  93 +----

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/imx/clk-imx35.c                        | 429 ++++++++++++---------
>  include/dt-bindings/clock/imx35-clock.h            |  98 +++++
>  3 files changed, 349 insertions(+), 271 deletions(-)
>  create mode 100644 include/dt-bindings/clock/imx35-clock.h
