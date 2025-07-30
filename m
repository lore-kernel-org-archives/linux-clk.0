Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BF62DCF63
	for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 16:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753891896; cv=none; b=iWmwdo4PANnmffSlLGarBimY5yviKJiNxqF1f8X8IETTmdJn4dHIlkYfK84fN0117wFUxFuEBUmzFMAu52ndQtx1xOA9VxPY3scPE0xgh7QclExV06LPXUw2tKkJIRdRCb9DPO3eWJtSaUdc915z97U2fzNEinAmuULg19YaH98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753891896; c=relaxed/simple;
	bh=Fd6r5ej70Gx78OKCjT5dW6+hePHwHbsPkXWk9c0URgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IvAi8F4kUvpAPCkhj6fWPYikd+P3hB/UYPbNoJRXD1rz7S9BmeD5d9ba4hYmRERMzA6NGvJthrdKbz8gqi2Ro6QTOUi58h9UR31m95Y/k16bFN2+v211K5PbswtE7I9W78H3zKaRJhhBYAkz4mFboYXivq9Jjoy692hGjN4c+Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kM/rN6Yg; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kM/rN6Yg"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a54700a46eso3388343f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 09:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753891893; x=1754496693; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UqOwZkurxN6DP6mkxJOVh++qBYZQgQgS3fnY4YseNNE=;
        b=kM/rN6Ygq+MbGLfNlLSfID9cDiMBbXUl7HwR821U5p2PPPqDzdx5yM59aZ2Wbk7GMx
         JB+BlZXR2w9fJJuT4y06UbbaPpRkJY36DapfqAb5Eujh+8sTgxgDN/VCLu5CHaohyaDS
         aruFlH7L94VUUD1YNg0RD6A501uPDqWaSXavh+3gQ+XVpOkSm7J3Y6zk9D1XFx4ZPTOR
         f3X0iGU/WZZJW3OcbMl+dIAkLtaB/8lFGP24X/yBMpfKlk32Nt725UBYrptuQT6OWeoJ
         dSgqKnTui95Ro4rL0B8myL264+jxYPKGLfkz+nkbLpM0g6vbZZ8NJAs/sHThGzbLeeGW
         fy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753891893; x=1754496693;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqOwZkurxN6DP6mkxJOVh++qBYZQgQgS3fnY4YseNNE=;
        b=mKj8h3Y9rbFAEEFcr38us+WkQMPNcpSyELHkTJyTsUrbKU7mJ5KJZXjPui2aoGVROz
         1KIfy7g1QBr8m3kneGuPwLX9ZoOO6Rh7hNknbvvYX7p+KfzFhpagqpT3svduzMVaRpZT
         gJlt3EPL7NTLVlX4M1vt4e43sQq8r+9jSjZ7Mqvg1CaUr4OUC+EWglBWYWCuubJY8TIJ
         VqMuJ0G40HEDi+3tqdsz9F0Q8B2tft6++S0JVuIqQZ+RTY0xQ5DGcaI04GjLzMsMMu+F
         F/IaZ2KA3g1CR916wmP5bD0Bq84usJFgsLFMm7h9MH4E5XhMfiWdQiLJ61/ZMDIyGoFi
         suVw==
X-Forwarded-Encrypted: i=1; AJvYcCWQk1UaoXrmZ5j6kgcTi2T/daqjMNdkym4i4G71YxYRr4pdx488MLpdTEo1gPyztR6DGopl1KkR2nk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOn5nb3ZY9vT1NfORzDIYK9nMf1Owvd9xKr7EJqZrwQzqm8gCw
	X99L/lLnbSWweRh3GyoEkhyCZmkzJsB1rCJpxZmMeG1zK/un1jvMPl27LDoL1G/hgRs=
X-Gm-Gg: ASbGncsiEG9AWjiXtq8gTbDWesGCXU9DWi4N4wThfMDiPkImy27bxQyZ9cXtSDofRh2
	sGNTdAaHhHjtazUriBkKiZYr5RbxFa94xAiWRhkuY7IUHImojZ4ScsVB2oq99R56vTyVdOrGYuN
	1k0PY0bWzd4pPc0HAqB6HTjCFkbB4uooAACi0TP1M/DuUsA/jLUuJ8ebf1V3I72XTGP6c0oUqrZ
	PKsfbBsPaBDd8CD3cvie85XEN1zek1qoz6XKdmbsUmdwincDAN+mg0j75YZwniZjL/vVbcw8LYr
	kS2byPNg5Ia0cbpYg7zM6sV60yci8gvtG0zBQ9c42wMYqMMPtkN9KDSnuFgBs3GnuRZ5g3nw8Gx
	qTS5wSb7L9nkzP9EGmLDx
X-Google-Smtp-Source: AGHT+IE35Ywlzmt6bKCd2ef14MK+xws1qwAv8vwYO/BNrAHqXdxEW1CdRvYO8omT7ooIKsh8esKQuA==
X-Received: by 2002:a05:6000:1a8d:b0:3b7:8d0b:3282 with SMTP id ffacd0b85a97d-3b794fe90damr2754479f8f.31.1753891893243;
        Wed, 30 Jul 2025 09:11:33 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78acd884dsm9164564f8f.33.2025.07.30.09.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 09:11:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 30 Jul 2025 19:11:12 +0300
Subject: [PATCH] clk: qcom: tcsrcc-x1e80100: Set the bi_tcxo as parent to
 eDP refclk
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-clk-qcom-tcsrcc-x1e80100-parent-edp-refclk-v1-1-7a36ef06e045@linaro.org>
X-B4-Tracking: v=1; b=H4sIAB9EimgC/x2N0QqDMAxFf0XyvECqdMp+ZeyhxqhhW+1SEUH89
 3V7PJfDPQdkMZUMt+oAk02zLrGAu1TAc4iToA6FoabaU9sQ8uuJH17euHI2ZtyddOSIMAWTuKI
 MCU3Gn9b1rg3+OpKnAOUwlV33f+z+OM8v1KcEPXwAAAA=
X-Change-ID: 20250730-clk-qcom-tcsrcc-x1e80100-parent-edp-refclk-8b17a56f050a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Fd6r5ej70Gx78OKCjT5dW6+hePHwHbsPkXWk9c0URgA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBoikQn1mpNTbomnI6wjUQllPAQi1cNsItik0+LO
 NhyFErPoFqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaIpEJwAKCRAbX0TJAJUV
 VqdED/9TUcuk43y0Rv60rmuHzWZ8ypABjV0pMT0RaclplWU0Wdlf1KPt4twokPE4hWzS4QO1oB0
 Q3XhvFPTgYWujJfcQnJxWKwCnJbFfmpJCDga5f5ODbrv1BDvxEJCGB6vPiYO30xLlRx113JqZhW
 GhKSbCuo7ofu6otLGjpkPYGGe68rbK/Pb1ePYqUOqp4/mgJSo8Rgqg6+h67oUV5207B8fn9K+c0
 ln1th174V9uipBKGSRYpSkrx5cfNIaIujPc/LQT4s8ynjy66RpbIe6Xkgilnons33PbCIawGeGE
 BVZY5YYLinXYl1D5H/VHm0xGVHz1eE27Ch4Vx6fy+fx719fXDCRHlFI5U9D/xyp+E0OmykfPZ2d
 q57P28jFeJntrmDz28Lp1mB3TWMN8QpbUMIUOUz+3ip2mKYkytplWY7sG2UNS8MZY2jhptZfF02
 F2ABNDdc9kY2+VHanWGWwtYh0puF/NDYyfeUAAJhw0fRbbet+ab7wT1GdYnEbsufh5hjXnVirIk
 CFur6uOQ439azeVH1zxRTkFAeXguQg/3rpxJU8KAhHpatXZHz+INKc/Cg1QxOMXACW+kbZcwHOS
 JbN3W49T3M8ziNDM5Z+1uStqzEc1dHNFgKmZIkjvyfznBuKEqg2dkTr4eyFHnghbZYR+hLmD7L0
 XjCZTSzqC+I01zQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

All the other ref clocks provided by this driver have the bi_tcxo
as parent. The eDP refclk is the only one without a parent, leading
to reporting its rate as 0. So set its parent to bi_tcxo, just like
the rest of the refclks.

Cc: stable@vger.kernel.org # v6.9
Fixes: 06aff116199c ("clk: qcom: Add TCSR clock driver for x1e80100")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/tcsrcc-x1e80100.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/tcsrcc-x1e80100.c b/drivers/clk/qcom/tcsrcc-x1e80100.c
index ff61769a08077e916157a03c789ab3d5b0c090f6..a367e1f55622d990929984facb62185b551d6c50 100644
--- a/drivers/clk/qcom/tcsrcc-x1e80100.c
+++ b/drivers/clk/qcom/tcsrcc-x1e80100.c
@@ -29,6 +29,10 @@ static struct clk_branch tcsr_edp_clkref_en = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "tcsr_edp_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},

---
base-commit: 79fb37f39b77bbf9a56304e9af843cd93a7a1916
change-id: 20250730-clk-qcom-tcsrcc-x1e80100-parent-edp-refclk-8b17a56f050a

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

