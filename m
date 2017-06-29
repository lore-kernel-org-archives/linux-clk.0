Return-Path: <bjorn.andersson@linaro.org>
Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 28 Jun 2017 21:43:21 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Varadarajan Narayanan <varada@codeaurora.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com,
	sboyd@codeaurora.org, linus.walleij@linaro.org,
	andy.gross@linaro.org, david.brown@linaro.org,
	catalin.marinas@arm.com, will.deacon@arm.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, absahu@codeaurora.org,
	sjaganat@codeaurora.org, sricharan@codeaurora.org,
	Manoharan Vijaya Raghavan <mraghava@codeaurora.org>
Subject: Re: [PATCH v6 5/6] arm64: dts: Add ipq8074 SoC and HK01 board support
Message-ID: <20170629044321.GU18666@tuxbook>
References: <1497001319-30353-1-git-send-email-varada@codeaurora.org>
 <1497001319-30353-6-git-send-email-varada@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1497001319-30353-6-git-send-email-varada@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Fri 09 Jun 02:41 PDT 2017, Varadarajan Narayanan wrote:
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
[..]
> +
> +	chosen {
> +		bootargs = "root=/dev/ram0 rw init=/init";

As far as I know you can omit both root= and init= from this.

> +		stdout-path = "serial0";
> +	};
> +

Apart from that,

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
