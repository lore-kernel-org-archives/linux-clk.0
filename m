Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C187413C80B
	for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 21:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721164418; cv=none; b=gI0UMfpLaZAEabCoXQ2biQDYu6MNciVu9Amob748OJhL+TmsLhNjabbCdcjxPy1bzRM3kP9/Rjj9dUVXTQYnsWEVvJ34ZNcaT8KJ6zg0epMIS7Ktbm3eI8S1cr8ivlnPjlkMxWWgRUVYArhQVC7xSZmWpjYYqQAavdUZkFsiSeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721164418; c=relaxed/simple;
	bh=11oFdYRphnn3+d4I1yU6g86bXNCstC7PZcZD5H1uSW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E4gZMG1lwnLW+sTX8uP5l7ZhARekPndXkCMp4A7EOZFvLPPwL7VsH1TP1P+Yr5iMzBaZm+4aNcwAR0YilA0lHC0NDZ8SRvgW3HyU4sALLmsivzveKN4+sRK5B63dj6C29xOYo6EU8VBcdL6RXar/zV6EvZqXjiDOMSKIvbgoZW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VifKzHAt; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VifKzHAt"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2eedea0fd88so41918311fa.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 14:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721164415; x=1721769215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQlwCabAr/hMVFQmRQ8A6rTLaWpzDfFyaQNHtYxsnJo=;
        b=VifKzHAtuyUuj6mwhyEuVsHkPQiB+JUQau+aNHH8kNS4syPHL8b7J7RUIqK+D2OKpc
         9FyxmamJSBnUPYlgmcnlYPXKV1/54gQzuMOL5gnnRulmpYBgkqdtiIhk1WO04fBz1ROn
         Kd/cPm46N0mWx4SJfvsrKJaUG++h1iuvWXf+aSJnybRRNDlQ2x9cwlV22JYH9psdc0/h
         5Ko5YxxlaG0WpAnHIJJLmM5lRHbGiKsA7MMDIlNMS8rRsxBAKadhaQ6/h0dAYRJvzzD6
         I4+ZyHtkyqT+Shuw8sUZ6ADzNeyccDvKW3uwI6YI1wLWRp/HUUWmX1tBkxlxVGpzlZhh
         w03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721164415; x=1721769215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQlwCabAr/hMVFQmRQ8A6rTLaWpzDfFyaQNHtYxsnJo=;
        b=VUUbnWU6XLIm65EPbNeKgOB/2kaJsePv+MXr3zRxDF/LlHe+Eho1EPkbvTErH1znNb
         hyR55jOY93v7dWjTPfxusF0TQxwsu+lkXqss852jgEkCpg5dxP/YOsZsZUwI4fb4y2mg
         8kXQBtapKFvqTajNh7jv0NwIPUkXRKL6vfMvT+GQUo/SHnueTlUew/KLGIrJgh5cYhiJ
         z/h1PhhsXNt2JuwP9C1dtvZc+kIcp8HddtQXu+3PPv/H5qBLWsrVb9pHJzsDGN5fSYqh
         qW+nVAiEYizlIoyOKntIjRrNHkVZRqIkmy4nB53piteaXoaRuzSlvyre/yrya51QGXpm
         iFyA==
X-Forwarded-Encrypted: i=1; AJvYcCVDCWrObXea0RjrXJmx7laJhwGU4R5kpnXHv0hBd9GXV7y1lKondr+sSACVRLVH3AmwpZkRFHm5InyhqwHg+8avBmnTmFq74VQg
X-Gm-Message-State: AOJu0YyP7dMREuTtAwHUnMch0fV0KpNWaPQQuuiYUcFcsjGjTNfQs6QW
	mhE2Wx2K+kKJw92oFI99MdUg5Z/vxEjZJq0lD2hZOSK+KlFtLYRGrAPFk5/q/lM=
X-Google-Smtp-Source: AGHT+IHpjGOJTLSOg9LNcXrSDD+AVI3w/jbSxPVn+eESHUSv/2pMDUxFYt3wrREceMaJU44Rvw4AnA==
X-Received: by 2002:a2e:3015:0:b0:2ee:8bc6:6826 with SMTP id 38308e7fff4ca-2eef4192202mr22820931fa.26.1721164415002;
        Tue, 16 Jul 2024 14:13:35 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee179e723sm12433871fa.24.2024.07.16.14.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 14:13:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 00:13:31 +0300
Subject: [PATCH 4/7] clk: qcom: dispcc-sm8650: Update the GDSC flags
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240717-dispcc-sm8550-fixes-v1-4-efb4d927dc9a@linaro.org>
References: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
In-Reply-To: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=11oFdYRphnn3+d4I1yU6g86bXNCstC7PZcZD5H1uSW8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmluJ6f4JjsezwsgtXdzKA495WF4MzX47hWyDuP
 3iDFuA7FA+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZpbiegAKCRCLPIo+Aiko
 1SYmB/9IAt2RjlRrRsYAb6VqqD2qpi6sbAQc6rCwRMtQr/TRWIM5Lz1bEi0ENP26qNjRlPMIxL4
 vWwCwQjKx2eQODURXJxMucMR6lqQqn5gcnxDX1C6yHQ6Qz+7VLT4tB9lqIz0jgUDivyLVUHTt6c
 Blc6RvlLr51VforXlB8NEe/Ym0tTMgg6o8etZCtpLXXaLeaUuEcVa6WcVu3tl30gi4dco0ufEhK
 /Cmb1nSb30SjPNNUJLj/5WQW4H4RctGdhw4Yrl8GJQPMwq81H+vdh2rNAs7Xwg988i9/fluSITA
 TmxO8OFaaAXhlqoJvkgaZwUl1KTy6VgakUKxklfw6wlGE4Sy
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add missing POLL_CFG_GDSCR to the MDSS GDSC flags.

Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8550.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index 6bda15bf09ce..49dff9b81fa1 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -1611,7 +1611,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL | RETAIN_FF_ENABLE,
+	.flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc mdss_int2_gdsc = {
@@ -1620,7 +1620,7 @@ static struct gdsc mdss_int2_gdsc = {
 		.name = "mdss_int2_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL | RETAIN_FF_ENABLE,
+	.flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
 };
 
 static struct clk_regmap *disp_cc_sm8550_clocks[] = {

-- 
2.39.2

