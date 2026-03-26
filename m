Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDB62D5412;
	Thu, 26 Mar 2026 13:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532718; cv=none; b=fZHoe6mbVOPsYLT1urqGjZ9xYp0atfbOKYFgYBOgr7O5VKdhQ0uwhtFWLgxUdAzSFMzB55otG1sOiClBwRQld7Db5296h0npopav/50UNXYNXVwJfKTeK565NHpaSFTHCEhC9AGjQCkAV+Lm388bHnd1stknBntKNBmanWWku1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532718; c=relaxed/simple;
	bh=1RUDs/9GC+fFfkZ7Xw9OHg2v+oefEPRSauOQRqYim1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=urttzf53oTI09dSOc/0OqFRY6bll7mE7LIFtzwmSbN9+wf8TZCJtXhSGqjBHr2Fs3ioEMr6DwUDW4Ji4NoGy0MTDoGVLN9hlKMPxTIs+8yYqa08OPHb+Vy6ei3ZmmALfh9kjNOYhMwT79aJfK0fi65SYb3WXXRcAdPsCSkZSEl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pT23BNEf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pT23BNEf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8933C116C6;
	Thu, 26 Mar 2026 13:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774532718;
	bh=1RUDs/9GC+fFfkZ7Xw9OHg2v+oefEPRSauOQRqYim1g=;
	h=From:To:Cc:Subject:Date:From;
	b=pT23BNEfK2FUxlSWXAMp4SOiPypuCj5X7I7l1FTyiUwCAQSVMi5SqVpGidmm1/VaM
	 3BI+uKWuye9nq3XUyhU/Fdw9iK+34qj20Wt0eSNaE1BosFowO1KGC5xnLa74OrdOwA
	 GX/+v/8TE19IEe4tmLpySIf7XyTv6qIqacOmMs8+bOqBa7BOlrY8zEnadlTpJqkl2w
	 8qqjBMcCdugplAqykfnqzXNs/bcduAFwWkEdLrBHv1eyOGVABYs3qLliSeLp0JM4Lq
	 74IqmSfogtr/aziWHgQD7J15PFl0RWf5hQETT9HYKT3UU3pb86nNnjfs13K6LyKqdN
	 6XG9C6TqBjArQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm clock fix for v7.0
Date: Thu, 26 Mar 2026 08:45:15 -0500
Message-ID: <20260326134515.67326-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-fixes-for-7.0

for you to fetch changes up to 141af1be817c42c7f1e1605348d4b1983d319bea:

  clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX clock source (2026-02-23 10:45:35 -0600)

----------------------------------------------------------------
Qualcomm clock fix for v7.0

Fix the clock ops for SM8450 DPTX1 aux clock src to ensure DisplayPort
works.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX clock source

 drivers/clk/qcom/dispcc-sm8450.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
