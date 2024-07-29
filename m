Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AC5188CC5
	for <linux-clk@vger.kernel.org>; Mon, 29 Jul 2024 19:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722282746; cv=none; b=uVRPnWZNghr1VxAb5C29He4Tm5PtEijbsKEhJzUX9P2Fodx3iZ4lbKFaJ+4OeHTfotqFsOwvuWxohWWJENGAYO7HmSK3aH5EHipOBU9zvSLzsWQLp2ozJe0e4OVKZhWwtVzIziinW8gl+oIc+0T9l1sNnFGBVsk7x5JQKkcNuco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722282746; c=relaxed/simple;
	bh=bY0czJMFyn3CpXX2UwA7eN59/I5EDGqxASMkIV0AOoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f3i1FslVIiV8pBmGoeojkDxPysyM0hC+T6QvlgnA0pP3Cz7cIfW+zgAB/jme5qPGJFnEB/GkUo0weQcEoxbHbzfuH4SkaiflXqt2ZEOSPcgRYSYbkPAZCyhlSj/HqHB6N43URuBef78R1EyilU5TGZsdEXsoBOcTFbNeZkycSvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yfiYFFjH; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yfiYFFjH"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52f04150796so6444504e87.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Jul 2024 12:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722282742; x=1722887542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fz89nZQONGiIsC+9duCLKQ4jgL2zcInpAx0Q7W4BFp4=;
        b=yfiYFFjHs/NYtatKPPSA7p77WmkpfUYyBSikSbOfPnwRHK47g/lRqPlt/DqwajnKyL
         lXKSzEhritiXerbuvR06WYDi0kglagqmX2QXnLGLC30VgRVGVIqKfFRwbrT5+M5ZFgN+
         L+GQJWgHfZu813QFZ0lDg9EnWdeD0oY8PeC9fyFn3H3UmxacLYm/rptmgGbdd7fJ4W6x
         P3hJqQZNOQCSNSeq6k9MD6sUCi8Rvoa8g+HGPw4je7S5Om/bSoFluTqBbKWQycBRpiZO
         kwzJ7WV0H5cGwHybX8jgckrf8B8YdpWKuTSTuZLvvDeWmsL72FeUFVs3sR9dDrDYXNDj
         W6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722282742; x=1722887542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fz89nZQONGiIsC+9duCLKQ4jgL2zcInpAx0Q7W4BFp4=;
        b=OvFGYieFyLIT6jpMlUQC+tyHMvFU9/M6f+RIl8edABKXzPDTQlvzn+v+kxKcA03Fli
         I/pIr8hxEkClklG99EGssjqSxWvMiItxMNWMdOVMBzlK92li8Zt8IicEVnreTO/UfCFk
         UjCxFfUJYR4nNk8wy5m4FuSCrsUg61ErGLPpyiyswxMSJHlmVfC03LvZBSlg+mZ67LN5
         X/j96r4ayEawLHhG5OKBRiKafpKB0pn8KeeFPLLkAdBttgne4KX/tpar1Bvi/SAYOvz/
         LJgRftQMuR5pI6GT7paN27x+HTMnjAqnyB5LzIPMqoZNyiZy5OIkyzYpC5Qgf30DSHRB
         XPvw==
X-Forwarded-Encrypted: i=1; AJvYcCUzdNriVJJlpIPujtoyFkbk2reeeizSUjRbFMKthEhWpl+dtj6KN1YrhdPcT+HOLbDNUkLbgP0V0xTAwhHbJaXZcG+jOK1STDfs
X-Gm-Message-State: AOJu0Yy8eKCeM7HwuIqF40tvkDqL9UcyoHsoFlUao9UzM4kow+Ndt29O
	i3v2QtXpp4Z3e3mc96jkOA/gb3e+MGIqdLd5gYTyHrQiiw8DwGE7RceqDk2wmB4=
X-Google-Smtp-Source: AGHT+IHe5r9SoUJfnzagyd3Tll4OQ+Eh95KJLN+spSJpHGdCwzgJF8nH3Q8dKjLRkP06UVRt+aLKZw==
X-Received: by 2002:a05:6512:b84:b0:52c:825e:3b1c with SMTP id 2adb3069b0e04-5309b27a50dmr6666574e87.26.1722282741642;
        Mon, 29 Jul 2024 12:52:21 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bd1088sm1615590e87.106.2024.07.29.12.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 12:52:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jul 2024 22:52:17 +0300
Subject: [PATCH v2 4/5] ARM: dts: qcom: add generic compat string to RPM
 glink channels
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-fix-smd-rpm-v2-4-0776408a94c5@linaro.org>
References: <20240729-fix-smd-rpm-v2-0-0776408a94c5@linaro.org>
In-Reply-To: <20240729-fix-smd-rpm-v2-0-0776408a94c5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1846;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bY0czJMFyn3CpXX2UwA7eN59/I5EDGqxASMkIV0AOoQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmp/LxJN+4+Jx70dpKfyZGUsiykhMNdyyTQW2Wf
 l5hyqGOuWyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZqfy8QAKCRCLPIo+Aiko
 1ZF8B/0bw3AqK0fWBdthND6pOw7cEuj3WUzu/7GkDJQ+kU55KS+kv6R8+ztQnprlWZPf3cdTakr
 J9d/bBZtMCL4tQKCv5l5ll2at/VU4Yj4NR1CVfoBjJOT16j3VD4/uplXjS4Fb4PzZrdRrq5vBln
 CHJJ8ufmyWx6fGVhXAnKhVbKP2g9xJERU2neg2C51YcSo2aNpi1+OlPycCfonYiXWz5Ted4eD90
 AKsFTkE8g4oQ99B7o//91QQBZWmvRBpP8KXpf09mksMrmSxy2/4GtXMaXD5n+do+GUCxs7LdkJ2
 qfOA5BNo+UmFjPQVUDcQhtJU78BnM2FZhymJS93F7ZZ5OVub
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add the generic qcom,smd-rpm compatible to RPM nodes to follow the
schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi | 2 +-
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 2 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
index 2b52e5d5eb51..014e6c5ee889 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
@@ -792,7 +792,7 @@ smd-edge {
 			qcom,smd-edge = <15>;
 
 			rpm-requests {
-				compatible = "qcom,rpm-apq8084";
+				compatible = "qcom,rpm-apq8084", "qcom,smd-rpm";
 				qcom,smd-channels = "rpm_requests";
 
 				regulators-0 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index b2f92ad6499a..2ea3b4a94d50 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -125,7 +125,7 @@ smd-edge {
 			qcom,smd-edge = <15>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-msm8226";
+				compatible = "qcom,rpm-msm8226", "qcom,smd-rpm";
 				qcom,smd-channels = "rpm_requests";
 
 				rpmcc: clock-controller {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 15568579459a..4a694bfa4732 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -136,7 +136,7 @@ smd-edge {
 			qcom,smd-edge = <15>;
 
 			rpm_requests: rpm-requests {
-				compatible = "qcom,rpm-msm8974";
+				compatible = "qcom,rpm-msm8974", "qcom,smd-rpm";
 				qcom,smd-channels = "rpm_requests";
 
 				rpmcc: clock-controller {

-- 
2.39.2

