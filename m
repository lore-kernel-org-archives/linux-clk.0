Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719643;
	b=buJaf9A3QZHxVNhuF41RdRkS1VVDUYgvS2YM37xGwhoMN6OSB/c9i+bhWlOsWzKTMAoO
	 A8cyEKBvCgNdTAYJZTwZiQm2vlTfw+R7d5S5iIm8OsMJIvpdzhBws5KX+R+PEb8IQLxlY
	 66Y8/RiR03AEDhiOhhR8GkHVGUo9731VTV2CFZrjKjMIYKyr2TRcgOxpw1pgcc81CB4Oe
	 o2+mesYTnrWP9z4gxBxh4Idvm6E3MZPItPcd6MaxRIBBKxIMzpiGg8/R6jTGOxIDTWQNR
	 FyJkv7tamXcqBgAO2rWqbNCyrarM6ftl0skXZsLfMXhIq7VletAQDALhk+dSg0y14gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719643;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hpP9kl81pgIToPRpqYOmQ0/Zx1IHvYVCKMq50UKWD8Q=;
	b=bEazlcWotGYrbqVgKrDiZciPG/gg8gO0bjXCfyf9cnTsdmB88VVhMw/erL3OvjjE5P+r
	 SpKv1gIjyDIGLJhgjUZ/4nIkklebd1f0P5EYVyYjkw6L0XT0OPfVAlIUA6hqdGImSX5+z
	 Wfa20i0EndGdcY3nr/7z0shT4Mz7MgJdjiaimswvHVxN0vzCAP+qizFaK4oQzToZFJbxk
	 xO9PPPT3Ko9AP+tIR++wKP7TVBq1MApiJ3T+UmYzeDcUp9heZS1++A60bNUiWW1+0WTyj
	 EIeVd11z8wjuhoUTDqzCuiFnmkkzzaKewqiEsILBtAIo2z04RSTq/vXHgvFHnA877IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UVYxaEhj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="D8xINs/q";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CDF606A326
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 19:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32CDF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UVYxaEhj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D8xINs/q
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu5xq4049091
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 19:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hpP9kl81pgIToPRpqYOmQ0/Zx1IHvYVCKMq50UKWD8Q=; b=UVYxaEhjntMYa9O0
	dH006SO0nd85FBY0g3QAWB7wSuD7kROeU3PkIETwmNqfVuZZm+mEBbMiyWyFFQtQ
	xEuHFc959NE2Q5oceIxH6kQK0MekS2jwr99qDoct/sZR2gDhZ+CQt+xFVtldiCCJ
	LpH9JbPRHxZpCNt3h1ukrvwFvYMUt+HgZJ6Tm8/kl3w/NYNg+3Ot2lg537Q3nPco
	P/hXTPKPJVtGPC/bBdhLkxztPQmw2iW8ajjs3y1usJBKWEAQPlDUlw4bPv4vaTpJ
	/b2n2OXNJzlwEJ0s1+t98ihe9uOq74D5Ibk3dGz1LmyG/OaTjtQhVeg1sJVraM/v
	0t9DGg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rjmbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 19:00:24 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b25d977b91so7776466c88.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 11:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719624; x=1796324424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpP9kl81pgIToPRpqYOmQ0/Zx1IHvYVCKMq50UKWD8Q=;
        b=D8xINs/qIG98Y22RmkxSx4TNbFzEoBrTvpkKIhhkldoxf0j0+wTaDxBFtfWstAGLa8
         3UUrX6WQVPDjKYBHPJjHuUvLN19myHy2DgPQX7Rp/gLmVQQluUa193sc4y3Xq/fXUbGb
         rrCC4rrLYmPfyWLVr9+u3e/YHq2XYuoM88YnsIrfZ+6db/utAfVorkt9LNxaOMdFJ6C5
         bpu8BClLYlFvcbm0ciBAQd46OD1oVaTFhP50ItmMJ6AW6h7R//kkAdKJ96WwUq6bgIQB
         9k1vEznMo7tS3aufHXjn0impzX7yLViR+TFn1gFDQG0YDaj5PCn3Jx1d28y8n5IGU9HV
         x18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719624; x=1796324424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpP9kl81pgIToPRpqYOmQ0/Zx1IHvYVCKMq50UKWD8Q=;
        b=f9ilflg1UUsVrJvefa8FSCE0QP7n8MPG9J7psafJxcP9pKENadXAhcMdO/LSW3gg68
         GROKllV/1tjkaUaQvPURGL06OAcqEKoPp8dOPIKY4XMeK52TsaQt2rquN477Gp961CU1
         7UVWRord5m1UMY/T/2Vf9s58wrQIMjYOMuh/kQpbLx1MNAP8TpOMjtHiHINlIGa53kkB
         aqPOrUe9hEKU1f3tCQK6ka8icz4jd9QynVDDWuXuG/gPNO8FNtmQnpyscIzbBDQo5pMg
         z99zNDTO9f5F7wgFZAVYLFwkYuMfHfsCBkDpdianrCXocECG4VoQpjiFcEx1qww27BXj
         sKUw==
X-Forwarded-Encrypted: i=1; AL+hErEDfipnK70PWPwdA6amUzff3iYAeE+MsU7LEyRBnYPzhyrE5ocikpjlid/sL7MI4PrQoFDbHLNDA50=@vger.kernel.org
X-Gm-Message-State: APuU4Z85sKdjmUk1gOWOg6cq6Pk5ThVjg5WYRBXg4YW5Gp07Y1kTqjxh
	LVxHD+m3Jp4NZzjFZCIzNpmDgMP5YyUvt7U/IoH/rC1dDbPNiY5tiPOAidhSSspTvjkcpxtF9mx
	rHVVjRhCTZXJhX6SEkfunbABQyevCp0+fZr50sqc7ewyhEZSIpiTjbRTyiJ2mp48=
X-Gm-Gg: AZFdTZdGcJ4rPcgkpdg1tE2BRoUeKBgyGjYz2GRCdf6cSIQn9+lanvF9em1/qps8Na+
	y8NH5RJE+mmI1ZSda0vHt5RXDFsCu1rZ56SnfkpY3gT7kYfgcKu6V08p8vGMuHaxkVAX9lKdFkm
	iKJ45fSwxXpXUHjqnjtYEgKTlAaL8LAWP0ae05/+hS5sJ70VLbKYTnixSuNMSl/MjqtfTNf/XNV
	T4jCkBHt9SsnZd8yJq+dX9KyUwn8gaWb7P4HdiKwfk87YfnE5Dhxb6hEyRo7af1TbnEKbJwFTLV
	o7o3qFIHvIIoXyFteEi/Evzvol2oTwbBGjQYOsdLQXfPhzcNu9i8fGZcKhOy//AhM81x7Hu+D4v
	2orVrRIRDDSy6/IWIQZ37HalEKaxR4ZUOb+7WLwlg4EciilhD+b4OVGaA+RONQqR6WS4YZIyBXb
	30kK1b
X-Received: by 2002:a05:7022:e0b:b0:1a3:8d5f:6f93 with SMTP id a92af1059eb24-1b556882ac7mr32753258c88.17.1795719623780;
        Thu, 26 Nov 2026 11:00:23 -0800 (PST)
X-Received: by 2002:a05:7022:e0b:b0:1a3:8d5f:6f93 with SMTP id a92af1059eb24-1b556882ac7mr32753196c88.17.1795719623073;
        Thu, 26 Nov 2026 11:00:23 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.11.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:00:22 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:27:14 +0530
Subject: [PATCH 6/8] phy: qcom: combo: Keep the PHY GDSC ON during host bus
 suspend
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
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-6-485a08ffdc6f@oss.qualcomm.com>
References: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
In-Reply-To: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-pci@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX0h5ACcRCNyNf
 A+Bq1aX+gzTri5a5fQG3U48vqnvn9poYC9gMLCajDGyJ3NvNQoVxCFMstnDDgvH8pBSNl0ZDjCi
 EFz+FHAmCnGO2DcpbPmrj4HzmOafcbslPDJdq9wCfaca7csFQV2o7al8WdRKxx5TPcF5UiQf1GA
 i0CQwkyjt1qUqdDasFWn3eE8uZfOworxlWowoWc8PNKEvLG8sAtGG1u01txGmy0YVff/O/RjvWA
 cz+RcdvAJ/ivDv+gimrTJut9ejivVABHzdstHmFw5l+Cr7kTgruYmce+yvr5T+pEZdgMUVZzHB8
 RRTVL5RBrIysC3BFwqE5hzmyOWNC6lUqL1mP+uUm5fNxvSQwnvWG1uj6IIbPJuTgif16EDgi8l/
 xW7oa7hPObYyWnffv4Z0nBcMhK3FKa3580rdbkz4TQwy3I7zAd4F0PW9IsFddL0VhKfeish5dML
 nf4nq2yE3pevtSPtiXQ==
X-Proofpoint-GUID: tkBluQ76ya1RAlR0GZiFdwf7C4aMQ6zB
X-Proofpoint-ORIG-GUID: tkBluQ76ya1RAlR0GZiFdwf7C4aMQ6zB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfXy0nGXsnuj1eM
 4EloOFFWmwkC3OqfibM0Pm4rYGG+YmgcB1sct4s8JQOGCXLZjuipqEgq4SnNEjbUQ4scruLDmAW
 tvFK87c5Pq2sSBfKzQWKf2KZ5yC1ffE=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b0881c8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bOxi8P5hmqam2w8o8_wA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260074

From: Prashanth K <prashanth.k@oss.qualcomm.com>

Keep the PHY GDSC ON while the PHY is runtime suspended in host mode,
so that PHY can resume without losing PHY state.  Allow it to turn off
when init_count is zero, or when set_hwmode_dev() isn't supported.
This allows PHY to consume lesser power when nothing is connected.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index bb921ee643dec46265015b9d11d1f669834fc2d4..d8b7cfd9644d49780d706a14bee9e7f314cbdb19 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -16,6 +16,7 @@
 #include <linux/of_graph.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
@@ -2592,6 +2593,9 @@ struct qmp_phy_cfg {
 	unsigned int pcs_usb_offset;
 
 	bool invert_cc_polarity;
+
+	/* true, if GDSC must stay enabled while this PHY is in use across suspend */
+	bool toggle_gdsc;
 };
 
 struct qmp_combo {
@@ -3432,6 +3436,7 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_refgen,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_refgen),
+	.toggle_gdsc		= true,
 };
 
 static const struct qmp_phy_cfg nord_usb3dpphy_cfg = {
@@ -4723,16 +4728,25 @@ static void qmp_combo_disable_autonomous_mode(struct qmp_combo *qmp)
 static int __maybe_unused qmp_combo_runtime_suspend(struct device *dev)
 {
 	struct qmp_combo *qmp = dev_get_drvdata(dev);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->phy_mode);
 
 	guard(mutex)(&qmp->phy_mutex);
+	dev_pm_genpd_set_hwmode(dev, false);
 
 	if (!qmp->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
 
+	/*
+	 * Keep the PHY GDSC ON during suspend, so that phy can resume
+	 * without losing its state after host mode bus suspend.
+	 */
+	if (cfg->toggle_gdsc)
+		dev_pm_genpd_set_hwmode(dev, true);
+
 	qmp_combo_enable_autonomous_mode(qmp);
 
 	clk_disable_unprepare(qmp->pipe_clk);

-- 
2.56.0

