Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3356AC6FA92
	for <linux-clk@archiver.kernel.org>; Tue, 27 Sep 2022 13:16:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbiI0NQg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Sep 2022 09:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232584AbiI0NQJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Sep 2022 09:16:09 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0071C1659B
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 06:16:06 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.188.neoplus.adsl.tpnet.pl [95.49.29.188])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 509EE3F412;
        Tue, 27 Sep 2022 15:16:04 +0200 (CEST)
Message-ID: <a86c08b0-9dc0-ab36-022a-d3e8397c756a@somainline.org>
Date:   Tue, 27 Sep 2022 15:16:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 3/3] ARM: dts: qcom-ipq8064: use pll4 clock for the gcc
 device
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
        devicetree@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
References: <20220927113826.246241-1-dmitry.baryshkov@linaro.org>
 <20220927113826.246241-4-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220927113826.246241-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 27.09.2022 13:38, Dmitry Baryshkov wrote:
> Add a link to LCC's PLL4 clock to the GCC device node following the
> bindings (and driver needs).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 90c08b51680a..a79f8b5fe12d 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -513,8 +513,8 @@ mux {
>  
>  		gcc: clock-controller@900000 {
>  			compatible = "qcom,gcc-ipq8064", "syscon";
> -			clocks = <&pxo_board>, <&cxo_board>;
> -			clock-names = "pxo", "cxo";
> +			clocks = <&pxo_board>, <&cxo_board>, <&lcc PLL4>;
> +			clock-names = "pxo", "cxo", "pll4";
>  			reg = <0x00900000 0x4000>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
