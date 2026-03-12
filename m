Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58E03BBA0E;
	Thu, 12 Mar 2026 11:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314665; cv=none; b=kDJax79bK1JHZfsfzvvp54EGfMOKotlgbl3TPjJyf8s97kzlPIA+EMNvimrpg36xhvpcxyh+FPCVYFCo/d5qcTKlSkoq45jk1MuqGIKJZbf+vJWlCvaBGlOcUNqPRLIQBRHF/DknNpT2cSlQo5p65+hUyusrYcA9X3R6OjvnKRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314665; c=relaxed/simple;
	bh=cgaPZinUPDr1PYA2GyKMdYtFxWLsPXtHju41DxXVaTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BjDdi4HgE8lPHBwTFpdEbrsh5E9B7CF8G4gOGZCyQDpLsij9ME6Zvs62bUyIF/pEbQIrJp+9z7lHsjBjkLTC2MRyYJg2UKjR386Zjz56YG4OG9hSJcEltO88qOxtGcf0m5KyI0T10meIXjPrIC6ylt+gPNJ5pNNBx23XIjX/xUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Okx812Rt; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Okx812Rt"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773314662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CeQ/ayI+gqt2blZgg3ZnKYaoMVG/Kc0EQV8JnYiTbYA=;
	b=Okx812RtnWpBrMaKI+Tws5cKkhgFP3UCX+i01EtVRQAPM/7IfDbXc4rBMEf40+UPg3sOZc
	4VhDnAjngZhmsT8PhtebTL/WcecLAwv3K9T+2HzdYdIDc8lOepDbp1NgWxQe3F4kqy9VJb
	E4D2GnVAV+/z+Ai0Aj13ru4pbU3TEFstc3WKhG/SnRiGNZumRT48D6l4tmUmiMAmBa7JuG
	mt376acdulvW9dvaI7qzE5PA2lDLvKlEq6mu67eHLKQualX1eBvuBe9zRfWt1ltKDxT7tV
	rjKsz+pT+uDE4bgU8dNs8gbcaB0yPZoY8MvOpbIJIB332vaIAwzbS2lTKpn9Zw==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/11] clk: qcom: gcc-sc8180x: Enable runtime PM support
Date: Thu, 12 Mar 2026 08:12:10 -0300
Message-ID: <20260312112321.370983-6-val@packett.cool>
In-Reply-To: <20260312112321.370983-1-val@packett.cool>
References: <20260312112321.370983-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The GCC block on SC8180X is powered by the CX rail. We need to ensure
that it's enabled to prevent unwanted power collapse.

Enable runtime PM to keep the power flowing only when necessary.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/qcom/gcc-sc8180x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index 4095a1f54a09..2888c4ebd5e8 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -4663,6 +4663,7 @@ static const struct qcom_cc_desc gcc_sc8180x_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sc8180x_resets),
 	.gdscs = gcc_sc8180x_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sc8180x_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sc8180x_match_table[] = {
-- 
2.52.0

