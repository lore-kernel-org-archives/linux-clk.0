Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7BB442FCD
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 03:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788234825; cv=none; b=LvQryHg42II7mMU6sf4GhFq4+UKfGF8hU7mveSQJAta6lhkbtPM/wkGH5kR4tlXSbhRwa3ZIl65IK3uqAEGTz2mp6sy8NVhSNx0ELb/ysQmZ+bJdEAzI2w8fHChIu4HakeCmaUhI6HGFOUnwaoiHIovNJg6Dy3Y18jPNyPtK0g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788234825; c=relaxed/simple;
	bh=Sucy4fr6KPej0mCXZ8RPlOV666LJlaDDldUIymHzob4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HDawv4ItQflnIypV5fvXf8eWEzinzv3SSJNbukkBuAZtMfVAOTMQd1gPXg8G0A8rjU0/3H+Zyg7YnLwLt1vUUtxwvxw8bF9Fg0B9hIQnN6OvM/2FgsfRGBaZthdSYLNFIeyxAgf9Ta3xqrWQjNGUz2crsxRt9TseF0MJgVQeOhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cK/UD5eQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AoDZnKK7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cK/UD5eQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AoDZnKK7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810oRdl4072413
	for <linux-clk@vger.kernel.org>; Tue, 1 Sep 2026 03:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KS9QKPVhNbB
	jP7g5X0bEgCE7crQtVcVR9ScRHPxuWRE=; b=cK/UD5eQQgBvQFMEjZzQVD7DnAG
	s1vUo4RoT145Vhw4aF1H5pPhqGdq81oYfujmtC2NAUk0QQglwj3/tjXWpcNrJ7Cc
	6UKbOK9AfCRMkB1cJyYNPjM5JtlVZgzYVpJHAEKi2R8smESF8923UqagwoucATOc
	jERyH/72TetZkbwUsjy3+NrF8A8cOEq9YBxeHCik09WqwblFS8ixLF6sdhN2PMxa
	oAftPPQyx8sOedxVe9pBmdWmyCS5wfH5PLEywOP9SYnwAluYC2+lpdmc7TBbvP3r
	+RR4629WLxeHyMpWeTGTBK5VHRcpp8HLnY31rhZyZw7OHUppr/LdD67oKtA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vamgaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 03:53:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf1c86963bso5610975ad.0
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 20:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788234823; x=1788839623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KS9QKPVhNbBjP7g5X0bEgCE7crQtVcVR9ScRHPxuWRE=;
        b=AoDZnKK7PVX8JqWH+fhR1R/5n3yGZGBb7Pi5VMHFyQG1W1J4I7+MU4+RVKtT+HowkK
         xRXCMNxLDP/7QfYdSA8NU/l3xi7UNo2JYtDDRczoFw137vtxNBxu1+LSEj4EiSSCnHVs
         qOdo00PMb0rLRH9n6EOSM0lNcnSkVQHdpa7LMwco0DDTfbp2u9KqKwXQVaP4vSbaQOK9
         vaeB/K9m6Tapv8n3vOc0X6ThUb8FbYHSfvohWvAudCYNG2CxxRlKS1Zl/EpVrgtXw3uJ
         KyKWzi6b1zAZUwJuAwGgIbLXBPZThQFOFGz+Op8MFgZtlpzPTwH+NBWeQA3u0p7pbxyR
         bvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788234823; x=1788839623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KS9QKPVhNbBjP7g5X0bEgCE7crQtVcVR9ScRHPxuWRE=;
        b=EllXAT2MqVHmHfX1aKXYJVm7DEwK/SY4gRQ0TnLxlsfyy6CrH4wS3yuGMg06ZogxHW
         DfmEn77H+bY1FeaQWWU2Tzi2VdlqtZMDVQyPwTrlWu0y1/IIdRzzAMh0Qpd3JS9fIHLV
         lQoMCel49qtoITguGi4K4AUesKMcXHJjcTlITEFBVN5hqrLVLghs9Kpnu+TGkU7Xba4I
         Kz/3OkibIH4WFmwbAeysteRxxghwh24mgsp2BVMh/brSUMj2Dl+unrVTLGimW7t4GYKK
         8q2AuS/ZwKnBGdzuqBnnRC7BeNq73e2FHo4pcHksjMm2Iy2GZc+3g5DIJwAmLqEio2Ot
         /g8A==
X-Forwarded-Encrypted: i=1; AKwUvBytjKAevOhV7tY4UOWDJRsN/Rz7PityIGg6BCW2wsMn9SFX+LKiRQhlQyDP5cVjln9cbP6ei4MnA08=@vger.kernel.org
X-Gm-Message-State: AFuF++nOdjHEsqb5/Uzk+Gz01Cdw5DUNHjEpBuq3HI26u7NrWHtRu2ln
	mmTiZN9iXjMYUID9+pf2R9lMdHs8zPTLhbUfy8uwJ9NffLins3/RKMjp+C9guqdo4FsQD/PkdNr
	VTsvH/k6vMZBmnDnc/rQazDZQQoP9B7J5M7nS/y0H+spRwaLy50e8e/ZWxYJC5hM=
X-Gm-Gg: AYBFou29kuQCZHs7oFyUu+h7j/uDsuC0NHKrgVVCsVMCID/ptCq1vOqUOULhKKbzOEI
	xxB20p/cIkeY0cWjoVTIci0XHDdFJ3sD1Yi18DCrmt21qadoTDFYFvUgzeA/QNdGh9M1XDwOEVp
	M6adRk0qsI5c+UaZ8OctOavTXRJa1rHMBXvSIknP98REIREw+dOiJSjPOUA5TUSHJn+xd+RwzW2
	Uvu8Mk1nXiq72fwtsZGHHoQI64d73dkiWlopLedEFYcTJ6VRMn2MF05FBP8FJB/ynCgcESGrj+J
	m8B0G6zahwPu4773idib3sW8vzawLn6AH6dUjcoKUYNXI1DhvCoWACJGqjEZkqiE3TcHavlCIyR
	TaHIYM6g7pNR4Okg3eFs3vbKRRrgyyprl+loRzgP4FaQLFGLdgKOLIMV/+ncV
X-Received: by 2002:a17:902:e747:b0:2d7:1b20:e98f with SMTP id d9443c01a7336-2d952687ef9mr26351835ad.2.1788234822987;
        Mon, 31 Aug 2026 20:53:42 -0700 (PDT)
X-Received: by 2002:a17:902:e747:b0:2d7:1b20:e98f with SMTP id d9443c01a7336-2d952687ef9mr26351385ad.2.1788234822541;
        Mon, 31 Aug 2026 20:53:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm16702035eec.1.2026.08.31.20.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 20:53:42 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: clock: qcom: nord-negcc: Add the secondary QUSB2 PHY reset
Date: Tue,  1 Sep 2026 11:53:21 +0800
Message-ID: <20260901035322.654-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901035322.654-1-shengchao.guo@oss.qualcomm.com>
References: <20260901035322.654-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAzMSBTYWx0ZWRfX2IdUDwjq3yLI
 SCipZt8lC8+o1SpQW27krcr9IKZom3UjGqkw7rq08tB9ofnR1GITPKMy4SpP3E8WWtu2H23KeJ7
 6ztp4XN3CFuS6e4GYNu3nwyTUNZfFQorkgkLha3/nl2JzQpkJB/qvusevGEdyRFceQ+32mjU29J
 p7cjvvUycenp3dhrrKc//rSAB2sQGA69dxCcjE6Kv9Ora/hVaSxc4mWJBfLV9+yuUema9Ol/Wwh
 R5yayT7yDTKb4teQSfWc6QRomK+bdKl/8iqjLtjDzaY7rlTmPyKJPPzfnb5snt3YO0gT3uflE56
 KR5/AGdB4NlzC0GeS05evMucma8NUU9wne1HYpbZYv60e3IonPAPed3K9+XHTD2vF7Ag0SXPCiq
 eiJECSStyxITStLKn4595qM3a/VMijZcaZKDctX8d6toyjNEKhwmgwUz1m8VNjRdcMQU50ZWBSH
 9gyBxoSvN8RMzsLmH0g==
X-Authority-Analysis: v=2.4 cv=YYmNIQRf c=1 sm=1 tr=0 ts=6a964c47 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=3weyhEHb0IcQobFNrp4A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAzMSBTYWx0ZWRfX2hI3ynPnMwlN
 shAqhNW4+iE/Pcl0IKTp4Xx+wC5OlHfpR9Vhp3TlKc/y/kHVdFdUv2dpKxKn1lDh6NUgUQdAMPX
 +01/IwJTEoua8wJoaK63acWKBz70PFg=
X-Proofpoint-GUID: JvplEmN08yRkt6F8fqNgwyP3Qqpd_BO9
X-Proofpoint-ORIG-GUID: JvplEmN08yRkt6F8fqNgwyP3Qqpd_BO9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010031

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

The NE_GCC block has two eUSB2 PHY block resets - PRIM and SEC - but
right now only the primary is registered. Add the secondary, which is
required by the usb_1 eUSB2 PHY.

Note that the SoC has three eUSB2 PHYs but only these two QUSB2PHY
resets: the HS-only USB20 tile has no dedicated QUSB2PHY reset and
is instead reset as a whole via NE_GCC_USB20_PRIM_BCR.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-negcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,nord-negcc.h b/include/dt-bindings/clock/qcom,nord-negcc.h
index a7024317e90b..ad9ff389956d 100644
--- a/include/dt-bindings/clock/qcom,nord-negcc.h
+++ b/include/dt-bindings/clock/qcom,nord-negcc.h
@@ -121,5 +121,6 @@
 #define NE_GCC_USB3PHY_PHY_PRIM_BCR				11
 #define NE_GCC_USB3PHY_PHY_SEC_BCR				12
 #define NE_GCC_QUSB2PHY_PRIM_BCR				13
+#define NE_GCC_QUSB2PHY_SEC_BCR					14
 
 #endif
-- 
2.43.0

