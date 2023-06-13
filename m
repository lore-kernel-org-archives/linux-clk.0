Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DEFC001B1
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 22:29:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240572AbjFMW3K (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 18:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240530AbjFMW2k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 18:28:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E556426AE;
        Tue, 13 Jun 2023 15:27:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 082E963BA8;
        Tue, 13 Jun 2023 22:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D89FC43215;
        Tue, 13 Jun 2023 22:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686695257;
        bh=oFxjCbMpXtdDklFcivLTiGvcTRj8zu6BAGQ3Q3zUXFI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M9ddCYqpxShBvZDvHI9+Ynhv87KtOe1JGtEl5c8PpsQEP+Q6EYv0Yftb/xQSAYx2m
         5+Gd8cbGwnkni5R1+tOWLPVYaYnh+pNSg+jdNpBNjiQou6Wn79/DGxitVHMrtBtrRq
         L8ruF0hybaPu8/q+M0w4tQK7+4oFBb3EAnYraUjfvJ0NoL022Gbo9NfmUviv45c3yi
         VvIBBWawaerhPZ1RQ80ksV649SOF0W8RlXhKDV2jJ/TP4JnzB6Or14lzrgQ8xcZvMV
         pohlukNvCALrECvt6J17YmAZ/TbpIraiCujE+TQ/GikxXeCsqSUsff1dH1KOfUkNrS
         IkvLq/Y4oZhaw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Yassine Oudjana <yassine.oudjana@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] MSM8996 Pro CBF scaling support
Date:   Tue, 13 Jun 2023 15:30:33 -0700
Message-Id: <168669542896.1315701.6467241070832256000.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230527093934.101335-1-y.oudjana@protonmail.com>
References: <20230527093934.101335-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 27 May 2023 12:39:31 +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> MSM8996 Pro has a /4 post divisor on its CBF PLL instead of /2, allowing
> it to reach 192000000Hz on the lowest CPU OPPs (compared to 307200000Hz
> on MSM8996). Add a compatible string to differentiate between the two and
> handle the different divisor in the driver. Finally, add peak bandwidths
> to CPU OPPs in msm8996pro.dtsi.
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: msm8996pro: Add CBF scaling support
      commit: 34354cc946abe6b6e4b71883dddfdd368e856d65

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
