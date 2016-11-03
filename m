Return-Path: <sboyd@codeaurora.org>
Date: Thu, 3 Nov 2016 13:05:50 -0700
From: 'Stephen Boyd' <sboyd@codeaurora.org>
To: Sricharan <sricharan@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	rnayak@codeaurora.org, stanimir.varbanov@linaro.org
Subject: Re: [PATCH 1/3] clk: qcom: gdsc: Add support for gdscs with HW
 control
Message-ID: <20161103200550.GZ16026@codeaurora.org>
References: <1477304297-5248-1-git-send-email-sricharan@codeaurora.org>
 <1477304297-5248-2-git-send-email-sricharan@codeaurora.org>
 <20161102001834.GB16026@codeaurora.org>
 <003c01d234d5$731b19c0$59514d40$@codeaurora.org>
 <20161102175944.GI16026@codeaurora.org>
 <000f01d235d6$6e63e680$4b2bb380$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000f01d235d6$6e63e680$4b2bb380$@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/03, Sricharan wrote:
>  Ok, so the video ip core, has a hw control signal/bit.
>  I checked this by dumping this out that,  the moment the
> gdsc is put to hw control, the video ip's hw control bit also
> gets asserted/set. so this means that video ip's bit get
> aligned with the gdsc setting.  so this should avoid the
> glitches, right ?
> 

Yes that matches my understanding. Thanks for confirming.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
