Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727067AbeH2Cwh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 28 Aug 2018 22:52:37 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Douglas Anderson <dianders@chromium.org>, andy.gross@linaro.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180724174513.174018-2-dianders@chromium.org>
Cc: tdas@codeaurora.org, girishm@codeaurora.org,
        linux-arm-msm@vger.kernel.org, anischal@codeaurora.org,
        bjorn.andersson@linaro.org, grahamr@codeaurora.org,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20180724174513.174018-1-dianders@chromium.org>
 <20180724174513.174018-2-dianders@chromium.org>
Message-ID: <153549712610.129321.16004641950033414292@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 1/2] clk: qcom: Add qspi (Quad SPI) clock defines for sdm845
 to header
Date: Tue, 28 Aug 2018 15:58:46 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Douglas Anderson (2018-07-24 10:45:12)
> These clocks will need to be defined in the clock driver and
> referenced in device tree files.
> =

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Applied to clk-next
