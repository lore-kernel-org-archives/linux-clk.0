Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F423D7D73
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 15:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032297; cv=none; b=hh9r42XweQPSSll8vh854mf+EyiSc796Ll31v/u3MSXroDtzCVpw0OWd5SS9TFjvPQU2Nb+lMV4LwxhXtiE3RoCEHP3Kq5IFIPLAdOQqk6O+DB/7tVU9sTg1joN+jUcPd+uBP4g8sVVh3WTVVjjJJfLzlKzOzd4dNJgN8K/6KUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032297; c=relaxed/simple;
	bh=T56zPiTpvN0GBLBYQMGo9vQwbDNYOKXq8zVh3tggF/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SLnlJ/Q0BPnQsnQTwAnMSJ4s29JiK7xcfTtPOn0sbsfVyEoPqxCCOBBzdlhlh4ABzAHPDOJ0w6pWWfCUvWvU3r0F4pW9chf5wkQC5iZ1JSj0V0Hc5BEpp7TO0NZlJRv2LcwSLP3+2XBWn1EDwyVMP+CfDYtsD3qX8L5d1NkrQ7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K5p8v+Ez; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K5p8v+Ez"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso52011425e9.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 07:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032294; x=1772637094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJflEsJoWFuWsTkTz3+7munVvf3KCvZoSO705SUTMdI=;
        b=K5p8v+EzOn4ymeotsHVCDBO8LqxSYbnF4IWZ0KrVadcRsQhrIG4s5Q/UQxFxJdJnTa
         HSXEsGtSvnFI66H6o9GfnjZXNhgENUkC3hH+daSSbg+L3USJm4dlFpbFoZyTnTo+zPsp
         FmFC6oWiPrgN29smep/35gGKcJAeNoUwJqP+tOa+WHdSU5uf3c6Gn/TUyCyRVYOyRstK
         WMnR9v3RC/dglOT3Bee8VUvJL6P+AEhEej6PCstWa1f9dH9wa75nxx3ym41WH3I+l/3k
         AFFuqzHXcg6pb6gENJipB9eRQ+wmmpOInses1JFUq4Wd8GcXRq5HWqlwUn++ZWArpqjy
         3Y6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032294; x=1772637094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lJflEsJoWFuWsTkTz3+7munVvf3KCvZoSO705SUTMdI=;
        b=agPXKN1Xn9OWr+ASrqnWW22Q3Ucl7ANnbrqrMSdd3qBvg9+iKfntbhZ+fqHkLNNVqm
         c3jC4406T1kdXKv3l2Olr6RrBYqbmzJLTUjx+Tyh6kXiLiJPcXfz44wEHVpZPIyY1Dur
         XCk+5et3o2agXkFFH0TwqSeqCb915FQqkxFDJqm7Sh4pmO59gyFG1xohEQuHhiOd0n3L
         WVFK+3HcLycjINHv+jHaI2ZdcAUPRowzxShxFkJd7jKEq/B+HlOSv483+hyzy+Puy7Nd
         GMcR81/taFWIF2cXSLkFrmOUvOsTUl49gwnhBhYYpIUR/O7kUuDVDD38zlctGG9PA0R3
         j9Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUyX+s68qnDyOdNDVQb9UmV4xhgeh1cTrMrQKUNl2v+pI/vhcoIAqlk8/DWPpvTQ/le70yORMG+lQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzUuCDmM3N5KXMJWJdPaxDpA++Lo0ga0Go/gLkZsvI1DN1ysv9
	4T+priUc8keEdDubwbbNOIgwBHUCSHd21ccgW2mWLbYRJB+u7L43/oiqxR7FuMvzXs8=
X-Gm-Gg: ATEYQzxS5r4JQ7GL2Y6GfaQ9leaYajUER2k8hCH+GnxzD8eMRhUjtqUcvIKG/sGsr+k
	DgIk0YHMQiSsoMRr9qBY9cVGd+VVAhC1rkP74Q4+dk3f289EBbWzABtUfbdygl9AYwqEuiPB4eH
	6B2L7WJJQKm85kwPVrfQJbPK6V7KLDBsrrR2TdVwwwO71JuSTTTkY+FABoyq3E7zbGFG2EANwpy
	vlWmtDiCgRJKEmq5J9HtnRPPJTju1Mn0yrEFQVjgyxj6pRgv5cIgJc50+Bz3MajhSiKV0SlIto+
	3sYRQy6cnlomb8S96yjcTd3f+Rr1VSHEkH0FWTLXH12Xn9xDZCCiyjBSY2YPdkw0kD7Wd1jV+Qn
	hdgsfbT1K2B44ggK/qiyCE55KCS5QQwxClg41E2SvwsoOMQ5f+gsShrVftygyAfzS7KOetXVrSO
	CT0cS/upZH2IzAn2Wmizg8/uSnQ6VIx9rpvdb+ohjP5jk9C4MZn+xAWU0FmOShfbB6
X-Received: by 2002:a05:600c:3f05:b0:47d:8479:78d5 with SMTP id 5b1f17b1804b1-483a95aae85mr300243205e9.7.1772032294030;
        Wed, 25 Feb 2026 07:11:34 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:33 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:22 +0000
Subject: [PATCH v8 05/18] media: qcom: camss: Add legacy_phy flag to SoC
 definition structures
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-5-95517393bcb2@linaro.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6305;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=T56zPiTpvN0GBLBYQMGo9vQwbDNYOKXq8zVh3tggF/U=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEaDeWqiRrxKX6nKsm0fVBtNdq3OXvpnzn80
 nPDwmTICnWJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RGgAKCRAicTuzoY3I
 OshSD/sHc+DlrWPWUfH9gk+u2u19z81qJf7ZuyhkMhi4q/+sz+5yse9heIB475AoH1EEgGMsvFI
 tbhyYlKvPkF0/Yhp0z/blKCYMtbWw24bsI2hM0BksYBB3YSrXIzIr1efS2ObaB6bMViCZDWxq0d
 bW5TUepTvUIX+nL+d7TLYGXtG02Hc445W7iCiLFofNxIPXGKC//XDXyq7MrDJTnW4wlzn9QQUvj
 uFct9YtcKnXC7ItMywkP3SjaB2ORj+755cvzk3bssrTseuvp7k9uFwQHkvoBVWP3NBesgfHXFlm
 xBFNnCGVCn4qpKO0CQHzA3PJXFGH4JN7x6aRXqPFEWnlP9fE2PEYuN3V0v30TJnH7nu4n1Ftmt3
 Rsh/NpD+Hudgi4oicTGl6vaGp+jYhDfOuCbO4POymNWnOUNLUS6G4kJITJtuh2Kq+b3PO3p69x3
 h86m6EsewzHUTigCNvL8vdhN0WzGeLDs5X2zPoUD19PzWvtjxtQzQfuUL3zNKzGUa3u94CRIVyu
 9IofOKrbkrGP7T7kZ75LQLAxIAmtjFMVoqrb4R8hawjgmkAqUXie3xymMy/4ee9O1pEIeS3/JAo
 OxY9Z9Wj9i+t8T0DPyzqJSA1/GInyRDc8i/Vu5EgyS4I8bAyvc0jBKjdkGXI+qXpqeDfWuIm6Bm
 sf4QltJ1H99s7Bg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Flag which SoCs have legacy - builtin PHY code. This will be useful in
subsequent patches to inform PHY bringup logic if legacy bindings are
available.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 00b87fd9afbd8..5fb5ad87e1671 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5104,6 +5104,7 @@ static void camss_remove(struct platform_device *pdev)
 
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x16,
 	.csid_res = csid_res_8x16,
 	.ispif_res = &ispif_res_8x16,
@@ -5115,6 +5116,7 @@ static const struct camss_resources msm8916_resources = {
 
 static const struct camss_resources msm8939_resources = {
 	.version = CAMSS_8x39,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x39,
 	.csid_res = csid_res_8x39,
 	.ispif_res = &ispif_res_8x39,
@@ -5126,6 +5128,7 @@ static const struct camss_resources msm8939_resources = {
 
 static const struct camss_resources msm8953_resources = {
 	.version = CAMSS_8x53,
+	.legacy_phy = true,
 	.icc_res = icc_res_8x53,
 	.icc_path_num = ARRAY_SIZE(icc_res_8x53),
 	.csiphy_res = csiphy_res_8x96,
@@ -5139,6 +5142,7 @@ static const struct camss_resources msm8953_resources = {
 
 static const struct camss_resources msm8996_resources = {
 	.version = CAMSS_8x96,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x96,
 	.csid_res = csid_res_8x96,
 	.ispif_res = &ispif_res_8x96,
@@ -5150,6 +5154,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,
@@ -5163,6 +5168,7 @@ static const struct camss_resources qcm2290_resources = {
 static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8300,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
@@ -5177,6 +5183,7 @@ static const struct camss_resources qcs8300_resources = {
 static const struct camss_resources sa8775p_resources = {
 	.version = CAMSS_8775P,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8775p,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
@@ -5190,6 +5197,7 @@ static const struct camss_resources sa8775p_resources = {
 
 static const struct camss_resources sdm660_resources = {
 	.version = CAMSS_660,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_660,
 	.csid_res = csid_res_660,
 	.ispif_res = &ispif_res_660,
@@ -5201,6 +5209,7 @@ static const struct camss_resources sdm660_resources = {
 
 static const struct camss_resources sdm670_resources = {
 	.version = CAMSS_845,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_670,
 	.csid_res = csid_res_670,
 	.vfe_res = vfe_res_670,
@@ -5212,6 +5221,7 @@ static const struct camss_resources sdm670_resources = {
 static const struct camss_resources sdm845_resources = {
 	.version = CAMSS_845,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_845,
 	.csid_res = csid_res_845,
 	.vfe_res = vfe_res_845,
@@ -5223,6 +5233,7 @@ static const struct camss_resources sdm845_resources = {
 static const struct camss_resources sm6150_resources = {
 	.version = CAMSS_6150,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sm6150,
 	.csid_res = csid_res_sm6150,
 	.vfe_res = vfe_res_sm6150,
@@ -5236,6 +5247,7 @@ static const struct camss_resources sm6150_resources = {
 static const struct camss_resources sm8250_resources = {
 	.version = CAMSS_8250,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8250,
 	.csid_res = csid_res_8250,
 	.vfe_res = vfe_res_8250,
@@ -5249,6 +5261,7 @@ static const struct camss_resources sm8250_resources = {
 static const struct camss_resources sc8280xp_resources = {
 	.version = CAMSS_8280XP,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sc8280xp,
 	.csid_res = csid_res_sc8280xp,
 	.ispif_res = NULL,
@@ -5263,6 +5276,7 @@ static const struct camss_resources sc8280xp_resources = {
 static const struct camss_resources sc7280_resources = {
 	.version = CAMSS_7280,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_7280,
 	.csid_res = csid_res_7280,
 	.vfe_res = vfe_res_7280,
@@ -5276,6 +5290,7 @@ static const struct camss_resources sc7280_resources = {
 static const struct camss_resources sm8550_resources = {
 	.version = CAMSS_8550,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8550,
 	.csid_res = csid_res_8550,
 	.vfe_res = vfe_res_8550,
@@ -5290,6 +5305,7 @@ static const struct camss_resources sm8550_resources = {
 static const struct camss_resources sm8650_resources = {
 	.version = CAMSS_8650,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sm8650,
 	.csid_res = csid_res_sm8650,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
@@ -5304,6 +5320,7 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_x1e80100,
 	.csid_res = csid_res_x1e80100,
 	.vfe_res = vfe_res_x1e80100,
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 6d048414c919e..24ec3ad7990e7 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -104,6 +104,7 @@ enum icc_count {
 struct camss_resources {
 	enum camss_version version;
 	const char *pd_name;
+	const bool legacy_phy;
 	const struct camss_subdev_resources *csiphy_res;
 	const struct camss_subdev_resources *csid_res;
 	const struct camss_subdev_resources *ispif_res;

-- 
2.52.0

