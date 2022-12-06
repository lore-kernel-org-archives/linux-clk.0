Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 917D2C47090
	for <linux-clk@archiver.kernel.org>; Tue,  6 Dec 2022 18:19:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbiLFSTj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Dec 2022 13:19:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbiLFSTY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 13:19:24 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07CFFA45D;
        Tue,  6 Dec 2022 10:19:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B4144B81AD7;
        Tue,  6 Dec 2022 18:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96BFC433C1;
        Tue,  6 Dec 2022 18:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670350757;
        bh=rj/mVJVWuy/34su8OwO33Cp8pq0OuQeJZ7/9ytPZOrU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dJjZPPOW7vcRW+9/AeDyJ4GwN+09xCjP+nncRo089HpF6iwf+OA+BKdVuiMRrhMQE
         iP5GsrkIQzplknDPJCaTGSR3cFOTvs+BTaQJil6Ha1h83wsLU+xVujLmBlIJxDRQcY
         +z5vUapZIT/8CeHnh3vZOxJFQM/rAEHPhYrAkLsqK08y+qEoHO7rtLloKFfwiUW8r+
         wO9BHp44xor1JniqEa2V3GTsQ4FJqJKIVTKxTFCIARblNu673K6LlhdegK2/KKp+cG
         tb96piyqlB+SlK/rhqjGGFsqsjNVswGK9VvXSdW7pPsQPQaGVCcnEqyxHsEpdIAw3c
         eoXsCkOfB/BCQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     robert.marko@sartura.hr, sboyd@kernel.org, mturquette@baylibre.com,
        konrad.dybcio@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     luka.perkov@sartura.hr
Subject: Re: [PATCH] clk: qcom: gcc-ipq4019: switch to devm_clk_notifier_register
Date:   Tue,  6 Dec 2022 12:19:15 -0600
Message-Id: <167035074144.3154869.10845823932222956063.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221205113545.575702-1-robert.marko@sartura.hr>
References: <20221205113545.575702-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 5 Dec 2022 12:35:45 +0100, Robert Marko wrote:
> Switch to using devres-managed version of clk_notifier_register(). This
> allows us to drop driver's remove() callback.
> 
> 

Applied, thanks!

[1/1] clk: qcom: gcc-ipq4019: switch to devm_clk_notifier_register
      commit: 52fb1b8e481b423afbb34259be964494ba5b8614

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
