Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965782AbeCSRqi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Mar 2018 13:46:38 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Ilia Lin <ilialin@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        sboyd@codeaurora.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1518616792-29028-5-git-send-email-ilialin@codeaurora.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
        rnayak@codeaurora.org, robh@kernel.org, will.deacon@arm.com,
        amit.kucheria@linaro.org, tfinkel@codeaurora.org,
        ilialin@codeaurora.org, nicolas.dechesne@linaro.org,
        celster@codeaurora.org
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org>
 <1518616792-29028-5-git-send-email-ilialin@codeaurora.org>
Message-ID: <152148159682.242365.14310882079879566131@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 04/10] clk: qcom: Add DT bindings for CPU clock driver for
 msm8996
Date: Mon, 19 Mar 2018 10:46:36 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Ilia Lin (2018-02-14 05:59:46)
> Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,kryocc.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,kryocc.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,kryocc.txt b/Documentation/devicetree/bindings/clock/qcom,kryocc.txt
> new file mode 100644
> index 0000000..e7cf15a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,kryocc.txt
> @@ -0,0 +1,17 @@
> +Qualcomm CPUSS clock controller for Kryo CPUs
> +----------------------------------------------------
> +
> +Required properties :
> +- compatible : shall contain only one of the following:
> +
> +                       "qcom-msm8996-apcc"

Do you mean qcom,msm8996-apcc?

Rob?
