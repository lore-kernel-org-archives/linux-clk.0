Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CC9C54E76
	for <linux-clk@archiver.kernel.org>; Tue, 17 Jan 2023 19:14:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbjAQTOw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Jan 2023 14:14:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232503AbjAQTKm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Jan 2023 14:10:42 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44FEE5C0D8;
        Tue, 17 Jan 2023 10:24:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D80C861505;
        Tue, 17 Jan 2023 18:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681F4C43392;
        Tue, 17 Jan 2023 18:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673979882;
        bh=F8XeKK/3BDy6f1uhm1VMBY9SKn2X65x6/4C5yft1uYg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dLKo3GKw2lekiOE2y63UN2v6jcTh7ibSeXMLKhY3n5JDPM/feMbawU4rTZz/+1j3B
         Jl34VumRhDPc2DLZAT8JTf/QYN7mGQ/3SaXCot/BJ0yO8lKI507VlJv0n0h3PsNxmd
         motcM5LzimRrgQbeQyHh0b/YENHmkSPtUN+KcourdsTTmjeX0RUOj9GIqM8/mgkvlX
         sdcd0zMIwXNZ8qXXmhP10geNC8F6KQVBdva/kcaWf19JtoL3HUF728sW5vywpStIW8
         Ivn7zMc231QFVvDXTqLqB/t/bGUX17ziPo5esFq74/CH7Y2YnXjpnIQd5/JHqa3qzC
         94o2DvamjCqsQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     devicetree@vger.kernel.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, mturquette@baylibre.com,
        tdas@codeaurora.org, agross@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@linaro.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: qcom,videocc: correct clocks per variant
Date:   Tue, 17 Jan 2023 12:24:27 -0600
Message-Id: <167397986254.2832389.7731654472779671132.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221224154152.43272-1-krzysztof.kozlowski@linaro.org>
References: <20221224154152.43272-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 24 Dec 2022 16:41:52 +0100, Krzysztof Kozlowski wrote:
> Different SoCs come with a bit different clock inputs:
> 
>   sm8250-mtp.dtb: clock-controller@abf0000: clock-names:0: 'bi_tcxo' was expected
>   sm8250-mtp.dtb: clock-controller@abf0000: clock-names: ['iface', 'bi_tcxo', 'bi_tcxo_ao'] is too long
> 
> 

Applied, thanks!

[1/1] dt-bindings: clock: qcom,videocc: correct clocks per variant
      commit: 06839dfc87984ae73d2204a8efa4c7e7b6e12d97

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
