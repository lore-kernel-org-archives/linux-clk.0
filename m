Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA4D3D522C
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 07:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246477; cv=none; b=Fv4NP884FVhsTPN4HKW4+OkG41ZxJjzAjB2J+3kGmPxnwrAUnsz2EcfHxXdKew//soaWWxL0V5dnWz49I7/DbzGdfHeUv4Mrekzxh2F888HoDHt77vP+OudtgHbb4eVtWoo35ZRzt/zl39kkGIwOOLlyw9La1+F6pVlxD5KyuUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246477; c=relaxed/simple;
	bh=HpzD8eE93G0QF+A2LkG7W4+8iO6y5XPc4Rl8E5Fjv8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M/OOzLAKaLOwPshXe3dB5m4qAA7p4n2D0Flp9IUfbtFKRd+1DArPPfamL7bV1X8QfP7QZtqUo9w+8pKqA6kkP6GkV6AgM86Zi2TRujB7MwTafHBKoGVOCbH4TKPM0odO041C8UIAYiVtyirAUQEQozJmKfgh2xjUSrbKv+C9Wjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dv8aySjf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dv8aySjf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d91ded8174so4514875ad.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 00:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246473; x=1788851273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=Dv8aySjfpC9KTDIW1iEoYJgwexn0RdcqOgHq0hJ+t6qviKAaov/joQynfsnUYxYiN+
         qWR409b8vIG+EIH0IL7BSN5XeGky8YuYAER8iPaWECQFA0tGt3K0ce08D3XduW8KbMWW
         nyf6V7geYnZufbBcWxEiX+bf52A8WhqFO3TmX7KM2EWDZNIswLk3B5kr67JDztySQc75
         T9vw+9QhIBXgc4Yybja1niUd9usBvJXUZGYW0I7ninEub8y1jLaxbvELCeIyLk+oJd1w
         5UgT5nMcQ97YxHVN+UthgxIgS6iN3e6wfEMp1cCVV/jwtIIVALE12CyRQdoIyJnQHdPx
         /Zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246473; x=1788851273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=mjbIKubqM0u7MH1X2ZGwCEfOCknavSIUMIFZyTDHiclnNtGw08Xfj+if9CXqm/ktaj
         RptacYCoTegvDV+M6XwD1mJ98VoBqVe5iIxUyC0bbEKcT3j/Vm3r2VpKNIMrF+AW4Uw7
         01nUjOpdJHtSB1VmScJ9X7T4IGA8o5LDu/7QfSWfsYGnzjvbU4WgJ/MMv/3gWM7Kptqm
         1b6rUM2TQ77kaazVhEQl8Qpd18Y4XRjHJOZpgDZ5l8VimUYXZ4pGX/SoBUbh+fslGff/
         RQLQa49AMSoXx2Q4X2phPHdwFiwLrRe19/hFGYUhtuhGiV3asgIWSVAf9Oqo3fDvIHDy
         RBmA==
X-Forwarded-Encrypted: i=1; AKwUvBx2lH3y5aK2lmxc+HauaeH6AcK8Kpak0RuZuMmUxZ8qplfFQTQicJiETZ2kTWOm/hdIWvtszDkrzlI=@vger.kernel.org
X-Gm-Message-State: AFuF++mUZKtumM0srbnVwAcWuCyoXgXwrRPZFb8pOhOCTX/vndJJfOl/
	VQA5JBi2FvZKOZZ7Rpwt1umsil4FIRCI7OCj+k4fowuxiVHEXJf2es8n
X-Gm-Gg: AYBFou0RaTdxt+ok52UYDHlu6nAbPwF9bVem6wuO44N3Yv7VTbU2y/5AQA+1nIFQkfg
	IGt3QxIYYN/LTObjCiwTE8bUfeJkLs3nILpnU6e2p2i3Lq1He/CikWoGgGH2iEWk5YvLDqu1BXy
	/5SbfTy4hW7MqTTbHuNZn/JtMUgOqcL5kyEF4D4Pm1Xhn/i0kpsBcjfeaiYyvPUsFug7omsYOo/
	IY7vlArB+K8QblVifCEML75JD7G+kG8v2F1kP6Pi6Rk//7jf3Ql32onGBoDg3Wkd/z6wr/56ajZ
	5AhPYlzmSjoE2yJXExM+mfH133ICxgLlJ7wYyJSjb64MYtJaCAbM9inYUtd+P2ZLskXz044U4Bg
	vQfyq4mss+v4vAOkQy0YQfKFkwjqqbMglsnIFj9ud6Qk72L2LR9Vb/kGuk9fm89e2lOS0jH4vJk
	9s1/0uescdEOJzoYo3Bg4cJfMArdVP2D0nuYya9X0UnAMi/BHXiZRAWvD+gS2ab3K7mQ0FMX6nX
	2XR34kZIi0iZx2j1VLt1vI=
X-Received: by 2002:a17:90b:1811:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-398e86bcf08mr15397552a91.20.1788246473340;
        Tue, 01 Sep 2026 00:07:53 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:07:52 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v8 02/12] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Tue,  1 Sep 2026 07:07:07 +0000
Message-ID: <20260901070717.20513-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901070717.20513-1-sreeshankar0910@gmail.com>
References: <20260901070717.20513-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC ID for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 1836e226a..63ee5cd56 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -450,6 +450,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ8172) },
 	{ qcom_board_id(IPQ8173) },
 	{ qcom_board_id(IPQ8174) },
+	{ qcom_board_id(SM7250) },
 	{ qcom_board_id(IPQ6018) },
 	{ qcom_board_id(IPQ6028) },
 	{ qcom_board_id(SDM429W) },
-- 
2.43.0

