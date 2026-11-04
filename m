Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778429;
	b=WQXCsrqj+3n++7QHWJj2EJkcsNDidxkWWyP77JXzKU+wxdDJ7L48VmbNZBrNpmLIgwrg
	 LeNc12uXDB5qGcQlpOMjRTArdParkSj9YDQFI9H5cdWvaWYqD9iWfAZEwD5wsE0xLhmTR
	 VitVJvmcMKHTbvvXLfpmakpaQhrFYFqIPIeBuvsFV2lqmSyUPB2xOIcaLUBiNB9F48JwQ
	 WXtXSQZ8B26cHAdBPxf3yNa6kQfUlsozXznEwdo1MXyB19dGnCPvEolBO3XFL67+ZoCJK
	 0eJKuaRKTwZwc/wuL6Y0m3mpF8kOmznY6TuBOwiPbwHte2ztzRMKRPu+Thw+9xJ9S1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=J6yu/WA+9/TduvIgw8i/6/eU7fXdqXxpE3Xb+fSN5P8=;
	b=Px002gEtIHFKifD4zQCgk/Ot22pz9eChHP5AA0K5HGvEERlz0xCqJpa4Bw7xKUhxI7N6
	 RGn2BalZeFmdPg34PFjtKL2j0zwvhlOF/BDr77NQQbhqFrv+3qRdKZhQDcmpm4Xa2FZM9
	 Xiip4BR9zCvLQh+qZ50Pf59qU8tIX6KPxE9BHJmH30qUe13VlqUNfqHa/wDKW2HMdVWlX
	 ycEDgbgU4goC0vv8PnhRETo7Wk0qgf4CtnaIHu7drajdjM8KEKdbtLUMVRu5a7BkGBbbP
	 cda2kOV7DWEtHI/1gDg1VrgmOk6fAT5G7WuAqPkMfck2ZGy7PiGSomVbzSypQ37j3YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sl8t+O+K;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995AC606A31B
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 07:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 995AC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sl8t+O+K
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a18fc7a38so866928eec.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 23:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778428; x=1794383228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J6yu/WA+9/TduvIgw8i/6/eU7fXdqXxpE3Xb+fSN5P8=;
        b=sl8t+O+KsQyQ5DSrejOdiSjykamgCVW3ly1JTuZRkT2dhUs4GoP9/ThyCQGBq/XCCp
         U98webc/Ysmoh7c9MJY3B5oI0yPCgntB/GcL9AXhTlIWSK5dygUBPvtaa++R2IgqaOwc
         zncsdYfkB9nhgfUkuqV4dxLndUwnHg2X9ZS7Nm3H8HIkAU5e6QZUSZrWfK/IGGrwpORd
         vlEbLyuIsO+aHaGtUKKT0QXkAnEyY83eAafBQ/gK7LcQOXlhYuE1e/IaBdGbUobFbizJ
         gKELP86j/916+BNlfrgufWSt7aL+7ggPX5PPBcSFgpyaQEhlHk4mx2oV67aPqyfjc7sm
         /gYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778428; x=1794383228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6yu/WA+9/TduvIgw8i/6/eU7fXdqXxpE3Xb+fSN5P8=;
        b=pIKL0rK1SHQ57XcdFzgM77tZ6s+O84iV2xCqBtgZ5ychBJSwUDlNu0p4j1k6g9Se7J
         3RFv9cLaLVO79Fy7MqNR4xPBDEDj9OyMKlZEve29FtssOSS4hElKmA7vcACgAKdmHdEi
         R+3ZvpYTVBFOrgqXFFDKg17bvNLF1It3Ix4IQG2o1USMM2wPAacZHUBPLv5r6gU4gNj6
         mGiebjUSLe6WZsQgpJcsg5SBmetfHZ91jkPm8j8RjVEE/pf5NM3sUYZ3fcnJmDv5P072
         wmL62uPfOGiCXMXL/W1QSm73DsyajgZJLvJiwWxY3dwJ7bcIzMw2X7MwvU5ott6EWVnU
         eTBw==
X-Forwarded-Encrypted: i=1; AKwUvByMJPv3flkH884hppMEfc61SkdDhS8ssYDu9bX0mrrVP8RG9NOU8KIb8RWg16925/XFjCGY0IUeo8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xJaR6W/GVjoJXM7m5OFLnYeGV9Oz8zvih6rw+bkD6uHPdYGOw
	jCfj18n3IE9OJPxiYEbhJjpowa8euUFqV0EcBsh0bppVwqZSygNYW9o2
X-Gm-Gg: AYBFou3Nh8LMt4mENX0hWJV+YR5K+h2IHaWMcIBJD6SiVEWasIirZgzqjMNBVn6t5Y0
	CJcbMkNNjPEq5HLGdvr48inczICD/9P26hY3EisDBAbq1tCv6+LmzR6s94OPhc48ox4Rh2QCodm
	+qIdlp1Q66NjMdd4XAyUJyMNrQOQpKH5n9OL4ED6jADk8WSgxDE2f+596dnWhDOH70Uak2whzQq
	GFaAx7jUTv76xm6L0Ii8FiFl/sbZgwGDg1PO5bi0pd29h0X20oiOIO8Lj2T5DibLoIaz4g/ZAMd
	k8ih/p8iTtQRsrWw44UouLcpTzsM/+A5zU+QPHMvnd9NxMIBTSBBghXbr233gP9QOhivM1zitqc
	kmvUqAjWJqzQmK46LLZLhy+DpzbrxIh8CkPCg8d9uWqDN5DYEOzKZSIUjZLxucgnAk8UmPobL5Z
	PG19K1Ut6k7Rr9TTBHADDm4gop3FGQGc2M33MJt22kIuFL6puoVsM3qtDiFLMzn39qXbrplWit0
	5P+IvQdwnBziWI4RhFu8VuUnbAg/rswyPmipuVq2lsHl33WwHJ4WXZ9kIf3ke9Kjkdo1N7y5hBa
	MyJb+NCypxMSFXbqZbaDbER0KovkCFJMabSHfPmxFhy5hzhnokNpWTbrRefCXC+rl8JhYsqg4iK
	zF4v02A==
X-Received: by 2002:a05:693c:6316:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-36a7bb74690mr7403733eec.34.1793778427751;
        Tue, 03 Nov 2026 23:47:07 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.204.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm4566016eec.8.2026.11.03.23.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:47:07 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 07:46:08 +0000
Subject: [PATCH v12 5/6] dt-bindings: thermal: lmh: Document SM7250 LMh
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
Message-Id: <20261104-master-v12-5-57fbe9eef978@gmail.com>
References: <20261104-master-v12-0-57fbe9eef978@gmail.com>
In-Reply-To: <20261104-master-v12-0-57fbe9eef978@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793778372; l=839;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=I+Xei2sZyAD45OKuTBmy2G1nFWggAI0hWE7RAd9U7rk=;
 b=GV9sBUWE0iEAWwIlPa/SGOrrN0lri3O7hQcwiFcVGn9liKszfRaOKsyvnpyVcbDKLNf1fDcL8
 39Nm0QD11IADHiNAZse6CTtX0O+2atStZ6s5c7Npz6bntVLNBEkGcjo
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the LMh compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index ce72347e2..b8da39f8a 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -26,7 +26,9 @@ properties:
           - const: qcom,sdm670-lmh
           - const: qcom,sdm845-lmh
       - items:
-          - const: qcom,qcm2290-lmh
+          - enum:
+              - qcom,qcm2290-lmh
+              - qcom,sm7250-lmh
           - const: qcom,sm8150-lmh
 
   reg:

-- 
2.43.0

