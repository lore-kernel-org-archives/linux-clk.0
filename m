Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DF440BCB4
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 19:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785525187; cv=none; b=Zrkq+Qr6+BPUOsLQ4QCm7/sTi8dSJ6z7o1HIveYZr7DrAtYEhOJb768xWMVRzwzVXCCR0vkhY0s55L4UtS+6T9solZP2X5Cp3kMvrtiXRpjKFz/BiNcNawyMjNy/moK16skD9Ssg+kpuomGDJN/yz4hL2rVnSqjxmCk9Rk6rMkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785525187; c=relaxed/simple;
	bh=0MZXCk9Or2W6XUtdnV3HuSSPaPcBeFaxX8xav+hbf2s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U9JVY+bY3V0h6smhe+J793aQYTNTtq28FsNx/ndW4vA3ezei5ndvwIMu1ODIcutNdngSZmVDE6NAre9uKmNUFA9j/sd5q88g5E5TMO7uhAyuZ7cae+okZhNhkISkVmeiQmU2g1WZxn8PiIRHup3N1zUhp91oAHQnIZuIkjWM2Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkM2Ki/G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eJhxuLkv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkM2Ki/G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eJhxuLkv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VId9tQ660243
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 19:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZyTKYo4/TkZHCntwq2DFPP
	2ilSH/oFPewoUWzE90tIs=; b=RkM2Ki/G4BrXvSjW/cuYC5uKRUzYS4RuABgMeZ
	Vv6NeJ88a1T2talxHackq1LhMjofDFQHDccqC4Ru4EYa7vk24QeDa4J36iQV0vvH
	InkRs3IYCSdIYsnG71xFlctaZq1qNPBIi03KB+uHMLy9p4D11GzPEnwu9jcOUcY9
	fhFGAweXDH7dg+jGvIk3g/B/Q4MOxtULTcYakR7uhUvOV78l2BirL4zl061KZS0b
	CXzS4HPcW65IvJv38Tgf9/r33K0m4wGnJER3Usrh/gv+vLA7KmZDHCd4lxi1na7m
	/YT6kF+ZtuB8P0IiF013vmOEK3zktLPMMd/JnDK+lmuXlFrw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frujusy37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 19:13:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca8aee88725so1953335a12.3
        for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 12:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785525184; x=1786129984; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZyTKYo4/TkZHCntwq2DFPP2ilSH/oFPewoUWzE90tIs=;
        b=eJhxuLkvu8bwfKcHiH1n4FhceYFZaBb/zSjUOT8vTjRkpPGCWSJWj0XXxRHXAk5uLj
         WLKogzAIQ4rk01VcJGYFvGaR8J0rnz7Moq4tfSV6+wtpSzV9jnlFn7x63khc9GIsxs/4
         zOJprViND6EoqPtzDcVw0003ZZ2Fim+nfGg4RbJKb7/p5pXP+l/8AqAtkMJxIlxtXWcs
         2VK/dxM7iueYE3G+4B9C4bwMLQaLOAQtNpmSbOp8i4eZtZamdm8Whn+6ZYJROuR1Ued9
         bbhpltakX2QtboalMGD1826/tYXfo2zWLcQI4W9s2RFAHkZKAVNP/730pB4ROHOTz6pE
         1kRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785525184; x=1786129984;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZyTKYo4/TkZHCntwq2DFPP2ilSH/oFPewoUWzE90tIs=;
        b=FYZOlJCKhsstZx3LlPu7ayAyZ63fmo6b/MKg0AWcvtTn6HRSUUm8sJykbKkILmvfIS
         0ZVxFwLVCVnIm8FeIJ6S5C8MlzThXLoQDklFnmuizOgxiXcpw4kXYUA/N+bHXPByz+N3
         U5xpDCOB5M+F9x+dmUCRAcWLmS5ySdfktO7TskWjObfghCWEISaiqj1WZqYbFiXNdArS
         BumR7iu5kqClbD87AbIGMvHITw7V16Pc90kM6CjXotkzql9tyKnn5Wu781KJeytI6axT
         gY9z27F1TiHK97J7zWHiBIrjqeoOYBa/s/JJq8ZXKMqqoEdcdnqYSaI7DvCono2KVM4E
         0LTg==
X-Forwarded-Encrypted: i=1; AHgh+RrYYtzDGHoh8L1rIfLkC8cWdEPVefdC0dw6M6iozcaBeQLHneQylDPedShZ8N5jSL1M2Gll08hiUBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkzsdHsqtb7tkP5PVrXUG6+J3I06O4nPRLQKYgcm2LkPOIGWX9
	5BSTLvZZLOv+2LG2j/VREPhwH6VLlyaT4nygbfxMwfBHHoo2V0YuXYoenKhtLEat3AM92haWBKx
	M5OvC8j7koYbilrTACZsyaD3beCQnLKDJmxC57bCbrOuawHES74J0Prnq7cIFTJs=
X-Gm-Gg: AR+sD11E/JHBMNfc8FuZ0VPdfpeSqz23groBNzdqVTuKxG6S/KyxLbiqBc2sj4KgFbm
	LZFnH0IZSnaj0XM1EH8x3Sm8Ye3+CT6UMFMlxcW/qlfVhR8oPJnCX5+vC1L5W8u+LAWLTQPLmdw
	rPlaVEttQpRMfbW822poV8y5dU5+dm/zy5raK0+qmdFo/MvRu+TOFVe7fCfHtDshBiSKj9g5r/F
	UpEL9PHTzXha5fuuT7UfmcLSS9M8B7j+izLMRsWBWtzeLxkKPNEHP8b2XHvze3JCHCGGmEx7Jci
	4AHM4gR+w2Y+FPVEqph4zulrLZxN1fi+dpS7H+7r123J3X9eFM2LXF8jTY5VpbCI8hThF0o2lJR
	SkYNSDlqZnhsM3TSrsCqhX84fWJXMcbg=
X-Received: by 2002:a05:6a20:244d:b0:3b3:26aa:5455 with SMTP id adf61e73a8af0-3c92a5a7a45mr970719637.13.1785525184152;
        Fri, 31 Jul 2026 12:13:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:244d:b0:3b3:26aa:5455 with SMTP id adf61e73a8af0-3c92a5a7a45mr970696637.13.1785525183717;
        Fri, 31 Jul 2026 12:13:03 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4d10bbsm4945869c88.11.2026.07.31.12.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 12:13:03 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add Graphics clock controllers support for
 Qualcomm Maili SoC
Date: Sat, 01 Aug 2026 00:42:44 +0530
Message-Id: <20260801-maili_gpucc-v1-0-9d8c37bded69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK3zbGoC/0XMywqDMBCF4VeRrBtIjBmjr1Kk5DLqQLU2XloQ3
 71pXXT5HzjfzmaMhDOrs51F3Gimx5hCXjLmezt2yCmkZrnIQZRK8sHSnW7dtHrPnSq0E0JUwQJ
 LjyliS++fdm3OjvhcE7qc49+ss1MUmp9Wb1/EjVcapTIAra+3/Gs6OyP3j2Ggpc4KqUGALR1Wq
 jJKB1c5EcCVUhpT6vQrQBUQWHMcH7O3DeDbAAAA
X-Change-ID: 20260731-maili_gpucc-b345b0009da6
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=U6Giy+ru c=1 sm=1 tr=0 ts=6a6cf3c1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=woJ0iYCGE5GGs-2wN-4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 1IL3EP3QmJkFHd1IQFuSZ5ohqeDBVAL0
X-Proofpoint-GUID: 1IL3EP3QmJkFHd1IQFuSZ5ohqeDBVAL0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE0NiBTYWx0ZWRfX7p6CNQ8uvFvQ
 xk4ku+c2DzIBItjdd48m+wQACbndGQ3IfGj7+6SJb7O47IaRW6sK67MZaxV33zwq4EhFw+7z6CS
 96P9cmld0SuJIEPDvmvZ+pOCiCNL3Rq2QRgPCHG1f+74BSDHuPC0ZkP4yr6R0/evvHqkCUfOvyk
 X0rfsjpcKAYEKwQ4775tUfDHuQOEAl3zGvpeF/Wgai0v7Iom8I1ZnreMoXEZCYyBT0pWaoBR+/+
 cTE9b9hBaRtO22dWambf02WjUZhoXVsbko62ZV0R9IjZaWDiAV3Mz8pQ2DxVSGerw/xyaG0JDU9
 VYeM06WJpJVKYhomqt1c+b2foEvobfqmIe9wmjuAGyQgNflnc6GTGVKyrwLM+NQTzGufeWs8PCw
 XuyqczZcofBLfenH2TrepmJiUuoGg045Zi6gH2+rIi+1HGNpirBcHre6sWuX+BGoXyuhwh+/myo
 cBKpU8pTLQbIKyla2rQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE0NiBTYWx0ZWRfXzYQ5puanCQQ6
 /+x2+OopCOK2o0/umE0qDpTPZB2vQ+K+QDWotNiT+D8OsLGdK9KfZWtuKMwXy1qPf8ppRZU2Qxa
 5I1IJOP4DHiPWG0SSeMeASbNEg+yt9o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310146

This series adds support for the Graphics clock controllers on the
upcoming Qualcomm Maili SoC.

This series is dependent on Hawi GPUCC series:
https://lore.kernel.org/all/20260730-gpucc-hawi-v2-0-7bf618ab8a34@oss.qualcomm.com/

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Add Maili Graphics Clock Controllers
      clk: qcom: Add Graphics clock controller support on Qualcomm Maili SoC

 .../devicetree/bindings/clock/qcom,hawi-gpucc.yaml       |  4 +++-
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml          |  1 +
 drivers/clk/qcom/gpucc-hawi.c                            | 16 ++++++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)
---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260731-maili_gpucc-b345b0009da6
prerequisite-change-id: 20260705-gpucc-hawi-8c35e13866fc:v2
prerequisite-patch-id: c4ba97aad79f4fa03b5293eaba330faa54d29a6d
prerequisite-patch-id: 1a86f63e48eadde749f0a32fd284c8a307eac4a5

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

