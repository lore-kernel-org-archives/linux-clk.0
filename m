Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DFD347524
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 12:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217859; cv=none; b=hDLBFkeoB34kpcFIBefXs7asneEVsqq7LAsbFMhS130sOmkEIOWwi87oQFD50hPlVlJTK2dR8kAvKCpes/M4ADGpF/MuTL667z+rwf3sUYIJyIBNa+R/d0zYJngUDvm4qeZzwWvVceLC6KWvMiogUqhK24NnXtR/Uu5BpeVsqjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217859; c=relaxed/simple;
	bh=BwXLHFNYLRV0NDjr952JqfGJ3eYoCYyPIzZu133hrds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sEKIWrAVWMJPTmdYM2KmjxfXBWFPhznkLlDhEc+d381K+RLH4Xsxo+F7XklCep84wAGGX8vP0adxcv+zyASd7sy3FrR/FqdBZ4UQ7mhsM/0OsBlnTggYcvp7ztvwjmSs8pp8fADQx43+nFZbiRlThkd9DeEbIhBmiw6VvI6t6LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=RYmwMj3O; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="RYmwMj3O"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso25172455e9.1
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 05:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775217856; x=1775822656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bxQmMvsQvjjCBqN8BcQZeFluIkfqmLXersnmxU0RpY=;
        b=RYmwMj3Oi18V+6AnIr8TGC+/BJ2JP77Sjv2H2bm5JkdF/T1FIVna98aVg4dmdGAb5h
         xhT2yq5v/+YXlPEthRSvgg5X3Pp6+0b5J7YR8aLoK75hFY5/6NZ1tMaFnTEDyT6vQMuu
         +CfbJ009aeQ4e1L3vjMOH9uE7kQZ59kmNo45SEu6TD3FnlMzt3CZrgfNxQuecG3skH5R
         Zg7IL591j39kanVPB/vMpRzKXZtsn0cQSPZ3nGJqQ1k8Lx6siTjIvqiKu3sN52ptiZrA
         mNUHFJQ7ACQK2VEcgow4zT9tEkq7oZGQ49oPUbH/7yUOeJx4vPHuTd+lcmcJbZ/jjQFu
         YPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775217856; x=1775822656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9bxQmMvsQvjjCBqN8BcQZeFluIkfqmLXersnmxU0RpY=;
        b=WlFF5iL7BQ/iRStXzKG2X4T5x12sTwXYXZmqDVOjEWmNdSDSorSHrFJ1bKQrbIrefH
         hkuBCWusuqOMR/A0rZ+/Qes/dQcjAOFkvjB8rfeSEM5viYF1Al0aapmIJ1VKmC4rAyvk
         5U77E0rtpH79RZ9O8RxU2FKBWx/INfdg+x/HllsXVioqIK/MGI8zUNmP2zs5MNUmCtE6
         RDEKNpON4o3rHoQNagothL8Be82ws2z2s83MISqHRu0TuhEyJU/cP/obv8YQTiUspv9Y
         TXuhc/uaW7Zy4SxrdSqOuVEmSXTs8oRZSBVTtZi2YOse+iniT/D31eh0D9aO011h1+mT
         mjrw==
X-Forwarded-Encrypted: i=1; AJvYcCUXIDr6ZxqmmE4CGSOyGngHy/96n99sY/LF9j7nf1xXcG/hd3Luvn3xtaqAttvPWc0op5ViIHDdeFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrqowrFRw+Zqz6QjP3tM9W3XOXo3FXY98Le4eZZSr3qocVBPuI
	Nnm8JOzgSd9I7Xd/HOwo0jy/LyrGoakEue29UOP9vyna/ssVVNR2+L0uPGjENLh13nc=
X-Gm-Gg: ATEYQzzJ1DTmYjxaejPklDtmRestdeHYnhGL3FJyDs0Y/v4PRWQAxvtSbh+RYrw7/ok
	nsIjR9pct0Eon6v0lN3y+lI0rW08x04/u4L9SX9JiAINbqD4DQMwXPdCB37NHNiw2oTj3tdONrD
	6oQZHDxBXmurtsHiXX4wu41e7Mi7Rddxz/NXfQCMLt8RSdCvz1FXPml+NwZuBtcvLIjlf3HEg8+
	vA23eFk4BPMnIlbY8agMAYpfMkRzpkUTuyi4bypBGoBaS87JRlTxLVY3jMUHUv+HuHXvq4Yhdk5
	bbzF51SGta7Y/FLJhvtTDRwCPHbn+EVImg8LDZwVOmi462f6iSHOE1dzuUT4j7cUMXZAlTEIrTn
	KQZ8iee4JnGwRIdLiwuoFsm0vN/PqhE0Myh5GfLjRnDHWSfpqbvt8fvY5m9l2DAhSPdvqtKgaRm
	pC3PykyMu891PzNjJcKMPr8uI871KzsafdZg==
X-Received: by 2002:a05:600c:4ec7:b0:485:30f7:6e88 with SMTP id 5b1f17b1804b1-488997ed834mr42353285e9.31.1775217855719;
        Fri, 03 Apr 2026 05:04:15 -0700 (PDT)
Received: from [10.157.142.139] ([41.66.99.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm300193995e9.0.2026.04.03.05.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 05:04:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 14:03:47 +0200
Subject: [PATCH v2 2/3] clk: qcom: Add support for GXCLK for Milos
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-gxclkctl-v2-2-95eb94a7d0a4@fairphone.com>
References: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
In-Reply-To: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775217850; l=2000;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=BwXLHFNYLRV0NDjr952JqfGJ3eYoCYyPIzZu133hrds=;
 b=oK+n+UfVPUvAs3JqjYta0Wct4THXUio5bVmhJJzJIwOMs3yp1pA7dhAV/2ySBKNvNtMsVo7dN
 rOCjSo/YPbbBjEk9MuhEH4X5MfbuYAfiwbQ/AtDaNqOLsJI9mIUq3yA
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
clocks for the GPU subsystem on GX power domain. The GX clock controller
driver manages only the GX GDSC and the rest of the resources of the
controller are managed by the firmware.

We can use the existing kaanapali driver for Milos as well since the
GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
configuration.

Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/Makefile             | 2 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index b818fd5af8bf..13e7892ba39a 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -187,7 +187,7 @@ obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
 obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
 obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
 obj-$(CONFIG_SM_GPUCC_8750) += gpucc-sm8750.o gxclkctl-kaanapali.o
-obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o
+obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o gxclkctl-kaanapali.o
 obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
 obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
 obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index 40d856378a74..7b0af0ba1e68 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -53,6 +53,7 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
 static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
 	{ .compatible = "qcom,glymur-gxclkctl" },
 	{ .compatible = "qcom,kaanapali-gxclkctl" },
+	{ .compatible = "qcom,milos-gxclkctl" },
 	{ .compatible = "qcom,sm8750-gxclkctl" },
 	{ }
 };

-- 
2.53.0

