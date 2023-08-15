Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405B4C3DA40
	for <linux-clk@archiver.kernel.org>; Tue, 15 Aug 2023 18:49:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239415AbjHOStR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Aug 2023 14:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239486AbjHOStN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Aug 2023 14:49:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054712126;
        Tue, 15 Aug 2023 11:48:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 02F6565F66;
        Tue, 15 Aug 2023 18:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89533C433CD;
        Tue, 15 Aug 2023 18:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692125191;
        bh=na3DvkCy/DBRDdjxP4nOxRLkSN6S+gxI8DHXr/qxnlk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Ux0oRjjvmkgRP8eUypXP2QFTtsXJVfCnWm1Wm6qfWnpZuJmxCUv7lNY49/aT282SN
         QeiZv7yIRac9DVvWY9fZcg+gWWAH3xVj2sVBXlVzCE3znq3vA6iVd4J7ZWbjGFXSS2
         Xdo/Es+/9/iB2NnZNOXzWkGIduzoBVYvui9sRYnCtF4veut7EOSO5QDXWWo7b+CtKD
         OlYWvzgIKb8BRR3THd9ZxkHeXxBXwdfH9YMbFjrrvYHdzHFe5/liNmZ1zuU8mFPfqb
         JaIUO2eF9Fpl2RPMMLGuu+YVOEbRBfjcNSOYPRnNrWsoHpNU/mJTEb3Q2cWQ+aajTj
         DmGhVqlJv7ToQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Robert Marko <robert.marko@sartura.hr>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: clock: qcom: ipq4019: add missing networking resets
Date:   Tue, 15 Aug 2023 11:49:13 -0700
Message-ID: <169212535063.2466993.11716205800707340678.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814104119.96858-1-robert.marko@sartura.hr>
References: <20230814104119.96858-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon, 14 Aug 2023 12:40:23 +0200, Robert Marko wrote:
> Add bindings for the missing networking resets found in IPQ4019 GCC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: clock: qcom: ipq4019: add missing networking resets
      commit: 268edfe96ab8de82f1ba64a2098610e256bd6db7
[2/2] clk: qcom: gcc-ipq4019: add missing networking resets
      commit: 9bc66f973988dc4adc29d36824423448f8da8feb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
