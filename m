Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550551;
	b=krGd+u6eYbAEidRcGkDtAf/Kofwh+gjSVLmXyqBIrxCFZwLXnguD8W3IszVSsNquFSvj
	 awZeNQ3owxsp0XkAs/IqiJLz8r6rM0IUlffT0YbUpzYLdQJ0Kboftjj/C4QTw/exgxyiX
	 Ln25Ufh9wfwjv6ScbF2ksZkavNmIZQ4xnf8IZwVtEp2y/5LU2LWJSI0/BOdtmTAIbA/vK
	 a0+pghGaYF7rSznz/7zXZKk8w01+pYhYMg3rmcNTve5Q6p0KQNkb5fN4LXoyNpzSiyDun
	 oxqx45SYHeyx/BgHzhPb9D+1c1N/3SIRjAEhXNZRRGFH1izusyEh9qVzi0rE5zE4Zrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BzIIOuZbKr+MkuPCKBLK8GPNpv85aQsVSidWYgGcJ5s=;
	b=m8eAywyq2y8wC4HHpWJJLrrJMZbN/75VKP97uIrFqFIw4SIrLpZr2ibknsblCPV86uiL
	 qf281H9ei3ePGBXEJXAdTkJm8K4aZ34vMUPdahkyopjfkQQHHtW5h9Tes7esAZVMH/KoN
	 DCKh7sWVYn3eDwaevomB7j7o3w/xR9qV1fR+s+xeJVBqG2grVF8kUVXAQJ4frsnPEZ9rt
	 RGZJ7MW5kjgma889BF6IGGigsmyW99h6EUEk7QRJaJ0h+HRUE+kCNim+8OqbRBWMBgGrz
	 bYI6UcziXREAA27o2G9seym+jg09i6TCnq1ek9SlvZeEiEgsj0UXrB0QRDrZOynpfIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oP7K1eNk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QPSmxFx/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFD2606A6B4
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAFD2606A6B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oP7K1eNk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QPSmxFx/
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOJOcwb1758326
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BzIIOuZbKr+MkuPCKBLK8GPNpv85aQsVSidWYgGcJ5s=; b=oP7K1eNkxbel70wf
	2Eh6uXgrNzFjMgRCVHWgVuJOF/E+4Y1BfJjzQjSIAzbRF1q995H+Q2hDGfycpyC2
	Qw/zZoKrf97MTRDpNYrELEBCGi96PnMdHSu5ztj070/CqxSM59hteDq+ALV2z9IF
	TNZMZHNxTD1VQYI5SnkhFqMcG8ArdoSVptTqWtNxzfPePjANMfErQ6Fvu29ptKFm
	lH8xfKRuMheDI74VT0QKnRrmoqY6iUDOPVNKZ+3J2+nTcKOwriCtSV7rRjefk/5i
	43xYUQ/3fcAb2CrtM6tUGdymSgRNqRcPW6AM4xKMV0EOVhYZMLhgqLY5g074PD7g
	ttCV4w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpks8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:02:28 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5edfa1bf94cso108373e0c.2
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 12:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550548; x=1796155348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BzIIOuZbKr+MkuPCKBLK8GPNpv85aQsVSidWYgGcJ5s=;
        b=QPSmxFx/DRTGLU+P9LJLVSdFi/VQDo5s3WcjLrjvDaAGQC9vqPz2V6ob13XCOHiJwa
         lf1YNJa9Bx9fyTYfVwuls+la5C4nwpKsD760qh9utCh0k1Y8Hn/CJ8j54waw8p3e0Qdg
         Yfv6klhbg2127XKYQvGNsbAB98hLQ3wmCfLveQELZxqAUFNfXuj6CxJ49145XGg/jaNm
         z1T8GSJzMz/OsGekaktg5zcimKVNc3hnJzl540DIYLedYuhX0nUtBLrsrSlxJhrb+mTv
         8m1TbAbb6ghD4kXf/Ty9jO/rH/+wNFm25N0BFFTyXyJljBZpETqNFKQQBEuGfATeyCsy
         65JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550548; x=1796155348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BzIIOuZbKr+MkuPCKBLK8GPNpv85aQsVSidWYgGcJ5s=;
        b=qQ4jwaUICUrx5WHc28DhQVHS7eLj8bDb7nAVOESzn0yLHBHyHXTlKiE6tQ8wDH4C3q
         whJIpi2H3Dqfuheix1NXlrRbPlqVRa+acIZPnYxWVh2gHdrGtjUWV/mv8P5pw8SmIU1/
         cUqJRqhuLzycO4OohCCPiVUioVlZI11IRq3ZIaXJ7lN1sAfrmJy2I9nVVqLTA5GFvT3i
         oJEuLPqazB+giLQQxhITN7K+9aKMdYi1TNFO/5G+6vqlSA+39JdPBECDFRHc0Y27/VlW
         xNZEiR6xT3lF1nU+23en6UWgp5UYPapsJpjHIjL8v4TMgZoMBFijXdpMRVX1E1QG+cPJ
         4rtg==
X-Forwarded-Encrypted: i=1; AL+hErFB5nERSEFGPS3L58LfDGyCm5UY7QinX0YNTJM728pkMtbgpN/vkRJ1qCsJk4kaWPbtU59QB6xx1xM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YVRYBiRnZ7Xymf1QgLwYp4Jc0graPG4RDOnGLX1MpHqVlDmA+
	FiDwDFEbjsI5eQBZkcUE9Sh+iWFgE2aivpfCs4bLzvYrnQ6UkcfcwXCjVlgRYE8vTdEZbfh3tzJ
	ScIvJlASPKo5XeGAv6ZJhoAMTDIrhOe0df8vfopeR38ZdXVF6LP/QVWN+wFWe3UM=
X-Gm-Gg: AZFdTZevIelYBPETeQoVhZ/WPIuz6cOJnRuUOhj9x/1CzEjBwW+w06MrRFW8sylmh6M
	Z1iG6vaK9wplnW+lzclSvLythA75yoCa1r5+Q/bhkvUPTjDlgZ8LdhD+xSPnjVbTQGv46yXdlHG
	sa6RHkD9q1tTa6LQ51FBP35gM0YycejS8+FC0gcMZfM5Mq4uvQ//b9c9k3qB7syIXtNlxk87gET
	pEKCwVED4fHZIJhmu8qqSxcIFmj/TRpcD+/qamxwM0xbGFpA3Y6TYyNf7zNI6nGFIK4/5dbqowE
	0OsyLn7sWKGdQXtH6ES0PVZWLEWx9t28Ph+iTsFtf5aRaU2nFgrlh152KdZUoQ7NbqMHKzBkAUp
	uKE4sgZ7xxfPFs0F2dTHqZtJ/n1b+Fdz4TBwRP8m+ThRYvPa334IInH0b1JXw97UAHTgMj2gkDF
	d/FrAh3QM=
X-Received: by 2002:a05:6122:8882:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ee8af92398mr9464466e0c.5.1795550541840;
        Tue, 24 Nov 2026 12:02:21 -0800 (PST)
X-Received: by 2002:a05:6122:8882:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ee8af92398mr9464267e0c.5.1795550540641;
        Tue, 24 Nov 2026 12:02:20 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:18 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:42 +0100
Subject: [PATCH RFC DNM 13/15] thunderbolt: Introduce Qualcomm USB4 router
 driver
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-13-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=85259;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=t0Co5pr/iPJqR0QBh6Bo4Hy+i8q+BOuWEfAoAD0M8b0=;
 b=Aooww1c08HTaI5oy3EC2gsOlQovUF4NZ8jsMmonDkX1gMHMSGwxePtUTmdkXojLrdjUUKOq+z
 UCiyR3BNH9eCp1b9p8/cgiuqJxWZ+hiIjVH8Gv7xKCkuRuUvtfBQnRw
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXwrx9OQLvVxFa
 TGHkwL20pA010YnxlYTJTu4NUgHZYoYYss7xBrcS/mEzG8CfzagsZnTk3JTu5V0poadknmGILqu
 0Me8+7tY65a2WQtLiw3D7OezV9eiBQdZMpnhtus3AEL2e2wLb+mPFKbGvIuqx6t9ySPuy3ZoAXY
 C/gJ+dw9h9wpbujYknRSnUOfamVbRkPoZcawbZaXYZ9yx5c5N4uAQphO2SZ6GgR2M6d2UpH0frq
 RvudIviIl3ZYJvohp/USXc1PcctHGlkVZRbgPX8GK4x6yc1weuJnkErtnwWj791C946lGeNLPC2
 gluIEebQ6FuMPFAJNQTpe5lhCMkkAy4OziidANHMjA9EtQpLWG+zEYy1YfscvYdAEP5iILR+p9C
 +JC3EdXVft1f0L+09pPnpKaZ4PXDPRFaYNuKq1PvTv3+xFvFwchptdwL9k6QRgh16IT0URu3aNx
 zTnGLoL+NIQCiZabM5g==
X-Proofpoint-GUID: Ni5ZqIzc0wsa3uLOCLdRhSTohrCibCAB
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b05ed54 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=mtq3dvTX9fB4l8ulIqIA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX9qnSOiMPEq5K
 NbsuAJl5uN5J3Pc4lFPSO301feHVtH+0C+nAeTXIQUiTjKsG6cFxTf9rkxUUYEgcSXiokHbos2K
 d7yMMnvyNFtwDKsYcPFWcpZTFSOAgiI=
X-Proofpoint-ORIG-GUID: Ni5ZqIzc0wsa3uLOCLdRhSTohrCibCAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

Introduce a driver for the in-house Qualcomm USB4 router driver.
It consists of resource enablement, uC firmware loading and
communication, Type-C infrastructure and power state handling.

Unlike many other implementations, the power state of both the router
and the native protocol controllers has to be manually coordinated,
which much of this driver ends up doing.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/Kconfig   |   13 +
 drivers/thunderbolt/Makefile  |    3 +
 drivers/thunderbolt/eeprom.c  |   17 -
 drivers/thunderbolt/qcom.c    | 2299 +++++++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/qcom.h    |  251 +++++
 drivers/thunderbolt/tb.h      |   20 +
 drivers/thunderbolt/tb_regs.h |    3 +
 7 files changed, 2589 insertions(+), 17 deletions(-)

diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
index 294b3227a54582536433cbb391057b99bb9df352..94654d3e41137b630fc4723adc4949d8df8b0617 100644
--- a/drivers/thunderbolt/Kconfig
+++ b/drivers/thunderbolt/Kconfig
@@ -64,6 +64,19 @@ config USB4_DMA_TEST
 	  To compile this driver a module, choose M here. The module will be
 	  called thunderbolt_dma_test.
 
+config USB4_QCOM
+	tristate "Qualcomm USB4/Thunderbolt Support"
+	depends on USB4
+	depends on OF
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on COMMON_CLK && PM
+	help
+	  Say Y here to add support for the USB4 and Thunderbolt host
+	  routers found on Qualcomm SoCs.
+
+	  To compile the driver as a module, choose M here. The module
+	  will be called thunderbolt_qcom.
+
 config USB4_STREAM
 	tristate "Stream data over Thunderbolt/USB4 cable"
 	depends on USB4_CONFIGFS
diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
index beb054c3126b1445d26b4c14de039d23367a5100..8f56afd7d6b47e95324adbd95f50692ca7b3582d 100644
--- a/drivers/thunderbolt/Makefile
+++ b/drivers/thunderbolt/Makefile
@@ -11,6 +11,9 @@ thunderbolt-$(CONFIG_USB4_CONFIGFS) += configfs.o
 thunderbolt-${CONFIG_USB4_KUNIT_TEST} += test.o
 CFLAGS_test.o += $(DISABLE_STRUCTLEAK_PLUGIN)
 
+thunderbolt_qcom-objs := qcom.o
+obj-${CONFIG_USB4_QCOM} += thunderbolt_qcom.o
+
 thunderbolt_dma_test-${CONFIG_USB4_DMA_TEST} += dma_test.o
 obj-$(CONFIG_USB4_DMA_TEST) += thunderbolt_dma_test.o
 
diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
index 2acfe83928b6d8cc95520479f90b595d7137b829..74be3295a0a241f17c833d143d0674e18ffb9bb0 100644
--- a/drivers/thunderbolt/eeprom.c
+++ b/drivers/thunderbolt/eeprom.c
@@ -197,23 +197,6 @@ static int tb_eeprom_read_n(struct tb_switch *sw, u16 offset, u8 *val,
 	return tb_eeprom_active(sw, false);
 }
 
-static u8 tb_crc8(u8 *data, int len)
-{
-	int i, j;
-	u8 val = 0xff;
-	for (i = 0; i < len; i++) {
-		val ^= data[i];
-		for (j = 0; j < 8; j++)
-			val = (val << 1) ^ ((val & 0x80) ? 7 : 0);
-	}
-	return val;
-}
-
-static u32 tb_crc32(void *data, size_t len)
-{
-	return ~crc32c(~0, data, len);
-}
-
 #define TB_DROM_DATA_START		13
 #define TB_DROM_HEADER_SIZE		22
 #define USB4_DROM_HEADER_SIZE		16
diff --git a/drivers/thunderbolt/qcom.c b/drivers/thunderbolt/qcom.c
new file mode 100644
index 0000000000000000000000000000000000000000..721feeccd7364e21bb1e2ecb2d97967bee5bc5cf
--- /dev/null
+++ b/drivers/thunderbolt/qcom.c
@@ -0,0 +1,2299 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/align.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/devm-helpers.h>
+#include <linux/errno.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/overflow.h>
+#include <linux/phy/phy.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+#include <linux/soc/qcom/smem.h>
+#include <linux/unaligned.h>
+#include <linux/units.h>
+#include <linux/usb/pd.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_mux.h>
+#include <linux/usb/typec_tbt.h>
+#include <linux/usb/typec.h>
+#include <linux/workqueue.h>
+
+#include "nhi.h"
+#include "nhi_regs.h"
+#include "qcom.h"
+#include "tb.h"
+
+/*
+ * The router's operational ability is directly tied to the mode and power state of the QMPPHY
+ * (and thus to cable presence). The router (transitively) sources its clocks from the PHY,
+ * although it may operate in reduced capacity even when it's off (by muxing its inputs to the
+ * 19.2 MHz XO clock source). That 'reduced mode' allows for register access, but not TBT linkup.
+ *
+ * At probe time, that mechanism is used to bootstrap the router regardless of the plug state
+ * (since forcefully switching the PHY to USB4 mode would disrupt a USB3/DP link on that port).
+ * Then, upon a USB4/TBT3 typec_mux event the PHY is reconfigured, the clocks are reconfigured to
+ * follow, the uC is brought online and a BEGIN_HSE command is sent to the router, which can take
+ * a couple seconds to complete.
+ *
+ * Upon unplug, the router has to be immediately torn down (including the clocks scaffolding and
+ * the PHY) to unblock the port for a potentially soon-to-be-plugged USB3/DP device.
+ *
+ * Suspend/resume sequences require a handshake with the uC, as that influences the state of some
+ * clocks and failing to follow that ends up in a hard crash of the entire platform.
+ *
+ * This is modeled as an explicit state machine (enum qcusb4_hw_state), with all transitions
+ * serialized by state_lock:
+ *
+ *   OFF --probe--> IDLE <--reconcile--> LINK
+ *                    \                   /
+ *                     +---> ASLEEP <----+   (runtime/system sleep, uC handshake)
+ *
+ * The Type-C callbacks record what state they want (->desired_state) and kick the reconcile work,
+ * which runs the IDLE <-> LINK transitions. Cable removal is LINK -> IDLE, which cycles the domain
+ * and the router through a full sleep (TBT layer _SLP first, then the uC handshake) to hand the PHY
+ * back, then cold-restarts the router on XO (a sleep exit would have the FW go for the PHY it no
+ * longer has), so the TBT core sees a regular unplug. The PHY must never be taken away outside of
+ * that handshake. For the same reason, sleep entered from IDLE is exited through a cold restart, as
+ * the cable may have been plugged in meanwhile. Two gates protect against unclocked access from
+ * outside the state machine: uc_online for FW commands and mmio_ok for the PCIe reset controller.
+ */
+
+/* ROUTER_CS registers */
+#define ROUTER_CS_CS_1			0x4
+#define ROUTER_CS_CS_5			0x14
+
+#define is_usb4v2(q)			((q)->match_data->entries[(q)->instance_idx].usb4v2_capable)
+
+/* LANEn_CS registers */
+#define UC_RAM_DROM_OFFSET_V1		0xdf20
+#define UC_RAM_DROM_OFFSET_V2		0xff20
+#define UC_RAM_DROM_OFFSET(q)		(is_usb4v2((q)) ? \
+					 UC_RAM_DROM_OFFSET_V2 : UC_RAM_DROM_OFFSET_V1)
+
+#define LANEn_CS_CS_1(q)		(is_usb4v2(q) ? 0x58 : 0x50)
+#define LANEn_CS_CS_1_ADAPTER_STATE	GENMASK(29, 26)
+#define LANEn_CS_CS_18(q)		(is_usb4v2(q) ? 0xac : 0xa4)
+#define LANEn_CS_CS_19(q)		(is_usb4v2(q) ? 0xb0 : 0xa8)
+
+/* PORT_GROUP registers */
+#define PORT_GROUP_LANE_CFG		0x0
+#define LANE_CFG_CLx_SUPPORT(q)		(is_usb4v2(q) ? GENMASK(21, 19) : GENMASK(23, 21))
+#define PORT_GROUP_FCM_2_CFG		0x64
+ #define FCM_2_CFG_DIS_ANY_HOPID	BIT(6)
+
+/* SIDEBAND registers */
+#define SIDEBAND_TX_CTRL		0xc
+ #define SB_TX_CTRL_TX_ENABLE		BIT(31)
+
+/* UC_PER registers */
+#define UC_PER_CONTROL			0x1000
+ #define PER_CONTROL_UC_ENABLE		BIT(0)
+#define UC_PER_SW_TRIGGERS_UC_IRQ	0x100c
+#define UC_PER_FW_INT_STATUS_SET	0x1010
+#define UC_PER_FW_INT_CLR		0x1018
+ #define PER_FW_INT_CLR_CLR		BIT(0)
+#define UC_PER_FW_INT_MASK		0x101c
+ #define PER_FW_INT_MASK_FW_INT		BIT(0)
+
+/* CFG registers */
+#define CFG_SYS_CLK_CGC			0x0
+ #define SYS_CLK_CGC_SYS_CLK_EN_USBAP	BIT(7)
+
+/* USBAP_CONFIG registers */
+#define USBAP_CFG_SYNC_RST_USB3		0x0
+ #define RST_USB3_RST			BIT(0)
+#define USBAP_CFG_USB4_MODE		0x4
+ #define USB4_MODE_USB4_MODE		BIT(0)
+#define USBAP_CFG_RXTERM_BACKDOOR_CTRL	0x10
+#define USBAP_CFG_RXTERM_BACKDOOR_STS	0x14
+ #define RXTERM_RX_TERM			BIT(0)
+#define USBAP_CFG_PHYSTATUS_EN		0x18
+ #define PHYSTATUS_EN_EN		BIT(0)
+
+/* PCIEAP_CONFIG registers */
+#define PCIEAP_CONFIG_SYNC_RST		0x0
+ #define PCIEAP_SYNC_RST_PCIE		BIT(0)
+#define PCIEAP_CONFIG_IRQ_STATUS	0x0c
+ #define PCIEAP_IRQ_PE_DEASSERT		BIT(3)
+ #define PCIEAP_IRQ_PE_ASSERT		BIT(2)
+#define PCIEAP_CONFIG_IRQ_MASK		0x10
+#define PCIEAP_CONFIG_IRQ_CLEAR		0x14
+
+/* PCIEAP (USB4 v2 router) registers */
+#define PCIEAP_TX_CFG			0x0
+ #define PCIEAP_TX_CFG_EN_FLUSH_MISSING_SOP	BIT(22)
+
+/* ROUTER_CONFIG registers */
+#define ROUTER_CONFIG_CS_6		0x18
+ #define CS_6_ROUTER_READY		BIT(24)
+#define ROUTER_CONFIG_CS_7		0x1c
+#define ROUTER_CONFIG_CS_8		0x20
+
+struct qcom_usb4_fw_event {
+	u8 opcode;
+	u8 params[];
+} __packed;
+
+struct qcom_usb4_fw_events {
+	__le16 num_entries;
+	__le16 entry_size;
+	__le32 next_entry_index;
+	__le16 num_unread_entries; /* This only guarantees num_unread >= num_entries */
+	u8 res[6];
+	struct qcom_usb4_fw_event entries[];
+} __packed;
+
+#define FW_EV_BUF_SIZE			SZ_8K
+
+enum qcom_usb4_fw_cmd {
+	FW_CMD_BEGIN_HSE = 0x1,
+
+	FW_CMD_ENABLE_PHY_PRESETS = 0x2,
+#define PHY_PRESETS_DEFAULT (BIT(0) | BIT(1) | BIT(5) | BIT(6) | BIT(10) | BIT(11))
+
+	FW_CMD_LIMIT_LOGLEVEL = 0x3,
+#define LOG_LEVEL_ALL			0
+#define LOG_LEVEL_WARN			1
+#define LOG_LEVEL_ERR			2
+#define LOG_LEVEL_NONE			3
+
+	/* Only makes sense to call this after FW_MSG_SLEEP_READY */
+	FW_CMD_COMPLETE_SLEEP = 0x4,
+
+	/* Reconfigure the internals to restore the link (or handle an in-sleep disconnect) */
+	FW_CMD_WAKEUP = 0x5,
+#define WAKEUP_REASON_DEVICE		0
+#define WAKEUP_REASON_CBL_DIS		1
+#define WAKEUP_REASON_CBL_CON		2
+#define WAKEUP_REASON_SYSTEM		3
+
+	/* The router alone can't differentiate between physical and logical disconnects */
+	FW_CMD_PHYS_DISCONNECT = 0x6,
+
+	FW_CMD_DEPRECATED	= 0x7,
+
+	/* USB4v2 introduced more tuning presets */
+	FW_CMD_ENABLE_PHY_PRESETS_MSB = 0x8,
+
+	/* Notify the uC that we're done with the Host Router Reset */
+	FW_CMD_HRR_DONE = 0x9,
+
+	FW_CMD_WA_DONE = 0xa,
+#define WA_DONE_USBAP_RXTERM		1
+};
+
+/* Must be called with the mux clocks enabled */
+static int qcusb4_select_rx_clock_source(struct qcom_usb4 *qcusb4,
+					 bool fast_clock)
+{
+	struct clk *rx0 = qcusb4->mux_clks[MUX_CLK_PHY_RX0].clk;
+	struct clk *rx1 = qcusb4->mux_clks[MUX_CLK_PHY_RX1].clk;
+	unsigned long rate = fast_clock ? ULONG_MAX : 19200000;
+	int ret;
+
+	clk_disable_unprepare(rx0);
+	clk_disable_unprepare(rx1);
+
+	/* No error unwinding on purpose, failure here is borderline impossible and catastrophic */
+	ret = clk_set_rate(rx0, rate);
+	if (ret) {
+		dev_err(qcusb4->nhi.dev, "Failed to select RX0 clock source: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_set_rate(rx1, rate);
+	if (ret) {
+		dev_err(qcusb4->nhi.dev, "Failed to select RX1 clock source: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(rx0);
+	if (ret) {
+		dev_err(qcusb4->nhi.dev, "Failed to re-enable the RX0 clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(rx1);
+	if (ret)
+		dev_err(qcusb4->nhi.dev, "Failed to re-enable the RX1 clock: %d\n", ret);
+
+	return ret;
+}
+
+static int __qcusb4_fw_cmd(struct qcom_usb4 *qcusb4, enum qcom_usb4_fw_cmd msg, u32 args)
+{
+	u32 cmd;
+	u32 val;
+
+	lockdep_assert_held(&qcusb4->uc_cmd_lock);
+
+	/* The uC is either down, or about to be */
+	if (!qcusb4->uc_online) {
+		dev_warn_ratelimited(qcusb4->nhi.dev,
+				     "Dropping cmd=0x%x arg=0x%x, the uC is not running\n",
+				     msg, args);
+		return -EAGAIN;
+	}
+
+	pm_runtime_mark_last_busy(qcusb4->nhi.dev);
+
+	cmd = FIELD_PREP(GENMASK(31, 8), args) |
+	      FIELD_PREP(GENMASK(7, 0), msg);
+
+	writel(cmd, qcusb4->uc_per + UC_PER_SW_TRIGGERS_UC_IRQ);
+
+	if (readl_poll_timeout(qcusb4->uc_per + UC_PER_SW_TRIGGERS_UC_IRQ,
+			       val, !val, 10, 10 * USEC_PER_MSEC)) {
+		dev_err(qcusb4->nhi.dev, "Firmware failed to clear cmd 0x%08x\n", cmd);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int qcusb4_fw_cmd(struct qcom_usb4 *qcusb4, enum qcom_usb4_fw_cmd msg, u32 args)
+{
+	guard(mutex)(&qcusb4->uc_cmd_lock);
+
+	return __qcusb4_fw_cmd(qcusb4, msg, args);
+}
+
+/*
+ * Send a command that the FW acks with an event. The completion is re-armed under uc_cmd_lock,
+ * so that a stale ack from an earlier command can't satisfy the wait.
+ */
+static int qcusb4_fw_cmd_wait(struct qcom_usb4 *qcusb4, enum qcom_usb4_fw_cmd msg, u32 args,
+			      struct completion *done, unsigned int timeout_ms)
+{
+	int ret;
+
+	scoped_guard(mutex, &qcusb4->uc_cmd_lock) {
+		reinit_completion(done);
+
+		ret = __qcusb4_fw_cmd(qcusb4, msg, args);
+		if (ret)
+			return ret;
+	}
+
+	if (!wait_for_completion_timeout(done, msecs_to_jiffies(timeout_ms)))
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+enum qcom_usb4_fw_msg {
+	FW_MSG_MESSAGE = 0x1,
+	FW_MSG_ERR = 0x2,
+	FW_MSG_TEST_RES = 0x3,
+	/* Fires after a successful handling of FW_CMD_COMPLETE_SLEEP */
+	FW_MSG_SLEEP_DONE = 0x4,
+	/* Fires after a packet with opcode = USB4_SB_OPCODE_ROUTER_OFFLINE is handled */
+	FW_MSG_EXIT_OFFLINE = 0x5,
+	/* Fires after any sort of (incl. logical) disconnect has been detected */
+	FW_MSG_DISCONNECT = 0x6,
+	/* Fires after a successful handling of ROUTER_CS_5.SLP becoming set */
+	FW_MSG_SLEEP_READY = 0x7,
+	/* "A specific software workaround must be applied immediately" */
+	FW_MSG_TRIGGER = 0x8,
+#define WA_TRIGGER_USBAP_RXTERM		3
+
+	/* "found hotplug with HopId > 1" */
+	FW_MSG_CHAINED_HOTPLUG = 0x9,
+	/* Fires after a HRR request arrives, needs to be acked with FW_CMD_HRR_DONE */
+	FW_MSG_HOST_RESET = 0xa,
+	FW_MSG_HSE_STATS = 0xb,
+	FW_MSG_FOM_STATS = 0xc,
+};
+
+static void qcom_usb4_fw_clear_irq(struct qcom_usb4 *qcusb4)
+{
+	/* Clear the irq - this resets the unread message counter on the FW side */
+	writel(PER_FW_INT_CLR_CLR, qcusb4->uc_per + UC_PER_FW_INT_CLR);
+	readl(qcusb4->uc_per + UC_PER_FW_INT_CLR);
+}
+
+static bool qcom_usb4_fw_event_ring_valid(struct qcom_usb4 *qcusb4, u32 data_off,
+					  u16 total_entries, u16 entry_size, u32 *ring_size)
+{
+	u32 entries_size;
+
+	if (!total_entries || entry_size < sizeof(struct qcom_usb4_fw_event))
+		return false;
+
+	if (check_mul_overflow((u32)total_entries, (u32)entry_size, &entries_size))
+		return false;
+
+	if (check_add_overflow((u32)sizeof(struct qcom_usb4_fw_events),
+			       entries_size, ring_size))
+		return false;
+
+	if (*ring_size > FW_EV_BUF_SIZE)
+		return false;
+
+	if (data_off > qcusb4->uc_ram_size - *ring_size)
+		return false;
+
+	return true;
+}
+
+/*
+ * The FW exposes a ring buffer with no 'event processing done' acking (i.e. the event may be gone
+ * before we process it).
+ *
+ * Accessing that data happens by directly reading the uC's RAM at a given offset.
+ * The uC is clocked by the SYS clock (part of qcusb4->mux_clks), so care must be taken to disable
+ * this IRQ, to prevent system crashes.
+ */
+static irqreturn_t qcom_usb4_fw_irq_handler(int irq, void *data)
+{
+	struct qcom_usb4 *qcusb4 = data;
+	u16 total_entries;
+	u16 entry_size;
+	u32 ring_size;
+	u32 data_off;
+
+	if (unlikely(!qcusb4->fw_ev_rb_base)) {
+		data_off = readl(qcusb4->uc_per + UC_PER_FW_INT_STATUS_SET);
+		if (!IS_ALIGNED(data_off, sizeof(u32)) ||
+		    data_off > qcusb4->uc_ram_size - sizeof(struct qcom_usb4_fw_events)) {
+			dev_err_ratelimited(qcusb4->nhi.dev,
+					    "Invalid FW event ring offset 0x%x\n",
+					    data_off);
+			qcom_usb4_fw_clear_irq(qcusb4);
+			return IRQ_HANDLED;
+		}
+
+		total_entries = lower_16_bits(readl(qcusb4->uc_ram + data_off));
+		entry_size = upper_16_bits(readl(qcusb4->uc_ram + data_off));
+
+		if (!qcom_usb4_fw_event_ring_valid(qcusb4, data_off, total_entries,
+						   entry_size, &ring_size)) {
+			dev_err_ratelimited(qcusb4->nhi.dev,
+					    "Invalid FW event ring: off=0x%x entries=%u size=%u\n",
+					    data_off, total_entries, entry_size);
+			qcom_usb4_fw_clear_irq(qcusb4);
+			return IRQ_HANDLED;
+		}
+
+		qcusb4->fw_ev_rb_base = qcusb4->uc_ram + data_off;
+		qcusb4->fw_ev_total_entry_num = total_entries;
+		qcusb4->fw_ev_entry_size = entry_size;
+		qcusb4->fw_ev_ring_size = ring_size;
+		qcusb4->next_fw_ev_idx = 0;
+	}
+
+	return IRQ_WAKE_THREAD;
+}
+
+static int qcusb4_usbap_rxterm_wa(struct qcom_usb4 *qcusb4)
+{
+	struct device *dev = qcusb4->nhi.dev;
+	u32 val;
+	int ret;
+
+	val = readl(qcusb4->usb_cfg + USBAP_CFG_PHYSTATUS_EN);
+	writel(val & ~PHYSTATUS_EN_EN, qcusb4->usb_cfg + USBAP_CFG_PHYSTATUS_EN);
+
+	val = readl(qcusb4->usb_cfg + USBAP_CFG_SYNC_RST_USB3);
+	writel(val | RST_USB3_RST, qcusb4->usb_cfg + USBAP_CFG_SYNC_RST_USB3);
+
+	ret = reset_control_assert(qcusb4->usb_pipe_reset);
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't assert usb_pipe reset\n");
+
+	usleep_range(100, 150);
+
+	val = readl(qcusb4->usb_cfg + USBAP_CFG_PHYSTATUS_EN);
+	writel(val | PHYSTATUS_EN_EN, qcusb4->usb_cfg + USBAP_CFG_PHYSTATUS_EN);
+
+	val = readl(qcusb4->cfg + CFG_SYS_CLK_CGC);
+	writel(val & ~SYS_CLK_CGC_SYS_CLK_EN_USBAP, qcusb4->cfg + CFG_SYS_CLK_CGC);
+
+	ret = reset_control_deassert(qcusb4->usb_pipe_reset);
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't deassert usb_pipe reset\n");
+
+	usleep_range(100, 150);
+
+	val = readl(qcusb4->usb_cfg + USBAP_CFG_SYNC_RST_USB3);
+	writel(val & ~RST_USB3_RST, qcusb4->usb_cfg + USBAP_CFG_SYNC_RST_USB3);
+
+	val = readl(qcusb4->usb_cfg + USBAP_CFG_RXTERM_BACKDOOR_CTRL);
+	writel(val | RXTERM_RX_TERM, qcusb4->usb_cfg + USBAP_CFG_RXTERM_BACKDOOR_CTRL);
+
+	return qcusb4_fw_cmd(qcusb4, FW_CMD_WA_DONE, WA_DONE_USBAP_RXTERM);
+}
+
+static irqreturn_t qcom_usb4_fw_irq_thread(int irq, void *data)
+{
+	struct qcom_usb4 *qcusb4 = data;
+	struct qcom_usb4_fw_events *fw_events = qcusb4->fw_events_buf;
+	struct device *dev = qcusb4->nhi.dev;
+	u32 entry_size = qcusb4->fw_ev_entry_size;
+	u16 num_new_entries, num_to_end;
+	void __iomem *entries;
+	u32 next_entry_index;
+
+	if (!qcusb4->fw_ev_rb_base || !qcusb4->fw_ev_ring_size) {
+		qcom_usb4_fw_clear_irq(qcusb4);
+		return IRQ_HANDLED;
+	}
+
+	/*
+	 * Clear before reading the write index. Otherwise an event written in between gets its IRQ
+	 * cleared, but not read, and sits in the ring until something else fires the IRQ.
+	 */
+	qcom_usb4_fw_clear_irq(qcusb4);
+
+	next_entry_index = readl(qcusb4->fw_ev_rb_base +
+				 offsetof(struct qcom_usb4_fw_events, next_entry_index));
+	if (next_entry_index >= qcusb4->fw_ev_total_entry_num) {
+		dev_err_ratelimited(dev, "Invalid FW event index %u/%u\n",
+				    next_entry_index, qcusb4->fw_ev_total_entry_num);
+		return IRQ_HANDLED;
+	}
+
+	/* Check for ringbuffer rollover */
+	if (next_entry_index < qcusb4->next_fw_ev_idx)
+		num_new_entries = qcusb4->fw_ev_total_entry_num - qcusb4->next_fw_ev_idx
+				  + next_entry_index;
+	else
+		num_new_entries = next_entry_index - qcusb4->next_fw_ev_idx;
+
+	/* Grab the header and the new entries (wrapping around) from the uC's RAM */
+	memcpy_fromio(fw_events, qcusb4->fw_ev_rb_base, sizeof(*fw_events));
+	entries = qcusb4->fw_ev_rb_base + offsetof(struct qcom_usb4_fw_events, entries);
+	num_to_end = min_t(u16, num_new_entries,
+			   qcusb4->fw_ev_total_entry_num - qcusb4->next_fw_ev_idx);
+	memcpy_fromio((void *)fw_events->entries + entry_size * qcusb4->next_fw_ev_idx,
+		      entries + entry_size * qcusb4->next_fw_ev_idx, entry_size * num_to_end);
+	memcpy_fromio(fw_events->entries, entries, entry_size * (num_new_entries - num_to_end));
+	/* Make sure we get the events before proceeding */
+	mb();
+
+	if (le16_to_cpu(fw_events->num_unread_entries) >= qcusb4->fw_ev_total_entry_num)
+		dev_warn_ratelimited(dev, "FW event ring overflowed, events were lost\n");
+
+	for (int i = 0; i < num_new_entries; i++) {
+		struct qcom_usb4_fw_event *ev;
+		u16 payload_size = qcusb4->fw_ev_entry_size - sizeof(*ev);
+
+		ev = (void *)fw_events->entries +
+		     (qcusb4->fw_ev_entry_size * qcusb4->next_fw_ev_idx++);
+
+		switch (ev->opcode) {
+		case FW_MSG_MESSAGE:
+			dev_warn(qcusb4->nhi.dev, "FW MSG: %.*s\n", payload_size, ev->params);
+			break;
+		case FW_MSG_ERR:
+			if (payload_size < 3) {
+				dev_err(dev, "Malformed FW error event\n");
+				break;
+			}
+
+			u8 error = ev->params[0];
+			u16 extradata = (ev->params[2] << 8) | ev->params[1];
+
+			dev_err(qcusb4->nhi.dev, "Received FW error: %u (data: 0x%x)\n",
+				error, extradata);
+			break;
+		case FW_MSG_SLEEP_DONE:
+			complete(&qcusb4->sleep_acked);
+			dev_err(qcusb4->nhi.dev, "FW Sleep done\n");
+			break;
+		case FW_MSG_EXIT_OFFLINE:
+			dev_err(qcusb4->nhi.dev, "FW exit offline\n");
+			break;
+		case FW_MSG_DISCONNECT:
+			if (!payload_size) {
+				dev_err(dev, "Malformed FW disconnect event\n");
+				break;
+			}
+
+			complete(&qcusb4->disconnect_acked);
+			dev_err(qcusb4->nhi.dev, "FW disconnect event: %u\n", *ev->params);
+			break;
+		case FW_MSG_SLEEP_READY:
+			complete(&qcusb4->sleep_ready);
+			dev_err(qcusb4->nhi.dev, "FW Sleep ready\n");
+			break;
+		case FW_MSG_TRIGGER:
+			if (!payload_size) {
+				dev_err(dev, "Malformed FW trigger event\n");
+				break;
+			}
+
+			unsigned int type = *ev->params;
+
+			switch (type) {
+			case WA_TRIGGER_USBAP_RXTERM:
+				int ret = qcusb4_usbap_rxterm_wa(qcusb4);
+
+				if (ret)
+					dev_err(dev, "Failed to execute RXTERM workaround\n");
+				break;
+			default:
+				dev_err(qcusb4->nhi.dev, "unknown firmware workaround %u\n",
+					*ev->params);
+				break;
+			}
+			break;
+		case FW_MSG_HOST_RESET:
+			if (!is_usb4v2(qcusb4))
+				break;
+
+			/* TODO: assert GCC_USB4_HRR_BCR for 100 us */
+			qcusb4_fw_cmd(qcusb4, FW_CMD_HRR_DONE, 0);
+			break;
+		case FW_MSG_CHAINED_HOTPLUG:
+		case FW_MSG_HSE_STATS:
+		case FW_MSG_FOM_STATS:
+			/* Ignore */
+			break;
+		default:
+			dev_notice(qcusb4->nhi.dev, "Unknown firmware message opcode 0x%x\n",
+				   ev->opcode);
+			break;
+		}
+
+		if (qcusb4->next_fw_ev_idx >= qcusb4->fw_ev_total_entry_num)
+			qcusb4->next_fw_ev_idx -= qcusb4->fw_ev_total_entry_num;
+	}
+
+	return IRQ_HANDLED;
+}
+
+#define rcdev_to_qcusb4(rcdev)	container_of(rcdev, struct qcom_usb4, rcdev)
+static void qcusb4_pcie_sync_rst_apply(struct qcom_usb4 *qcusb4)
+{
+	u32 val;
+
+	lockdep_assert_held(&qcusb4->rst_lock);
+
+	val = readl(qcusb4->pcie_cfg + PCIEAP_CONFIG_SYNC_RST);
+	if (qcusb4->pcie_rst_asserted)
+		val |= PCIEAP_SYNC_RST_PCIE;
+	else
+		val &= ~PCIEAP_SYNC_RST_PCIE;
+	writel(val, qcusb4->pcie_cfg + PCIEAP_CONFIG_SYNC_RST);
+
+	udelay(5);
+
+	if (is_usb4v2(qcusb4)) {
+		val = readl(qcusb4->pcie_ap + PCIEAP_TX_CFG);
+		val |= PCIEAP_TX_CFG_EN_FLUSH_MISSING_SOP;
+		writel(val, qcusb4->pcie_ap + PCIEAP_TX_CFG);
+	}
+}
+
+static int __qcusb4_pcie_sync_rst_set(struct qcom_usb4 *qcusb4, bool assert)
+{
+	guard(mutex)(&qcusb4->rst_lock);
+
+	qcusb4->pcie_rst_asserted = assert;
+
+	/*
+	 * The AP registers are unclocked while the router sleeps, and accessing them then
+	 * hard-resets the SoC. In that case the request is only recorded, and applied by
+	 * qcusb4_power_up() before the router is handed back.
+	 */
+	if (qcusb4->mmio_ok)
+		qcusb4_pcie_sync_rst_apply(qcusb4);
+
+	return 0;
+}
+
+static int qcusb4_pcie_sync_rst_assert(struct reset_controller_dev *rcdev,
+				       unsigned long id)
+{
+	return __qcusb4_pcie_sync_rst_set(rcdev_to_qcusb4(rcdev), true);
+}
+
+static int qcusb4_pcie_sync_rst_deassert(struct reset_controller_dev *rcdev,
+					 unsigned long id)
+{
+	return __qcusb4_pcie_sync_rst_set(rcdev_to_qcusb4(rcdev), false);
+}
+
+static const struct reset_control_ops qcusb4_pcie_sync_rst_ops = {
+	.assert = qcusb4_pcie_sync_rst_assert,
+	.deassert = qcusb4_pcie_sync_rst_deassert,
+};
+
+static irqreturn_t qcom_usb4_pcie_ap_irq_handler(int irq, void *data)
+{
+	struct qcom_usb4 *qcusb4 = data;
+	u32 val;
+
+	val = readl(qcusb4->pcie_cfg + PCIEAP_CONFIG_IRQ_STATUS);
+	writel(val, qcusb4->pcie_cfg + PCIEAP_CONFIG_IRQ_CLEAR);
+
+	return IRQ_HANDLED;
+}
+
+static int qcom_usb4_get_mmio_regions(struct qcom_usb4 *qcusb4)
+{
+	struct device *dev = qcusb4->nhi.dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	struct resource *res;
+
+	qcusb4->router_cs = devm_platform_ioremap_resource_byname(pdev, "router_cs");
+	if (IS_ERR(qcusb4->router_cs))
+		return dev_err_probe(dev, PTR_ERR(qcusb4->router_cs),
+				     "Couldn't get router_cs region\n");
+
+	qcusb4->port_group = devm_platform_ioremap_resource_byname(pdev, "port_group");
+	if (IS_ERR(qcusb4->port_group))
+		return dev_err_probe(dev, PTR_ERR(qcusb4->port_group),
+				     "Couldn't get port_group region\n");
+
+	qcusb4->pcie_cfg = devm_platform_ioremap_resource_byname(pdev, "pcie_cfg");
+	if (IS_ERR(qcusb4->pcie_cfg))
+		return dev_err_probe(dev, PTR_ERR(qcusb4->pcie_cfg),
+				     "Couldn't get pcie_cfg region\n");
+
+	qcusb4->pcie_ap = devm_platform_ioremap_resource_byname(pdev, "pcie");
+	if (IS_ERR(qcusb4->pcie_ap))
+		return dev_err_probe(dev, PTR_ERR(qcusb4->pcie_ap),
+				     "Couldn't get pcie region\n");
+
+	qcusb4->sideband = devm_platform_ioremap_resource_byname(pdev, "sideband");
+	if (IS_ERR(qcusb4->sideband))
+		return dev_err_probe(dev, PTR_ERR(qcusb4->sideband),
+				     "Couldn't get sideband region\n");
+
+	qcusb4->usb_cfg = devm_platform_ioremap_resource_byname(pdev, "usb_cfg");
+	if (IS_ERR(qcusb4->usb_cfg))
+		return dev_err_probe(dev, PTR_ERR(qcusb4->usb_cfg),
+				     "Couldn't get usb_cfg region\n");
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "uc_ram");
+	if (!res)
+		return dev_err_probe(dev, -EINVAL, "Couldn't get uc_ram region\n");
+
+	qcusb4->uc_ram = devm_ioremap_resource(dev, res);
+	if (IS_ERR(qcusb4->uc_ram))
+		return dev_err_probe(dev, PTR_ERR(qcusb4->uc_ram),
+				     "Couldn't get uc_ram region\n");
+	qcusb4->uc_ram_size = resource_size(res);
+
+	qcusb4->router_cfg = devm_platform_ioremap_resource_byname(pdev, "router_cfg");
+	if (IS_ERR(qcusb4->router_cfg))
+		return dev_err_probe(dev, PTR_ERR(qcusb4->router_cfg),
+				     "Couldn't get router_cfg region\n");
+
+	qcusb4->uc_per = devm_platform_ioremap_resource_byname(pdev, "uc_per");
+	if (IS_ERR(qcusb4->uc_per))
+		return dev_err_probe(dev, PTR_ERR(qcusb4->uc_per),
+				     "Couldn't get uc_per region\n");
+
+	qcusb4->lane0_cs = devm_platform_ioremap_resource_byname(pdev, "lane0_cs");
+	if (IS_ERR(qcusb4->lane0_cs))
+		return dev_err_probe(dev, PTR_ERR(qcusb4->lane0_cs),
+				     "Couldn't get lane0_cs region\n");
+
+	qcusb4->cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
+	if (IS_ERR(qcusb4->cfg))
+		return dev_err_probe(dev, PTR_ERR(qcusb4->cfg),
+				     "Couldn't get cfg region\n");
+
+	qcusb4->tcsr_usb4_mode = syscon_regmap_lookup_by_phandle_args(dev->of_node,
+								      "qcom,usb4-mode-sel",
+								      ARRAY_SIZE(qcusb4->tcsr_args),
+								      qcusb4->tcsr_args);
+	if (IS_ERR(qcusb4->tcsr_usb4_mode)) {
+		int ret = PTR_ERR(qcusb4->tcsr_usb4_mode);
+
+		dev_err(dev, "failed to lookup TCSR handle: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+#define USB_VID_QCOM		0x05c6
+static int qcom_usb4_setup_drom(struct qcom_usb4 *qcusb4)
+{
+	struct qcom_usb4_drom drom = { };
+	u32 uuid_hi, uuid_lo;
+
+	uuid_hi = FIELD_PREP(GENMASK(31, 16), USB_VID_QCOM) |
+		  FIELD_PREP(GENMASK(15, 0), (FIELD_GET(GENMASK(31, 28), qcusb4->chip_serial_no)));
+	uuid_lo = FIELD_PREP(GENMASK(31, 4), FIELD_GET(GENMASK(27, 0), qcusb4->chip_serial_no)) |
+		  FIELD_PREP(GENMASK(3, 0), qcusb4->instance_idx);
+
+	/* Set up the controller UUID */
+	writel(uuid_hi, qcusb4->router_cfg + ROUTER_CONFIG_CS_7);
+	writel(uuid_lo, qcusb4->router_cfg + ROUTER_CONFIG_CS_8);
+
+	/* Fill out the DROM */
+	drom.uuid = FIELD_PREP(GENMASK(63, 32), uuid_hi) |
+		    FIELD_PREP(GENMASK(31, 0), uuid_lo);
+
+	drom.tbt3.len = 0x67;
+	drom.tbt3.ver = 1;
+	drom.tbt3.vendor_id = 0x0328;
+
+	drom.dp0.len = 5;
+	drom.dp0.details.adapter_number = 6;
+	drom.dp0.details.disabled = 0;
+	drom.dp0.details.entry = 1;
+	drom.dp0.lane_adapter = 0;
+
+	drom.dp1.len = 5;
+	drom.dp1.details.adapter_number = 7;
+	drom.dp1.details.disabled = 0;
+	drom.dp1.details.entry = 1;
+	drom.dp1.lane_adapter = 0;
+
+	drom.lane0.len = 8;
+	drom.lane0.details.adapter_number = 2;
+	drom.lane0.details.disabled = 0;
+	drom.lane0.details.entry = 1;
+	drom.lane0.dual_lane = 0x80;
+	drom.lane0.secondary_adapter = 3;
+
+	drom.lane1.len = 8;
+	drom.lane1.details.adapter_number = 3;
+	drom.lane1.details.disabled = 0;
+	drom.lane1.details.entry = 1;
+	drom.lane1.dual_lane = 0x90;
+	drom.lane1.secondary_adapter = 2;
+
+	drom.pcie.len = 3;
+	drom.pcie.details.adapter_number = 4;
+	drom.pcie.details.disabled = 0;
+	drom.pcie.details.entry = 1;
+	drom.pcie.bus_func = 0;
+
+	drom.vendor.len = 0x1e;
+	drom.vendor.details.type = 1;
+	strscpy(drom.vendor.name, "Qualcomm Technologies, Inc.", sizeof(drom.vendor.name));
+
+	drom.model.len = 0x11;
+	drom.model.details.type = 2;
+	strscpy(drom.model.name, "Snapdragon 01A", sizeof(drom.model.name));
+
+	drom.tmu.len = 3;
+	drom.tmu.details.type = 8;
+	drom.tmu.mode = 6;
+
+	drom.product_descriptor.len = 0x0f;
+	drom.product_descriptor.details.type = 9;
+	drom.product_descriptor.usb_spec_ver = 0x410; /* USB4 v1.0 */
+	drom.product_descriptor.vendor_id = USB_VID_QCOM;
+	drom.product_descriptor.product_id = 0x0938;
+	drom.product_descriptor.tid = qcusb4->match_data->drom_tid;
+
+	/* Calculate some checksums */
+	drom.tbt3.crc32 = tb_crc32(&drom.tbt3.ver,
+				   sizeof(drom) - offsetof(struct qcom_usb4_drom, tbt3.ver));
+	drom.crc8 = tb_crc8((unsigned char *)&drom.uuid, 8);
+
+	/* Push it to the uC */
+	memcpy_toio(qcusb4->uc_ram + UC_RAM_DROM_OFFSET(qcusb4), &drom, sizeof(drom));
+
+	return 0;
+}
+
+static int qcom_usb4_load_firmware(struct qcom_usb4 *qcusb4)
+{
+	struct device *dev = qcusb4->nhi.dev;
+	const struct firmware *fw __free(firmware) = NULL;
+	const u8 *data, *end;
+	const char *firmware_name;
+	int ret;
+
+	ret = device_property_read_string(dev, "firmware-name", &firmware_name);
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't read firmware-name\n");
+
+	ret = request_firmware_direct(&fw, firmware_name, dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't get firmware\n");
+
+	/*
+	 * The image is a sequence of { u32 offset; u32 size; u32 data[size]; } segments, with
+	 * the offset in bytes into the uC RAM and the size in dwords.
+	 */
+	data = fw->data;
+	end = fw->data + fw->size;
+
+	while (data < end) {
+		size_t seg_bytes, seg_end;
+		u32 offset, seg_size;
+
+		if (end - data < 2 * sizeof(u32))
+			return dev_err_probe(dev, -EINVAL, "Truncated firmware segment header\n");
+
+		offset = get_unaligned_le32(data);
+		seg_size = get_unaligned_le32(data + sizeof(u32));
+		data += 2 * sizeof(u32);
+
+		if (offset % sizeof(u32))
+			return dev_err_probe(dev, -EINVAL,
+					     "Firmware has a non-aligned segment, bailing out\n");
+
+		if (check_mul_overflow((size_t)seg_size, sizeof(u32), &seg_bytes) ||
+		    seg_bytes > end - data)
+			return dev_err_probe(dev, -EINVAL, "Segment references OOB data\n");
+
+		if (check_add_overflow((size_t)offset, seg_bytes, &seg_end) ||
+		    seg_end > qcusb4->uc_ram_size)
+			return dev_err_probe(dev, -EINVAL,
+					     "Firmware contains data outside uC RAM boundaries\n");
+
+		memcpy_toio(qcusb4->uc_ram + offset, data, seg_bytes);
+
+		data += seg_bytes;
+	}
+
+	return qcom_usb4_setup_drom(qcusb4);
+}
+
+static int qcusb4_tcsr_config(struct qcom_usb4 *qcusb4, bool usb4_mode)
+{
+	int ret;
+
+	ret = regmap_assign_bits(qcusb4->tcsr_usb4_mode,
+				 qcusb4->tcsr_args[0],
+				 BIT(qcusb4->tcsr_args[1]),
+				 usb4_mode);
+	if (ret < 0)
+		dev_err(qcusb4->nhi.dev, "failed to set USB4_MODE: %d\n", ret);
+
+	return ret;
+}
+
+static int qcusb4_clks_enable(struct qcom_usb4 *qcusb4)
+{
+	int ret;
+
+	ret = clk_bulk_prepare_enable(NUM_CLKS, qcusb4->clks);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(qcusb4->hrr_clk);
+	if (ret)
+		clk_bulk_disable_unprepare(NUM_CLKS, qcusb4->clks);
+
+	return ret;
+}
+
+static void qcusb4_clks_disable(struct qcom_usb4 *qcusb4)
+{
+	clk_disable_unprepare(qcusb4->hrr_clk);
+	clk_bulk_disable_unprepare(NUM_CLKS, qcusb4->clks);
+}
+
+static void qcusb4_restore_router_state(struct qcom_usb4 *qcusb4)
+{
+	/* Spec 4.5.2 - Restore the non-persistent registers */
+	u32 router_cs_1 = readl(qcusb4->router_cs + ROUTER_CS_CS_1);
+	u32 router_cs_5 = readl(qcusb4->router_cs + ROUTER_CS_CS_5);
+	u32 lane0_cs_19 = readl(qcusb4->lane0_cs + LANEn_CS_CS_19(qcusb4));
+	u32 val;
+
+	FIELD_MODIFY(ROUTER_CS_1_UA, &router_cs_1,
+		     FIELD_GET(ROUTER_CS_1_UA, qcusb4->router_cs_1_val));
+
+	FIELD_MODIFY(ROUTER_CS_5_WOU, &router_cs_5,
+		     FIELD_GET(ROUTER_CS_5_WOU, qcusb4->router_cs_5_val));
+	FIELD_MODIFY(ROUTER_CS_5_WOP, &router_cs_5,
+		     FIELD_GET(ROUTER_CS_5_WOP, qcusb4->router_cs_5_val));
+
+	FIELD_MODIFY(PORT_CS_19_WOID, &lane0_cs_19,
+		     FIELD_GET(PORT_CS_19_WOID, qcusb4->lane0_cs_19_val));
+	FIELD_MODIFY(PORT_CS_19_WOD, &lane0_cs_19,
+		     FIELD_GET(PORT_CS_19_WOD, qcusb4->lane0_cs_19_val));
+	FIELD_MODIFY(PORT_CS_19_WOC, &lane0_cs_19,
+		     FIELD_GET(PORT_CS_19_WOC, qcusb4->lane0_cs_19_val));
+	FIELD_MODIFY(PORT_CS_19_PID, &lane0_cs_19,
+		     FIELD_GET(PORT_CS_19_PID, qcusb4->lane0_cs_19_val));
+	FIELD_MODIFY(PORT_CS_19_PC, &lane0_cs_19,
+		     FIELD_GET(PORT_CS_19_PC, qcusb4->lane0_cs_19_val));
+
+	writel(router_cs_1, qcusb4->router_cs + ROUTER_CS_CS_1);
+	writel(router_cs_5, qcusb4->router_cs + ROUTER_CS_CS_5);
+	writel(lane0_cs_19, qcusb4->lane0_cs + LANEn_CS_CS_19(qcusb4));
+
+	val = readl(qcusb4->usb_cfg + USBAP_CFG_RXTERM_BACKDOOR_CTRL);
+	FIELD_MODIFY(RXTERM_RX_TERM, &val, qcusb4->last_lfps_state);
+	writel(val, qcusb4->usb_cfg + USBAP_CFG_RXTERM_BACKDOOR_CTRL);
+}
+
+static int qcusb4_prepare_phy(struct qcom_usb4 *qcusb4)
+{
+	struct device *dev = qcusb4->nhi.dev;
+	int ret;
+
+	ret = qcusb4_tcsr_config(qcusb4, true);
+	if (ret)
+		return ret;
+
+	/* Instruct the USB3 adapter to enter USB4 mode */
+	writel(BIT(0), qcusb4->usb_cfg + USBAP_CFG_USB4_MODE);
+
+	ret = phy_init(qcusb4->phy);
+	if (ret) {
+		dev_err(dev, "PHY init failed: %d\n", ret);
+		goto err_tcsr;
+	}
+
+	ret = phy_power_on(qcusb4->phy);
+	if (ret) {
+		dev_err(dev, "PHY power on failed: %d\n", ret);
+		goto err_phy_exit;
+	}
+
+	ret = qcusb4_select_rx_clock_source(qcusb4, true);
+	if (ret)
+		goto err_phy_off;
+
+	return 0;
+
+err_phy_off:
+	phy_power_off(qcusb4->phy);
+err_phy_exit:
+	phy_exit(qcusb4->phy);
+err_tcsr:
+	qcusb4_tcsr_config(qcusb4, false);
+
+	return ret;
+}
+
+/* Take the PHY over from USB3/DP. The router must be up (IDLE or waking up) */
+static int qcusb4_acquire_phy(struct qcom_usb4 *qcusb4, const struct qcusb4_link_req *req)
+{
+	int ret;
+
+	ret = phy_set_mode_ext(qcusb4->phy, PHY_MODE_TBT, req->phy_submode);
+	if (ret) {
+		dev_err(qcusb4->nhi.dev, "PHY set_mode failed: %d\n", ret);
+		return ret;
+	}
+
+	return qcusb4_prepare_phy(qcusb4);
+}
+
+/* Hand the PHY back, allowing a USB3(+DP)-native mode switch. The router stays up on XO */
+static void qcusb4_release_phy(struct qcom_usb4 *qcusb4)
+{
+	qcusb4_select_rx_clock_source(qcusb4, false);
+
+	phy_power_off(qcusb4->phy);
+
+	/*
+	 * phy_exit() brings the PHY up in USB3 mode, which times out with the TCSR still routing
+	 * it to the router. Switch it over the same way qcusb4_enter_sleep() does.
+	 */
+	qcusb4_tcsr_config(qcusb4, false);
+
+	phy_exit(qcusb4->phy);
+}
+
+static void qcusb4_clear_router_ready(struct qcom_usb4 *qcusb4)
+{
+	u32 val;
+
+	val = readl(qcusb4->router_cfg + ROUTER_CONFIG_CS_6);
+	writel(val & ~CS_6_ROUTER_READY, qcusb4->router_cfg + ROUTER_CONFIG_CS_6);
+	/* Ensure we don't lose the race against the actual "ready" write from uC FW.. */
+	readl(qcusb4->router_cfg + ROUTER_CONFIG_CS_6);
+}
+
+static int qcusb4_usb3_adapter_reset(struct qcom_usb4 *qcusb4)
+{
+	struct device *dev = qcusb4->nhi.dev;
+	int ret;
+
+	writel(RST_USB3_RST, qcusb4->usb_cfg + USBAP_CFG_SYNC_RST_USB3);
+	usleep_range(1000, 1100);
+
+	ret = reset_control_assert(qcusb4->usb_pipe_reset);
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't assert usb_pipe reset\n");
+	usleep_range(1000, 1100);
+
+	/* Ensure the USB3 controller receives phyStatus from the adapter */
+	writel(PHYSTATUS_EN_EN, qcusb4->usb_cfg + USBAP_CFG_PHYSTATUS_EN);
+
+	ret = reset_control_deassert(qcusb4->usb_pipe_reset);
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't deassert usb_pipe reset\n");
+
+	writel(0, qcusb4->usb_cfg + USBAP_CFG_SYNC_RST_USB3);
+	usleep_range(1000, 1100);
+
+	return 0;
+}
+
+/* Cold-boot-only configuration, the uC RAM and these registers are retained across sleep */
+static int qcusb4_router_cold_init(struct qcom_usb4 *qcusb4)
+{
+	struct device *dev = qcusb4->nhi.dev;
+	u32 val;
+	int ret;
+
+	/* Disable sideband TX (may take some attempts..) */
+	for (int i = 10; i > 0; i--) {
+		val = readl(qcusb4->sideband + SIDEBAND_TX_CTRL);
+		writel(val & ~SB_TX_CTRL_TX_ENABLE, qcusb4->sideband + SIDEBAND_TX_CTRL);
+
+		val = readl(qcusb4->sideband + SIDEBAND_TX_CTRL);
+		if (!(val & SB_TX_CTRL_TX_ENABLE))
+			break;
+
+		udelay(1);
+	}
+	fsleep(10 * USEC_PER_MSEC);
+
+	/* This also sets up the UUID and the DROM */
+	ret = qcom_usb4_load_firmware(qcusb4);
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't load USB4 firmware\n");
+
+	/* Disable all CLx low power states */
+	val = readl(qcusb4->port_group + PORT_GROUP_LANE_CFG);
+	val &= ~LANE_CFG_CLx_SUPPORT(qcusb4);
+	writel(val, qcusb4->port_group + PORT_GROUP_LANE_CFG);
+
+	/* Credit allocation fixup */
+	val = readl(qcusb4->port_group + PORT_GROUP_FCM_2_CFG);
+	writel(val & ~FCM_2_CFG_DIS_ANY_HOPID, qcusb4->port_group + PORT_GROUP_FCM_2_CFG);
+
+	return 0;
+}
+
+/*
+ * The one bring-up sequence, shared between probe (@cold, from OFF) and sleep exit (from ASLEEP).
+ * @link: whether the PHY is ours, i.e. ASLEEP was entered from LINK. Leaves the router running
+ * with the uC accepting commands, the caller sets the resulting state.
+ */
+static int qcusb4_power_up(struct qcom_usb4 *qcusb4, bool cold, bool link)
+{
+	struct device *dev = qcusb4->nhi.dev;
+	u32 val;
+	int ret;
+
+	if (cold) {
+		/* The master clock runs at 19.2 MHz OOTB, give it some more. */
+		ret = dev_pm_opp_set_level(dev, 3);
+		if (ret)
+			return ret;
+
+		/* Make sure the misc resets are released before the clocks come up */
+		ret = reset_control_bulk_deassert(NUM_MISC_RESETS, qcusb4->misc_resets);
+		if (ret) {
+			dev_err_probe(dev, ret, "Couldn't deassert misc resets\n");
+			goto err_drop_opp;
+		}
+	}
+
+	if (link) {
+		ret = qcusb4_tcsr_config(qcusb4, true);
+		if (ret)
+			goto err_drop_opp;
+	}
+
+	ret = qcusb4_clks_enable(qcusb4);
+	if (ret) {
+		dev_err_probe(dev, ret, "Couldn't enable clocks\n");
+		goto err_tcsr;
+	}
+
+	if (cold) {
+		ret = clk_bulk_prepare_enable(NUM_MUX_CLKS, qcusb4->mux_clks);
+		if (ret) {
+			dev_err_probe(dev, ret, "Couldn't enable mux clocks\n");
+			goto err_clks;
+		}
+
+		/* The PHY isn't running yet */
+		ret = qcusb4_select_rx_clock_source(qcusb4, false);
+		if (ret)
+			goto err_mux_clks;
+	}
+
+	/*
+	 * Un-clamp the PHY I/Os first. The PHY itself keeps its configuration across sleep
+	 * and is not reprogrammed.
+	 */
+	if (link) {
+		ret = phy_power_on(qcusb4->phy);
+		if (ret) {
+			dev_err_probe(dev, ret, "Couldn't power on the PHY\n");
+			goto err_mux_clks;
+		}
+	}
+
+	if (cold) {
+		ret = reset_control_assert(qcusb4->core_reset);
+		if (ret) {
+			dev_err_probe(dev, ret, "Couldn't assert core reset\n");
+			goto err_phy;
+		}
+
+		usleep_range(100, 200);
+
+		ret = reset_control_deassert(qcusb4->core_reset);
+		if (ret) {
+			dev_err_probe(dev, ret, "Couldn't deassert core reset\n");
+			goto err_phy;
+		}
+
+		ret = pinctrl_select_state(qcusb4->pinctrl, qcusb4->pinctrl_active);
+		if (ret) {
+			dev_err_probe(dev, ret, "Couldn't set pinctrl active state\n");
+			goto err_phy;
+		}
+	} else {
+		ret = reset_control_bulk_assert(NUM_MISC_RESETS, qcusb4->misc_resets);
+		if (ret) {
+			dev_err_probe(dev, ret, "Couldn't assert misc resets\n");
+			goto err_phy;
+		}
+
+		usleep_range(100, 200);
+
+		ret = reset_control_bulk_deassert(NUM_MISC_RESETS, qcusb4->misc_resets);
+		if (ret) {
+			dev_err_probe(dev, ret, "Couldn't deassert misc resets\n");
+			goto err_phy;
+		}
+
+		if (link) {
+			ret = qcusb4_select_rx_clock_source(qcusb4, true);
+			if (ret)
+				goto err_phy;
+		}
+	}
+
+	ret = qcusb4_usb3_adapter_reset(qcusb4);
+	if (ret)
+		goto err_pinctrl;
+
+	scoped_guard(mutex, &qcusb4->rst_lock) {
+		qcusb4->mmio_ok = true;
+
+		/* Apply whatever the PCIe controller asked for while the router was asleep */
+		if (!cold)
+			qcusb4_pcie_sync_rst_apply(qcusb4);
+	}
+
+	if (cold) {
+		ret = qcusb4_router_cold_init(qcusb4);
+		if (ret)
+			goto err_mmio;
+	}
+
+	qcusb4_clear_router_ready(qcusb4);
+
+	/* Enable the uC */
+	val = readl(qcusb4->uc_per + UC_PER_CONTROL);
+	writel(val | PER_CONTROL_UC_ENABLE, qcusb4->uc_per + UC_PER_CONTROL);
+
+	ret = readl_poll_timeout(qcusb4->uc_per, val, (val & BIT(3)), 100, 100 * USEC_PER_MSEC);
+	if (ret) {
+		val = readl(qcusb4->uc_per);
+		dev_err_probe(dev, ret, "USB4 uC failed to initialize: 0x%08x\n", val);
+		goto err_uc;
+	}
+
+	ret = readl_poll_timeout(qcusb4->router_cfg + ROUTER_CONFIG_CS_6, val,
+				 val & CS_6_ROUTER_READY, 5 * USEC_PER_MSEC,
+				 USEC_PER_SEC);
+	if (ret) {
+		val = readl(qcusb4->router_cfg + ROUTER_CONFIG_CS_6);
+		dev_err_probe(dev, ret, "USB4 router failed to initialize: 0x%08x\n", val);
+		goto err_uc;
+	}
+
+	enable_irq(qcusb4->fw_ev_irq);
+
+	/* Unmask the firmware interrupt */
+	val = readl(qcusb4->uc_per + UC_PER_FW_INT_MASK);
+	writel(val | PER_FW_INT_MASK_FW_INT, qcusb4->uc_per + UC_PER_FW_INT_MASK);
+
+	/* Unmask PCIe AP interrupts */
+	val = readl(qcusb4->pcie_cfg + PCIEAP_CONFIG_IRQ_MASK);
+	writel(val | PCIEAP_IRQ_PE_DEASSERT | PCIEAP_IRQ_PE_ASSERT,
+	       qcusb4->pcie_cfg + PCIEAP_CONFIG_IRQ_MASK);
+
+	enable_irq(qcusb4->pcieap_irq);
+
+	scoped_guard(mutex, &qcusb4->uc_cmd_lock)
+		qcusb4->uc_online = true;
+
+	qcusb4_fw_cmd(qcusb4, FW_CMD_LIMIT_LOGLEVEL, LOG_LEVEL_WARN);
+
+	return 0;
+
+err_uc:
+	val = readl(qcusb4->uc_per + UC_PER_CONTROL);
+	writel(val & ~PER_CONTROL_UC_ENABLE, qcusb4->uc_per + UC_PER_CONTROL);
+err_mmio:
+	scoped_guard(mutex, &qcusb4->rst_lock)
+		qcusb4->mmio_ok = false;
+err_pinctrl:
+	if (cold)
+		pinctrl_select_state(qcusb4->pinctrl, qcusb4->pinctrl_inactive);
+err_phy:
+	/* Keep the PHY refcounts balanced for the next resume attempt or remove */
+	if (link)
+		phy_power_off(qcusb4->phy);
+err_mux_clks:
+	if (cold)
+		clk_bulk_disable_unprepare(NUM_MUX_CLKS, qcusb4->mux_clks);
+err_clks:
+	qcusb4_clks_disable(qcusb4);
+err_tcsr:
+	if (link)
+		qcusb4_tcsr_config(qcusb4, false);
+err_drop_opp:
+	if (cold)
+		dev_pm_opp_set_opp(dev, NULL);
+
+	return ret;
+}
+
+/* Stop the uC and the IRQs that talk to it, the router stays clocked */
+static void qcusb4_halt_uc(struct qcom_usb4 *qcusb4)
+{
+	u32 val;
+
+	disable_irq(qcusb4->pcieap_irq);
+	disable_irq(qcusb4->fw_ev_irq);
+
+	/* Mask the firmware interrupt */
+	val = readl(qcusb4->uc_per + UC_PER_FW_INT_MASK);
+	writel(val & ~PER_FW_INT_MASK_FW_INT, qcusb4->uc_per + UC_PER_FW_INT_MASK);
+
+	/* Disable the uC */
+	val = readl(qcusb4->uc_per + UC_PER_CONTROL);
+	writel(val & ~PER_CONTROL_UC_ENABLE, qcusb4->uc_per + UC_PER_CONTROL);
+}
+
+/* IDLE/LINK -> OFF, for remove and the probe error path */
+static void qcusb4_power_off(struct qcom_usb4 *qcusb4)
+{
+	lockdep_assert_held(&qcusb4->state_lock);
+
+	if (WARN_ON(qcusb4->current_state != QCUSB4_IDLE && qcusb4->current_state != QCUSB4_LINK))
+		return;
+
+	scoped_guard(mutex, &qcusb4->uc_cmd_lock)
+		qcusb4->uc_online = false;
+
+	scoped_guard(mutex, &qcusb4->rst_lock)
+		qcusb4->mmio_ok = false;
+
+	qcusb4_halt_uc(qcusb4);
+
+	if (qcusb4->current_state == QCUSB4_LINK) {
+		qcusb4_select_rx_clock_source(qcusb4, false);
+		phy_power_off(qcusb4->phy);
+	}
+
+	/*
+	 * The SYS, DP and HRR clocks are sourced from the PHY, so they can only halt as long as it
+	 * hasn't been handed back. phy_exit() in turn needs the TCSR switched over, see
+	 * qcusb4_release_phy().
+	 */
+	clk_disable_unprepare(qcusb4->hrr_clk);
+	clk_bulk_disable_unprepare(NUM_MUX_CLKS, qcusb4->mux_clks);
+
+	if (qcusb4->current_state == QCUSB4_LINK) {
+		qcusb4_tcsr_config(qcusb4, false);
+		phy_exit(qcusb4->phy);
+	}
+
+	clk_bulk_disable_unprepare(NUM_CLKS, qcusb4->clks);
+
+	pinctrl_select_state(qcusb4->pinctrl, qcusb4->pinctrl_inactive);
+
+	dev_pm_opp_set_opp(qcusb4->nhi.dev, NULL);
+
+	qcusb4->current_state = QCUSB4_OFF;
+}
+
+static u32 qcusb4_begin_hse_args(struct qcom_usb4 *qcusb4, const struct qcusb4_link_req *req)
+{
+	u32 args = 0;
+
+	if (req->phy_submode == PHY_SUBMODE_USB4)
+		args |= BIT(0);
+
+	if (req->orientation == TYPEC_ORIENTATION_REVERSE)
+		args |= BIT(1);
+
+	/* TODO: do not set this bit if an onboard retimer (such as PS883x) is absent */
+	args |= BIT(2);
+
+	if (req->active_cable)
+		args |= BIT(3);
+
+	if (req->cable_legacy_tbt3)
+		args |= BIT(4);
+
+	if (req->cable_max_gen >= EUDO_CABLE_SPEED_USB4_GEN3)
+		args |= FIELD_PREP(GENMASK(6, 5), req->cable_max_gen - EUDO_CABLE_SPEED_USB4_GEN2);
+
+	return args;
+}
+
+/* Kick off link establishment, the PHY must already be ours */
+static int qcusb4_begin_hse(struct qcom_usb4 *qcusb4, const struct qcusb4_link_req *req)
+{
+	struct device *dev = qcusb4->nhi.dev;
+	u64 tx_eq_presets;
+	int ret;
+
+	/* Choose which PHY presets to offer during link establishment */
+	if (device_property_read_u64(dev, "tx-equalization-presets", &tx_eq_presets))
+		tx_eq_presets = PHY_PRESETS_DEFAULT;
+
+	ret = qcusb4_fw_cmd(qcusb4, FW_CMD_ENABLE_PHY_PRESETS,
+			    FIELD_GET(GENMASK(23, 0), tx_eq_presets));
+	if (ret)
+		return ret;
+
+	if (is_usb4v2(qcusb4)) {
+		ret = qcusb4_fw_cmd(qcusb4, FW_CMD_ENABLE_PHY_PRESETS_MSB,
+				    FIELD_GET(GENMASK(41, 24), tx_eq_presets));
+		if (ret)
+			return ret;
+	}
+
+	return qcusb4_fw_cmd(qcusb4, FW_CMD_BEGIN_HSE, qcusb4_begin_hse_args(qcusb4, req));
+}
+
+static int qcusb4_idle_to_link(struct qcom_usb4 *qcusb4, const struct qcusb4_link_req *req)
+{
+	int ret;
+
+	lockdep_assert_held(&qcusb4->state_lock);
+
+	ret = qcusb4_acquire_phy(qcusb4, req);
+	if (ret)
+		return ret;
+
+	ret = qcusb4_begin_hse(qcusb4, req);
+	if (ret) {
+		qcusb4_release_phy(qcusb4);
+		return ret;
+	}
+
+	qcusb4->link = *req;
+	qcusb4->link_fw_gone = false;
+	qcusb4->current_state = QCUSB4_LINK;
+
+	return 0;
+}
+
+/* IDLE/LINK -> ASLEEP. Returns -EBUSY with the router still up if the FW won't go to sleep */
+static int qcusb4_enter_sleep(struct qcom_usb4 *qcusb4)
+{
+	struct device *dev = qcusb4->nhi.dev;
+	bool acked;
+	int ret;
+	u32 val;
+
+	lockdep_assert_held(&qcusb4->state_lock);
+
+	if (qcusb4->current_state == QCUSB4_ASLEEP)
+		return 0;
+
+	if (WARN_ON(qcusb4->current_state == QCUSB4_OFF))
+		return -EINVAL;
+
+	if (!wait_for_completion_timeout(&qcusb4->sleep_ready, msecs_to_jiffies(500))) {
+		dev_err(dev, "Router firmware didn't ack sleep readiness in time\n");
+		return -EBUSY;
+	}
+
+	/* Spec 4.5.2 - Save some non-persistent registers */
+	qcusb4->router_cs_1_val = readl(qcusb4->router_cs + ROUTER_CS_CS_1);
+	qcusb4->router_cs_5_val = readl(qcusb4->router_cs + ROUTER_CS_CS_5);
+	qcusb4->lane0_cs_19_val = readl(qcusb4->lane0_cs + LANEn_CS_CS_19(qcusb4));
+
+	/* Qualcomm-specific */
+	val = readl(qcusb4->usb_cfg + USBAP_CFG_RXTERM_BACKDOOR_STS);
+	qcusb4->last_lfps_state = FIELD_GET(RXTERM_RX_TERM, val);
+
+	/* Mask phyStatus coming from USB3AP to the USB3 controller */
+	val = readl(qcusb4->usb_cfg + USBAP_CFG_PHYSTATUS_EN);
+	writel(val & ~PHYSTATUS_EN_EN, qcusb4->usb_cfg + USBAP_CFG_PHYSTATUS_EN);
+
+	scoped_guard(mutex, &qcusb4->uc_cmd_lock) {
+		reinit_completion(&qcusb4->sleep_acked);
+
+		ret = __qcusb4_fw_cmd(qcusb4, FW_CMD_COMPLETE_SLEEP, 0);
+		/* With a lot of printing, this may seemingly time out */
+		if (ret != -EAGAIN)
+			qcusb4->uc_online = false;
+	}
+	if (ret == -EAGAIN)
+		goto err_unmask;
+
+	acked = wait_for_completion_timeout(&qcusb4->sleep_acked, msecs_to_jiffies(3000));
+	if (!acked) {
+		/* The ack may still be queued up behind other FW events in the IRQ thread */
+		synchronize_irq(qcusb4->fw_ev_irq);
+		acked = try_wait_for_completion(&qcusb4->sleep_acked);
+	}
+
+	if (!acked) {
+		dev_err(dev, "Router firmware didn't ack sleep entry in time, STATUS=0x%08x\n",
+			readl(qcusb4->uc_per));
+
+		/*
+		 * Powering anything off now is what takes the platform down. Nothing has been
+		 * yet, so ask the FW to resume and fail the suspend instead.
+		 */
+		scoped_guard(mutex, &qcusb4->uc_cmd_lock) {
+			qcusb4->uc_online = true;
+			__qcusb4_fw_cmd(qcusb4, FW_CMD_WAKEUP, WAKEUP_REASON_SYSTEM);
+		}
+
+		ret = -EBUSY;
+		goto err_unmask;
+	}
+
+	scoped_guard(mutex, &qcusb4->rst_lock)
+		qcusb4->mmio_ok = false;
+
+	/*
+	 * Also keeps events from arriving after the clocks are disabled. The PCIe AP IRQ is
+	 * NO_SUSPEND and could otherwise fire on wake.
+	 */
+	qcusb4_halt_uc(qcusb4);
+
+	/*
+	 * The router is already down at this point and can't be brought back without a full
+	 * power_up, so carry on with the teardown even if the below fails.
+	 */
+	ret = qcusb4_select_rx_clock_source(qcusb4, false);
+	if (ret)
+		dev_warn(dev, "Couldn't move the RX clocks to XO: %d\n", ret);
+
+	/* The PHY stays initialized (and ours) across sleep, only its I/Os get clamped */
+	if (qcusb4->current_state == QCUSB4_LINK)
+		phy_power_off(qcusb4->phy);
+
+	ret = qcusb4_tcsr_config(qcusb4, false);
+	if (ret)
+		dev_warn(dev, "Couldn't switch the TCSR to sleep config: %d\n", ret);
+
+	qcusb4_clks_disable(qcusb4);
+
+	qcusb4->sleep_from = qcusb4->current_state;
+	qcusb4->current_state = QCUSB4_ASLEEP;
+
+	return 0;
+
+err_unmask:
+	val = readl(qcusb4->usb_cfg + USBAP_CFG_PHYSTATUS_EN);
+	writel(val | PHYSTATUS_EN_EN, qcusb4->usb_cfg + USBAP_CFG_PHYSTATUS_EN);
+
+	return ret;
+}
+
+static struct qcusb4_link_req qcusb4_get_desired_state(struct qcom_usb4 *qcusb4)
+{
+	guard(mutex)(&qcusb4->typec_lock);
+
+	return qcusb4->desired_state;
+}
+
+/*
+ * ASLEEP/OFF -> IDLE. A FW woken up from sleep goes for the PHY it had, or for a cable plugged in
+ * meanwhile, and doing so without a PHY set up for it takes the SoC down. Have it start over
+ * without a PHY instead, same as on probe.
+ */
+static int qcusb4_restart_cold(struct qcom_usb4 *qcusb4)
+{
+	int ret;
+
+	if (qcusb4->current_state == QCUSB4_ASLEEP) {
+		clk_bulk_disable_unprepare(NUM_MUX_CLKS, qcusb4->mux_clks);
+		pinctrl_select_state(qcusb4->pinctrl, qcusb4->pinctrl_inactive);
+		qcusb4->current_state = QCUSB4_OFF;
+	}
+
+	/* The reloaded FW sets its event ring up from scratch */
+	qcusb4->fw_ev_rb_base = NULL;
+
+	ret = qcusb4_power_up(qcusb4, true, false);
+	if (ret)
+		return ret;
+
+	qcusb4->current_state = QCUSB4_IDLE;
+
+	return 0;
+}
+
+#define SLEEP_EXIT_CL0_MAX_RETRIES	500
+/* ASLEEP/OFF -> IDLE/LINK, the router is register-accessible afterwards unless this fails */
+static int qcusb4_exit_sleep(struct qcom_usb4 *qcusb4)
+{
+	struct device *dev = qcusb4->nhi.dev;
+	struct qcusb4_link_req req;
+	u8 wakeup_reason;
+	int ret;
+	u32 val;
+
+	lockdep_assert_held(&qcusb4->state_lock);
+
+	if (qcusb4->current_state != QCUSB4_ASLEEP && qcusb4->current_state != QCUSB4_OFF)
+		return 0;
+
+	/*
+	 * Without a PHY, a cable plugged in during sleep can't be woken up into: the Type-C side
+	 * may not even have reported it yet (it resumes later). Leave the link to the reconcile
+	 * work instead. A previously failed restart (OFF) is retried here as well.
+	 */
+	if (qcusb4->current_state == QCUSB4_OFF || qcusb4->sleep_from == QCUSB4_IDLE)
+		return qcusb4_restart_cold(qcusb4);
+
+	req = qcusb4_get_desired_state(qcusb4);
+
+	ret = qcusb4_power_up(qcusb4, false, true);
+	if (ret)
+		return ret;
+
+	val = readl(qcusb4->lane0_cs + LANEn_CS_CS_18(qcusb4));
+
+	if (val & PORT_CS_18_WOCS)
+		wakeup_reason = WAKEUP_REASON_CBL_CON;
+	else if (val & PORT_CS_18_WODS)
+		wakeup_reason = WAKEUP_REASON_CBL_DIS;
+	else if (val & (PORT_CS_18_WOU4S | PORT_CS_18_WOIDS))
+		wakeup_reason = WAKEUP_REASON_DEVICE;
+	else
+		wakeup_reason = WAKEUP_REASON_SYSTEM;
+
+	/* Unplugged while asleep, don't have the FW run a handshake on a dead link */
+	if (!req.usb4)
+		wakeup_reason = WAKEUP_REASON_CBL_DIS;
+
+	qcusb4_restore_router_state(qcusb4);
+
+	ret = qcusb4_fw_cmd(qcusb4, FW_CMD_WAKEUP, wakeup_reason);
+	if (ret)
+		dev_warn(dev, "Couldn't send WAKEUP: %d\n", ret);
+
+	if (wakeup_reason != WAKEUP_REASON_CBL_DIS) {
+		/* Poll for CL0 entry as the uC carries out its resume */
+		for (int retries = 1; retries <= SLEEP_EXIT_CL0_MAX_RETRIES; retries++) {
+			val = readl(qcusb4->lane0_cs + LANEn_CS_CS_1(qcusb4));
+
+			if (FIELD_GET(LANEn_CS_CS_1_ADAPTER_STATE, val) == TB_PORT_UP)
+				break;
+
+			/* The cable might be unplugged unexpectedly */
+			if (!qcusb4_get_desired_state(qcusb4).usb4)
+				break;
+
+			fsleep(10 * USEC_PER_MSEC);
+
+			if (retries == SLEEP_EXIT_CL0_MAX_RETRIES)
+				dev_warn(dev, "Device hasn't re-entered CL0 after 5 seconds\n");
+		}
+	}
+
+	qcusb4->link_fw_gone = wakeup_reason == WAKEUP_REASON_CBL_DIS;
+	qcusb4->current_state = QCUSB4_LINK;
+
+	return 0;
+}
+
+static void qcusb4_link_to_idle(struct qcom_usb4 *qcusb4)
+{
+	struct device *dev = qcusb4->nhi.dev;
+	struct tb *tb = dev_get_drvdata(dev);
+	int ret;
+
+	lockdep_assert_held(&qcusb4->state_lock);
+
+	/* A sleep exit that found the cable gone has already sent WAKEUP(CBL_DIS) */
+	if (!qcusb4->link_fw_gone) {
+		ret = qcusb4_fw_cmd_wait(qcusb4, FW_CMD_PHYS_DISCONNECT, 0,
+					 &qcusb4->disconnect_acked, 500);
+		/* Carry on regardless, the PHY is about to be repurposed anyway */
+		if (ret)
+			dev_warn(dev, "Router firmware didn't ack cable disconnect: %d\n", ret);
+	}
+
+	/*
+	 * The FW keeps going for a while after acking the disconnect, and the PHY can only be
+	 * taken away from it through a full sleep handshake. COMPLETE_SLEEP in turn requires the
+	 * TBT layer to have put the host router to sleep (_SLP) first, so cycle the domain through
+	 * runtime sleep around handing the PHY back.
+	 */
+	ret = tb_domain_runtime_suspend(tb);
+	if (ret) {
+		dev_err(dev, "Couldn't suspend the domain after cable removal: %d\n", ret);
+		goto out_fw_gone;
+	}
+
+	ret = qcusb4_enter_sleep(qcusb4);
+	if (ret) {
+		/*
+		 * Having been asked to wake back up mid-sleep, the FW won't go through another
+		 * sleep handshake, so retrying from here only ever times out again. With the cable
+		 * gone there's nothing to preserve, so power the router off and start over.
+		 */
+		dev_err(dev, "Couldn't put the router to sleep after cable removal: %d, forcing a restart\n",
+			ret);
+		qcusb4_power_off(qcusb4);
+	} else {
+		phy_exit(qcusb4->phy);
+	}
+
+	qcusb4->link_fw_gone = false;
+
+	/* The PHY is in USB3 mode now, it mustn't be woken up into */
+	ret = qcusb4_restart_cold(qcusb4);
+	if (ret) {
+		dev_err(dev, "Couldn't restart the router after cable removal: %d\n", ret);
+		return;
+	}
+
+	/* The router has been reset, the TBT core finds the topology gone */
+	tb_domain_runtime_resume(tb);
+	return;
+
+out_fw_gone:
+	/*
+	 * Still in LINK, but the FW has already been told the cable is gone. The next reconcile
+	 * retries from the domain suspend, without another PHYS_DISCONNECT.
+	 */
+	qcusb4->link_fw_gone = true;
+}
+
+static int qcusb4_router_runtime_suspend(struct tb_nhi *nhi)
+{
+	struct qcom_usb4 *qcusb4 = container_of(nhi, struct qcom_usb4, nhi);
+
+	guard(mutex)(&qcusb4->state_lock);
+
+	return qcusb4_enter_sleep(qcusb4);
+}
+
+static int qcusb4_router_suspend_noirq(struct tb_nhi *nhi, bool wakeup)
+{
+	return qcusb4_router_runtime_suspend(nhi);
+}
+
+static int qcusb4_router_resume(struct tb_nhi *nhi)
+{
+	struct qcom_usb4 *qcusb4 = container_of(nhi, struct qcom_usb4, nhi);
+
+	guard(mutex)(&qcusb4->state_lock);
+
+	return qcusb4_exit_sleep(qcusb4);
+}
+
+/* Brings the hardware in line with what the Type-C side asked for */
+static void qcusb4_reconcile_work(struct work_struct *work)
+{
+	struct qcom_usb4 *qcusb4 = container_of(work, struct qcom_usb4, reconcile_work);
+	struct device *dev = qcusb4->nhi.dev;
+	struct qcusb4_link_req req;
+	int ret;
+
+	req = qcusb4_get_desired_state(qcusb4);
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		dev_err(dev, "Couldn't resume the host router: %d\n", ret);
+		return;
+	}
+
+	scoped_guard(mutex, &qcusb4->state_lock) {
+		if (qcusb4->current_state == QCUSB4_IDLE && req.usb4) {
+			ret = qcusb4_idle_to_link(qcusb4, &req);
+			if (ret)
+				dev_err(dev, "Couldn't bring up the USB4 link: %d\n", ret);
+		} else if (qcusb4->current_state == QCUSB4_LINK && !req.usb4) {
+			qcusb4_link_to_idle(qcusb4);
+		}
+	}
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+}
+
+static int qcom_usb4_sw_set(struct typec_switch_dev *sw,
+			    enum typec_orientation orientation)
+{
+	struct qcom_usb4 *qcusb4 = typec_switch_get_drvdata(sw);
+
+	guard(mutex)(&qcusb4->typec_lock);
+
+	qcusb4->desired_state.orientation = orientation;
+
+	return 0;
+}
+
+static int qcom_usb4_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
+{
+	struct qcom_usb4 *qcusb4 = typec_mux_get_drvdata(mux);
+	struct qcusb4_link_req req = { .usb4 = true };
+	struct typec_thunderbolt_data *tbt_data;
+	struct enter_usb_data *usb4_data;
+
+	guard(mutex)(&qcusb4->typec_lock);
+
+	if (state->alt && state->alt->svid == USB_TYPEC_TBT_SID) {
+		req.phy_submode = PHY_SUBMODE_TBT3;
+
+		tbt_data = state->data;
+
+		req.cable_max_gen = TBT_CABLE_SPEED(tbt_data->cable_mode);
+
+		if (FIELD_GET(TBT_CABLE_ACTIVE_PASSIVE, tbt_data->cable_mode)) {
+			req.active_cable = true;
+			req.cable_legacy_tbt3 = true;
+		}
+	} else if (state->mode == TYPEC_MODE_USB4) {
+		req.phy_submode = PHY_SUBMODE_USB4;
+
+		usb4_data = state->data;
+
+		req.cable_max_gen = FIELD_GET(EUDO_CABLE_SPEED_MASK, usb4_data->eudo);
+
+		/* Routers that aren't USB4 v2 can't go beyond Gen 3 regardless of the cable */
+		if (!is_usb4v2(qcusb4))
+			req.cable_max_gen = min(req.cable_max_gen, EUDO_CABLE_SPEED_USB4_GEN3);
+
+		if (FIELD_GET(EUDO_CABLE_TYPE_MASK, usb4_data->eudo) == EUDO_CABLE_TYPE_RE_TIMER)
+			req.active_cable = true;
+	} else if (state->mode == TYPEC_STATE_SAFE) {
+		/* SAFE may be transient, e.g. during DP altmode entry */
+		if (qcusb4->desired_state.orientation != TYPEC_ORIENTATION_NONE)
+			return 0;
+
+		/* The USB4 router still receives Type-C events even after it's disengaged */
+		if (!qcusb4->desired_state.usb4)
+			return 0;
+
+		req.usb4 = false;
+	} else {
+		/* Do nothing for e.g. DP altmode */
+		return 0;
+	}
+
+	req.orientation = qcusb4->desired_state.orientation;
+	qcusb4->desired_state = req;
+
+	/*
+	 * Only record the request here. Acting on it talks to the FW and reconfigures the PHY,
+	 * which must not interleave with a system suspend/resume, so it runs from a freezable
+	 * workqueue. That also keeps the long chain of typec_mux() calls short, as otherwise
+	 * the PAN_ACK will arrive too late and the FW will get confused (with the visible result
+	 * of that being repeated UCSI messages).
+	 */
+	if (qcusb4->reconcile_enabled)
+		queue_work(qcusb4->wq, &qcusb4->reconcile_work);
+
+	return 0;
+}
+
+static int qcusb4_ring_request_irq(struct tb_ring *ring, bool no_suspend)
+{
+	struct tb_nhi *nhi = ring->nhi;
+	struct qcom_usb4 *qcusb4 = container_of(nhi, struct qcom_usb4, nhi);
+
+	ring->irq = qcusb4->ring_irq;
+	ring->vector = 0;
+
+	return 0;
+}
+
+static void qcusb4_ring_release_irq(struct tb_ring *ring)
+{
+	ring->irq = 0;
+}
+
+static int qcusb4_init_interrupts(struct tb_nhi *nhi)
+{
+	struct qcom_usb4 *qcusb4 = container_of(nhi, struct qcom_usb4, nhi);
+	struct device *dev = qcusb4->nhi.dev;
+	int ret;
+
+	ret = devm_request_threaded_irq(dev, qcusb4->ring_irq, nhi_msi, nhi_msi_thread,
+					IRQF_ONESHOT | IRQF_NO_SUSPEND, "thunderbolt",
+					&qcusb4->nhi);
+	if (ret)
+		dev_err(dev, "failed to request IRQ: %d\n", ret);
+
+	return ret;
+}
+
+static void qcusb4_pre_switch_suspend(struct tb_nhi *nhi)
+{
+	struct qcom_usb4 *qcusb4 = container_of(nhi, struct qcom_usb4, nhi);
+
+	reinit_completion(&qcusb4->sleep_ready);
+}
+
+const struct tb_nhi_ops qcom_nhi_ops = {
+	.suspend_noirq = qcusb4_router_suspend_noirq,
+	.resume_noirq = qcusb4_router_resume,
+	.runtime_suspend = qcusb4_router_runtime_suspend,
+	.runtime_resume = qcusb4_router_resume,
+	.request_ring_irq = qcusb4_ring_request_irq,
+	.release_ring_irq = qcusb4_ring_release_irq,
+	.init_interrupts = qcusb4_init_interrupts,
+	.pre_switch_suspend = qcusb4_pre_switch_suspend,
+};
+
+static void qcom_usb4_clear_wake(void *data)
+{
+	struct device *dev = data;
+
+	dev_pm_clear_wake_irq(dev);
+}
+
+static void qcom_usb4_unregister_typec_mux(void *data)
+{
+	typec_mux_unregister(data);
+}
+
+static void qcom_usb4_unregister_typec_switch(void *data)
+{
+	typec_switch_unregister(data);
+}
+
+static void qcom_usb4_del_device_link(void *data)
+{
+	device_link_del(data);
+}
+
+static int qcom_usb4_attach_power_domains(struct qcom_usb4 *qcusb4)
+{
+	static const char * const usb4_pd_name[] = { "usb4" };
+	static const char * const pcie_pd_name[] = { "pcie" };
+	struct device *dev = qcusb4->nhi.dev;
+	const struct dev_pm_domain_attach_data usb4_pd_data = {
+		.pd_names = usb4_pd_name,
+		.num_pd_names = ARRAY_SIZE(usb4_pd_name),
+		.pd_flags = PD_FLAG_DEV_LINK_ON | PD_FLAG_REQUIRED_OPP,
+	};
+	const struct dev_pm_domain_attach_data pcie_pd_data = {
+		.pd_names = pcie_pd_name,
+		.num_pd_names = ARRAY_SIZE(pcie_pd_name),
+		.pd_flags = PD_FLAG_NO_DEV_LINK,
+	};
+	int ret;
+
+	if (dev->pm_domain)
+		return 0;
+
+	ret = devm_pm_domain_attach_list(dev, &usb4_pd_data,
+					 &qcusb4->usb4_pd);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Couldn't attach USB4 power domain\n");
+	if (!ret)
+		return 0;
+
+	ret = devm_pm_domain_attach_list(dev, &pcie_pd_data,
+					 &qcusb4->pcie_pd);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Couldn't attach PCIe power domain\n");
+	if (!ret)
+		return dev_err_probe(dev, -ENODEV,
+				     "PCIe power domain is missing\n");
+
+	qcusb4->pcie_pd_link = device_link_add(dev,
+					       qcusb4->pcie_pd->pd_devs[0],
+					       DL_FLAG_STATELESS);
+	if (!qcusb4->pcie_pd_link)
+		return dev_err_probe(dev, -EINVAL,
+				     "Couldn't link PCIe power domain\n");
+
+	return devm_add_action_or_reset(dev, qcom_usb4_del_device_link,
+					qcusb4->pcie_pd_link);
+}
+
+static int qcom_usb4_probe(struct platform_device *pdev)
+{
+	const struct qcom_usb4_match_data *match_data;
+	struct typec_switch_desc sw_desc = { };
+	struct typec_mux_desc mux_desc = { };
+	struct device *dev = &pdev->dev;
+	struct qcom_usb4 *qcusb4;
+	struct resource *res;
+	int wakeirq;
+	int ret;
+	int i;
+
+	/* SMEM is required to fetch the SoC serial number.. this shouldn't really ever fail */
+	if (!qcom_smem_is_available())
+		return -EPROBE_DEFER;
+
+	qcusb4 = devm_kzalloc(dev, sizeof(*qcusb4), GFP_KERNEL);
+	if (!qcusb4)
+		return -ENOMEM;
+
+	qcusb4->fw_events_buf = devm_kzalloc(dev, FW_EV_BUF_SIZE, GFP_KERNEL);
+	if (!qcusb4->fw_events_buf)
+		return -ENOMEM;
+
+	mutex_init(&qcusb4->rst_lock);
+	mutex_init(&qcusb4->state_lock);
+	mutex_init(&qcusb4->typec_lock);
+	mutex_init(&qcusb4->uc_cmd_lock);
+
+	qcusb4->current_state = QCUSB4_OFF;
+	qcusb4->desired_state.orientation = TYPEC_ORIENTATION_NONE;
+
+	init_completion(&qcusb4->disconnect_acked);
+	init_completion(&qcusb4->sleep_acked);
+	init_completion(&qcusb4->sleep_ready);
+
+	qcusb4->wq = devm_alloc_ordered_workqueue(dev, "qcusb4", WQ_FREEZABLE);
+	if (!qcusb4->wq)
+		return -ENOMEM;
+
+	ret = devm_work_autocancel(dev, &qcusb4->reconcile_work, qcusb4_reconcile_work);
+	if (ret)
+		return ret;
+
+	/* Everything sits behind an SMMU instance, always */
+	qcusb4->nhi.iommu_dma_protection = true;
+	qcusb4->nhi.dev = dev;
+
+	ret = qcom_usb4_attach_power_domains(qcusb4);
+	if (ret)
+		return ret;
+
+	qcusb4->nhi.iobase = devm_platform_ioremap_resource_byname(pdev, "nhi");
+	ret = PTR_ERR_OR_ZERO(qcusb4->nhi.iobase);
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't get NHI region\n");
+
+	ret = qcom_usb4_get_mmio_regions(qcusb4);
+	if (ret)
+		return ret;
+
+	qcusb4->pinctrl = devm_pinctrl_get(dev);
+	if (IS_ERR(qcusb4->pinctrl))
+		return dev_err_probe(dev, PTR_ERR(qcusb4->pinctrl),
+				     "Couldn't get pinctrl entries\n");
+
+	qcusb4->pinctrl_active = pinctrl_lookup_state(qcusb4->pinctrl, "default");
+	if (IS_ERR(qcusb4->pinctrl_active))
+		return dev_err_probe(dev, PTR_ERR(qcusb4->pinctrl_active),
+				     "Couldn't get default pin state\n");
+
+	qcusb4->pinctrl_inactive = pinctrl_lookup_state(qcusb4->pinctrl, "reset");
+	if (IS_ERR(qcusb4->pinctrl_inactive))
+		return dev_err_probe(dev, PTR_ERR(qcusb4->pinctrl_inactive),
+				     "Couldn't get reset pin state\n");
+
+	ret = pinctrl_select_state(qcusb4->pinctrl, qcusb4->pinctrl_inactive);
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't set pinctrl reset state\n");
+
+	qcusb4->phy = devm_phy_get(dev, "usb4");
+	if (IS_ERR(qcusb4->phy))
+		return dev_err_probe(dev, PTR_ERR(qcusb4->phy), "Couldn't get the USB4 phy\n");
+
+	/* NoC clocks ought to be enabled first */
+	qcusb4->clks[0].id = "noc_aggr_south";
+	qcusb4->clks[1].id = "noc_sys";
+	qcusb4->clks[2].id = "master";
+	qcusb4->clks[3].id = "tmu";
+	qcusb4->clks[4].id = "ahb";
+	qcusb4->clks[5].id = "axi";
+	qcusb4->clks[6].id = "sb";
+	qcusb4->clks[7].id = "pcie_pipe";
+	qcusb4->clks[8].id = "usb_pipe";
+	ret = devm_clk_bulk_get(dev, NUM_CLKS, qcusb4->clks);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Couldn't get clocks\n");
+
+	qcusb4->hrr_clk = devm_clk_get_optional(dev, "hrr");
+	if (IS_ERR(qcusb4->hrr_clk))
+		return dev_err_probe(dev, PTR_ERR(qcusb4->hrr_clk),
+				     "Couldn't get the HRR clock\n");
+
+	qcusb4->mux_clks[0].id = "sys";
+	qcusb4->mux_clks[MUX_CLK_PHY_RX0].id = "phy_rx0";
+	qcusb4->mux_clks[MUX_CLK_PHY_RX1].id = "phy_rx1";
+	qcusb4->mux_clks[MUX_CLK_DP0].id = "dp0";
+	qcusb4->mux_clks[MUX_CLK_DP1].id = "dp1";
+	ret = devm_clk_bulk_get(dev, NUM_MUX_CLKS, qcusb4->mux_clks);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Couldn't get clocks\n");
+
+	qcusb4->core_reset = devm_reset_control_get_optional_exclusive(dev, "core");
+	if (IS_ERR(qcusb4->core_reset))
+		return dev_err_probe(dev, PTR_ERR(qcusb4->core_reset),
+				     "Couldn't get core reset\n");
+
+	qcusb4->usb_pipe_reset = devm_reset_control_get_optional_exclusive(dev, "usb_pipe");
+	if (IS_ERR(qcusb4->usb_pipe_reset))
+		return dev_err_probe(dev, PTR_ERR(qcusb4->usb_pipe_reset),
+				     "Couldn't get usb_pipe reset\n");
+
+	qcusb4->misc_resets[0].id = "sys";
+	qcusb4->misc_resets[1].id = "rx0";
+	qcusb4->misc_resets[2].id = "rx1";
+	qcusb4->misc_resets[3].id = "pcie_pipe";
+	qcusb4->misc_resets[4].id = "tmu";
+	qcusb4->misc_resets[5].id = "hia_master";
+	qcusb4->misc_resets[6].id = "dp0";
+	qcusb4->misc_resets[7].id = "dp1";
+	ret = devm_reset_control_bulk_get_exclusive(dev, NUM_MISC_RESETS, qcusb4->misc_resets);
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't get misc resets\n");
+
+	ret = dev_pm_opp_of_find_icc_paths(dev, NULL);
+	if (ret)
+		return ret;
+
+	ret = devm_pm_opp_set_clkname(dev, "master");
+	if (ret)
+		return ret;
+
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Invalid OPP table\n");
+
+	qcusb4->nhi.ops = &qcom_nhi_ops;
+
+	/* All three rings share a single interrupt */
+	qcusb4->ring_irq = platform_get_irq_byname(pdev, "ring_data");
+	if (qcusb4->ring_irq < 0)
+		return qcusb4->ring_irq;
+
+	wakeirq = platform_get_irq_byname(pdev, "wake");
+	if (wakeirq < 0)
+		return wakeirq;
+
+	ret = dev_pm_set_dedicated_wake_irq(dev, wakeirq);
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't set the wake interrupt\n");
+
+	ret = devm_add_action_or_reset(dev, qcom_usb4_clear_wake, dev);
+	if (ret)
+		return ret;
+
+	qcusb4->fw_ev_irq = platform_get_irq_byname(pdev, "fw");
+	if (qcusb4->fw_ev_irq < 0)
+		return dev_err_probe(dev, qcusb4->fw_ev_irq, "Couldn't get firmware interrupt");
+
+	ret = devm_request_threaded_irq(dev, qcusb4->fw_ev_irq, qcom_usb4_fw_irq_handler,
+					qcom_usb4_fw_irq_thread,
+					IRQF_NO_AUTOEN | IRQF_ONESHOT | IRQF_NO_SUSPEND,
+					"qcom_usb4_fw", qcusb4);
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't request the firmware interrupt\n");
+
+	qcusb4->pcieap_irq = platform_get_irq_byname(pdev, "pcieap");
+	if (qcusb4->pcieap_irq < 0)
+		return qcusb4->pcieap_irq;
+
+	ret = devm_request_irq(dev, qcusb4->pcieap_irq, qcom_usb4_pcie_ap_irq_handler,
+			       IRQF_NO_AUTOEN | IRQF_NO_SUSPEND, "pcie_ap", qcusb4);
+	if (ret)
+		return ret;
+
+	/* For UUID setup */
+	ret = qcom_smem_get_serial_no(&qcusb4->chip_serial_no);
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't get SoC serial number\n");
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	match_data = device_get_match_data(dev);
+	if (!match_data)
+		return dev_err_probe(dev, -EINVAL, "Missing match data for this compatible\n");
+
+	for (i = 0; i < match_data->num_entries; i++) {
+		if (match_data->entries[i].mmio_base == res->start) {
+			qcusb4->instance_idx = i;
+			qcusb4->match_data = match_data;
+			break;
+		}
+	}
+
+	if (i == match_data->num_entries)
+		return dev_err_probe(dev, -EINVAL, "Router not described in match data\n");
+
+	sw_desc.drvdata = qcusb4;
+	sw_desc.fwnode = dev_fwnode(dev);
+	sw_desc.set = qcom_usb4_sw_set;
+
+	qcusb4->typec_sw = typec_switch_register(dev, &sw_desc);
+	if (IS_ERR(qcusb4->typec_sw)) {
+		return dev_err_probe(dev, PTR_ERR(qcusb4->typec_sw),
+				     "Failed to register Type-C switch\n");
+	}
+
+	ret = devm_add_action_or_reset(dev, qcom_usb4_unregister_typec_switch,
+				       qcusb4->typec_sw);
+	if (ret)
+		return ret;
+
+	mux_desc.drvdata = qcusb4;
+	mux_desc.fwnode = dev_fwnode(dev);
+	mux_desc.set = qcom_usb4_mux_set;
+
+	qcusb4->typec_mux = typec_mux_register(dev, &mux_desc);
+	if (IS_ERR(qcusb4->typec_mux)) {
+		return dev_err_probe(dev, PTR_ERR(qcusb4->typec_mux),
+				     "Failed to register Type-C mux\n");
+	}
+
+	ret = devm_add_action_or_reset(dev, qcom_usb4_unregister_typec_mux,
+				       qcusb4->typec_mux);
+	if (ret)
+		return ret;
+
+	scoped_guard(mutex, &qcusb4->state_lock) {
+		ret = qcusb4_power_up(qcusb4, true, false);
+		if (!ret)
+			qcusb4->current_state = QCUSB4_IDLE;
+	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to initialize the USB4 host router\n");
+
+	/* pci.c copypasta */
+	pm_runtime_forbid(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	pm_runtime_get_noresume(dev);
+
+	ret = nhi_probe(&qcusb4->nhi);
+	if (ret) {
+		pm_runtime_put_noidle(dev);
+		pm_runtime_disable(dev);
+		pm_runtime_set_suspended(dev);
+
+		scoped_guard(mutex, &qcusb4->state_lock)
+			qcusb4_power_off(qcusb4);
+
+		return dev_err_probe(dev, ret, "NHI common probe failed\n");
+	}
+
+	qcusb4->rcdev.owner = THIS_MODULE;
+	qcusb4->rcdev.ops = &qcusb4_pcie_sync_rst_ops;
+	qcusb4->rcdev.of_node = dev->of_node;
+	qcusb4->rcdev.nr_resets = 1;
+	ret = devm_reset_controller_register(dev, &qcusb4->rcdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register reset controller\n");
+
+	/* Act on whatever Type-C reported so far */
+	scoped_guard(mutex, &qcusb4->typec_lock) {
+		qcusb4->reconcile_enabled = true;
+		queue_work(qcusb4->wq, &qcusb4->reconcile_work);
+	}
+
+	return 0;
+}
+
+static void qcom_usb4_remove(struct platform_device *pdev)
+{
+	struct tb *tb = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	struct qcom_usb4 *qcusb4;
+	struct tb_nhi *nhi;
+
+	if (!tb)
+		return;
+
+	nhi = tb->nhi;
+	qcusb4 = container_of(nhi, struct qcom_usb4, nhi);
+
+	devm_release_action(dev, qcom_usb4_unregister_typec_mux, qcusb4->typec_mux);
+	devm_release_action(dev, qcom_usb4_unregister_typec_switch, qcusb4->typec_sw);
+	devm_release_action(dev, devm_work_drop, &qcusb4->reconcile_work);
+
+	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_forbid(&pdev->dev);
+
+	tb_domain_remove(tb);
+	nhi_shutdown(nhi);
+
+	guard(mutex)(&qcusb4->state_lock);
+
+	/* Only stays ASLEEP if the runtime resume above failed, nothing to do then */
+	if (qcusb4->current_state == QCUSB4_IDLE || qcusb4->current_state == QCUSB4_LINK)
+		qcusb4_power_off(qcusb4);
+}
+
+static const struct qcom_usb4_router_instance_data x1e80100_instances[] = {
+	[0] = { .mmio_base = 0x15600000, .usb4v2_capable = false },
+	[1] = { .mmio_base = 0x15700000, .usb4v2_capable = false },
+	[2] = { .mmio_base = 0x15500000, .usb4v2_capable = false },
+};
+
+static const struct qcom_usb4_router_instance_data glymur_instances[] = {
+	[0] = { .mmio_base = 0x15600000, .usb4v2_capable = false },
+	[1] = { .mmio_base = 0x15800000, .usb4v2_capable = true },
+	[2] = { .mmio_base = 0x15700000, .usb4v2_capable = false },
+};
+
+static const struct qcom_usb4_match_data x1e80100_data = {
+	.entries = x1e80100_instances,
+	.num_entries = ARRAY_SIZE(x1e80100_instances),
+	.drom_tid = 0x2833,
+};
+
+static const struct qcom_usb4_match_data glymur_data = {
+	.entries = glymur_instances,
+	.num_entries = ARRAY_SIZE(glymur_instances),
+	.drom_tid = 0x34eb,
+};
+
+static const struct of_device_id qcom_usb4_of_match_table[] = {
+	{ .compatible = "qcom,x1e80100-usb4-hr", .data = &x1e80100_data },
+	{ .compatible = "qcom,glymur-usb4-hr", .data = &glymur_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_usb4_of_match_table);
+
+static struct platform_driver qcom_usb4_driver = {
+	.probe = qcom_usb4_probe,
+	.remove = qcom_usb4_remove,
+	.shutdown = qcom_usb4_remove,
+	.driver = {
+		.name = "qcom_usb4",
+		.of_match_table = qcom_usb4_of_match_table,
+		.pm = &nhi_pm_ops,
+	},
+};
+MODULE_DESCRIPTION("Qualcomm USB4 driver");
+MODULE_LICENSE("GPL");
+
+module_platform_driver(qcom_usb4_driver);
diff --git a/drivers/thunderbolt/qcom.h b/drivers/thunderbolt/qcom.h
new file mode 100644
index 0000000000000000000000000000000000000000..7665ddb7f0c95c129740364674d1371844c70831
--- /dev/null
+++ b/drivers/thunderbolt/qcom.h
@@ -0,0 +1,251 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __USB4_QCOM_H__
+#define __USB4_QCOM_H__
+
+#include <linux/reset-controller.h>
+
+#define NUM_CLKS			9
+#define NUM_MUX_CLKS			5
+#define MUX_CLK_PHY_RX0			1
+#define MUX_CLK_PHY_RX1			2
+#define MUX_CLK_DP0			3
+#define MUX_CLK_DP1			4
+
+#define NUM_MISC_RESETS			8
+
+/*
+ * Each state implies what may be touched:
+ * OFF:    nothing is clocked
+ * IDLE:   router clocked off XO, uC running
+ * LINK:   PHY in USB4/TBT mode and owned by us, RX clocks sourced from it
+ * ASLEEP: COMPLETE_SLEEP acked, uC and clocks off
+ */
+enum qcusb4_hw_state {
+	QCUSB4_OFF,
+	QCUSB4_IDLE,
+	QCUSB4_LINK,
+	QCUSB4_ASLEEP,
+};
+
+/* What the Type-C side last asked for, consumed by the reconcile work */
+struct qcusb4_link_req {
+	bool usb4;
+	enum typec_orientation orientation;
+	enum tbt_phy_submode phy_submode;
+	bool active_cable;
+	bool cable_legacy_tbt3;
+	unsigned int cable_max_gen;
+};
+
+struct qcom_usb4 {
+	struct tb_nhi nhi;
+
+	/*
+	 * The USB4 PHY acts as a clocksource to parts of the router - it may only be disabled
+	 * after we receive FW_MSG_DISCONNECT or FW_MSG_SLEEP_DONE and must be re-enabled prior
+	 * to attempting any link establishment or maintenance operations.
+	 */
+	struct phy *phy;
+	struct typec_mux_dev *typec_mux;
+	struct typec_switch_dev *typec_sw;
+	u32 chip_serial_no;
+	u8 instance_idx;
+	const struct qcom_usb4_match_data *match_data;
+
+	int fw_ev_irq;
+	int ring_irq;
+	int pcieap_irq;
+
+	/* Shadowed standard registers */
+	void __iomem *router_cs;
+
+	/* Implementation-specific registers */
+	void __iomem *lane0_cs;
+	void __iomem *pcie_cfg;
+	void __iomem *port_group;
+	void __iomem *router_cfg;
+	void __iomem *sideband;
+	void __iomem *uc_per;
+	void __iomem *uc_ram;
+	size_t uc_ram_size;
+	void __iomem *usb_cfg;
+	void __iomem *cfg;
+	void __iomem *pcie_ap;
+	struct dev_pm_domain_list *usb4_pd;
+	struct dev_pm_domain_list *pcie_pd;
+	struct device_link *pcie_pd_link;
+
+	/* USB4_MODE toggle in TCSR */
+	struct regmap *tcsr_usb4_mode;
+	unsigned int tcsr_args[2];
+
+	struct clk_bulk_data clks[NUM_CLKS];
+	struct clk_bulk_data mux_clks[NUM_MUX_CLKS];
+	struct clk *hrr_clk;
+
+	struct reset_control *core_reset;
+	struct reset_control *usb_pipe_reset;
+	struct reset_control_bulk_data misc_resets[NUM_MISC_RESETS];
+	struct reset_controller_dev rcdev;
+	/* Protects mmio_ok and pcie_rst_asserted */
+	struct mutex rst_lock;
+	/* Set while the registers backing rcdev are clocked */
+	bool mmio_ok;
+	/* Last level requested through rcdev, replayed when the router comes back */
+	bool pcie_rst_asserted;
+
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pinctrl_active;
+	struct pinctrl_state *pinctrl_inactive;
+
+	u32 next_fw_ev_idx;
+	struct qcom_usb4_fw_events *fw_events_buf;
+	u16 fw_ev_total_entry_num;
+	u16 fw_ev_entry_size;
+	u32 fw_ev_ring_size;
+	void __iomem *fw_ev_rb_base;
+
+	/* Serializes all state transitions, protects current_state and sleep_from */
+	struct mutex state_lock;
+	enum qcusb4_hw_state current_state;
+	/* The state ASLEEP was entered from, i.e. whether the PHY is still ours */
+	enum qcusb4_hw_state sleep_from;
+
+	/* Protects desired_state and reconcile_enabled */
+	struct mutex typec_lock;
+	struct qcusb4_link_req desired_state;
+	bool reconcile_enabled;
+
+	/* Protects uc_online and serializes FW commands */
+	struct mutex uc_cmd_lock;
+	/* Set while the uC accepts commands */
+	bool uc_online;
+
+	struct completion disconnect_acked;
+	struct completion sleep_acked;
+	struct completion sleep_ready;
+
+	struct workqueue_struct *wq;
+	struct work_struct reconcile_work;
+	/* Cable properties of the current link, valid in LINK (and ASLEEP from LINK) */
+	struct qcusb4_link_req link;
+	/* In LINK: the FW was already told about the disconnect by WAKEUP(CBL_DIS) */
+	bool link_fw_gone;
+
+	/* Registers that need manual save-restore */
+	u32 router_cs_1_val;
+	u32 router_cs_5_val;
+	u32 lane0_cs_19_val;
+	u32 last_lfps_state;
+};
+
+struct qcom_usb4_router_instance_data {
+	u32 mmio_base;
+	bool usb4v2_capable;
+};
+
+struct qcom_usb4_match_data {
+	const struct qcom_usb4_router_instance_data * const entries;
+	const unsigned int num_entries;
+	u16 drom_tid;
+};
+
+struct drom_tbt3_hdr {
+	u32 crc32;
+	u8 ver;
+	/* Bits [15:12] are reserved */
+	u16 len;
+	u16 vendor_id;
+	u16 model_id;
+	u8 model_rev;
+	u8 nvm_rev;
+} __packed;
+
+struct drom_adp_details {
+	u8 adapter_number : 6;
+	u8 disabled : 1;
+	u8 entry : 1;
+} __packed;
+
+struct drom_entry_details {
+	u8 type : 6;
+	u8 res : 1;
+	u8 adp_entry : 1;
+} __packed;
+
+struct drom_dp_adp_hdr {
+	u8 len;
+	struct drom_adp_details details;
+	u16 res;
+	u8 lane_adapter;
+} __packed;
+
+struct drom_vendor_hdr {
+	u8 len;
+	struct drom_entry_details details;
+	char name[28];
+	// fn: 0-2
+	// 3-4 dev hi
+	// 5-7 dev_low
+} __packed;
+
+struct drom_model_hdr {
+	u8 len;
+	struct drom_entry_details details;
+	char name[15];
+	// fn: 0-2
+	// 3-4 dev hi
+	// 5-7 dev_low
+} __packed;
+
+struct drom_product_hdr {
+	u8 len;
+	struct drom_entry_details details;
+	u16 usb_spec_ver;
+	u16 vendor_id;
+	u16 product_id;
+	u16 product_fw_rev;
+	u32 tid;
+	u8 product_hw_rev;
+} __packed;
+
+struct drom_lane_adp_hdr {
+	u8 len;
+	struct drom_adp_details details;
+	u8 dual_lane;
+	u8 secondary_adapter;
+	u8 res[4];
+} __packed;
+
+struct drom_pcie_adp_hdr {
+	u8 len;
+	struct drom_adp_details details;
+	u8 bus_func;
+} __packed;
+
+struct drom_tmu_hdr {
+	u8 len;
+	struct drom_entry_details details;
+	u8 mode;
+} __packed;
+
+struct qcom_usb4_drom {
+	u8 crc8;
+	u64 uuid;
+	struct drom_tbt3_hdr tbt3;
+	struct drom_dp_adp_hdr dp0;
+	struct drom_dp_adp_hdr dp1;
+	struct drom_vendor_hdr vendor;
+	struct drom_model_hdr model;
+	struct drom_product_hdr product_descriptor;
+	struct drom_lane_adp_hdr lane0;
+	struct drom_lane_adp_hdr lane1;
+	struct drom_pcie_adp_hdr pcie;
+	struct drom_tmu_hdr tmu;
+} __packed;
+
+#endif
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 8ed373e94b652f460c5fa553410c6ad5d3787989..374e4b7ef3c7e8886a8008b094bc11b9b1580c5a 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -9,6 +9,7 @@
 #ifndef TB_H_
 #define TB_H_
 
+#include <linux/crc32.h>
 #include <linux/debugfs.h>
 #include <linux/nvmem-provider.h>
 #include <linux/pci.h>
@@ -1330,6 +1331,25 @@ static inline bool tb_switch_is_usb4(const struct tb_switch *sw)
 	return usb4_switch_version(sw) > 0;
 }
 
+static inline u8 tb_crc8(u8 *data, int len)
+{
+	int i, j;
+	u8 val = 0xff;
+
+	for (i = 0; i < len; i++) {
+		val ^= data[i];
+		for (j = 0; j < 8; j++)
+			val = (val << 1) ^ ((val & 0x80) ? 7 : 0);
+	}
+
+	return val;
+}
+
+static inline u32 tb_crc32(void *data, size_t len)
+{
+	return ~crc32c(~0, data, len);
+}
+
 void usb4_switch_check_wakes(struct tb_switch *sw);
 int usb4_switch_setup(struct tb_switch *sw);
 int usb4_switch_configuration_valid(struct tb_switch *sw);
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 92d893634d2bc66b365b29ed42a8248659617b82..6149fcabad8b959502fb59fb94eec2d408f24474 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -193,6 +193,7 @@ struct tb_regs_switch_header {
 #define USB4_VERSION_MAJOR_MASK			GENMASK(7, 5)
 
 #define ROUTER_CS_1				0x01
+#define ROUTER_CS_1_UA				GENMASK(13, 8)
 #define ROUTER_CS_3				0x03
 #define ROUTER_CS_3_V				BIT(31)
 #define ROUTER_CS_4				0x04
@@ -388,6 +389,7 @@ struct tb_regs_port_header {
 #define PORT_CS_18_WOCS				BIT(16)
 #define PORT_CS_18_WODS				BIT(17)
 #define PORT_CS_18_WOU4S			BIT(18)
+#define PORT_CS_18_WOIDS			BIT(19)
 #define PORT_CS_18_CSA				BIT(22)
 #define PORT_CS_18_TIP				BIT(24)
 #define PORT_CS_19				0x13
@@ -397,6 +399,7 @@ struct tb_regs_port_header {
 #define PORT_CS_19_WOC				BIT(16)
 #define PORT_CS_19_WOD				BIT(17)
 #define PORT_CS_19_WOU4				BIT(18)
+#define PORT_CS_19_WOID				BIT(19)
 #define PORT_CS_19_START_ASYM			BIT(24)
 
 /* Display Port adapter registers */

-- 
2.55.0

