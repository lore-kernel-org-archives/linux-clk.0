Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335CCC4321E
	for <linux-clk@archiver.kernel.org>; Fri,  2 Dec 2022 20:58:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbiLBU66 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Dec 2022 15:58:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234097AbiLBU65 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Dec 2022 15:58:57 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8449E98BF;
        Fri,  2 Dec 2022 12:58:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6305F623E4;
        Fri,  2 Dec 2022 20:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1412AC43141;
        Fri,  2 Dec 2022 20:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670014735;
        bh=gZFQmYMl3O1AnlKbfpIpV3NDpXuaHZU8zBfh4OaBZ90=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Vay7YPL7lQ/qocPg/vkWTHYjt38S+4pcgtTVCcKMYAAe1IHbGD3H1ruYmILWIx2M8
         FY0iXB31FYCkkiebHyzJ2oq9KRt9yZuiAh+DmY+HeR67OHGELOb27T4BOCovHN9B+f
         n9H6VNkGYosRFb5V7FN0tqYVP3p/z3ocXDq/ImmhUoYfEpdKpk/jrakqTyjoHXEKoJ
         8eRSrfHxYUgvALUaS1pBZemfXwQC1WE+MPMHQT0E/EK1+xnV0IcgOdaWiyBdzcQTlC
         SYbdhTUpR3R2rT7CzEgiC9qOqtyc/GRBbKEcoOnrCU6o5fALlUBaTnbRP0DeKLWfIq
         iPAHgfxjC7JWA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     konrad.dybcio@somainline.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, mturquette@baylibre.com,
        agross@kernel.org, sricharan@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: clk-krait: fix wrong div2 functions
Date:   Fri,  2 Dec 2022 14:58:41 -0600
Message-Id: <167001472422.2721945.5450579392925679034.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221108215625.30186-1-ansuelsmth@gmail.com>
References: <20221108215625.30186-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 8 Nov 2022 22:56:25 +0100, Christian Marangi wrote:
> Currently div2 value is applied to the wrong bits. This is caused by a
> bug in the code where the shift is done only for lpl, for anything
> else the mask is not shifted to the correct bits.
> 
> Fix this by correctly shift if lpl is not supported.
> 
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: clk-krait: fix wrong div2 functions
      commit: d676d3a3717cf726d3affedbe5ba98fc4ccad7b3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
