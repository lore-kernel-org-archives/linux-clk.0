Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 10 Apr 2017 15:10:56 -0500
From: Rob Herring <robh@kernel.org>
To: Alexey Firago <alexey_firago@mentor.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, marek.vasut@gmail.com,
	geert@linux-m68k.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/3] clk: vc5: Add bindings for IDT VersaClock
 5P49V5935
Message-ID: <20170410201056.y46zbg4hbdpk2rks@rob-hp-laptop>
References: <1491556344-9465-1-git-send-email-alexey_firago@mentor.com>
 <1491556344-9465-3-git-send-email-alexey_firago@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1491556344-9465-3-git-send-email-alexey_firago@mentor.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Apr 07, 2017 at 12:12:23PM +0300, Alexey Firago wrote:
> IDT VersaClock 5 5P49V5935 has 4 clock outputs, 4 fractional dividers.
> Input clock source can be taken from either integrated crystal or from
> external reference clock.
> 
> Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
> ---
>  .../devicetree/bindings/clock/idt,versaclock5.txt        | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
