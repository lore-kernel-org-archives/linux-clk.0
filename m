Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F314B3191D0;
	Tue, 28 Apr 2026 20:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407416; cv=none; b=BRMgo0cUW8Veo01dxpuZJJ6lz2NKOzipXhH/G8xlJ41DpgXcQFrhZI5LFK2Q9N6+jGMn4LvrwKakv9+44ymxWvIeaOz4ZqEZViIFrVg8QQc2mtHIc3FwwFrXOliq4pGGr6n0de2DJ/bnumDBm7mdQEOU0fSmxEKSrqE1CLG67gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407416; c=relaxed/simple;
	bh=yjQhykXQOdB+c522lN4y/AmjYIvZxdLbJ/Nwp3R+Ax4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JyPeXHpZwaUne1d0bCZf4RiQ8XLMc02AtOu0N63zAckCMWXK/6Zr1+sXIQkpquu4gf2HUtEtA8KCXPJgV+ovDHwszFVOm1mE0mEYyaBBDpTFeXUQgQaFOGz8IqJ8tVsGm9coYGOAFUdXdEYQ2OvL0qDeI4R21Rhn3xVRdqo2yyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MnYKtfFr; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MnYKtfFr"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAD821C0A;
	Tue, 28 Apr 2026 13:16:48 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F1953F763;
	Tue, 28 Apr 2026 13:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777407414; bh=yjQhykXQOdB+c522lN4y/AmjYIvZxdLbJ/Nwp3R+Ax4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MnYKtfFrvIFEdI9OR+IGgz45xJuLl3pLjdZheCtsDs8qOMFmpgo+LtwJ6S2C4cFQF
	 G60+CDXR6JTXqlhrGrWEkGDrrBg9srdbo7WU3oOeRj08qw3+o4BuvwQX+X2poQfPp5
	 GVEx0XGvld7DVk0XJE72g/T7OpzW5l+vUUuhW4E0=
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
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 07/15] firmware: arm_scmi: Make clock rates allocation dynamic
Date: Tue, 28 Apr 2026 21:15:14 +0100
Message-ID: <20260428201522.903875-8-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428201522.903875-1-cristian.marussi@arm.com>
References: <20260428201522.903875-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Leveraging SCMI Clock protocol dynamic discovery capabilities, move away
from the static per-clock rates allocation model in favour of a dynamic
runtime allocation based on effectively discovered resources.

No functional change.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v2 --> v3
 - collected Review-by tags
---
 drivers/firmware/arm_scmi/clock.c | 19 ++++++++++++++++---
 include/linux/scmi_protocol.h     |  1 -
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 467b13a3a18f..c9b62edce4fd 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -161,7 +161,7 @@ struct scmi_clock_desc {
 	u32 id;
 	bool rate_discrete;
 	unsigned int num_rates;
-	u64 rates[SCMI_MAX_NUM_RATES];
+	u64 *rates;
 #define	RATE_MIN	0
 #define	RATE_MAX	1
 #define	RATE_STEP	2
@@ -480,6 +480,18 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
 			   QUIRK_OUT_OF_SPEC_TRIPLET);
 	}
 
+	if (!st->max_resources) {
+		int num_rates = st->num_returned + st->num_remaining;
+
+		p->clkd->rates = devm_kcalloc(p->dev, num_rates,
+					      sizeof(*p->clkd->rates), GFP_KERNEL);
+		if (!p->clkd->rates)
+			return -ENOMEM;
+
+		/* max_resources is used by the iterators to control bounds */
+		st->max_resources = st->num_returned + st->num_remaining;
+	}
+
 	return 0;
 }
 
@@ -493,6 +505,8 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
 
 	p->clkd->rates[st->desc_index + st->loop_idx] =
 		RATE_TO_U64(r->rate[st->loop_idx]);
+
+	/* Count only effectively discovered rates */
 	p->clkd->num_rates++;
 
 	return 0;
@@ -515,8 +529,7 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
 		.dev = ph->dev,
 	};
 
-	iter = ph->hops->iter_response_init(ph, &ops, SCMI_MAX_NUM_RATES,
-					    CLOCK_DESCRIBE_RATES,
+	iter = ph->hops->iter_response_init(ph, &ops, 0, CLOCK_DESCRIBE_RATES,
 					    sizeof(struct scmi_msg_clock_describe_rates),
 					    &cpriv);
 	if (IS_ERR(iter))
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index d97b4e734744..5552ac04c820 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -15,7 +15,6 @@
 
 #define SCMI_MAX_STR_SIZE		64
 #define SCMI_SHORT_NAME_MAX_SIZE	16
-#define SCMI_MAX_NUM_RATES		16
 
 /**
  * struct scmi_revision_info - version information structure
-- 
2.53.0

