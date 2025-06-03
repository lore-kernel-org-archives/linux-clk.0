Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DD323C4E6
	for <linux-clk@vger.kernel.org>; Tue,  3 Jun 2025 15:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748965405; cv=none; b=brQGgX3gC7B8CG/vcDxkhwuqtCJbyHB7XopiKhSmqaRmZHVkpx1Y0zBSCMFudCRnTJKbuY5CIezRoWKVlBj95E5rtphgbKwmD4let1hKPI8eYNiXuypGEnHankL5Ck482ohktm1Xj6272+fxJ//Q4XLmoJOlRON4yC9XIHLE05Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748965405; c=relaxed/simple;
	bh=mkMTj06O7I1L9PURSG3BNAMbohNB+Tx9IJ0AE7abtkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lF/juRzity5d81YB+lH1kyUAoOeSVfAUIQA0Kx81fjwrlKHaXi0ROBCKomgZ2M1nd3U/KvMWLMeCbh7dU92LiTGBAgsn/pDI7syIKP1G9ou9KVtgAu7zLuDnwMtB/nxsR7fPGm+zZfu1g9plHSp2MvJEWVmf3qP1NB9R2DsLaB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CdnhC7g6; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CdnhC7g6"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60462e180e2so653639a12.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Jun 2025 08:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748965402; x=1749570202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhF2cjF5zAzV18nEabakJ1UzQ/GrNdWmpvarqiPCL7M=;
        b=CdnhC7g6HTA5vVqW4+Yh06/p4CQ5jKKnTPKcn/kxHayDitdoWpXM47JMCdIgYFH/Zr
         mOfMKs2FynPZIfpUOp0rwx6XXN98vDdX2loNp9EicwzKYGpRr1f8LOmxFQ7f1HH+6Xqv
         DL3aFB1/wck8kjaaWzV95l+kKSkj3b83g9fKBwSwEK63PeBISj4WJ9PN8yvmGxbPt/oP
         5E3EduLzvIv2z27fR8WsWw+sE1S8Xh40Fdx4zqH2B1JHebzeoYBzzd2Mkaeqx6Md5dsg
         kGdov6Hlvcgf4Ml4KHh3Uk7cD2Ui8jXJADfhePZVtGPSKIrzqLrJkGFW+vAtksARWeVH
         z7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748965402; x=1749570202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhF2cjF5zAzV18nEabakJ1UzQ/GrNdWmpvarqiPCL7M=;
        b=w++wVcHWb+6cwjXbH8pPqg0Z290eHIdt7nVdYIGUmV+NZ7wcbhfV0/5ppSCdHs3MkI
         ESoyHRHs2MneJAoKy29A8tPDJnlTJJ360msNtt43F3bOBCjG7tLCIMqanJhBvBaSYPjC
         Ge5fZWXspwGlTt1gBANjKqDHkffzrmwLtflJ7/yTbTmXlfgLVwAV8HvBAg5Cg0TrQCZt
         Bak7JS1HPGoLP9eDt0O5YcMsCrO5ob6qMyz5tCr01ZA7sMXibwlggnJxxxq2RrNnBmA6
         igbNMQxUhUoQQ9TcRRTaU1F+OWPqix5K1dI4Kr7R8EJ21m5eWtDhPQWKP9x14bXCidzT
         9bwg==
X-Forwarded-Encrypted: i=1; AJvYcCVUaFIXHXd7j/WZnBzzZi3XsWXc3s1eFrN8t1Dg8x3H3mCOUAs/ZM0dZaGziLUKiTvUH63ww4dTG/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKedsILlogimDG0C5y+2oXwY09beZDmFrjpc5b7mGZgSegPsjU
	n7MsV7TkMB2f2gSD3Mrul0ycK5TF/gLaFhnJO8psnTmWispyX6vzAgXaf+NmzXr+h2w=
X-Gm-Gg: ASbGncul9D5RlxKycxaFKIQnkKubdw1HrWEVPmt4KFbF0DKsoeaWIQbKc0y7f97pDwR
	dltDq51AjbAC6ntq//nleI0VP3pvcpbSsRD/M5YVqksJi8Fe67xb9Ee6R8aI7RGmVws2YfXbY6K
	2yGtqmlq9F89lEICTD6f2pLtkgjivpNuddihnqiMfQHXlAmzus0pxJ6UcqrIzigtE1Wtca63VNv
	jzJO3fKwW9lHFyEmlNxuehD+EGE8arEEOoZHtpNSplHQQlpSA/JmqqZve5Cyz9juH2HlvDkCNxZ
	JMqNWdUfO33u46RyOL5ut3jbkACBDIic1LhJPCianE6IFlPTQCAcfcU3CsVanVmdE2NUIampumf
	7e1wbdrijaf3r/sEBJckLE8n7F5YJ5h46L0A=
X-Google-Smtp-Source: AGHT+IHdbH5nQxzalWh/NsDVZb6FCYdDH3rQaVkOJ6uhuni+aK7sz1J/yFbrtIh3WrzPAg01pUI1GQ==
X-Received: by 2002:a17:907:971c:b0:adb:2ef9:db38 with SMTP id a640c23a62f3a-adb36be2060mr1662069466b.36.1748965401532;
        Tue, 03 Jun 2025 08:43:21 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82de9bsm959277166b.47.2025.06.03.08.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 08:43:21 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Jun 2025 16:43:19 +0100
Subject: [PATCH 1/3] clk: samsung: gs101: fix CLK_DOUT_CMU_G3D_BUSD
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250603-samsung-clk-fixes-v1-1-49daf1ff4592@linaro.org>
References: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
In-Reply-To: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

Use the correct Linux clock ID when instantiating the G3D_BUSD
div_clock.

Fixes: 2c597bb7d66a ("clk: samsung: clk-gs101: Add cmu_top, cmu_misc and cmu_apm support")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index f9c3d68d449c356019aee569fbe289259624da70..12ee416375ef31deed5f45ea6aaec05fde260dc5 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -1154,7 +1154,7 @@ static const struct samsung_div_clock cmu_top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_G2D_MSCL, 0, 4),
 	DIV(CLK_DOUT_CMU_G3AA_G3AA, "dout_cmu_g3aa_g3aa", "gout_cmu_g3aa_g3aa",
 	    CLK_CON_DIV_CLKCMU_G3AA_G3AA, 0, 4),
-	DIV(CLK_DOUT_CMU_G3D_SWITCH, "dout_cmu_g3d_busd", "gout_cmu_g3d_busd",
+	DIV(CLK_DOUT_CMU_G3D_BUSD, "dout_cmu_g3d_busd", "gout_cmu_g3d_busd",
 	    CLK_CON_DIV_CLKCMU_G3D_BUSD, 0, 4),
 	DIV(CLK_DOUT_CMU_G3D_GLB, "dout_cmu_g3d_glb", "gout_cmu_g3d_glb",
 	    CLK_CON_DIV_CLKCMU_G3D_GLB, 0, 4),

-- 
2.49.0.1204.g71687c7c1d-goog

