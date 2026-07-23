Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DF72DEA61
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 01:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769879; cv=none; b=Y82M/reKHHl3CyGMDk3JHxniQcwkUGRwgArJRwhl4dC87ELwg8CKQKGsbJ4u66+Flw45lav5p/dtensH8ycdmXwgkkElPODvyJEBhMdAklGxU+e9QHGzGUd+5HnWLHn2HHKeGeGo5L4rloEU1su0WLZq6GApomyZm1ybsrAnZCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769879; c=relaxed/simple;
	bh=JiTUnp6GkB6B+bmJP65I25onDMOLDPZ/wDqK0J06aA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ha/tsk3rDDLeMuiYCbWEdjx2UgHBPqvFhmKgw/JnYkTaw8lcaDzttV0VWTt9f2voWjlnL2w5ihYU5s9c4IKXVq1roY0kWazUSond9tjz6rCWXgQ7/uWtJJYf9KnUP/Se3Id22itPoM0dfzAeMvqpVpMlcebYWlbIm/tu5A6hnLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3XBK/gu; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3XBK/gu"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-667923d86a7so66186d50.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 18:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784769877; x=1785374677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kyx8fnMYpU13qyrRjwi9Ec2VpF+qFTk63QV3HyVJPgE=;
        b=G3XBK/guPJgEnSaijfT/qXmS4/edUHcgA4JLAYBeO6tC3NEoSbY+fJiR0JENkLOBAT
         zerDgH1pToG+SKstXoQmWZtk2iYjkX8hDKeo5df/M9gYSiBQ5Et1x8PkUNtK+hTPbLnk
         WCM543GK1gqWCJNuW1BHQUtwOUruAvrfl/wNeMlI4mTfZpvtZ/R7GER/Q1asmBLFMO8s
         ifnqB7s016EyjbZA/k8fxL+TTQO0rLKNzetm7ilXqdG5KVVMDvWwSD89I5hJIK1VRU1R
         kqBzvXNWpNJP+5Om3HmCtJ4X201Ass/9KqDuUlcHUAnX8bAC4o1E5vL2C2urdaDBOjb8
         KqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784769877; x=1785374677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kyx8fnMYpU13qyrRjwi9Ec2VpF+qFTk63QV3HyVJPgE=;
        b=hnMJftvVIVGOQPViNbFHSNp9OYMLOO4asEunqxnOAafttgIXZBmaIykCpIY8n1rSwF
         qnr4SKfxWyTU+RuDSBfbeklKMRoweKLNMKvMlqEVZ8c8eTIx+PjhQ7SEjzR+LgCFjVGh
         8dlzLTIGaDxfE6020QljzhTgWr4s5saBfIkEn+czNoU5DURk495BFMlOxvvl1wNpCL/F
         cEerxCsWr6EGAtpJs4Bnf7B1rPuWrR/W4fN5Dadl16dVB6uM7+aAc4tpaik2MLnJJGIg
         F2GnvmA3HEXBnSYq3yP4+0C6V8PAID38uaBwQyCGf1mst8V36sHcJ7ljuwhdcnPlUakh
         jPTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rot0gwIw1GK3HYQk9gg9L2IQpeIlaoGrKKHHuEFQCkDQ7884BEtlY3XfJAL9aODurFaZSnmjNpukvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzSVsullCfsZOK8Tx9p5CCUIIIiQCV7euTZ7SLjyJXdekTTnMy
	Nf5k2GSu0ZkUZ0fWL9giDVxP9anQmwSNKvkx7ZVqt4AYEFu2Dwxa0cIR
X-Gm-Gg: AR+sD11a/zLCEYyi96zGwUV9fWYWjCGIwvF7UUbX8e6DclYIZJMnGCA9anobOMZkC+z
	N3nVmsO4KYN/M8TdnjM7jn83HSGb85iQY2nHPaBAZAlJN68KC1Rw8HKglBHWb/GVNHxGGLf9Muz
	YrXMleHeHidCx9CBYmu4tJQm43r/AOYk//JkxfB1+82KGU0N+j0nrfxdWPgkSASaWUER+sZb2ht
	crpHUwv/ip03TlooGlQP5f4HXl+Jnx5i0GKFTNf/ihEx+ku/Y2DxFwvC1BCrtwYqLq0sTYp94aZ
	9C09TrRJIPIXToJv1321uzAJsF8pV97wXw4lDIoUOknunSAzE1TFc8DEwuVz5u/SFpw8o9+r2/9
	J+Qb8Q6YCoHceX0xvmFDCjKnt8mCcfnxkrej0iX36iNUTsgjGVgEIIFHAaXeql0qsTsrI2TEu2P
	d7WIMiX8fBp2dY9jtINyeFbVIBbk5p
X-Received: by 2002:a05:690e:438e:b0:668:99f0:9359 with SMTP id 956f58d0204a3-668a61a87camr118123d50.33.1784769877479;
        Wed, 22 Jul 2026 18:24:37 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66890521188sm2310775d50.1.2026.07.22.18.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:24:36 -0700 (PDT)
From: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
X-Google-Original-From: Aneesh Pradhan <aneeshpradhan@acm.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catherine Frederick <serenity@floorchan.org>,
	linux-clk@vger.kernel.org,
	Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: [PATCH 1/3] dt-bindings: arm: qcom: add MSM8920 and Motorola Moto E4 (perry)
Date: Wed, 22 Jul 2026 18:24:29 -0700
Message-ID: <20260723012431.48499-2-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723012431.48499-1-aneeshpradhan@acm.org>
References: <20260723012415.48288-1-aneeshpradhan@acm.org>
 <20260723012431.48499-1-aneeshpradhan@acm.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Catherine Frederick (coolguy)" <serenity@floorchan.org>

Document the Motorola Moto E4 (perry) board compatible for MSM8917 and
MSM8920, and add qcom,msm8920 to the SoC compatible list.

Signed-off-by: Catherine Frederick (coolguy) <serenity@floorchan.org>
[aneesh: split bindings into their own patch; add msm8920 SoC enum]
Signed-off-by: Aneesh Pradhan <aneeshpradhan@acm.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f8c37096df46..5556f81c0af5 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -261,11 +261,17 @@ properties:
 
       - items:
           - enum:
+              - motorola,perry
               - xiaomi,riva
               - xiaomi,rolex
               - xiaomi,tiare
           - const: qcom,msm8917
 
+      - items:
+          - enum:
+              - motorola,perry
+          - const: qcom,msm8920
+
       - items:
           - enum:
               - wingtech,wt82918hd
@@ -1323,6 +1329,7 @@ allOf:
               - qcom,apq8094
               - qcom,apq8096
               - qcom,msm8917
+              - qcom,msm8920
               - qcom,msm8937
               - qcom,msm8939
               - qcom,msm8953
-- 
2.53.0

