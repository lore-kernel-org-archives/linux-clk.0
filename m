Return-Path: <greg@kroah.com>
Date: Tue, 8 Aug 2017 08:57:07 -0700
From: Greg KH <greg@kroah.com>
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "# 3.4.x" <stable@vger.kernel.org>, Leo Yan <leo.yan@linaro.org>,
	mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Request for inclusion to stable-4.9
Message-ID: <20170808155707.GA19636@kroah.com>
References: <CAO_48GHvyUD7vD1qJP=41Wt0nyeiyhoCpVSYL-v-jbU_dd1Sgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAO_48GHvyUD7vD1qJP=41Wt0nyeiyhoCpVSYL-v-jbU_dd1Sgw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Aug 08, 2017 at 09:05:03PM +0530, Sumit Semwal wrote:
> Hi Greg,
> 
> Please consider commit
> 
> 9a881bc55d7b: clk: Hi6220: enable stub clock driver for ARCH_HISI
> 
> for inclusion into stable-4.9; without this, Hikey's cpufreq driver
> doesn't work, and the cpufreq kselftests fail on it accordingly.

How can it "not work", all that patch does it enable it by "default",
you can always change your .config file to enable it successfully,
right?

thanks,

greg k-h
