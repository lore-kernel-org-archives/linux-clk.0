Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED08170A37
	for <linux-clk@vger.kernel.org>; Thu,  1 Aug 2024 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722507681; cv=none; b=B0WEBZoNKvEoIkNrF9Q+QOhQJnRkr8/9bJFdEixpkgVGp6wjawhyoNIAJGZwHPTn67EgPAM8A+4GHoR2gHjQ0LuojgSLhqGPIGSZYY8uaKAqvzT82kR6BHcJRNbw/KjgxIdeITRuoVBByDn9w7NCc0p6FYscHo2lWLu70eup9A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722507681; c=relaxed/simple;
	bh=1w2sEv3mO93UTbBWty5+SXCjCXTrLfrjbRNFOcTaVdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oNvKCtgxHqXBPW4D17QKGl1ck6xTXwjPUARxaZvhB7Rnh+jk2PzqpduqPub3D97+/7p3WzIP1pvgmC5Crn6fDvhUDwHrP/QLse8N/w4YsBCU8yQPewcbbyOCQgz3TifrSD/uw+2+a4NpWFekZV2RCokw3lOLj+oUxetoT2+WGqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dZIebzGN; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dZIebzGN"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ef2c56d9dcso85461471fa.2
        for <linux-clk@vger.kernel.org>; Thu, 01 Aug 2024 03:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722507678; x=1723112478; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jlj+yWmKtN5l/Z+12/zWK6DoBGtel4lk94/62hlvDME=;
        b=dZIebzGNoYARdWjWC6egLyoMj9sVldV/xD4o5rxhdivvO1w3zyXZKPcuz+XfqmBiaM
         veTUPdNMocF69bAHQsaImCLLia8cCq1joCOs3Rel5I9wd6jeb+zeYBi7dY46H/tKP0Qv
         KK3iM4P9UP/EJ3Z57GDVGK7L5ddxdy0c2rjSNwfsRB62aQwOQW9CRh8qsvlWr7LGePw5
         9GKQygSluyUaSOLgONmF30jBR/s+S2o7baC/mQiNuZKKWp6F85MzkQdJzknHPA9cfo2T
         tJunOVBS50YH8altgInHkUwR7LdYNGpRm7s6wfSDaHIMoJvaad3O6Z5TjgqU1+VboJZj
         u64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722507678; x=1723112478;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jlj+yWmKtN5l/Z+12/zWK6DoBGtel4lk94/62hlvDME=;
        b=raoGIuNlBUPxZZ5QdoU8VW2S0wQXnjepkr51/puAPm+xYHtvf/WOYdBCMyaQnK13Fh
         3N9f26Bo2hgGMZHdyJ6/6U2eX6FyB6Qa2N4TRsiZLqVzfIEqx/kHYgYnKaWzN5FUSOCP
         kvLm0Cpum0rLYktrfrSCI/Wx88cyvqPJN74tCJPYl/TpOmbvlz5guPrRVjNEM7Fr2ecY
         Y6k/xfBku8jErAdEu0r1K+dlz4TYN/3ruPhwo55FodQEMhVdJ8tJg6L7OTEC5sojZ64V
         k2ChttllePjGkg9TL/o3tNhghDmt0dPNRICwj5cg1CiHYjGrbj73oRLEXq7XSbvrsKyp
         PUCA==
X-Forwarded-Encrypted: i=1; AJvYcCWGOaPgFH2XB5+Rc6jDUX1y3gDCBSDuE4pzim4zVRCg4N+mZIE/1kozql6DpzMch/mLOYysWKluSJ/jK4STGvFjQU112gebmsNZ
X-Gm-Message-State: AOJu0YxeWKgEO6ZtwzKyGQnbSqGcFF3sWTNeydmKbjZwWBsB4f73iZzk
	vyvNF09czVaCuMOvbSrk84LEdA9CIKbEOpyy7u8CL2TDGKaHvl9Qy/U1TwwG5y0=
X-Google-Smtp-Source: AGHT+IGFSPm7v8ZK5AOlXNOPGo8Mx26FbnJnvQuJFQFkkN6gAYG3IGJNkhFuUYXqMVaXR2wtP4rzuQ==
X-Received: by 2002:a2e:b056:0:b0:2ef:24e0:6338 with SMTP id 38308e7fff4ca-2f153109f54mr14499711fa.27.1722507677510;
        Thu, 01 Aug 2024 03:21:17 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bba283fsm51389035e9.46.2024.08.01.03.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 03:21:16 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 01 Aug 2024 13:21:07 +0300
Subject: [PATCH] clk: qcom: gcc-x1e80100: Fix USB 0 and 1 PHY GDSC pwrsts
 flags
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240801-x1e80100-clk-gcc-fix-usb-phy-gdscs-pwrsts-v1-1-8df016768a0f@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJJhq2YC/x2NQQqDQAxFryJZN5ARsdKrlC40ZsbQYodJbRXx7
 oauHg8e/+9gUlQMbtUORb5q+p5dwqUCnvo5CeroDjXVDXUUcA3iIEJ+PTExY9QVFxswTxum0dg
 w/4p9DNvYkwzXLrRNBN/LRbz9f90fx3ECLuJDV3sAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1426; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=1w2sEv3mO93UTbBWty5+SXCjCXTrLfrjbRNFOcTaVdc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmq2GXS8lloMlaNdH4nPkAQziRD5N6S7RTl+NAl
 Qh023qqZdeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZqthlwAKCRAbX0TJAJUV
 VvKYEACuIJccxhmTQYyrXJuggacL9Pc3hsUPWgFl/McffyRUEli88+FRoOTyAQ4p7nImxiHaPqj
 IIjgtTJ/oDpmycXIRnXKCvDIJz9qWfqB6zs6p8mnl+6SxfZCAEdUidJ5o0LF6lTICUuRidYMjd1
 p8hEKpEix5V27aC3af307FLqiF9k+3Gg+G/Khb2TqTz8E+bzw9HtoT4VDUWXBcI3hkqKjAB5NDa
 nhkwu9xPBmTeRr2uB0rWQQPJBTesui/Cqzmd+ykH6B/LD1CiwK6WhrO/yMXqpcePySDAIHAxJIx
 rUgPpZ39vjbShTCzu7FUj8B2CQbVKef8cXWyFuFgczbT0H8Q0j5jbVwHItx5ctjF8WfWkZrGoal
 7pjtdq1tHVzj8nX+XLBHw9xvNG7PwjQf1IJC4E1FuRNv/hyHux454JUjIy1f/A8DRyfb0ajSt6t
 WQmkpWu3lLEIOEzgsVdinvuRNpDJr5/rP82kGJgnDk7TvNnGfsPm1JmUJG3dSnnNqtFOi/VUwPg
 q597+6ARd13mkKWSLnQRYNA+PMkMaUsiqOmm1RRagNwz3hLX7f5wCdz9GvIL3FaUailavnvNund
 ezOKGDTWE96IHLOVCy4fmkBP89sZUwkdYs8eXuuCAPO2280IYJQrUCcpto0Ft8DDQ0mz1qQIMGO
 I89XaIbkW+11pyA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Allowing these GDSCs to collapse makes the QMP combo PHYs lose their
configuration on machine suspend. Currently, the QMP combo PHY driver
doesn't reinitialise the HW on resume. Under such conditions, the USB
SuperSpeed support is broken. To avoid this, mark the pwrsts flags with
RET_ON. This is in line with USB 2 PHY GDSC config.

Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/gcc-x1e80100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 6ffb3ddcae08..80e90e31be33 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -6203,7 +6203,7 @@ static struct gdsc gcc_usb_0_phy_gdsc = {
 	.pd = {
 		.name = "gcc_usb_0_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -6215,7 +6215,7 @@ static struct gdsc gcc_usb_1_phy_gdsc = {
 	.pd = {
 		.name = "gcc_usb_1_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 

---
base-commit: e92057c615fec749fefcca4ab28ee5c425e3691b
change-id: 20240801-x1e80100-clk-gcc-fix-usb-phy-gdscs-pwrsts-6fa0eb78164f

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

