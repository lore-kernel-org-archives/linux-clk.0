Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C3F4A484F;
	Thu, 17 Sep 2026 09:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636043; cv=none; b=fo7V7E1DRe8B+Fq0GO8pmrU9Z10/ECBRbg+ItLNFf1J3kadInHUd9jO5ipqVIxPsPnb2WLY/2YSB3mSmxdjAfLA0xyTO7Znc6u3/FDyxbUuny0EHypdmFn1iyKv26VMEZZo0RqlVxSwEr6TWZcbmPy9yHp/Y8WgQ/G3vb0U8JSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636043; c=relaxed/simple;
	bh=zMvAjTgY4H4tDP7p1KXre59sDVGMQ64j9Ua4bl2Lg1Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p8iliGG2SEDJE7qHRZT7mkyFoikNrI9lv9HdrMwccVaUMmsaGx8qU6sK1Bs2p5Ngle5W2GNHql7jmSErtMAYIchFx2AUeVcGIl/tBE1ezWpBFaF+/Bfpal4I6NKcPEKwIDvsHExadhVj28UsfOM0XcrB90c8G16euwkym6W7FjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACmDOwj6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACmDOwj6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA961F000FF;
	Thu, 17 Sep 2026 09:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789636041;
	bh=3PVi5I/8XaooRVeaEp0X+Mv2AxQzJLysEDNI0bUGMxQ=;
	h=From:Subject:Date:To:Cc;
	b=ACmDOwj6YeS2jK4nAZsBSQfDhG7l4DDSUvAnpWbb4IZJ80HdZxhhaEIExExqdjQqS
	 qZjIUbqtTO9hOOOzGIP+d4fw0QoOO+Nd/Wri8tw6IWTdxsZqaewUWMgkl8FRw5XWqA
	 eAWD+hFLduOxrGRElr/N0YAm3FHZGaUtzpTVQGJxUCkyk/mqDgDBN/mj/H/lK77ykT
	 XCPD/h9tykvX/0r9CqGjaNO1pmPaNMMqw9+fNnHKtVDCdVUfzg6BWhyuK1J8tFyZ48
	 vqnhLEJXre6xAKnWMEGtJSeSiKzi3bq+nrGMXaf2NKFpr8rQIwTdRpG2GFpfRSzqYZ
	 msLn8HhCvEblg==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/3] Assorted fix-ups for clk/qcom/rcg2
Date: Thu, 17 Sep 2026 11:06:52 +0200
Message-Id: <20260917-topic-qc_clk_fixes-v1-0-5531cb00514b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0Nz3ZL8gsxk3cLk+OSc7Pi0zIrUYl1DM0Njg2SDpFRzUyMloMaColS
 wBFBfdCyEX1yalJWaXAIySam2FgCGYxxQdgAAAA==
X-Change-ID: 20260917-topic-qc_clk_fixes-16130c0be752
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Amit Nischal <quic_anischal@quicinc.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789636037; l=672;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=zMvAjTgY4H4tDP7p1KXre59sDVGMQ64j9Ua4bl2Lg1Y=;
 b=2YPaMrdgOSX1bmBYrZjMKbgrt0e2vOyPR/DtN5SsLoomGEL4V9UTHeL104EoUbitWOtfzUFH2
 JUqB9oM9Fu4BPW+WDubhbGcf9qwsuDnLn8v9tKbrh37zO6v7kHA7YNw
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The robot found a couple of small issues that I believe are valid.
Compile-tested only.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      clk: qcom: rcg2: Initialize shared floor clock state
      clk: qcom: rcg2: Propagate force-enable status errors
      clk: qcom: rcg2: Clear force enable after rate failure

 drivers/clk/qcom/clk-rcg2.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-topic-qc_clk_fixes-16130c0be752

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

