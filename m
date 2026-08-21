Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D193750DB
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 15:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326977; cv=none; b=RsYo9eAc8+ZTGmk8zXQaA3N/1R+P5RGqAApHODVokUszMKY/5K5GZVc2+f4oAKppXFvNADJeB6bj8UdaWseeXJhwU+7OE5PURr/HewMIB5n60uje6icLa3UWghhWuWXyHD90HltwO795/aIg9IN0Bi/EJw44dPtnK/F2zY0kkcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326977; c=relaxed/simple;
	bh=u2Yu4YBYm2njILlYS8QED4Q5XuAaD+AtoFT/SlvHqq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iu5tzNdxQY0Rtw0qId1ovJhcOJIgzl3dGH7ciVNnDGJHhESNNYTEabuzY5zdjX4TrXIXS6/xGg8vNhcaNcuz9aPt5bCnGGts4UaUPTVVIHo+uDAOgGTjiBKJr2hGYj3vgV2Tfms/Gp/hAbtP5JhIrfLMvojT7RC35LnSwoyeO6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxw50x63; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxw50x63"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso1213215a91.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 08:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326975; x=1787931775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEFzlhBjAhuEe8xovPGxxPJuQ8Ojqn67sRBJbsAP39c=;
        b=jxw50x63pNeTsZAxOlpgb+9Ks1v9WQEn/y/ca2XuPKv4XLCOZITDEkVz1TbhtrzUus
         U5heo3pC7HziMnNws0pimkadcLUafsBmfqbAF4y8tBfRDOZQt/MWnLgyfDi7nEbMlhhi
         YAEUj3utJ40kJVIuh0Imfol/i13FzsvYjU2wGrs3dGtftJ3h67BosK0G1JHhC18dTn53
         Jq9r55Cs/Vjo2tGexZ7gDSTK3MOdWxQX+rXhbN1FZueCJGjjNTUTswPZaX0bPYMxBgEt
         Plfu5eMOBQxuo08/784w40Lmm5pXskWjiYghHcmEPfapSI0YKwBkfPO7m1yGl60Yi5tX
         +c2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326975; x=1787931775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEFzlhBjAhuEe8xovPGxxPJuQ8Ojqn67sRBJbsAP39c=;
        b=nRu0Hd2cvmfM39XYqXcMf1VtD3TT+5S76tt5ykjb7qeg4JgDiccvAaZj5ksHILZTgJ
         EJ8dcA4OrM8npmDNziHB4iKSAyYiq3NaTi9sTUN7u6KRx/Mf16dS1Eo//vGEQ99U8qoy
         92GzyBb5DKdfFU5ioclH8jYdA0dOTQRUJ+fMQLh96AHxw7WEaepKdwIyUX0NkC3VRweY
         4lf2DbjbpITtvvE3FsVQNtyuYXGKacABr1KBOnIxa0FlHMGw+TfiGHjtV/gJxAQCJH6Y
         ZK980lCBp3pNotVeFDejaMU/DPkJw1WGhNBe0H3n/d4kj7+CIWwJC2gz2Rx6yb7Fyg8n
         wjkA==
X-Forwarded-Encrypted: i=1; AHgh+RoVmM66dAqeUZyGUNrVLvyEEXzcsmLKsWJ4PqpI6iV6S5ADLd1z9rOi4+U3Ni4UQ8oo8D2uxKemRg0=@vger.kernel.org
X-Gm-Message-State: AFuF++lAHxgjiN5Cm1IgmE5PjpxgWken91hx/fO2OoPBxaJJ4+PTLuTb
	v0uNqcaoqK2hpYPtluBNXIb70BlF6XUAZKmNGA2fCh6/6CAOVMTLqz5i
X-Gm-Gg: AR+sD129nuJBmDVEVoBo1sKG93YE5oPeKL09OE2eY7QxChhicDA10ruNE9tGJcN/xrb
	CtEEu7GbUhJbzZj3NdA2NoucVNbbDEPyLSi902UeUdNE86C3++hHk9z4fZvt2+6WccllEnyR0wL
	XKQbgptdj6MU/hVo8hEQhBU0p5hzU6DZJj8RM4E5GsGsN/Hen4uzELmJUE7a5fGLewP2OyaJe8M
	vultmdhVfq8cLkf234Wn2MHNbiEvKT9vX454MccSMyQGSA4q0tkXKOoEOVFXbSFKxAeBve59Wn+
	6FQKXcVmBER8EcM/yWe9bL4zcVAk+nwdS/x0LnFdk+Ofn5CyLuyNMpMIoifHHXP93Dp9SkCrCco
	BMkoz0mPiMbgPACJo1ZPujNJsq4Gzi3K3H5E3WJAxzn4UtBXEai18aFnGfZ6LzyOG6OyPmKQv1A
	JyU+LAFHgCwhK9oeQ41ZDKqpUGEPT0w0D8zg3jfQnKG2kx3kv8/J//ycgtt+yGOvUFRP6rEX14G
	dEt4F739gMt9CQKCw==
X-Received: by 2002:a17:90b:57ec:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-395c354e8e1mr14045906a91.7.1787326974668;
        Fri, 21 Aug 2026 08:42:54 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:42:54 -0700 (PDT)
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
Subject: [PATCH v4 12/13] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Fri, 21 Aug 2026 15:40:29 +0000
Message-ID: <20260821154030.2514-13-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821154030.2514-1-sreeshankar0910@gmail.com>
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
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

