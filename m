Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E315C5479D
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 05:19:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235944AbjAKFTV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 00:19:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231841AbjAKFSQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 00:18:16 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3524C13F0F;
        Tue, 10 Jan 2023 21:10:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C706C61A32;
        Wed, 11 Jan 2023 05:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63910C433EF;
        Wed, 11 Jan 2023 05:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673413806;
        bh=aUggy9Y62tG/UjSmUEwgrWS1ypNcMdK/bOkpPWk72YI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ow1M6k5cAM1cDPiVSEemiQnaDJE75yaEDIioo50evyaXdbGbAE1gt97ASo37zwLiE
         WweGQDW0E/+mT01v+XgTGGklF6GO520rI6xwnJMQVJxqrIDglDdl5J+yFBqatO5363
         a33KEXsnWUrM/ObCNX1q+oSxeSFUKlV1uyyZkzMmcDLQkeGnye4SBcHI82qA4B/RFd
         DFyev82TXiQwH2jONVzB9vFPuKywMxfEniW7ooDDRGlzmsX0gcFUdNh20JWCli1XpP
         rM1CTGjvMZHQZyU+kqXve+wYAs/85rMm6EPBU41SpfMBe8Tdx1nyx6Av1GhcrOjsvs
         ak6gvbLqf2YjQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-clk@vger.kernel.org, konrad.dybcio@linaro.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        sboyd@kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: clock: qcom,spmi-clkdiv: convert to DT schema
Date:   Tue, 10 Jan 2023 23:09:31 -0600
Message-Id: <167341377730.2246479.10494358695788234107.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221223111835.37610-1-krzysztof.kozlowski@linaro.org>
References: <20221223111835.37610-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 23 Dec 2022 12:18:35 +0100, Krzysztof Kozlowski wrote:
> Convert Qualcomm SPMI PMIC clock divider bindings to DT schema.
> 
> 

Applied, thanks!

[1/1] dt-bindings: clock: qcom,spmi-clkdiv: convert to DT schema
      commit: 3c4af3ab1f68ddceb548094d680bc71806a09aee

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
