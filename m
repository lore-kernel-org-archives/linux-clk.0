Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6A726E6F8
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 01:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773622935; cv=none; b=IZ8QqKJWeYtztRfiEwLgG3K30oq6e0+i7KN+22Ji8q/S/wWQDJVOKm9qAVllD+a3eWhafl6xrcS/d0k7vsDAXSS9iqhrm1n05LzQ4xzDmzPe7fpUYRtHyKgvCEhW3KXt4KkbIpjsJHzjobu2YSL6CJyoL5qg81cOU5Zl/kXgYJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773622935; c=relaxed/simple;
	bh=R9D7QBRJGljcNS52e8MDmb3qUgPBLvJ+yJXgng1kixc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J/nr5UA9iBVigm8IPM3U1OEchsTkPGH7mmwjBKrBWQaodkyhXNs1X/xsoQwlkNB95euBfFLtsUcna/nsjK4oHabOC5Gdw2eJAAhmVJPnWIb7l+LS/GXdfF03PPOIUfUVnlDj2JjWSa94wbYhO7Q3+In+laZzddju4nukCT3pIBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GDirzlnV; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GDirzlnV"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so3597087f8f.1
        for <linux-clk@vger.kernel.org>; Sun, 15 Mar 2026 18:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773622928; x=1774227728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEXI/wT0/vTDxPb1iAv2bVNkGUuRphAeXeojsX6f5oI=;
        b=GDirzlnVZBqFInVureS45IUSRj1j3iDX07PpDA+qD9O61ez+yc0f8AyaX43r2Pnuzg
         ES2XDYQW3+vXBfWy7dnJ/Hwr5J/MT26oShx+0vSV2utp2a+73McBFDeM0FRk0lejAun1
         mY6Sus/4t9yn2LQ3TuxVv2q1v3ZxEih5X1+DfMuINcuqRM0dO+KADj7kjw7HFglRwPqw
         5VuarigZFSmWw/guuOdomtpvTcY6DVMFcON4AUWJ9T7e6ybEY7gc3S5XoDueWDGCV795
         unZqmye0s3kp+wSt3teH1/rXL00F7bXxJa+lIYb9PdgMXbicxFv8PLaHJ2oMChSGEu+w
         i+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622928; x=1774227728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vEXI/wT0/vTDxPb1iAv2bVNkGUuRphAeXeojsX6f5oI=;
        b=MFDhm5cI1KI37GOE4Enp+d8fyyigY/4OTJjPghsxewY4epCzC1dpvze7/TbBBO7Sao
         VgQxkDS1LFrpTDnxSJSbLBN6CZejvSIUOtk/utKamiuVtN3uBUzOK7438sU9+8lzLNa9
         CK38pZOVLmcfw5UVJ4eTJttPe0/3dAtQI/t0RLyOYGovVoBzQpUp60DW98WI3ulczTL9
         qyQU3i/MrKiDW8rNSXW5rushmI9oqcgQQI4YGFk4ldRraHnECS7YSv1BJ5iaKH8SK/Yy
         u9MgA90+/1Pd3k+aNRC7V52jeuf9D7AdcsKV16EGbxfafTrPB/0Ry/eb2D86j3rnOcBE
         Rcfw==
X-Forwarded-Encrypted: i=1; AJvYcCUeVC8vAaISPaBwhEmWr0sAILncVXOJqiM/Me6AwjUGWiy6h63+aOYXZM5bEUp78Dk0SdDbwqPReOk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/3Kr0LxFvUmiv05FaHLDCYbQFf0gJ5hr/77QHNcv4Dajh9krP
	wHctndTqRJhGTzfKU/fWos0H97OcGUXxKWbW5+LgYv5gMJUlkn+RGK/jHz2CPVzGoWo=
X-Gm-Gg: ATEYQzyvxS8iXVkRQaAQBKgqe0Kb6z0t4RRXQuZFXnEapDVczXbkc46f2AVpJHaVa25
	4bFeznrHH3QuAv6PgFS9GO5QRYB4K5j92V5bFYhPdzReNyJrLXCUXKpCNL50sEbJqC+wV91q4bk
	4HssIP4JndJoI7PqJruY5i9G31v0HH0K47UBdrpHXiqw8A4U8cQ42NxAiiEDH8Aeoiiq+kQ+++a
	q5Ti0E4Qp+xNU6gU3Ytpg4ELdwoTyHc9qa03ozb2a/2MT6pFsH+P2/tV0Ibratd4f+TY4Wdt1zO
	oeyBEcUawc1WVminONLlqOOmKTAkqY558/UJOqLBjY0dRYeRl+bEP1E/Nva9q672BSdGJ7B3FKY
	dXISGYb8bC1BBeyS5NPcpx6hIe3fQLlm6Qmv/F5PH+O2a6qmAehtOZBsp3S9plPy8HrNcyivb86
	0ei7FXXluDtgtlMFHIhkqdgdkjQMjZEkN/Tao=
X-Received: by 2002:a05:6000:2085:b0:439:c5da:64b7 with SMTP id ffacd0b85a97d-439fe19592fmr27321985f8f.15.1773622928442;
        Sun, 15 Mar 2026 18:02:08 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe228986sm34729700f8f.35.2026.03.15.18.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:02:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 16 Mar 2026 01:02:05 +0000
Subject: [PATCH v10 5/7] media: qcom: camss: Add legacy_phy flag to SoC
 definition structures
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-5-fdfe984fe941@linaro.org>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
In-Reply-To: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
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
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6433;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=R9D7QBRJGljcNS52e8MDmb3qUgPBLvJ+yJXgng1kixc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpt1aMXXdTyWRBHpbg95ECMxYFnTxhylH4wic3m
 DvnrFVMF7eJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCabdWjAAKCRAicTuzoY3I
 OighEAC3IryKA/Hg2DUVtqqWGMi/HkQ398jH9xsLQSjgZNgottPV02IU7WSSWRtfL1BsCc/HOs/
 RnTJmN4n1KxwNmhr0EL09tyjh+lzhPSE11fdE8SAtlKjXfdFxr7qWzQJokrmE3jYvYONvPNgjhr
 sw9F6RzHTY/HHDLwbU/VX7S85iK6YzN1egXW+Z9LZUnsP8KW57smJhIR9OIWvOyJdxswuKgFyxi
 +mdxuDL426niTLUtt1wlyPWzfmtS8qK43Eg4iQMWoruvjV5VVoNQndCz3p8U7bPmUGTxr+1B3Po
 x92Agiba4DLh64XIEpXtOw80/wdksd9dsJ92aq2VWW3zJcTSOtbAyyEUAwdqc6fnPM28TYBq94D
 S4TaU3nhp9Ec2LpqFpn4Ig1VEuQCHBzzl2B3zXxuXxKUOmHdiwVb0/qzNj24mCPSM5AKkYGzjCw
 d1dcJ/wtBiz48Z+ntSLKGQJBup744YF7wzpT0ogml7IsYAODuVLzhwFEaE9uMKXyOKZSAcuT/vf
 Y20VJ5pbxCQ71bDmds6z+1ruBszGChP9eoyUXfjFV90f8QzSIAkeF7pkM6k63vfn9+qs9xEgxOG
 kHwOTWOyjxtxtPbqT4c0P3Ua7bnOS5Zap29N67oVxJl5/hSgyCrJ3ZKkrvTwJuy6prRxqki6IMK
 xzejyoDAts7Gitw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Flag which SoCs have legacy - builtin PHY code. This will be useful in
subsequent patches to inform PHY bringup logic if legacy bindings are
available.

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
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

