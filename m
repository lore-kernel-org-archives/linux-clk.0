Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552B633F5B4;
	Tue, 28 Apr 2026 20:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407440; cv=none; b=Hr3/qwTfm3NbS1I/y0XrqL+Zsby+vRwVREouJ4ssJ+v0IIb54H1e91/nmAsypXwdhaXu02y79jKbgEC0sImN+i2p2qapULo0/poVCYoHeEUUf2mLdVmvMBzaJ2mMbpF1K/5ev2SBYg6ed9mQ/1oGl4vknFzwJgpDf+sTnIStns8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407440; c=relaxed/simple;
	bh=Va/JAFXv1Mv8JmjPvWUiIYbL1IHuJCCIZgDN7C5J2qI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SYhHOXROzgONbds8LvUwINe9tzzRtlcIjrojRDscyJwLgeZwpo8eAj7ZOy1IUKy6+dURgwJcmxBwEV9iaqlN3CAZCvDFBy31dSUvMpyka9JXfpTJBL1K969jDnSSyEUqS3R9rUnBuBk/1Qxo5s+Ab94iWTuiyCUeGAFBRkaKPBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KgbOa5J/; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KgbOa5J/"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C97883295;
	Tue, 28 Apr 2026 13:17:11 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FD003F763;
	Tue, 28 Apr 2026 13:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777407437; bh=Va/JAFXv1Mv8JmjPvWUiIYbL1IHuJCCIZgDN7C5J2qI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KgbOa5J/xsBO8ib08nnLCnge8bFbCShJQPMq2C2+Bp5vODcd8uUAeeY2acVLel5w0
	 IVlaAyHz6Y+0oPoFqAn9DdPFdaLy0JJbQIvou8t2u5+231tBX0QrqoKFaLAKIM4VC+
	 bXWNSYTpxA07yaa/J/Jog2uovYiy04oEYLOz+CXs=
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
Subject: [PATCH v3 14/15] firmware: arm_scmi: Fix OOB in scmi_clock_describe_rates_get_lazy()
Date: Tue, 28 Apr 2026 21:15:21 +0100
Message-ID: <20260428201522.903875-15-cristian.marussi@arm.com>
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
[Cristian: removed Fixed tag referring the same series]
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/clock.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 15a963b1edb9..ba25a9c6d3ae 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -582,15 +582,18 @@ scmi_clock_describe_rates_get_lazy(const struct scmi_protocol_handle *ph,
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
 	}
 
 out:
-	ph->hops->iter_response_cleanup(iter);
+	ph->hops->iter_response_bound_cleanup(iter);
 
 	return ret;
 }
-- 
2.53.0

