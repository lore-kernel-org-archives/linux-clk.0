Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D29A3FE34F;
	Fri,  8 May 2026 15:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254443; cv=none; b=btvNoXOQTNnjBCE4g1BI6/e0qz1qJU/nb+5vPBQI5xtv+6N4pb3qFG9/rwLJj94UZi8C8lyhq5CVNoW8kytw6qY9ZuCfYHc22jG/McNrRgUv+G8F+Pd3wcY/sNIFnyLXjC2Iw3SPfv7lp5syGvcPIhtmoOIhAnZeusBAPf7K2jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254443; c=relaxed/simple;
	bh=jWS2Kp7HvdidNmNl9faasS1wYpc1rAAoOJ7CoT2qcrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sLkYcpbQuK2iFcqteT1O9NBTEYieYJUx9CcrjFAakf1Fpsat4T491ypVKkfgawaE5LsmNrKx7T6eVjiCxnqlYrGsDyVehZLhFqtn5U+YmZEo8FnUhzIUrOudKlofRMHUDzr5dJ+ZI4eNv/avxspObRbKZUCWS9IGPjr4tDTLO+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dgTQHqZX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dgTQHqZX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DB1735A1;
	Fri,  8 May 2026 08:33:56 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90A023F836;
	Fri,  8 May 2026 08:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778254441; bh=jWS2Kp7HvdidNmNl9faasS1wYpc1rAAoOJ7CoT2qcrQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dgTQHqZX4JOuHlXa6cwPcadiV1pTY93yfgGft9EA9xyea0fFp36LffE4PNCH7Yh99
	 5RK/SIJXNZtQmjVN0cBRpIDp5yKKxnSAwE9D9L21SvEE81qMyE96CB0GBuFts0uywZ
	 rPP/jpJWb7SikkdSm3gGaD0rAh85/oUOxz2MtSWI=
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
Subject: [PATCH v4 11/15] firmware: arm_scmi: Fix bound iterators returning too many items
Date: Fri,  8 May 2026 16:32:56 +0100
Message-ID: <20260508153300.2224715-12-cristian.marussi@arm.com>
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

When using a bound-iterator with an upper bound, commands are sent, and
responses are received, until the upper bound is reached.  However, it
is up to the SCMI provider implementation to decide how many rates are
returned in response to a single CLOCK_DESCRIBE_RATES command.  If the
last response contains rates beyond the specified upper bound, they are
still passed up for further processing.  This may lead to buffer
overflows in unprepared callsites.

While the imprecise bound handling may have been intentional (it was
mentioned in the commit message introducing the code), it is still
confusing for users, and may cause hard to debug crashes.  Fix this by
strictly enforcing the upper bound.

Note that this may cause an increase in the number of
CLOCK_DESCRIBE_RATES commands issued, as retrieving the last rate may no
longer be done inadvertentently, but require its own command.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index cb4865fd8af2..fd031a8d40df 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1820,6 +1820,7 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
 	const struct scmi_protocol_handle *ph;
 	struct scmi_iterator_state *st;
 	struct scmi_iterator *i;
+	unsigned int n;
 
 	if (!iter)
 		return -EINVAL;
@@ -1852,13 +1853,17 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
 			return -EINVAL;
 		}
 
-		for (st->loop_idx = 0; st->loop_idx < st->num_returned; st->loop_idx++) {
+		if (end)
+			n = min(st->num_returned, *end - st->desc_index + 1);
+		else
+			n = st->num_returned;
+		for (st->loop_idx = 0; st->loop_idx < n; st->loop_idx++) {
 			ret = iops->process_response(ph, i->resp, st, i->priv);
 			if (ret)
 				return ret;
 		}
 
-		st->desc_index += st->num_returned;
+		st->desc_index += n;
 		ph->xops->reset_rx_to_maxsz(ph, i->t);
 		/*
 		 * check for both returned and remaining to avoid infinite
-- 
2.53.0

