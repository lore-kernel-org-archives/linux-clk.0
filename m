Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 30 Jan 2017 13:56:35 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: renesas: cpg-mssr: Document
 reset control support
Message-ID: <20170130195635.drveyzxfqrvj5fnh@rob-hp-laptop>
References: <1485335703-27184-1-git-send-email-geert+renesas@glider.be>
 <1485335703-27184-2-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1485335703-27184-2-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jan 25, 2017 at 10:15:00AM +0100, Geert Uytterhoeven wrote:
> Document properties needed to use the Reset Control feature of the
> Renesas Clock Pulse Generator / Module Standby and Software Reset
> module.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Change oneline summary to refer to dt-bindings.
> ---
>  Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
