Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
To: Punit Agrawal <punit.agrawal@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Jon Medhurst <tixy@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Liviu Dudau <Liviu.Dudau@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, arm@kernel.org
Subject: Re: [PATCH] scpi: hide get_scpi_ops in module from built-in code
Date: Thu, 19 Nov 2015 16:23:31 +0100
Message-ID: <3802372.zWzDBWFCTp@wuerfel>
In-Reply-To: <9hhoaespm8p.fsf@e105922-lin.cambridge.arm.com>
References: <4740279.aWlP1tqJLa@wuerfel> <9hhoaespm8p.fsf@e105922-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tuesday 17 November 2015 17:30:14 Punit Agrawal wrote:
> Arnd Bergmann <arnd@arndb.de> writes:
> 
> > The scpi_clock driver can be built-in when CONFIG_COMPILE_TEST
> > is set even when ARM_SCPI_PROTOCOL is a loadable module, and
> > that results in a link error:
> >
> > drivers/built-in.o: In function `scpi_clocks_probe':
> > (.text+0x14453c): undefined reference to `get_scpi_ops'
> >
> > Using #if IS_REACHABLE() around the get_scpi_ops() declaration
> > makes it build successfully in this case for compile-testing,
> > but the effect is the same as when ARM_SCPI_PROTOCOL is
> > disabled, as the code will not be used.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Makes sense. Thanks, Arnd!
> 
>        Acked-by: Punit Agrawal <punit.agrawal@arm.com>
> 

I've added it to arm-soc fixes now.

	Arnd
