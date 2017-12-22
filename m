Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
Subject: Re: [PATCH v11 0/6] Add support for Qualcomm A53 CPU clock
To: Stephen Boyd <sboyd@codeaurora.org>, jassisinghbrar@gmail.com
Cc: bjorn.andersson@linaro.org, mturquette@baylibre.com, robh@kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20171205154701.27730-1-georgi.djakov@linaro.org>
 <20171222004904.GA7997@codeaurora.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <1ea1fa92-de78-c4df-469c-3f36f5f62497@linaro.org>
Date: Fri, 22 Dec 2017 16:52:25 +0200
MIME-Version: 1.0
In-Reply-To: <20171222004904.GA7997@codeaurora.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 22.12.17 г. 2:49, Stephen Boyd wrote:
> On 12/05, Georgi Djakov wrote:
>> This patchset adds support for the A53 CPU clock on MSM8916 platforms
>> and allows scaling of the CPU frequency on msm8916 based platforms.
> 
> Ok. I will apply just the clk ones? Patches 3,4, and 6?
> 

Yes, i think this would be best. The rest should go through the mailbox tree.
Jassi, are you ok with this?

Thanks,
Georgi
