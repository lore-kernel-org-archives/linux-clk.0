Return-Path: <anischal@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Wed, 08 Aug 2018 15:57:48 +0530
From: Amit Nischal <anischal@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Andy Gross
 <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra
 Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>,
 Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk-owner@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: Add camera clock controller driver for
 SDM845
In-Reply-To: <153322925025.10763.7919558124009549240@swboyd.mtv.corp.google.com>
References: <1532942540-2814-1-git-send-email-anischal@codeaurora.org>
 <1532942540-2814-2-git-send-email-anischal@codeaurora.org>
 <153322925025.10763.7919558124009549240@swboyd.mtv.corp.google.com>
Message-ID: <bdc2e5b95a403f9b28b87c53d5478520@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 2018-08-02 22:30, Stephen Boyd wrote:
> Quoting Amit Nischal (2018-07-30 02:22:20)
>> diff --git a/drivers/clk/qcom/camcc-sdm845.c 
>> b/drivers/clk/qcom/camcc-sdm845.c
>> new file mode 100644
>> index 0000000..702ca66
>> --- /dev/null
>> +++ b/drivers/clk/qcom/camcc-sdm845.c
>> @@ -0,0 +1,1744 @@
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_cam_cc_bps_clk_src[] = {
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       F(100000000, P_CAM_CC_PLL0_OUT_EVEN, 6, 0, 0),
>> +       F(200000000, P_CAM_CC_PLL0_OUT_EVEN, 3, 0, 0),
>> +       F(404000000, P_CAM_CC_PLL1_OUT_EVEN, 2, 0, 0),
>> +       F(480000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
>> +       F(600000000, P_CAM_CC_PLL0_OUT_EVEN, 1, 0, 0),
>> +       { }
>> +};
>> +
>> +/*
>> + * As per HW design, some of the CAMCC RCGs needs to
>> + * move to XO clock during their clock disable so using
> 
> Per hw design sure, but what about hw design is causing this?

The RCGs which sources to the CBCRs further connected to the
camera memory blocks needs to be moved to XO clock during
clock disable. This is required to power down the camera memories
gracefully as these memories cannot be powered down instantly.
And after memory power down, HW will gate the clock.

> 
>> + * clk_rcg2_shared_ops for such RCGs.
>> + * Also, use CLK_SET_RATE_PARENT flag for the RCGs which
>> + * have non-fixed PLL as parent source and requires
> 
> Mention the PLL that isn't fixed?
> 

Yes sure. I will mention the PLL's name in the next patch.

>> + * reconfiguration of the PLL frequency.
>> + */
>> +static struct clk_rcg2 cam_cc_bps_clk_src = {
>> +       .cmd_rcgr = 0x600c,
>> +       .mnd_width = 0,
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
