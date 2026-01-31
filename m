Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2187C3587DF
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 17:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769880836; cv=none; b=glLcV2qMHPUxSTK+leWmNZVCjWIVbXVnuwdCqnSHqHGZ4Axc7au+GZMx7/izVxBlZEkjhCMv80IOzggpCHtIZqzSHiJs+TlJ2GKzwViSp5L02r1H9Np9WQOqJIKf+Lur/UCqyqU6ZQBHy+pP2T1D6rTUuNeasv3tYbqunNmom4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769880836; c=relaxed/simple;
	bh=V8seKBLMc2XCjBIuIod8MrpNr1Y/AumnUHtI/qBPKU0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EIh8ekUsLYiSDmyApqWNNIg9D/kJXq/W4hPzlt80r4bJXvK2/ld8cb7Fk4SvIbQeZshsKhVRR38xclp8nWMJeCuOYRdaKh/p96wJ3LuMvaanbAOEMGqpuuM7qyBh9Y55k94+k+gyp/+WDNuwIXRJKaszvpPA0PCjQwyRNp5dhoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/6CKUsA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N0mydqcb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/6CKUsA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N0mydqcb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60VC0GTI765842
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 17:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3pxyf02sUds+FetYaEyjrt
	v/4VrVlWlRD+gfjbvWsZI=; b=E/6CKUsAi91zI+wxqaahfGT3jss2GpTV2NSF2R
	/WrnDrybQ+WWXKWb2P0Hm8aI7IZAsPPp5nFb+o3R2WIhRFqIBJUxOh2y3McEwuTx
	oQe2HIcZ8JTXzPLRkIvvJCNYsWugCTH4Myndp5LgpyQhlCoGBhBH19wjAIkb5UKv
	RN8/8phxElUH9WXq7fy+eJuI2E4cKqqx3kIH8Qn2AlqY0+9iOzSRcNZy3o9D3LHw
	8hbxMtrF8ADrN2T9sZW49K9PmbRwS15fLyLTMiPphsIRNdi3btdD8g5piqr129Q2
	fkZdxnn8v6gE/3kmriN8aCB7oY0Eg3V5r5YRJbN95PksyvaA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avx16q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 17:33:54 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-948391cd12fso3946639241.0
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 09:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769880833; x=1770485633; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3pxyf02sUds+FetYaEyjrtv/4VrVlWlRD+gfjbvWsZI=;
        b=N0mydqcbl9cOPnUFZnNPEVMEuKHGdYK2leQmuiEexjpbBfHhLFl31LZG6xeFrgVKv2
         JEYdoRsnd1fRfEf7rNc3W1a40297C/8jxs9TDFWnjZrlsEo28T7vTWf9NFSdecmIIoOY
         WJqaZCDlAGiaQUYwxngel2Wx3Yzat5F2VXl+Ow84d08U8RgUvHE/kfcAA8ARbbUmfy2a
         YJ+5FMZ9qAlHGgAiz+usKtjjPObPKXFoQg+jXNH0k0APNkp1gSS3m7ajJoMeKGnuQfBM
         TwlTOs3B6eXIH8gCQlSPTi91WGyHQdiWoN7ZlQK505vPpHJNy5i48uQ0E/wVRY6JNtp0
         UTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769880833; x=1770485633;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pxyf02sUds+FetYaEyjrtv/4VrVlWlRD+gfjbvWsZI=;
        b=nxHHJnvsU4034L9F2+K8IVwdKKo31eVWs6GNRQTif3Oq8Ov9IvfDTE21ORFPSbLW1c
         CeTj+IqR5oR+xO5RD1071yTcsM2K81LPNjQPhN4ewcIVivHprp95jxA8LMUIHxahqLdS
         1I1sW70zLPRmfGne47p51sq3cXLKUf1nDpfYFJ/CW/dy6BA7XTE+SZDQJCRyC6ZVhsG8
         Zi1+ywPUEolTsv41P4Xv6EtKU1L3qJlOnlZan0ps+8MyMjtg97H8CoZvSC0g07qmtDEH
         nw1wc2VqF8RR0V26Kjdlbd/aWjMV7U1vbgeG0H/8AkYTeg6BNoSKuPgb0I5Ln2vtdza1
         H9zg==
X-Forwarded-Encrypted: i=1; AJvYcCWR5+F7lTwY3fvfBP2RiNzUItSEyvFs6GzEBNtF+fhCRmAnJASNAxoz2n10VaKyFmk6BHZme6a+7uk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/K7efySp1dhW2tQQdEtgrPEYNaYF97aue/JnTGu1VPkZee7HF
	g818JxmKy7wx89I1vxXfDKje5Fj2inKIrkQG/rKr5DapOaMHeTZKqdXmgDHmI2i8p8oPP7gWD6j
	KlUkhMZ13yShNWZHrkQHPWBNlmsCCN6lefp/zMfJxYKomnEGMh2pt10mkZjZtbT4=
X-Gm-Gg: AZuq6aIr11B1pk+q93j9MbSKWLDIyfm2rjiuNolp6dE1jMRrcSP+1HDW83wu70iz1T+
	Y6aS0vRemhTp/jDRmrfTLiiua8XO6FunU23Tq5hP21cdST8wXgcpZJuzgNAwVLmNGoNtqCIOckg
	6sKnVrlvkzpeghlEbWqghaBRRUt3RItVuWjjL4Vzf6h69iETP4N3msmJOfh1nnHyOlYMTytHC/T
	pses8Jd/YJXwigQwu2h/dmUHNURkTO0tJ2plZDp+lvBjY4J++foB3onNJVaNORkrCA+n4DZN7S2
	QOlnrUAULLBxD2+DfQXGXbP9CFPlguYFqgL68Wy8Ado+g95V7BVbjd7f8lT1wSbNxER6kcTYzTn
	DKvOtz0tb+hXMz6g0A5OXorFKFnmSV4fyQBZJ8rBGWx3jk80ocBqKNgST0QEgkkhz+Ek8J1ji/A
	AWArKNlvrP0j/FlEEnixNXgDg=
X-Received: by 2002:a05:6102:b0d:b0:5f8:d1bb:128 with SMTP id ada2fe7eead31-5f8e255abe9mr2034494137.27.1769880833365;
        Sat, 31 Jan 2026 09:33:53 -0800 (PST)
X-Received: by 2002:a05:6102:b0d:b0:5f8:d1bb:128 with SMTP id ada2fe7eead31-5f8e255abe9mr2034461137.27.1769880832851;
        Sat, 31 Jan 2026 09:33:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074886f0sm2443236e87.24.2026.01.31.09.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 09:33:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/8] media: qcom: iris/venus: fix power domain handling on
 SM8250
Date: Sat, 31 Jan 2026 19:33:42 +0200
Message-Id: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPY8fmkC/x2MywqAIBAAfyX23ILa034lOkSttYcsXJJA+vek4
 zDMJBAKTAJDkSBQZOHTZ9BlAcs++42Q18xglGmVrjRyYMFI/hZ0/KAcvWkUOlv1ZCx1te0gt1e
 gbP/vOL3vB73S0GtnAAAA
X-Change-ID: 20260131-iris-venus-fix-sm8250-f938e29e7497
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1790;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=V8seKBLMc2XCjBIuIod8MrpNr1Y/AumnUHtI/qBPKU0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfjz+Cuhup6QdFylU9IHxfsiBjlupoDyQB84NK
 Cn/58W6c3SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX48/gAKCRCLPIo+Aiko
 1YPrB/9qQMBkmnwuxpjJFSUdeXeIk/BydgGoAS9Fo/ISHhaYVbvbEklk86iBScauide8lcoaMrG
 FSnauGmwcx3WC8+xd0lDyfLNP8/tKKsG0iT/fpVCWm1s+3q1+lUYI4gGcXQhC0VDRmpZaGEN8iw
 0xgMQKIVzz3SKli8sJ+9lWRjqBdzZyTR04/9dCYwqyX2cmQOKOkYJVC8e4NkNzrVqYxoBiyi9oG
 0JaqYOwaOBBHB/eO8IpWn2eIr/Jep1t1hQ549t5GyjZ7G7a7mVIL3SfN1G/YkNdEiydQNdCehbf
 Amsl+Ef27kUJLK2l37/oVwU0EnQXpZDKMbBBoXpkVKIz8/2T
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: _pwlPhu876OVLYyfNpVkL6xSCViauPfB
X-Proofpoint-GUID: _pwlPhu876OVLYyfNpVkL6xSCViauPfB
X-Authority-Analysis: v=2.4 cv=P4w3RyAu c=1 sm=1 tr=0 ts=697e3d02 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0RjBngDeADCmygnGHrcA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDE0NyBTYWx0ZWRfXynS7VHa9SinA
 D8LVI2MFsTvG6g/UQeE0oVg0a5ifs4XkWrSP8+syU1RA41jQzHA/Sm8YYRkHX4974yn8R/uHign
 QEC8ddjuXc+mhDFEf2S6Oy3K2dLfJWfByNdXnsz27eZxJDnWgNxpqHxOeNkhOZIS9dCv3cx05m9
 WtRrB2LcR+86Rs6i9GkV2A/VMgNTa1dMiDtBj37OEYpYbwm9FlF8fN7DArx4oxg+GATMSCZTdYX
 wurAFkJ9RA1wpQsa30L4d4cyuGU3AIKqyvubNzvCGEHN2ZQMULW2f02HSt/bds+Jjd/YJkYWvGa
 YLTi9VrOseJ4U8aZEVdRb778Gwukb7bS0HzPtMImizfMCgoCh6z+BPx7FEdPiDARdHSWkR0ytwu
 oFnalwp+dCEoqb+mjvryWdH6qQJYD+nXE4/ZLXYlqm9yqqD8Jye7WLKzmShD0pQ6J9OwDGebElE
 L92SjZXnubPX4mDRqJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310147

As pointed out by Konrad during the review of SM8350 / SC8280XP
patchset, Iris aka Venus description has several flows. It doesn't scale
MMCX, the frequencies in the OPP table are wrong, etc.

Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
stopping it from being overclocked).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (8):
      dt-bindings: clock: qcom,sm8250-videocc: account for the MX domain
      pmdomain: de-constify fields struct dev_pm_domain_attach_data
      media: dt-bindings: qcom,sm8250-venus: sort out power domains
      media: iris: scale MMCX power domain on SM8250
      media: venus: scale MMCX power domain on SM8250
      arm64: dts: qcom: sm8250: add MX power domain to the video CC
      arm64: dts: qcom: sort out Iris power domains
      arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table

 .../bindings/clock/qcom,sm8250-videocc.yaml        | 80 ++++++++++++++++++++++
 .../devicetree/bindings/clock/qcom,videocc.yaml    | 20 ------
 .../bindings/media/qcom,sm8250-venus.yaml          | 10 +--
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 42 +++++++-----
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  2 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |  7 ++
 drivers/media/platform/qcom/venus/core.c           |  7 +-
 drivers/media/platform/qcom/venus/core.h           |  1 +
 drivers/media/platform/qcom/venus/pm_helpers.c     |  8 ++-
 include/linux/pm_domain.h                          |  4 +-
 10 files changed, 135 insertions(+), 46 deletions(-)
---
base-commit: 44ef70faf71468e0ae4bdb782a6d43f0614b8ffa
change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497

Best regards,
-- 
With best wishes
Dmitry

