Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188218003D
	for <linux-clk@vger.kernel.org>; Mon,  8 Dec 2025 02:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765159637; cv=none; b=ivY9oVm6d2L8WxJBLUX9FMnz3AA43cqOijMweN0aRJGVLuo1NVyM0Hf8E9RQPXmZHNxsqkj/rucjCuaYRVTZpcuZr/2sHzEnVgZMpHm3ltryjc99+YPhnXC17YVFQKNCkEJ41mTU8gSRYElEx4o9kUtF6sXCvC2ypDeaUxp757w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765159637; c=relaxed/simple;
	bh=3XMbSouumyMb0sB3Penj33n4UCbD69O7N+0naNphoNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ijfy/kNBGqo+7tF9Vn+zFmY46RUhrGiz0K5JhtqKERIHDX4+49BXz3VK2dyX4oZHmDE22jtxY3d/K4RA+QXKXpScPqKINKhCqAYoObob+mRGBiNCTTQYRPSg+IL85/hiwBvrA5hWJ8LmRKTVUkn8aj+w1mpJCXIkxGhU+DlcDQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxHAfUS1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OkHOMsFD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxHAfUS1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OkHOMsFD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7Nllqg3782001
	for <linux-clk@vger.kernel.org>; Mon, 8 Dec 2025 02:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HbKBSlf4MWwTbUUCWmkGSkEEOES4f5rj57S
	mKWxqLo0=; b=kxHAfUS1f5+yqKsT54RBg8/O3epXm7t0w1TPU6dRJQOTh/XHtys
	lFuf+F3jkwJVBjLc7HIVUjDBOh4bH4/X7WDYDIGonk/WvGs4hZ86UO3fRJyNhy6r
	WD+dBCSkWvAacmV6eFjAdaUBQ8q9hAWNUmqEyVKmvhDtn8VETyur3cjwklA2BDyo
	8U++h/7a653NqmKex2iFfImw1cIrCWUBpireO37NnGOFtW3JcCU9o+SU5BkZi4sh
	qZapY8SJf1ALUrbn3hm7VwTAHYDTTnCWO1zxdx43nYUD7uFbihsEHLYCmTPVpf/o
	RL2ovgZHCGq5WU8EahLb8xHaL4UuJDYde+w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avc2wkay4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Dec 2025 02:07:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297e5a18652so47037205ad.1
        for <linux-clk@vger.kernel.org>; Sun, 07 Dec 2025 18:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765159630; x=1765764430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HbKBSlf4MWwTbUUCWmkGSkEEOES4f5rj57SmKWxqLo0=;
        b=OkHOMsFDsK3jDbLcFftx7TN9+aHU3ysQV2dA1mJdJd1mrMBKU9VNtFRtNSBYot/Hbr
         sIjWFLfi/g3+LN8J4Gv/C0LerBCYkUNUncfRc7FtX2uEuY2IfQCtgyaEXIkJ5J9K3Scr
         wiHkClI8P6CD1hVL+s/O/mIgXIRJucBbyiDIDhXQwJN4du145+FV1/ezkvN5rfKc3/Y5
         47jdwaBUySIPaDhECPOvGTXweG5vz8FoapgX4ln2cQ3/URJvnHUiDsaVIRrXPIpP6ZD1
         67fNttpyio8hV49J1h9+Ns+XRc9XAO9XrsaZmlhSwT6L8GI01Abo8hzx3FGodEeB7hIW
         A1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765159630; x=1765764430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbKBSlf4MWwTbUUCWmkGSkEEOES4f5rj57SmKWxqLo0=;
        b=BDoau/y/vIUtGJWaa/OoYrKap1C6aGGX+4tkyw/8IjCqH4l1s/Q3KAbiId6ZMyKolt
         9mE0h4CaiTad7vxfmhvdIeef7gubgUXJshp1eN+ZRdDqTk3H0WHBkzFVMAzkZ7Vm5akN
         jsD3XC/tXd8qYTFLPK6w/PfF3MepEQW55OkM443xJt7HoFwaqSKYO/j22xoNnCmH9g7x
         NyqRY1s3cXUwkVxvcLguSwQsp31/ZM+/6meSmCKuuspNr0U7CEddP7fZIa+Tm5CwyV/Y
         vbdq7hachRhVSNdgoWBxnrcZAkVIawt9Mf+nJv14zZC4YQFazUZ16Yqp5gth//9KDZBR
         9VpA==
X-Forwarded-Encrypted: i=1; AJvYcCXUWvJ4B2oxO5Tnb7PtjSCSY8MBBHg1xZrRE3SPMU1ytpJEl94q5Qmo4kqM1NYwl3iiL1aRYVOSZtk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8FhBb51hw1n+f8D+H+CrN638MZxkpz9SoGNbiawjuoGayPE11
	Kb8x9OL6MFf8e7234zN9ba9fdfbJOfmFPMGqJnWz+606YIYCmnrEd0GNtzQeZJABmIDxhBIViyn
	6Kkq1Vt4Mkt5trvhQd17KuWXFvjGmCGDUPsNZTRlPRNewnaJXRxEiMMKw7JV2C5Y=
X-Gm-Gg: ASbGnct+Zs98a3D41x2s+KCdFCN++5/c3A4bCqW5JFB1/c4bJmFAKbmtO3qBi0SanKo
	MckOj+SYUufrL+rAHIYRyY7Mz/NH9cUB3SR1gRlvSUjM/Tt9QfLuXlVCU0iOZ6G5g0SCYMqHzQz
	me4Ls4ZrtFt8sM6tqJYUAaxCQW/3XymZonQFPNng9bLlEG3/YZw/0dH5eHgC6Nec4jJLVl8EAMc
	bbQajcpPrlY5/GzUjNpqGxWFZzc4eYYvC/ccFiMsOA4MhXivCLFTwTGZUkdthPK9UqUyIdLr9+D
	if6UiBGOyTAlNlTVqY1Ui/+kJCUJ/vK4g3v3IVoJVcnz3Kq7RF6MCCZynht+UfPdT0LAjyoohyv
	sTRK1YBdu6bgW2yAN6ATNxFOWio/nANbVFgdhoV9KKDCsi1N+jovn8k0Q
X-Received: by 2002:a17:902:dac4:b0:295:94e1:91da with SMTP id d9443c01a7336-29df5ca8fc0mr51881905ad.33.1765159629835;
        Sun, 07 Dec 2025 18:07:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFx6b8dm9fRYupp7hQJI5bc+l6tDgEtO9HPfMGHHiGLSNeas8LKpHhKGMOHvqYuqrVJSQ7pCw==
X-Received: by 2002:a17:902:dac4:b0:295:94e1:91da with SMTP id d9443c01a7336-29df5ca8fc0mr51881715ad.33.1765159629346;
        Sun, 07 Dec 2025 18:07:09 -0800 (PST)
Received: from quoll (fs98a57d9d.tkyc007.ap.nuro.jp. [152.165.125.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f20bsm106201175ad.46.2025.12.07.18.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 18:07:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: videocc-sm8750: Constify qcom_cc_desc
Date: Mon,  8 Dec 2025 03:06:22 +0100
Message-ID: <20251208020621.4514-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=997; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=3XMbSouumyMb0sB3Penj33n4UCbD69O7N+0naNphoNs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpNjKdTQVVK4VKvEuahoPVFeiirgYjw4S9h1pyX
 8Ns8YmcKXSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTYynQAKCRDBN2bmhouD
 1+QGEACXPtKBTbKddoiVBMTVrowSZQuKO3JvXcmfkhzdk/ggTqJQrVb77+nlnKomeRLBTCzmZeX
 q9xghBEBIsnQT/cOGB+A+Sg8kLOirYchZ56KJ46S5I7ZIdXC9CtN//M7j8HJj4Eyao9AKszswBJ
 OTOJzGAeji7Eh60Zl4MsoZXeB39eFxKBCtyXFd/3rS0ZHVEcW/LJPkHqZ9ayM8VCm4s0jzzcdPO
 5VWN3iKlrxpbzAGZT12TKXHt5GbwPu/twB3Zj3z0gsMpOpjNCm0mIABIFIbSDJs8u0Tb5VhO+Rp
 sgPNZP/GnySsYXfDvVRakt6msmXmAZa90ItmiTEMNgfuOm7FTQnCXLcf40crnQnO1bvSQ73mSYu
 wk8bbeACkDZ3EcEFkxA3UUT9g2/8qsehxNbq+GEaQqrATwCIS31eciXrtS0QfTKKUmSISGj7kH/
 T6p2ambt2rhIDZHaDJQgL6KZQx30lHulGd43UNbBo5Sdjr5WMHgvJ25HcXt4MP4W8FbDf5FsD03
 ZYWH8Xc797+rtRlezhrAQG9Ix1o4qOf4pZWekeyLLA65wekgD3fHra3k7MdxWqeMwYniJJfaOow
 p3O1jUxDZXaXcimgy0xZ7EyUNEdaO6ID3v2nnLsX3i7SLAi8MhpfT9O/Lu5HRQGiweAXfpD6hFB LezfhDxBoSVeDUg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 81SedBkxYKb3XAoHpUL-zAnOwy0vgOgq
X-Proofpoint-ORIG-GUID: 81SedBkxYKb3XAoHpUL-zAnOwy0vgOgq
X-Authority-Analysis: v=2.4 cv=d774CBjE c=1 sm=1 tr=0 ts=693632ce cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=vTE1kzb4AqIx7XBf0Bkr0A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bwAipWyxTdKfI1pBRG0A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDAxNiBTYWx0ZWRfX7TlfcXXms35N
 FbkmwbW1emF24oDTNJzdlgdcPYnZ34qhFWQXuNhMEXc9AeAiapHxekhIrtP3IIfBN6AzYzSvz5e
 lNA57EzQROC5RiZSFjT1B9myB42T2uI0rOVLN/9N+i+Qr08AvFVKergVZUcjTnMsWhXJ8O2QS8B
 4G6k5YaVIxtIaz/cVArG97tlSbTYfN59Zrtx+c8OE0BEHkO/ddi7dQIo8aJ//VeilmYKxxRywe8
 yUX4/mad6TeG4H6N9MjV9bymAIIu3qvWDJZBM3JEAqAjrnjPDepJqdcQ7Nyy8+/wZcKz9vQikIp
 Mc9A0L/FNEu+Z1ueDDKwuJG5rkxbxyTFUPeKSjrdBq0ULUbcit9fUf1w4KR/LTRy1Qa4OlJPYIT
 +6s1Fk1XVXsp0hJsYUWQBC3p0s+E6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1011 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080016

Static 'struct qcom_cc_desc' is not modified by drivers and can be made
const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

My standard commit, one more time. I wonder when I will run out of the
same commits doing the same...
---
 drivers/clk/qcom/videocc-sm8750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/videocc-sm8750.c b/drivers/clk/qcom/videocc-sm8750.c
index 0acf3104d702..823aca2bdd34 100644
--- a/drivers/clk/qcom/videocc-sm8750.c
+++ b/drivers/clk/qcom/videocc-sm8750.c
@@ -416,7 +416,7 @@ static struct qcom_cc_driver_data video_cc_sm8750_driver_data = {
 	.clk_regs_configure = clk_sm8750_regs_configure,
 };
 
-static struct qcom_cc_desc video_cc_sm8750_desc = {
+static const struct qcom_cc_desc video_cc_sm8750_desc = {
 	.config = &video_cc_sm8750_regmap_config,
 	.clks = video_cc_sm8750_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_sm8750_clocks),
-- 
2.51.0

