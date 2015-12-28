Return-Path: <bjorn@kryo.se>
Return-Path: <bjorn@kryo.se>
Date: Sun, 27 Dec 2015 18:08:09 -0800
From: Bjorn Andersson <bjorn@kryo.se>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, bjorn.andersson@sonymobile.com,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 1/6] clk: qcom: Add support for SMD-RPM Clocks
Message-ID: <20151228020809.GB16437@tuxbot>
References: <1449151376-25930-1-git-send-email-georgi.djakov@linaro.org>
 <1449151376-25930-2-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1449151376-25930-2-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Thu 03 Dec 06:02 PST 2015, Georgi Djakov wrote:

> This adds initial support for clocks controlled by the Resource
> Power Manager (RPM) processor on some Qualcomm SoCs, which use
> the qcom_smd_rpm driver to communicate with RPM.
> Such platforms are msm8916, apq8084 and msm8974.
> 
> The RPM is a dedicated hardware engine for managing the shared
> SoC resources in order to keep the lowest power profile. It
> communicates with other hardware subsystems via shared memory
> and accepts clock requests, aggregates the requests and turns
> the clocks on/off or scales them on demand.
> 
> This driver is based on the codeaurora.org driver:
> https://www.codeaurora.org/cgit/quic/la/kernel/msm-3.10/tree/drivers/clk/qcom/clock-rpm.c
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Hi Georgi,

I added the 8974 clocks to this to make the WNCSS core happy (need
CXO_A2 for XO calibration), but I have a few issues:

*) msm_serial acquires a handle to GCC_BLSP1_UART2_APPS_CLK which is
parented by "xo"; the clock framework returns a clock, as the gcc driver
is probed, but as the rpmcc driver isn't probed clk_get_rate() returns
0.

Do you have any patches in your tree to fix the ordering or making the
clk_get() implement probe deferral in this case?

*) If I let the code call clk_smd_rpm_enable_scaling() my eMMC becomes
very unstable, with a rather high occurrence of timeouts during boot
(like 80% of boots fail to mount my rootfs).


Part of these (unrelated to your code) issues I think this looks good,
and hacking around these two issues allows me to get CXO_A2 ticking :)

Regards,
Bjorn
