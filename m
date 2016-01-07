Return-Path: <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 3/5] clk: qcom: Add MSM8996 Global Clock Control (GCC)
 driver
To: Rajendra Nayak <rnayak@codeaurora.org>,
 Mike Turquette <mturquette@baylibre.com>
References: <1448933502-11944-1-git-send-email-sboyd@codeaurora.org>
 <1448933502-11944-4-git-send-email-sboyd@codeaurora.org>
 <568DF4C4.2080504@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
From: Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <568EFAF5.50507@codeaurora.org>
Date: Thu, 7 Jan 2016 15:55:33 -0800
MIME-Version: 1.0
In-Reply-To: <568DF4C4.2080504@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 01/06/16 21:16, Rajendra Nayak wrote:
> Stephen,
>
> On 12/01/2015 07:01 AM, Stephen Boyd wrote:
>> Add support for the global clock controller found on MSM8996
>> based devices. This should allow most non-multimedia device
>> drivers to probe and control their clocks.
> On my 8096 board I see the following orphan clocks,
>
> /sys/kernel/debug/clk # cat clk_orphan_summary
>    clock                         enable_cnt  prepare_cnt        rate   accuracy   phase
> ---------------------------------------------------------------------------------------                                                                                                                        -
>  gcc_ufs_rx_symbol_1_clk                  0            0           0          0 0
>  gcc_ufs_rx_symbol_0_clk                  0            0           0          0 0
>  gcc_ufs_tx_symbol_0_clk                  0            0           0          0 0
>  gcc_pcie_2_pipe_clk                      0            0           0          0 0
>  gcc_pcie_1_pipe_clk                      0            0           0          0 0
>  gcc_pcie_0_pipe_clk                      0            0           0          0 0
>  gcc_usb3_phy_pipe_clk                    0            0           0          0 0
>
> I was looking at some ufs clocks which lead me to this. something that needs to be fixed?
>

Hmm yes. This was a "TODO" because the data says there are parents for
these clocks, but they don't seem to exist in the global clock
controller. Perhaps they come from the phys? If my suspicion is right,
then those phy drivers need to register the source clocks and give them
some rate so that these clocks here aren't orphans. In the downstream
code they mark these clocks as root clocks, which doesn't seem right,
but I suppose that also works given that we don't seem to care about
rates, just on/off. It just feels hacky, so I left them as orphans for now.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
