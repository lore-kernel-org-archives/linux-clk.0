Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Thu, 11 Jan 2018 15:22:46 -0600
From: Rob Herring <robh@kernel.org>
To: David Lechner <david@lechnology.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mark Rutland <mark.rutland@arm.com>, Sekhar Nori <nsekhar@ti.com>,
	Kevin Hilman <khilman@kernel.org>, Adam Ford <aford173@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 09/44] dt-bindings: clock: New bindings for TI Davinci
 PSC
Message-ID: <20180111212246.kynsbe2gzbx6fzsf@rob-hp-laptop>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <1515377863-20358-10-git-send-email-david@lechnology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1515377863-20358-10-git-send-email-david@lechnology.com>
List-ID: <linux-clk.vger.kernel.org>

On Sun, Jan 07, 2018 at 08:17:08PM -0600, David Lechner wrote:
> This adds a new binding for the Power Sleep Controller (PSC) for the
> mach-davinci family of processors.
> 
> Note: Although TI Keystone has a very similar PSC, we are not using the
> existing bindings. Keystone is using a legacy one-node-per-clock binding
> (actually two nodes if you count the separate reset binding for the same
> IP block). Also, some davinci LPSCs have quirks that aren't handled by
> the keystone bindings, so we would be adding one compatible string per
> clock with quirks instead of just a new compatible string for each
> controller.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
>  .../devicetree/bindings/clock/ti/davinci/psc.txt   | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/ti/davinci/psc.txt

Reviewed-by: Rob Herring <robh@kernel.org>
