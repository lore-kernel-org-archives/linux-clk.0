Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v6 0/2] Add initial support for RPM clocks
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1450182602-6996-1-git-send-email-georgi.djakov@linaro.org>
 <20160212003757.GD4847@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Message-ID: <56CB2966.5060403@linaro.org>
Date: Mon, 22 Feb 2016 17:29:42 +0200
MIME-Version: 1.0
In-Reply-To: <20160212003757.GD4847@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 02/12/2016 02:37 AM, Stephen Boyd wrote:
> On 12/15, Georgi Djakov wrote:
>>
>>  .../devicetree/bindings/clock/qcom,rpmcc.txt       |   37 ++
>>  drivers/clk/qcom/Kconfig                           |   29 ++
>>  drivers/clk/qcom/Makefile                          |    2 +
>>  drivers/clk/qcom/clk-rpm.c                         |  290 +++++++++++++
>>  drivers/clk/qcom/clk-rpm.h                         |   71 ++++
> 
> Do we need this header file?
> 
>>  drivers/clk/qcom/clk-smd-rpm.c                     |  433 ++++++++++++++++++++
>>  drivers/clk/qcom/clk-smd-rpm.h                     |  142 +++++++
> 
> And this one too?
> 
> From what I can tell they're only going to be included by the
> clk-rpm and clk-smd-rpm C files. We can also avoid exporting the
> RPM ops then if we're going to make the C files into full blown
> platform drivers.
> 

Of course, good idea. Fixed it and will resubmit shortly.

Thanks,
Georgi
