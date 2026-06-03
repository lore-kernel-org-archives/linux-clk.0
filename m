Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6181E48AE04
	for <linux-clk@vger.kernel.org>; Wed,  3 Jun 2026 14:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496549; cv=none; b=a0coFM4sWFtUG4TpbhwvWuf9VRRSOwnxvckVzpn/TibukYs/K4nMxb2B8rFtnJ9KrHGm/oUiYhxgypNgCP1q0dRYYWSsQIvvkWf7Dm24s46qt/hVhAeccpZ+hK/igNpUeiuyXH3yakVZDTQx8iuQ9AO2FFy4jA/mxjsKi16/4lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496549; c=relaxed/simple;
	bh=bjN8RAuY/lp1bR9xKcsMa2zNTPYa8eGr1YlYX+mBtHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QeF+D8Y492wtPklqeHEJkRIwMFm7tbFfGj0Ov1W8qjhNt8dXdpkUn01WrBo3OVUMkcJBON4H5yYj2Ndh3yhJox9A66eCT+7XsTdiNqSAT1BW0B6zILIrUEVScqNN88h1zFdorpHoZpnLIparoYsPKa7F7DegcmK87jEI8FC4CQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WEpdJTq7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EbEDugy0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WEpdJTq7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EbEDugy0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780496547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IgQ3umXcpR3Cc34wKA2umMzxxU1QdCZVKqXka7AU700=;
	b=WEpdJTq7+CVWFgkwDpSbPRTcYsZGbEbkxoEs3/6gfSla/Ml11x03BHkd5sNlu2bgT+JqEc
	oLJlMYnQ9++9gb+x9ZL0k43jd3toybfZUCwjw+upzBCSE8DR2vL4nbKT61cQ7q1jfK9OPb
	WB2j+Pb7ZYgt/jhhU4HjHNXkbASgyz0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-9a5G_UeuMjyr7de1WJNZYQ-1; Wed, 03 Jun 2026 10:22:25 -0400
X-MC-Unique: 9a5G_UeuMjyr7de1WJNZYQ-1
X-Mimecast-MFC-AGG-ID: 9a5G_UeuMjyr7de1WJNZYQ_1780496545
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9158f07f5eeso137110285a.0
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2026 07:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780496545; x=1781101345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgQ3umXcpR3Cc34wKA2umMzxxU1QdCZVKqXka7AU700=;
        b=EbEDugy0Havq/N1XOUTRhywwmRNgB17qLyzVmAbGeQ2mYIpM9nCf7nGnHdxrHuX2Eh
         TjqzOnUQ32pxAgwUf5wrg4aozEW3I9CcFzU/yjtqLq3plzzUVVzR0QvZXKMKwVJmx+Up
         UiLmj1fRPdg1FbawYURn0kCLV8nTSuUg/jRUNMPfzuhrgIjg8C6vqQlZvNsWNLk4N/po
         2CuVbaWdfktjrtJSuIKzhrkOmVEG1B8wB6HtQrfCkb5HoutYPRK8tCvbBhNZUw++Vmeg
         uyxK4Ibd7zMeQ6FSYUgvC1T6fj0prLUBqfKXuka0Yu9hYojLIMCaCcR17p/n61IRG3cI
         XGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496545; x=1781101345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IgQ3umXcpR3Cc34wKA2umMzxxU1QdCZVKqXka7AU700=;
        b=r+UGUx6gsPC2qOpCcSevHkyspaF6Kj9HcxCtDtlKxrfM/v4ELCwddE/ANpHHdh5qBC
         ZCDy/5DK72kI0/iYbImrTF/stbHGmwnhNeNop09KXxOI2UUp00UPehorILpyKQ0hS59B
         JW4JaT3W8sD/ouj1LrsR54kgdLKRPf4KKFFflgPtc5ZuutySuJqp2KHOF7t383Lk4N3p
         6uzfeRhLCStr5Il1d4xJvLtRiYz6bqXGCfHKBY6/dnUNIKXH/uipNr77XLcHMcS3eFpb
         eAhGP3vdzcidJxc0joXKhaDSUfYfAmbbmWArU7TFJvftaBSvDDHBw9P4s7HpWEV6Xn/r
         IWQw==
X-Gm-Message-State: AOJu0YzosaRxolmBan7Mc/QqAoenMo+PM1a/I2OLqceZTt7oz2KYj9A6
	WUZFS0HHllEBD6Vse+0PcdQ6bDqu9lqTGnUj1tJXE6kGBSnKXTc/OQDesL0DdMq/ahAf95NmL1R
	B7ljQNjkoTBRCFqsUBycFxyJxNE5dXQEveGtYBOLfIO5NaQih0mFf66H03jtcgw==
X-Gm-Gg: Acq92OHm4CTPHaLyBtn2RiuegtYY96j4OaFQYpOCqIqecrvdqOifddNGvSWY2Fd2Ty1
	Bj+9RY2Rsv9SDWX0/cK/MEPuIjdIpQqb2s8ABWzpaAJ51E3O4/7iZsmmxBfmRXqeOrBVCuhUMgE
	KO3q6ikNTMb1zNyZwto6qSwHPxDzqrFhieQvnWBMp3IRi48RKWdH3wH/ZrEpBrNYmCvj7lB2xGZ
	fEvODBoEnjx76zWz4oDrmKwn4g/xMsGmrmiBaTJsw+b8DDknRFPVZ4RnTtAYDx6AGl3rjzQM4Mh
	ecTbhQqPu4d8e8iFOd0JnhcuiEfpC94EmAAElGPC6noc739g7XmpdwZlfgiVKNq1c+S6UOC59VS
	taLJMlm7f3YXqt10cZIi52JmqLBSp9lYHhYhJOJGpoa/ToyLPLns4CimKH2ybMTs6JLOae6o=
X-Received: by 2002:a05:620a:4804:b0:910:4e35:cf02 with SMTP id af79cd13be357-9158a7a997dmr614023685a.37.1780496544601;
        Wed, 03 Jun 2026 07:22:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4804:b0:910:4e35:cf02 with SMTP id af79cd13be357-9158a7a997dmr614018785a.37.1780496544099;
        Wed, 03 Jun 2026 07:22:24 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a238f8esm255611585a.15.2026.06.03.07.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:22:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 03 Jun 2026 10:21:48 -0400
Subject: [PATCH 3/4] clk: qcom: convert from icc_sync_state() to
 qcom_cc_sync_state()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-clk-sync-state-v1-3-457120eed200@redhat.com>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
In-Reply-To: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
To: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5781; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=bjN8RAuY/lp1bR9xKcsMa2zNTPYa8eGr1YlYX+mBtHE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIULKYf2hrw9Dzjwwa11fdDGLhUTqmL6r76Y8Y1p/zDS
 tf+xpTyjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACYydTfDP7vcKSyxOmazvs1/
 lnpMpiNjlk+0bIjszBUz1OUWblISesDIcHTqs2U1fYZCVRF3X181n9DTIiBYKq5/s/bcxYs58/Y
 uZwEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Convert all of the qcom clk drivers from icc_sync_state() to
qcom_cc_sync_state().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/apss-ipq5424.c  | 3 +--
 drivers/clk/qcom/clk-cbf-8996.c  | 5 ++---
 drivers/clk/qcom/gcc-ipq5332.c   | 3 +--
 drivers/clk/qcom/gcc-ipq5424.c   | 3 +--
 drivers/clk/qcom/gcc-ipq9574.c   | 3 +--
 drivers/clk/qcom/nsscc-ipq5424.c | 3 +--
 drivers/clk/qcom/nsscc-ipq9574.c | 3 +--
 7 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/qcom/apss-ipq5424.c b/drivers/clk/qcom/apss-ipq5424.c
index 1662c83058bc..70991c3a9a58 100644
--- a/drivers/clk/qcom/apss-ipq5424.c
+++ b/drivers/clk/qcom/apss-ipq5424.c
@@ -7,7 +7,6 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
-#include <linux/interconnect-provider.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -248,7 +247,7 @@ static struct platform_driver apss_ipq5424_driver = {
 	.driver = {
 		.name   = "apss-ipq5424-clk",
 		.of_match_table = apss_ipq5424_match_table,
-		.sync_state = icc_sync_state,
+		.sync_state = qcom_cc_sync_state,
 	},
 };
 
diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
index 0b40ed601f9a..0d920bd5a992 100644
--- a/drivers/clk/qcom/clk-cbf-8996.c
+++ b/drivers/clk/qcom/clk-cbf-8996.c
@@ -6,7 +6,6 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/interconnect-clk.h>
-#include <linux/interconnect-provider.h>
 #include <linux/of.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -249,7 +248,7 @@ static void qcom_msm8996_cbf_icc_remove(struct platform_device *pdev)
 
 	icc_clk_unregister(provider);
 }
-#define qcom_msm8996_cbf_icc_sync_state icc_sync_state
+#define qcom_msm8996_cbf_icc_sync_state qcom_cc_sync_state
 #else
 static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev,  struct clk_hw *cbf_hw)
 {
@@ -258,7 +257,7 @@ static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev,  struct c
 	return 0;
 }
 #define qcom_msm8996_cbf_icc_remove(pdev) { }
-#define qcom_msm8996_cbf_icc_sync_state NULL
+#define qcom_msm8996_cbf_icc_sync_state clk_sync_state
 #endif
 
 static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
diff --git a/drivers/clk/qcom/gcc-ipq5332.c b/drivers/clk/qcom/gcc-ipq5332.c
index 9246e97d785a..adec25aa9c27 100644
--- a/drivers/clk/qcom/gcc-ipq5332.c
+++ b/drivers/clk/qcom/gcc-ipq5332.c
@@ -4,7 +4,6 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/interconnect-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -3307,7 +3306,7 @@ static struct platform_driver gcc_ipq5332_driver = {
 	.driver = {
 		.name = "gcc-ipq5332",
 		.of_match_table = gcc_ipq5332_match_table,
-		.sync_state = icc_sync_state,
+		.sync_state = qcom_cc_sync_state,
 	},
 };
 
diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index 35af6ffeeb85..9bf3bb6f8904 100644
--- a/drivers/clk/qcom/gcc-ipq5424.c
+++ b/drivers/clk/qcom/gcc-ipq5424.c
@@ -5,7 +5,6 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/interconnect-provider.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -3322,7 +3321,7 @@ static struct platform_driver gcc_ipq5424_driver = {
 	.driver = {
 		.name   = "qcom,gcc-ipq5424",
 		.of_match_table = gcc_ipq5424_match_table,
-		.sync_state = icc_sync_state,
+		.sync_state = qcom_cc_sync_state,
 	},
 };
 
diff --git a/drivers/clk/qcom/gcc-ipq9574.c b/drivers/clk/qcom/gcc-ipq9574.c
index 6dc86e686de4..9edcfd8afb77 100644
--- a/drivers/clk/qcom/gcc-ipq9574.c
+++ b/drivers/clk/qcom/gcc-ipq9574.c
@@ -5,7 +5,6 @@
 
 #include <linux/clk-provider.h>
 #include <linux/interconnect-clk.h>
-#include <linux/interconnect-provider.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -4134,7 +4133,7 @@ static struct platform_driver gcc_ipq9574_driver = {
 	.driver = {
 		.name   = "qcom,gcc-ipq9574",
 		.of_match_table = gcc_ipq9574_match_table,
-		.sync_state = icc_sync_state,
+		.sync_state = qcom_cc_sync_state,
 	},
 };
 
diff --git a/drivers/clk/qcom/nsscc-ipq5424.c b/drivers/clk/qcom/nsscc-ipq5424.c
index 5893c7146180..253d625ebf35 100644
--- a/drivers/clk/qcom/nsscc-ipq5424.c
+++ b/drivers/clk/qcom/nsscc-ipq5424.c
@@ -6,7 +6,6 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
-#include <linux/interconnect-provider.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -1331,7 +1330,7 @@ static struct platform_driver nss_cc_ipq5424_driver = {
 		.name = "qcom,ipq5424-nsscc",
 		.of_match_table = nss_cc_ipq5424_match_table,
 		.pm = &nss_cc_ipq5424_pm_ops,
-		.sync_state = icc_sync_state,
+		.sync_state = qcom_cc_sync_state,
 	},
 };
 module_platform_driver(nss_cc_ipq5424_driver);
diff --git a/drivers/clk/qcom/nsscc-ipq9574.c b/drivers/clk/qcom/nsscc-ipq9574.c
index c8b11b04a7c2..be8fbf5edda4 100644
--- a/drivers/clk/qcom/nsscc-ipq9574.c
+++ b/drivers/clk/qcom/nsscc-ipq9574.c
@@ -7,7 +7,6 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
-#include <linux/interconnect-provider.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -3100,7 +3099,7 @@ static struct platform_driver nss_cc_ipq9574_driver = {
 		.name = "qcom,nsscc-ipq9574",
 		.of_match_table = nss_cc_ipq9574_match_table,
 		.pm = &nss_cc_ipq9574_pm_ops,
-		.sync_state = icc_sync_state,
+		.sync_state = qcom_cc_sync_state,
 	},
 };
 

-- 
2.54.0

