Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FC7C678D5
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 05:19:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235804AbjAKFTG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 00:19:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbjAKFSH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 00:18:07 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AAD513DD3;
        Tue, 10 Jan 2023 21:09:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E0C6B61A34;
        Wed, 11 Jan 2023 05:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA84C433EF;
        Wed, 11 Jan 2023 05:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673413790;
        bh=8T+8nScsj6h7UAaq3JbWj4lsi2Ok/kNZGDGLdst/u3A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Uywpe3V/Hbx3iZbKhwIOOsNkxpKZgXqzn1UBosDj0NeMhgEz9q5zXTQS7yHfxRLP+
         pyefyyVJMiyN5IeEYhEAhk8jAss6ZITlVxtpAymXTF/tyfA0sqO05LEmbzfL5HkZ4r
         BbtPb6DVZvbYtrQ3XF+8aHZW7BOKsGZcqPGIi/DWDhXlljdVuxKlnvfkD0lyFaSIqo
         zs3Bws17fIguplQ80kMO6dwADuULp0I3TBdyAha50nmzl20HUXZLSQ7fpp/vzzqcWe
         g9NZL4twVm+E1VH5wFdz/x3JkXY/Y7ljGZ7riMrRaYM1wBzEbVAT8T5nw0IjyFJSjO
         IjDLPre1NmrqQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, konrad.dybcio@linaro.org,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: clk-spmi-pmic-div: convert to use parent_data
Date:   Tue, 10 Jan 2023 23:09:15 -0600
Message-Id: <167341377720.2246479.15585168622539676439.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221210191013.453040-1-dmitry.baryshkov@linaro.org>
References: <20221210191013.453040-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 10 Dec 2022 22:10:13 +0300, Dmitry Baryshkov wrote:
> The clk-spmi-pmic-div driver gets the parent name from the first (and
> the only) clock parent. So, use parent data, index 0 to setup the clock.
> 
> 

Applied, thanks!

[1/1] clk: qcom: clk-spmi-pmic-div: convert to use parent_data
      commit: a622c1dc84d920f231df539b3013c58a15fa2a19

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
