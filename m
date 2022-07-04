Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF4DC433EF
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jul 2022 17:38:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbiGDRie (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Jul 2022 13:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbiGDRie (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Jul 2022 13:38:34 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBDF22DC7
        for <linux-clk@vger.kernel.org>; Mon,  4 Jul 2022 10:38:33 -0700 (PDT)
Received: from [192.168.1.101] (abxi46.neoplus.adsl.tpnet.pl [83.9.2.46])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B812A2059C;
        Mon,  4 Jul 2022 19:38:31 +0200 (CEST)
Message-ID: <5ac4575a-c5ea-82f7-db50-a28a0f229155@somainline.org>
Date:   Mon, 4 Jul 2022 19:38:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/6] clk: qcom: Add driver for MSM8909 GCC
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>
References: <20220704133000.2768380-1-stephan.gerhold@kernkonzept.com>
 <20220704133000.2768380-3-stephan.gerhold@kernkonzept.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220704133000.2768380-3-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 4.07.2022 15:29, Stephan Gerhold wrote:
> The Global Clock Controller (GCC) in the MSM8909 SoC provides clocks,
> resets and power domains for the various hardware blocks in the SoC.
> Add a driver to allow controlling them, which allows to enable
> additional functionality for the SoC.
> 
> Work on this driver was originally started independently by Dominik,
> I picked it up and added missing clocks/resets, as well as various
> cleanup to bring it into shape for mainline.
> 
> Co-developed-by: Dominik Kobinski <dominikkobinski314@gmail.com>
> Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
Looks good,

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad


[snipped the rest]
