Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300C73B5830
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 11:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314646; cv=none; b=nVBgn/KU+5naip0wwCINnDHsf1FpHB39zm6HWqYob7o3EIGZ4vir6B3Cxw4y4vTnrGLB+blckODLYPXs43WXwFcD0mZrjV9QTJ9/wy+8PLUsnFJ5QqmeuildtRfskRkDm8/hfT047C5HUdE+R4hQB63FqZUTldOjvT1OoFpk/KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314646; c=relaxed/simple;
	bh=R8i5LmeS7vywoaypHJDWa8+wWER2GrTCmgrv+06xBiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kMb7nUVib53+WM3ZxmS1af5oxdhvQE0iNekAxAtpPk9LLT30E1wIoSAqOXh9SOW9dzM1JcxManVOplyjr9DAke0RDnDabzQhkUqtdMm6wGTnTyzYUnG41urqHIt0lvRptkSWh8CxWHqwWzUXnReDF5JZ/KRch71G7tKdnu4c7VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=WG8gR0f1; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="WG8gR0f1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773314642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4l9TwGmwI62ShrR0LuMlEarvkAy091kq/V4gPz0BH3Y=;
	b=WG8gR0f1cLrUrA5MhTp88ICX/7OTdeXb4gEsPHK2J2ydNQZjjznQ0gWk1MJgaAs7QSJN4T
	HTadZS3n8XYtqTA1qeCd5ASWYhCxQ1qDqe8GZcyiNtXgWysz6gGE+tmcqFj0/tgyT1V5nn
	ODbjlVaAo1FkHmrPqr7+YAPeS0gvghQNfbudydSdrjHp68n7IcVXBwv714oebCrVSXneFa
	mCiksfb8LD7Nj8glXFr4lOMlg7KyqwRNb/TRTT7pSj6keyxJFOr3ix1G+wPhWt5SyzT+Yw
	K+kjlrXj3WTJk+gorWEGEM5TuK/r65tdJyowqv888aGs7F1UtnSjdd/iVS2d9A==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 01/11] dt-bindings: clock: qcom,gcc-sc8180x: Add missing GDSCs
Date: Thu, 12 Mar 2026 08:12:06 -0300
Message-ID: <20260312112321.370983-2-val@packett.cool>
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

There are 5 more GDSCs that we were ignoring and not putting to sleep,
which are listed in downstream DTS. Add them.

Signed-off-by: Val Packett <val@packett.cool>
---
 include/dt-bindings/clock/qcom,gcc-sc8180x.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc8180x.h b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
index b9d8438a15ff..9ed7b794aacc 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc8180x.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
@@ -322,5 +322,10 @@
 #define USB30_MP_GDSC						8
 #define USB30_PRIM_GDSC						9
 #define USB30_SEC_GDSC						10
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC		11
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF1_GDSC		12
+#define HLOS1_VOTE_MMNOC_MMU_TBU_SF_GDSC		13
+#define HLOS1_VOTE_TURING_MMU_TBU0_GDSC			14
+#define HLOS1_VOTE_TURING_MMU_TBU1_GDSC			15
 
 #endif
-- 
2.52.0

