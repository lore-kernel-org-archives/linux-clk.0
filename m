Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A537741A4F6
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 08:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040513; cv=none; b=oBGdZbpXkLFy2cTEyj4/r4mcLwC3AHmxqye7jaXGEl0CHGEB6uAN6NFdetuJY625nIOtYrJAZTgu5XjCaFtVoFxQP5dooEWzz+HUHWDPxZA/jjiXmEH0Hc/zC5t8/HAmUteZcaKPjwatrhXcYXddOo3BfF9Bztdb2CcN9krCMY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040513; c=relaxed/simple;
	bh=5rxYfB6fEA8QV4OQaA+5imSOiEABtOgJH0KumSHC5aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Re1Q2N56yjQqVH7kR7vZTxuCyyuX5NDtr8mE9vlCA14yJ26u1Kujbvon9oV36knn+xeFXjsLrq7aT0rSra0OiuSzEN18AFXWs2xec0dMOx4ZnGumvoeyiyvLss2ZyZa3b0k7mTgwSM/p2FK6iwOlKD2M9fpZajSjBeoh0RhpqUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffgphiyd; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffgphiyd"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso730664a91.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 01:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040512; x=1787645312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPC9kIZPJX9w+966AchnoLlTw6QUfW1S03XH4obRJBg=;
        b=ffgphiydLPqrMkvk8Ocx6DiIu+lI1/7goj88H6UgB2YOdr40c99aKs+YYM4Jz96h9S
         jq2/DQtbrhaFcyOAQxNLORVNArEAtRuoAF7lMpsfFqm3785kaoMyBrY8W3JxVTynw35F
         HVMxARa5jXZgkXFu1iZ48mBLAMquJNr5mcBcXkAus8CxW4oj5XfEG0Bsz7ecCJmtJzBI
         h0CMJ0IdVO/UfeVozGIbQMQQCcRr8BYwb/tUp9BsDjO4iEJca4z4GANPLq57AfgXTnny
         ZSia6VPVULPEQpySkyAXGCeJ3wgnd0PmChD1TwLPTmO35xt0g7TZyIKMNw7JKC20Prsv
         vqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040512; x=1787645312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPC9kIZPJX9w+966AchnoLlTw6QUfW1S03XH4obRJBg=;
        b=LQa7ppfCaVk8f3cJz2h3xp9epRIEcHNWC/0wdy1wMMEKIYkmI09SgdxKLaKBG/Kbcg
         Lj9mTG74CgiDVVTFT+oqKdfV+E3EkHLfVGfEFxZp09rCfcTQPX7qWb+6U0XqGykheUK5
         3321i6nvl07JBFTfeuVonJTtM5w5HtkYQrHpzUeJAxsDTTDLTVKXutv1jzoWTJOCFYV2
         5a3xXgXkjd+gEvuPW/+GWnyiRZUlQP5m0EjJWEWW3/VBPZjQgXKGLy//z25yUzLE3xKC
         AaIP2j5ub4+SUkn4W7m4M80DTgaDRtLb7E10QO6Zsu6+fXtbl7B9w/+KuT6L5BYInq10
         fn8w==
X-Forwarded-Encrypted: i=1; AHgh+Rp3LXsl5xZ+5IfqeYNJhnTM8dP+BSbxt/SdemEPY53Lp+f/C7ghqoB/ck7WDhNVoC+p+52Y60pj++A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3NZ7ozaPpMI+GycDXJuszscBwZntET6ntqDMkmoASJVBN82Yc
	Zs8ZXr9NrmvSWkjzd8EBJL7CPiE27yGPedEccELGhc4MWAAu3Y9R2HfD
X-Gm-Gg: AR+sD13/hCIi18sRnbM432gYL//2urIc/04GMXn0Qx6Ltj32tdGl8IaFkBwfDtJg1+W
	NgW7bc+wkyikrS/SAPMCV7KnSc8FuKmXtRC1IAX6rSHghBpqRdKK6Z0GhiDkLDLQDYmRgxdAht7
	tjBWEPOQgzPyKwOB0dpfunXbl2C1YWHbyky1t0D8Hsm16cnp1Ly0X8H1tgghZBt5YyXnAiR3Z17
	hTDlFmjnBHEfJNRXX28XJU+PjsQaqRLSDyubE+bXCLtb7bIRFFarroYJWoytOS10P1qGQjpW9aT
	ckbX9Qy/M/gA1rh+tLWgtYS9W1Vn8OTs2LeG6p4zO0yUkA8QlBN4ZbkUybhuv6iC8NIrNj66iNd
	0GoIm763n9qf29V589N+ufUgyDyovNjSwAPA8BYU75JDchS6k3SRVwCbk+r4GAWEbC8EH0PTXsD
	sa2FWkgC86WHZkt3AJoiIcrGbcCJJhArrwoCVPzZZFaeFPFsxVGHl6i+2IKlEvRSTNMkchuxCkB
	5omDwXnaZA=
X-Received: by 2002:a17:90b:2e42:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-3955f1b64b4mr5407158a91.18.1787040512026;
        Tue, 18 Aug 2026 01:08:32 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:08:31 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 01/12] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Tue, 18 Aug 2026 08:07:43 +0000
Message-ID: <20260818080754.4362-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ID for the Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 1af73c0ad..3c1ba5168 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -208,6 +208,7 @@
 #define QCOM_ID_IPQ8172			397
 #define QCOM_ID_IPQ8173			398
 #define QCOM_ID_IPQ8174			399
+#define QCOM_ID_SM7250			400
 #define QCOM_ID_IPQ6018			402
 #define QCOM_ID_IPQ6028			403
 #define QCOM_ID_SDM429W			416
-- 
2.43.0

