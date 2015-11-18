Return-Path: <repk@triplefau.lt>
Date: Wed, 18 Nov 2015 20:26:14 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Eric Anholt <eric@anholt.net>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] clk: bcm2835: Add PWM clock support
Message-ID: <20151118192614.GD491@cruxbox>
References: <1447251765-16297-1-git-send-email-repk@triplefau.lt>
 <1447251765-16297-4-git-send-email-repk@triplefau.lt>
 <87bnar2m5k.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87bnar2m5k.fsf@eliezer.anholt.net>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Nov 18, 2015 at 10:32:55AM -0800, Eric Anholt wrote:
> Remi Pommarel <repk@triplefau.lt> writes:
> 
> > Register the pwm clock for bcm2835.
> >
> > Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> > ---
> >  drivers/clk/bcm/clk-bcm2835.c       | 14 ++++++++++++++
> >  include/dt-bindings/clock/bcm2835.h |  3 ++-
> >  2 files changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> > index 2b01a53..db378f3 100644
> > --- a/drivers/clk/bcm/clk-bcm2835.c
> > +++ b/drivers/clk/bcm/clk-bcm2835.c
> > @@ -39,6 +39,7 @@
> >  
> >  #include <linux/clk-provider.h>
> >  #include <linux/clkdev.h>
> > +#include <linux/clk.h>
> 
> Stray new #include?  With that dropped (assuming it's unnecessary),

Good catch, will remove this. Thanks !

> 
> Reviewed-by: Eric Anholt <eric@anholt.net>
> 

-- 
Remi Pommarel
