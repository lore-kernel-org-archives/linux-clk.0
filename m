Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0D5C77B7E
	for <linux-clk@archiver.kernel.org>; Thu, 25 May 2023 04:53:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239319AbjEYExN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 May 2023 00:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235890AbjEYEwQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 May 2023 00:52:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9262E7C;
        Wed, 24 May 2023 21:51:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D997D641A5;
        Thu, 25 May 2023 04:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8306CC433A8;
        Thu, 25 May 2023 04:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684990277;
        bh=IBwADQMHfUX0D+FWwwaxvN/57wn55MLeOksmDYT0+a4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tYH3sgq/gFYKmq38mLKrGF7/ViUN4V6APP/9w2bujPyGjenRSM1+90fcp1sn8g/F5
         DDTBDRl4fkvBUrHnDm7fvfEsft26Z3fkuisVSx6coBUZ8iA8RJxNbavJqGNwgbqmLc
         xr8h2yewoozAz159p6RtTm8ToGffBttgN6NwCFV4BUq7d7FcYsvphhtmirQMMtkZvU
         r4uK+ybEFQfEqDZvj2fh8GcDjCY5nDfpkui+DM0Tisonfzh6vj4GjvW+9UbELRkIEh
         n8nNhquA6Bam10LKrrFOzgEMxZ6cE0halLlHOh/iiyP+MGoVw+qb6BLf++iGw0CIgH
         ZBQ0bxvrSLEBg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        marijn.suijten@somainline.org,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH] clk: qcom: gcc-qcm2290: Mark RCGs shared where applicable
Date:   Wed, 24 May 2023 21:53:57 -0700
Message-Id: <168499048182.3998961.2731147056718162826.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403174807.345185-1-konrad.dybcio@linaro.org>
References: <20230403174807.345185-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 3 Apr 2023 19:48:07 +0200, Konrad Dybcio wrote:
> The vast majority of shared RCGs were not marked as such. Fix it.
> 
> 

Applied, thanks!

[1/1] clk: qcom: gcc-qcm2290: Mark RCGs shared where applicable
      commit: 7bf654a0d95e75b415f454e10627309d650762d0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
