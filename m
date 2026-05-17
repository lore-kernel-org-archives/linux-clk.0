Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C661F875A
	for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 17:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039212; cv=none; b=ry//E0Lby6AmtmTIj0VzESdsy6Sc3FDmYlbFwz528FOkl0XByCAeVyFBoCVRkztg0BmI2jRqGHgYB+3MyOlgyx/GwAGsXIIXYFT9n7PN4mpStg4kBaOjgwyZhlAtYTHBA0RIovALMTbxOHkvJgBcDD5lMMJ6X4CaXfn4C6aNQf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039212; c=relaxed/simple;
	bh=/AeskSQAB+GvkvpbhAQK047uAob7kM+wJqfSBgGdkZ0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AqrSoLgpaNxlMHbmlpJ4dmimhCpjPXUH6bd82wBoNYRBGPhRZXOVf7GJDNg6U9PY8FLSXV2MSXNuID16iqMcNBs/ya/T888nnD1O5MKGsfLmanqNntEdI0DxiqXBsjuCjm48Owg/ffySpOfw3MEoJdsZtwvPQarkFeJK//VVFP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOLCIXrb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZJ9y++I4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOLCIXrb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZJ9y++I4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GLubfi1677666
	for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 17:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CtCk7wO3QRicdXUPJEyQ9R
	e7pEma9qkfvLI2CfxWtzQ=; b=QOLCIXrb84Hn3uklDwafHLKU9Rpl6Z1SBiDbXk
	afUXnDQqT8Qr30pa8qYnL/JOQV+g1yZ2s7SsNbWBhgM9A7GI4WfbIS6MBd0B1OF5
	9ICnhfyvKZI1x8A6w2LdKkGpgX269MvQ7q37P92i83dAlnqjk5qwovLo+xLkbMF+
	dZRlspMLp5+GvCaxeU9uUimSZdyT2mulqmg21kVA6MZ9bCXjZ2o7VSJQTiD9/A9u
	o0QKBJVNPTQ2g4EMTGq/UbqsGfOnhWcnXQKoniECzW+pryFKAN7ysuSzSNUbuUM2
	yQ50HiM08WezK88uU7jKLhvSAkuDdOOCSZxtCl8q+pdJSXgA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqu93b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 17:33:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-837d43e9ff3so898675b3a.2
        for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 10:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779039209; x=1779644009; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CtCk7wO3QRicdXUPJEyQ9Re7pEma9qkfvLI2CfxWtzQ=;
        b=ZJ9y++I46HDLu3OsTAdyCi5ykmpjlt19YWHEColO5KzfhxonvEI5g8kzDoDHGf9xQb
         D4Wt/dCcg84ps0sr9SLwCcii8pX9F8TbYEjqkvKDQmIRa5y6vj9lxEB9xeCg7rukL0zC
         jN7FKemgAdfQPDWMDGPnfnqxbpo4AOIItnTTcDQOVPOOjCNXDYocQzkQPxbzlPRToDzt
         ytxeUNGmRD4G7NV+fVx+VWBJNsrUIIcE9JsFgFXQFhj8rsThc1pv31nG/Sl3HsK2TI6B
         1lZ3JLlF9DKvnD6Epqi257f56glJbzFMzL5+/ZIYLwLH+yG6EF+G66NWTH2gtyzE6LSk
         qEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779039209; x=1779644009;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtCk7wO3QRicdXUPJEyQ9Re7pEma9qkfvLI2CfxWtzQ=;
        b=KFi48fG204nXQc+dPRN3yeWkwqwMI4uK5Ol0oyy7DDB3X9KbaKJqQ6Unynvg/n+KqX
         NVV404cY8v7MGi2ERwvCWmrHxEaS8JZF6B7enFFMK+IGFp9/IYu/QXXC12zLklaV3VRL
         m2Emdnd3tIe2VWOlfWmdmh20xEz/lUdosZbMFmA3pNsAw+zK+PsiIISNt2QViUF1AShL
         00htkvqtZBOHimTATBTk+240f4t0Lg8SA/pMQaZAGuKqIUibfY9weGWZHYIgepj9qZPX
         sueC7qvHxk7VjiwsVoiYWSm6FgjlvN4nnXjQT/DgfgZefqCragvcEzegopY86gzEjlbj
         1wDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lqcsh6aDjOUWtIavTDKYUc/NDwJRjf3a5l7L3MzOSR3Se/3wPvdctnMk5Xv0HwlBtWmTLQmWzULY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzltIkVJWFyPTTXHursEa8teVJX6It2HGJYEgQ/rbp03ljFiKi8
	a2GFnwAN87ZlcGF/mYfKZvkWr7S67OUNHWGiwDObIJMZY31hoRl9COL2Kp15vdJYG0Vz81R0Zvd
	nBs9SFwkgI0U5j47jloM57v0kcEB45LY2IP5A2m5OOIQdqnmWZ6As/pY8Ty68Qnmwe7VctzQ=
X-Gm-Gg: Acq92OGWXugey4V9RwOPBGncsBKuVIb80WbAywQgxIpiRsWO6cxYneNEl1J9JuKXkR5
	B4n1QEH5ddxtJSED9Z/DaVQGRA3uQkeYyMZYmRXZJ3m/K5BPmhGaf7SHqHI4X84l2eKeUjlTEAz
	BVRvYUpCX+NRJMiJNzN0p3g1HW8jvJEV3jZLZeIBaFJGLk9q/spR8B3P12aM1Te2pSecAVB0dEP
	QIRJQ1dcQKj9fNEpz83wg4ev9ggPNKw3D/OsAHQmPHsxTn8kZO5sS9aPYQjXEHG/l3wjAa5CxOA
	PA5yaVRVcvxoeKE7dfs1n/rKXjmkjH59ZoiOTFehXZwPPZEW3tapWW7XxkW/MhB1ad7C7WQD/1a
	kuoaHzZpM7YI0RGPnmirSkAi0gS0VybniWD7lZolGNSy7/8dGv7AI
X-Received: by 2002:a05:6a00:bc93:b0:82a:7893:e14b with SMTP id d2e1a72fcca58-83f33d98510mr11947002b3a.38.1779039208596;
        Sun, 17 May 2026 10:33:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:bc93:b0:82a:7893:e14b with SMTP id d2e1a72fcca58-83f33d98510mr11946993b3a.38.1779039208116;
        Sun, 17 May 2026 10:33:28 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19778c87sm11331567b3a.19.2026.05.17.10.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:33:27 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Add camera clock controller support on Glymur
 platform
Date: Sun, 17 May 2026 23:03:06 +0530
Message-Id: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANP7CWoC/3XOUQuCMBDA8a8Se26y3dRlT32PiFjbmYN0taUk4
 ndv2kMl9XLwP7gfN5CA3mIg29VAPHY2WNfESNcroivVnJFaE5sAg5xlXNLzpa9bf9Sq1poiCGb
 4yZTCCBJPrh5L+5i5/SF2ZcPd+X7WOz5tX1DK4BvqOGUUN0axTAE3Su5cCMmtVRft6jqJg0xeB
 x8GFAsDosG0KA0vpNzkxR9DvI2ML/8Q0VCSF3mJCFL+MsZxfAK0K1HBNwEAAA==
X-Change-ID: 20260517-glymur_camcc-e230d1bdf3d3
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: HN9VAN85GrpgfnbVcs3vHLgXE_z34CX8
X-Proofpoint-ORIG-GUID: HN9VAN85GrpgfnbVcs3vHLgXE_z34CX8
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a09fbea cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PfRGEEtQfDBBo0DW6aEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE4OSBTYWx0ZWRfXzipQBWiUnibI
 +WrXfayDKCuv6CnJJNR3qYAD4MCL2xGYixHHDyVmiXX5EIFu89OmJtKS1Pld1hUfs9wFPPKnSUA
 PfsVuy52xGEPCc7CWcHvz5P0UqOp9Lxq6yq2Y5qrz6YmO5URFuJPEecs9sLZW54w73+GvFGbhAz
 5cieB45dJDpOQXldMno2y9ZhJQNphOW1tw9ER3dG/qunyie6BAuHTov9VJ8xrgniQ0WQGB9vJ6L
 i0Edpb1lEFWeg0GIoI/C87mcXZVWnPkPV02RZVdk+MVG0q/HLHdJ8Jqz8vzExxLRW59ph2VDIEy
 EmmcQzIJX2lRjtAJMbr6NYmqdK4E9epML2MI3UlJiuwWGsXEhali5mlmiOey/LY/qDU7BRRbZJ0
 vS5XROSP5ofJH7NhOtXKCwNhFizEkV5V+gnWBXYhOEqyvBbkrqOqF9sF3j8bWRVFHjzPckuselz
 FWgB8N5dPbY6Yk1s0sQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170189

Add support for camera clock controller on Glymur platform
for camera clients to be able to request for camcc clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v4:
- Fixed parent src in ftbl_cam_cc_xo_clk_src to align with it's parent map
  [Reported by sashiko-bot:
   https://lore.kernel.org/all/20260513215441.E17B8C19425@smtp.kernel.org/#t]
- Added R-By tags received in v3
- Link to v3: https://lore.kernel.org/r/20260512-glymur_camcc-v3-0-a7196fee2779@oss.qualcomm.com

Changes in v3:
- Dropped separate defconfig change[PATCH4] and included it in Kconfig
  itself [Krzysztof]
- Included glymur camcc header file in the DT patch
- Added R-By tags received on v2
- Link to v2: https://lore.kernel.org/r/20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com

Changes in v2:
- Updated DT node reg property to use hex for 0 also [Krzysztof]
- Added R-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com

---
Jagadeesh Kona (3):
      dt-bindings: clock: qcom: Add Glymur camera clock controller
      clk: qcom: camcc-glymur: Add camera clock controller driver
      arm64: dts: qcom: glymur: Add camera clock controller support

 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    3 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |   17 +
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-glymur.c                    | 2280 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-camcc.h      |  122 ++
 6 files changed, 2434 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260517-glymur_camcc-e230d1bdf3d3

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

