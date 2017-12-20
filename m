Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 20 Dec 2017 15:11:47 -0600
From: Rob Herring <robh@kernel.org>
To: Sricharan R <sricharan@codeaurora.org>
Cc: mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org,
	linux@armlinux.org.uk, andy.gross@linaro.org,
	david.brown@linaro.org, rjw@rjwysocki.net, viresh.kumar@linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 05/15] devicetree: bindings: Document qcom,hfpll
Message-ID: <20171220211147.p555i5eest3ycsbc@rob-hp-laptop>
References: <1513698900-10638-1-git-send-email-sricharan@codeaurora.org>
 <1513698900-10638-6-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1513698900-10638-6-git-send-email-sricharan@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Dec 19, 2017 at 09:24:50PM +0530, Sricharan R wrote:
> From: Stephen Boyd <sboyd@codeaurora.org>
> 
> Adds bindings document for qcom,hfpll instantiated within
> the Krait processor subsystem as separate register region.
> 
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,hfpll.txt       | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,hfpll.txt

"dt-bindings: " is the preferred subject prefix. Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
