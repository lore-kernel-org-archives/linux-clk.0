Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DBD2C4332F
	for <linux-clk@archiver.kernel.org>; Mon,  7 Nov 2022 03:14:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbiKGDOm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 6 Nov 2022 22:14:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbiKGDOO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 6 Nov 2022 22:14:14 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B77810045;
        Sun,  6 Nov 2022 19:13:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AB937B80D94;
        Mon,  7 Nov 2022 03:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C582FC43141;
        Mon,  7 Nov 2022 03:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667790788;
        bh=43OMBDPdLjd/l8543w5DP1nXrhojIwplzo6gqb/MlUw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QN062wLdw6E3shU2kXMli+nSD5sqmSp9FltAXA99ylNJQFhdnQrIDi2MiSfjoyXpK
         792x6v4XyEcpSoKpnhnsMRdfpuJfYpWEW7fAUlAnWZ/9wyQlxSql/8+bIQwOSshPpx
         y/hMBZiRpWZo3b9vJOnlpTRUmM70zy9a7QjqX6C25+L5fQR8FIevC85v8exQz8vBx8
         +jmAM2Rcq68/S4K0/M+CYxCc6nKqLMPykKtTmiC4FcbNUMC+dgaeX/Kl4NSkgTwoJN
         yvHjR93bjgKAwc+uOijm840wopiOykMp2zGYuEass3G4S+oCUhrHv/ATknQSqqIiim
         gU6s8JngqU+CA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
        linux-kernel@vger.kernel.org, sboyd@kernel.org
Subject: Re: [PATCH v2] clk: qcom: gcc-sm8250: Use retention mode for USB GDSCs
Date:   Sun,  6 Nov 2022 21:12:26 -0600
Message-Id: <166779074272.500303.12843032172428817016.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221102091320.66007-1-manivannan.sadhasivam@linaro.org>
References: <20221102091320.66007-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 2 Nov 2022 14:43:20 +0530, Manivannan Sadhasivam wrote:
> USB controllers on SM8250 doesn't work after coming back from suspend.
> This can be fixed by keeping the USB GDSCs in retention mode so that
> hardware can keep them ON and put into rentention mode once the parent
> domain goes to a low power state.
> 
> 

Applied, thanks!

[1/1] clk: qcom: gcc-sm8250: Use retention mode for USB GDSCs
      commit: ac1c5a03d3772b1db25e8092f771aa33f6ae2f7e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
