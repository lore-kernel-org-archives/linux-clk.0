Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7947131AA8F;
	Tue, 28 Apr 2026 20:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407430; cv=none; b=U496jHy/qwsoks6fCvRaZpDTg6chd+xJRTh1uu04TflYogPuwcRECt+UqQPhMHjy4k7mlzPVqkJLfcegs7LlBhua6xdMqpD4fcnTjQN4UsTI07WdV1QFTtr3wNlPPnFCJa0whCsAYG5m2uAH6pzsF3lhhxR9bZ+tmGOxVhhio8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407430; c=relaxed/simple;
	bh=OwrS1tuzfQVio2IobCkB91DzRSW/Wbs2qREjyQ2A8Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q2e3jL5cnIK3p+Bsei65QuapYnXDT9NYGr/A9y4jnBJQ/cyQjx11ZVJ4u801EAMChFHerwfBR5VKuQy4U1TPSm0RLo+9wTbQrSF+pPlk3+X+n4RL88G+dZHNwGOxaedgOUhI/3p/WBoG8xc1qCN5D0Z5gV4X8ZI7sdFG26x8Qnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hC7y1OJt; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hC7y1OJt"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BE141C01;
	Tue, 28 Apr 2026 13:17:02 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD3A73F763;
	Tue, 28 Apr 2026 13:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777407427; bh=OwrS1tuzfQVio2IobCkB91DzRSW/Wbs2qREjyQ2A8Gw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hC7y1OJtFYOyBrZ3QxB/oKhe66SRPsjFysNW3FB3RH9ix6nRQYuECZZaUpiDiPKFT
	 ILX2W8l/AZwvC0v7bNVGWJUedNa6l2l64S4OwZXfakHw2ekX9SW9My2Tsp2ErPAsw+
	 qLPgszOcxsi3nP9PUWRxh11L5x3MhsKbuPLKRDZw=
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
Subject: [PATCH v3 11/15] firmware: arm_scmi: Fix bound iterators returning too many items
Date: Tue, 28 Apr 2026 21:15:18 +0100
Message-ID: <20260428201522.903875-12-cristian.marussi@arm.com>
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
[Cristian: removed Fixed tag referring the same series]
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

