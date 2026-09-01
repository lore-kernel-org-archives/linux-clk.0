Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E99424D74
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 07:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246527; cv=none; b=KgqdlGRcswkVwz7jN/ILsVa84m+z/VaH68eTyp9sOFboSDJGlWwJLrTkCi0VzmlDHy594awLT5FjD7f/bx5rpN9+N/MrSY5FE39R5VagFObSQcEP1tlUrT6Sdpd4lpG9ntzlhSiJD2aHUlPqplEqf6pFAcP+6bjNF829yGYALi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246527; c=relaxed/simple;
	bh=SL1wdM6vp1VIszL+xuNFr+53xhHZT8pJnJOiXD1KxBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G+eRMbZ6vVGs/d8nzWAmmtU5BcdpRSBX/MaIvTkFCty4dtGBmI58O2kKT1/0UvMnRmha6Eym4/8Kngqxpb3bDXnleQRsVhhOP8higcql1FfaIdrwj0lbhZMIPfzFxNCLvFCKssgB0O5DfeMkCl41y8mRlxv2Ix+pehY1HZ5x/gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vx/tFVbV; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vx/tFVbV"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso5132280a91.3
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 00:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246523; x=1788851323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKT3VAzrTBQCbJUoz7WVF1Zm7cw9xcizV7Y1JN603Bc=;
        b=Vx/tFVbVtyQTXX4xTjkq6HUapejWaPA7Ja/er7YiR6H7amuVUE/iEWmiOqKQKm07r/
         +srD2+jyYToMxjz+mhvtgve9ocOPf//4yJuxghpoBwNMff6Cn+6jsieNJy7hSwAUM+l8
         VkiOvi14mmQHSXyUi+ftQY/8qZybDNa5iWXbxHkFh/vZ5C1kyFKgmqC3RsNvh9m/tr7m
         mRodkE6KKXMd7UhiSZxxXa0TlEJ6tSdWkBLXWdl0x7a57eUfUkc6HUJ5/e6S31Ba8hf3
         11/YJzRn6V494AlHKYJclLDRYp2a+XXPbSFGFc5A6HNqjASdTff9JGq6eCDDfzfjjFJ3
         KO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246523; x=1788851323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RKT3VAzrTBQCbJUoz7WVF1Zm7cw9xcizV7Y1JN603Bc=;
        b=aosW1K3vuTJ5+Fb8TNRbZ0CzAmvK5D7Un852YZDHs1btTHvl62mLc9eQOgUd4Ymuiy
         +ZbBF5bklHQdVB4me1gKqvjByhfqBnKoyNl3DSZH/ksKg57OMx+9LA97LXuAJiuNota5
         pVEyEtq7KMowYDprNs27hOYSwNIukq4tTTMZ6ondQWWE9XER8a9SRuVtky0UEoCMaqXp
         z4qJSEwf5DmArmrVXfVI596H+G+WYMxE+1ahdw8reWNFcP9G0h1ft6uWR0r28LWYI8io
         WQMzUZ0tZ0GC03rAgtetF6wqy0aPSEMiStgWk231064G50shs1/kp5nlACGO/uv4dEpo
         uxDw==
X-Forwarded-Encrypted: i=1; AKwUvByObj/YnsvZwUiiDq+rWIWiGoXnCWTZFrCcZjcE/8c2ICErxefrvrPxMq3Yz4ZceC7Uc6/CGm9BXBo=@vger.kernel.org
X-Gm-Message-State: AFuF++lm5HlIn3dc3hqFvLBz0MJKTXKF93uFd338jBP4SODLLzk8ODEL
	j0o2GVgb8lmVh9wBStyTBKnUh7S6AfbudtagMnSxwfG87UOSXlGxWlCb
X-Gm-Gg: AYBFou2mI4ND285PUdWzNaGLYD+ROCxRztEHCU40+ODuNsZClNhi9BY2Jz/he9Fc+o/
	wVqwrcDSZe8fCDE3HIB7Q7TCWAzQXtrLvOqXRFP/Eutfik2XdW74G1Oin3Ds8mSUB7EcUcMJBOZ
	zv8PhH/bK4L64V0N0XkYo01Yx+fM83mvkNQAaRk8cYpzDqzU2IZm6YuS3+Z73An83qePIdV6Dsz
	Z2NrRuJOkOjbdrr74TKOO/ycuGWY2e9QNL9MVguhtP55bFcEJHGkoqDb2CW8XRBAVpC3zF0F1Vu
	wx0ZwA96WIwFk4fW2SfAFHcAlgC+H4/JTmru4MdgfOe5MeQejld6Ki/g+EvDUQ5WGpb1hYi/TnP
	sl2RPlcNp15/iOL7bFH613mUAZMjJ1OOiT/l+WewXqdIbDsqJVDIcp/KIEaVVnbRLerdlxBKW8G
	lyhBHxlLzlL488OJ5bUDkrApLDrwVvwsW0TOyTuRplmPOPStLh1DsOjlR8MxibijzSM4/KylM2r
	vHvt3CI+220
X-Received: by 2002:a17:90b:3b41:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39907cd4e1dmr7683960a91.6.1788246522641;
        Tue, 01 Sep 2026 00:08:42 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:08:41 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 07/12] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Tue,  1 Sep 2026 07:07:12 +0000
Message-ID: <20260901070717.20513-8-sreeshankar0910@gmail.com>
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

Document the RPMh power domain for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55..e08441915 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,sm6350-rpmhpd
           - qcom,sm6375-rpmpd
           - qcom,sm7150-rpmhpd
+          - qcom,sm7250-rpmhpd
           - qcom,sm8150-rpmhpd
           - qcom,sm8250-rpmhpd
           - qcom,sm8350-rpmhpd
-- 
2.43.0

