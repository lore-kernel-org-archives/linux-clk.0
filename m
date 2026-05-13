Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAD3481FCE
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686558; cv=none; b=sa5cHrmssHhJ4GcNbVu46adR3KaX5Qy5ajLc0T+DqxcD3N289eeHawL3PU7ET8GuIvgDm+5NsvWKnGAdVf2Krq5nlel8KdYPSWsPQhN5hvtA+NrqchOA67Gr798rRouKf5S/FO2b+i+LrSROPHRmoYRBjBqwsI5rdj4vlQYw/po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686558; c=relaxed/simple;
	bh=rISBv32VZRJHCe3I/c+s75nTu40II2+RrJDUcL5VN/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CygVrSb1jdeTOQvdQudoaV2f40gQEVrMi2FXHTUSHzTSQ60cUDrpYG75an+NAQTAQkqjvPdY7gkPeNR+6SgTdZ/+VhW6N3jqN9nJ31FJJ8M8xhTPDCI7jdTCduGMnfLLEl1Z+6Q2UWV1I8AlRk3kOCApbQqQ6eMI0kgHzZ4rA64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bfI7l5Tp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FhI/WsCU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bfI7l5Tp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FhI/WsCU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DASJCd2321285
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o2hoaXqlrNgqLFRzekm3d2iZ6wdlHEJPfnH8qVCkVtg=; b=bfI7l5TpYmN/RNGJ
	5r7qUCNcPe+5K07H3aNZj79c9cxmfEaqnCd+jKP3dskUGTrUC7RujbPwYDKcyL+B
	6dISHcattyRSGMoZdAoK/sCdA+zEtPu9p6QCoSh78hs+EqGvJOSrBelOZ3IWkFqF
	oCx7ZyPucvvRlLZlml4jk0wWGjx457XYo16/vQk86Lyn3+ymC3mugGkDPf3aPM5W
	ZSDXfYFhLgkgIWBAiBwQ0SuVWBXOT0tuLwcpw/GWzDOizG1+PiwGMAy8lXg8/XTZ
	ljJKrpM73PGn+eTUM2SNmj5xlhjKQ+ivmFIuy0nc2D6yQBlfxjGrZ3CDemdMh9B4
	45bZNA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hguaqvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:35:53 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95f4d5efbe9so4942782241.1
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 08:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686550; x=1779291350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2hoaXqlrNgqLFRzekm3d2iZ6wdlHEJPfnH8qVCkVtg=;
        b=FhI/WsCU4OZ1o0m829gpPpJEGa014Y3qoIYlW1xBN3Oh/KU4AXZj4wbwWh2wmFZUwl
         +Jmhl4NU9vdRqYczXqDbWY7yrhwSXKXvEjdEmPrkcszIskzvOC48G0VDyO2EYmVWCCYQ
         5RTfdAXDrXh7ROEtdXAJ0oId+Zcw6nkyUeRjxbb/37l05pZQbP9dCDT4IypZ/ymawhnQ
         NU8vqeMvnbQd5ulKEc99C1TawVczFpHN+7hTg6caoCF3H3pAOzGk67D+HupKk4lmb9BM
         HJpPO9lT4ApK5tISt7AJOLtq6GZwgUioktlNp2PWL2qkh6RF9GFU9V2FGkmQfrDovm+z
         DECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686550; x=1779291350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o2hoaXqlrNgqLFRzekm3d2iZ6wdlHEJPfnH8qVCkVtg=;
        b=LPGHEsS5V7mx0GRAVk1x7nd7ocyZiJsN3bLkL7OiQLfL2KH0W3+99mCkkM+CY2dwQa
         X24e5qBiqpCam1wcM4oIJVavRP+kNIIWTWR5zoa42iQJrj9lTAlRQRzzZHpfAv1064at
         IFCHmvDm/xkpkOjaIfLC7vVH/0N+vD563pyk0F8mWY3dXBYFqV3KoxOx2rTdMW/CH6wP
         PTYYo3LEJVW28uT4Y6B9rYr+jwLL0z4lKly++0cOznlMpwC6eVNu7N+yI7dxdTso63P2
         q33dhg/84Q6wml2T50hJlw6g3NZ/jVuT1DNiBeDuinbkcBQd1ZpdqQhoIQ0FP2x7pkzx
         Izsg==
X-Forwarded-Encrypted: i=1; AFNElJ+U250iQMdol+F1f90lwAEDqh2Ndxk7xkRcGICvafmKpxfGREOlRYnGDJ5KSs4DrZmmSKLQYCoNtM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV95MIgmfSB9zaIIx4yAcmyEVnxIp7TBxJgbQ7SIEfrCqUF8VM
	pOm+ouKUN3c5dEHtn8TUXmvEgtyVrLaBEVnz0fYSzDu6n4prAZUASbUMtsMKYYraml3XkXrZxqc
	vrUAg1iB1nRLQ1FtGk2uLHnKW6/ycuk6wHbG69YzZGu6CJAITfiqMXIihsBg9OI8=
X-Gm-Gg: Acq92OGURftnPPL1s9BNysKPzBCY8P9XH6JKY+VBrpON7QsACjW38ZZDUPAZdDM8w7o
	CrJl7wmZmVzmsyPb4SwidS8Ea8vo9Oqy/cGEtcWNuFtvddf0UbcEZBIBo9D1itjoNipIQcSfyTq
	hJR/tMfATJbOiI3PJVbICSh+oCKBap+5r4ABr3xSs4rOT0hBfgOfLA5cVEfi6d/Tc9dPt1yHppB
	ZZ//ZtWLBArmMP46/baYuTDJV+DrApbLIVIfb/0s1wqBrL3c+P6FwgtoGmblkYb9rm/ETr7/8E/
	bLIPNCr//CyAkM2OMa34mf8lldmNVTflissG/yw57dtjLB82+p1ObUpDfsCrmbNm2MCsoox5Emj
	9lh2t2XYEBV1LtHWVoDa0MV/VtCkq9eTz9JpozE8qgnsgg16yVQ==
X-Received: by 2002:a05:6102:5091:b0:62f:46be:8318 with SMTP id ada2fe7eead31-637733e7ec3mr2236217137.6.1778686550471;
        Wed, 13 May 2026 08:35:50 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:62f:46be:8318 with SMTP id ada2fe7eead31-637733e7ec3mr2235568137.6.1778686545109;
        Wed, 13 May 2026 08:35:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f446ec6sm43165835e9.32.2026.05.13.08.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:35:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 13 May 2026 17:35:29 +0200
Subject: [PATCH 1/2] dt-bindings: clock: qcom: add missing definition for
 the USB2 PHY reset
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-nord-clk-usb2-phy-v1-1-8eafcb2d5129@oss.qualcomm.com>
References: <20260513-nord-clk-usb2-phy-v1-0-8eafcb2d5129@oss.qualcomm.com>
In-Reply-To: <20260513-nord-clk-usb2-phy-v1-0-8eafcb2d5129@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: brgl@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=921;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rISBv32VZRJHCe3I/c+s75nTu40II2+RrJDUcL5VN/E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqBJpHyq62Fd0D422+798qtyGB3Qh1sliG24iW0
 MfNBA28jLGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagSaRwAKCRAFnS7L/zaE
 wzgjEACo+oJDN7R2y7DDlPZmNZDA7W5u9oOrcgYRMACpxRKh2fg6jcA+QVUKl9uGTBexKJBFH/Q
 zUEZoiBhetVUoiJEzW08YKrKE6nzPyjGlDsyGUiof+Js1pihMIWw6JVjNVA63be/cGY8alyzfh+
 V2lheK8sAzKOfXOZ2bTzH0XSpCDbAdPyj778eyZVLjmOUomvtfpK0JW0qNd6jGM8zuVVJFPiQow
 XhAlCVGJyBCsOtUxPmX79hCuDamzR4xgE8Smmohsc/jqUhXPyJawNqwB0az05eriNzSLZWy+A9/
 oCExbYcLYkwSPcOhleQ7jrZlFY/eYz0D+9QmLLXhiixSogn+l4cBTXeJt4NSxnsKN02Pa7Kl8hB
 VuELTCNL0sx3Gy0d4yD/lmqS+zr8a6cBp0TIaOccAVacVhJ3qt4+//J46lFNrWkoplZAYcqWM3W
 422/lBKeXkzny6WRBnMp3W1kwXdFqqaImBJgSp5rbz8KTrx0gLhQRbQYPf6PWHc18zvoUsM6fwY
 IZeaq4/DLOVw0kQMMASrJqEU5S3j/hzxf80fzCywcfPXVRa0ejjeszsob3KYr0cQZYc0+7ZFhGm
 xvD492PNWyeW8xoPKEidgPIhbklCkXXPrCvKG4LOOzfQTSIUL/ZSr9Uf+l7Xy8n7K8MqAbgxzzK
 HPtde6xutVbaxmA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a049a59 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=XZKVq7CPqAJHpqD8ud4A:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: nLFkRiZGdmUJ70iI2TS1XUzVoR4yayoe
X-Proofpoint-ORIG-GUID: nLFkRiZGdmUJ70iI2TS1XUzVoR4yayoe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2MCBTYWx0ZWRfX5iQPzAegv/2t
 dCBmhTCmzkFj4qtI6OqnydpNJ0f37IOopVz6kPaUcBWkPm12QhS0p6F5BalhbGlLLLoQjKyCR7Z
 5qDCm4a/VzFY3HxugQjlnnPusM9weKPR8Zdf3sH8OtInEEDj4yH1bZDib6jkrucqNY9YsRMCw9m
 cAES/Gs6+tDPdJgTDbKT7WuvPh4+agV6AUgwu9YYXNZoW3Kd+RMfgpZ98EWmlAPmFk+Thf6LPDx
 vpLcbS8sUsCUv8F5V9MYxUdYLsn47Kzeylj0GmYqB3AbWS8CUvyEwFuml9M79P7mxmo0Zo6SLin
 +YQnlW4eDSD6u+Jr8Q7ruk2FKH0cUqZQydpdjOwCDzuWanqEJLMYg28T4XVAVHlYW4NcDVDEs44
 Ky2hg3KYI9pBsY5T7buFFCzP8IizffXLC+l5WX87yy1bPUOPxS+lQHUz5beg4Dnq7rkNyk1GKO9
 p1Df7FT9shTOF+rCSyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130160

The USB2 PHY reset definition is missing from the negcc clock driver and
its bindings. Provide it in order to enable adding the USB nodes in DTS.

Fixes: 06498d59bb4e ("dt-bindings: clock: qcom: Add Nord Global Clock Controller")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-negcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,nord-negcc.h b/include/dt-bindings/clock/qcom,nord-negcc.h
index 95f333d8e1aa7cf1e386b6926380b2c853f7cf43..c2d048d9fc9e98d04658de665a1928297bde035a 100644
--- a/include/dt-bindings/clock/qcom,nord-negcc.h
+++ b/include/dt-bindings/clock/qcom,nord-negcc.h
@@ -120,5 +120,6 @@
 #define NE_GCC_USB3_PHY_SEC_BCR					10
 #define NE_GCC_USB3PHY_PHY_PRIM_BCR				11
 #define NE_GCC_USB3PHY_PHY_SEC_BCR				12
+#define NE_GCC_QUSB3PHY_PRIM_BCR				13
 
 #endif

-- 
2.47.3

