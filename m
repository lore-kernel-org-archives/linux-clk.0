Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8024B41D221
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 08:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040594; cv=none; b=fzu3WDhD6HqX0dzYW2XcjloX3mH8CQO4nOcrP9PO9N1u0p09UUkKDm6g2dcUCRlMgg74CGQoX5ZanDC3L8gwb6UM0gEzlyKJUqGDYNT4PHaq6LMVRt6LOtFBcR+xSXfADtJPlGggke6LzlYta3aOL+nYzEu+4xUVv5VzmjOW1KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040594; c=relaxed/simple;
	bh=R6Ql6qBhxv8nRfMWDl4ii2I8yaMmIwHS8a/lEb+KgZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Acis3r+sPkxRSK6xn8/TxsyXkBfQaX06fkUa4kr9ab2rkMlxi+WiK5p84oyj3lAM/5ztiyhU/jPodUVnwx5VbVMaNYRHm68B3LtvZhPye2BSiFv4G3JTX/CzdRSR+G1Ah2RV4+KJ2nSSudK7Zqb/Pkgh1RrI5YtzNCd+9KZR4Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqF0OkXv; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqF0OkXv"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84830c774a0so3782926b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 01:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040592; x=1787645392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xro5hLO6XYdeO9sCaq310qk5ul0LDKCYcbgwbKMsfxo=;
        b=RqF0OkXvtql/Sg6zAj8GbAFhLm80lL97I3T5Zd9Gkaf0mfeenzHtQ3F2IThpdlGxPl
         0AKNqagT6PBkqI33PmpWn9dZ88CJJ80rFrvNfUI9ea6DkbAXc/RgegrD7F6RnLathQm2
         QWe9fLQqD2mu3tepMuAMST+NP6rxhjLJTJnfkHLScU54zEKsWk78JkGpnTrWiA8327e2
         dICxHo6ivixJSLyu4BhM3Lio9DiX9VxqJeChKgq/nnF4J/5DO/+IIGJyXdKU3Fyn5Oa9
         TZeMwJMMxjicsK1ETNEoG3KGU47lNzGLAcpl79o4jf6U+51jlVUbPmWAyr6RbPTy0p/Y
         ptIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040592; x=1787645392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xro5hLO6XYdeO9sCaq310qk5ul0LDKCYcbgwbKMsfxo=;
        b=F5vlFoPkTuyrHZT7EKviudYNMAtiVhrnAa1d9ZFqpb3fQlHSyQqKa5DEnXhw0o1Zz0
         AgOIOHiGQt19nAbRl/GOM8NOahUSQvhRloVqPqNjoxETsouN1mdr7WmV7FNRf60ejwYd
         ykIs20uauTT9O6jzTNx19JxT1BDfijMLB9yEhkMKhdQaasqnu79lTj1Tad52jlHfkPnJ
         SgUPLJJ7kUM7y0pYAee8lLyjhQJMuQ9f0L18abf2FigJslVsfj819GY26lI/i2ampL1f
         e71alIgkg1451+24SJEPPxCF3c5SCWluqkhs3yvpnsRKTcjuBuqncMw3rWi9nGSHGZq4
         zH/A==
X-Forwarded-Encrypted: i=1; AHgh+RrcGgI0pXfOeg0KmIyPuQ0jtswTrOdrPBWPoDOGvBiqv+06NQfDjpttniMSAiwX1A1rcdRQ9lgyMJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3mnAtjfviCSDzQzzjU4woC5b7UWJqfHjACP5x7T70pmHXOFZM
	CxRMZ/z7YFvMMGUr7ECNlo+UwcLBaMqFTVt811w++PQojgyV8QBOGVlj1KhFC/b/pg0=
X-Gm-Gg: AR+sD10zATdbNz0wsY9JomOTiIYtREOGIkm7b+aakiAX5XrY/vkyGx42AA2P1Scn5Ep
	9G24JpN5ZdO/T4gqt2YMWTmrviRRV2ogEAKnOltTvhyamnIXkUQIPyTB2q3ZgFuMpNKuewz6aHQ
	Dtl+LCLK3tGmeqMoREjHv/wZfx9NVpy1Hr57ZU9pRqOOXVPrhmJz4ZnA88nj9WaejDBxrHaV9H2
	IO/JKz6XYFh30bnrtkRqvqvLPUkmXRPwDmjsiwnMr8siexRS+ClXWAcIWgnMlx2VNlU/svYPzs5
	mf+62m2cGnms0aEzbEPzvKyZBiqwVRs2XIFhDulbzKQCpatuQaI+Vad79r+RlUH+x/6hfOJ8Pre
	oLspPOdxRMZF09U+BmUr21T3R5FG1EwFyIM2TW4fMDTHA8mQTovHyaiy5rUZZOlCUdNIdj0sbfO
	EDWj61IMTdhL1NocThrW1DJ7d7z1gs227vPADgcdnHcxtJPKkLaAQhFDjw7zc13WukQwOpMErxV
	2IKiUWHXcJwU5l3Eh4O7Q==
X-Received: by 2002:a05:6a20:9143:b0:3c3:76a8:c0f with SMTP id adf61e73a8af0-3cc7196e809mr31096183637.4.1787040591855;
        Tue, 18 Aug 2026 01:09:51 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:09:51 -0700 (PDT)
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
Subject: [PATCH 10/12] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Tue, 18 Aug 2026 08:07:52 +0000
Message-ID: <20260818080754.4362-11-sreeshankar0910@gmail.com>
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

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 25f62bacb..7446a54eb 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -72,6 +72,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

