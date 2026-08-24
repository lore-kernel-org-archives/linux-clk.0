Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8507E42047A
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 13:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576808; cv=none; b=tAi1osr2Ms6kmb0uuPqwDlKZk8cPVMNCepNAfnulU+BUrTG44GgPWAXAGa100DkEzBvibLeSrEBbpZx7VxbX+6ehk5OrVgglFsatpozFJy+uur8tdbvWsN8kb5BbMxt9JnMmz2vzKZXSDDNdxMHrQG80u0J4rlXqmTqC+WfBdxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576808; c=relaxed/simple;
	bh=iyIt2VTzEWJFddhlukajc/L6+s0oCbiYJdxmCZQgWaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lh/7ek9OXr9u9Kc2idPtYdXyerDcQF43yg+p6+7mAh24hH+zgzYGg3qsdcgYfavWV3Hpj9qj/8ISBomy8hisXeRe0rnOM59bf9qe0QHAgNTZrd1S+NsdADrAF2I3IIqs+WebCuohmdTSe+kDD+/2lb3AEVe3oXaBkopBNyz+MVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQ+ZNjxr; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQ+ZNjxr"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so2535728a91.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 06:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576806; x=1788181606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CRwL2GsSIS/j4FawlFSo6ds2Awqey70m0LWn3uJFJ0Y=;
        b=qQ+ZNjxrt9TCZP7krXpKT3XtkPWwGXThNVY8pamUDRY7RpthSuS7emqbqg+Z0vz1hO
         T/Q0U2+N8XUXCkZ3wgIv5fWgEZGEbcA3AFbXDW7nMvOYu4qfO7GGJhMW/5DgtWbxvjdS
         iMft9LPMbLYnCRwts1cQizR7LXrfe4njfyq11lN67Fp/oCfeB7xj2lamC18bD1e9nphg
         QLiefDzftZahxK+tjIsf5gxT6aEeDJDNah1FuN+pJ0/1sOgRhviQ0GUh//RCSmpPlAkP
         JSYaOYnza35VWNhIiPS6eHgsdZOUJoxx3nU4VjGrdEEUV9NIc5Lo3zMhRNtohxCkXMsF
         7Svw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576806; x=1788181606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CRwL2GsSIS/j4FawlFSo6ds2Awqey70m0LWn3uJFJ0Y=;
        b=gjzsK+FCJT7P6sby8PgF+mD6doMTwUL5xzvTt7S8YKd+EQ6s5MoXH6SxSnFC/cjGv8
         mrnCew0oWMPdJ6kcEn1jyvmp25VlskdVsuZaYlkektQOynoc+6y6t44tT9ZvzsEcgATT
         lvLViVZNOrXCQSTkqNFFzF4w1O+R5L3M/ymO6bzJeggfhsXBiqJmmZ4edkdQHkyrj6Be
         r8axyk2g08dwfJTupnmet1bKRO7TsJlLI/kWger4UQ93Yz1Y/wViHvJpJ2RDsCiDjw2j
         mMpPqklvNvP+iKxGy//evbz4faAHvjkWE1jA9f2IjVg5T6bohd36n3WUwaHRGxlkVCFD
         dHeA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+oZiEG7UVVuY/4QGdXdCzAm/DIxJ/AKAC5NOzXVaiJUS/Vfmx3J9azWOsUMwyoyAlhL2aZDxCLJg=@vger.kernel.org
X-Gm-Message-State: AFuF++mBVntAP/PYspsIyLqTeylmO8ytTVULB+pKw7Ef7RuzPEdxGyLl
	yg4fdmPtdlqJCTNKzlq0P9UJc9kLSYaFUaHszZBDycsKOlTcHUmG3KlZ
X-Gm-Gg: AR+sD1160YmSjaG37aG2lLznsrzuF8g+tQ94xDfrLUgUTnbJl6naw+5UrHsCCVQcI78
	6Orrw/0YKTB7PUR6uYPIVBkaDki9vrz4rBdtyRqfVLQmKWd0d8cpXAyvbD0BrHlpllrXBlasCIP
	nuZ79kIWxqFSyYcrwc4Ucsd5ZP7NOxKbdSuE4qImrx0jf7suVBYhWjLBbXIri64jot31CDWTfey
	kNL+HJ89tjc/tHUHBRIaNHJR4tmnr8HLlHJPlkLB9oo/ofNWf+5tX183uzQeN9Gm/2HH+z+Blv/
	4yM0hpWqBO/RSoZ7hVIBkCtEhtTLN+d77dv11fgEmEx5zc5JPK/Kb+oLQhfeqNuBHfwO5nF//21
	yUf8yggXXVSEQbIZK9hLNQakZdquFnvkSJOMpKu8Y+2dF54HV/ICuOs9Zj6uIoxHJReGWu5LPr+
	fv84zYmG7cvGpEMrD/3V1FTRyxgK2SfOKf4tuMWl2iIAuunLILFFBEGSVZPS+jJ14o+sJ3r6d3j
	bbxvf2yykpi
X-Received: by 2002:a17:90b:3bcc:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-395a06bc47amr39222445a91.16.1787576805712;
        Mon, 24 Aug 2026 06:06:45 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:06:45 -0700 (PDT)
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
Subject: [PATCH v5 10/13] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Mon, 24 Aug 2026 13:04:34 +0000
Message-ID: <20260824130437.2771-11-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824130437.2771-1-sreeshankar0910@gmail.com>
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
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

