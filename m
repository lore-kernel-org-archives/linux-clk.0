Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612709;
	b=vXdRAF8wNoFqC2+j1Yo79KhyEVxM8IL9p5IlfAQ4s1LDuJbrmKJtBdKHuuzZtYz+hTby
	 lq6Mrq+/Ex88L4uU9n8IQz4WMpkiTMszr81vDFgZOZP4mZycM0G0dacMEOgGA3NxZs4aZ
	 ud4zvfb0NnocWxvbmYGyAIfpZQFTiUosAgCjF/hengkMht7gHR60Ch7NmfrkcQFKKSbfs
	 ai4eXX5Bc83w2vFRsAF17Lul6SHIQn5QMWt5L1G4M4KjLKCLcknBpnT65sMjV17yRfkDW
	 KHoAlCAAk6La0GUsOVuTLUCxNwBNT69or3PnE24gdV9D5TPWMoP1bGRIda1FYyzbyzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612709;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ad9w3TgkoIlbacQPNgPrBSZDlkh+EQgbPxPRDo3ExTs=;
	b=OOkTSg/GGA2oUZ0tSG6jzltfnPfP2Eyn2B1nHEO2kfMi+x/yFO9AuGbRkqzXnuj7r55Q
	 QCM1+2/aTcdBC8hibDp+XT43x4t5HOrpOPIZhOIN8qfr4mHthm3jlLvLaGo52n2jPa2CX
	 ++oLfx/fGV4En6teprwXFlAKlLrA/h5igC6l8QC1agiEE2TBVJdUObw6/UrNYGzpF9D9F
	 hWuFNdjx6ffeGhtZR3xyaY5EtzipLkYBlc2YPbAO2mVDXsjuOyN/PF9M9M+2jO/nHKLR5
	 t812bJcIdhQuBGHpAW4l8xETgoyGWzodNyKWHaApRRZ5upqIX+rvJk9wP5uKzaqlQHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AoISGQwM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPt4SbVz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B01606A33C
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30B01606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AoISGQwM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPt4SbVz
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mriM3644047
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ad9w3TgkoIl
	bacQPNgPrBSZDlkh+EQgbPxPRDo3ExTs=; b=AoISGQwM+leo+9FKSlOQPI2mNhi
	Yi/0eM7RlEt+R0qAtHQrLrD9AOy2n3G+a+kecau2AuqYIsuMzovRISDAP2b/Lkwb
	ScuJjzOJzSY1rsN4Slx9Dtt3hQ+1iTdaTSxawyclV0gdWzAVwcregxt12u89lR/i
	DrQj/8XTVx2LpACft87JlrQNXVKihUWuoqMnCPNZLx+rQfIlE4C3PmduCNQ8WC/i
	O4pyxfrhHcHp+35c4YBv3CUrUb82OM058ix7Vr71TstYbDa+yojc5DvCit05IRFz
	C4H5+DuNVhkr27FVjpuidId0Hrz2snFyGSH4vJXMmnbubj8r5R3NQtmyl/A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2b0fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:18:26 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99e13604fb3so3464854241.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 05:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612705; x=1796217505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ad9w3TgkoIlbacQPNgPrBSZDlkh+EQgbPxPRDo3ExTs=;
        b=fPt4SbVzppXWuOk1/SOXNLAF7jHdjRng2YbKiQiciOPBWwY2FgfMFicEYj3zAU9o26
         PMiVdgynsnpSu/poUm1M1AGUCwm3LYFKnbsOcTxvHtTDvm/S+264bbmCX2+MpI+qNhxv
         JQQ9NMVuvcJA3QCgH1ahaqpetuUd6mBthPWuBC0rHNwleu9EU3MmVIJczjbx5OVtccTQ
         CoDwcXF75dk/xOXnukzQ9/o9q7EMpBz9MJpZ+TeaV0m6pdM0KRxbdRrJaZEUO/1bYFIJ
         n/LVYc2ge+T2ZJtv4/rayj50NJ4czG95LIXoZ7RiqteHDTxyT9/iuRh3ORsbwoZAs2h6
         kuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612705; x=1796217505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ad9w3TgkoIlbacQPNgPrBSZDlkh+EQgbPxPRDo3ExTs=;
        b=dXIIe3MsYS0AvK0XRHuTv38f7keFo1uMwTCFsZpOkjIDt+hV6JyvBaqnF5vIe7GuHU
         2mPOa8n1Q1KUSQNvwbSNpWTgJkPMWXebfBbfBXMuM7FVrr2aPqBtUl3N7kFpkOJ114q5
         iQGo+XMoc8qpGzv3ASybbrYJXghdGZNsZTKdAp1KLPX79ChJxqYTS1GtiRkmDVhMdQnp
         tu+0sdrfYqEpVi065EGY3bH2E9ly/EnotLT07fs1GU97RzHLDjqXbCMAUO3yfifwf3lm
         Eui+Awzdk2qCKZJUZ6HcVzCZjDHtx+anwILHuS918FoeQfF7eCX2r1S33jr54SBK9VnK
         j6Qg==
X-Forwarded-Encrypted: i=1; AL+hErGVNovFUC2f+H3FzLR9yZ4tB0RU+0QCQw99xXF+bbUnGqc/Pf/4Le9o2N8aYTGvQfmVoNHEB3P918U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5nW+j7UMnjCnB66uEWdQMYfCVOE8hmvQ3kSkFIKRfnnLaVKXy
	uEKxdG+ZjH4P1XM0MQyqzCn7TXVOhGBOZylis5J0OOi749LAKRDcpBOGdldOgEFru3Lgr/2tZYj
	Co26+6fqY9y/TcoanWhyYh4fC/o7Ghuv5UzIONvaLKby42xBOgCQzggtbHs0xll0=
X-Gm-Gg: AZFdTZcNgfP63VJNld1R5Oc1JOqo7eF3rb5eQxEqJ0G9n0ZMpwywo7M2T/YhW1aLLy5
	FwYtlMs1XADa7/E6Q+TvVHZFr1BLYOIP3026tjdqCoBhdVjilQN5hPrmdQ4aWIKwXPNFSe+YIT0
	qQfSZOUAmDeETsXWHomRn3+7wPO5LZmvgeF4d9tgdJkD4pDys4apAx+WpieQtlVwUzsp5XzGBN+
	P6D6iYdt6vz2JqRFbF7YVhKWPwCn2H4PEq0+JAlsuO4y/lyudqFXm6P6/EzlMMq4HDTdsyvSSWK
	C04+A2LsvPvlo8XNXwhVIPRhe2zLPXIHu6OhWUqMTyoSM1ntKHzCDJi6z//9KljIu0w9F1svnpR
	hP2YPAgkwBhrktBFcWD0mGdKOJ/FFgnp0pN86/s8ZokE33TUSY3FpUCq6zCW5xV5y
X-Received: by 2002:a05:6122:e26d:b0:5ea:e175:b2f5 with SMTP id 71dfb90a1353d-5ee8adf330dmr10851435e0c.1.1795612705588;
        Wed, 25 Nov 2026 05:18:25 -0800 (PST)
X-Received: by 2002:a05:6122:e26d:b0:5ea:e175:b2f5 with SMTP id 71dfb90a1353d-5ee8adf330dmr10851392e0c.1.1795612705104;
        Wed, 25 Nov 2026 05:18:25 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm205035365e9.0.2026.11.25.05.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:18:24 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 4/4] clk: qcom: Add lpass clock controller driver for Glymur
Date: Wed, 25 Nov 2026 13:17:57 +0000
Message-ID: <20261125131757.1163466-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06e022 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=9d4qlcpUcIswrQQTxZ8A:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: Uzy2DY5ynQrVGszwS3d_lisUa3C0ZWXt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX9FP9mHEcYnHr
 kJBZjdPxT3HcpIWrcp8PRHhCPTHpyVUZVPG3cLjnEnDDc97uy8SG4lChz/2AMBbd+Hd8/ME+qEQ
 W6LBaFCJkg0lwMV8cMAgI2icF/LWUvvht9d19G59y+Le1rA6mKZ0G3iwzwEieazRkJlI7a7paDg
 0yhZPtyFnJviwlUEHt3qFwjCmPtHLBuGkZkYMvvZLkCk4Pbc729bPZtJDCxKQeEZTghPrUCMTxv
 nG9sRK3N1cx9aRCjBJ1WPrDwC91MErRlNIaFVsO8R3FND+P+D7xNk4Sk3ObrvkYYVcMiplCqwve
 VCe3jiz7GbgOGAOEGrOkv3QWDfZ4zIuqLaZJDulqNsPNOtqYDiY3IR5+s4+Ycf+iJ/gQ/vXDpj1
 raYtQOCvSRs4pD3YYWNm5xPTJ/vP36Ic9GAw/U+tT4YgDVbPOy8j52HVF0rKkigl+rEc76I+1Ij
 Fb1v1St2xmY6l2sRe9A==
X-Proofpoint-ORIG-GUID: Uzy2DY5ynQrVGszwS3d_lisUa3C0ZWXt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX2cQQlGyzWoLE
 pDbrkW5xGy6dvignIt3+epIQB3y3QxPQqm6XsATQU91Qg7OoAb8BDmsv9EcwjwTqgUGfeP5bEuv
 58V0WbRpYX5j3+DVvALXfi1wfGQEm2k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250052

Add support for the lpass clock controller found on Glymur based devices.
This would allow lpass peripheral loader drivers to control the clocks and
bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscc-glymur.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
index b7fdd76df2f5..742a88ed318a 100644
--- a/drivers/clk/qcom/lpasscc-glymur.c
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -37,10 +37,31 @@ static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
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

