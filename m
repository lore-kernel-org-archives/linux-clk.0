Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 23 May 2018 12:00:12 -0500
From: Rob Herring <robh@kernel.org>
To: Lei YU <mine260309@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: aspeed: Add 24MHz fixed clock
Message-ID: <20180523170012.GA15670@rob-hp-laptop>
References: <1526633822-17138-1-git-send-email-mine260309@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1526633822-17138-1-git-send-email-mine260309@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, May 18, 2018 at 04:57:02PM +0800, Lei YU wrote:
> Add a 24MHz fixed clock.
> This clock will be used for certain devices, e.g. pwm.
> 
> Signed-off-by: Lei YU <mine260309@gmail.com>
> ---
>  drivers/clk/clk-aspeed.c                 | 9 ++++++++-
>  include/dt-bindings/clock/aspeed-clock.h | 1 +
>  2 files changed, 9 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
