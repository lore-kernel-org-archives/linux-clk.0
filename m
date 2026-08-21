Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F8D430CD5
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 08:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300041; cv=none; b=owFXKW3k/6e7oH3HuqFnMmsJXsM4xrGdQYR/EQUOPLAAS6EAVoDECQrqtRCh5te8ubHvHIDodfh2EPmlz0ecOd+scWalSwg5YzZFRDBzYPJtF84cUmEDwz1lcrytyVRuTu+z7LsNpp5fL/7hSer4sJsOF2hc0i60oI6Y76WftcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300041; c=relaxed/simple;
	bh=u2Yu4YBYm2njILlYS8QED4Q5XuAaD+AtoFT/SlvHqq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VPn1W06ApPrYz5xQfTLj3ogfKBrOptjkN5lrFoeXRDHzNAW10Yi3B1hwfrm/JlrxGDk8BX8Eb8tahgggXK9nBXqbZYjQyzuwA8Ista9oNqzFC/CxW18hn+lONW2szgbci+8DUCtQ2zWG6e8BrymMahIP9WBb3Jp19/Sj7O6YkEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r/v15Lxg; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r/v15Lxg"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e88b60121so544475a91.3
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 01:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787300040; x=1787904840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEFzlhBjAhuEe8xovPGxxPJuQ8Ojqn67sRBJbsAP39c=;
        b=r/v15LxgIt+ClC1W8QMwX4ML+GIEitmBuXJhWqXrszq3yLDhXyxjJTy7SvJaovc/cG
         a/P4bOBWHT0dXeMWFGvsUbt1vVEajyXAc9O+s8xkvlm16quS0Vb5gm0r3KY6rfOyJlxl
         pC411eoo2m9484DOBo62HOW3VkoKp8CuMneNgi/L4dH6Pk43Z/vc4sT4gLtYAvKMOmPw
         lQWyjr1Ch/pTC8hCJenmwZ4Wp5zKMkG8h9HbS4U9q3HYml4syLwCUwuGnLlMoR7bxCbX
         4YizxtZL4WQ8XEeGdHPQWn3qQixsUQPPLQ5Lll/iOIJVSisfEKO41ZTUz0I7ohCg2tLw
         sx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787300040; x=1787904840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEFzlhBjAhuEe8xovPGxxPJuQ8Ojqn67sRBJbsAP39c=;
        b=n0RUH7J/JmsObIM8RK2AVBUKg8JThEPBcNifwhmDmUFRbBPCng7H4E+AKUkakeOIYT
         M0Phjkx+DQxJ7D6N2pvELR+LtihqOSqYGWmfOCTLh3Vg766R+/xpsGcc5Npuc6Z7Il5q
         PVnoccUcSgX/2DgsU7vFrzBf406RBSoVatcXFMdkNGdQhgOmFm9KA38cTV/tB6/htb85
         NgLkIOqf+Bw84KOKlemVTYybqBGzbBq3BMLMNz6ZbyAITanrhiteWa//sUjea8g2DLQL
         od5Q76rW6Fk+lmUYQWdr1cqNTdcp3AB+0Mhi/XHzM58BMumvbhyP79MuP9nLYxco+WRK
         hjWA==
X-Forwarded-Encrypted: i=1; AHgh+RqspyheYd883LKcGyMrCPFjcQV1ZbHisVEfto2Of2rSAoWUvrfmXqqdqktnvgH3m5z1omNfN73r8zo=@vger.kernel.org
X-Gm-Message-State: AFuF++mTgA0DnZGYz4Uv45rk48Z5C6UpCCPTgO5+O7BqHQsdO2Y+NTaj
	UBHsFd5rz9QmVFCdvtqlVCU1Qx5slSs40PCe1gvHfCXkXMoDfUBas1Q1
X-Gm-Gg: AR+sD12oGzJ19qT2z5H7WJKP9FaWhJW6QrVY5phTR2TqcfxESo5LZd/kjc7QMBajOsr
	98HoTcDAkT+UumH+ZtI9qOBpUyS6qZAgt6PnACP81GgqdFdCmaE6OvAPFeqmu+HG7kwr9M1j9Ty
	94s+VcxnKqqp0iydf0T8/oztrgM0Z2sU8/Rje6vXKz2nDUEPAwRxWrUfPjePe79S5ZpUZNNJ2uG
	KABhMjdr7npEw4Ks4GFZHm04cT8vbXccy9XmgKjwBvWV2EvCDG7qDrsdKRa6bAL8R5V3esvbg0F
	o9wafP1paU3E3IlgbdzY0RiOuCdMo6xlQXJaLeXp8ppcCsYw/vpJs6AKYsr9XgpE8t7lZOHdq6l
	1vRFzaN6iQyvj7LRQPq29QgcGHo/ORQbdylPgsT2eyBx1S0Oa1olKKfstUUtb6G0wYgSaHb28wd
	CZ+ap/jFJJqdO49WInpbgK0UpS9UHcHSP1mtX9I4AZA26mzOt3svvFJzjgLtjN7dndlXv3bpMAs
	TkZZwb1/HgJ0mBdbVMCZtc=
X-Received: by 2002:a17:90a:c2cc:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-395c35d91fbmr8956473a91.11.1787300039934;
        Fri, 21 Aug 2026 01:13:59 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:13:59 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v3 12/13] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Fri, 21 Aug 2026 08:11:24 +0000
Message-ID: <20260821081125.4522-13-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821081125.4522-1-sreeshankar0910@gmail.com>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..2dc2c265c 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
-- 
2.43.0

