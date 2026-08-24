Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B693E370D7C
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583854; cv=none; b=OP4aCCqw56mn7kShKPzgEpC6GnrWVrb8HFFrY1n46lW/2B4jZQfl90ab8qkMgHk8HvbyA0BpjDqGQuzZBOGB8Y9kZuV+7RqxvFoA3Fc6bKwpWXnPRCm2wKMFknqACJR9PWnrGp9b0F34Za54KCmgM3oUW56ZsUxOOgsTy9v0Pc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583854; c=relaxed/simple;
	bh=gKbqr+JbhugVzrK4haKucfxH1GbAmaJ/63Ra+8PimmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hkhHttkXaA0sagGwL2Y6AF1OSA+gZsf2BR7NaEhKlkMAKFRWX6ETpS5vzTFIWQUjKUjJ9R8OiyAvDPguIRGyaXu0oyLPNpMMaPBw/gVa+JJdourSFX35JNJhVgE9i/SqpAUe7gw+d38Hqr8sN/u/pXkjUr7mnUWuJAaM5xEpuF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHNVHx0h; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHNVHx0h"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-451d8064238so3372893fac.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583850; x=1788188650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=NHNVHx0hK/kIBtHgpwUf9+8F/yfx6x1tRtIBQ0mI9P4C0dOVCGfCGIbrlybc3n1Pm1
         gfKkiec3Aaenpwn7cgabZP9EnjdxPhIBamaUgcwH7s/Mtcdqa7SaeexSr+fTfMYjeLJX
         Hr5kS2W/cc9ajAWc71XfISHNx6qQVcg0vCJEKg15O/OC0cN/MKVZo2kPWYJKfN0aH6gF
         Xdqq8XNW6J83tT4y89l3ba50JjD1uhRqDG9zf9C3g4emoZyRw256eNxwgKyIlXY0/VFU
         lr2q2CNMkA6CZozWJxU5g/JYf9c8UTxY+iklq+oK7gtHtk0sE3o1g7vraK12MxiFw1Uk
         +bfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583850; x=1788188650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=rhZf5o7xM1R2iIj/N4l1bugoKa2e4tOGMgfB+jIo9EptlH0U3pAFE/8YU2QIEJs8ZF
         qcUdFQYvYFSwj2JpAmmP6OLPXYmW+RJqECrsrAmNVhCtOPPWO/9IO0AZzorAZRiv3Eid
         p1dvt151FPNTCIjDzOVpI++quqhbugVh8pefzdl24YXBmKJZBr6fm2gLi/HM9E1dIXLn
         y4MT2AagRfAlyLN3lnr3TbiOpDq8E2Rlgx27H4luXyT7JfPTXKLs5SzZvCfoCZQApIhu
         LyRTgWQ7FMRj09Hnux7ednO3hUfwkJbYPnjMOr4LA5H9NL5nXHmwpcxIqju1Jk/290II
         DMUw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+4RrMp8VZjPqPms75VxHQbDyLK4QsB1N5Dfit8jfSQxRZhL6YJpDOhFLXCoB+zqIpvmIiEJt7OO4=@vger.kernel.org
X-Gm-Message-State: AFuF++n+z4mEOiqOvvzx+tBHfrDqAu2UpEh54hK8NaLK2lZxK145ROWx
	RH/d8Q/ljezFYHkZ8PfLlQgqGXT03/Z7Q5z6E+6nIV9k8Yfip79Jdp/V
X-Gm-Gg: AR+sD11x8YsfduiOr3ii078jQlL8O2fEbLj0vZPsttd5f3mHs61fLQI8ax8cO03irhd
	4Ne6cWu+M6Izifhh/+4CVran4sbJ9uOVEusq4M18M3PMF91qqQsBQnDTEuVq9X73W/cZ9+xl2cd
	BOrZubAsZV3a8tDu0pUvSpBegYHRQK0fGPqLgL4WDwkOeNvoB3N6lTIMVgc0TPGSYHshjrLvU55
	jT4eIF1OlpsWgmalc8mlJInkGCWQ9VDIGSHCFQB6Y5j7H0H1VO7r0FNrnm6P1HIYhi3e6iQ+ZN2
	yjS7NX59EXBq3H3f+4bnrkuU4FMrAlRNPMObiJm3IqQJlo2rgUvID0mvKqa7+4PIY0TIQBLs5pz
	9+Z7vKjZ+Rp1mssHGE/MAXDKII1Exlf6p7eUrg4o2vwoSaSLyBFeuSem6HHs9CGJ+qjMkvcTBgp
	7jV5WeGxxGmL2jivI2mi79mOWyYNH3kSZixv+VyaelhN7P/6NorakWRCfSNkTqxc0PEaaRYLYg3
	m1ugAr+FiQ7
X-Received: by 2002:a05:6820:612:b0:6b1:61b8:7ed5 with SMTP id 006d021491bc7-6b161b8854dmr20246640eaf.1.1787583849896;
        Mon, 24 Aug 2026 08:04:09 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:04:09 -0700 (PDT)
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
	taniya.das@oss.qualcomm.com,
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
Subject: [PATCH v6 10/13] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Mon, 24 Aug 2026 15:01:53 +0000
Message-ID: <20260824150156.1310-11-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824150156.1310-1-sreeshankar0910@gmail.com>
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f..0cbdb3b2f 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

