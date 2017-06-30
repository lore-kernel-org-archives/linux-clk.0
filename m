Return-Path: <sboyd@codeaurora.org>
Date: Thu, 29 Jun 2017 18:43:05 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Chunyan Zhang <chunyan.zhang@spreadtrum.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
	Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>,
	Orson Zhai <orson.zhai@spreadtrum.com>,
	Geng Ren <geng.ren@spreadtrum.com>, Ben Li <ben.li@spreadtrum.com>
Subject: Re: [PATCH V1 3/9] clk: sprd: add gate clock support
Message-ID: <20170630014305.GK22780@codeaurora.org>
References: <20170618015855.27738-1-chunyan.zhang@spreadtrum.com>
 <20170618015855.27738-4-chunyan.zhang@spreadtrum.com>
 <20170620013130.GI4493@codeaurora.org>
 <CAAfSe-sbJxEA0OdC9u3A4p5Q7hrfqkiHscvsuT_irOHp98G+aQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAAfSe-sbJxEA0OdC9u3A4p5Q7hrfqkiHscvsuT_irOHp98G+aQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/22, Chunyan Zhang wrote:
> On 20 June 2017 at 09:31, Stephen Boyd <sboyd@codeaurora.org> wrote:
> > On 06/18, Chunyan Zhang wrote:
> >> diff --git a/drivers/clk/sprd/Makefile b/drivers/clk/sprd/Makefile
> >> index 8f802b2..333e2b2 100644
> >> --- a/drivers/clk/sprd/Makefile
> >> +++ b/drivers/clk/sprd/Makefile
> >> @@ -1,3 +1,3 @@
> >>  ifneq ($(CONFIG_OF),)
> >> -obj-y        += ccu_common.o
> >> +obj-y        += ccu_common.o ccu_gate.o
> >
> > Can this be built as a module?
> 
> Since most of all Spreadtrum device drivers would depend on if clocks
> have been initialized, so we'd prefer to build this into the kernel
> image.

This isn't really a good reason, but OK. Hopefully nobody wants
to make a module for every driver on the system and jam the ones
needed to access the rootfs into a ramdisk. Don't worry, you
don't need to support modules here.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
