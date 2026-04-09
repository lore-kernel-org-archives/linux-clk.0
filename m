Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7B3328B62
	for <linux-clk@vger.kernel.org>; Thu,  9 Apr 2026 20:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767902; cv=none; b=hxxhRzW6+iojGjVPkT/ugkAS0m3nMAVYQQHmesmvv1cEmFr54oOPqXm+spELIUtiHn1iSJezkbCadxCh68VKs39+Ghkz3/u23IDmSmo6pMtkypaRtnoBUKcyL7qHos4OtZ2MqOFTHFtVXNqsvdmTbsDds9GIKafJ65PdSDT3fms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767902; c=relaxed/simple;
	bh=+7ooedey7pZss6nxC4MelZ08DllIp16P+HJNhzWNu+s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oHKcwTLu0XCyAQuIqR4C2en/QbVhVsAsBxYEMpDL1NnxF9Dg9YGN4a07nS6oorZCJr6lM4CQAd6PR75qaAp6AVds6wMPpgVsIQGQbA4jaNwVFhrUZC0TVmNITE9gG7h1rFHhwRMV7s6VNd5+RAOIy+WOl5AFRqVpUVFnZzYj0Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WkmgYNDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KbvvuVQN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkmgYNDm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KbvvuVQN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639HRaQO3352647
	for <linux-clk@vger.kernel.org>; Thu, 9 Apr 2026 20:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jKpBiFaOBJl17f8mUlp9yO
	Dx02+ItIktu9keK2GJ29A=; b=WkmgYNDmmM9nBoz5LTg0Yfgb+CjkMoAL/sfdrY
	NamT1UeLDONzVkV+h0v1otddrZftfA/nzH1TQb2vG8EDrnSuk9VY+K462aLIvM29
	QDKbR4xxtCbn1HhBuGakIy1Oo2rvDaiu/Qee9LEWn0aex0bxmTcyePlLAkJbSAy7
	Sz1Vwiah6FWv3uNG/TECP9JcI+WaKyH29y2BrVzMQ6+jaRSa/myu1bN075Sjy0T4
	iCJzgWjacaZlwji1l5Vp8tb2fS+z2aCowFqyCGXD65Qod7vOCCQz6gjHMhKjmFNq
	98hlMHMgz677HMRD5MgHth0o/jX7rncOQSkflFvEqvrZx0Yg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1qsva4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 20:51:40 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c4cfe08c9dso4089883eec.1
        for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 13:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775767899; x=1776372699; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jKpBiFaOBJl17f8mUlp9yODx02+ItIktu9keK2GJ29A=;
        b=KbvvuVQNyGyFn5d5ck/8C+tz3CPCtFRMlFBc9gfpIDscTERGkE3uVemgSSA0nvtLw6
         Y+plqBueh6nekuM2gkN4+hplg+LDyhdCvZCghw2apwo6npQvL7nJ68JSATcindgrvAKb
         UxdDYG0F+7iV029sLTpaHixLBBQeclxjb7UvR08YDJtLq2PUnY64JuMFMN86fpwiYco8
         7i5WMjEEG4UnTZ7G6ZgRpSA0sIa1BI8XoC9cuUoHElvA3Ziy1KAurTTwWO5R4Wxkoq6I
         hfTE/NE+SlYLCEr+qsEg1n/9xgDFxYbCrQRyOxBtYG25jSSbeTXXy0JbycC2yGY0+y3A
         FzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767899; x=1776372699;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKpBiFaOBJl17f8mUlp9yODx02+ItIktu9keK2GJ29A=;
        b=rSKm6uPAAdRe/x1wrfTVTtHFovatGvAV/zY6hi0PqPqqzsopcYeIKJ40H5htREC7ka
         DpQX7m7pDhmb2jmvMQna6ju1vvhmumtWP+zZa870kJL7fR41OofOqyCi1fIk6dyv93Dp
         kc+6HzhRnCTrXn1ptDayABjILWRxi1gQByUk3faBObSmRlwFSyW2WeEqxKUjmLvDE8l/
         Q3lvvoWrX+y36ugejGuf0UNX4lWN+OEcWnwRVD2latW/l0X2fjRVD3Gw3mrSoZ2QtwtQ
         ZWQZVd/qvikR/56mpmokyMDaz3qrOtHfes806PoS4U9XJ0TzJW+PLQn58w/4UmVFoRmU
         hTIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKgG7+wW+ofalciUJ+ij6+usdIvQSh47/kivrg6g1aFc5hgofCAmyW041k4J0AQJhrDQdktwPJ7FM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9M0k9Y0QedZMlRa4pZGkjK4oY7yP7ExdtUWkrU/109e/Y2XOW
	nfB9xazPhNs1VwWPIgaFIj7aIMglhrRFlF7TRKSsnM6QyJghegUpWzY2WZBtUxaLdL2TUdql/+G
	sMwIeB1O9W7aRnAF3w8YQiPCMDohNNNlqqXUqTfyyJ3AkTWTRVemZdKrwiNtSX+k=
X-Gm-Gg: AeBDieuC+mRGjIn04aSfc9W1KOw3SghotTqlvjO3MyCHmAwSknLe6WLZI0F/LdPXSdW
	T5k1gog8kOSxsZN2W6WdKPnpis5SdoIAKBO4GSfKKe6wRwrqvIa5Wvv7YdKTpW3XplCB9fCRhKT
	YUQinalXyphPPzAVIAs7N56gOd4kd8ZRSZXalZL0e+7hi2aVos8R/5J4RxXpMQnZkML7OsGOJjl
	4qCioqjvoDmuf1GITby4EOEyC3VeAglfIPZND9mAFf5Eo2QPcfYuLPU9qBT9Ylo/uwICM1e/8fq
	fZuv/vw4VM09Xu2X9NUEIAxzdIqifAzpBVHC/VzYKFVVi2z9UZ+JhK5An5LUbgCCWwM6BzWZA9Z
	LOMF+Kzu363pjLOCuQY71y3KprrAiViv/TUuyd6aSKuEuyOFk0RE5AxG3bQgTUTxee64nope9Ly
	Eu
X-Received: by 2002:a05:693c:2c0a:b0:2c9:ee15:a0e2 with SMTP id 5a478bee46e88-2d586991ab2mr414162eec.8.1775767899283;
        Thu, 09 Apr 2026 13:51:39 -0700 (PDT)
X-Received: by 2002:a05:693c:2c0a:b0:2c9:ee15:a0e2 with SMTP id 5a478bee46e88-2d586991ab2mr414126eec.8.1775767898682;
        Thu, 09 Apr 2026 13:51:38 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562eb05fcsm1327869eec.28.2026.04.09.13.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:51:38 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH v2 0/7] clk: qcom: Add initial clock controllers for the
 upcoming Hawi SoC
Date: Thu, 09 Apr 2026 13:51:34 -0700
Message-Id: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFYR2GkC/0XMTQrCMBCG4auUWZuSH83ClfeQLsYkmsG2sRmtS
 sndjUVwM/AMH+8CHDIFhn2zQA4zMaWxQm8acBHHSxDkq0FLbaVRVrj+KiI+SSj0W4feWG8R6vy
 Ww5lea+rYVUfie8rvtTyr7/cXMfIfmZWo0mitCcqb3emQmNvpgb1Lw9DWA10p5QP1gTXFpwAAA
 A==
X-Change-ID: 20260316-clk-hawi-1ad4cad36d6a
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775767897; l=2287;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=+7ooedey7pZss6nxC4MelZ08DllIp16P+HJNhzWNu+s=;
 b=CIf4C7+Esdwrf0h6QF3QjWHcWclvMT8VWvgIg3cVJWiiHsCcbt5yYDMdz5fsfGMbNVDxGKkAn
 54lZSAAY7X8DXflWrVDFm6BVJurlGQquPq8/soONoAmM2RoPbsFRkCK
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5MiBTYWx0ZWRfX1kZi0xMoITM9
 w+eXMsAJhGZBlNVR4U51dgWc6z45khZmCpGvwACMwJaug9UsX3kTVOjUfodJ06toRfHM0OLk/7f
 78u0ETbaKzqnAzIwvPwf/dLTvthWni2MhN1mp00w7gLgUNTiq9HXhtScVvCmwf2cSOWd2piLGrA
 9RyIDAc5NiIPjXFN0xN+wV5NTZevqCaoKmRzsJLGb20kpi1epKounIBHHrHDvmP2UB4c/NrgIW8
 2XbgVI7WttNIy0Ys3g01gl+K5d3707byuQug1m7RoO/dWsiR47n7NpElXKgpjF9/0SwKSlWV6mR
 ko0Wdtjy78yGLSbSus6Wp8qm29nvYfNmUqHlv29REZrNLKn1x1oi1I9hjEJXLeA5+DkG7OrjHmF
 ZiYEf8vKgQJ+0n1VrSu5gK9/cmT8dZn5KlMwWtyOzdUsZqU4ONGDl0XPp4LULgXkiAO68/ydRRD
 hFvnqw88Pb1xVV8RU4w==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d8115c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tIqp-kY1CHwBKU6mdUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 66tVfNGpaXubWFHdEjL7k1DhgY7JvxUi
X-Proofpoint-ORIG-GUID: 66tVfNGpaXubWFHdEjL7k1DhgY7JvxUi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090192

This series adds support for the initial clock controllers required
by the upcoming Qualcomm Hawi SoC. These include the Global Clock
Controller (GCC), TCSR clocks, and RPMH-managed clocks. It also adds
the PLL support required by Hawi.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Changes in v2:
- set the use_rpm flag for GDSCs to support runtime PM.
- Use clk_rcg_shared_ops instead of clk_rcg_shared_no_init_park ops
  for the UFS RCGs. This avoids a UFS GDSC enable failure due to a
  shared PLL used by the UFS RCGs being disabled while the RCGs are
  still configured to it.
- Updated commit messages wording to explicitly refer to the chip as
  the Qualcomm Hawi SoC.
- Collected Reviewed-bys
- Link to v1: https://lore.kernel.org/r/20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com

---
Vivek Aknurwar (7):
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for Hawi
      dt-bindings: clock: qcom: Add Hawi TCSR clock controller
      dt-bindings: clock: qcom: Add Hawi global clock controller
      clk: qcom: rpmh: Add support for Hawi RPMH clocks
      clk: qcom: Add Hawi TCSR clock controller driver
      clk: qcom: clk-alpha-pll: Add support for Taycan EHA_T PLL
      clk: qcom: Add support for global clock controller on Hawi

 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |   63 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 drivers/clk/qcom/Kconfig                           |   16 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    6 +
 drivers/clk/qcom/clk-rpmh.c                        |   33 +
 drivers/clk/qcom/gcc-hawi.c                        | 3657 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-hawi.c                     |  158 +
 include/dt-bindings/clock/qcom,hawi-gcc.h          |  253 ++
 include/dt-bindings/clock/qcom,hawi-tcsrcc.h       |   16 +
 include/dt-bindings/clock/qcom,rpmh.h              |    2 +
 12 files changed, 4209 insertions(+)
---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260316-clk-hawi-1ad4cad36d6a

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>

