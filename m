Return-Path: <slash.tmp@free.fr>
Subject: Re: [PATCH v3] clk: tango4: improve clkgen driver
To: Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk <linux-clk@vger.kernel.org>
References: <56BE0F25.2040909@free.fr> <20160225220803.GK4847@codeaurora.org>
 <56D066B1.7000808@free.fr> <57023205.6050903@free.fr>
From: Mason <slash.tmp@free.fr>
Message-ID: <570EAFC0.7030705@free.fr>
Date: Wed, 13 Apr 2016 22:44:48 +0200
MIME-Version: 1.0
In-Reply-To: <57023205.6050903@free.fr>
Content-Type: text/plain; charset=ISO-8859-15
List-ID: <linux-clk.vger.kernel.org>

On 04/04/2016 11:21, Mason wrote:

> Add support for USB and SDIO clocks.
> Report unsupported setups and panic.
> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---
>  drivers/clk/clk-tango4.c | 73 +++++++++++++++++++++++++++++++-----------------
>  1 file changed, 48 insertions(+), 25 deletions(-)

Are there rough edges remaining with this patch?

Regards.
