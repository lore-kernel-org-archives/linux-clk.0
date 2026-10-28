Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181138;
	b=1tFv2lcbSSnoCipBjVDRjgFuRb534j2hMqQh1arfj+QrRl0OewhftWTaKBLqKaE6qgE5
	 QRI7j7kcIsbrngZcyCIgN2npOUJUkcfxAzs6LD+O+TtQ9CtNtuNwb7KI65v660yOP11Td
	 E0Wx0IO3rXKdcsu7eQiS9bJeelHMrX8KmCyzhsBTH0qGNYg+7u0ONNk2Y3lOVhiblzwLj
	 Qp8A+otmCH7ks1gchlS5Y+TOytmCMkezeEqWUCgDd6vY7t0PeOvDzrYnLH/RC29vItRVN
	 9ePlU7yG7LwDh4GiumnJhIp9mVMH6GQCgUzJzSW/CCOUYF1dVX33gw7enlQhkgeAC/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181138;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VKEnT53iqwc8IXkDGnCRQOp+CrozXrdfzMhZLVHP8gw=;
	b=YOhfsxjewNGBVuVWgfZs/63109LHKfiLZrxhaXsWFb+pMvwDvnc5Ss9XnfJQ5rMXbNlC
	 x5rnTeMr6OVsZGLWlybahFnXRlxsiwn3l/fgZcuvrg484O/XEiM0R3NeeXr2+BYR7nSiG
	 3MxMNoI3IVtSCA+uzkQFvZxvcTXeeuHN1wdcgOda2UfY9ORp2q2Iko0p9cTYm1v0WcreN
	 C9jf0MDYoVrHHm9q9lqS6kNxq4CKusjNMNuiGufbCQcxQnwu84QeBJFxrfsWa9s9fYlCG
	 Ef6xT6lIkT0w/0NBBAwKqNOFdiSnTqhf60sKQFWCkS8dzgXw7Dn6jD5EU2iRjMHSyEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WRcwlHw6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVyKba8u;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339CC60A2604
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 09:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 339CC60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WRcwlHw6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVyKba8u
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8JxAd3892470
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 09:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VKEnT53iqwc8IXkDGnCRQOp+CrozXrdfzMhZLVHP8gw=; b=WRcwlHw62bFOrKl0
	2J2D+CAMzeakmu471lcTmwzYsWtWePflATOlZOPusgjXE8jik80sdXCyDKUdrQDS
	ONRXaxi0OB8c/9m+bP434JMyZ7ioJsIzPoX9GLL09L7QgLJO6jI7taUdnxm7F8v2
	I/GYjZSyoWffxr0zzy/w7v7ljbdqjzBEifKyQ6sEhOXhlxxWYFrVnGf9plk1TXDU
	FEcZ8C0B+C/YNk9CiIbRE6FNOl0Z+4/uHcsVEZJQuN3DPfTCehX8EnDo3QGzp6ij
	mFNvkPuaneduyIZfMJ8UcbELE6y44cLPEWOP6RCRPi+MiLGxQkJoH9YUTFwMl7Be
	MlWsdQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f91u1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 09:52:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179a2035a4so41577996d6.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 02:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793181135; x=1793785935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VKEnT53iqwc8IXkDGnCRQOp+CrozXrdfzMhZLVHP8gw=;
        b=BVyKba8uzGQ4Hq1ncit/Z8RqPtdz/MrajjDcgV+ma1RMdxBS1U7Sk/Z0PakggXUfn9
         oDyYtXVB2uH4rQAo0falgd/kd7Fbkow3K+YYU7fs2NwLNXoWpBuuYmhuuOO/lZ8n2ig3
         OPsIziMOxcvrdUgU1DktiOHODOIZHEWo5vkw8NRfKHjAnjnK9stJyR5pvRcU4Wgkmy82
         wgWlCfAZR+XdKZXYQAnodd8cC2nz7saeLobFQvHInIYAn8INQmpC433GE6GWi8qQqiNo
         ZRyvqYAIFgDqvwXgFkhXCK7t55DsgqEg+YCDVu4FCrYdqYFsaLkf7+kAtuQw7ffWMy1f
         SwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181135; x=1793785935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VKEnT53iqwc8IXkDGnCRQOp+CrozXrdfzMhZLVHP8gw=;
        b=IqYg5cgf3gaBEQUXcOPsCjuUlo9endqrbHlGrAI7HfqMrHJgrOXkL0OCvkqLYrbBLI
         uAIY7SuOFtBfr+UgffLgnwhtS03U60eVb9acrwdTMT/8yMyjqIHSk45s6w3H5gdxbb+O
         3ViWx9TgyC+WFuMIP4J76oLfSY7U7N7XzFXdCYaMVNKm96i5Fu8VdZOdoJuhf9562UxN
         ma107yZTZmiMdVc7QgroJLlnt51pdhs1F+XFRWPWhj4hyJ9PUCD1+RW+NI62WO5FGvkg
         S6+3Nbg11sdFjTNfH0QSLSnVajwH2GCPJpAu1DcXNlz+E3yMC+MJFeSoBGhvjYQijlc2
         vyTQ==
X-Gm-Message-State: AFq9FYLB7Fn052uYdImpTsZh5U9LavGwaBRIvrDhcSaOBhjotNi5hzik
	SsrjFic3WjgNJaMgfaVtW9G8TUfQOTnIrPiUDZdj1EFXXYrQgUBSzkaSJC+90i+kSv3T4qb0Nvv
	SO1wsBCXKYRNj39jDX+y6/Wc6kfSTMIK5iorVdKhpZOEbVm5+ufI2CTlLvH30k/g=
X-Gm-Gg: AYBFou1MfEDe/2iEvEmjIkFrTQjHnkcd1mm5TaAl24jLteB7eGj4SskXdoc2fvX2GBJ
	amCLqbX1zUN1P3WimBtD/rBMN6rB3wSJMZAn1CSQWIh3eIb+ZnHpwbz0l2CvJrcB3++80jtNt8C
	2R2fplxv8VyhUSJD+zKSrfEiJdpcXS5AhfRBfq2ytRr5yAkDEjiVcs49APU0PaTYAKk9gXwbka4
	oZJmlFAsdFnq4fxIUXv3WK3+c1C63x7RD/ABxDHDNB5NXhbQqhJISmIjToiirlCejc5IXJjLa7G
	DffmlV5dsGQUgEgfE+YAgq8v5tB9rjdm36bVjoeeNLD0bBz0KhxbHXzJF0lQKLDrXv5zaqKoPEC
	tgaCXLvVYNpQXWsCWUt8Va5gKzm78mMs1fldLBAxDv6L2qsnFgNaPcS22VoE=
X-Received: by 2002:a05:620a:3728:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-943f4b7c848mr860919785a.17.1793181135249;
        Wed, 28 Oct 2026 02:52:15 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-943f4b7c848mr860917785a.17.1793181134679;
        Wed, 28 Oct 2026 02:52:14 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm27966715f8f.38.2026.10.28.02.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:52:13 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 11:52:05 +0200
Subject: [PATCH RFC 2/3] clk: qcom: common: Restore the clock controller
 after hibernation
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
Message-Id: <20261028-b4-clk-restore-after-hibernation-v1-2-86cf62747a7f@oss.qualcomm.com>
References: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
In-Reply-To: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4469;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zKY61JZxHgZWybeQ4KIp9ckDmN5YeqgRi8ne5EazT6I=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq4cXIEwTqemXTw3jRGvsEiqiNK2ghH+zedd3cP
 RxIFMQP8euJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauHFyAAKCRAbX0TJAJUV
 Vvf5EAC+3ZPMQCN69ut3ecoidMF1ts3leHlcnbHwyBc4MP3nJUwnJvon1FUDL6Egulhxm14djMg
 S3VWStspwUOhwBmCYvUDr5+6EC7CuPBEwKJB4Lv8ku+Ifg3C2VgxJOY6Qfebqel+v6v8f6jGxAL
 8DE5I3oMyv5AxbM4zePwFfCYYM0pbi0zqjBlf9a5lvqX+DRzVIM9a7O4HjAVlcKGPRTrsmF9lxm
 diH5bdom4u1c4UpVOMZZzddwQlavp65h3NBC05Ms3dErx5XBxTogS3UpUQWq+NoTjtR7zpvzBJ2
 zO2CLHOSxvDHjbby0CGJg22ID56nR2Q4NY+SRK/9ZE9Hppi8Av/o59SbW6Hzyqapw3dmHvItSFS
 PJb5D0Vwqiry5WTh8UZP05fS8dmLegHCegxLl+0eiFcz7VccH3ks6SwpbqwFAg4YPHAghm5DJj7
 lO6QKU9xaFUMfTDaazP+CIOA6P5fL35WyGz3d//G1QbJgdFD9Nypd+nVQvu5CfYCJSgCi0Lr6cD
 6/pXWM3KbxG/7Zn//shfyL4+cszTKw0797V2VmdZPBjz7zmAU0Gp9Atm38Xkmeu9ScssghelUUh
 XavgNBiNXO5TxE+j6tDHK/kgvZv5bP2khcACQhFJJrUSGXMm3IDF49HMDVRa3WwPJXChvTvwOwd
 X228z4tVrRJfgCA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae1c5d0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=oKKWX3z4MXjDt05ZYnYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfXxfbFIHADFwUt
 N2TLtx/EvGcdBtiJUfs3V3pTI1b/pC5McAKntTNmiYxlKSJv81CbDaGgYrY6R9BPAMF/QNq9wQm
 ru9ebRXyiNAQrd243os+9nkjqy87sqs=
X-Proofpoint-GUID: hLu187B0e9NW8guy9Bh-f6nMg_gFgjkY
X-Proofpoint-ORIG-GUID: hLu187B0e9NW8guy9Bh-f6nMg_gFgjkY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX5JIo0LTu/ue3
 +wS0azOn1E6l3ABAQchAT+9BX4xbROQ6M2XyrmXKo4tzKKF4wM3orWQNgrWd0sAsgk0IDyBLQnS
 jxIRRXlXYUDJ6BsOQuFWDeN1Dw/tmpVTiM8uSOYPPe46wvQ2CwjUv76eZIog7vChdIjFdw3cV5a
 JAHB0aLSH0RmIz/L/7h6Qn9k8b+BgSfjxOvynqbuKKlVzHCN9nmx+sR7Rf7AXKiAhk/iL8f/XPi
 wx6L2TFEp3rmqjfLtOkF7ad6qZ5I1o4cfNzmnTV6k8I6zT9GeN6pUkZDL18owEQY1Z0/rwQrB7T
 LDvsyFK1GA8yeEnSaqII4qgWpywBDGb0ZLAa4vUhYvAyzA/euGbx8aFF9YPpLepHahCvqvuY7cY
 oe8wFTlYD1xEAlbXHxNSFul7v/qOD7TcUSuzpL2Qj0rMClm0tF0GnSatesgFKuqCtK9uIWsC2ke
 JU8QGID54uG8q553QPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280039

Nothing puts a clock controller back into the state the clock framework
expects after a hibernation image is restored. The hardware has been
through a power cycle and through the kernel that loaded the image,
which may have programmed other rates and parents, or not probed the
controller at all, depending on whether its driver is built in or
available from the initramfs. The rates and parents the consumers asked
for before the image was created are not programmed again either, since
the framework sees no change.

On the Glymur CRD, the display clock controller driver is a module that
the kernel loading the image does not probe, so the probe time PLL
configuration is missing and the DPU runs at the 333MHz the boot
firmware left the PLL at instead of the 717MHz the framework believes,
underflows, and the panel shows a solid blue screen.

Add a restore callback that redoes the probe time configuration and
restores the cached state of the clocks, for the drivers to use.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/common.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/clk/qcom/common.h |  2 ++
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 08fd62ac780d..ff243fc78188 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/clk-provider.h>
 #include <linux/interconnect-clk.h>
 #include <linux/pm_runtime.h>
@@ -26,6 +27,8 @@ struct qcom_cc {
 	struct clk_regmap **rclks;
 	size_t num_rclks;
 	struct dev_pm_domain_list *pd_list;
+	const struct qcom_cc_desc *desc;
+	struct regmap *regmap;
 };
 
 const
@@ -321,6 +324,10 @@ static void qcom_cc_clk_regs_configure(struct device *dev, const struct qcom_cc_
 		data->clk_regs_configure(dev, regmap);
 }
 
+static void qcom_cc_release(struct device *dev, void *res)
+{
+}
+
 int qcom_cc_really_probe(struct device *dev,
 			 const struct qcom_cc_desc *desc, struct regmap *regmap)
 {
@@ -333,9 +340,13 @@ int qcom_cc_really_probe(struct device *dev,
 	size_t num_clk_hws = desc->num_clk_hws;
 	struct clk_hw **clk_hws = desc->clk_hws;
 
-	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
+	cc = devres_alloc(qcom_cc_release, sizeof(*cc), GFP_KERNEL);
 	if (!cc)
 		return -ENOMEM;
+	devres_add(dev, cc);
+
+	cc->desc = desc;
+	cc->regmap = regmap;
 
 	ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
 	if (ret < 0 && ret != -EEXIST)
@@ -434,6 +445,45 @@ int qcom_cc_really_probe(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
 
+/* Redo the probe time setup and the cached clock state after a power cycle */
+static int qcom_cc_restore(struct device *dev)
+{
+	struct qcom_cc *cc = devres_find(dev, qcom_cc_release, NULL, NULL);
+	const struct qcom_cc_desc *desc;
+	int ret = 0;
+
+	if (!cc)
+		return 0;
+
+	desc = cc->desc;
+
+	if (desc->use_rpm) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
+	}
+
+	if (desc->driver_data) {
+		ret = qcom_cc_clk_pll_configure(desc->driver_data, cc->regmap);
+		if (ret)
+			goto put_rpm;
+
+		qcom_cc_clk_regs_configure(dev, desc->driver_data, cc->regmap);
+	}
+
+	clk_restore_context_dev(dev);
+
+put_rpm:
+	if (desc->use_rpm)
+		pm_runtime_put_sync(dev);
+
+	return ret;
+}
+
+EXPORT_GPL_DEV_PM_OPS(qcom_cc_pm_ops) = {
+	.restore = pm_sleep_ptr(qcom_cc_restore),
+};
+
 int qcom_cc_probe(struct platform_device *pdev, const struct qcom_cc_desc *desc)
 {
 	struct regmap *regmap;
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 6f2406f8839e..227669609a50 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -4,6 +4,7 @@
 #ifndef __QCOM_CLK_COMMON_H__
 #define __QCOM_CLK_COMMON_H__
 
+struct dev_pm_ops;
 struct platform_device;
 struct regmap_config;
 struct clk_regmap;
@@ -86,6 +87,7 @@ extern int qcom_cc_really_probe(struct device *dev,
 				struct regmap *regmap);
 extern int qcom_cc_probe(struct platform_device *pdev,
 			 const struct qcom_cc_desc *desc);
+extern const struct dev_pm_ops qcom_cc_pm_ops;
 extern int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
 				  const struct qcom_cc_desc *desc);
 

-- 
2.54.0

