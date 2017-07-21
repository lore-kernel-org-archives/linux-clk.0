Return-Path: <sboyd@codeaurora.org>
Date: Fri, 21 Jul 2017 13:37:12 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Gabriel FERNANDEZ <gabriel.fernandez@st.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre TORGUE <alexandre.torgue@st.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	"daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
	"andrea.merello@gmail.com" <andrea.merello@gmail.com>,
	"radoslaw.pietrzyk@gmail.com" <radoslaw.pietrzyk@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Sylvain Lemieux <slemieux.tyco@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	Ludovic BARRE <ludovic.barre@st.com>,
	Olivier BIDEAU <olivier.bideau@st.com>,
	Amelie DELAUNAY <amelie.delaunay@st.com>,
	"gabriel.fernandez.st@gmail.com" <gabriel.fernandez.st@gmail.com>,
	Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: Re: [PATCH v7 3/3] clk: stm32h7: Add stm32h743 clock driver
Message-ID: <20170721203712.GH19878@codeaurora.org>
References: <1500474344-9832-1-git-send-email-gabriel.fernandez@st.com>
 <1500474344-9832-4-git-send-email-gabriel.fernandez@st.com>
 <d999fc79-7b14-da8e-965f-371cf4352dd1@mleia.com>
 <11c37627-a39b-7f2d-d0d4-af312eac8668@st.com>
 <c5264416-754b-6ec8-f9fb-3b0ac2ba3a58@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <c5264416-754b-6ec8-f9fb-3b0ac2ba3a58@mleia.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/20, Vladimir Zapolskiy wrote:
> Hi Gabriel,
> 
> On 07/20/2017 11:31 AM, Gabriel FERNANDEZ wrote:
> > Hi Vladimir,
> > 
> > 
> > On 07/19/2017 11:20 PM, Vladimir Zapolskiy wrote:
> >> Hello Gabriel,
> >>
> >> On 07/19/2017 05:25 PM, gabriel.fernandez@st.com wrote:
> >>> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> >>> +
> >>> +	rcc: rcc@58024400 {
> >> 'rcc' as a generic device node name is awkward.
> >>
> >> I believe the main function of the device is clock controller (unlikely
> >> a generic reset controller can be converted into a clock controller),
> >> the locations of the document and device driver also indicate that
> >> primarily it is a clock controller, so I suggest to replace device node
> >> name with 'clock-controller' like below:
> > I prefer to keep rcc node name, to be coherent with the other ST 
> > platforms (STM32F4/F7)
> 
> the thing is, a device node name is expected to comply with ePAPR or
> the devicetree specification, which says
> 
> 	The name of a node should be somewhat generic, reflecting
> 	the function of the device and not its precise programming model.
> 
> If devicetree and CCF maintainers are fine with 'rcc', I won't object,
> my role is just to emphasize the found issue and recommend to use another
> and more common name 'clock-controller', it is a simple and fortunately
> backward compatible change to other ST platforms as well.

Yes. It should be generic so clock-controller or
clock-reset-controller is appropriate here.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
