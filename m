Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81133FB042;
	Fri,  8 May 2026 15:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254413; cv=none; b=CPP3kwWt3jOKetbiPGdbJAuPcHnzm7wmEWkkCRVIlmiSquVei64CAkdFUUPwWnxbfy0BBkH05ucEFKmGiHP1ESKcEC+72KRxcVkM0wgqSrGKc+GBwzutgdzjaiL/lN5kQ5odBS3aQ6kNaTzkad2CuZAMnAs+NHk7VvknMMyEJDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254413; c=relaxed/simple;
	bh=WC1R4qV6I0MneBfZAXWbYrl3W9fg6IoQSFQXIfGStN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xf/PWRoLMQXYbzpGL+jwFKf+BxBrqgrl8Rr3KWnVj8lbUO4HPM8Q+pmOVBylvdMQGPFokmoY2nBReuJuBdkCYrtqK2bfrph1S2W3STfIop3LuG8y9BX5DDZHIfrzRlX95ShvTVmfn3zJaXt9gcLctcxYRGIr5xdzQRXiAeypptg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Yy6ACcdH; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Yy6ACcdH"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C24EC35A1;
	Fri,  8 May 2026 08:33:25 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E2F63F836;
	Fri,  8 May 2026 08:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778254411; bh=WC1R4qV6I0MneBfZAXWbYrl3W9fg6IoQSFQXIfGStN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yy6ACcdHyLZwFPRCF5YoZsDdCuDhNbBt53WgsgTwkw5pXMphDJEm+JyJI2BoHwtBe
	 sUJIU06Ry2i450l66La1uIHRU+A2pnqmVqLQkQ/T3HFRMtdfC0O9IpZ5HJV+/ICqdX
	 pN015g+eu9rv8vr9PbbexLDueaXqzkVfgo7iEtjo=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 01/15] clk: scmi: Fix clock rate rounding
Date: Fri,  8 May 2026 16:32:46 +0100
Message-ID: <20260508153300.2224715-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508153300.2224715-1-cristian.marussi@arm.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While the do_div() helper used for rounding expects its divisor argument
to be a 32bits quantity, the currently provided divisor parameter is a
64bit value that, as a consequence, is silently truncated and a possible
source of bugs.

Fix by using the proper div64_ul helper.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Fixes: 7a8655e19bdb ("clk: scmi: Fix the rounding of clock rate")
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/clk/clk-scmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 6b286ea6f121..b6a12f3bc123 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -10,9 +10,9 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/of.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/scmi_protocol.h>
-#include <asm/div64.h>
 
 #define NOT_ATOMIC	false
 #define ATOMIC		true
@@ -83,7 +83,7 @@ static int scmi_clk_determine_rate(struct clk_hw *hw,
 
 	ftmp = req->rate - fmin;
 	ftmp += clk->info->range.step_size - 1; /* to round up */
-	do_div(ftmp, clk->info->range.step_size);
+	ftmp = div64_ul(ftmp, clk->info->range.step_size);
 
 	req->rate = ftmp * clk->info->range.step_size + fmin;
 
-- 
2.53.0

