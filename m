Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2352F370ACA
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 04:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124876; cv=none; b=XeGSJahurQlh5CsofsSuGpEZqDNvk2+j+l9ad4J6ZeAQmTZ0pvJkSfqUj54lR2EN+BN2A5euE2enP3QfeEpf/SbKCHinqyPGNR/y3JAEkXhkgAsIj4X3ijq3IoujAyLYk89RGSkY7Jc6pAoQm5aq4Y6He0I0wplX+obWraX0PY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124876; c=relaxed/simple;
	bh=0S9ZiRaNeD0ONuhBWck3LZ15qfVQqVd9GHb68v++sEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLas+XFC24Odoa6Q6WUHpAKbhDWuwox0DoULrjHKdagYD4EF19VWt0l1T7QyINFwrW7vKHrHcuGqYHdcw2CrOthIntLJlPo7c/3ec5m0V36iuKmzwcBo/epB/K4VlOmsP7RlfDe192rhtpHNT4G3CxdUO3MXcEh7yGeZpYCHRhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRiRWugd; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRiRWugd"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-17bc533fda3so2964982c88.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 21:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792124874; x=1792729674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=TRiRWugd03HK68YGIOm6hyiVi/PjVf8wnrBkLIXB2TR+7DT0Z+wTQOsYquKPT7j0Ai
         xELXqywbzK5VnBe15X0qtvrcdt+PzFfyFgbkaqSsTjOWNCsf57XsByX4YJoFdOj3fKvp
         A31z1O9DXfPfgUTvyTZ4cfpHkL+N5wAW0Uu01DbnBSLNtKjFh9l2AR1UfwRBFljhrqZr
         DQIxdwhquy/cAbuMH7EDQbg5wXXdOQnYIaK9Gez0QluWOiNLKn8PfFbd+7dNUkht2fI9
         9oqoH6Za81Xmv8XP+hQdoM9NIst2DTGVyEfbmbFbldI4xpNeKpOTXbXVgfxr0mmb2kKM
         Gxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792124874; x=1792729674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=23E6A6Xf6eVNMWzLyffp4ihrjceq681cneH91KRcURCOJpxhISr/cZktiNtvkh0OEh
         hn4nyYZzfVAX8Pr0vnppmn70sgxEE2SApJs3rY7acfbomzmBFKGXl4CddVdvLP8MYET4
         rZGSW9Cwu+6Wxk0Yebmsj4ReH2g3pDOowUiixPo477heblw2+cObvj+6Ak1yei8OOUJq
         oFLTOrzlDDEuM3YSeI8N0AtU6+SOenITUek6bxMEomfhVW+n1JG7hDLyNrZ2qn/dCmXL
         Gmo4ZAafkakruh7LjBJAOki4aevcAfhY0fJpBE+ka1Wdz8kfmJKjXLa2SS6c0bVF6Fpb
         9rLA==
X-Forwarded-Encrypted: i=1; AKwUvBzPvf0vxgDQcrs3dNYOxshSGFjPahjkA8rk0Fha5mWpmI3K2dtBlpRAzLtmfxuvVOJRlJJQ8qOyDNE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN1xL5/KJJeV1eXTalOPWmLM0pyG24VqiH66TLuZEVuahuT6Os
	Wwy5F7a7C74wlRUd9phbacPOMMph2TWAGfu6lsak8HFpO9llUdRbmtdS
X-Gm-Gg: AYBFou1jwfn2DbdGIrQhdvp+W+LsS/qkh5UXwosnFy4h3em5pgbB7hc8c5b7LlE8RQB
	4LDZfHZ4/+p9ySi1zCL7i55RA64frf82UI/OT9ZRAM99tdq7n/IIHX+6+5g4z6ISnMwcga2DMv6
	Kp1AlbFT9s710+cOfmERJqWIu6w6yUF+XJVf5SpLnqn3VDFn3lb2XEjiJyKYUEOf33kzG7fy4UJ
	SUPyf9VsVqKEzr9YHjQFVB3miDial016GRpwfH7ZKzJHTf3PQSMm6eaqg+QsN+EUXaSOHOgG3fn
	9kQ/DcpIVK0cMVjF0OdgD4DLxJ/UWHGrqiZ391AiZi5cL6/pqLV/+QMBHYv5zx/DC6mVYzygm54
	R2gzlUnQZIsEYNo0dTYe0nyTpzIA6XWpF5Nb/4TADH8ZHF8jnF2pvStqIKDWsJcuwi0yMVCMKLr
	dXT8K35crJoBBGeW7tFDCMRkmtOkJVFq2Fifxb8Vh/7ldTOWMMHdVPKkj2VbmTY69z3ElRWeDP6
	tC9EROgfwpfsp597ISW/is5LKNt/k6IuYFJ4HWmJf33yNKKSN0EeemKTe82MIYaKg==
X-Received: by 2002:a05:701b:2605:b0:144:fa57:c617 with SMTP id a92af1059eb24-16a60a02625mr30091887c88.34.1792124874051;
        Thu, 15 Oct 2026 21:27:54 -0700 (PDT)
Received: from localhost.localdomain ([152.58.201.32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm2644712c88.16.2026.10.15.21.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:27:53 -0700 (PDT)
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
	konradybcio@kernel.org
Cc: danila@mainlining.org,
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
Subject: [PATCH v11 4/5] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Fri, 16 Oct 2026 04:24:31 +0000
Message-ID: <20261016042432.824-5-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016042432.824-1-sreeshankar0910@gmail.com>
References: <20261016042432.824-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

