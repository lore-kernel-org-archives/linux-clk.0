Return-Path: <rob@rob-hp-laptop>
From: Rob Herring <robh@kernel.org>
To: Eric Anholt <eric@anholt.net>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: bcm2835: Add bindings for the auxiliary
 peripheral clock gates.
References: <1450222559-22461-1-git-send-email-eric@anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1450222559-22461-1-git-send-email-eric@anholt.net>
Date: Fri, 18 Dec 2015 14:42:42 -0600
Message-Id: <20151219040914.119CB2C17AC@rob-hp-laptop>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Dec 15, 2015 at 03:35:57PM -0800, Eric Anholt wrote:
> These will be used for enabling UART1, SPI1, and SPI2.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---
> 
> v2: Make the binding cover both the IRQ and clock enable registers.
> 
>  .../bindings/clock/brcm,bcm2835-aux-clock.txt      | 31 ++++++++++++++++++++++
>  include/dt-bindings/clock/bcm2835-aux.h            | 17 ++++++++++++
>  2 files changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2835-aux-clock.txt
>  create mode 100644 include/dt-bindings/clock/bcm2835-aux.h

Acked-by: Rob Herring <robh@kernel.org>
