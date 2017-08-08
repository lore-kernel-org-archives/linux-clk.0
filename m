Return-Path: <sumit.semwal@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170808155707.GA19636@kroah.com>
References: <CAO_48GHvyUD7vD1qJP=41Wt0nyeiyhoCpVSYL-v-jbU_dd1Sgw@mail.gmail.com>
 <20170808155707.GA19636@kroah.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 8 Aug 2017 22:11:57 +0530
Message-ID: <CAO_48GFtw+OGh1MKG=dZbUL0WoqNW7-EQCXZ5bdGjiMAFXGEZg@mail.gmail.com>
Subject: Re: Request for inclusion to stable-4.9
To: Greg KH <greg@kroah.com>
Cc: "# 3.4.x" <stable@vger.kernel.org>, Leo Yan <leo.yan@linaro.org>, mturquette@baylibre.com,
	sboyd@codeaurora.org, linux-clk@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Greg,

On 8 August 2017 at 21:27, Greg KH <greg@kroah.com> wrote:
> On Tue, Aug 08, 2017 at 09:05:03PM +0530, Sumit Semwal wrote:
>> Hi Greg,
>>
>> Please consider commit
>>
>> 9a881bc55d7b: clk: Hi6220: enable stub clock driver for ARCH_HISI
>>
>> for inclusion into stable-4.9; without this, Hikey's cpufreq driver
>> doesn't work, and the cpufreq kselftests fail on it accordingly.
>
> How can it "not work", all that patch does it enable it by "default",
> you can always change your .config file to enable it successfully,
> right?
Of course. I meant "doesn't work with default defconfig"; having it
enabled by default just makes it a little easier to test in a CI loop
- we could do that in the CI scripts as well, so apologies about the
noise here.
>
> thanks,
>
> greg k-h
