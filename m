Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7581A379978
	for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 10:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771929833; cv=none; b=ia5V5VV+TOjG57f1oNcvxFirEq5iOK2H50L0xx88M5VjlLV/JN2CrXi1HKQQghQiiduqQrZFIrhmSCJcUK5jV/xwbjZw0IOFyLKPxPDJPhV3X82UDuTxT/baNJw6uSQOo/FUug/AoTpIcK3TRz8HADYoshQNdysgNaVHWzIV1Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771929833; c=relaxed/simple;
	bh=rdvBOwT1w+fOKzKlMJ4qCaqyF5VXzQXu8RFGhV4wPWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XhPnPUXINFNuKlD6hjDFJ7tUq1koPz4F1Iu8xoAuxtTshQ+Y2xs6+0oYf5WJAsWTdcdu0wTC2pKUxuuqp42OGWOIrf1/gLUTxROwCgLSssqiat7bQ3HkGzfGVTUVa23IR23zMFesL8OGQADcQ7U6ELKWDaaBW7eKFCM9PLpst90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4DOzgVA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dw+dG3XU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4DOzgVA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dw+dG3XU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFKZ71774402
	for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 10:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dcx9Fb9RAhIPBMtW22u+1jg9hETgYE9w0yg+16sdIuA=; b=H4DOzgVA83UHDgOM
	VVUnvWAYTLNOLPanpo4QupRYaWBh1QxF944TCbYx88pbymRFzDVawGttNM0lIv1N
	OAIJordGF5UDSK/c+qa+HpzR/3laOnj+Vq8+dUUI6f0+VqjvNHoF9NNbgs6slhDn
	usF4sPZ2ZO1C8eEJPwL6rd9Nk0CNGDVcflRdQref2T9u/ORNXr2kIbOTL/WYf9zX
	93cyZ8xqZ3nx25GYa0Kyx8g5utiIACl349wERwD/2WxWT4ConMD/lA+AwFBwhfss
	Z77+KjN/3XFhyxvVhpVf3xhAcQIDrzVrD8WMt0Bfl6Nz0Qc5Uu+NGFcxFtEbxr6A
	o6MMGg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj8bmqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 10:43:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3fae6f60so6041974385a.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 02:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771929829; x=1772534629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dcx9Fb9RAhIPBMtW22u+1jg9hETgYE9w0yg+16sdIuA=;
        b=Dw+dG3XUQUm/PHFpMKyHM8ZqNyUBhAV0OLKIOp3C1KQZgiCiMZm0nejujuse6sDy83
         gg9GBBzlL1nO0vzkMsbjXpT7RcspqsQxIAhSvit6lpUJGv5gkelMcMntBJbm+qQr+UG+
         19w5dYgdkanqXnu63H0mw6k7NVFrl6XR4j5iID4RBoQbbRTOWEL6Zp+stEP8Dl+O569B
         RXcWYiD7a10yU+Zusc/ACVjeNSYcOx4qdXci0k7H24m9mhmje8gTE8baptXutAWZEU8a
         zrJYlPG+cNEt6nxY1QcGUC5RG4XvWg1OihVXLPmI6LyRw21fyoWqsritMl30UOM2Z2aT
         shzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929829; x=1772534629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dcx9Fb9RAhIPBMtW22u+1jg9hETgYE9w0yg+16sdIuA=;
        b=S5V3+MGHi6h5X7kexWaOlOW9Bt07AZCuY8Ao+JMZ+P2BZoPIcvxoRVd5cqRpU8JSBi
         HBizajFzTKeASDax1NZd1yF/j8/vUnu9p2t5kNVNfgODqJvgsnwKpQJyGeCo8s7Yganc
         mC/vrX+rkJ9HyBwI/IAxRFcZM0B1ARR6+QKkKkRp/e6Aoyt1DbEr6evfzd/fu/VwcYPx
         7e+vP4oSqfMfJqi6AO8YsBrSeK7ZoB1Jh/ahNU7I7y1nz7r89iKbEJ3Rl7OncN1KHZ3g
         9DMF73s6jELXQeEHfE1j1zemt5g1OJE8LPIzSYLt8+Acq4gT1dZQqo4Pfq8+8RjdSw7z
         XKaw==
X-Forwarded-Encrypted: i=1; AJvYcCW4t/k8vKHsD7GmCpbzwZmKu8/jJGlZgJGoMVkd93cZG4WoUskDbGc8gRay00DJt22zrS2B4rsRj/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmrWpyM5ywG3hPqwAVThMw7St37yU6M0dmN/Rv9vrqZdX7ZLaA
	EMUT90Tke1+Ujo8wg2V5xv7qm2whf4pIw5LmJgVN+glCOKLxA7ViL65rvYM3hinVyGnS+XSQAoN
	otKUVzgur9qCHCyWXyTSKh90IvaO0H8eWaQml7sqhmdb64/Z5M/taLI/K9exNLb0=
X-Gm-Gg: AZuq6aJOQ53osR8BH/lh661BCHW5vyoYMJXKTMW2kvd0uV1ZzIxtZ+UqhM0ZQRY+NAi
	cNtp0wliBEN6VJdovojFq3vxg6kClyTF/k0XjVaXT88kyGQZJT0ljn0V4WmQPbw+NkgKCT9hRCS
	pFPtmWyxg9CfY4yv5IjKnhmJDroT5JO5QATT2Sd2Mdipx5WdYYVWn4TYdBwcxeSBMwUNq3ba41k
	Nn1yXE+dtWVXc8rX+IE5J2FWfbAZJiVs4T9rBCmU9Lw/zbwMQ21VBiocUWyjvBZKTb83L1QdElK
	IyD3CJsu6bNjLMOcSWgCFCE6aAEFRGbCaNviwUanQR8R51ApsL5O6BqAkKc4GQU0WDlSl4tMVpp
	fuMaNQtlNMjjxs96KNg1CAilFeTgklUfe/mwB8Vr5BGVoDg==
X-Received: by 2002:a05:620a:1a20:b0:8c7:110e:9cd5 with SMTP id af79cd13be357-8cb7c02208cmr1910192985a.45.1771929828421;
        Tue, 24 Feb 2026 02:43:48 -0800 (PST)
X-Received: by 2002:a05:620a:1a20:b0:8c7:110e:9cd5 with SMTP id af79cd13be357-8cb7c02208cmr1910190885a.45.1771929827852;
        Tue, 24 Feb 2026 02:43:47 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d40004sm25685906f8f.21.2026.02.24.02.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 02:43:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 11:43:39 +0100
Subject: [PATCH 1/4] firmware: arm_scmi: Drop fake 'const' on scmi_handle
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-handle-not-const-v1-1-90bf93b53e27@oss.qualcomm.com>
References: <20260224-handle-not-const-v1-0-90bf93b53e27@oss.qualcomm.com>
In-Reply-To: <20260224-handle-not-const-v1-0-90bf93b53e27@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11852;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rdvBOwT1w+fOKzKlMJ4qCaqyF5VXzQXu8RFGhV4wPWA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnYDdTaa70Ye5luvvU/8VfllC+pftv/qtWoBPV
 3buBcqZcgeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZ2A3QAKCRDBN2bmhouD
 1w8QD/9hJgj7Ium0TabC0RFOre/lPkhH80ZbNT0C7u3H72t80b9a9oXATiFxDqfMFn7onM2QmAQ
 M4iQ2VLzIT5u2i+dE85kbk7w7BD0HDHX8iTDl44DDfudhhOlhZIf+qq4A+cd+MRNHv7FoB4mSH8
 TK1K6BTOytpaQM7P8BDz/qeN19Guercv31IYV/0yQVb++rV3G/CiRM1vVjiGs+MCN/9bPxteGyE
 q2vKegAYvp0KMqdMme8RCTB990GeOcrj1aaKnidRgBo7hiAgmWf1aTSU4gp4zKKYWH4rkM5+7/A
 GFECFw2Mfp4QPs993wWOYvruO0jWC21EdKKZ8hQDe8z7QAczC8IdyKIUsBYI88ocldlc1W5k8LN
 ItvOLcSqCrUmIgd7jzTEkUComIAui37o4BAndrsxHN+bRa2AcB9pd2Tu9/2VeUOII88WUFYMXDM
 D08TbnJtqxefQAH6hKwHG3Dt2RO/P9xlmJNL9qNv9/KIE0/XPzBIh+VHyQ7oix0ifPWH82/8N5R
 m6I+MXPgn/artpE+JEa/PQl8qaVMuywYXgLCvNg3OtNb0ABfYVXppKDZt8or7dPZb5MnBGlGWaQ
 Kfiv7JuRUsLv8gHLiLKG2JjlbrMTpWL677RuQ1Mvy9LGMr6CjJtSSCsFy8IuDsVTzc1+qrymRNx
 M4z9//C0G6j43wQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4NyBTYWx0ZWRfX8wBeEFM+xHui
 FPY7fEjuKj+EepdxzcpJG7VgBhX9q2UTGK3ORs8wqYGAWctJFKp5GnJGFt8EKlqClW6qyrbtiCU
 NLjst2hrZBqnhoZSJw3v34KpRmQDd7pR+FctNewIPBkqwBUrTItYwFroy16XhM9dTMsDnYiDbi2
 nxSrUuY5RIDfN6+xJ85Cp4KCOnJUOfk6CjmU9qt0ezIrgNu+HN0HG8n3ZgfRL/2fc1zpJ5NTSTV
 HZMXtpohHJQ04A8h6LI7+getIH3Rap5JGmv7n9ceXpFfs/4jeJIQ8XsXJmXIi14+GkcsQvpylGd
 nSdKZRSfTI3ByW+YecwOvxpVStujqLDFFq1a5AsaW5k2k4O2x6XEFlj/099Dt/rr92RWa4CML45
 Uz8hfYXdADEqJkqcUFWZsee2m2+GUGiWVJpZVxGrgTwL1GimKKSgzYgyyLy2kHizBy0ADaFRPI7
 6VkU4I+bkneOffBHZUQ==
X-Proofpoint-GUID: RK4gheC6vQ1NvOrZOvd7atHTFNMFNIxn
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699d80e5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YWpryjrgZ2of67SKuAYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: RK4gheC6vQ1NvOrZOvd7atHTFNMFNIxn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240087

Severale functions operating on the 'handle' pointer, like
scmi_handle_put() or scmi_xfer_raw_get(), are claiming it is a pointer
to const thus they should not modify the handle.  In fact that's a false
statement, because first thing these functions do is drop the cast to
const with container_of:

  struct scmi_info *info = handle_to_scmi_info(handle);

And with such cast the handle is easily writable with simple:

  info->handle.dev = NULL;

If the function really was not modifying the pointed handle, it would
use the container_of_const() call.

The code is not correct logically, either, because functions like
scmi_notification_instance_data_set() are meant to modify the data
behind the handle (in containing struct).

The code does not have actual visible bug, but incorrect 'const'
annotations could lead to incorrect compiler decisions.

Fixes: 3095a3e25d8f ("firmware: arm_scmi: Add xfer helpers to provide raw access")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/clk-scmi.c               |  2 +-
 drivers/firmware/arm_scmi/common.h   | 15 +++++++--------
 drivers/firmware/arm_scmi/driver.c   | 26 +++++++++++++-------------
 drivers/firmware/arm_scmi/notify.c   |  2 +-
 drivers/firmware/arm_scmi/raw_mode.c |  4 ++--
 drivers/firmware/arm_scmi/raw_mode.h |  2 +-
 include/linux/scmi_protocol.h        |  2 +-
 7 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 6b286ea6f121..f9efe14a95ab 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -405,7 +405,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 	struct clk_hw_onecell_data *clk_data;
 	struct device *dev = &sdev->dev;
 	struct device_node *np = dev->of_node;
-	const struct scmi_handle *handle = sdev->handle;
+	struct scmi_handle *handle = sdev->handle;
 	struct scmi_protocol_handle *ph;
 	const struct clk_ops *scmi_clk_ops_db[SCMI_MAX_CLK_OPS] = {};
 	struct scmi_clk *sclks;
diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 7c35c95fddba..a18babacebf2 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -154,8 +154,8 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 				       const char *name);
 void scmi_device_destroy(struct device *parent, int protocol, const char *name);
 
-int scmi_protocol_acquire(const struct scmi_handle *handle, u8 protocol_id);
-void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id);
+int scmi_protocol_acquire(struct scmi_handle *handle, u8 protocol_id);
+void scmi_protocol_release(struct scmi_handle *handle, u8 protocol_id);
 
 /* SCMI Transport */
 /**
@@ -277,13 +277,12 @@ static inline bool is_polling_enabled(struct scmi_chan_info *cinfo,
 		is_transport_polling_capable(desc);
 }
 
-void scmi_xfer_raw_put(const struct scmi_handle *handle,
-		       struct scmi_xfer *xfer);
-struct scmi_xfer *scmi_xfer_raw_get(const struct scmi_handle *handle);
+void scmi_xfer_raw_put(struct scmi_handle *handle, struct scmi_xfer *xfer);
+struct scmi_xfer *scmi_xfer_raw_get(struct scmi_handle *handle);
 struct scmi_chan_info *
-scmi_xfer_raw_channel_get(const struct scmi_handle *handle, u8 protocol_id);
+scmi_xfer_raw_channel_get(struct scmi_handle *handle, u8 protocol_id);
 
-int scmi_xfer_raw_inflight_register(const struct scmi_handle *handle,
+int scmi_xfer_raw_inflight_register(struct scmi_handle *handle,
 				    struct scmi_xfer *xfer);
 
 int scmi_xfer_raw_wait_for_message_response(struct scmi_chan_info *cinfo,
@@ -522,7 +521,7 @@ static struct platform_driver __drv = {					       \
 	.probe = __tag##_probe,						       \
 }
 
-void scmi_notification_instance_data_set(const struct scmi_handle *handle,
+void scmi_notification_instance_data_set(struct scmi_handle *handle,
 					 void *priv);
 void *scmi_notification_instance_data_get(const struct scmi_handle *handle);
 int scmi_inflight_count(const struct scmi_handle *handle);
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3e76a3204ba4..8b27e74d8a19 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -438,7 +438,7 @@ static void scmi_destroy_protocol_devices(struct scmi_info *info,
 	mutex_unlock(&info->devreq_mtx);
 }
 
-void scmi_notification_instance_data_set(const struct scmi_handle *handle,
+void scmi_notification_instance_data_set(struct scmi_handle *handle,
 					 void *priv)
 {
 	struct scmi_info *info = handle_to_scmi_info(handle);
@@ -638,7 +638,7 @@ static int scmi_xfer_inflight_register(struct scmi_xfer *xfer,
  *
  * Return: 0 on Success, error otherwise
  */
-int scmi_xfer_raw_inflight_register(const struct scmi_handle *handle,
+int scmi_xfer_raw_inflight_register(struct scmi_handle *handle,
 				    struct scmi_xfer *xfer)
 {
 	struct scmi_info *info = handle_to_scmi_info(handle);
@@ -730,7 +730,7 @@ static struct scmi_xfer *scmi_xfer_get(const struct scmi_handle *handle,
  *
  * Return: A valid xfer on Success, or an error-pointer otherwise
  */
-struct scmi_xfer *scmi_xfer_raw_get(const struct scmi_handle *handle)
+struct scmi_xfer *scmi_xfer_raw_get(struct scmi_handle *handle)
 {
 	struct scmi_xfer *xfer;
 	struct scmi_info *info = handle_to_scmi_info(handle);
@@ -757,7 +757,7 @@ struct scmi_xfer *scmi_xfer_raw_get(const struct scmi_handle *handle)
  * Return: A reference to the channel to use, or an ERR_PTR
  */
 struct scmi_chan_info *
-scmi_xfer_raw_channel_get(const struct scmi_handle *handle, u8 protocol_id)
+scmi_xfer_raw_channel_get(struct scmi_handle *handle, u8 protocol_id)
 {
 	struct scmi_chan_info *cinfo;
 	struct scmi_info *info = handle_to_scmi_info(handle);
@@ -820,7 +820,7 @@ __scmi_xfer_put(struct scmi_xfers_info *minfo, struct scmi_xfer *xfer)
  * Note that as with other xfer_put() handlers the xfer is really effectively
  * released only if there are no more users on the system.
  */
-void scmi_xfer_raw_put(const struct scmi_handle *handle, struct scmi_xfer *xfer)
+void scmi_xfer_raw_put(struct scmi_handle *handle, struct scmi_xfer *xfer)
 {
 	struct scmi_info *info = handle_to_scmi_info(handle);
 
@@ -2202,7 +2202,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	int ret = -ENOMEM;
 	void *gid;
 	struct scmi_protocol_instance *pi;
-	const struct scmi_handle *handle = &info->handle;
+	struct scmi_handle *handle = &info->handle;
 
 	/* Protocol specific devres group */
 	gid = devres_open_group(handle->dev, NULL, GFP_KERNEL);
@@ -2282,7 +2282,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
  *	   NOT be found.
  */
 static struct scmi_protocol_instance * __must_check
-scmi_get_protocol_instance(const struct scmi_handle *handle, u8 protocol_id)
+scmi_get_protocol_instance(struct scmi_handle *handle, u8 protocol_id)
 {
 	struct scmi_protocol_instance *pi;
 	struct scmi_info *info = handle_to_scmi_info(handle);
@@ -2317,7 +2317,7 @@ scmi_get_protocol_instance(const struct scmi_handle *handle, u8 protocol_id)
  *
  * Return: 0 if protocol was acquired successfully.
  */
-int scmi_protocol_acquire(const struct scmi_handle *handle, u8 protocol_id)
+int scmi_protocol_acquire(struct scmi_handle *handle, u8 protocol_id)
 {
 	return PTR_ERR_OR_ZERO(scmi_get_protocol_instance(handle, protocol_id));
 }
@@ -2330,7 +2330,7 @@ int scmi_protocol_acquire(const struct scmi_handle *handle, u8 protocol_id)
  * Remove one user for the specified protocol and triggers de-initialization
  * and resources de-allocation once the last user has gone.
  */
-void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
+void scmi_protocol_release(struct scmi_handle *handle, u8 protocol_id)
 {
 	struct scmi_info *info = handle_to_scmi_info(handle);
 	struct scmi_protocol_instance *pi;
@@ -2372,7 +2372,7 @@ void scmi_setup_protocol_implemented(const struct scmi_protocol_handle *ph,
 }
 
 static bool
-scmi_is_protocol_implemented(const struct scmi_handle *handle, u8 prot_id)
+scmi_is_protocol_implemented(struct scmi_handle *handle, u8 prot_id)
 {
 	int i;
 	struct scmi_info *info = handle_to_scmi_info(handle);
@@ -2388,7 +2388,7 @@ scmi_is_protocol_implemented(const struct scmi_handle *handle, u8 prot_id)
 }
 
 struct scmi_protocol_devres {
-	const struct scmi_handle *handle;
+	struct scmi_handle *handle;
 	u8 protocol_id;
 };
 
@@ -2525,7 +2525,7 @@ static void scmi_devm_protocol_put(struct scmi_device *sdev, u8 protocol_id)
  *
  * Return: True if transport is configured as atomic
  */
-static bool scmi_is_transport_atomic(const struct scmi_handle *handle,
+static bool scmi_is_transport_atomic(struct scmi_handle *handle,
 				     unsigned int *atomic_threshold)
 {
 	bool ret;
@@ -2582,7 +2582,7 @@ static struct scmi_handle *scmi_handle_get(struct device *dev)
  * Return: 0 is successfully released
  *	if null was passed, it returns -EINVAL;
  */
-static int scmi_handle_put(const struct scmi_handle *handle)
+static int scmi_handle_put(struct scmi_handle *handle)
 {
 	struct scmi_info *info;
 
diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index dee9f238f6fd..bfc1d57ce052 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -1464,7 +1464,7 @@ static int scmi_notifier_unregister(const struct scmi_handle *handle,
 }
 
 struct scmi_notifier_devres {
-	const struct scmi_handle *handle;
+	struct scmi_handle *handle;
 	u8 proto_id;
 	u8 evt_id;
 	u32 __src_id;
diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 73db5492ab44..efae99febdde 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -172,7 +172,7 @@ struct scmi_raw_queue {
  */
 struct scmi_raw_mode_info {
 	unsigned int id;
-	const struct scmi_handle *handle;
+	struct scmi_handle *handle;
 	const struct scmi_desc *desc;
 	int tx_max_msg;
 	struct scmi_raw_queue *q[SCMI_RAW_MAX_QUEUE];
@@ -1210,7 +1210,7 @@ static int scmi_raw_mode_setup(struct scmi_raw_mode_info *raw,
  *
  * Return: An opaque handle to the Raw instance on Success, an ERR_PTR otherwise
  */
-void *scmi_raw_mode_init(const struct scmi_handle *handle,
+void *scmi_raw_mode_init(struct scmi_handle *handle,
 			 struct dentry *top_dentry, int instance_id,
 			 u8 *channels, int num_chans,
 			 const struct scmi_desc *desc, int tx_max_msg)
diff --git a/drivers/firmware/arm_scmi/raw_mode.h b/drivers/firmware/arm_scmi/raw_mode.h
index 8af756a83fd1..49895b81bc3b 100644
--- a/drivers/firmware/arm_scmi/raw_mode.h
+++ b/drivers/firmware/arm_scmi/raw_mode.h
@@ -17,7 +17,7 @@ enum {
 	SCMI_RAW_MAX_QUEUE
 };
 
-void *scmi_raw_mode_init(const struct scmi_handle *handle,
+void *scmi_raw_mode_init(struct scmi_handle *handle,
 			 struct dentry *top_dentry, int instance_id,
 			 u8 *channels, int num_chans,
 			 const struct scmi_desc *desc, int tx_max_msg);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index aafaac1496b0..17095e41f5c6 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -909,7 +909,7 @@ struct scmi_handle {
 		(*devm_protocol_get)(struct scmi_device *sdev, u8 proto,
 				     struct scmi_protocol_handle **ph);
 	void (*devm_protocol_put)(struct scmi_device *sdev, u8 proto);
-	bool (*is_transport_atomic)(const struct scmi_handle *handle,
+	bool (*is_transport_atomic)(struct scmi_handle *handle,
 				    unsigned int *atomic_threshold);
 
 	const struct scmi_notify_ops *notify_ops;

-- 
2.51.0

