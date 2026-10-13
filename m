Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57733F4108
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 07:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875405; cv=none; b=XLhs1VRaQLxTg2aTnUn3bJ2avTm/79iMSUwGf0/EWpAP+wKv74r5QBBO4ktsVII26rQNWSdx+ELqrCQqnu8yw6+MD/9AuMI11H9iteArpwaib6VpHiheEPLn8VPeaTm1zOv4ajHDjaQny+KfJulzvn+4fVT1/Sup/742/BCgM8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875405; c=relaxed/simple;
	bh=YXk1F50qxeCCVcBtXcFIz7gVKLmlgDjcOyk/TvM7adQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GB8DYNkD5+V0zamZoBSMbJb/iu1c7vZubRbROfqNnwNhy/xqdA8d3lNuYoU0NPiWiZ1XQUEau3nPjDGMCOWl3RDot7aEyAnHL1fLxO9RLDqjCgk2ztGP31G6V6paA78Zftz4iWWQG3GJrjHk4o+CUB/UnyuYGFEFiBT7hexYzS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+yFJz80; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HxQehHeo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+yFJz80";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HxQehHeo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20rF9302935
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 07:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	er7IVFqOrQhE4gOGxRyz0iJFSCkVtseB/xDovrLGub4=; b=F+yFJz80pyWXdWD3
	jDhFvRiVOUyGZHNlHl1xQNyiIwiFbSyo6acUvRl7BqEm7yVSjOC58/UHa6F2kQBK
	kQRNg+02EkoVvU3pCW70Twc0KSxETEYvG6YieHOKEKGqzFAHRB/GS0RTjflVv7OT
	Tl5FyUK7FjHIT3rabBxGZEFuD8j0zw7wUBueWSkTQgwhJR8QF2AyddAskRbNfbnf
	ypnQmbyzr4YDnF6carzBYKxXmGMKjt5em2iWRCmU6BeJVObty5rCkBBYl/Xki6xy
	abAfTBv2z4Bnig7OVsKF545zaZYvWM1BlBZ5LDG04TAsh4CNk1ejLzy6s28LE+eM
	mritSA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sq9hj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 07:10:02 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso6413987eec.1
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 00:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791875402; x=1792480202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=er7IVFqOrQhE4gOGxRyz0iJFSCkVtseB/xDovrLGub4=;
        b=HxQehHeoSWvUDtTilbFZvfTLvniDkUYASwU3JZCh8OnEtz3hBjVF5SdYG0aBtHqLy2
         okw+7GmVj9npXzTbSc0A9W+XqrBVJXU+HYIgIZXwW6WJ2kGgScGDu1mroFsAr3ipEVkH
         Q29aizHxZqkS88C8ynor5eVupKUPNcCojBbTPFrcm7OhcWfnB/6XfdSPhNKfMzYx6yUZ
         y7uNCMjjhBKpYbOrherAih3CcTdIZf6dfnX7VOkI+FfPS5C5J+dzXq4aWAWxOdq2aeTB
         kcru0/8PvDA/0CkzL+09AMjvG8X+Y8KQy/pv4Z2TY+XPOv3MbmG4WW+jQicqn8862tpE
         DSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875402; x=1792480202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=er7IVFqOrQhE4gOGxRyz0iJFSCkVtseB/xDovrLGub4=;
        b=QIl4ir7t+fkiSIEGBqtcexgLH+3I9TFKgHj+sgCPxYOgAsM0gUH4yw+omGsGKUYS47
         YFLusutCk4anMd88b2BivMAwMmWui7yCIEfq3CvUYp8ZIdZA0F8e5/+7cGJDwTjG+xBv
         na45W55PfIzRYMiEmcT5L4P9f5yComxRdTA+AjkKhTDaa1Pt1QoRvljAsY3AIWmGcDwx
         PuZvXOji++Ia2aHAmqYpFfmi/2g8rVSxXbLioaCzLf0IHd/khITCVy/VGRIl1wgvrmm3
         cbeZdIaHbC9JrbCyuXBOpvsh1Lw779SQz/L9oKdbiAxqeXz/+PPCCQngeSOS4nPxdI6w
         YauQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/Cl78KoFykSw01hG4rVhQkcW5P2REvErxG4nvb40QG3XernrxIOys8BrAInwNu9UhFCGgth5s0os=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBR7rhUBIWOGrw4fhfJ1AA6fNHPmtpa8603DfS3bG3XiYCA71c
	/81ncjdEp7cHLpoH9rzXPvWnjiw5rmax9Uxsc3ffeaxrBUnkyjjReESrlrtg/bveYKP2ajPCgWA
	4YLnTvuWXGtUTUTQ8QyJKBufKmIqkAbkhqQxH4fQpKInMA0yrzTmvincKQiZAV3g=
X-Gm-Gg: AYBFou2/rFTxDCRbj+33Uol0rJ2V82bHe2QfW/W3GuK1+J06c0/eAUaZ5gyHMiTDJCv
	n4IuG5h2HtgG99xMy319tgwih2NxXgfG1ACPf+Qv2CIQaYuyd006P/LgTBVRtNRzhQYTn+I1JVM
	8NgNklQbnSvRfRqYyFL8Ktv6Nc9rrbtbQ/njghbRgIusrqWollmIY3NvOD7TksFg6+OdkVB7kZU
	Vs8psNfvJBjmHNwBuwCNCOiBEZW2X5+6jrfJOHek5Oa/GkQhvO4ekqGnnnyw+Y6UJypmcvSTlfv
	hn/SVKtYH+2Qk/ilWmPIIlGdCnaGv3xSNiki7UNwqlVNZnKUHYcqGHF1a/zwK8Cy55njbGLWKDW
	gIEoSm1hnAc9F2kXLf0M340VHE6A7KEt2JYL6TnENncCyZxXJb/xIQBnNlMbvVhvmCn6AFO/9m6
	UPPJmLuJHWQF6jx0srkuDdjv5RIFQwOw==
X-Received: by 2002:a05:7300:e5c4:b0:353:5d9a:9971 with SMTP id 5a478bee46e88-3537e088be4mr16581450eec.18.1791875401581;
        Tue, 13 Oct 2026 00:10:01 -0700 (PDT)
X-Received: by 2002:a05:7300:e5c4:b0:353:5d9a:9971 with SMTP id 5a478bee46e88-3537e088be4mr16581415eec.18.1791875400974;
        Tue, 13 Oct 2026 00:10:00 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm46081248eec.17.2026.10.13.00.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:10:00 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:39:43 +0530
Subject: [PATCH v2 1/3] dt-bindings: interconnect: Add Qualcomm ipq5210
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-icc-v2-1-196b219e25c1@oss.qualcomm.com>
References: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
In-Reply-To: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfX/IxePZuiq3po
 WR2NdfjDftaQ7i+8NLnjzv8JzfQgx+9AcCn/dmZJjk354hXhrqPqjC/hObdlg4kdT0LkTIXd2AP
 +5Tx3KTnm+wEbJj7vVndEJQD8WNtXBBKgdpJspZTxvE0ZGgSxJBSGVieVgI9sDhBTQgGr47DlOr
 OGS+nMitGGXHz5sQLcH7KFdFazbUU1Tm4YmWkissOkxhl7lGuAclk167lAEn1Adj35e5VND9XvK
 kDRE+D9bBdWcK8Zdo69TO5m5cITT2qzbsKOkM5CzWl8icCKQqHJ8fOnp/u2257oVc/3UFFdsj3k
 b7cResyfc88QU4abvMAw+15+AaPet9YxbYEdQACm6ny/WPC834Pxp4ZbAhatn5i21UXGZenaYif
 F/lfuEif5o8qbJcy0clIqNLV+Pj6pCP6lWfg7Pc9Gxj1SQfwjWV0r5ApbSrSg/x/Yy19Qe4Vp7s
 IUNPZSPp68wMS7uQoSg==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6acdd94a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LXs94aH5GLyjx-_FEpEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfX13woLDvIv+FY
 PVxM8DVP7P83P7OuCfAihBZ/5XbJpUS6/r0htG0zHJbPxHQ1+PYXiiuVSdBVXhmn+GfCFGmf+0t
 tnb7/wU5IQ6HhoZ0cq89gIIVl78z6Wk=
X-Proofpoint-ORIG-GUID: pHRATMI1AUknXtrCipWDfYRpdIJT4eZ5
X-Proofpoint-GUID: pHRATMI1AUknXtrCipWDfYRpdIJT4eZ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130028

Add master/slave ids for Qualcomm ipq5210 Network-On-Chip
interfaces. This will be used by the gcc-ipq5210 driver
for providing interconnect services using the icc-clk framework.

Acked-by: Georgi Djakov <djakov@kernel.org>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 include/dt-bindings/interconnect/qcom,ipq5210.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/dt-bindings/interconnect/qcom,ipq5210.h b/include/dt-bindings/interconnect/qcom,ipq5210.h
new file mode 100644
index 000000000000..90c0395e4596
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,ipq5210.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef INTERCONNECT_QCOM_IPQ5210_H
+#define INTERCONNECT_QCOM_IPQ5210_H
+
+#define MASTER_CNOC_PCIE0	0
+#define SLAVE_CNOC_PCIE0	1
+#define MASTER_CNOC_PCIE1	2
+#define SLAVE_CNOC_PCIE1	3
+#define MASTER_SNOC_PCIE0	4
+#define SLAVE_SNOC_PCIE0	5
+#define MASTER_SNOC_PCIE1	6
+#define SLAVE_SNOC_PCIE1	7
+#define MASTER_USB		8
+#define SLAVE_USB		9
+
+#endif /* INTERCONNECT_QCOM_IPQ5210_H */

-- 
2.34.1

