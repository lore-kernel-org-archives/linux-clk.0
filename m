Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A966C6FA8E
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 03:49:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232575AbiI1DtK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Sep 2022 23:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232396AbiI1DtI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Sep 2022 23:49:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A1F13F71F;
        Tue, 27 Sep 2022 20:49:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ED4B261D0D;
        Wed, 28 Sep 2022 03:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C858C433C1;
        Wed, 28 Sep 2022 03:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664336947;
        bh=vKtnHgqNmxc0MBZ0iXwtMEpocyQKhZGM20CiD0JiQpk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iUIvExHCffOdSGToksVnhu8dqdEV+qlbzjcWnYzCv7Q3Y5QIT8dFWOYj9vdnFj86q
         tDU3ecGoHcnfqU/b6TuPOnqiYHUHn+xfBsrrCYmUVy/LLh8ZwPMXY/UgaEiPdh5iqt
         WyBa/udMVoa4No6/NdBw38RS0xnBejzc/wlXwTcZ8W56aXtzNQcSwd5/378jYQ+ib2
         U75Jwblx9L1xkRIxQwFpBh4jc8Xma3RPQQUi7G5u0ydfyTfkmkLOP3GG9TWPVgN/4F
         aJ4Oh6mmzcGjr/sC8HGcVMKDR0v3VUSRNdYSJMraeU2OFhZl/6T9vuoyOfIr7HKIm8
         tc3+OL3cVl15Q==
From:   Bjorn Andersson <andersson@kernel.org>
To:     ~postmarketos/upstreaming@lists.sr.ht, konrad.dybcio@somainline.org
Cc:     marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        sboyd@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-clk@vger.kernel.org, mturquette@baylibre.com,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        martin.botka@somainline.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 1/3] clk: qcom: alpha: Add support for programming the PLL_FSM_LEGACY_MODE bit
Date:   Tue, 27 Sep 2022 22:49:04 -0500
Message-Id: <166433694017.1852584.14963457944188225821.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220921001303.56151-1-konrad.dybcio@somainline.org>
References: <20220921001303.56151-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 21 Sep 2022 02:13:01 +0200, Konrad Dybcio wrote:
> This is used on at least SM6375 and its variations.
> 
> 

Applied, thanks!

[1/3] clk: qcom: alpha: Add support for programming the PLL_FSM_LEGACY_MODE bit
      commit: dc99bbfe48e4f3b4827dc5b04a8642c23a12917e
[2/3] dt-bindings: clock: add SM6375 QCOM global clock bindings
      commit: 43398afc0b561925a9ce57555afe3af2ddef8d35
[3/3] clk: qcom: Add global clock controller driver for SM6375
      commit: 184fdd873d83bfcfdd25310ae3f2d7eb8dc5224a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
