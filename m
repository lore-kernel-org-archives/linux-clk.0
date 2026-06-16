Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D386D302753
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 21:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644234; cv=none; b=cicsZfyrCTAdeo5UWaSj5rYr4dSByjdvyXE1/kqP0NF6khrYUHFUzb4WI5/8Tby6Sl62sw0YkqnUiwqRONktrx87ueezZ27fjL1i/IHoJK9YkM86j8nHzICa3g1uDcI+eR5iDFkY8rAcFpkSH02XTLIXpF3KrdOqbwJCEheCTDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644234; c=relaxed/simple;
	bh=eMoTK+bIbn5q4aLSjFVKXEZSKREFNs1FielfOnTbbHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H+ZZBrctUP3wFsa0tdq6jqJ/GdhuqaPi6znVxH2GJF8S0tUJvklbK5bKTtrp2zcuz8aVoAtHLoy0Wz3VBPBtEZPYO0ud+9SUB/Oa47LAEzKGNcDUwBROcaTvj7aqWDxd7H8fLdLPiTcIj+h/LHftb4XmrJa/G1RD/W+WCYIWtbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eXcTgnzt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FCUs2vg0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eXcTgnzt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FCUs2vg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781644232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vneDLhYFcib2vVIUkHKPcJhJE+JxQ4d0dzvHuaT83ZA=;
	b=eXcTgnzth7jLtE1qVWjvNTkSBcd5Q/hEr0VnE7ZWOAXkR2B6j8jyZZ/hEi1eaQVGRKxvNC
	cAp/0pkGxdPuc8hPjbSOt02UFIp+Xqc6C8quNasdRJc2hEC1NPqz935a198cseGkWaRxDs
	iq8D5VtdTjdhneEcwDq3G5CqmbiuYx0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-qYdXZikiPVWdF-CE1IKWwA-1; Tue, 16 Jun 2026 17:10:29 -0400
X-MC-Unique: qYdXZikiPVWdF-CE1IKWwA-1
X-Mimecast-MFC-AGG-ID: qYdXZikiPVWdF-CE1IKWwA_1781644229
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cceaca5671so102684556d6.0
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 14:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781644229; x=1782249029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vneDLhYFcib2vVIUkHKPcJhJE+JxQ4d0dzvHuaT83ZA=;
        b=FCUs2vg0bGoRed0M55LOgmDRSGmZu0PHeqy9ERHhpc/3eYg5RakifCWYeHTbiC37BX
         rys7qFpdEVkn45y5gDnKmIBxzjvgoPtHghshZyYVTATF8vo1pk7eRHUAzt3wDFcfLpMp
         g1xst5LrtGCfkliZv9oNPRtFkC53Qkqc3TG7FHfVOMuR+mEHM3rJ/ZQ0P2HOqxMQxbu4
         6SVuSM9LRnpiOhfpz1fuoONuVZ5UpwzU37k8ayez7oUk1PN3kKzJNuRy16rdbDp6vfMf
         GLw9a3e2OUkYtAyD+J73oVpibKeWoo7IJjB1sk5spUBhmoOce47ZfUnhWz9Qbe/andhE
         w+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644229; x=1782249029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vneDLhYFcib2vVIUkHKPcJhJE+JxQ4d0dzvHuaT83ZA=;
        b=T0PA0Hn1p/vwKIayn474ClNIUUR47piCf3e9QZD31ufE1lluZtkrH6poFCdf5a6Vcz
         jda4yNPiwJ6nJqfj4fmpqsX36ZP6+0hVFryWgfo55Uv0uN+I1s6pQR8gKEFJ6zBsFSkG
         HBI0uHtp0+1mpGQL95O1k8zA8utEOOhCAXY7OAnG3SJULYuJCxYDb7YS9a0yx1kkXJiS
         HPT+c20VFz+BT3acX4dqlDeD9/twe1DELIAJDuYujduNw0vTJL+ayOLV9PX98iFtiG3h
         CTdFIhS5v0cGsTvJYJ84MSK25O3tLFkxfJm7DInMc5I7Vu8OVILrJDWHWnA8zjgpCuvo
         N30A==
X-Gm-Message-State: AOJu0YxDdF9R4VOyqNMOqAorfqZ8IJGU/0YTb4OArCXz2t8tSIlgM+1m
	FhsPzEB9RiscSZH/17S5iYeLXfRzR0F87a5uMiNJod8XenD+dxTL3BazgfD6tKS355JfzZuin+i
	0EpFlfGR1UihwWCFdfPHrp+xHPaDDC5AEWO27MsKj99GoYG/L7qwuhJ1PIw+EyQ==
X-Gm-Gg: AfdE7cn69RVkY9tycV31xeRt/kbg17TLYYiz6dPNgst6UNgMratihFargujj3vStcG9
	p5FWRR6AG/0w3qCFhmltlCF/exRYXu81YE+jZG1GkofjgdD0COGDBlViJ1x3VY3twuG8dNKor2f
	s/MEq9FBUBtllZgkhgo5b8r8vHD11vTZMGM06WxfR5CuP7Xiep+3v62AtDKdh9zqgaQV4TEBP47
	+DFvU+dmn/HFadMSWpyccc6HwQ35mc6iuHjuGlKvCwhq0xh+UStNhzuoygv3N5GtK3mNvS1yAAd
	bdFn1XB7MCd07noGU0OTwqQTuWroBlQoPF+Nw/P+FfkPZopccf54syaCr97qc0e3wbp35IJs1gQ
	jMPD6igAeEeMA/QGnx4wFBFhojwMuXVk1YSihMtAzjY1hL0O7X7wY5ZHjo3xMWg==
X-Received: by 2002:a05:6214:dc1:b0:8b3:fb6a:d370 with SMTP id 6a1803df08f44-8db6014086bmr21368496d6.37.1781644228922;
        Tue, 16 Jun 2026 14:10:28 -0700 (PDT)
X-Received: by 2002:a05:6214:dc1:b0:8b3:fb6a:d370 with SMTP id 6a1803df08f44-8db6014086bmr21367946d6.37.1781644228451;
        Tue, 16 Jun 2026 14:10:28 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f122b21bsm43742846d6.4.2026.06.16.14.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 14:10:27 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 16 Jun 2026 17:09:45 -0400
Subject: [PATCH v2 3/5] clk: qcom: convert from icc_sync_state() to
 qcom_cc_sync_state()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-clk-sync-state-v2-3-15f82c64d95c@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4666; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=eMoTK+bIbn5q4aLSjFVKXEZSKREFNs1FielfOnTbbHY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIMd+8uM1e9c3HN8l11ii8Y3HJdT5uEzXApkrrZ5yYRt
 /bNgtzujlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACYip8nwP6xGWeiE1WrvfKHu
 8lXvnpx9dfb+TJ8DHzQ6DnXfr9R/HMbIcDSpd3tOu1bxjaMs6VnXtyX/MstLzv6cXvFSsrbVvP4
 vLwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Convert all of the qcom clk drivers that use qcom_cc_*() from
icc_sync_state() to qcom_cc_sync_state().

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/apss-ipq5424.c  | 3 +--
 drivers/clk/qcom/gcc-ipq5332.c   | 3 +--
 drivers/clk/qcom/gcc-ipq5424.c   | 3 +--
 drivers/clk/qcom/gcc-ipq9574.c   | 3 +--
 drivers/clk/qcom/nsscc-ipq5424.c | 3 +--
 drivers/clk/qcom/nsscc-ipq9574.c | 3 +--
 6 files changed, 6 insertions(+), 12 deletions(-)

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

