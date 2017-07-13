Return-Path: <rnayak@codeaurora.org>
Subject: Re: [PATCH 0/2] clk: qcom: Add RPM clocks for msm8996
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1490175566-4084-1-git-send-email-rnayak@codeaurora.org>
 <20170710201847.GL22780@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 srinivas.kandagatla@linaro.org
From: Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <50b050b9-c5a4-71d9-12cd-4e1e5b649f23@codeaurora.org>
Date: Thu, 13 Jul 2017 11:58:21 +0530
MIME-Version: 1.0
In-Reply-To: <20170710201847.GL22780@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>


On 07/11/2017 01:48 AM, Stephen Boyd wrote:
> On 03/22, Rajendra Nayak wrote:
>> This patchset adds all the RPM clocks on msm8996 platforms,
>> while at it, we also remove some of the RCGs from the GCC
>> driver as they are controlled by RPM and hence should not
>> be part of GCC.
>>
>> Series depends on Bjorns patches which add support for glink
>> on msm8996
>> https://www.spinics.net/lists/linux-wireless/msg160393.html
>> http://www.spinics.net/lists/devicetree/msg168445.html
>>
>> Rajendra Nayak (2):
>>   clk: qcom: clk-smd-rpm: add msm8996 rpmclks
>>   clk: qcom: gcc-msm8996: Remove RPM controlled clocks
> 
> The first patch looks ok, but the second patch is quite scary. So
> far we haven't hooked up the bus RPM clks into the clk tree quite
> like that. I suppose if everything works fine though it should be
> OK.
> 
> One case I can think of is when we're enabling branch clks that
> are children of some RPM controlled bus clk. Right now in the
> downstream kernel we don't enable the RPM clk in this case.
> Instead, we rely on the bus driver to make sure the bus is
> enabled. And for things like suspend, I'm not sure if drivers are
> calling clk_disable() and unprepare on their branches, so we may
> be leaving them on in the downstream kernel and relying on the
> bus driver dropping requests to explicitly turn things off. I
> suppose this is OK though, because those drivers are broken if
> they exist.
> 
> Also, probe deferal may be an issue, where we hand out branch
> clks to drivers before the RPM is up and ready. If an enable
> appears on an orphan things get confusing. We should merge that
> probe defer orphan series too.

I am not sure what the state of the probe defer orphan series is,
so in the meantime if it makes sense we could just pull in one
patch from this series and leave the second one out until we
get the probe defer for orphans merged.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
