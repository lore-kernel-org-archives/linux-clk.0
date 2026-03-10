Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDE63DCD80;
	Tue, 10 Mar 2026 18:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773168082; cv=none; b=WRtDEV+zS2cMLpPiXQsN2/z6v9PTNTz5Y5xbJegj8wi+sS4BUUA/5BjWj3y69zfGUiSrEVKSNwNF9qgDbjTc0xlnZwSKM4tCj+lwDPjTYhSZsNrl1BTekytW5khGBY5oWRTcfPDPhUZIuRqwhw2bM+2p9wOhTI2LNrMBe7wW+80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773168082; c=relaxed/simple;
	bh=0gtxfZvGuGgeBgIZ7QQiH9NmWBca46yZWoiKvZCz40s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8Q53gpotPTuxpRR4S/85FgMpA429CWafh3I7lxjN+oLSWt24nMSeMOYkHULEQ4yAQ2vNvz0qfjj095Tl/CeAVBDdksr4jz22B0gEL7jR2IC79q+SqkoN9+2aQvXq5IkYzIhiQAbC2W4mwgHgx/kt9IMhEiFp7T/csWqrHIgfVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E659E14BF;
	Tue, 10 Mar 2026 11:41:07 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AAC3B3F7BD;
	Tue, 10 Mar 2026 11:41:09 -0700 (PDT)
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
Subject: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol initialization
Date: Tue, 10 Mar 2026 18:40:25 +0000
Message-ID: <20260310184030.3669330-9-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184030.3669330-1-cristian.marussi@arm.com>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add proper error handling on failure to enumerate clocks features or
rates.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/clock.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index c9b62edce4fd..bf956305a8fe 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -402,10 +402,16 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
 		    SUPPORTS_RATE_CHANGE_REQUESTED_NOTIF(attributes))
 			clk->rate_change_requested_notifications = true;
 		if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
-			if (SUPPORTS_PARENT_CLOCK(attributes))
-				scmi_clock_possible_parents(ph, clk_id, cinfo);
-			if (SUPPORTS_GET_PERMISSIONS(attributes))
-				scmi_clock_get_permissions(ph, clk_id, clk);
+			if (SUPPORTS_PARENT_CLOCK(attributes)) {
+				ret = scmi_clock_possible_parents(ph, clk_id, cinfo);
+				if (ret)
+					return ret;
+			}
+			if (SUPPORTS_GET_PERMISSIONS(attributes)) {
+				ret = scmi_clock_get_permissions(ph, clk_id, clk);
+				if (ret)
+					return ret;
+			}
 			if (SUPPORTS_EXTENDED_CONFIG(attributes))
 				clk->extended_config = true;
 		}
@@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
 	for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
 		cinfo->clkds[clkid].id = clkid;
 		ret = scmi_clock_attributes_get(ph, clkid, cinfo);
-		if (!ret)
-			scmi_clock_describe_rates_get(ph, clkid, cinfo);
+		if (ret)
+			return ret;
+
+		ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
+		if (ret)
+			return ret;
 	}
 
 	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
-- 
2.53.0

