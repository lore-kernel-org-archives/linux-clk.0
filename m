Return-Path: <sboyd@codeaurora.org>
Date: Mon, 13 Nov 2017 18:12:55 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, jassisinghbrar@gmail.com,
	robh+dt@kernel.org, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 3/7] mailbox: qcom: Move the apcs struct into a
 separate header
Message-ID: <20171114021255.GY11955@codeaurora.org>
References: <20170921164940.20343-1-georgi.djakov@linaro.org>
 <20170921164940.20343-4-georgi.djakov@linaro.org>
 <20171026042811.GL1575@tuxbook>
 <5bad4c4b-362b-ba9f-3072-1cced7a004dd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5bad4c4b-362b-ba9f-3072-1cced7a004dd@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 10/27, Georgi Djakov wrote:
> Hi Bjorn,
> 
> Thanks for reviewing!
> 
> On 10/26/2017 07:28 AM, Bjorn Andersson wrote:
> > On Thu 21 Sep 09:49 PDT 2017, Georgi Djakov wrote:
> > 
> >> Move the structure shared by the APCS IPC device and its subdevices
> >> into a separate header file.
> >>
> > 
> > As you're creating the apcs regmap with devm_regmap_init_mmio() you can
> > just call dev_get_regmap(dev->parent) in your child to get the handle.
> 
> Ok, thanks!
> 
> > 
> > But I would prefer that you just add the clock code to the existing
> > driver.
> 
> This will require an ack from Stephen, and i got the impression that he
> prefers a separate clk driver [1].
> 
> Stephen, are you ok with registering the clocks from the apcs mailbox
> driver?
> 
> [1] https://lkml.org/lkml/2017/6/26/750

The parent regmap "trick" was the plan. Is something wrong with
that?

Not having random clk drivers scattered throughout the tree is
sort of nice because it makes for an easier time finding things
that are similar. Maybe that's an abuse of the driver model
though? Just to get things into some same directory. I'm fine
either way.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
