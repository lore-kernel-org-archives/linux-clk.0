Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9988C433DB
	for <linux-clk@archiver.kernel.org>; Sat, 30 Jan 2021 17:23:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADFB664DE1
	for <linux-clk@archiver.kernel.org>; Sat, 30 Jan 2021 17:23:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231279AbhA3RXZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 30 Jan 2021 12:23:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbhA3RXY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 30 Jan 2021 12:23:24 -0500
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345D7C061574
        for <linux-clk@vger.kernel.org>; Sat, 30 Jan 2021 09:22:29 -0800 (PST)
Received: from [192.168.1.101] (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 00E0C3E8B4;
        Sat, 30 Jan 2021 18:21:27 +0100 (CET)
Subject: Re: [PATCH v2 00/11] Clock fixes for MSM8998 GCC, MMCC, GPUCC
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org
Cc:     marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <2b682fa5-0403-df04-6805-3e431df4fca8@somainline.org>
Date:   Sat, 30 Jan 2021 18:21:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 14.01.2021 23:10, AngeloGioacchino Del Regno wrote:
> This patch series fixes some issues with the MSM8998 clocks and, in
> particular, brings a very important fix to the GCC PLLs.
>
> These fixes are enhancing this SoC's stability and also makes it
> possible to eventually enable the Adreno GPU (with proper clock
> scaling) and other components.
>
> This patch series was tested on:
> - Sony Xperia XZ Premium (MSM8998)
> - F(x)Tec Pro1 (MSM8998)
>
> AngeloGioacchino Del Regno (11):
>   dt-bindings: clocks: gcc-msm8998: Add GCC_MMSS_GPLL0_CLK definition
>   clk: qcom: gcc-msm8998: Wire up gcc_mmss_gpll0 clock
>   dt-bindings: clock: gcc-msm8998: Add HMSS_GPLL0_CLK_SRC definition
>   clk: qcom: gcc-msm8998: Add missing hmss_gpll0_clk_src clock
>   clk: qcom: gcc-msm8998: Mark gpu_cfg_ahb_clk as critical
>   clk: qcom: gcc-msm8998: Fix Alpha PLL type for all GPLLs
>   clk: qcom: mmcc-msm8998: Set CLK_GET_RATE_NOCACHE to pixel/byte clks
>   clk: qcom: mmcc-msm8998: Add hardware clockgating registers to some
>     clks
>   clk: qcom: mmcc-msm8998: Set bimc_smmu_gdsc always on
>   clk: qcom: gpucc-msm8998: Add resets, cxc, fix flags on gpu_gx_gdsc
>   clk: qcom: gpucc-msm8998: Allow fabia gpupll0 rate setting
>
>  drivers/clk/qcom/gcc-msm8998.c               | 143 ++++++++++++-------
>  drivers/clk/qcom/gpucc-msm8998.c             |  18 ++-
>  drivers/clk/qcom/mmcc-msm8998.c              |  20 ++-
>  include/dt-bindings/clock/qcom,gcc-msm8998.h |   2 +
>  4 files changed, 125 insertions(+), 58 deletions(-)


Bump! I can tell all of these patches work as they should :)

