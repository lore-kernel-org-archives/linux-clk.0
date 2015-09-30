Return-Path: <alexandre.belloni@free-electrons.com>
Date: Wed, 30 Sep 2015 18:59:58 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Felipe Balbi <balbi@ti.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 15/16] usb: gadget: atmel: access the PMC using regmap
Message-ID: <20150930165958.GF3639@piout.net>
References: <1443629469-15086-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1443629469-15086-16-git-send-email-alexandre.belloni@free-electrons.com>
 <20150930163102.GM32625@saruman.tx.rr.com>
 <20150930165917.GE3639@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20150930165917.GE3639@piout.net>
List-ID: <linux-clk.vger.kernel.org>

On 30/09/2015 at 18:59:17 +0200, Alexandre Belloni wrote :
> Hi,
> 
> On 30/09/2015 at 11:31:02 -0500, Felipe Balbi wrote :
> > On Wed, Sep 30, 2015 at 06:11:08PM +0200, Alexandre Belloni wrote:
> > > Use regmap to access the PMC to avoid using at91_pmc_read and
> > > at91_pmc_write.
> > > 
> > > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > 
> > can I take this through my tree or does it have any dependences with the rest of
> > the series ?
> > 
> 
> This actually depend on the DT change. I'd say that we can safely assume
> that the DT change will land in the next kernel version so you could
> take that patch in your tree.
> 
> Nicolas, what is your opinion?
> 

Ok, I'm late to the battle :)

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
