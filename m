Return-Path: <sboyd@codeaurora.org>
Date: Fri, 4 Nov 2016 13:18:36 -0700
From: 'Stephen Boyd' <sboyd@codeaurora.org>
To: Sricharan <sricharan@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	rnayak@codeaurora.org, stanimir.varbanov@linaro.org
Subject: Re: [PATCH 3/3] clk: qcom: Set BRANCH_HALT_DELAY flags for venus
 core0/1 clks
Message-ID: <20161104201836.GE16026@codeaurora.org>
References: <1477304297-5248-1-git-send-email-sricharan@codeaurora.org>
 <1477304297-5248-4-git-send-email-sricharan@codeaurora.org>
 <20161103203418.GA16026@codeaurora.org>
 <006701d2367b$19a6ba00$4cf42e00$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <006701d2367b$19a6ba00$4cf42e00$@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/04, Sricharan wrote:
> Hi,
> >
> >A better design would be to check if the associated GDSC is in hw
> >control mode and then skip the checks because the clocks are no
> >longer under the control of the registers. I presume we only
> >enable the clocks here to turn on parent clocks which don't turn
> >on/off automatically, i.e. the PLL.
> >
> I was thinking clocks in the powerdomain still needs to be turned
> on explicitly, these are branch clocks, irrespective of the PLLs.
> Putting the gdsc in hw_ctrl, only makes the polling on their status
> invalid. Anyways would be good to be aligned on this.

Sure. We also need to make sure the branches are on themselves.
When the gdsc is disabled the clocks are killed though. This is
why we can't enable clocks until the gdsc is enabled.

> 
> >Given that hw control is a static decision I guess that is an
> >over-engineered solution though? The problem is that this seems
> >brittle because we have to keep two things in sync, the branches
> >and the gdsc. So I guess this is ok, but it deserves a comment
> >like "GDSC is in HW control" so we know what's going on. Also the
> >commit text could be more explicit that clocks within the gdsc
> >power domain don't work when the gdsc is off, and with hw control
> >of a gdsc we can't tell when the gdsc may be off or on.
> >
> 
> ok, i will reword the commit log better as above.
> 
> So i understand its ok to continue with this way of checking ?
> since we are always having a static association which never changes,
> than introducing additional fields in the clk_branch which can
> get the status of the gdsc.
> 

Well I'm also curious which case is failing. Does turning on the
clocks work after the gdsc is enabled? Does turning off the
clocks fail because we don't know when the gdsc has turned off? I
would hope that the firmware keeps the gdsc on when it's done
processing things, goes idle, and hands back control to software.
Right now I'm failing to see how the halt bits fail to toggle
assuming that firmware isn't misbehaving and the kernel driver is
power controlling in a coordinated manner with the firmware.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
