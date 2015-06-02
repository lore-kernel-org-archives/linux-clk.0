Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 2 Jun 2015 19:15:36 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	nicolas.ferre@atmel.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh+dt@kernel.org,
	pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] clk: at91: add Flexcom clock
Message-ID: <20150602171536.GG1715@piout.net>
References: <cover.1433264017.git.cyrille.pitchen@atmel.com>
 <62cb26952d0688c6f37ad84d253d5302818a20ae.1433264017.git.cyrille.pitchen@atmel.com>
 <20150602190435.4698a4db@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20150602190435.4698a4db@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 02/06/2015 at 19:04:35 +0200, Boris Brezillon wrote :
> Hi Cyrille,
> 
> On Tue, 2 Jun 2015 18:57:19 +0200
> Cyrille Pitchen <cyrille.pitchen@atmel.com> wrote:
> 
> > This driver supports the new Atmel Flexcom. The Flexcom is a wrapper which
> > integrates one SPI controller, one I2C controller and one USART. Only one
> > function can be enabled at a time. This driver selects the function once for
> > all, when the Flexcom is probed, according to the value of the new
> > "atmel,flexcom-mode" device tree property.
> > 
> > This driver has chosen to present the Flexcom to the system as a clock so the
> > implementation is seamless for the existing Atmel SPI, I2C and USART drivers.
> 
> Could detail a bit more why you chose to represent this flexcom IP as
> a clock device ?
> 
> I don't like to use this 'DT should represent real hardware' argument,
> but to me, it looks like you're trying to use a false hardware
> representation to avoid changing the peripheral drivers code, which is
> wrong since the DT is supposed to represent the hardware blocks.
> 
> How about representing the flexcom as an MFD instead ?
> 

It should probably be represented as an MFD. The MFD driver will parse
the chosen configuration and the probe the correct driver. You can have
a look at the recent ST LPC driver from Lee.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
