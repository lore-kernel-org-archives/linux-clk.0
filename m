Return-Path: <viresh.kumar@linaro.org>
Return-Path: <viresh.kumar@linaro.org>
Date: Wed, 20 Dec 2017 11:57:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sricharan R <sricharan@codeaurora.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com,
	sboyd@codeaurora.org, linux@armlinux.org.uk, andy.gross@linaro.org,
	david.brown@linaro.org, rjw@rjwysocki.net,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 15/15] devicetree: bindings: Document qcom,pvs
Message-ID: <20171220062712.GV19815@vireshk-i7>
References: <1513698900-10638-1-git-send-email-sricharan@codeaurora.org>
 <1513698900-10638-16-git-send-email-sricharan@codeaurora.org>
 <20171220032614.GQ19815@vireshk-i7>
 <b0d8147a-46e1-0787-ae37-9c1ef957d190@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <b0d8147a-46e1-0787-ae37-9c1ef957d190@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 20-12-17, 11:55, Sricharan R wrote:
> >> +		opp-1400000000 {
> >> +			opp-hz = /bits/ 64 <1400000000>;
> >> +			opp-microvolt-speed0-pvs0-v0 = <1250000>;
> > 
> > Why speed0 and v0 in all the names ?
> > 
> 
>  Ya, all the three (speed, pvs and version) are read from efuse. So all the three
>  can vary.

Okay, so may be in the example you should have a mix of all the
combinations to show how these things work ? You only showed values
for a single efuse configuration currently.

-- 
viresh
