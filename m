Return-Path: <pdeschrijver@nvidia.com>
Date: Thu, 5 Jul 2018 11:19:07 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: <grahamr@codeaurora.org>
CC: <linux-clk@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<sboyd@kernel.org>, <mturquette@baylibre.com>, <dianders@chromium.org>,
	<ulf.hansson@linaro.org>, <viresh.kumar@linaro.org>, Taniya Das
	<tdas@codeaurora.org>, Rajendra Nayak <rnayak@codeaurora.org>, Amit Nischal
	<anischal@codeaurora.org>
Subject: Re: [RFD] Voltage dependencies for clocks (DVFS)
Message-ID: <20180705081907.GA27696@tbergstrom-lnx.Nvidia.com>
References: <9439bd29e3ccd5424a8e9b464c8c7bd9@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <9439bd29e3ccd5424a8e9b464c8c7bd9@codeaurora.org>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jun 18, 2018 at 01:44:39PM -0700, grahamr@codeaurora.org wrote:
> Hi All,
> 
> A number of vendors, including Qualcomm, support sophisticated
> digital voltage rail management based on the state (rate and enable)
> of each clock in the system.  In a Qualcomm SOC we require the
> ability to assert a vote on both a regulator enable and voltage
> corner (essentially a quantified voltage level) when clocks are
> enabled or have their rate set.  Importantly, if a clock is
> disabled, it must release its required voltage vote.
> In general clients of the clock framework are not aware of the
> mapping between their performance level (clock rate) and voltage
> requirement, because it comes as part of the clock controller design
> and not the core design, and also because the clock controller
> elements themselves have voltage requirements that must be included
> in the relationship (i.e. PLLs need minimum voltage levels to
> operate at a given output frequency).
> 
> The solution we have deployed for many years is to associate a
> regulator and voltage level with each clock rate, and manage voting
> for the associated regulator in the clock framework during state
> changes.  There are two issues with this solution that have been
> raised by maintainers:
> 
> 1. The use of the regulator framework to track voltage corners has
> been deemed invalid.  We are in the process of changing our
> implementation to use genpd, which is being modified to support
> aggregation, and is viewed as acceptable in principle.
> 2. In some SOCs, control over voltages may itself require enabling
> or configuring a clock (think an I2C regulator for example).  In
> such a design, the regulator->clock and clock->regulator
> dependencies introduces a potential deadlock.
> 
> The second concern above is the more challenging.  A proposal to use
> OPP to manage core DVFS has been made, but suffers from three major
> problems: first, it requires clients to use OPP for setting their
> rate, but the clock framework for other control (i.e. enable or
> disable). Not only is this confusing and (I would claim) ugly, it
> would also be very easy for clients to accidentally call
> clk_set_rate directly instead of going via OPP, resulting in invalid
> DVFS operating points.  The second problem is that OPP does not
> allow for removing a voltage vote entirely when the clock is
> disabled - which is a fundamental requirement for the design to be
> power optimal.  The third problem is that semantically using OPP for
> requesting specific functional frequencies (i.e. for a  serial bus)
> is an abuse of that framework.  It requires the clients to find the
> "performance level" that matches the specific frequency they
> require, then request that performance level - when what they really
> want is to "set rate" on the clock to a specific, known, frequency.
> 
> We have avoided the deadlock concern in Qualcomm SOCs by never
> having a clock dependency to control a voltage rail.  This is
> admittedly not a good general solution (although it does appear to
> be perfectly acceptable for current SOCs that have such
> clock/voltage requirements).
> 
> So the question to everybody is how to manage clock-driven DVFS in a
> safe and acceptable fashion?  Would an integrated solution in the
> clock framework with a requirement that SOCs using it not have a
> regulator->clock path be acceptable (it works for us at least)?

The way we solved this in Tegra is to have the DVFS layer use notifiers for
clock rate changes and call directly into the DVFS layer in the prepare and
unprepare clock methods to indicate a voltage request can be dropped. On
Tegra210 we also have temperature dependend OPPs. For this reason we don't
user the OPP layer for rails where we support temperature dependency.

Peter.
