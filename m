Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278212571DA
	for <linux-clk@vger.kernel.org>; Sat, 11 Jul 2026 14:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783779491; cv=none; b=IOAvf8M1yJJx2njeNgB621nP04zXdJo4UonNWlUp2gAT5zXiTy0fzf1JVOjg7JgPk0wiGltHt33EXEwdfNEXA/ltqmIpqQpMnxoUuTLZVBk4WJtHu/lwWUkMuMypwQguAgbnn+aoxX5b6NHI8OT8RBwSDVbwJo0WTyY7xc0nNpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783779491; c=relaxed/simple;
	bh=P8fGItMJVTkI29IuTk27ZviMnOihY03AzedJHB3s2tk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RTMmXz943n3dpcmoVkfVrRJOhdvBTJrqN4dHMJ+2Q4ffDtw7hhT4t45MnmOR76VfBhj4i3kE2twuU79jWJxezodWHHitbb/84n/ThDi85DWyBSti9zzOF9IpKjsJG3EnOuiMVe3G9AB5iM1GGKEh5wJg/qYK1qpRazLQRGOQQ3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dn61qurG; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dn61qurG"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so1023740a12.1
        for <linux-clk@vger.kernel.org>; Sat, 11 Jul 2026 07:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783779488; x=1784384288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xXyPFDoQ8rlAk10+E4qXYKOCM6mEcLGKZu2GMaaYaDc=;
        b=Dn61qurGK4ZRVaMJRFDBXqcbmwwNZqDvtv4zc8SCwea9U+pmGkq35PcTbsVV080o6s
         zn1qpMGovNp+1Dnkqp6CnkaVnKCUMLak90LOXEpJ+vF8q5E89RNU8Giu+F3HpQsuGuCl
         GExDCmVgZMPZgw7RwS590OnoACqv0XiyPISQO2Fdtbx8ef7VCEfmQNQxGFB5i0NkcGtU
         9FZAQ4AE41OUs5vYh3fFm0hZiaIhFxw+gJzn2giYlm17HIn/q+WdSixjvNm/tRWFf1zm
         LuivpLn92IC3WeVoJYQjhAaWNFM6BiaVwgBmGGI64Z6HU0ytx8xZP22Uaogju4Elsojq
         LBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783779488; x=1784384288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xXyPFDoQ8rlAk10+E4qXYKOCM6mEcLGKZu2GMaaYaDc=;
        b=angfjEOr9QgiqI1yicpyjghLEmgyCsC+PLYf8gywf5R6tLeFNjj3oElxyxTNJtceVi
         K5EIWGhH67quyXAGLac2OymG4i+/MiRrEkn+gNpYQl3QfF0vLdoZsiY6k99vWTEf2vL+
         bkgBDpdXumvO2hHHpyju9n445ynWKYn28YAP7HTCDa20KwQZlm9jazZnVTht5zjLNwDH
         5yZh04+wKDt3fjhaEbBDWHGL/H0ZriTs548ji9lqcG/SB3qJcZIYhGSEVrCYq/9724Oc
         GfWf/fzha9h1x2yoXKOx2rXPWrZdtLGPalvddYEjfY1Hv7OlOv9zwWWP2Xuj8BiB6kKF
         EmLg==
X-Forwarded-Encrypted: i=1; AHgh+RpWaGNn/L80XwV4cHHvpNIHzuEMR/BFAvlJUeNlu+zcRfOaqDfB5lLBxuXyHUrWTvmKMofz4cRI7xY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjJK7lB1Qt4AEA43jx8Mq/7rUSvI+AFjf5q7dLRU4ommtQTKbk
	zJA6I+bpUMEcQSTjBSfoDWiJz1v4BgcCNn/70ymo5kzxrU/VXs5EoD4=
X-Gm-Gg: AfdE7cl4WMZ7Vmibxcib+udYre0+jTVjpDNQKr+fq35/3g/ADeke7rtCuFiZRYIXZ/V
	VpNksvW8SuZn7f/Ub6B7CefdETLTNnrksa+tG81uDp8xGSHgiAPI2fqzatgqXH1iBPLSqw5FDRY
	Lrv+1qi2GM0MTrLzdUjkk1+/l4qRxDOfV7f/6p+AFIV2s6TNdhoHc9k2r3/Msk7gY0RhDrKUoxG
	+uLmxjvbr1Q12bOVp9FHxwGBtRrk6KKjBmFShd0UWK0VWMIH3l8mAJX3QeKlhJF96xAs4K8lWl9
	1xmB2BrbJJA7X3SKdTyz9Gx4Sehv0KFeF59dpDTSaJwVi6fBBiY/YYsFT+lw5y+hJWQ8nys+Ms9
	lmq5NynJHITAnibz874YRaLmA1FQyeFnGAzgvtOQ6Q6dNX4SRo5Enl/pMtRY29KHFv3SaZWeGD3
	ZgK4bTPcHVRN5Kq1HHHVcO20NyfP9SkPDraLABc8r7J/zy8zSmvAnBI5crRfqGhxJ0cdFTdpvb/
	Rx8GVvy6xoZOB+7JCI9zXIEjySzKiJ+Cb0TPZVmedA9Dverxg==
X-Received: by 2002:a05:6a21:1798:b0:3c0:9c1a:8952 with SMTP id adf61e73a8af0-3c110b35019mr3048915637.74.1783779488418;
        Sat, 11 Jul 2026 07:18:08 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3a2e420sm6338597a12.29.2026.07.11.07.18.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 11 Jul 2026 07:18:07 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v3 1/2] clk: palmas: Manage external-control prepare with devm
Date: Sat, 11 Jul 2026 23:17:42 +0900
Message-ID: <20260711141755.96842-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

palmas_clks_init_configure() prepares the clock when an external control
pin is configured. The current driver only drops that prepare reference
when external control configuration fails.

If provider registration fails after that point, or if the driver is later
removed, the prepare reference remains held.

Register a device-managed action after clk_prepare() succeeds. This
balances the prepare reference on subsequent probe failure and driver
removal.

Fixes: 942d1d674931 ("clk: Add driver for Palmas clk32kg and clk32kgaudio clocks")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v3:
- Split external-control prepare lifetime handling from provider
  registration.

 drivers/clk/clk-palmas.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-palmas.c b/drivers/clk/clk-palmas.c
index 39049f62db..86a51edac8 100644
--- a/drivers/clk/clk-palmas.c
+++ b/drivers/clk/clk-palmas.c
@@ -194,6 +194,13 @@ static void palmas_clks_get_clk_data(struct platform_device *pdev,
 	cinfo->ext_control_pin = prop;
 }
 
+static void palmas_clks_unprepare_ext_control(void *data)
+{
+	struct palmas_clock_info *cinfo = data;
+
+	clk_unprepare(cinfo->hw.clk);
+}
+
 static int palmas_clks_init_configure(struct palmas_clock_info *cinfo)
 {
 	int ret;
@@ -214,13 +221,18 @@ static int palmas_clks_init_configure(struct palmas_clock_info *cinfo)
 			return ret;
 		}
 
+		ret = devm_add_action_or_reset(cinfo->dev,
+					       palmas_clks_unprepare_ext_control,
+					       cinfo);
+		if (ret)
+			return ret;
+
 		ret = palmas_ext_control_req_config(cinfo->palmas,
 					cinfo->clk_desc->sleep_reqstr_id,
 					cinfo->ext_control_pin, true);
 		if (ret < 0) {
 			dev_err(cinfo->dev, "Ext config for %s failed, %d\n",
 				cinfo->clk_desc->clk_name, ret);
-			clk_unprepare(cinfo->hw.clk);
 			return ret;
 		}
 	}
-- 
2.47.1
