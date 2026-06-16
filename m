Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E87F302753
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 21:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644232; cv=none; b=TnTMBKxe73zH/vnStL091hlcCoyZq8DSBGCG0Au8ddIYXxs6DYpu+cpxfpyOi5jIz5UVYyL3vNIvKFr+Dc0N6ETX1d+ojG4orlDlqRQfmCG/1cFrZj2cIXzJOAimdHyBX9jZWsQ878zgak0kyZEs9+QJJlKdLfMpqmbZSF0y4P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644232; c=relaxed/simple;
	bh=9eulPnfkamBxPWVDUWSuJDF9EQBkFHk7RIvP4h4tkIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GCju0+IAvgCflf30mJInaMP+Po8RiNg8WWLDODVV/MF+MzhdDNXamhSMFIihB4Y4e4c6V9TqGUYdSZbfT7+7o/p2x2Rsr7LMCpF38xg/stxD/z4x3HZ/mY/VnQE+7qmt4l2at+fKj2hHY7o0ZGNgy+wOkybo5MoTN3KNIKZyWf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RU54EoUq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=S5q4joRk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RU54EoUq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="S5q4joRk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781644230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYzm3gX2P2dHUEW9H/UGzkDoEHNOpxlaezzUPz9OhwA=;
	b=RU54EoUqTh9Y4aq0a0U/sr6nO9/FLyldNIbwIlVLbq8nVutXtpdayAsA3gX1eveYx6A1aK
	sD4Jth19ER3C2Rwrzs7JX2RJ1SPqbFhzxoaXqMDtX0dyChtU3VxfIkP9suSRidK7HY2J8l
	KU/tbDzyCNyTXkqXgnz/bMxCoHDyvTE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-VI7_u4rVNRSLHb4-iv4GOA-1; Tue, 16 Jun 2026 17:10:28 -0400
X-MC-Unique: VI7_u4rVNRSLHb4-iv4GOA-1
X-Mimecast-MFC-AGG-ID: VI7_u4rVNRSLHb4-iv4GOA_1781644227
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8dba7ac8f28so1196036d6.0
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 14:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781644227; x=1782249027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYzm3gX2P2dHUEW9H/UGzkDoEHNOpxlaezzUPz9OhwA=;
        b=S5q4joRk3LrpBNlYcOzmdkYn0UIuLRBsM3h/enzR7+IbzFcp2DogwZESMVkRByfQIN
         umdk9tGsmZ3gX5hnSYvq3yphetwMB59034usZsjnYFLGtgWegujm3b22OjrDqUKBtuuW
         v9YM+Q1/2ajfkQMGcY5suJnI5TPswt/aK/AC/Yl29uCflDkTB0Y8Az48gHrCtMQr9TFq
         0jWOE38jUuTGv6uOfHdYMziho9nyWf59XuNfGnpYcasrsFBd/xqyFpP9vAV5QMGHSmDF
         VsJsGQ1FUnCosw1nESR8S3VcWtNYFVed8iD5kqar85WsUphehkSRKZlztkSkj7Hmp//m
         Cskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644227; x=1782249027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NYzm3gX2P2dHUEW9H/UGzkDoEHNOpxlaezzUPz9OhwA=;
        b=EA4c+CBrn2a/8hhk0+ZIK6lPwgs1XMr+7iUXiBA45pbulJiGzpk4RNH7B+XsgJSOWB
         DfT7GNH+a4VqY5rutROCiuNpqfbLRyb0+qHjRTwFlLFz+QPK9/KctKLECiMbdiB85GLF
         k0GOgqd2Lj35N6jMSqcuYnzadR389Wj6iQRy13OPikXBJlga8aBxqFLx+orshjq3RfMs
         UjYAIDp3L4wwcy71JYka1qsA30zt7iPwOetUbAkr+iGKmoYMn1nFCLGepVoiJt0KfJlx
         6ZdpbT1sB+UnXLUFVZ2xJqgVGPIodgodm2BkWkq7NkkCSrLY6yxDt5VrfSs8+TjoQPMX
         QVCg==
X-Gm-Message-State: AOJu0YxLBEyDyu8cs6ErD8IrmSQnBgqG6MmTOppMqVGa8OrxMobOWors
	dvtlj2U/qfUiXt43EjkG/w3d1mdO4OPikhjafrjS5o+pkEkGF6LyteXYUAmsiio2hlz4wKHB6Dq
	pjpfU8av42HiBcSoOCZnK19SGjdZxfGawKtmeB3ZiBehDpIjGkJfgXEKf7rEOJA==
X-Gm-Gg: Acq92OFObo99zyi63DIYB1t0TArG2REhFeCgtkFMuCeBIffGMsTbxuitz5EVr8peEaW
	28syGxnWXIi+v5gIWPgb/046S6Dd1Pga34IkfYRKVaYDOXyRS6xNXyvHdqZc41g8u3uXw+F+Xko
	WgDKHkaFdRepnDnO99cuGDudLGsO9mpzFm128ILtbLPkL9gnF9IPJ6k6xCG0APgzh8yBCu7YU9A
	xBN30mFgpwqB7eC8EryziyNUEMIAI3dmt6zhtTXy+4H4HgU0Vn8kvp1DgcuKcSuH7sXntbZFIks
	Scj1pZTx6muLfgR2/3O50UKLxYEcpLkyILcc175aPtU/PdadpctuK9+eriiEE69KylqMJHBHUH5
	/1GTe2ElmjbhkJKtUJAHTizMlqo3K5kdOVDcrzvO+GOcKaUsgdRJwYn4G3BHJqg==
X-Received: by 2002:a05:6214:428c:b0:8ac:a6bd:503b with SMTP id 6a1803df08f44-8db818f2ef5mr14524396d6.15.1781644227105;
        Tue, 16 Jun 2026 14:10:27 -0700 (PDT)
X-Received: by 2002:a05:6214:428c:b0:8ac:a6bd:503b with SMTP id 6a1803df08f44-8db818f2ef5mr14523526d6.15.1781644226485;
        Tue, 16 Jun 2026 14:10:26 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f122b21bsm43742846d6.4.2026.06.16.14.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 14:10:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 16 Jun 2026 17:09:44 -0400
Subject: [PATCH v2 2/5] clk: qcom: common: introduce qcom_cc_sync_state()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-clk-sync-state-v2-2-15f82c64d95c@redhat.com>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
In-Reply-To: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
To: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2167; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=9eulPnfkamBxPWVDUWSuJDF9EQBkFHk7RIvP4h4tkIw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIMd+8S/13UEvPa826n7dFZ7FGiDs2zy9S9OnZOVet/v
 nxGan1PRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABMRF2H4zVrausI+JzzZfat3
 mILHCUXr2NQFSyw7OyPXCTy8eHfmEYbfrFluWxy/sa1M409uXXb7c/PTuZyz7j8sCjugdbp87c0
 J3AA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Several qcom clk providers currently have a sync_state helper set to
icc_sync_state(). With an upcoming change to the clk framework, if
sync_state is not defined for the device, then the clk framework sets it
to clk_sync_state().

Clk providers that require their own sync_state will need to call the
framework level clk_sync_state(). Let's introduce a new common helper
qcom_cc_sync_state() that calls icc_sync_state() and clk_sync_state().

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/common.c | 9 +++++++++
 drivers/clk/qcom/common.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index eec369d2173b..31382c49c948 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -3,12 +3,14 @@
  * Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/clk.h>
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/platform_device.h>
 #include <linux/clk-provider.h>
 #include <linux/interconnect-clk.h>
+#include <linux/interconnect-provider.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset-controller.h>
 #include <linux/of.h>
@@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
 }
 EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
 
+void qcom_cc_sync_state(struct device *dev)
+{
+	icc_sync_state(dev);
+	clk_sync_state(dev);
+}
+EXPORT_SYMBOL_GPL(qcom_cc_sync_state);
+
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("QTI Common Clock module");
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 6f2406f8839e..ee448163b1fc 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -88,5 +88,6 @@ extern int qcom_cc_probe(struct platform_device *pdev,
 			 const struct qcom_cc_desc *desc);
 extern int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
 				  const struct qcom_cc_desc *desc);
+extern void qcom_cc_sync_state(struct device *dev);
 
 #endif

-- 
2.54.0

