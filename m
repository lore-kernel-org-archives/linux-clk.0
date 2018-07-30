Return-Path: <sudeep.holla@arm.com>
Date: Mon, 30 Jul 2018 12:40:56 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Amit Daniel Kachhap <amit.kachhap@arm.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	LAK <linux-arm-kernel@lists.infradead.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] clk: scmi: Fix the rounding of clock rate
Message-ID: <20180730114056.GA17362@e107155-lin>
References: <1532700112-11852-1-git-send-email-amit.kachhap@arm.com>
 <153270946725.48062.11195853363758024681@swboyd.mtv.corp.google.com>
 <CADGdYn5T2-B2UE9DX3wFHdvqfF85n0NAbKDBf2KHOQreRi=H+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CADGdYn5T2-B2UE9DX3wFHdvqfF85n0NAbKDBf2KHOQreRi=H+g@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jul 30, 2018 at 11:03:51AM +0530, Amit Daniel Kachhap wrote:
> Hi,
> 
> On Fri, Jul 27, 2018 at 10:07 PM, Stephen Boyd <sboyd@kernel.org> wrote:
> > Quoting Amit Daniel Kachhap (2018-07-27 07:01:52)
> >> This fix rounds the clock rate properly by using quotient and not
> >> remainder in the calculation. This issue was found while testing HDMI
> >> in the Juno platform.
> >>
> >> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@arm.com>
> >
> > Any Fixes: tag here?
> Yes, This patch is tested with Linux v4.18-rc6 tag.
>

No Stephen meant the commit that this fixes, something like below:

Fixes: 6d6a1d82eaef ("clk: add support for clocks provided by SCMI")

so that it can get backported if required.

--
Regards,
Sudeep
