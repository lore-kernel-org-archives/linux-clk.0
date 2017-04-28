Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 28 Apr 2017 14:42:16 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/10] clk: renesas: cpg-mssr: Document R-Car Gen2 support
Message-ID: <20170428194216.zqngpd32zqmuriwz@rob-hp-laptop>
References: <1493139200-27396-1-git-send-email-geert+renesas@glider.be>
 <1493139200-27396-2-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1493139200-27396-2-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Apr 25, 2017 at 06:53:11PM +0200, Geert Uytterhoeven wrote:
> Document use of the Renesas Clock Pulse Generator / Module Standby and
> Software Reset DT Bindings for various member of the R-Car Gen2 family
> (H2, M2-W, V2H, M2-N, and E2).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
