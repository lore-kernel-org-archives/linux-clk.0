Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800B319CCFC
	for <linux-clk@vger.kernel.org>; Thu, 19 Dec 2024 17:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734627622; cv=none; b=MBMJ4NJn5cFxD6yGTSdkQDARmK+x4YIEXVaO+7F+sFwJBXITNQMfDxrokeubsjOWL5OfgoImmEiuKp11ANXejHTVAO/IrJLUNCyvuavbl4Y+o+PXr88Bq3PknYxoMKeaQxHH36+06my0UTE1t3/nz4LyFQGNllmE/b3alsiHoy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734627622; c=relaxed/simple;
	bh=n21HfpMoJR9WFr9CibdW8Aomhh2HE90cnrVbP2qH+uw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bCAwtnD8LIpIEh+djG8B0gjMHGTXEPFk9QyqUKusSFIkIjm/uzPdprVSWQhdlYb96C4GQq/lF5nqf+brsCkdTBXmutcxRN9BFH64pvk/HbOdvAmTMmCOsmm53ka0x8vLTDylrDxtBphy9iwpZp0VXBHFBR6zSamnwzgtnu2nu0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eu6peO3Q; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eu6peO3Q"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-728e729562fso1001609b3a.0
        for <linux-clk@vger.kernel.org>; Thu, 19 Dec 2024 09:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734627620; x=1735232420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rvVuqV2GwLcaDiXbUpyro9fRhixYRjVVrUaD/WrniM8=;
        b=Eu6peO3QwujW1CstEXgtd8W0wR9s4Uwn49ObYpeL5prJu3rbvGe8/GA2AxQOj7HhMh
         eIdA8AiMFXF0+hL3X5a2YaX9BZAJLozhk0HF81uKnatTgNHS5p2SDlXAbz4I7oG/fqA1
         oxrEh4HXcHttwZHDlcdu9WOaMAprLX0bVQlyiGyzpjRYx8ekLcRa8/uvLhtAqzIgrB/i
         SvrMJWQVcy6znyx93XjUkzByAn+jU6VL/jItkmCivmzdwnOnbZrh1Cvq5fSqyMjdwaCO
         bmL+/9mREu28UtaW9KYJMkqXd9+SWQ2CG7ydn3ixu8j36pkE3fD29+IIiDKGiQIedMWt
         N31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734627620; x=1735232420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvVuqV2GwLcaDiXbUpyro9fRhixYRjVVrUaD/WrniM8=;
        b=vbFT2kVKWCOmppKQvMyV2o8+sN3u7O+SdE1GnYR8pAO+hsn03mfxBLsLOHYwQotJwu
         wrwgilq2lB6qqDJsAXjl0BARGRuEHOsqvsi6R0tZlXE6vGzDcdI0f5wxUDUVxLhX03DZ
         sVLfBo8eWYhoNGyrJJro5r3lVJ3jMar2xHnrtSfYzMzoe9wvmii89JtY69m3uuuSlsAH
         8tRrpAvpqISB0/fEeDyAJv3F6mjtgwA4Ls8VQRlI93kjtV9rZkpH2kxPg215LahueDHx
         nTXxs5D5MzI2dIMTKI76gjoyNfYTTgFWZvjun1wbuPJW8vYVXR/7LK3oHECwLeqqs1lK
         H5Zw==
X-Forwarded-Encrypted: i=1; AJvYcCW+YYzDCh4xj8YIA6oCNjbWLPcZe8VxdZe7ymYmSxJf0JGvxJgVI3XVz6sAjxDOI0XXyMw7sQvBZTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaIcUngUP0Iw9ycHi61/HYAJoXNUOueRB2ALAUmRl8ncG7nA9o
	KdsvlQCykuz2/D+GGwsYC+IhgWxgLrC16uW0lHAlqpP2L7RRIQLkjSum4qci+w==
X-Gm-Gg: ASbGncvrPTCClFxql3J+f2Fu72DBgN8vrheZaRPSrRO+74DcNqOwF4GI8xBy1RRnqzT
	Otkrv1XCV22p14o04fkwSUjFXbeevI1OI1my9tThFADpDeiAjfzZFgqzQuv5i6NbOW9ZoUMqCoI
	uTuM5vQz36tPWhYRmqyj3Tc77gkVmVApVGHxBZSTAoeyyXdOEyh7VcA2AzAPKl6hZcXLvshAld+
	S+XyvdzWarnyttySoWhkFiFSPhBdt+usGeFsP+Dwux3NztPZ5fkpZN7+MalnaJg2FGbN3xFiW5X
	2vEoycyPIw==
X-Google-Smtp-Source: AGHT+IFImDDOw38L2ODnRhpuOHiWBYDqi99QKYqqIgqlfkownksNYxRi6bh3dnJUpEOexYrDEBwdQA==
X-Received: by 2002:a05:6a00:430d:b0:725:df1a:281 with SMTP id d2e1a72fcca58-72abb50eebamr395776b3a.10.1734627619539;
        Thu, 19 Dec 2024 09:00:19 -0800 (PST)
Received: from localhost.localdomain ([117.193.209.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e32f5f00sm1407655a12.72.2024.12.19.09.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 09:00:18 -0800 (PST)
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
Subject: [PATCH 1/2] clk: qcom: gcc-sm8550: Do not turn off PCIe GDSCs during gdsc_disable()
Date: Thu, 19 Dec 2024 22:30:10 +0530
Message-Id: <20241219170011.70140-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
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

Cc: stable@vger.kernel.org # 6.2
Fixes: 955f2ea3b9e9 ("clk: qcom: Add GCC driver for SM8550")
Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/qcom/gcc-sm8550.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 5abaeddd6afc..862a9bf73bcb 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3003,7 +3003,7 @@ static struct gdsc pcie_0_gdsc = {
 	.pd = {
 		.name = "pcie_0_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = VOTABLE | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3014,7 +3014,7 @@ static struct gdsc pcie_0_phy_gdsc = {
 	.pd = {
 		.name = "pcie_0_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = VOTABLE | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3025,7 +3025,7 @@ static struct gdsc pcie_1_gdsc = {
 	.pd = {
 		.name = "pcie_1_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = VOTABLE | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3036,7 +3036,7 @@ static struct gdsc pcie_1_phy_gdsc = {
 	.pd = {
 		.name = "pcie_1_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = VOTABLE | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
-- 
2.25.1

