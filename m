Return-Path: <SRS0=qLgl=77=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8524CC433E1
	for <linux-clk@archiver.kernel.org>; Thu, 18 Jun 2020 01:41:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62EA5221F0
	for <linux-clk@archiver.kernel.org>; Thu, 18 Jun 2020 01:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592444484;
	bh=vwPg8yQwOC7KdRKw7KYgCpGvhDYGfVaBJR4Vg7IRaoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=d/jQ0FuQ4ZTK7Z+JpVVji9P7be+8TGgKyj6km9zwk7292yCVpS4MV+RSq1fsu6pDr
	 rTQr8fpyGFi1jXimX/2TadSBPYCftQbRnzdQzv8g9ZrJe9Qf8dfPNaSLs4zsgrQg9W
	 4nSuVpomCbY6cKShXPBia/fj1Hf813iBrny2fijU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731745AbgFRB3s (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Jun 2020 21:29:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:39298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729696AbgFRB3o (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Jun 2020 21:29:44 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8C6B2220B;
        Thu, 18 Jun 2020 01:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592443783;
        bh=vwPg8yQwOC7KdRKw7KYgCpGvhDYGfVaBJR4Vg7IRaoU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IGm0A2qlsU6UQtVaoVLrHQpUD7bPsIg/q2Mv0LIcbDy/FdOFCKfGqKogLulPKlRJQ
         u/apr0xh4xT/HGnBVXGYLRXkNc245pmOyzi2NzcnxRu/arq+OOhwoa+Hp3srlMtM0i
         jhUCPCZRVBH0x9bd4rBPFnmgz7Io+hBu6ZRe+Kv8=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 4.9 65/80] clk: bcm2835: Fix return type of bcm2835_register_gate
Date:   Wed, 17 Jun 2020 21:28:04 -0400
Message-Id: <20200618012819.609778-65-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618012819.609778-1-sashal@kernel.org>
References: <20200618012819.609778-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Nathan Chancellor <natechancellor@gmail.com>

[ Upstream commit f376c43bec4f8ee8d1ba5c5c4cfbd6e84fb279cb ]

bcm2835_register_gate is used as a callback for the clk_register member
of bcm2835_clk_desc, which expects a struct clk_hw * return type but
bcm2835_register_gate returns a struct clk *.

This discrepancy is hidden by the fact that bcm2835_register_gate is
cast to the typedef bcm2835_clk_register by the _REGISTER macro. This
turns out to be a control flow integrity violation, which is how this
was noticed.

Change the return type of bcm2835_register_gate to be struct clk_hw *
and use clk_hw_register_gate to do so. This should be a non-functional
change as clk_register_gate calls clk_hw_register_gate anyways but this
is needed to avoid issues with further changes.

Fixes: b19f009d4510 ("clk: bcm2835: Migrate to clk_hw based registration and OF APIs")
Link: https://github.com/ClangBuiltLinux/linux/issues/1028
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
Link: https://lkml.kernel.org/r/20200516080806.1459784-1-natechancellor@gmail.com
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/bcm/clk-bcm2835.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 73aab6e984cd..2b5075298cdc 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -1295,13 +1295,13 @@ static struct clk_hw *bcm2835_register_clock(struct bcm2835_cprman *cprman,
 	return &clock->hw;
 }
 
-static struct clk *bcm2835_register_gate(struct bcm2835_cprman *cprman,
+static struct clk_hw *bcm2835_register_gate(struct bcm2835_cprman *cprman,
 					 const struct bcm2835_gate_data *data)
 {
-	return clk_register_gate(cprman->dev, data->name, data->parent,
-				 CLK_IGNORE_UNUSED | CLK_SET_RATE_GATE,
-				 cprman->regs + data->ctl_reg,
-				 CM_GATE_BIT, 0, &cprman->regs_lock);
+	return clk_hw_register_gate(cprman->dev, data->name, data->parent,
+				    CLK_IGNORE_UNUSED | CLK_SET_RATE_GATE,
+				    cprman->regs + data->ctl_reg,
+				    CM_GATE_BIT, 0, &cprman->regs_lock);
 }
 
 typedef struct clk_hw *(*bcm2835_clk_register)(struct bcm2835_cprman *cprman,
-- 
2.25.1

