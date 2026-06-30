Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67E43375C3;
	Tue, 30 Jun 2026 08:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782809636; cv=none; b=dawnvPI6obEQ/+dnFzJl4RwlifJn/gCW4jOCwX+z9hVp+dRqS0wlSJnKIzbw13lQgCM9P4gaEH3W9kWyMm2oB52bAhMJNNK6mox9ODUoyE/6zoA9WcFicDD2ctX/toeYxcZQIDdtTevtrwZvYdglY5Rnkr5uBJ3gjlsZSuNpc4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782809636; c=relaxed/simple;
	bh=NFzvd2lgzYCeCo0wBEQ+d0xdbvjzXTWXs3DEMaJYP40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QHqi5M4rPUQvXDSlVuvd+5ojNOZ8a/0tTEH3oIF95Tk3qW1M+K2ELtEgAQF+XFYBIJRfOAjO0/30MoT2CRy1Q9D92btyqkBpadIQ5jnv4xCusTgBn/MNVX1Cda0dPrWZEU3YLhTmN+PQgxyBboaK89PwYhoLdL7kS4bc/QJ3bNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J7aBCugV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J7aBCugV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207191F00A3A;
	Tue, 30 Jun 2026 08:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782809635;
	bh=m2ZnTxggV1ZYOtn4Pko1UNdLLGbsX5Lavd+RyxACP9g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=J7aBCugVhwGTqtVAWndEZNzIXkmVDinE1QPXMIxk5wL/ivdOfQk/GK4XutMTokpUp
	 u+ZTNoKEwIh5MRC3cYUdGjScUEhu0UtjpaB/cQ0pNlzHw2+PRgLKvJzwGs9VjTDCH9
	 HFJtTOltxzIXH2Uim5lLQg9rxqFTUXcdORssoM7JGrNBHBK06EgzxX0aUBKdqJSgJn
	 LW9w6Z4sfbCbZZ0BjxUW3X0t3hekzTNDe7TS6+LSLbXrqawPTM3BVHX2BlLkD359Fn
	 YJUyMVcsVZ0QsmW3iJMQFiNq0/JTVVrjtKw3l5ewhfbcWzeXSgewdLshhVLKZumA/k
	 Wg93+V8FPTkwA==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 30 Jun 2026 08:53:19 +0000
Subject: [PATCH 1/2] clk: spacemit: k3: set hdma clock as critical
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-06-clk-hdma-critial-v1-1-443c0ac88c5f@kernel.org>
References: <20260630-06-clk-hdma-critial-v1-0-443c0ac88c5f@kernel.org>
In-Reply-To: <20260630-06-clk-hdma-critial-v1-0-443c0ac88c5f@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 Drew Fustini <fustini@kernel.org>, linux-clk@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258; i=dlan@kernel.org;
 h=from:subject:message-id; bh=NFzvd2lgzYCeCo0wBEQ+d0xdbvjzXTWXs3DEMaJYP40=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqQ4QY17Iv/hmEq9Ckf/X456gcr3ZmkkDMeeMTZ
 O7TBq5XV/qJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCakOEGBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+13XQ/+P/fn9INFJSM6UOj0RhDx6ekOavJ/FUOmi5xsxeDw1XnA41W/FEZAN
 DYrWEw9mGZ+CU4XYG/tfGZ7+JTx9GKRKIgiCqfIQMNdeeq8Fnx82TjBUoVtilLTbhnC6fc6f2Fd
 g6uOWSFSkrQg6PJnkCu63M2kyA+7U0cyNigproi6gep3QOjNJH5FJlnHYvc94CO/TxFXrpPqwbi
 RF/sz9KpeBVqBISn8sdaShlVbkdGyc/UTtoRnhOMe/MHTtWaslstbJw+2ex06wFvcpAbnflSoR3
 M1Tt3EV4+xCOpMsak6wPJyKSk/23YNVJ3NKfiLnHH7Ql4nupmwcX4zuqZaKBcmp8HcrUTD8p/vg
 wPgHR+bmrUQ1tMOYuPltP59QEQq02Z/TP0hLIzUxodz1O9lndzLl3vIDXmRdjJx6dde1Pf6kTMl
 mvzqvEiN5tPF/PqbmbVhtjLIdwm647KGIfW6yyjC4aXjdp8POShvW0jSr1lA8iw/r79UAgi6aqC
 a9h9C6TOWMMAK0Vig1RSDYcdvuikDXUiilBnMt6UhyzjRNnjJiQ7CXlDoJFQOCN0aguNChoc8V+
 5FXuUrxrI/RAVUbso3hMoC8/oPhut1/EUH1kZq1Vy84OCbP5kNo9wdadLyYiI86W1TEm36ULcu0
 Qy5ByLgQ1gkAgj10MwYnPnFZ3xZrXM=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

HDMA clock is responsible for the internal TCM access path of X100 RISC-V
core, so set the clock flag as critical to prevent it from being shut off,
otherwise the Linux system will hang.

Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
Reported-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/clk/spacemit/ccu-k3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index cb0c4277f72a..f0160b4c0e1b 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -1026,7 +1026,7 @@ CCU_MUX_DIV_GATE_DEFINE(isim_vclk_out3, isim_vclk_parents, APMU_SNR_ISIM_VCLK_CT
 /* APMU clocks end */
 
 /* DCIU clocks start */
-CCU_GATE_DEFINE(hdma_clk, CCU_PARENT_HW(axi_clk), DCIU_DMASYS_CLK_EN, BIT(0), 0);
+CCU_GATE_DEFINE(hdma_clk, CCU_PARENT_HW(axi_clk), DCIU_DMASYS_CLK_EN, BIT(0), CLK_IS_CRITICAL);
 CCU_GATE_DEFINE(dma350_clk, CCU_PARENT_HW(axi_clk), DCIU_DMASYS_SDMA_CLK_EN, BIT(0), 0);
 CCU_GATE_DEFINE(c2_tcm_pipe_clk, CCU_PARENT_HW(axi_clk), DCIU_C2_TCM_PIPE_CLK, BIT(0), 0);
 CCU_GATE_DEFINE(c3_tcm_pipe_clk, CCU_PARENT_HW(axi_clk), DCIU_C3_TCM_PIPE_CLK, BIT(0), 0);

-- 
2.54.0

