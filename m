Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A8F3FD13F;
	Fri,  8 May 2026 15:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254446; cv=none; b=Hhl0SjVKiKLotRfDlZ6Q8Uxbhpk8oCZw/AIMAL6i+fWsSuVwcXbVCCMC/c4aYos/gFSgA2lTa6Nf4Nm2lTxMjvX8ui//nIWpI9wSNOeOGbwgwDTbzGL+diAq72HUhSL9ts6JgnTLFU+aU6JzSvsUId4plEdmmf1v7kh8+1UcQ4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254446; c=relaxed/simple;
	bh=epQeOAzLViH9FFPlYuAgdsCGyUd9pX7SRAESRVy9dqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GAY6qVmZrHA9OnRMi52VsAxzAThc1WBs9zOXsCo9q9zSTFGAwwZmeJWQAPE98Xu8k1dbwOGvLyKBHVOG8Px5b6PdqfJrZOtc72M1bKi2WpXzXR2SVlcFFMLu22e7Z+Wo6sFUzHMh5MHZhRXpTPhQgphWNuyHm+VhoCsdsZyzOeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rfqkI8Nq; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rfqkI8Nq"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7438C359E;
	Fri,  8 May 2026 08:33:59 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F6E83F836;
	Fri,  8 May 2026 08:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778254444; bh=epQeOAzLViH9FFPlYuAgdsCGyUd9pX7SRAESRVy9dqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rfqkI8Nq6UlZeeK/tYd9uoR9+Uqd7gCciQfS9U4RokHI3yUHF2abPDKMJmpDR/kgI
	 NMJHAYGb0payWN8Zwj5WsOFNuIHDb4jIb5hLyAGxxuhKQKu68EdLfnMJxfBfzBFO8J
	 VuRJAooUIUzLVf9A8nCqydt9+cd4jBpgs5CRpYZY=
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
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v4 12/15] firmware: arm_scmi: Use proper iter_response_bound_cleanup() name
Date: Fri,  8 May 2026 16:32:57 +0100
Message-ID: <20260508153300.2224715-13-cristian.marussi@arm.com>
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

From: Geert Uytterhoeven <geert+renesas@glider.be>

The documentation speaks of the "iter_response_bound_cleanup()" protocol
helper, while the actual helper is called "iter_response_cleanup()".
Settle on the former name, because the helper is only needed when using
bound-iterators.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c    | 6 +++---
 drivers/firmware/arm_scmi/protocols.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index fd031a8d40df..57785c0c0424 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1875,7 +1875,7 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
 	return 0;
 }
 
-static void scmi_iterator_cleanup(void *iter)
+static void scmi_iterator_bound_cleanup(void *iter)
 {
 	struct scmi_iterator *i = iter;
 
@@ -1888,7 +1888,7 @@ static int scmi_iterator_run(void *iter)
 	int ret;
 
 	ret = __scmi_iterator_run(iter, NULL, NULL);
-	scmi_iterator_cleanup(iter);
+	scmi_iterator_bound_cleanup(iter);
 
 	return ret;
 }
@@ -2078,7 +2078,7 @@ static const struct scmi_proto_helpers_ops helpers_ops = {
 	.iter_response_init = scmi_iterator_init,
 	.iter_response_run = scmi_iterator_run,
 	.iter_response_run_bound = scmi_iterator_run_bound,
-	.iter_response_cleanup = scmi_iterator_cleanup,
+	.iter_response_bound_cleanup = scmi_iterator_bound_cleanup,
 	.protocol_msg_check = scmi_protocol_msg_check,
 	.fastchannel_init = scmi_common_fastchannel_init,
 	.fastchannel_db_ring = scmi_common_fastchannel_db_ring,
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index e2ef604c16ef..15ad5162e37a 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -286,7 +286,7 @@ struct scmi_proto_helpers_ops {
 	int (*iter_response_run)(void *iter);
 	int (*iter_response_run_bound)(void *iter,
 				       unsigned int *start, unsigned int *end);
-	void (*iter_response_cleanup)(void *iter);
+	void (*iter_response_bound_cleanup)(void *iter);
 	int (*protocol_msg_check)(const struct scmi_protocol_handle *ph,
 				  u32 message_id, u32 *attributes);
 	void (*fastchannel_init)(const struct scmi_protocol_handle *ph,
-- 
2.53.0

