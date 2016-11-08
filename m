Return-Path: <sboyd@codeaurora.org>
Date: Tue, 8 Nov 2016 14:33:36 -0800
From: 'Stephen Boyd' <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Sricharan <sricharan@codeaurora.org>, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stanimir.varbanov@linaro.org
Subject: Re: [PATCH 3/3] clk: qcom: Set BRANCH_HALT_DELAY flags for venus
 core0/1 clks
Message-ID: <20161108223336.GK16026@codeaurora.org>
References: <1477304297-5248-1-git-send-email-sricharan@codeaurora.org>
 <1477304297-5248-4-git-send-email-sricharan@codeaurora.org>
 <20161103203418.GA16026@codeaurora.org>
 <006701d2367b$19a6ba00$4cf42e00$@codeaurora.org>
 <20161104201836.GE16026@codeaurora.org>
 <58201597.6010207@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <58201597.6010207@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/07, Rajendra Nayak wrote:
> 
> 
> On 11/05/2016 01:48 AM, 'Stephen Boyd' wrote:
> > Well I'm also curious which case is failing. Does turning on the
> > clocks work after the gdsc is enabled? Does turning off the
> > clocks fail because we don't know when the gdsc has turned off? I
> > would hope that the firmware keeps the gdsc on when it's done
> > processing things, goes idle, and hands back control to software.
> > Right now I'm failing to see how the halt bits fail to toggle
> > assuming that firmware isn't misbehaving and the kernel driver is
> > power controlling in a coordinated manner with the firmware.
> 
> What fails is turning ON the clocks after the gdsc is put under
> hardware control (by fails I mean the halt checks fail to indicate
> the clock is running, but register accesses etc thereafter suggest
> the clocks are actually running)
> The halt checks seem to work only while the gdsc is put in SW enabled
> state.
> 

Um... that is bad. I don't see how that is possible. It sounds
like the clocks are not turning on when we're asking for them to
turn on. The register accesses are always working because these
subcore clks aren't required for register accesses. Most likely
the GDSC for the subdomains is off (even after we thought we
enabled it).

Let's take a step back. The video hardware has three GDSCs. One
for the main logic, and two for each subdomain. We're adding hw
control for the two subdomains here. From what I can tell there
isn't any hw control for the main domain. I see that there are
two registers in the video hardware to control those subdomain hw
enable signals that go to the GDSC. The reset value is OFF (not
ON like was stated earlier), so it seems that if we switch the
subdomain GDSCs on in these patches it will turn on for a short
time, and then turn off when we switch into hw mode (by virtue of
the way we enable the GDSC). Presumably we can assert these hw
signal bits regardless of the subdomain power states, because
otherwise we're in a chicken-egg situation for the firmware
controlling this stuff.

The proper sequence sounds like it should be:
	
	1. Enable GDSC for main domain
	2. Enable clocks for main domain (video_{core,maxi,ahb,axi}_clk)
	3. Write the two registers to assert hw signal for subdomains
	4. Enable GDSCs for two subdomains
	5. Enable clocks for subdomains (video_subcore{0,1}_clk)

I can only guess that we're not doing this. Probably the sequence
right now is:

	1. Enable GDSC for main domain and both sub-domains
	2. Enable clocks for main domain (video_{core,maxi,ahb,axi}_clk)
	3. Enable clocks for subdomains (video_subcore{0,1}_clk)
	<clk stuff OFF because hw signal is still deasserted>

Sound right? If so, please fix the sequence in the video driver.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
