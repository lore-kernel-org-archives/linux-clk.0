Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDCEC7EE31
	for <linux-clk@archiver.kernel.org>; Thu, 25 May 2023 04:51:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235890AbjEYEvC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 May 2023 00:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233805AbjEYEvA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 May 2023 00:51:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75AEBB3;
        Wed, 24 May 2023 21:50:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 572CD63C35;
        Thu, 25 May 2023 04:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B844C433D2;
        Thu, 25 May 2023 04:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684990258;
        bh=X9PcEFDhLflO0CVSmLfs79cX0NDbZFaZiAXXrqkyB/s=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dlUO1/7kmAg6rHyDCIq0W86lelKvy0x3bNpq7NcW5TdZzRIdhz3UkqDOkjy+Gf5Sp
         quFs8lRaDlspaCrMvNIUPFxckhazY3XZMWHfxcmnJQgtIT3QxtCDzB/0ClbCh2gX9B
         qIoZEJQTKD+59IZIzBPZ5af6wwJykchypP68nuIzCpvIZwvpZ7vfhuHKF2+iuEodMz
         HJeAtLRNCw18opaBHwZ7n1BNxVnCtpblms1qajtRqlclFXBg88cOMClWoBjQCUPG9z
         98s1uY50G8OEXqAijTKEw0rfaHVBWFJrB6eA7b1wT6TCUIwgfrUNrREU6Z4gmEVo8T
         6u2BbajJYdJ9A==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: (subset) [PATCH 1/2] clk: qcom: gcc-ipq6018: drop redundant F define
Date:   Wed, 24 May 2023 21:53:38 -0700
Message-Id: <168499048184.3998961.9219739221659759859.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417174408.23722-1-ansuelsmth@gmail.com>
References: <20230417174408.23722-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 17 Apr 2023 19:44:07 +0200, Christian Marangi wrote:
> The same exact F frequency table entry is defined in clk-rcg.h
> Drop the redundant define to cleanup code.
> 
> 

Applied, thanks!

[1/2] clk: qcom: gcc-ipq6018: drop redundant F define
      commit: 923f7d678b2ae3d522543058514d5605c185633b
[2/2] clk: qcom: gcc-sdm660: drop redundant F define
      commit: bbd899f53412b79cbc46e7144437bb75302b1b80

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
