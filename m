Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807298;
	b=q0DHROXsL2visojIBxDFvcWEVG2As39LUwUkkYHecRC2nxOHaAU6REGqcNpzIqNbsBCE
	 qp31kFuMJznmNz40yJLQee80mRpPGdXhwwagNY40fUVnN3AzbU0P/rCx+z4so1mn0GXft
	 waYvnoRuoShm/ljEYmhNcJYvev3fG/ir0atwkG8KhmfLLh4CXODCVzy9la6TuWkrHe26r
	 wSp1fo+OohFqzmJVNtH1Kw44wGJmx41/zCXUUa5dp0o5t8Li/Xfw0OGL+JQrlEqFVZkj4
	 XsmprKi6mfyykr3VCv1qVaWdqmfw3jqGn3MxCFiAPMhR2qc16JYRr9o5IKRgbWtg9Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
	b=ayNXqeqRwW0X3bQcFQKfTPGnViSQXZlKDpKnjlnzC8XiZGK9yFQOLa7tFcdjAiHoKyYX
	 oAlNuqPpxYrjRKTgQELNSf1Y0+hfnWlX50ZXdtcCXaMX859FUwGCYdwXARi1puo9CDLYi
	 BgpCwJ3+nezj08t9ocL18iF4HtFnHQlKW4Y7D2+dKW95sXyGtpIdDLYYu4y9ib1mx2w5t
	 aC14paL0v0xzge4SGy9CR7SECiin749eC34qHuEHs9w3rrCp/G6ITph1l+EexSG2CCrcS
	 5CIWapKvRVnIsdr+sC/s3wl0yZoBXPCnBdCd//wzgvGlSTXkmtogR0KPFh7ndvvCroQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgEkfLmM;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A825606A32C
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 05:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A825606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgEkfLmM
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so3331104c88.1
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 21:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794807297; x=1795412097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=QgEkfLmMhlXHSaXrEB0rI647/8WJYtvt3ZL7nLXeWKGpzH0ChM+Z2sLkznM6o6l77U
         cIn902Q1pBIMkZPFitNjrvZuw2QwqYqnlmtddITPWhfX9HKYLiTY/EqF8a1ToeGRPZcB
         s33PjUoWn8gqONynWBg4d05aZfkRhr6A6OfcR4yq4Q9L5UioKsKqwiZ60DU0/NgroA9q
         Sdu6OPgMFF70Hmv4Z1JO/Oi5zKNhANjV3I13rE0DxZuZ1yZTPpJxVN6wi7PXPUgW4R20
         YfSMgCxfexW66Qe3CuXnLFZFGR4rdRAcHiTw0YZXvFj4s2s2djNDKAJil/XHvo1RLoAf
         4cEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807297; x=1795412097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=F2rrVADUdLEXo2K+NAVUyvbsybgSsCthxMG9aThFHXJU3mCfkLFdfTW6GeBY7lAadp
         NNTCSr3xaJ+q3mSSpDawd8Lik61Dxk/71yNTP7uikH7LIJVa99UTQvFsfAnthd5ohFGt
         jqLDCa0OrO4GCnup+HrFM8EvsCtYEo8KVjLw7L6hrGK5y3NyURD52eJQ6W1pxABNzPJ6
         pldpqvycsF+df6dIqpx7EYwV0Dkw1eTrf1ZjEax6OJrcMugEEO9PCMtgWMw3K7trHNgK
         4vAWANfNchK/1M/sj8E9NY64GzrdRpD7yoDJw9hDkCYltcuUv0hOYKOCqGi7hUaanOnU
         VWtw==
X-Forwarded-Encrypted: i=1; AL+hErFQlY2rpsVH3dKAMlHvg5HF6u1u3Y/+Paog3jggVqsy9Q7PGjJ5pT8aEPkN2XNMP8Bw+PFMoKHHeLQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hFZt4O9528vuvwMDOUpc8cHeqZDZJ/RkPCW/OjzYNt/ofi7Kj
	WT2Xwmp0bjepSFGbOkwDlrPrXjLYW/1WGX8UmhdfI51Rwl44BEbGabJX
X-Gm-Gg: AYBFou0dT7dWkWCYG+zYqxwX7rwofTT81vubSdT3f3pjgQFdE3szYq1X/4NmziNVYml
	y0HBVDZDul666LO8vBIKBPKbgrvkBNZm8iRB0MuW5AqJsP9DBkdVNmh8nwpsOHdiK7RsoVT0wWy
	m0KTOpQMRT4JY5lnwAp0Sjon0cVIObQjMg6QsMugSJ9aJ9APankMldfRbZP1cpbsY/2+IWs6pV1
	PeNhdtWgjOnDOU8LD42zR3knZ2H/xJjVfVLbeU+6mok8alvb2LFW8zqBYwtCDOwtuWXeBaIEkvm
	C8936foU9SmD9VAFuWriHML5+zsXrXWNWlyky98ezENnTYtMDI+8yn9e0r0VMVKS99avqyURnw1
	6e+iG627w2h5Rqv8uoaTYq6V61m8iEhRNtTA6ywJiRWxcICdIQi6XkG08xoa7AhUkFOOsBC7gmc
	P/SlEeZOsQaAC8+YWNgvjJsoH0/cn3rJXGjbbmDiXfwbkTiw4g6tZ/lCxhMiESLVHnxVI6ombWp
	W6nvhrYxFM2cWw/KR3u0HsdXwfnipN5TYDRFhucpUcGHej43UEznVdqbbRe8SIPe+LtVCTHq7Qj
	np3ZuOfyLuIE6vz7fwUBzqWMDe++xa7qOUcylLpwfzV+cFfYqww5/iMPOHmyTEmiur9gpo+sGdp
	u5BlC
X-Received: by 2002:a05:701b:2202:b0:1b5:e9d:c641 with SMTP id a92af1059eb24-1b50e9dcabfmr6979275c88.18.1794807297153;
        Sun, 15 Nov 2026 21:34:57 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.206.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm33463380c88.5.2026.11.15.21.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:34:56 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 16 Nov 2026 05:33:50 +0000
Subject: [PATCH v15 6/8] dt-bindings: firmware: qcom,scm: Document SM7250
 SCM
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-sm7250-v15-6-6acbb232fef8@gmail.com>
References: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
In-Reply-To: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794807229; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=rejlxjgmjiSGoOQieemcJFRPRnZEl4/NvRv6It0RMUo=;
 b=+oPS+u7aNVKFGbhmW2mW9YMFYA8wj0VjuFaEEsNN19MH2mpLFA9LeS7/pYH3W5tSsVCAi+/dP
 DVlXk6/wjvhD/uXpn/EzjI8ASaJBL7/qCvU3NQ3e7f8GcDRtdKMByIM
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the SCM compatible for Qualcomm SM7250 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54..ee02a9c20 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -76,6 +76,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350

-- 
2.43.0

