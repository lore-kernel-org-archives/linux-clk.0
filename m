Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F98923B63C
	for <linux-clk@vger.kernel.org>; Sun, 12 Oct 2025 23:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760310538; cv=none; b=OY9oFYnVBenuoCuqhN72ryFEMOoWX8sWzLyRSaRlhKmV9Qf4/ovgbInN0ZuIP/39ykcpZqrBM4WrV/VADgVVV3/+l/y8UR/girMCMsrOHi+FPr5v2wuEQccglOcEBTiC36RxXed8n0viobZrM12rowalGxReRnAH1eS5My6YZpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760310538; c=relaxed/simple;
	bh=FrgeO9jAQ13cWTQoQ8ZjMCCa9xelIk+ejwmInmLMfpY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CS+yW+W7wZXP1djGsS3KF3EGq2rjvWXHF8cwTRKS01pSH/coetHIWl3bR7+pmES1ei+dbrIeWeu67a5iv4zPc8Cmg8kRZi32f4rf+fHNmrGEC2sRgrS5VhycoxIS15m69eqdMJZmqtPUJ7bPVTewk1Qw5VzikFvrBwKT8YcEj0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=tBxvfyM5; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="tBxvfyM5"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1760310533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qfhZrhYFtMSLWRRAHazHk/R5uWWKEYTL6cwb+TfTWeI=;
	b=tBxvfyM5iX0sxh8othw28Ip5LCQ81nppXf8uXsHR4bUpDvVo10RzQeLk5zZtQ6pwiE6Hfp
	vXFuixsc4Qylvon+Nuehb5QefLnTP/7meW2FgC2aE+4O+QtT3b30MUaX64gnPA2mDiSE26
	e55DPcnNGjXHSSFjlXJv+mT3bam6mJxhtKjhRTEwM0HBzWYLRIpBaqgxgBHcuePvsdorYy
	v9sRUkJ19sQGjJ04foe8fuCJHOZ143xsBiepgROMyula/yv/Mfq/B3qkG+kTskxHIy9XcJ
	qQ4VvlyoXEcqZlTixoDJ66KFLLKKGlsz2H0X71JEQZDgzGGRqaSewpl8emWR5Q==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-x1e80100: Enable runtime PM
Date: Sun, 12 Oct 2025 20:06:59 -0300
Message-ID: <20251012230822.16825-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Enable the main clock controller driver to participate in runtime
power management.

Signed-off-by: Val Packett <val@packett.cool>
---
Seems like this would be one of the prerequisites for actually reaching
deeper power states.. I've been running with this patch on a Dell
Latitude 7455 for quite a while, did not see any harm for sure.
---
 drivers/clk/qcom/gcc-x1e80100.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 301fc9fc32d8..96bb604c6378 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -6721,6 +6721,7 @@ static const struct qcom_cc_desc gcc_x1e80100_desc = {
 	.num_resets = ARRAY_SIZE(gcc_x1e80100_resets),
 	.gdscs = gcc_x1e80100_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_x1e80100_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_x1e80100_match_table[] = {
-- 
2.51.0

