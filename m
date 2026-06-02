Received: from outbound10.mail.transip.nl (outbound10.mail.transip.nl [136.144.136.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068643E172E;
	Tue,  2 Jun 2026 14:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780409383; cv=none; b=rkOvTGhXMMr4hLVEsxxS+Sx/6JK2uVtlY4gNqmxvXjQXwEfg9BLHNtsm/4dUiGG3E8+aoMaUeLPuEdEkbNmtCDhU6UYOlsy3hJL4cHdRncOlvRlsin4XvFXQNgIpaxPkSja1sKVoJmTMb1ykPgIkmX4gE9t1kg1pCKz9auvCrXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780409383; c=relaxed/simple;
	bh=WqR7fnsz1oInQlxyyk6SblEn2J3Gti7V1XKGVgPZCOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pjk/gwSko0saizozMWSMdN7LZER9dVLhzrS6gBC1njy9sDqrakcDMsHMTbpNMnc6fFUqvSIL6b9zbFdx2mADAfXHp5xS9PBYLB8cwKVI2MRRmHzs+4a/RWj5SJR6Rq2XiAKP6EslT3JnCsW+YvjVsfkhRQxqlo0qoTXtKBUVl7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=TuTZ4PtQ; arc=none smtp.client-ip=136.144.136.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="TuTZ4PtQ"
Received: from submission2.mail.transip.nl (unknown [10.100.4.71])
	by outbound10.mail.transip.nl (Postfix) with ESMTP id 4gVCPr1KnNzTPNW2;
	Tue,  2 Jun 2026 16:09:36 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission2.mail.transip.nl (Postfix) with ESMTPA id 4gVCPq4B6QzJjhY2;
	Tue,  2 Jun 2026 16:09:35 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH 1/3] clk: qcom: gdsc: propagate gdsc_check_status() errors from gdsc_poll_status
Date: Tue,  2 Jun 2026 16:09:32 +0200
Message-ID: <20260602140934.796697-2-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602140934.796697-1-github.com@herrie.org>
References: <20260602140934.796697-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission2.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780409375; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=kfm4s6J4MM+FQLTeg/mMimRvdRuyF/Yx7wGvlUw9pFM=;
 b=TuTZ4PtQghYWZ0ykmS8f0g43VhKMAa2u5fZQNwdPVHXlE6PBCzZuPUZluienYgGVIy4CCC
 0m/vfj6nsgcuFQgwW3CyHArag2h8qrOin6c6JaotIkzgggpA/JYesTcn5+MnZl/SB82cow
 bolTU3VVUY3vIZbKjHZ483sYaGkTgFmlYbA3KA/fZ4Wss2/1V/jhnw52xLM+RiDUJbcMpP
 S2sfeMXRw6muhn5ssQSofDBu12LgWA4CkotfyCgm/fmzWN01x2mvgyQ8Um4Jb99i6MWYrC
 CbWMllKGAtLhUlbZatJ0OzezR5pQcygVWeY2b2ocTutPpGqBMT71yVP86+1CQg==
X-Report-Abuse-To: abuse@transip.nl

gdsc_check_status() returns negative errno when the underlying
regmap_read() fails -- e.g. when a parent regmap dies during system
suspend, a CSR is removed by an HW debug tool, or the bus controller
goes into protection. gdsc_poll_status() treats the result as a plain
boolean ("is the GDSC in the requested state?"), so any negative error
return is truncated to "true" and the poll exits with success even
though the rail's real state is unknown:

	do {
		if (gdsc_check_status(sc, status))
			return 0;
	} while (ktime_us_delta(ktime_get(), start) < STATUS_POLL_TIMEOUT_US);

	if (gdsc_check_status(sc, status))
		return 0;

	return -ETIMEDOUT;

This silently misleads gdsc_toggle_logic() (which writes/un-writes
SW_COLLAPSE on the strength of the poll succeeding) and the gdsc_init()
sync path (which assumes the readback represents real silicon state).

Latch the return value, propagate negative errno immediately, and only
treat a strictly-positive value as "reached the target state". Make the
same change in the post-timeout final check so a regmap that comes back
after the deadline does not silently degrade to -ETIMEDOUT.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 drivers/clk/qcom/gdsc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 95aa07120245..b9b47f584f6d 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -103,14 +103,21 @@ static int gdsc_hwctrl(struct gdsc *sc, bool en)
 static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
 {
 	ktime_t start;
+	int ret;
 
 	start = ktime_get();
 	do {
-		if (gdsc_check_status(sc, status))
+		ret = gdsc_check_status(sc, status);
+		if (ret < 0)
+			return ret;
+		if (ret)
 			return 0;
 	} while (ktime_us_delta(ktime_get(), start) < STATUS_POLL_TIMEOUT_US);
 
-	if (gdsc_check_status(sc, status))
+	ret = gdsc_check_status(sc, status);
+	if (ret < 0)
+		return ret;
+	if (ret)
 		return 0;
 
 	return -ETIMEDOUT;
-- 
2.43.0

