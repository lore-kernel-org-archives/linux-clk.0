Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF2AECAAA1
	for <linux-clk@archiver.kernel.org>; Mon, 31 Oct 2022 21:05:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbiJaVF6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Oct 2022 17:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbiJaVF5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Oct 2022 17:05:57 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5832E13F7A
        for <linux-clk@vger.kernel.org>; Mon, 31 Oct 2022 14:05:57 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.156.neoplus.adsl.tpnet.pl [95.49.29.156])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 225503EBCC;
        Mon, 31 Oct 2022 22:05:55 +0100 (CET)
Message-ID: <eda3413e-4da0-ecfb-0187-576e3aaac9ed@somainline.org>
Date:   Mon, 31 Oct 2022 22:05:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 10/11] ARM: dts: qcom: msm8974: add clocks and
 clock-names to gcc device
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221030155520.91629-1-dmitry.baryshkov@linaro.org>
 <20221030155520.91629-11-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20221030155520.91629-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 30.10.2022 16:55, Dmitry Baryshkov wrote:
> Add clocks and clock-names nodes to the gcc device to bind clocks using
> the DT links.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 7f8b4356ccdb..4e70f51c8750 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -1054,6 +1054,10 @@ gcc: clock-controller@fc400000 {
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
>  			reg = <0xfc400000 0x4000>;
> +
> +			clock-names = "xo", "sleep_clk";
> +			clocks = <&xo_board>,
> +				 <&sleep_clk>;
I think it would make sense to either have both properties take up either
one or two lines.

Other than that though:

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad

>  		};
>  
>  		rpm_msg_ram: sram@fc428000 {
