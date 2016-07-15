Return-Path: <bjorn.andersson@linaro.org>
Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 15 Jul 2016 12:15:15 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: njaigane@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, linux@qca.qualcomm.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	twp@codeaurora.org, andy.gross@linaro.org, david.brown@linaro.org,
	robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	linux@armlinux.org.uk, mturquette@baylibre.com,
	sboyd@codeaurora.org, linus.walleij@linaro.org, plai@codeaurora.org,
	bgoswami@codeaurora.org, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, varada@codeaurora.org,
	pradeepb@codeaurora.org, snlakshm@codeaurora.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	alsa-devel@alsa-project.org, bselvara@codeaurora.org
Subject: Re: [PATCH 3/4] qcom: ipq4019: ASoC tlmm/pinctrl support
Message-ID: <20160715191515.GC13516@tuxbot>
References: <1468566426-19598-1-git-send-email-njaigane@codeaurora.org>
 <1468566426-19598-4-git-send-email-njaigane@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1468566426-19598-4-git-send-email-njaigane@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Fri 15 Jul 00:07 PDT 2016, njaigane@codeaurora.org wrote:

> From: Jaiganesh Narayanan <njaigane@codeaurora.org>
> 
> This patch adds the tlmm/pinctrl support for IPQ4019 ASoC.
> 
> Signed-off-by: Jaiganesh Narayanan <njaigane@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-ipq4019.c | 116 +++++++++++++++++++++++++--------
>  1 file changed, 88 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-ipq4019.c b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
[..]
> +	qca_mux_i2s_rx_mclk,
> +	qca_mux_i2s_rx_bclk,
> +	qca_mux_i2s_rx_fsync,
> +	qca_mux_i2s_rxd,
> +	qca_mux_i2s_tx_mclk,
> +	qca_mux_i2s_tx_bclk,
> +	qca_mux_i2s_tx_fsync,
> +	qca_mux_i2s_txd1,
> +	qca_mux_i2s_txd2,
> +	qca_mux_i2s_txd3,
> +	qca_mux_i2s_spdif_out,
> +	qca_mux_i2s_spdif_in,

I would recommend reducing this to "i2s_rx", "i2s_tx", "spdif_rx"
and "spdif_tx", as this will make the dts cleaner.

Regards,
Bjorn
