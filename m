Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B2A421231
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 07:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246549; cv=none; b=LHgORJ1HkTzkkgFeVwLdmTFf/U591+hZJMbrjCPrCuiLfZ/J8cNvV9m4qfrrb7btAdkLrZz+Ejy+c5RVTbhKQf8sLPm0u9MWQqONzMM1H3ftO6eO9Coq83yZB+S7ywwx1INThOSj/Nncv/cgbH5OrD0NXtnGCXT1v/9aLJhBE2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246549; c=relaxed/simple;
	bh=gKbqr+JbhugVzrK4haKucfxH1GbAmaJ/63Ra+8PimmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l4SvwWR9GSdCchhKE3TRCh8bE2Hi97Zk3F1HQYdDB8yz9ztcDsb8GKBc4eHw4z+OmL/XuzMH2SWpIMOsmz5+oKWjitW42rSqTRZBbr1jI/y2JH3Z8GyEYIj92vgWZk2UXAoNvHE/0iJrA+WDsLW4MXI+paB4pligfoPVf8Rmrdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Phe2JqIW; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Phe2JqIW"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d01663d816so4028735ad.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 00:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246543; x=1788851343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=Phe2JqIWVhkcmHMVwV4x2jf2mFz8ddFaX6MdeHWdvR/6x5yIqugoX1/+4DNNjJSft2
         X/SeOAojkzak60UQ4rU5+7jkXN3iHR3Syt+yxmHap99/P6Xy/oS9OVIdxqPPldnh4K/v
         GloILvN2f/iUIKDlNJ1SZipjw1grWQcNMbXC4uZy3W4TfytoHk/NxbYbrq8t6a/nbURt
         3mGjVpq1tJVR1ptSQGyzJPD18OoUvExs5LKZMp2Y9ugzSXVcqzU5mTXJtIjT4qJrb8VM
         SKAUd/t7s2ZGvoHsAKfZWuCzgdIC8fwrxw8G2LeysDcKCEu+K16wWO64xZkqPbZhXGP0
         MCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246543; x=1788851343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=lz0z692Up54hfpKmwP/yYZ7NfKTQsRaEp+g/Vl9NzhkzFrIwJHl5xFTHysoR2pxNdE
         iFoloKgJqWxuZZ2qrWdSCoPWQ2kPuKU8X/lOqvsAB2zAn3AQJv5iPdcq162bA0YtFvEV
         Dd3vl/N/7WdIlmU2O8qCn6PBWYZhFuOkE1J6COge14qd0hr68k5WYqSh3IwRdg4hwipZ
         8E/42WANYMkmWP8rehyJCu6KHRCfq5C/uMUsB3P2eb6KIMUscSo63xOBg7Ok4BsR5Jbz
         scDk1a3Bcs2NKz2hR7rpYx+r8dYua+zvqXkCdmDT+NmRwW8agzXzE/5kXaGToUs5RA13
         5HNg==
X-Forwarded-Encrypted: i=1; AKwUvBxAiHysa0UGFGBeAmdUIRAk2YCnylJDpXlqiU/9CQrOWNjX4IQPKXl6fJVYVHLFJA74Shc0mk7uRJE=@vger.kernel.org
X-Gm-Message-State: AFuF++mQQuB4ErmmgGiS5rdEA/Gxmpd3w9xa9FAPqXwZjz6tUU6s1l+d
	R9zrfa5rYDoBZGuFqe2wUyt9tCWV0uYqvdTuSK6s/ntt2zxgK4QMk8Ln
X-Gm-Gg: AYBFou3jy6ycLHtryuzBErxFtJ3x1Z1DZ7r6h1cjjx9bot/YMhwUqi5RHK+R8Lc0fDB
	eyRTXc+kQY2rgdAV+LdFn+U8BXxZiK8+VV6yKh+ncqzd0a63tG86+k61Z3us+ZqRbLBK0q5zDgT
	Ne+khx6Qi1ft5A8DbAQGL/SqVl66zMbhAhPpt3fYHNIspsBwBEmp0Rcx+tlCkuqzOTvA8sh3zA3
	Q2sUgqF7HnXVCH0rcV4FHhQkmrg34G6cUUve27ekVReC8p8J3x8iF9UkxYKjv81MLCmwJ7ZeKIk
	62svIyHvAQ89iAqMo/jdu3paGM9uvpXL4kuX6xZN0rvrd4FHaCt/CdoWi/v5NVApEDO6PqwgpIu
	tTSiSs7Nx60vE2YVR10ix/zKc78/6qtksEkQl16kdqRgwiglFIOzJeolvkxEK0w8JxlTQGFIdy/
	XWIT6OhKVRvCA1fRjSxC7CFNyrZGdBhR8ndla8bRmwLIRQz+kXkBqrMdFRoyxdosDIOK2zJqKfn
	10+tMR4yzDxVw==
X-Received: by 2002:a17:903:3803:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2d74df0328amr524510515ad.12.1788246542738;
        Tue, 01 Sep 2026 00:09:02 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:09:01 -0700 (PDT)
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
Subject: [PATCH v8 09/12] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Tue,  1 Sep 2026 07:07:14 +0000
Message-ID: <20260901070717.20513-10-sreeshankar0910@gmail.com>
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

