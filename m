Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49937C4321E
	for <linux-clk@archiver.kernel.org>; Mon,  7 Nov 2022 03:13:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbiKGDNn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 6 Nov 2022 22:13:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbiKGDNM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 6 Nov 2022 22:13:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF4FFFAC9;
        Sun,  6 Nov 2022 19:12:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 692CB60BF0;
        Mon,  7 Nov 2022 03:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E8CC43144;
        Mon,  7 Nov 2022 03:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667790776;
        bh=dqb61szR0frlGzxNTrSerfu3NQ7WY30E5ViXWJuVkFQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=D8X0RfpKlnrOJ0TQVGY4N54f8A2DBLkpD+jpS/Nq5IPBdfZiQ4CijCip6Ocudw2XF
         8s4CC3AqV4R6Z0ytyTQCWbNwR9uvLGECs1oyxWin4Xuvj6HBkVU1JQpdA9xskjX4/X
         16ACfbCCcSOBMgJ/9J3lg9cCGgt4OgqSv/eZHS5rIYQKNEjbE7dnXWIrXFLqWK5tIK
         ccdeziwvkJ0AzpHzRz/s1KLDyBiWkd6p76+PBF5XiF66vHg9ABSJyd8PyJnVyeqzS6
         TUUCwzHRfWFk7agga9SlvnjajhmBBl6L9HhoqlsV3Ho2hc5FApdAGQPzt2YSZntAGq
         BrIzBm4X/OYkA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     mturquette@baylibre.com, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, sboyd@kernel.org,
        srinivas.kandagatla@linaro.org, Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH 1/3] dt-bindings: clock: qcom,aoncc-sm8250: fix compatible
Date:   Sun,  6 Nov 2022 21:12:14 -0600
Message-Id: <166779074268.500303.9305035046091868385.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221104174656.123979-1-krzysztof.kozlowski@linaro.org>
References: <20221104174656.123979-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 4 Nov 2022 13:46:54 -0400, Krzysztof Kozlowski wrote:
> The SM8250 AON Clock Controller compatible used by Linux driver and DTS
> is qcom,sm8250-lpass-aoncc.
> 
> 

Applied, thanks!

[1/3] dt-bindings: clock: qcom,aoncc-sm8250: fix compatible
      commit: 42f520f94e1644da423d3d2981be98beda3c4253
[2/3] dt-bindings: clock: qcom,aoncc-sm8250: add missing audio clock
      commit: 850c156fa64f1b23954563ab6614d76e5a6d6af6
[3/3] dt-bindings: clock: qcom,audiocc-sm8250: add missing audio clock
      commit: 618c01c3b2a95ea1e8ef25a005229cb78da64481

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
