Return-Path: <SRS0=QcJy=QS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D302C169C4
	for <linux-clk@archiver.kernel.org>; Mon, 11 Feb 2019 07:40:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF56321736
	for <linux-clk@archiver.kernel.org>; Mon, 11 Feb 2019 07:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1549870810;
	bh=RJ8BIgMmiSrtEIRpXaiHuIyhFM5n/7v/Gid9I7zq9ww=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=2lYzbr7IjdWvqTCQBykZP2aNQBfVvhOqbDdeuIpdOnxnSdltp8VQxgmSrzrStt9g/
	 7qx4qcFXIJaXI8dRgbRJ+szmACBFGMUnJqw5wpBJwvb3YeiBYSrbyayldp2+Tr1D9A
	 dJdZtNvzrzUlJmqk64Nuiu8nnKDYN2SNoUwy/pag=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbfBKHkJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Feb 2019 02:40:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:57306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725931AbfBKHkJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 11 Feb 2019 02:40:09 -0500
Received: from localhost.localdomain (unknown [117.99.91.83])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 29B02214DA;
        Mon, 11 Feb 2019 07:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1549870808;
        bh=RJ8BIgMmiSrtEIRpXaiHuIyhFM5n/7v/Gid9I7zq9ww=;
        h=From:To:Cc:Subject:Date:From;
        b=oi3O7C8eXR9EEynP3bVIseps7iDHHZsehGcdtAT53texBtixDZvnlQtV6BxOmgziK
         M4nO65UJnaHgX2esje/lcfA/QG6B+JEKj99s5KrGCrnZEKF9LPZOB98vFqk/pp+e9l
         eG3NuatKEL0K/wPTjjqDlpLd9I7Rn+XDKUiARjQ8=
From:   Vinod Koul <vkoul@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 1/3] clk: qcom: remove empty lines in clk-rcg.h
Date:   Mon, 11 Feb 2019 13:09:26 +0530
Message-Id: <20190211073928.20456-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove the redundant empty lines crept in.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
Changes in v2:
	Add new patch to remove empty line

 drivers/clk/qcom/clk-rcg.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index e5eca8a1abe4..91336a030179 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -71,7 +71,6 @@ struct src_sel {
  * @freq_tbl: frequency table
  * @clkr: regmap clock handle
  * @lock: register lock
- *
  */
 struct clk_rcg {
 	u32		ns_reg;
@@ -107,7 +106,6 @@ extern const struct clk_ops clk_rcg_lcc_ops;
  * @freq_tbl: frequency table
  * @clkr: regmap clock handle
  * @lock: register lock
- *
  */
 struct clk_dyn_rcg {
 	u32	ns_reg[2];
@@ -140,7 +138,6 @@ extern const struct clk_ops clk_dyn_rcg_ops;
  * @parent_map: map from software's parent index to hardware's src_sel field
  * @freq_tbl: frequency table
  * @clkr: regmap clock handle
- *
  */
 struct clk_rcg2 {
 	u32			cmd_rcgr;
-- 
2.20.1

