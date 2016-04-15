Return-Path: <sboyd@codeaurora.org>
Date: Fri, 15 Apr 2016 16:38:58 -0700
From: "sboyd@codeaurora.org" <sboyd@codeaurora.org>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"CARLOS.PALMINHA@synopsys.com" <CARLOS.PALMINHA@synopsys.com>,
	"Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [RESEND PATCH v4] clk/axs10x: Add I2S PLL clock driver
Message-ID: <20160415233858.GA4690@codeaurora.org>
References: <50c75be8ecab225a1dd49628a173d211a02755b2.1459791946.git.joabreu@synopsys.com>
 <1460393270.5119.20.camel@synopsys.com>
 <20160411220320.GB14441@codeaurora.org>
 <1460722116.3025.40.camel@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1460722116.3025.40.camel@synopsys.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/15, Alexey Brodkin wrote:
> Hi Stephen,
> 
> On Mon, 2016-04-11 at 15:03 -0700, sboyd@codeaurora.org wrote:
> > On 04/11, Alexey Brodkin wrote:
> > > 
> > > On Mon, 2016-04-11 at 11:41 +0100, Jose Abreu wrote:
> > > > 
> > > > + * warranty of any kind, whether express or implied.
> > > > + */
> > > > +
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/clk-provider.h>
> > > > +#include <linux/err.h>
> > > > +#include <linux/device.h>
> > > "linux/platform_device.h" includes "linux/device.h" so you may make this list of headers
> > > a little bit shorter.
> > > 
> > > > 
> > > > +#include <linux/of_address.h>
> > > > +#include <linux/slab.h>
> > > > +#include <linux/of.h>
> > > "linux/of_address.h" already includes "linux/of.h".
> > It's ok to include things twice. In fact, its better to avoid any
> > implicit includes so that if we ever want to remove includes from
> > other headers we can do so without disturbing this driver.
> 
> IMHO approach with minimal amount of headers is nice just because
> it's easier to check if everything is in place. I mean attempt to compile
> will immediately reveal a missing header.
> 
> So that's what I do - I remove as many inclusions as I may until stuff compiles.

Please don't. People try to break header includes cycles by
moving things in one header to another header, and then those
changes may need to fix random drivers because they are now
missing an implicit include they were relying on, etc.

> 
> But with approach of explicit inclusion it's much easier to include
> much more headers than really needed. The only way to figure out if header is really
> required is to manually check all used functions in the current source
> which is way too unreliable and probably nobody will do it ever anyways.
> And that's how we'll get more stale and pointless inclusions.

Sounds like a job for a script!

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
