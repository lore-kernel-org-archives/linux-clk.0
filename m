Return-Path: <linux-pm-owner@vger.kernel.org>
Date: Fri, 11 Sep 2015 08:05:27 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Mikko Perttunen <mikko.perttunen@kapsi.fi>,
	Tuomas Tynkkynen <ttynkkynen@nvidia.com>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] clk: tegra: dfll: Properly protect OPP list
Message-ID: <20150911023527.GS5266@linux>
References: <1441893321-4563-1-git-send-email-thierry.reding@gmail.com>
 <20150910175144.GB15099@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20150910175144.GB15099@codeaurora.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 10-09-15, 10:51, Stephen Boyd wrote:
> Don't we already have an rcu_read_lock() at the beginning of this
> function? I don't understand why we need to nest them in the same
> function.

+1

-- 
viresh
