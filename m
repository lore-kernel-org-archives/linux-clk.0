Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92834C77B7A
	for <linux-clk@archiver.kernel.org>; Thu, 25 May 2023 04:53:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239359AbjEYExS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 May 2023 00:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239101AbjEYEwR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 May 2023 00:52:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9157810C3;
        Wed, 24 May 2023 21:51:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C0E2F641D3;
        Thu, 25 May 2023 04:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8495DC4339E;
        Thu, 25 May 2023 04:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684990278;
        bh=HxdKp/NM3onxOP4go6rBn6A56LFrsfs/xBqOcb1Gpz8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WK2Ffwuzk3Fs9P0CzWH8GOoXsnXcG4z/5lgTiQNlsEwOBLbMdJDlIWu/xxk9xMDm3
         8izAZ9baRhP34a6FV2/d/7HwZp4TblK56h9NkosxVASsrU0/Mt0OI/ZOH87DzfVMvA
         tt+26qIACDUlwnCfGIdyVOgasRg+To4X1/iLx4mm3TiXZ0aCrJiprPSOCCHStKTsNS
         g/oe+sVt8QfxxZxvV9m+DpCrIjlFmnm2NX8ydGwDB1ZMCTbRSszm/vUZcgdfCcFCJk
         5NItPMTEd8G7bWtzmc9TUi8dEsDZK2Dpvw4Yu830vDJ6Vc5JAKaiP8s7hLs7WkEPbX
         Bp7VKGJYFcHEg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>, sboyd@kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        marijn.suijten@somainline.org
Subject: Re: [PATCH] clk: qcom: smd-rpm: Keep one rpm handle for all clocks
Date:   Wed, 24 May 2023 21:53:58 -0700
Message-Id: <168499048179.3998961.2841260621600482968.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501130400.107771-1-konrad.dybcio@linaro.org>
References: <20230501130400.107771-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 1 May 2023 15:04:00 +0200, Konrad Dybcio wrote:
> For no apparent reason (as there's just one RPM per SoC), all clocks
> currently store a copy of a pointer to smd_rpm. Introduce a single,
> global one to save up on space in each clk definition.
> 
> bloat-o-meter reports:
> 
> Total: Before=41887, After=40843, chg -2.49%
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: smd-rpm: Keep one rpm handle for all clocks
      commit: caa2347d0224116d5083afa670c46094e0ceeff3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
