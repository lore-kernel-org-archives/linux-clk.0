Return-Path: <maarten@treewalker.org>
From: Maarten ter Huurne <maarten@treewalker.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Paul Cercueil <paul@crapouillou.net>, Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Paul Burton <paul.burton@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 04/15] clk: Add Ingenic jz4770 CGU driver
Date: Thu, 08 Jun 2017 10:40:05 +0200
Message-ID: <1614689.ggC5Fptfnb@hyperion>
In-Reply-To: <20170607205943.GO20170@codeaurora.org>
References: <20170607200439.24450-1-paul@crapouillou.net> <20170607200439.24450-5-paul@crapouillou.net> <20170607205943.GO20170@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Wednesday 07 June 2017 13:59:43 Stephen Boyd wrote:
> On 06/07, Paul Cercueil wrote:
> > Add support for the clocks provided by the CGU in the Ingenic JZ4770
> > SoC.
> > 
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
> 
> Signed-off chain looks odd. Sender should be last in the chain
> and first is typically author.

Paul is the main author, but one or more commits I made were squashed 
into the patch during its development.

Bye,
		Maarten
