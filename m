Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B833D2D248C
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764151051; cv=none; b=rx2diUeChrb9Iv1n1fIXQqIoFpIULlI1tZ7yQMbBY5VNsMWbam5gjL+ytjIweJBwYR1wvzvZcrXwfv2BC1WipkdkIp/kNzImUPUYlnwA6CZdeeRXq43EnOFHJxD1F95kTUv8yMVwfEyE/lX0oqkgiMQzgTzTYE+9t0iQ4yXdV2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764151051; c=relaxed/simple;
	bh=NEGFMy0nRQAe6Jss43gE/3cXqLJXeeTmmy93lkDuVe0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gfx8x3RhYfN+J8/rpIC/s6eI8Whso91dtKGnSmtlqaUnFYQWYnE4WLAkpSjlzHzppZltrmj+i5DoLlLLeBPtyYfNmKjxscJAjcNxq5Q0Vswy0Xrl4iZZ9SBjE9cHTujQU89z9GjzTo2i0Pdihfwy5gZb1gS/o900NbjqENsfHxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iC2UKr3m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKNT9en4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iC2UKr3m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKNT9en4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ6a81g3738462
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JlZx7jsn0ohvWBRiqsd7s9
	WjNFmN8h/Y+O/HH3sJma4=; b=iC2UKr3mpVwlXO7YfNY76GInGXTNyDPdVVZDE6
	NinedKU/zUWAs+M3UpMD9LEehhhHEl72sVQOJRwMnX9oquBATwCNx2yw7VRTx05h
	aLM1zHqrM4WrIqpYK04ijZ4UansPV/Kl06vOlpTcm+r1gXsMqy5LYdzz0KEHoCyI
	uDspkQ3BPL9Av6tZeu6xo4KMXJVnQhdhqpODgtd3dtzrhX5ysHNZW/mvX6VeEqaJ
	WR8Ek0bN9MZ6xBzfTmeInixRFxP+eLNufvbB9yT+GnhAQPvm0Tf2vm+NDHisYDer
	SS4m7DYiWWKIbxp3MpNgYWXq2FWYnmiiU/2hsm1gkU1t2wRA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anggyjd90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:57:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3439fe6229aso613927a91.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 01:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764151047; x=1764755847; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JlZx7jsn0ohvWBRiqsd7s9WjNFmN8h/Y+O/HH3sJma4=;
        b=YKNT9en48cmc8uPN6bE/wr0TA+7uLkRAyK1BfA4GEczL5tTXb22jTMTFxA801HjcYP
         bjWTfGdoXDs4xuhEo2GMTEpmBL5SXgE4JD5cIw+HoHsFBG5ansgzyAZztknzdpYBLdp1
         MUlUsgk2CSb8m3SFGODQZ/RHahHF4DO6K5ArxXVBUWBnHPejoapuXvzzK2ORYc3hYIr/
         9Y4gowpL0OoKJOauFxaUb5o3XW/Z6rqhGfGhBPXHGWnboppSD5Zqdni/w9+sBqDeC8zI
         NW9jfHVQh66Hy+rCd3mnSKeQGTE42s0MMorPJtB9kzk9zoZ79qsuoh3c5BFAaJ1/NO8b
         rvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764151047; x=1764755847;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlZx7jsn0ohvWBRiqsd7s9WjNFmN8h/Y+O/HH3sJma4=;
        b=EEmCQ4xU46ASaj9N1ezpE9Vj25sAdhpr155RyU3wWHSZMtD5Pzcsh43/FDCiEg/0sP
         R1DNgN0e1J+udtGouxGl0vr5DgcLy3X7ZLmesIFQJ6OzptK0bUpZIwjFHgwT6OTOcbRO
         fOxY64s9cRmW9TOCOAL+WGmyRpOhKdTnT4NTOWI5xKbSFNqY0swip104RfgsX849hhsN
         MZ2IbUVUDayVZm1XTHQmQne1KiklZSzmPSOytiAucmjHiC5hgfFpKxXR+2VgCLKnKDsh
         hK9X7uML9ZLODr7uXB3OM+0eP6VJvdiICIe8qct7mYmvAHyW+S1uD6jFQoFLqyn9ern8
         kV6A==
X-Forwarded-Encrypted: i=1; AJvYcCWOdllQ9QMPqzddhAANY08qtLv49IVtcmEee2niKwdI/NIg4QwPLz6ukKyJGbcaiN1fUld3Gj1i7CU=@vger.kernel.org
X-Gm-Message-State: AOJu0YybjYHfKP5GC20gSpkOJGvCraXz+MSuW9h7ikKdM/g+xsE01BrD
	PtjzVyyx25AsVq8O2WPA6VkW6fYEbw+x81oXWjWPOBNpqXqG3bZsVkfNFPatEVz2Tql4oi5v99a
	XToS7V0V7cWfCd+7Z+ZoCMxBYd4L8Yy4fKOFN5QNnkE8nGU2uXO/y9OklDjmKX7A=
X-Gm-Gg: ASbGncs+DCdzNN/j5WmZ9iMJ4e7jhC5bbbNK72ZFPcVEpN0Gs85eHsdQBCi2VSXjRgL
	FoHTUe8eq8MCEDh0K8LjS3GtkKuQM+MMLGwET+meHCCaNTekMJsd+7hvI43RfK0YhiADAV3uLdz
	wl7g8hZUAiHoniZI9Tu5StkzIKm6Su8WOxBpJKe4vhRK1bzQizBuGMCZnpK9ZeQqaIJ0B0z0tKA
	Na0MLFmnCS/I8geQmk2vZnEJodTQEVXtPn7t6c4zK5xI9DnqnoZhn1tup6PR9+KCWB0erMjhK8a
	bmvwtOnaFFvHQLBxRPktD/hl9YOfsDPrewegvw8CBsTQipmcF3KAa056aec5ZPVmAe8MiuZppRh
	pO8neh1l5H71brJmtROTg/0ScdnT8XJTBPg==
X-Received: by 2002:a17:90b:3bc4:b0:343:7410:5b66 with SMTP id 98e67ed59e1d1-347298a9f91mr19630616a91.11.1764151047405;
        Wed, 26 Nov 2025 01:57:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCrMYM0wgYWYSQNLsr3qbYaJHoOphTVLZmoKNMM8i8wLTKMMOKT4/vqqy2PeNCWWtxYLYUiA==
X-Received: by 2002:a17:90b:3bc4:b0:343:7410:5b66 with SMTP id 98e67ed59e1d1-347298a9f91mr19630596a91.11.1764151046882;
        Wed, 26 Nov 2025 01:57:26 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a43ac07sm2042843a91.0.2025.11.26.01.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 01:57:26 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Add support for Clock controllers for Kaanapali
Date: Wed, 26 Nov 2025 15:27:14 +0530
Message-Id: <20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPrOJmkC/32NUQqDMBBEryL73YiJiZh+eY8iZY2pLlVjk1ZaJ
 Hdv6gEKw8AbmJkdgvVkA5yzHbzdKJBbEshTBmbEZbCM+sQgCqE4F5wNxlzviAuuOBHbSoad5pY
 Xlep6Cam2enuj9zF5aROPFJ7Of46Hrfylf8aSClZrVFrqWqGsGhdC/njhZNw858mgjTF+AZwjm
 By3AAAA
X-Change-ID: 20251121-gcc_kaanapali-v3-ab91e1065bd4
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: zBL121wGDswshicFnhnf--NccrG_2p_S
X-Proofpoint-ORIG-GUID: zBL121wGDswshicFnhnf--NccrG_2p_S
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=6926cf08 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=pU5keNj5C49EkLXuPzUA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA4MSBTYWx0ZWRfXyvtSePJE9gKs
 l0LV4yNBzC03eZbZllQSGdu3h6Uzhn0JDDI9ssqO5JG7UH09+jI+/P/GaPMPwUSugzuHKzlW6YR
 N8LRbqwMYyCjI1xj5IUbq2XSMvGwtASyxvhjsiMMii3oGidroZbew4VkHS909efvL35SWxmE+Mq
 g/0kEPFVW219Ii09mgJc9QSRGhnbgIjpWscHpHODXLXVvWL1zSEqrTwk0HzFgiW/Ej8Yloq0FW+
 xOYBl0LBjs0lTLqLOtuvFBlljftRolIvoOxk02r6GrZ2cBXhJYIC18QwBaEIkzqN5v7VIsyx0RD
 4A9nhfY7/6Bh4RYUq6ewKeDJF4+4fNJb8SeuSsqhKveCwtYm7PpBfmlL9ztiMTZZ8kw6aeJKF3P
 uidO76AOK9Euo4DmmlF/GfPeAQ9saw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260081

Add support for Global clock controller(GCC), TCSR and the RPMH clock
controller for the Qualcomm Kaanapali SoC.

Kaanapali(Snapdragon SoC from Qualcomm):
https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5

Changes in v4:
 - Add the patchset from https://lore.kernel.org/lkml/20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f@oss.qualcomm.com
   to this series.
	- Remove the 'fixes' tag comment [Dmitry]
	- update the clock names in the glymur desc.
 - Update 'max_register' for tcsrcc to 0x3d000.
 - Add RB-by tag from [Konrad, Dmitry, Abel] for TCSRCC
 - Link to v3: https://lore.kernel.org/r/20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com

Changes in v3:
 - Update the new RPMH clocks to use 'clkN' convention which was not
   moved completely in v2 patchset [Dmitry].
 - Use lower case of the target name in Kconfig and Driver code [Dmitry]
 - Update the TCSRCC clock offsets as per the latest discussion for
   mapping the TCSR base to '0x1fc0000'.
 - Add RB tag from [Konrad] for GCC
 - Link to v2: https://lore.kernel.org/r/20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com

Changes in v2:
  - Update the commit message for all dt-bindings to incorporate
    "SoC/platform" inplace of drivers [Krzysztof]
  - Add RB tag from [Krzysztof] for dt-bindings
  - Split the TCSRCC to a new driver instead of reusing the SM8750
    driver with offset updates [Dmitry]
  - Update the new RPMH clocks to use 'clkN' convention [Dmitry]
  - Add RB tag from [Dmitry] for GCC
  - This series does not have any strict PLL code dependencies [Bjorn], thus
    drop them and will be added in the Multimedia clock controller
    series. Drop the following patches.
	- Update the PLL support for cal_l
	- Add support for controlling Pongo EKO_T PLL
	- Add support for controlling Rivian PLL
  - Link to v1: https://lore.kernel.org/lkml/20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (4):
      clk: qcom: rpmh: Update the clock suffix for Glymur
      clk: qcom: rpmh: Add support for Kaanapali rpmh clocks
      clk: qcom: Add TCSR clock driver for Kaanapali
      clk: qcom: Add support for Global clock controller on Kaanapali

 drivers/clk/qcom/Kconfig            |   17 +
 drivers/clk/qcom/Makefile           |    2 +
 drivers/clk/qcom/clk-rpmh.c         |   61 +-
 drivers/clk/qcom/gcc-kaanapali.c    | 3541 +++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-kaanapali.c |  141 ++
 5 files changed, 3752 insertions(+), 10 deletions(-)
---
base-commit: 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
change-id: 20251121-gcc_kaanapali-v3-ab91e1065bd4

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

