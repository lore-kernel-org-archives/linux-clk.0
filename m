Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795822962;
	b=WdK37Th7hgM88e5aqrG35C7Fbc6PQkJf7rq7pRjEjTOn+7fubnSM//ROAk4TNSilzgPD
	 PKiKcdwaYexaANW3vxEUrCXF1MINTsOpBKdjj3N+iogiEEK6rDiFe9B29UAUPNuJCcC+B
	 eyQw44kHD4DMQxCR25cKXCTzCMpMhHeoDEEbvCnXCiLfTHJww1MLwpyOqlO8OPUbGeZvM
	 vY+tnUI1KUwvMSxUxCU9YDGPiUQ3LCLOf/fLqulEjfDRkNkzvPIYRsX57byUalr1u0HuR
	 6AKPcrnJ9yVqCg4VuUjx5rTZNc8NbdIq4g8eY7sBpJlGDse4AcgF/IYBkujNhLqTpNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795822962;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=XZW7HoJlvzZWJEECVtCjZszj1uhHhZwfRBrtaHgMu20=;
	b=uEHfe4YAda/W1c5LHmuKRe7AFfMFpuiMw4BdX8Hs+PKBugJdjjpyapL7Jn+8lfcF00e2
	 vl5fEEdmB/04H+YiCT4DNb5BuxkoMdq2OUGJG9maBjqxlaQSFIRCxBA+ladNuAb3+DD+n
	 8/MozO+hwEpldoXkm3b8kmDnNN0ZRNosZPI7z0XXesIvl54osbl3ApceMVJSd8x3HORFg
	 NTUU3Lq05LRiiIACZl2LDIm2+A2f4UyFQJtAiDgRIrr/ktTu5y4TmQTGy0dHeM9osnyWu
	 iMnA30Ds+986EbcUpgCUp5oVkZmtlL5svRwF4QbLuZoh0xIMJKxe+20xVu4ZBfPnx9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KXGE1eAT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ABF606A31C;
	Fri, 27 Nov 2026 23:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KXGE1eAT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927931F000C1;
	Fri, 27 Nov 2026 23:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795822961;
	bh=XZW7HoJlvzZWJEECVtCjZszj1uhHhZwfRBrtaHgMu20=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KXGE1eATdQmTwJfNK7TVVo1E80cn6jIzaAlO8J3hNoco1vRRNGIOxdSjHdWzSrEJy
	 dM/0fLvN2ZGGCxzuSGa1+hpdhKUeE0Aa5dClRWLQciH0u9wlt7yZer5gv2lMbVjF3x
	 g2xf1zt6pcxiGgefrLVfHM3KvH3ISFw5WxbVaES+jKEKg41WXRrz1i+a3R9CF5qtj1
	 SsvvKxIPO+87upa2XX7NMBzHHpoMWxiXiOwHlsHgsQWNRfoHblqy7V0Z9pRTH1feRJ
	 RPqL8+kG0Ediu4ypjCi4rxT+6Ski5fKSmSwnYANLANyS6BmY21m9ju4Z5l6kVmvCI5
	 cYb3ckbLGnP7g==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Nov 2026 00:42:31 +0100
Subject: [PATCH 3/6] mfd: db8500-prcmu: Drop unused partial APE clock
 divider mode
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-ux500-prcmu-clock-move-v1-3-77c49daad1d2@kernel.org>
References: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
In-Reply-To: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 mfd@lists.linux.dev
X-Mailer: b4 0.16.0

The vendor partial-25% mode is not a firmware OPP. It emulates one
by changing ACLK and DMA clock dividers around the mailbox request,
but no in-tree consumer ever selects it. Drop the unused emulation
so that the clock register lock can move with its remaining users.
Leave the actual APE 50% and 100% requests unchanged.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/mfd/db8500-prcmu.c       | 55 +---------------------------------------
 include/linux/mfd/db8500-prcmu.h |  2 --
 2 files changed, 1 insertion(+), 56 deletions(-)

diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
index 1d9114edfbdb..1c58cf804e4e 100644
--- a/drivers/mfd/db8500-prcmu.c
+++ b/drivers/mfd/db8500-prcmu.c
@@ -781,52 +781,6 @@ int db8500_prcmu_get_ddr_opp(void)
 	return readb(PRCM_DDR_SUBSYS_APE_MINBW);
 }
 
-/* Divide the frequency of certain clocks by 2 for APE_50_PARTLY_25_OPP. */
-static void request_even_slower_clocks(bool enable)
-{
-	u32 clock_reg[] = {
-		PRCM_ACLK_MGT,
-		PRCM_DMACLK_MGT
-	};
-	unsigned long flags;
-	unsigned int i;
-
-	spin_lock_irqsave(&clk_mgt_lock, flags);
-
-	/* Grab the HW semaphore. */
-	while ((readl(PRCM_SEM) & PRCM_SEM_PRCM_SEM) != 0)
-		cpu_relax();
-
-	for (i = 0; i < ARRAY_SIZE(clock_reg); i++) {
-		u32 val;
-		u32 div;
-
-		val = readl(prcmu_base + clock_reg[i]);
-		div = (val & PRCM_CLK_MGT_CLKPLLDIV_MASK);
-		if (enable) {
-			if ((div <= 1) || (div > 15)) {
-				pr_err("prcmu: Bad clock divider %d in %s\n",
-					div, __func__);
-				goto unlock_and_return;
-			}
-			div <<= 1;
-		} else {
-			if (div <= 2)
-				goto unlock_and_return;
-			div >>= 1;
-		}
-		val = ((val & ~PRCM_CLK_MGT_CLKPLLDIV_MASK) |
-			(div & PRCM_CLK_MGT_CLKPLLDIV_MASK));
-		writel(val, prcmu_base + clock_reg[i]);
-	}
-
-unlock_and_return:
-	/* Release the HW semaphore. */
-	writel(0, PRCM_SEM);
-
-	spin_unlock_irqrestore(&clk_mgt_lock, flags);
-}
-
 /**
  * db8500_prcmu_set_ape_opp - set the appropriate APE OPP
  * @opp: The new APE operating point to which transition is to be made
@@ -843,9 +797,6 @@ int db8500_prcmu_set_ape_opp(u8 opp)
 
 	mutex_lock(&mb1_transfer.lock);
 
-	if (mb1_transfer.ape_opp == APE_50_PARTLY_25_OPP)
-		request_even_slower_clocks(false);
-
 	if ((opp != APE_100_OPP) && (mb1_transfer.ape_opp != APE_100_OPP))
 		goto skip_message;
 
@@ -854,8 +805,7 @@ int db8500_prcmu_set_ape_opp(u8 opp)
 
 	writeb(MB1H_ARM_APE_OPP, (tcdm_base + PRCM_MBOX_HEADER_REQ_MB1));
 	writeb(ARM_NO_CHANGE, (tcdm_base + PRCM_REQ_MB1_ARM_OPP));
-	writeb(((opp == APE_50_PARTLY_25_OPP) ? APE_50_OPP : opp),
-		(tcdm_base + PRCM_REQ_MB1_APE_OPP));
+	writeb(opp, (tcdm_base + PRCM_REQ_MB1_APE_OPP));
 
 	writel(MBOX_BIT(1), PRCM_MBOX_CPU_SET);
 	wait_for_completion(&mb1_transfer.work);
@@ -865,9 +815,6 @@ int db8500_prcmu_set_ape_opp(u8 opp)
 		r = -EIO;
 
 skip_message:
-	if ((!r && (opp == APE_50_PARTLY_25_OPP)) ||
-		(r && (mb1_transfer.ape_opp == APE_50_PARTLY_25_OPP)))
-		request_even_slower_clocks(true);
 	if (!r)
 		mb1_transfer.ape_opp = opp;
 
diff --git a/include/linux/mfd/db8500-prcmu.h b/include/linux/mfd/db8500-prcmu.h
index b6e3450b1d11..7306303494f1 100644
--- a/include/linux/mfd/db8500-prcmu.h
+++ b/include/linux/mfd/db8500-prcmu.h
@@ -521,14 +521,12 @@ enum prcmu_wdog_id {
  * @APE_NO_CHANGE: The APE operating point is unchanged
  * @APE_100_OPP: The new APE operating point is ape100opp
  * @APE_50_OPP: 50%
- * @APE_50_PARTLY_25_OPP: 50%, except some clocks at 25%.
  */
 enum ape_opp {
 	APE_OPP_INIT = 0x00,
 	APE_NO_CHANGE = 0x01,
 	APE_100_OPP = 0x02,
 	APE_50_OPP = 0x03,
-	APE_50_PARTLY_25_OPP = 0xFF,
 };
 
 /**

-- 
2.56.1

