Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3D537996D
	for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 10:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771929833; cv=none; b=twXAcupwfg3WTDbapLYQFPCfao0Yi2fxaTUa1i0xmI16MiPFI+DchNyot1YHBurJ9bIdDHstNrepnl2Z2bLJA2x6wjf7tkMSF7qvZITlGSHDXYUrt2bYWNaEIOA1Uq9gEyPX4uZCQqxH5Wn2GXDDnFXEee3k4Hw7o1MczVATpM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771929833; c=relaxed/simple;
	bh=MtfFLt1YenfsJ/wZknYcaqCTSZ5/bjAtaD9/JYLsnnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KZqe1ICKzG+HzyxytZcYxSz7TehQkBZsGC2tfqQK0778mLqicUbYhJubRfN981Dcnd6MrFSLWKn3D9yty5i9k7GMQ2kIKm7v5+yozInK6iUfG92E0M0OGa3LbC3nJ2YSMD8AVQ8MnAKSRs8Cqpqzur4JgyfLW3l6NNoKGfwbEp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cPaYdboO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=khh1HqRR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cPaYdboO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="khh1HqRR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFMSv2220721
	for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 10:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EN2/oaoWAN9Y1ndJ/NXYNONg9LQ3Nd3Tzaq4ZTvo8i0=; b=cPaYdboOJOtS7ulU
	F+gmThGKKzIQQpHO32G4tCZofOrtl9Mi2ccHv8fQvLAU/099SCESdOMAFH0fwKej
	zJl2i4yGVsFdd5z19P92egoMpiiwNytSOy0YhTEmQxRT+AUAzmLcHvtT+i65X3OH
	cdaxxg4u5xDucaSg5G3VNLGRkEos6yVnDW9tiSw72U4+kS3H4s0bCoXRWBOsfjf6
	1Eio3U5VXiHlqR7tQA3td0DkGrHFfz3To2anQ0yZjclAcPR5d9UCC+EVBe8vZBTu
	dDc85W3rc30lHjSFhzCHfMq6PdQllFDq8A1k8beM0Cz0ap/5hP5YA9uINV2bfkgF
	UVbMGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e395ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 10:43:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a2eb984so2630148885a.0
        for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 02:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771929830; x=1772534630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EN2/oaoWAN9Y1ndJ/NXYNONg9LQ3Nd3Tzaq4ZTvo8i0=;
        b=khh1HqRRAvX6WGjEQQyoCkGOYmnwI7FfZhHZsp7xvMvulcoyrnLGIWCLWzedU5YJqA
         KIy1YKafut3Z54KcOcrJ7lE3FX/o0giIpKlwIssovLLMqq1oPnr4nqk7vafVU5fiGJa1
         PyCr73KwX4d4wnMzetZ3VoDzXAimWrW5sQ6ITGASFCfCm4apzeqM7zzPHzCqT5rs/3xl
         GID9qy8e91X4jFUskxFvHm3Ohw10PTjtajJgWyhAATjQeSfta7+ehpNV9TiyL8CU59a4
         CJSPoIOAaP/60EMsR9cYwFEH6KwwZLO0FLrNy3O2Z7Rle26FXVoq/6ASam7k9ZiS5/eP
         8r9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929830; x=1772534630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EN2/oaoWAN9Y1ndJ/NXYNONg9LQ3Nd3Tzaq4ZTvo8i0=;
        b=JQ9E2FRemx/Q11bEUdK0dYHQTITHGQ5HyIumABxcJl7cYiOV1zYELk5m3F/Lkp5dZ2
         A4t4ygFWauUErbofZ6KnHd9hTUtANZn+Abk4W0pJX4O2GY1FSkAoE9Tp/AUG0X66uZMS
         HnwV17MBliN7IjWvnkpltMXIFaDi2+ua0wIHs8JedttXmIO3QliDJ19ldDE/I12UIgrS
         PbJjo10b5eOyDMNFsC5rBCSuu9/872l0jIZvp4K6aZrC5TcFJlbaG+7q25TWmjDHrErt
         pl96kTNvBfhuKg13aKWsuRxloySp+r4N3jkv1dVe0+TcJG/wpdfWKZ2tWcExbawOQmP4
         xSug==
X-Forwarded-Encrypted: i=1; AJvYcCVSlnkBwanlbZha9zDOjVwAIXF0QYAKXwMb+OZyraYHXvhO3R4Ib9NhfbV1Cx9H4JeGUNFex3CpUV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuRiqWELaVI50rKtAGQ94xD3IDvlDi0ZlboYO6XN0j+9qFW/++
	dEZlNuvPHs+FY+3pYj/EEVN4oHaTZ5eQPfFar7ZuUODJyqvb/KrVQamnVSM9jUnBEb/3frOjQMq
	s88ulfkkThO992ry0mPsp/8wrUVTiGkHvEMgv9i8qcuX1gMH7n5NGLXpecAOMUXk=
X-Gm-Gg: AZuq6aK769uqE1JY01p1pdUKEXL0DY5G1qzOoHZtECC9w/lheL03OCVV11b7Suzhu/7
	RTRk4UF+KhzsJgY7n9BOz66b56SA62LfXQwpr6jL8nQ/J04qlaFT5GIYm+vWNVKNY6YaURJcuK4
	XdUJMRSjf0a7KXgLuoyyuUNIxD8NPwXpIDhXrJ3uV+BLRKTs4ME0BqFP4/o0/sRVIbQXKgFm3I8
	WVnN5x9xsh3s/Wk51/ajFd8SI4ZKrJ7KXiEBiKa2e/IfyxRtSdCp8JqkL2r8LHyIGhvKqfFOEdR
	/dMCnszpSiUbu8rpAqhk/6CO0LU2K7d1FgXn/Xsy5l/A9566SCCuUV0cMb3quaXDi8th6Krm6dB
	mJ2JeNxoKLPW1xL59qrwkqaEAnbR8pWO566dUMVPCXFpWNg==
X-Received: by 2002:a05:620a:1904:b0:8b6:1877:3689 with SMTP id af79cd13be357-8cb8ca14a2amr1432280685a.35.1771929830377;
        Tue, 24 Feb 2026 02:43:50 -0800 (PST)
X-Received: by 2002:a05:620a:1904:b0:8b6:1877:3689 with SMTP id af79cd13be357-8cb8ca14a2amr1432278985a.35.1771929829895;
        Tue, 24 Feb 2026 02:43:49 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d40004sm25685906f8f.21.2026.02.24.02.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 02:43:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 11:43:40 +0100
Subject: [PATCH 2/4] firmware: arm_scmi: Drop fake 'const' on
 scmi_protocol_handle
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-handle-not-const-v1-2-90bf93b53e27@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11774;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MtfFLt1YenfsJ/wZknYcaqCTSZ5/bjAtaD9/JYLsnnQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnYDenvwWp+Df+vhEBzfsFyDfJYzjKv/jlKST0
 85yGntKMS2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZ2A3gAKCRDBN2bmhouD
 173fD/9N+O5OTQ5QmfRdqz4D8cWMNwN9LGcibNK0uSezOak//l35xH2ZllrAQyk+rUU2Ewv5+US
 r9O02OyXEQhwZwffW1KGyRq/4JNwVBEPwoZrZ1HacFOiZuvrmIGa4nh4GpRu0eWMLD3giALvetR
 yweybtVUR/g9ghF3ZueROwSANuwdXseWdJFrzFK1nbVe5+pgBxS5nSF3q+kZn5yFlZUHoxbG4aj
 wOG7mGHSgM5RH54+SITR3DaeN+3b9aQPl9yUUyZUHNmUaXiN6RaN3ERcnYli3rOJBNj6aDdBrPj
 Vfpz2Ap5Hq47Q7kOQ27q6aXQk6fX4LQ+ItKiF8mPCHgt6htCiPRm36/k3AN8+hgbX4JVvwWyAbp
 sOuMcleIy+/OtH6CxTmsnRXCniOuXof2YZybukRFER8fjoh7J9Ej2SlpOZkHK9OWgGfC7GS4nrQ
 z8UinGGV5GDZZtAr37unCsWVhqh6EyhsyjYi+MdIHBwAkUE+pXPbvgON25368JXxtPQQ81jg1If
 wUdByQT0kNOLAJHelHoXC4GJTSYco88WUFKlPAn1eUE7rr0TJOdCph4OReDaDOSga856jDVTLeE
 Bt0GCCTu28sMiLuwwKCoqj3NiEBeRSX3mcsMwIPJfBxtPgDS/izQuTZ8GcWChKl8FBI/R9drC8j
 TUEjhd4poi1gumQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=DfIaa/tW c=1 sm=1 tr=0 ts=699d80e7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QOiUi5lJWKzMiGfd4uMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 1pFLzWMs0kqVysrCKiRu3Ao_ZMr7LU-J
X-Proofpoint-ORIG-GUID: 1pFLzWMs0kqVysrCKiRu3Ao_ZMr7LU-J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4NyBTYWx0ZWRfXzhgV0sAGD9p2
 VA1YXCIcR9mQ3liyPUNk4y1qWsiQzL0f45TlSYgnj4xFFriKg4m1JKBQnHZ1RjUWxA1LP7J/V7h
 +o++EIEa6JxcTeBg28qC4m81Nu941E9fgn8CBzutDLIJi6hIuBu14w6HNLCgwVhT3Jhq7nTcjEz
 rztMInrHbk+8CYMcph238UQeHPrXblGAcr6mxAlH1UfcemrdciJmGZW1xsqn9s4ORmjNPR1kqOT
 BfIRweUbiZ2+v/qkSkd/Obu2oqJnTkv/DQKaepVopROC24dyBL5W1gSWEVm3W9FOAarxIEM0sVM
 ZjhGJ3xE5FUSsKJNKkEcxZMSyWM3+/Qdfz05NdQ2ja+mgUmPcmdQsQr8aANBXjuk0GBzjfoeSdp
 DyuNA3Uk4RACoM/BUkgjXMn36aDhXhD48/8e+iKfKbBNzsusBOaSxngisPbHqCajp/D+EDfJ7Ly
 1lBJlNEsuatjNuWcDHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240087

Severale functions operating on the 'handle' pointer, like
scmi_set_protocol_priv(), are claiming it is a pointer to const thus
they should not modify the handle.  In fact that's a false statement,
because first thing these functions do is drop the cast to const with
container_of:

  struct scmi_protocol_instance *pi = ph_to_pi(ph);

And with such cast the handle is easily writable with simple:

  pi->ph.dev = NULL;

If the function really was not modifying the pointed handle, it would
use the container_of_const() call.

The code is not correct logically, either, because functions like
scmi_set_protocol_priv() are meant to modify the data behind the handle
(in containing struct).

The code does not have actual visible bug, but incorrect 'const'
annotations could lead to incorrect compiler decisions.

Fixes: d7b6cc563a60 ("firmware: arm_scmi: Introduce protocol handle definitions")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/base.c                    | 2 +-
 drivers/firmware/arm_scmi/clock.c                   | 2 +-
 drivers/firmware/arm_scmi/driver.c                  | 2 +-
 drivers/firmware/arm_scmi/perf.c                    | 2 +-
 drivers/firmware/arm_scmi/pinctrl.c                 | 4 ++--
 drivers/firmware/arm_scmi/power.c                   | 2 +-
 drivers/firmware/arm_scmi/powercap.c                | 2 +-
 drivers/firmware/arm_scmi/protocols.h               | 4 ++--
 drivers/firmware/arm_scmi/reset.c                   | 2 +-
 drivers/firmware/arm_scmi/sensors.c                 | 2 +-
 drivers/firmware/arm_scmi/system.c                  | 2 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c  | 2 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c  | 2 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c  | 2 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c | 2 +-
 drivers/firmware/arm_scmi/voltage.c                 | 2 +-
 16 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/firmware/arm_scmi/base.c b/drivers/firmware/arm_scmi/base.c
index 22267bbd0f4d..8302aaacdf43 100644
--- a/drivers/firmware/arm_scmi/base.c
+++ b/drivers/firmware/arm_scmi/base.c
@@ -371,7 +371,7 @@ static const struct scmi_protocol_events base_protocol_events = {
 	.num_sources = SCMI_BASE_NUM_SOURCES,
 };
 
-static int scmi_base_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_base_protocol_init(struct scmi_protocol_handle *ph)
 {
 	int id, ret;
 	u8 *prot_imp;
diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index ab36871650a1..58cc392c1c80 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -1064,7 +1064,7 @@ static const struct scmi_protocol_events clk_protocol_events = {
 	.num_events = ARRAY_SIZE(clk_events),
 };
 
-static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_clock_protocol_init(struct scmi_protocol_handle *ph)
 {
 	int clkid, ret;
 	struct clock_info *cinfo;
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 8b27e74d8a19..951711aa7d33 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1630,7 +1630,7 @@ static int version_get(const struct scmi_protocol_handle *ph, u32 *version)
  *
  * Return: 0 on Success
  */
-static int scmi_set_protocol_priv(const struct scmi_protocol_handle *ph,
+static int scmi_set_protocol_priv(struct scmi_protocol_handle *ph,
 				  void *priv)
 {
 	struct scmi_protocol_instance *pi = ph_to_pi(ph);
diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index 4583d02bee1c..1c0a150612a8 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -1266,7 +1266,7 @@ static const struct scmi_protocol_events perf_protocol_events = {
 	.num_events = ARRAY_SIZE(perf_events),
 };
 
-static int scmi_perf_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_perf_protocol_init(struct scmi_protocol_handle *ph)
 {
 	int domain, ret;
 	struct scmi_perf_info *pinfo;
diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index a020e23d7c49..99f98eb6808d 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -827,7 +827,7 @@ static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
 	.pin_free = scmi_pinctrl_pin_free,
 };
 
-static int scmi_pinctrl_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_pinctrl_protocol_init(struct scmi_protocol_handle *ph)
 {
 	int ret;
 	struct scmi_pinctrl_info *pinfo;
@@ -861,7 +861,7 @@ static int scmi_pinctrl_protocol_init(const struct scmi_protocol_handle *ph)
 	return ph->set_priv(ph, pinfo);
 }
 
-static int scmi_pinctrl_protocol_deinit(const struct scmi_protocol_handle *ph)
+static int scmi_pinctrl_protocol_deinit(struct scmi_protocol_handle *ph)
 {
 	int i;
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/arm_scmi/power.c
index bb5062ab8280..00a9f53295f6 100644
--- a/drivers/firmware/arm_scmi/power.c
+++ b/drivers/firmware/arm_scmi/power.c
@@ -319,7 +319,7 @@ static const struct scmi_protocol_events power_protocol_events = {
 	.num_events = ARRAY_SIZE(power_events),
 };
 
-static int scmi_power_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_power_protocol_init(struct scmi_protocol_handle *ph)
 {
 	int domain, ret;
 	struct scmi_power_info *pinfo;
diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
index ab9733f4458b..ac527f59bc1e 100644
--- a/drivers/firmware/arm_scmi/powercap.c
+++ b/drivers/firmware/arm_scmi/powercap.c
@@ -957,7 +957,7 @@ static const struct scmi_protocol_events powercap_protocol_events = {
 };
 
 static int
-scmi_powercap_protocol_init(const struct scmi_protocol_handle *ph)
+scmi_powercap_protocol_init(struct scmi_protocol_handle *ph)
 {
 	int domain, ret;
 	struct powercap_info *pinfo;
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index 4c75970326e6..309e834e5392 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -183,7 +183,7 @@ struct scmi_protocol_handle {
 	unsigned int version;
 	const struct scmi_xfer_ops *xops;
 	const struct scmi_proto_helpers_ops *hops;
-	int (*set_priv)(const struct scmi_protocol_handle *ph, void *priv);
+	int (*set_priv)(struct scmi_protocol_handle *ph, void *priv);
 	void *(*get_priv)(const struct scmi_protocol_handle *ph);
 };
 
@@ -315,7 +315,7 @@ struct scmi_xfer_ops {
 			 struct scmi_xfer *xfer);
 };
 
-typedef int (*scmi_prot_init_ph_fn_t)(const struct scmi_protocol_handle *);
+typedef int (*scmi_prot_init_ph_fn_t)(struct scmi_protocol_handle *);
 
 /**
  * struct scmi_protocol  - Protocol descriptor
diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/arm_scmi/reset.c
index 4bc5c24c2d72..532ebac3286a 100644
--- a/drivers/firmware/arm_scmi/reset.c
+++ b/drivers/firmware/arm_scmi/reset.c
@@ -351,7 +351,7 @@ static const struct scmi_protocol_events reset_protocol_events = {
 	.num_events = ARRAY_SIZE(reset_events),
 };
 
-static int scmi_reset_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_reset_protocol_init(struct scmi_protocol_handle *ph)
 {
 	int domain, ret;
 	struct scmi_reset_info *pinfo;
diff --git a/drivers/firmware/arm_scmi/sensors.c b/drivers/firmware/arm_scmi/sensors.c
index 882d55f987d2..0a2b3bb83cc9 100644
--- a/drivers/firmware/arm_scmi/sensors.c
+++ b/drivers/firmware/arm_scmi/sensors.c
@@ -1144,7 +1144,7 @@ static const struct scmi_protocol_events sensor_protocol_events = {
 	.num_events = ARRAY_SIZE(sensor_events),
 };
 
-static int scmi_sensors_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_sensors_protocol_init(struct scmi_protocol_handle *ph)
 {
 	int ret;
 	struct sensors_info *sinfo;
diff --git a/drivers/firmware/arm_scmi/system.c b/drivers/firmware/arm_scmi/system.c
index 0f51c36f6a9d..dfb7183d1f14 100644
--- a/drivers/firmware/arm_scmi/system.c
+++ b/drivers/firmware/arm_scmi/system.c
@@ -138,7 +138,7 @@ static const struct scmi_protocol_events system_protocol_events = {
 	.num_sources = SCMI_SYSTEM_NUM_SOURCES,
 };
 
-static int scmi_system_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_system_protocol_init(struct scmi_protocol_handle *ph)
 {
 	struct scmi_system_info *pinfo;
 
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
index 33f9ebf6092b..1f569951bb31 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
@@ -342,7 +342,7 @@ static const struct scmi_imx_bbm_proto_ops scmi_imx_bbm_proto_ops = {
 	.button_get = scmi_imx_bbm_button_get,
 };
 
-static int scmi_imx_bbm_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_imx_bbm_protocol_init(struct scmi_protocol_handle *ph)
 {
 	int ret;
 	struct scmi_imx_bbm_info *binfo;
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
index 753274af11d2..928d93a8603f 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
@@ -230,7 +230,7 @@ static int scmi_imx_cpu_attributes_get(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
-static int scmi_imx_cpu_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_imx_cpu_protocol_init(struct scmi_protocol_handle *ph)
 {
 	struct scmi_imx_cpu_info *info;
 	int ret, i;
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c
index c56ae247774d..0a9af7ed1981 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c
@@ -223,7 +223,7 @@ static int scmi_imx_lmm_protocol_attributes_get(const struct scmi_protocol_handl
 	return ret;
 }
 
-static int scmi_imx_lmm_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_imx_lmm_protocol_init(struct scmi_protocol_handle *ph)
 {
 	struct scmi_imx_lmm_priv *info;
 	int ret;
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
index 0ada753367ef..79c7966888be 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
@@ -459,7 +459,7 @@ static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
 	.misc_syslog = scmi_imx_misc_syslog_get,
 };
 
-static int scmi_imx_misc_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_imx_misc_protocol_init(struct scmi_protocol_handle *ph)
 {
 	struct scmi_imx_misc_info *minfo;
 	int ret;
diff --git a/drivers/firmware/arm_scmi/voltage.c b/drivers/firmware/arm_scmi/voltage.c
index b9391c1ee8a0..60c3405b4999 100644
--- a/drivers/firmware/arm_scmi/voltage.c
+++ b/drivers/firmware/arm_scmi/voltage.c
@@ -401,7 +401,7 @@ static const struct scmi_voltage_proto_ops voltage_proto_ops = {
 	.level_get = scmi_voltage_level_get,
 };
 
-static int scmi_voltage_protocol_init(const struct scmi_protocol_handle *ph)
+static int scmi_voltage_protocol_init(struct scmi_protocol_handle *ph)
 {
 	int ret;
 	struct voltage_info *vinfo;

-- 
2.51.0

