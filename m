Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A593FBEC2;
	Fri,  8 May 2026 15:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254429; cv=none; b=BlfkmK1gDrBRjWf/fMOMZRwgGPKHQzHr48Q6U6wnC/BeM0YuuQFI+UUvqTrwkBGVsE21IFMOY5v+p592cFIEgBwLXVnA1HtFVfmmwWjr/+6b2S2beeudeuXDmeZieGIEctrAIXghv/Q+85U3umyShB0CNG/iOYcbGYqRTqULSiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254429; c=relaxed/simple;
	bh=O+pJK9yNpRW7ElmpapJx6mgOnLh69isNLEWDe2uLoJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNNw3uE41+2aYA/tAVKhCNlNlHO1vGGy1EjojMn/z8em0jVzlHNkvOl69Ml5jWNo1kCiJkyLVMobceSTqmIvtRaFuHw9vWZaecVRvi33R/LU4ohahKgwhoclTB2BC1BF0t1CgoBHkQ5Itma4up1TQuw0tz4xo1RO7lqJEOW0CXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Tw2Buhxn; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Tw2Buhxn"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0E2B359E;
	Fri,  8 May 2026 08:33:41 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8853F3F836;
	Fri,  8 May 2026 08:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778254427; bh=O+pJK9yNpRW7ElmpapJx6mgOnLh69isNLEWDe2uLoJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tw2Buhxn0MHjpOIImv4BM3iOROyKqlpEtq3DbYhamuHu2Q8jjLyemsJJWOD24tO15
	 LMHUCFu7LoxQE9MdprABVZx8WWnBIjWhOUTJ7bpvSD68BMxzDXDqyjNdG16nxE51uT
	 Hy2mc4xFghmE16IlJq4YNCcWy7dbK78ca0zqe8v8=
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
Subject: [PATCH v4 06/15] firmware: arm_scmi: Drop unused clock rate interfaces
Date: Fri,  8 May 2026 16:32:51 +0100
Message-ID: <20260508153300.2224715-7-cristian.marussi@arm.com>
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

Only the unified interface exposing min_rate/max_rate is now used.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v3 --> v4
 - Remove also unused public info.rate_discrete [Geert]
v1 --> v2
 - Collected Peng Reviewed-by tag
---
 include/linux/scmi_protocol.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 7283302b0c85..19834f85f5d3 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -44,7 +44,6 @@ struct scmi_revision_info {
 struct scmi_clock_info {
 	char name[SCMI_MAX_STR_SIZE];
 	unsigned int enable_latency;
-	bool rate_discrete;
 	bool rate_changed_notifications;
 	bool rate_change_requested_notifications;
 	bool state_ctrl_forbidden;
@@ -53,17 +52,6 @@ struct scmi_clock_info {
 	bool extended_config;
 	u64 min_rate;
 	u64 max_rate;
-	union {
-		struct {
-			int num_rates;
-			u64 rates[SCMI_MAX_NUM_RATES];
-		} list;
-		struct {
-			u64 min_rate;
-			u64 max_rate;
-			u64 step_size;
-		} range;
-	};
 	int num_parents;
 	u32 *parents;
 };
-- 
2.53.0

