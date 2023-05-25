Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB5BC77B7A
	for <linux-clk@archiver.kernel.org>; Thu, 25 May 2023 04:56:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239530AbjEYE4I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 May 2023 00:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239556AbjEYEyk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 May 2023 00:54:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37DF3173C;
        Wed, 24 May 2023 21:52:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 92A9A641D3;
        Thu, 25 May 2023 04:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59141C433D2;
        Thu, 25 May 2023 04:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684990299;
        bh=mqywyp55t3zt0pDnj/vf2I4qIDtfPhn2nPyF55RY1LA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uZj418iKUgYNygP6iMlTgHYO57LS4h31v0vQ678w6s1L+nQ3PYwGxJrHSQD/CX9NI
         yGv/SgFBLiwXCwFbpFk+yiGvWz1WEGC8ICWzkFLpHTyfh98GseTc4cAJ7nyd0EK99e
         ourwekrm4MvqF2Xua/ct9x6qrLr6yR+jZhj0bVCD2+MaGdSmCvTJdTAS2lFmvCncxm
         YA+Kx+Y28ZutQiRbOSCJqINjczeRu3DEm78IgV1Cs61bGd2p2aVoOrzDU2rjOB37pR
         CIiT74tSDAkjrZZPkOAxwlFu2h+fVl3gAQC9e4pufRGDbXc+/1zsygWGz7chVUIILy
         dw/59u8kJAJhA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v2] clk: qcom: restrict drivers per ARM/ARM64
Date:   Wed, 24 May 2023 21:54:18 -0700
Message-Id: <168499048185.3998961.5762782047515714184.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230514114711.18258-1-krzysztof.kozlowski@linaro.org>
References: <20230514114711.18258-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 14 May 2023 13:47:11 +0200, Krzysztof Kozlowski wrote:
> There is no point to allow selecting clock controller drivers for
> Qualcomm ARMv7 SoCs when building ARM64 kernel, and vice versa.  This
> makes kernel configuration more difficult as many do not remember the
> Qualcomm SoCs model names/numbers.  No features should be lost because:
> 1. There won't be a single image for ARMv7 and ARMv8/9 SoCs.
> 2. Newer ARMv8/9 SoCs won't be running in arm32 emulation mode.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: restrict drivers per ARM/ARM64
      commit: ab7f00379fe90506e5e9af4e03e6935fb8deb9fd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
