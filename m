Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFAE3402459;
	Fri,  8 May 2026 15:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254452; cv=none; b=mc9Wb7mrcWbNWqKb9VuQpsgF4iot4SRFS54vM3O4F0qqcOSZ8Kblvrd9U1ghz/WgjNi8+rZJ+adMOO9ImmFXddKZMQxTXMrG2ROyRHuwrtGXEbZkhhzvnKt+5XP8WrI3ae3v7I/cKx7zNllTYNJswyTue4yFWQgFx64SUYq6UzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254452; c=relaxed/simple;
	bh=STsX6b3KBooCmiC+B8JoLtiiyGldyQ5DAhwCGnjnvhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k6qUbfRF3IS0vHfPWrBF2lpuTPOhBpAhUz4IRcm7Z1ZM0bmeP9Om6m0P/WNJKFy7bJFpEsY9zNXgM/Hb020Zz9ox8bRsK0tkTyjYXnj5g7hTm+c0LOpLSOneWaXSBEvg3N+IKffuMZdMaMyTz0f+4dBKtQJ2sody685ccrnQFdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UP+prNQM; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UP+prNQM"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0D93359E;
	Fri,  8 May 2026 08:34:04 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D506C3F836;
	Fri,  8 May 2026 08:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778254450; bh=STsX6b3KBooCmiC+B8JoLtiiyGldyQ5DAhwCGnjnvhw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UP+prNQMf+nvYQ85658n34TX5u3a1kGTtXjybUk0uzJlMU5TP04o7e8yXlSinJFeT
	 N7jf/9zodNIoWYzyq3z0SYhchx4TL1EyGfal/WfpHcxobNYQGvACWcFbjnmgQS08tH
	 X+amAnLydNvSMHPekU2QXAmoMgP7l+RsO2vUn7r8=
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
Subject: [PATCH v4 14/15] firmware: arm_scmi: Fix OOB in scmi_clock_describe_rates_get_lazy()
Date: Fri,  8 May 2026 16:32:59 +0100
Message-ID: <20260508153300.2224715-15-cristian.marussi@arm.com>
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

Lazy discovery of discrete rates works as follows:
  A. Grab the first three rates,
  B. Grab the last rate, if there are more than three rates.

It is up to the SCMI provider implementation to decide how many rates
are returned in response to a single CLOCK_DESCRIBE_RATES command.  Each
rate received is stored in the scmi_clock_rates.rates[] array, and
.num_rates is updated accordingly.

When more than 3 rates have been received after step A, the last rate
may have been received already, and stored in scmi_clock_rates.rates[]
(which has space for scmi_clock_desc.tot_rates entries).  Hence grabbing
the last rate again will store it a second time, beyond the end of the
array.

Fix this by only grabbing the last rate when we don't already have it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/clock.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 955bb9565ce3..ab8c65ed785a 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -582,8 +582,11 @@ scmi_clock_describe_rates_get_lazy(const struct scmi_protocol_handle *ph,
 	if (ret)
 		goto out;
 
-	/* If discrete grab the last value, which should be the max */
-	if (clkd->rate_discrete && clkd->tot_rates > 3) {
+	/*
+	 * If discrete and we don't already have it, grab the last value, which
+	 * should be the max
+	 */
+	if (clkd->rate_discrete && clkd->tot_rates > clkd->num_rates) {
 		first = clkd->tot_rates - 1;
 		last = clkd->tot_rates - 1;
 		ret = ph->hops->iter_response_run_bound(iter, &first, &last);
-- 
2.53.0

