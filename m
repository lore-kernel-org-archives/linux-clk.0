Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B1147FB16
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153228; cv=none; b=VSjtFiUnqkuMuPcnMlY/KpMmrhdd2XbhCp4tGji4tUfSmgblcqRGRNswvuwBB6DdGE9bAL6LqhsbOV2TMkB/7+QDawPsJByhhSVcC4JT+zVCWk5cMdp3s9zFtmtU2kqDH+jgGRBSBhZKZfZ2n16aG9Qm49FxvGEBwAaeyUhKvUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153228; c=relaxed/simple;
	bh=KyU8fbc7e+jGln1gvgBbCQwRZ+9nqq3IhPL/wCHuXiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HushqknKSeaiyXe0wcmlctBeV57zHQ224ZKfvLzmy0U7sIZA1u5bm4J5QVTO3qDaR3JWMAkjFLIeyR3LwKdUB4nsXurXQHeyLZFn9NG0K9Lu7Yz/kZ9ad17VELu/qOm7uoyK8PM5marbH0X28VeE35gaFNAu07+Fm52wOp2Ue5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCzIwJPq; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCzIwJPq"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc891373e0so14414945ad.2
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 08:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153225; x=1787758025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWJvev8rwDkHrWVtePCBv0HB68OwkWKr1ifArwWeRlE=;
        b=UCzIwJPqOThfKU1D1Oihxra7nh/lKDXnpT4/taBKvO+9jV7Te4irsxzLCxzWO/lxA7
         H1CveIsBHwzRBtumsAourB6z7ELFUTh3yDYLjfey/uFgpAVUvTaZkw021EN8q33rwA1N
         +FnobMNMHbHWhNqJZhXC6Afyqwv21YaHrY36LO1SxJO1Mgruz8zvHEHyQrxVhYaSVbio
         Bal0nYCSMx3X66aWudggK3p2MP+npFxbLdOrVTda6BTR2SKaTeeojrlO+r2lQYWcFiye
         ROKMZswqE+4YgUOAqwgRENr3RafwmHB7TkhuW+Co4XRQD65hRucrEBYuYwkPKu13jKqv
         VKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153225; x=1787758025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VWJvev8rwDkHrWVtePCBv0HB68OwkWKr1ifArwWeRlE=;
        b=e3RgU1KE1SOcv76MYAtWugCSSNSWiBMlrFSVnuAkUOrnWRbdNmR61SU8i0zhNJLGTT
         6MnUEIrs3R2I92fsagtwP4hIRzH4JWntSxPBN3BAugPw0d5Wqet0bkOuMj7j00DShKr4
         i8cWAf3WjrYdx09uBNScP4Ag93JnG26oXHn9J3A58QJW9XtpcUBPDiSGh7Phz/DCo6yW
         CtXeaGKYQOJvX7IY2g/Q2Y5iD+6QHiFjChFVyvoVujXRFwKyUgU/APYXMO614dJfNcBA
         mC4dLJONODlTn5Rxe5d6nD8D+lXoRCtPurMlvI5TZ5g8iNqhwfOnLXI5E/5GK26qSbit
         7VLw==
X-Forwarded-Encrypted: i=1; AHgh+RqrbjOrINefYsTNFUJL0bchEiYSCPDcbcd6yfqyyEVmAI+tZWi5ONbiav8cDS7av2j1KX8ttAAV9hw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQIy1bcuDMZN8WAYl8ChALIybiVWkgp2McKJEAfzBFwjNgtk9T
	Ar5REwF8NVRLBZXQ2xoKhFnpqa7eR8uBI0sviWClbP9MyhHvJdgIBELa
X-Gm-Gg: AR+sD11ifGTexsDq6jRZBBxSHJHdQqr7iLQoBDBK2+ELJnfyV7CbXQrpjm9eM6S8+gb
	Sic2tsYagS7SFuZwDoMJSq/oBiZiUt/SgzN7SKQMM9gLlzF1j2QJ9SOBGx7fCHmEbraU8a3IBOH
	3al5sAZ/kZ+gpNuy9thIM7JIOgP+OPOR2E6L3b36mUcus12vmrQe52vd+aG7RRXqw5yhwcp6kdE
	EyMFoSxEuDJbJF6Fp/1UmIo2VpDBgjd1WSzgljljtu4JU5lVyrMM313xtt6zftHy6b5NNTdRWFM
	2G4LNYz6axczaPmfyd5fwxzbVXSMt37uy1RV1iCI+K0G24enDzamriIY41mM59gIMPeMP4zJ2XK
	Q82U3B0X9BdF7sIoCqGc8aXGztYfjM/1m1jabNXrnlKcY3OJs/wudUSUWOh5tWb0SZFg7idf9cc
	MtlKINRr0sq3LKuJwc90kWZwAIVbW+cTur8mWyKZ/DfG+81r+iAsG3xnyPvxHOLhMn5mNtTGqsn
	WkLMkkYlcU=
X-Received: by 2002:a05:6a21:3a4a:b0:3c3:bbe6:95de with SMTP id adf61e73a8af0-3cd016fcda5mr12089549637.6.1787153224623;
        Wed, 19 Aug 2026 08:27:04 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:27:04 -0700 (PDT)
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
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 05/13] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
Date: Wed, 19 Aug 2026 15:25:34 +0000
Message-ID: <20260819152545.3934-6-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819152545.3934-1-sreeshankar0910@gmail.com>
References: <20260819152545.3934-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document RPMHCC compatible for clock rpmh driver on Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b3386..df9e37f90 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -38,6 +38,7 @@ properties:
       - qcom,sdx75-rpmh-clk
       - qcom,sm4450-rpmh-clk
       - qcom,sm6350-rpmh-clk
+      - qcom,sm7250-rpmh-clk
       - qcom,sm8150-rpmh-clk
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk
-- 
2.43.0

