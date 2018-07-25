Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:51307 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728436AbeGYRNZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Jul 2018 13:13:25 -0400
Date: Wed, 25 Jul 2018 10:01:02 -0600
From: Rob Herring <robh@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: sboyd@kernel.org, andy.gross@linaro.org, tdas@codeaurora.org,
        girishm@codeaurora.org, linux-arm-msm@vger.kernel.org,
        anischal@codeaurora.org, bjorn.andersson@linaro.org,
        grahamr@codeaurora.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 1/2] clk: qcom: Add qspi (Quad SPI) clock defines for
 sdm845 to header
Message-ID: <20180725160102.GA18545@rob-hp-laptop>
References: <20180724174513.174018-1-dianders@chromium.org>
 <20180724174513.174018-2-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180724174513.174018-2-dianders@chromium.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jul 24, 2018 at 10:45:12AM -0700, Douglas Anderson wrote:
> These clocks will need to be defined in the clock driver and
> referenced in device tree files.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  include/dt-bindings/clock/qcom,gcc-sdm845.h | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
