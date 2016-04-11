Return-Path: <sboyd@codeaurora.org>
Date: Mon, 11 Apr 2016 15:03:20 -0700
From: "sboyd@codeaurora.org" <sboyd@codeaurora.org>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	Carlos Palminha <CARLOS.PALMINHA@synopsys.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	Vineet Gupta <Vineet.Gupta1@synopsys.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [RESEND PATCH v4] clk/axs10x: Add I2S PLL clock driver
Message-ID: <20160411220320.GB14441@codeaurora.org>
References: <50c75be8ecab225a1dd49628a173d211a02755b2.1459791946.git.joabreu@synopsys.com>
 <1460393270.5119.20.camel@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1460393270.5119.20.camel@synopsys.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/11, Alexey Brodkin wrote:
> On Mon, 2016-04-11 at 11:41 +0100, Jose Abreu wrote:
> > + * warranty of any kind, whether express or implied.
> > + */
> > +
> > +#include <linux/platform_device.h>
> > +#include <linux/module.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/err.h>
> > +#include <linux/device.h>
> 
> "linux/platform_device.h" includes "linux/device.h" so you may make this list of headers
> a little bit shorter.
> 
> > +#include <linux/of_address.h>
> > +#include <linux/slab.h>
> > +#include <linux/of.h>
> 
> "linux/of_address.h" already includes "linux/of.h".

It's ok to include things twice. In fact, its better to avoid any
implicit includes so that if we ever want to remove includes from
other headers we can do so without disturbing this driver.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
