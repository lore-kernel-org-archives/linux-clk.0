Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 7 Feb 2017 12:41:45 -0600
From: Rob Herring <robh@kernel.org>
To: Markus Mayer <code@mmayer.net>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	"Rafael J . Wysocki" <rjw@rjwysocki.net>,
	Arnd Bergmann <arnd@arndb.de>, Markus Mayer <mmayer@broadcom.com>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
	Linux Clock List <linux-clk@vger.kernel.org>,
	Power Management List <linux-pm@vger.kernel.org>,
	Device Tree List <devicetree@vger.kernel.org>,
	ARM Kernel List <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: brcm: clocks: add binding for
 brcmstb-cpu-clk-div
Message-ID: <20170207184145.32brcgfvl66p5qtm@rob-hp-laptop>
References: <20170201232638.74396-1-code@mmayer.net>
 <20170201232638.74396-2-code@mmayer.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170201232638.74396-2-code@mmayer.net>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Feb 01, 2017 at 03:26:37PM -0800, Markus Mayer wrote:
> From: Markus Mayer <mmayer@broadcom.com>
> 
> Add binding document for brcm,brcmstb-cpu-clk-div.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  .../bindings/clock/brcm,brcmstb-cpu-clk-div.txt    | 22 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,brcmstb-cpu-clk-div.txt

Acked-by: Rob Herring <robh@kernel.org>
