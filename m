Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0BC492E54
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 18:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102711; cv=none; b=pvUzWcOyW8cIdL04oWVBfTCGUvsHx1/5X0AxtpuJALke1Hn3esCBcE2f9uih07pfZ+HT9aY3o4CzJPVQd5YsPG2Ua++ESfaftAp2zPUdP10JNG/RUcfgrSlUQpxqVVX4aEXPFzUymlvCe18ALkQdN3V0ceJb7rOdwQxGNm8yqPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102711; c=relaxed/simple;
	bh=1Q4uvfDk4TliYmTHYv2Ve5KSV0agU3eXHSIiw7O5VGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9PBrFt1pirynl8/P4eHE9LeF0KRH67z0rvu9Dce1x6RLkDUPV8bZuV1VJrBieud1bmANqKrFro4s4jXNCNGAmrv6maOBn6sI65HuOJgOugpcPkmxmWfo7dGsrj2P/AOuR5h2TaYs/CddEbdHImAV30vPfCaZZN6dKQ5mnRIho0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HC7Cx9nc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AfMrm9un; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HC7Cx9nc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AfMrm9un"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7eav3757217
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 18:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bre1XGDEQBs
	b9HHiSPNRvoWE3fMANV820bNftGvNCDo=; b=HC7Cx9ncz0mEjr1+9IbG8KM9sv4
	+L9JiNKuJMq4rC0/o1fyRIvvoFPoN/74WUdOp+Yoe+kqTa2E7z12cF8NVAJUt+ZS
	rgxbggAjXvvnQh3q1s6iJaJ8/N9PJVV5R2ee97ozLLx5ttBfsNWKFMlvwaBABsf1
	DUNHwzzbmkV+CPXKkenukCIZElY3ZaRkFsme/HQ9LIRof6rR74VLzWkoukMs6pR3
	gLt+Ei7nZb+Di/09F5EyQTQtA8RXji7XAb7b1wAivhZZuLsfC11SDSnbtZN6nVu+
	5mw4bg/9Dtk9wQOIWHI18HTfX8NIq5xu1eJs5bOUo4nz1XSWvCyNqmxTYsg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj113we2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 18:45:03 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c8573c977dso178585e0c.1
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 11:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790102702; x=1790707502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bre1XGDEQBsb9HHiSPNRvoWE3fMANV820bNftGvNCDo=;
        b=AfMrm9unS/yVCCbqVdOjJ+ZT94laTMIFmVa/GbiAAlXTruWUXK8RCL+rsxCJ0PLF9K
         sZtgOjWiSsSsOdL2k7ZNl+Ft1ebYxWfN2kfmoEtl6FUu+P8yk+FR3IlwffArah/wA4/Y
         fVvQMriGDLLlT4m12kpTKEUZFkKsViLF+ukKBVPGzbNEPNN1acByLeM0It1vy+juukLv
         gi1K/U88wUB0IZVcXQ5whZX3Y+T1VTuVHmkixd5w+o82kjLedNJAONT4fa5A8/t5fp5r
         VmAQqvfGxp1nfTcuc80eiMm9BfgVeYfoAh8ptY5Sn48fIQ2i9XMPSYzVqw5EpS1SWMrM
         VpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102702; x=1790707502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bre1XGDEQBsb9HHiSPNRvoWE3fMANV820bNftGvNCDo=;
        b=CQ50xlOhyjZYDhM+JJ088Zu0kV8PAKd1c1oFxW9vsNNhcZrXNWHM64r+Rp2LDzFx9h
         0BP2R8dgdzgVRqQIUNBninc4kDJ+uvJp/JcMPiB/jZtjSeMEs5wTNu5/HHHII4LjTGIL
         myr0gwdH3HskGvM0ADqMBBT8V0kBpIV7ZmffZ6vRqdTyjqoHdKBQr/f307FxPMtO9iU6
         QGegG2PnCg/N2YrY3ilNj2Xbt0rvL5TetAMKUE1DgnJTwbU6AJrWlggPGMM/9GmhDmc4
         g5LbL4ZrAh8nbvJcPONVgPAL8l+W9Fcny58md0+xTqfONOP5VSZJ0meMRuNwbmHCulvm
         Q5EQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5eWj3qYMDnHQN46z7P6yLr9pJPWghqUSqKieqwncIwhl0Ib/PYBqIa/erYBnVmNwY+Kxl00LTe6s=@vger.kernel.org
X-Gm-Message-State: AFuF++lbALmtH5Yv4Gfz345zyCNUj+KPLI+peJVRZbTTvMGBFLrG2iFp
	Gh7LEgjHP00rkRaNNKqKj1T6Klzzm4VFaP7NCgIUv0RNkCeLrUE/6qJ8ycpQc9Xyl69biRoAh/M
	YCgN/BrPLTPMC1pIo79/Hg6QPjtyoWDCbOaLJScPLUyIapaFXmhxz7OP86Px0WQQ=
X-Gm-Gg: AYBFou2djUgpoJtFZBcyu9LDTsjN/W26dQ3c8dz7IwEUll+0JOCc7yqtX0b8ZWqg6lI
	0Ma20CHxSysih70yoLLVubtScGCsBv7gVNYYbLthnsiga4XGthx9VFkO23X/OXhnDGPJAlT0wIv
	e6+RXMa1mB+L+CsSKFEYuQj0jVLokS+5eBz6x2ZT2XFue3iqyylBhSJjUFtYAVTZu1zHbW5MhJq
	oWgEioy/5zz+ZmlNN0ibq7CmQXaN2aTZXJHYnll8dK6plrIaVs3750jXyTIcaxRL0jX+uRoHr+y
	vR01VGNKRJtyWZanN9zuy5Q59TofAyLLqQIBdMBuXgpVPOYLwubpJF8s5wlzd61oBIW3fM9jIai
	GGNy5lnA7Ai8/DvM8NGa8OUlxrWZlemJRDuiwcnUrU8weNyqUCZrwZL5BFGk/YiU0
X-Received: by 2002:a05:6122:ca8:b0:5c8:2852:36cf with SMTP id 71dfb90a1353d-5c9f159af31mr774605e0c.4.1790102702560;
        Tue, 22 Sep 2026 11:45:02 -0700 (PDT)
X-Received: by 2002:a05:6122:ca8:b0:5c8:2852:36cf with SMTP id 71dfb90a1353d-5c9f159af31mr774584e0c.4.1790102702146;
        Tue, 22 Sep 2026 11:45:02 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm374681f8f.19.2026.09.22.11.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:45:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/4] clk: qcom: Add lpass clock controller driver for Glymur
Date: Tue, 22 Sep 2026 19:44:25 +0100
Message-ID: <20260922184425.56114-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xqNFZA1hP8JbXebrV91eyfIqw56hMBeK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX78kc/sFocQE1
 EI5t+mAa7mpDl5crxL+4TPDcuExKoG6gYke1hlAIhhsLAErrYKj84pAUW1aEPnyMpmvus1KKAvR
 OxRDSS+6YvHiFX1MlT06c5t7QMpfS/M=
X-Proofpoint-ORIG-GUID: xqNFZA1hP8JbXebrV91eyfIqw56hMBeK
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab2ccaf cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=9d4qlcpUcIswrQQTxZ8A:9 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX0CgkK/8hzQD+
 N6B+kgHqTh8X8n5BTe1BAU84OwUgTnBGO715GLeUvZP8TWjESgimjwZXaNTP3itiayDaidUejDd
 rJpf7ZDsuhiOGuBRJJ3XPRB7kFONQryUSP5wCO73zHCTUlm/cKL9KaApNwH8y4vFdSlQ9PYE+yv
 OEeNwjheXXqaSDTCiQUGXXDqwHbb+r0dqKbQF3jG/WvZkDFxywrV48C+CpLzFevbDp7zrzV1Pj2
 oTE+tPXjwwyzrXjtDcgUNc5c0Le4YMyE9x/tKTNtkTht5yxXj3qW+3vM9qN9fRxOvD66/KQ3CKY
 xqSr5T0XuK9eXHmMif/6p7e8rStmxaI6V7waHMq3QIE9e4oox0L5vhnQ3ckqpRoTIPRL9IQCVUE
 kOsnKwWqVTX2UA3JEIEiybDS5XnaG6nYABse978wQ8yPegWCSiO9lU1gTAhYWxKoDfHZstTOpBN
 kFv4qJBrV2OGeJhZgDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220275

Add support for the lpass clock controller found on Glymur based devices.
This would allow lpass peripheral loader drivers to control the clocks and
bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscc-glymur.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
index 97fc099983b6..782183012d97 100644
--- a/drivers/clk/qcom/lpasscc-glymur.c
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -39,10 +39,31 @@ static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
 	.num_resets = ARRAY_SIZE(lpass_audiocc_glymur_resets),
 };
 
+static const struct qcom_reset_map lpasscc_glymur_resets[] = {
+	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xa028, 1 },
+};
+
+static const struct regmap_config lpasscc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-tcsr",
+	.max_register = 0x12000,
+};
+
+static const struct qcom_cc_desc lpasscc_glymur_reset_desc = {
+	.config = &lpasscc_glymur_regmap_config,
+	.resets = lpasscc_glymur_resets,
+	.num_resets = ARRAY_SIZE(lpasscc_glymur_resets),
+};
+
 static const struct of_device_id lpasscc_glymur_match_table[] = {
 	{
 		.compatible = "qcom,glymur-lpassaudiocc",
 		.data = &lpass_audiocc_glymur_reset_desc,
+	}, {
+		.compatible = "qcom,glymur-lpasscc",
+		.data = &lpasscc_glymur_reset_desc,
 	},
 	{ }
 };
-- 
2.53.0

