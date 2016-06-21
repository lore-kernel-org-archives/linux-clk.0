Return-Path: <slemieux.tyco@gmail.com>
Return-Path: <slemieux.tyco@gmail.com>
Subject: Re: [PATCH] clk: lpc32xx: allow peripheral clock selection in
 device tree
From: Sylvain Lemieux <slemieux.tyco@gmail.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <f8778993-a393-f72a-ba76-76550a9c5bbd@mleia.com>
References: <1464982475-24738-1-git-send-email-slemieux.tyco@gmail.com>
	 <f8778993-a393-f72a-ba76-76550a9c5bbd@mleia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 21 Jun 2016 08:35:31 -0400
Message-ID: <1466512531.2114.6.camel@localhost>
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hi Vladimir,

On Tue, 2016-06-21 at 07:28 +0300, Vladimir Zapolskiy wrote:
> Hi Sylvain,
> 
> On 03.06.2016 22:34, Sylvain Lemieux wrote:
> > From: Sylvain Lemieux <slemieux@tycoint.com>
> > 
> > This patch add the support to select the peripheral clock (PERIPH)
> > as a parent clock source using the "assigned-clock-parents"
> > parameter in the device tree.
> > 
> > Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
> 
> Acked-by: Vladimir Zapolskiy <vz@mleia.com>
> 
> The change looks good, is it done to support a selection of PWM parent clocks?

Yes, this is the case.
> 
> I think it makes sense to set PERIPH clock as a default parent for both
> PWM controllers, please consider to send a DTS change.

I will do.

Thanks for the feedback,
Sylvain
