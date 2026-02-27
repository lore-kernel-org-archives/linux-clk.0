Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2353290A1;
	Fri, 27 Feb 2026 15:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206417; cv=none; b=QuCeRrLeXEwFMB+pKcLveNla+eE2h7svb4aL42KjlYErFzPH+ngMzFERSCnhrRllyLg01nsRm/tGDLL6a2Wz+1MPDBrR0tEjlfhMGCDboWjomJkptnHEST3WVRsujyMjxEXGvwrGqFBJE5ejY5u+XsWY19T3ROYTMmHFyhpwZrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206417; c=relaxed/simple;
	bh=hosC0lf8QJPZBWpaH541Aizu9iGMXB9D/VZmiclacXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kWw15CJ6HRqrIq2f7OgsuTLNXTxKW616u7ifOMIZByVOtrbOHjZNaGMkfKirHRXQ1uE6eOkzqcNmf36NCigAOkvq0zrnD0KdLvikThi+6qKX8519L8uvfR/wxP0nqkSjqe0v4YRbxkS5P7JLErkicwH1Pdgiu6JoapUsBWIcXhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2642C339;
	Fri, 27 Feb 2026 07:33:29 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 687453F73B;
	Fri, 27 Feb 2026 07:33:29 -0800 (PST)
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
	dan.carpenter@linaro.org,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 05/11] firmware: arm_scmi: Drop unused clock rate interfaces
Date: Fri, 27 Feb 2026 15:32:19 +0000
Message-ID: <20260227153225.2778358-6-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227153225.2778358-1-cristian.marussi@arm.com>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only the unified interface exposing min_rate/max_rate is now used.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 include/linux/scmi_protocol.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 7283302b0c85..d97b4e734744 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -53,17 +53,6 @@ struct scmi_clock_info {
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

