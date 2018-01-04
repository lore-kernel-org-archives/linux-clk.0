Return-Path: <anischal@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Thu, 04 Jan 2018 10:29:52 +0530
From: Amit Nischal <anischal@codeaurora.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Andy Gross
 <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra
 Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] clk: qcom: MISC RCG changes for SDM845
In-Reply-To: <20180102181306.GF7997@codeaurora.org>
References: <1514877987-8082-1-git-send-email-anischal@codeaurora.org>
 <20180102181306.GF7997@codeaurora.org>
Message-ID: <47f28c6fa1bf2f6a341ae88217caf461@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 2018-01-02 23:43, Stephen Boyd wrote:
> On 01/02, Amit Nischal wrote:
>> Changes in v2:
>> * Changed usage of clk_hw_is_prepared() to __clk_is_enabled()
>>   in clk_rcg2_shared_ops to fix build test error.
> 
> Please change it to read the hardware directly and not use
> __clk_is_enabled() or clk_hw_is_prepared().

Hi Stephen,

Thanks for the review the change.

Here intention is to know the software status of the RCG instead of
HW status and we have intentionally not defined the 'is_enabled'
ops for clk_rcg2_shared_ops. This clk_rcg2_shared_ops are only
applicable for the RCGs with shared branches across different
subsystems. Reason for using the same is mentioned below.

When RCG gets enabled by other subsystem (outside the Application
processor subsystem):
   In this case when RCG gets enabled by branch clock managed by
   other subsystem (outside the Application processor subsystem)
   and if we check HW status of RCG in clk_rcg2_shared_set_rate()
   instead of checking its software status then it will give the
   status as ENABLED without overlying software knowing its status
   and during source switch, update configuration will get fail as
   new parent will be in disabled state.

   In above scenario, clock framework will not enable the new
   parent before configuration update as enable and prepare counts
   are zero for RCG clock and clk_set_rate() will follow below path.

   clk_rcg2_shared_set_rate()
   __clk_set_parent_before()-->New parent will be disabled as prepare 
count = 0
   clk_change_rate()
   clk_set_rate()

So solution of this problem is as follows and same is explained in the
commit text of https://patchwork.kernel.org/patch/10139985/
1. If software status of the RCG is disabled(enable/prepare counts are 
0)
    then just cache or store the rate in current_freq variable and if
    software status is enabled then follow the normal update procedure.

2. Set the rate and switch to new source only in 
clk_rcg2_shared_enable()
    i.e. during RCG enable sequence. This will make sure that required
    parents are already in enable state before configuration update and
    RCG switch will happen successfully every time.

In past, We have encountered similar RCG update configuration failure 
issues
for some display RCGs, where there are two branch clocks, one is 
controlled by
application processor subsystem and another one controlled by other 
subsystem.
So to handle such cases, we need clk_rcg2_shared_ops.
