Return-Path: <bjorn@kryo.se>
MIME-Version: 1.0
In-Reply-To: <20151124005919.GN19156@codeaurora.org>
References: <1447941480-27487-1-git-send-email-georgi.djakov@linaro.org>
	<1447941480-27487-5-git-send-email-georgi.djakov@linaro.org>
	<20151121003953.GD28998@codeaurora.org>
	<20151122021820.GK30882@usrtlx11787.corpusers.net>
	<20151124005919.GN19156@codeaurora.org>
Date: Fri, 27 Nov 2015 08:24:30 -0800
Message-ID: <CAJAp7OjM-No4Ji6eeFjvNHfmPgu6FZi8FTPRayv=-0DOsB4Aww@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] clk: qcom: Add RPM clock controller driver
From: Bjorn Andersson <bjorn@kryo.se>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>,
	Georgi Djakov <georgi.djakov@linaro.org>, "agross@codeaurora.org" <agross@codeaurora.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, Nov 23, 2015 at 4:59 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 11/21, Bjorn Andersson wrote:
>> On Fri 20 Nov 16:39 PST 2015, Stephen Boyd wrote:
[..]
>> Do you foresee that there will be an implementation of the generic rpmcc
>> or is it just a way to "standardize" the dt binding?
>>
>
> I don't see any problem with implementing the RPM clock
> controller as one file or two files (one for platform bus based
> RPM modules and one for SMD bus RPM modules). The compatible can
> be the same for both struct driver instances, while the bus will
> pick the right driver. I suspect we'll need SoC specific
> compatibles though to export the right set of clocks, so having
> the generic compatible is mostly to find these rpm clock
> controllers so that we know to skip registering the XO clock from
> the GCC driver and not some generic implementation of the driver.
>

Ahh, now I get it. So the generic rpmcc to be able to check if we have
a rpmcc instance and then the specific for the actual implementation.

I'm +1 on that.

> There's probably a subset of the clocks that's always the same
> between devices, so if we had to we could match the generic
> compatible and provide limited functionality.
>

After looking at a couple of platforms I don't think it's worth the
effort of having a common list of rpm clocks. My suggestion is that we
just continue with the suggested approach (having platform specific
rpmcc defines and tables)

Regards,
Bjorn
