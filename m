Return-Path: <jonathanh@nvidia.com>
Subject: Re: [PATCH v2] clk: tegra: Use readl_relaxed_poll_timeout_atomic in
 tegra210_clock_init
To: Nicolin Chen <nicoleotsuka@gmail.com>, Thierry Reding
	<thierry.reding@gmail.com>
CC: <sboyd@codeaurora.org>, <pdeschrijver@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <mturquette@baylibre.com>, <pgaikwad@nvidia.com>
References: <1505502613-11801-1-git-send-email-nicoleotsuka@gmail.com>
 <20171019092919.GA7252@Asurada> <20171019094422.GI9005@ulmo>
 <20171019184223.GA7415@Asurada-Nvidia>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <731a934a-4e78-b96d-239f-14cf83079605@nvidia.com>
Date: Fri, 20 Oct 2017 11:20:24 +0100
MIME-Version: 1.0
In-Reply-To: <20171019184223.GA7415@Asurada-Nvidia>
Return-Path: jonathanh@nvidia.com
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>


On 19/10/17 19:42, Nicolin Chen wrote:
> On Thu, Oct 19, 2017 at 11:44:22AM +0200, Thierry Reding wrote:
>>>> Below is the call trace of tegra210_init_pllu() function:
>>>>   start_kernel()
>>>>   -> time_init()
>>>>   --> of_clk_init()
>>>>   ---> tegra210_clock_init()
>>>>   ----> tegra210_pll_init()
>>>>   -----> tegra210_init_pllu()
> 
>> I'm wondering why we're not seeing a splat for this. Usually the kernel
>> will warn if you sleep during atomic context. Does this mean we're just
>> not hitting that case?
> 
> Yes.
> 
>> readx_poll_timeout() has a might_sleep_if(), and
>> therefore it should always cause the splat.
> 
> That's true as long as CONFIG_DEBUG_ATOMIC_SLEEP is enabled locally.
> 
>> Any ideas why this has gone unnoticed for all this time?
> 
> We can see in the tegra210_init_pllu() function that it'll not call
> tegra210_enable_pllu() if pllu is already enabled (by bootloader).

I was thinking that same and so I clobbered the PLLU enable bit with
u-boot, however, then the kernel appears to hang on boot when enabling
the PLL. So although this is probably a separate issue, I am curious if
you have booted the mainline with the PLLU disabled?

Cheers
Jon

-- 
nvpublic
