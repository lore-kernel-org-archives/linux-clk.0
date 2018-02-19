Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ot0-f193.google.com ([74.125.82.193]:36081 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752173AbeBSDML (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 18 Feb 2018 22:12:11 -0500
Date: Sun, 18 Feb 2018 21:12:09 -0600
From: Rob Herring <robh@kernel.org>
To: Ilia Lin <ilialin@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org,
        devicetree@vger.kernel.org, mark.rutland@arm.com,
        will.deacon@arm.com, rnayak@codeaurora.org,
        amit.kucheria@linaro.org, nicolas.dechesne@linaro.org,
        celster@codeaurora.org, tfinkel@codeaurora.org
Subject: Re: [PATCH v3 04/10] clk: qcom: Add DT bindings for CPU clock driver
 for msm8996
Message-ID: <20180219031209.5yywl4heny46hlue@rob-hp-laptop>
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org>
 <1518616792-29028-5-git-send-email-ilialin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1518616792-29028-5-git-send-email-ilialin@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Feb 14, 2018 at 03:59:46PM +0200, Ilia Lin wrote:
> Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,kryocc.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,kryocc.txt

Reviewed-by: Rob Herring <robh@kernel.org>
