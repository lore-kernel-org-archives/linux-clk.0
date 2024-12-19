Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A20B19D070
	for <linux-clk@vger.kernel.org>; Thu, 19 Dec 2024 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734627625; cv=none; b=qmzdP4IEMNFjEfJds+NbF7H9+jgjwex9PTnEzwEvcjiURCgT7fpXCdwed8FVvs+ufX3PQ4N6QLycnat9s0S/VZ/cn7QEtavp36BAwGWUuotSfQSKnR7Stc6uJiApK0GUNJRTfMS3lkFdW9cNcPLWXk0XMUAUt1xQi4aN5kT0Ev8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734627625; c=relaxed/simple;
	bh=wckcOULVs/VpNyLdFrIVHSAJAEPzlkpkYIhbXxO9Efs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OkBOP/k7YtB6GqRiWPAlNQqv94s+qjh2G/3Be4zhM5VfoFLEzoUrQuus2UBqzI89eEhXT+Jgyr+uhEUrFstTro1vJJLQlJbWKeR2eYCo8VZsIQSVrfGv3plfIQeTiGXg+iAxWjY7N1KsJoUa3EwabSlfwFb7GG/ZqOOkzYpNL8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QE/QoBta; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QE/QoBta"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21619108a6bso8869155ad.3
        for <linux-clk@vger.kernel.org>; Thu, 19 Dec 2024 09:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734627623; x=1735232423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CY48cM88V/hoEtiU2jZWM2+6ic5R8sHZknBHQXdoTnM=;
        b=QE/QoBtaVd95p9Pxb/cfG/krrjY42NDUCYg2AMYR/h3qMWXi+0zi+jS9FcD8KzQqOC
         xjayYrR5NTs3ljakmwMhkGw/ddMQG2DkwpMg097wQ+GhJOasbLty+LDk2/mtqMz2U8wC
         c8giu9qnyswGIfGWHEyp4IcerPdSQZZF8tW6RekacpSl8hBszsrsgWPXuyl6Sfy7rMEf
         iYJkIA826jcF9BuVKBBHZ1SNjN5QrgFEmnCX2dFwpmhV5WWclwgYRxMiKs2h8U/AZNXX
         wmWQ5VLFuVhM7pAxy0iY8XOHBLKRUGB4i7EjfQexzAuxYiKymQ86ET6mJczoJFXHDmod
         yw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734627623; x=1735232423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CY48cM88V/hoEtiU2jZWM2+6ic5R8sHZknBHQXdoTnM=;
        b=fYHDTEBTllznqfIZg39rseCiXGMn94KEaNbdhUyxYQypOjzPzC+5nNGbtfwp2KPG3j
         YeLqgAbtB5rXrY4OwrfsCm4qcvsKAPntLp+kJoiQCvCHXMnVGDyoYGA0AZDVT9ggAKBM
         11RKJtvYLLc7iLbPtiynCFFosmtVohpwUnwMnM31ORkZChAW9P51eoup/bbTa5zGNfEi
         ESg1XBSxkVT06Gaoxi2a/Ug7XPbbvyYqi6qs/v/lQ10WY8XBuUJjTDe+uetjarQTpewU
         NaZdpp9w4lLFC4chxKmfPdrS/vIz4HLWw4F1ElKjyfknDZB6/S3OTLv0jr51L3WosTL1
         GYMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpwf2Qp9V4uug7+JV+RYvOJvGduRxxqQjX8Vj0TDaQp7qCHS2J0YuXkC0K21nhvjYnOrbCghs+CCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUDzremnPL3SdqT/Cq7485menIXkwqFaMCugwijcFuCEXbthMa
	BVwh+BrTockz1cPNUHqrV1ql5MfRW2UANJH1bXzXyGq00gSiL6eAafoD459PQVCiEiwaqN/5SAs
	=
X-Gm-Gg: ASbGncvRg2DfjTjq1dEz5mIpFvr+N8wL3EpSUAdZ12/eAqV8WcPG+o+izDwfAvEVdJk
	ZOCZ6P0otYop6nw7yqQLLCY6FqJIiegGb0rsmi8wFx3VYcF5n9DcjSHxHaSr2fuSIsN2ZUj2kl8
	5i9e0lxYb37le4SzqNmjtha+4wP2aunzxkgNfN5vK6swbapSpnhz3Xr3/AdJbxV5PmjijzNXZ87
	u7211Rg154mGEI3lFgQjWk1/ou8I10EtqHvrUvBjL60/6AN7EIRCl+jgx63o9jWYgIexBKwNFBd
	Gr+kZR4Acw==
X-Google-Smtp-Source: AGHT+IF61HYlBzOFtWSOXFDjQ6xXqIF+VEUhsruBuhPEigas2YyUqvrel2CTtb8tVYlJgL/VkknJUA==
X-Received: by 2002:a17:903:2342:b0:216:4e9f:4ebe with SMTP id d9443c01a7336-219d9692d58mr57695015ad.42.1734627622843;
        Thu, 19 Dec 2024 09:00:22 -0800 (PST)
Received: from localhost.localdomain ([117.193.209.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e32f5f00sm1407655a12.72.2024.12.19.09.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 09:00:22 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	stable@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 2/2] clk: qcom: gcc-sm8650: Do not turn off PCIe GDSCs during gdsc_disable()
Date: Thu, 19 Dec 2024 22:30:11 +0530
Message-Id: <20241219170011.70140-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241219170011.70140-1-manivannan.sadhasivam@linaro.org>
References: <20241219170011.70140-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
can happen during scenarios such as system suspend and breaks the resume
of PCIe controllers from suspend.

So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
during gdsc_disable() and allow the hardware to transition the GDSCs to
retention when the parent domain enters low power state during system
suspend.

Cc: stable@vger.kernel.org # 6.8
Fixes: c58225b7e3d7 ("clk: qcom: add the SM8650 Global Clock Controller driver, part 1")
Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/qcom/gcc-sm8650.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index fd9d6544bdd5..9dd5c48f33be 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -3437,7 +3437,7 @@ static struct gdsc pcie_0_gdsc = {
 	.pd = {
 		.name = "pcie_0_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -3448,7 +3448,7 @@ static struct gdsc pcie_0_phy_gdsc = {
 	.pd = {
 		.name = "pcie_0_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -3459,7 +3459,7 @@ static struct gdsc pcie_1_gdsc = {
 	.pd = {
 		.name = "pcie_1_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -3470,7 +3470,7 @@ static struct gdsc pcie_1_phy_gdsc = {
 	.pd = {
 		.name = "pcie_1_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
-- 
2.25.1

