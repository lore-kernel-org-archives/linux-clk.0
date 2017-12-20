Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 20 Dec 2017 15:18:17 -0600
From: Rob Herring <robh@kernel.org>
To: Sricharan R <sricharan@codeaurora.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, mark.rutland@arm.com,
	mturquette@baylibre.com, sboyd@codeaurora.org,
	linux@armlinux.org.uk, andy.gross@linaro.org,
	david.brown@linaro.org, rjw@rjwysocki.net,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 15/15] devicetree: bindings: Document qcom,pvs
Message-ID: <20171220211817.mpkkj747blr4qkqm@rob-hp-laptop>
References: <1513698900-10638-1-git-send-email-sricharan@codeaurora.org>
 <1513698900-10638-16-git-send-email-sricharan@codeaurora.org>
 <20171220032614.GQ19815@vireshk-i7>
 <b0d8147a-46e1-0787-ae37-9c1ef957d190@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <b0d8147a-46e1-0787-ae37-9c1ef957d190@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Dec 20, 2017 at 11:55:33AM +0530, Sricharan R wrote:
> Hi Viresh,
> 
> On 12/20/2017 8:56 AM, Viresh Kumar wrote:
> > On 19-12-17, 21:25, Sricharan R wrote:
> >> +	cpu@0 {
> >> +		compatible = "qcom,krait";
> >> +		enable-method = "qcom,kpss-acc-v1";
> >> +		device_type = "cpu";
> >> +		reg = <0>;
> >> +		qcom,acc = <&acc0>;
> >> +		qcom,saw = <&saw0>;
> >> +		clocks = <&kraitcc 0>;
> >> +		clock-names = "cpu";
> >> +		cpu-supply = <&smb208_s2a>;
> >> +		operating-points-v2 = <&cpu_opp_table>;
> >> +	};
> >> +
> >> +	qcom,pvs {
> >> +		qcom,pvs-format-a;
> >> +	};
> > 
> > Not sure what Rob is going to say on that :)
> > 
> 
>  Yes. Would be good to know the best way.

Seems like this should be a property of an efuse node either implied by 
the compatible or a separate property. What determines format A vs. B?

Rob
