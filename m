Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 14 Aug 2018 10:16:50 -0600
From: Rob Herring <robh@kernel.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
	Julien Su <juliensu@mxic.com.tw>,
	Mason Yang <masonccyang@mxic.com.tw>, zhengxunli@mxic.com.tw,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 2/2] dt-bindings: clock: Add bindings for the Clocking
 Wizard IP
Message-ID: <20180814161650.GA22207@rob-hp-laptop>
References: <20180801081950.10497-1-boris.brezillon@bootlin.com>
 <20180801081950.10497-2-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180801081950.10497-2-boris.brezillon@bootlin.com>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Aug 01, 2018 at 10:19:50AM +0200, Boris Brezillon wrote:
> Document Xilinx Clocking Wizard bindings.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  .../devicetree/bindings/clock/xlnx,clk-wizard.txt  | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clk-wizard.txt

Reviewed-by: Rob Herring <robh@kernel.org>
