Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C915B34EEEA
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 07:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137714; cv=none; b=LoQyliGnx71yzl4O1Z+pNDR0k+ibC3lQHsfpNeCJd0Vt1UqjL9IoQgWY3Pne0WFx/Xc3ZcLrAu1QCwDyvf4JVgMOweR+RXcB3qvQC/CB7arrJYnX2lszktBjfCK/fLykXFa0YnBDlUHo1+AlJuvXrWtbF1doKSH+/SjCVeKPaYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137714; c=relaxed/simple;
	bh=4istmFzgYlfp+3pK/b/yydNyM7TS9776WXEDwC5EuFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZM0KR1GaCUtQxtYsG2GzFUytUlEBegfEVojDBMwyEPzw5l/voc5uwBVnGspaWNMOurlC10vYmwmJD7pnrcjtlYrPcSIM0UUbDpr3at6g+DGKke95dYcdhG4vChN8Z8gdfMOm4zCzfgAvpCzUDife5FrEHY3TIXXsDsU1Cjz4phI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g3iwJ48V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8Or6Xzi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g3iwJ48V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8Or6Xzi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473eYwO026544
	for <linux-clk@vger.kernel.org>; Thu, 7 May 2026 07:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PyB0x6EOpIHgSsxeRbOJpjE4kVYxEcMju2rDUiJC128=; b=g3iwJ48VBAjO20P1
	9C1LYNgb7hraiGps8ufi7jWbThIYsvA+4vtkS4w3vODdEE9vEakJaAM2OrmnPIRM
	4Voljq1+YyT0F0UISIspuODlLc9D2etxZib4SI/a2jkOUC7ACy2sCmp4IpGmGGRv
	LskksV8Jhi2mEBddFLRgLxcJpf9VmiwrA+tvoZ5wy3zwhXx1eyeKy2hWOsQr/avV
	6UNVXomWEWBvmEF8cmY7c/AB9spf4UYRqmKg/jpKmXFXdxWDsidvHQBpBik8Nz9v
	Cus2GWuxQe4TIdUeTCEEx4gIfRqWf6NBQjNGebUKKFGC05j3U+fZrn8agmZv9ZrZ
	emK5IQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t0n85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 07:08:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e575a50bcso6397571cf.0
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 00:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778137710; x=1778742510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PyB0x6EOpIHgSsxeRbOJpjE4kVYxEcMju2rDUiJC128=;
        b=d8Or6XziTA3Dc6jfGcQfOPUjY+KFjKXvqII8fABQlDIWfoyhb1RaDfXtjBnkQ+37GN
         Cn+6lM08wVICcVgGoJwJGHPamlimrLgOOSAB2+up0ZFB1WkKLg6LVZ7/jPAwtiY5VlDb
         eMZO2S5RNcLaIZ4fQJIHCXMa1cUDO/PYdZ7F+k4c9FIoEqMPyX7GCjS2gFTHVLic7v19
         GaeZZ89HGBfqMNsY7SbLTy2ab51EWxfUzUjpO/A8GTpciDNhlm6kEikVfi4twKIUR+Rd
         OmJZUqAjPTzhbtGd8VB79cBnyHvw/ZNZ5L42+87DOuTG/4YLmVeA7TVUnX/98G/5fZTJ
         XKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137710; x=1778742510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PyB0x6EOpIHgSsxeRbOJpjE4kVYxEcMju2rDUiJC128=;
        b=DUo8RWo2fKueVcxjBMuLR/n9Pb+MNrF6620GL0988FsigdtzfeoFK3XbelqnS9/7u2
         jjJrVvQFvy6OTzYXWct2JLnvC9MPLs2BZlLBD0Q+Y6VDK9hoEYB/hTbtAG+CYQN7ut8r
         V35qbqCJhGdIAXfio4jKBuRkH1fAPnHAKGVozELVPwCcWbsuwBdnnc9wtY58sNlF/9Md
         61E+qjx4qRm+q2GhZpjz/euYY0J4VCrtgxoLtdibk+aECzHb2L1M5EFbvqJl3UwZYS0h
         o12Odq+TmrfgIhl3Yxv8P6gJW4bcIEUEnhc9HDZdXO+JHy/5kbH+74p7GQcQflP3QZNC
         v2ow==
X-Forwarded-Encrypted: i=1; AFNElJ8rgE1mgnSNe+RgwCFflBnMK3JYU9IqRZtQWEFd6dn+9a1efgD7Yynbyd/D/tx15yLejgP9egiI1RE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM44GnbcFPgBxq/VmHXJYHMKsgVk8brv9evepDGulLGcpuJ27s
	IyzT5GYso1q0IYN+xLORpotHW6y45Mm9WW0W4cq5myZY4qKU61fVMV0DcndWeb1tXj/HPN5hY8m
	j3F7mlcMjghatvpugsjbqoh+EfNTQr+MyjWgCnbmOennzBA9i9yaLNCM2PSGj46Y=
X-Gm-Gg: AeBDietAMpl5VVNyxJGFxzGu9AqM7Z2u/7sj2kxn6Y6DCYMp1rLxTVPVuKQClRIzjF5
	4GAsRAkTXY+yI+3P1sR2hZNdFTjyK3N0I8viVCQB5rtp9tobtb/jTtNXkXC0WuzKlmv3plM3Erd
	P4o8O30mUHfsdExMUjN/7DwGZetyQ2Asw+OZq3gr9nkClDpUfUOl+b4FWvg28zdZzJMCp7t3HhT
	wMFxCe6nF/NBdKBR7IFWQfGqwlZWh12FkJy9pyXTOgn396QASEnLCcfj1vVcgkepBbem2zFxCZg
	wQrClmZN37rsN+Juw+zzmJi01xcjrtQfGXmtKr0Xpx15WQYpcUxiBTicetHU2tncY7DJm4tVyA7
	GN5SmOXeJ63j9wq8ud+nMD8E9Pww1nZ3Oh3mpSziabAQfj2OGpMMFd5I0ff8t/45MkplAI2W2Jh
	ISx0xV4COTDvFF3f8mGLDTnx+yL7ZLCuiBJbP5xVL2HevzM6OR2oh37kK4
X-Received: by 2002:a05:622a:4d95:b0:50e:5a87:6bfc with SMTP id d75a77b69052e-51461e2c38amr95626801cf.24.1778137710299;
        Thu, 07 May 2026 00:08:30 -0700 (PDT)
X-Received: by 2002:a05:622a:4d95:b0:50e:5a87:6bfc with SMTP id d75a77b69052e-51461e2c38amr95626401cf.24.1778137709847;
        Thu, 07 May 2026 00:08:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86aa338aesm4296784e87.43.2026.05.07.00.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:08:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 10:08:12 +0300
Subject: [PATCH 4/4] arm64: dts: qcom: qrb4210-rb2: enable venus device
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-sm6115-v1-4-0b082ad8eea8@oss.qualcomm.com>
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=828;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4istmFzgYlfp+3pK/b/yydNyM7TS9776WXEDwC5EuFE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DphvICl+UHYA4csk9IecGwgiW5iWmHpgITwi
 afK8jO3IhmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw6YQAKCRCLPIo+Aiko
 1YIcCACLZPXUq9YSq0jE+y8NVrsRtUrs4D3Eq893UYCq3bp8L6I+NtMmdXO5oJbyLCDUcbIdzHO
 aSdPukj3S7Y24lUP7X1tRDTBjdOgUM2lZznVaIKJMs/BbS7IZCLf9tfoaueopkhO1Aw66xe7zNA
 rpB4sn0s3W9x0XfoDSq5RZipvMhhz/PP8qBHhyLFNPmuYBU1ZYiNeWlb4vioMYjmbr1lDIs5MoK
 LUOwOkm2jc7xyYxe/zsafh5DHtiPUZWKY7wspj7oTG95l7AQMOGx4xVhSvvY2kecnX2XouIa+K/
 T3DmxK91OG2+TF9y9vtmb5v3ixCiTHFVOHU7hERX74c3R3nw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fc3a6e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=gWtj1UajujENYCbeQTwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: jZeK-GZ_0_GCw_H5jH29mDkdCohtYvIv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2OCBTYWx0ZWRfX+dEApEh1yeYp
 YaYjRXD/glGUUdfwme1/21gcfISFL9xYzCuEPwmjSwjPXpSdXWh8iWhooSdzjCuE0wW/fLR5Djo
 p+vuZTPXnuib4IDNkX9vcVwdqKMT+H2Lkbb7oNxZa70EQFU6HLDcrUJgJV5OxzwMve08L64W//Y
 J73FwIUskok9BOaj71w0agFYS5H+09xn7VZ/XVjgR3SO0mJsgWvTmUKhZeVeNJiDai38KQA7jkr
 +uJrbejwNzv7pAFYSgOcMU+Icv42/HJzDKh779a7dc71DUMmVDMM/fAwcTsyhzSwrEBW/doaD57
 +/4ltrtgkfMow3t38o9IgaZhIXXt7LAZnU8XGVa02qoWIzRzJyGxuM9zi2o5PLfcwSe0ijThIES
 w18mpCsWsJONpZ/oALjoVD3hcy+rZ8rSZcOK8cIK9Myts/DLLpMDgsUKS2bZs6XGjkDA/370JwU
 4eYwg/0kLiH1Nz/mwsQ==
X-Proofpoint-GUID: jZeK-GZ_0_GCw_H5jH29mDkdCohtYvIv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070068

Enable the Venus en/decoding device on the Qualcomm RB2 board. The HFI
Gen2 firmware for AR50Lt platforms doesn't work on RB2, so fix the
firmware in the DT for now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 1203172729fa..a6236b09cdbd 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -739,6 +739,12 @@ &usb_qmpphy_out {
 	remote-endpoint = <&pmi632_ss_in>;
 };
 
+&venus {
+	firmware-name = "qcom/venus-6.0/venus.mbn";
+
+	status = "okay";
+};
+
 &wifi {
 	/* SoC */
 	vdd-0.8-cx-mx-supply = <&vreg_l8a_0p664>;

-- 
2.47.3

