Return-Path: <sboyd@codeaurora.org>
Date: Mon, 23 Nov 2015 16:59:19 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Georgi Djakov <georgi.djakov@linaro.org>,
	"agross@codeaurora.org" <agross@codeaurora.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v4 4/5] clk: qcom: Add RPM clock controller driver
Message-ID: <20151124005919.GN19156@codeaurora.org>
References: <1447941480-27487-1-git-send-email-georgi.djakov@linaro.org>
 <1447941480-27487-5-git-send-email-georgi.djakov@linaro.org>
 <20151121003953.GD28998@codeaurora.org>
 <20151122021820.GK30882@usrtlx11787.corpusers.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20151122021820.GK30882@usrtlx11787.corpusers.net>
List-ID: <linux-clk.vger.kernel.org>

On 11/21, Bjorn Andersson wrote:
> On Fri 20 Nov 16:39 PST 2015, Stephen Boyd wrote:
> 
> > On 11/19, Georgi Djakov wrote:
> > > diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> > > new file mode 100644
> > > index 000000000000..bd0fd0cd50dc
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> > > @@ -0,0 +1,35 @@
> > > +Qualcomm RPM Clock Controller Binding
> > > +------------------------------------------------
> > > +The RPM is a dedicated hardware engine for managing the shared
> > > +SoC resources in order to keep the lowest power profile. It
> > > +communicates with other hardware subsystems via shared memory
> > > +and accepts clock requests, aggregates the requests and turns
> > > +the clocks on/off or scales them on demand.
> > > +
> > > +Required properties :
> > > +- compatible : shall contain only one of the following:
> > > +
> > > +			"qcom,rpmcc-msm8916"
> > 
> > We need to add qcom,rpmcc as a generic compatible as well.
> > 
> 
> The binding is generic and the clock defines global, so this should work
> fine on the dt side of things. But how do we implement this?
> 
> Which set of clocks does the generic rpmcc actually provide?
> 
> Do you foresee that there will be an implementation of the generic rpmcc
> or is it just a way to "standardize" the dt binding?
> 

I don't see any problem with implementing the RPM clock
controller as one file or two files (one for platform bus based
RPM modules and one for SMD bus RPM modules). The compatible can
be the same for both struct driver instances, while the bus will
pick the right driver. I suspect we'll need SoC specific
compatibles though to export the right set of clocks, so having
the generic compatible is mostly to find these rpm clock
controllers so that we know to skip registering the XO clock from
the GCC driver and not some generic implementation of the driver.

There's probably a subset of the clocks that's always the same
between devices, so if we had to we could match the generic
compatible and provide limited functionality.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
