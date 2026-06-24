Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB623CCFDB
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 14:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782312692; cv=none; b=nNi9QFqtYu7crcEClfmY42hqSD4hKf0jNnQISwfKGWRNs3k2Tu69fKc3pZYinp7f9s9EEl6EiRVGpHiDOn78jKbiK0HfSRhcpt4dmzAdrbLadI6o/l086DJQlEhpQTQX2HAuIln7u6S95unSlIxeIA/A4PX+YaDZll6Axm4SH6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782312692; c=relaxed/simple;
	bh=uPaHJPX4fBQA/65TQFLuVYTjl+5WzccZWh+8+FnorRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XxhAKX7tzT5TG8R7E71jf3SVGcwTcmq/l5d7Ero5axHCPoPI28YnodX4kGPgWzybtky8K/6ReVPtYIh76W2wisei8nwJSQg1w4h6huieyS10pecsCvx3vNacZo2UMFSAil6FhKkXgEhLQvCCzPDVtX5Og8004kVeRvzUC6Acepk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B/xXu/Lg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CxPb9lEx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B/xXu/Lg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CxPb9lEx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OEfMKb1725198
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 14:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u8XivURppudXZz+Z+GoxZig9m3FBNIfHMcPRM9Xb4h0=; b=B/xXu/LgiVbB7mgR
	d5vYXO5JYtoToD4jXeNqzL68W0cQUznt1nL2Y0xOFpgBlIi5OT+3lXKtNxs/qn6U
	4OOrbI7WWzKZ76CMeCr0/hZ+BJz1Wi9QCg6b26pAkgFyRpNHXaNApMeAezw5Jh85
	e5j9e5BEbrnSM7J73ds5+6/6JHcZND3CIBC3NZhDiDZtnUT8lYT4pRRdGAf7B0KF
	t0XBTs8zeL0hTW1fPJANYmrX7H/OgM2lCI6FNwbRVwu0yCsxXmyKOJxVo1q/VDwz
	Rm+6yVLGXHGFjIb7jR+BPOhUy/V/xS1XuZ0dB7zj4blHOz/iE0OisptzQ0pRm1Tk
	uuLjag==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f06r32k80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 14:51:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8422f987f2eso1816825b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 07:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782312688; x=1782917488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8XivURppudXZz+Z+GoxZig9m3FBNIfHMcPRM9Xb4h0=;
        b=CxPb9lExJX1dIo69aRbYkyGI2YiplYW1aJn1gnyW+C16z87VRmCS0Z1f660xTqNW6g
         oEZnEBy6SrCxkXt9ymhLJZGZrZfUFt1lYj6bOM5HoFY07v8ow/x/qjq05JLUqET5I6Qt
         jKdT6YGUngUknUIR++9Rh7RrLcH+ud1eedhvmQeykq+dLJrwPe2OwEN/gJ8m7sg/eMdW
         uVhbr0SXNYb5QHhuYsH2uZD1aV6AnALEqRFAAuqYwAeoYROBX26PvrChMRJ/wGWtEZf9
         pomrLpKdug6+4uNHb/IIn4pn3mFiNHYYej8gnAr6dPBRtxqWb4P07qbb8bhxhJ1RPaD9
         vYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782312688; x=1782917488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u8XivURppudXZz+Z+GoxZig9m3FBNIfHMcPRM9Xb4h0=;
        b=hNCHfug/ZSQhr5zJEKKnIrFr1e0zvh9HQ9UQM34pmLYfuYyI9ldrpCXq//4R3AlIqW
         Y0DH6vn7P5CrDRcFiDQ92oRdnmgIhNAZPOkB0yNw0QcM3BApt9EioBHQ+Qq6ejaN6YrV
         yVepBAjOyIFYo4qkoZHaVj4uD3jYlhGmMA1XpD1qfIt3g8YkT/r9jjtis9Bqi29dTsc7
         zIsVCz6B4zlYUUOQJfWxBQMUExJSUkaPO0r6P2+ey9a6yV3lFvfa2cjQGjOp/flxjG+L
         H3VfaidQGWQzD6C9KIEnaO/YGLbZKCrhNR0kVFysxFz6DMDxA6JWMu4o2jqwRwNgcIdh
         zaQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8R1JzeKJ8dvli8DAMtIxS8CIbujgQC5ohGd5YITtjzDDRaqNVHTC3a0zUunHcQqptq696RY25u69E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx18cpZxAaSe3ddJyR/TbZaAqB4H61Z+Rwxblsdl30S0aDXsODO
	Ex1Eh9oCaANCfL99ilxZ7lrvTCWva4YUwAWA/BCFiQQnkwmFXhuHh6q7MidT/3DMa0AbQv4fPoe
	V0yDMKNqw5QGU3HJQWrOCNENTITengcesVoR1wXnUB7PeW/QHXwCpTvw64zz1DVA=
X-Gm-Gg: AfdE7clnhxk2gGpRrX/q/Y6r5iC0+X+fakYSwlcoQlDZfhRPgl8MT5U3YuAZhHVWeHH
	a997r5zgrqpi93m/o80PVmhQT45hAwdooYmQEVPaD0bn1JPTBUPemO/ZR8JW7iP97sPMc6t2WZq
	wytRGgiqJNHeJje91IyWqnMeFOaz4uPlhmiSff2KuXavLClMg6hsyDFWbe99/9nFJbtIdgHQ+GR
	YHrJErK2bGxixPmaAGuSd1gW7LEv4FQ1wYvuIgYYdEwGBKNcNzihU1iwlZHnouTV90twDPQCXhc
	6Ew0FnQElxEOcfuPFmLDrnXD6U3z6E55blW3lVbq8839ZLLTl7f8NxwVtkOIZdrbtA08YBIZQaO
	jXNrlSm9Wu1Sl3qZp6lbsfyIy3BdBSkIOeClO9qsRPQ==
X-Received: by 2002:a05:6a00:b46:b0:835:388c:9764 with SMTP id d2e1a72fcca58-845952d9857mr9047631b3a.37.1782312688170;
        Wed, 24 Jun 2026 07:51:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:b46:b0:835:388c:9764 with SMTP id d2e1a72fcca58-845952d9857mr9047578b3a.37.1782312687461;
        Wed, 24 Jun 2026 07:51:27 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc839sm2643271b3a.10.2026.06.24.07.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:51:27 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 20:20:31 +0530
Subject: [PATCH v5 3/3] arm64: dts: qcom: glymur: Add camera clock
 controller support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-glymur_camcc-v5-3-a321df74b1a1@oss.qualcomm.com>
References: <20260624-glymur_camcc-v5-0-a321df74b1a1@oss.qualcomm.com>
In-Reply-To: <20260624-glymur_camcc-v5-0-a321df74b1a1@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyNCBTYWx0ZWRfX3i4GyXFalT0b
 XGy07lZHY+Vd7UKjU0YVrfwoAN0zmDzcCF3BjE701kvdpUgZSE5+Adda19jR8iCsF7kQ5qMXUqn
 JHdseOxqGklzaBMIOdwA/SpOHl8ov7e/5//Mzm3IYM0Rku4hVmC/PTLko2UehyJcvCPepbIVVXt
 qefoxRXPCVIWhw6HwdX3nxMIBm4qe8BBa83SBE+m8a2vm7Z5k0jF58RoZpMzAVdRrKgh/CuMOOi
 cF+olu/ar1GBH6VZ6X906GcPHOcIR5hlhY1kpiclkmPAS5Oy44plhE/A5ogQ9yyiuR6xP0q8V0/
 aXKROeOCDqfi9zvK4jNBhpvdBdZOfm7w3E05gccf4bEUU3a04uFzjaNjwkiZCAMLwna6I0zzNRQ
 ucY9wNUitX9H3doHz1TEYklsdfl+og==
X-Proofpoint-ORIG-GUID: fON3IVNbyU3bbRYY2iA8wpZeBAZzx0-Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyNCBTYWx0ZWRfX0A6f/lcnSUu7
 CPJiiJ56EWDztSaohfMjglsg8jW/cFmYNBgulgi7/VZYpq4cj6l0I1WFMSe1uNyQ+pA8ItlnPdk
 ez4whKd1YpiyYpenyu8UStJzOpMPnMc=
X-Authority-Analysis: v=2.4 cv=ZM7nX37b c=1 sm=1 tr=0 ts=6a3beef0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fON3IVNbyU3bbRYY2iA8wpZeBAZzx0-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240124

Add support for camera clock controller for camera clients to
be able to request for camera clocks on Glymur SoC's.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e9549d126aa50a0dc7a90943a3249..eb5cdb588e9aeea4275a0ba8e94d77dd608ec6e6 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,glymur-camcc.h>
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
 #include <dt-bindings/clock/qcom,glymur-gcc.h>
 #include <dt-bindings/clock/qcom,glymur-gpucc.h>
@@ -4362,6 +4363,22 @@ usb_mp: usb@a400000 {
 			status = "disabled";
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,glymur-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,glymur-mdss";
 			reg = <0x0 0x0ae00000 0x0 0x1000>;

-- 
2.34.1

