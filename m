Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A787D40B363
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692864; cv=none; b=QCUi0loRYVOSOa0wg1q+/MhVlc9oVY54ezP4c/BJEv1/z2xddUKGu+F0gjahS4tCtXx6H5D0hjWGN+ruvAbUd0nOXGqOjWqKN6dZIWGzVQ6nZ3cTgLDJUvrsTAEr+ckX3zAJ3X4SnCYhnr84B3Wy7Hflg0QW9XZWJmJBBnBl1i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692864; c=relaxed/simple;
	bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HK3OsKH/p5SDLF+u6jT/8Gc48JdjtuEnjXu8MHRJ9/g1jfbddwbzOBnBOl8r09aJ24f4juJrWRTR/m1sxcjMA/G5AM1V12IGEW+WTM77+xHKYxLwt/YamQ5ire4uauoCTD6F0EBKBlG2pkw7ZGnOPNesuClz2lEn4BIM9av50tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AT6t0dk0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sj+APCvQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AT6t0dk0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sj+APCvQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QpX9594118
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=; b=AT6t0dk0VwlEmCfy
	auBXcp+9FRKb+DNMMZILEbh4tMM9yL91QHjbuoAYRaosD01u0lRA0PYSAJURbBr6
	09FD41Efcoh7+V7vM8DP7j8hWB0FQmmTUEydPIlk8c+YUvwoyUTaRtOSaf/3XbQT
	iVKRieSf7xWVikTnyVyDgBLhNG/ttLjc6S585jsn09P4cxchS9XlDgaMCidxn6XJ
	ZmLW83Co3mfGIzr87vKJ6Zwl7btTXca+MVWUOGvnbbGswM89D9Mqiy959rzIRlEA
	/s7a6T9MgGfI4q7q/1NOMlSDuKrfq8WpdKbYKQ1k6yU3bmMiFD0rkzzWqbt/ZvZQ
	JkDdWQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1gy4u8k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:33:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so9992705ad.1
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 00:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692831; x=1787297631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=Sj+APCvQ55Vuhly9iEexVOg9j5NiooMgBz/w6oXYGSpHiETEQB52svEMzsVYR4WU+R
         uO0nPmU/bIJyf3WcHcPzMjgZ38nQd6IFf9egAV1rW6QMEfi630a8F2s9zhaZKojupv9x
         juJlakHUvdTObIvD/ubRMVL3ZAkOH3JASj3Iw59C8tsk7X52NNhur8O3GGV2Gcjtvr/f
         lOhZDKDQjIUdWI3kHAIDtLdrXuuORatULJTmIDrtHJjcXrYx9Hu9xJ1SEcDLQ0oTpsS+
         ovJbIUfbAmiUEfzlPbx2MRBCr49oD0JBjXEPjB22tVJOprh0vPtPfrXPuKN3iGmF2/Yp
         KIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692831; x=1787297631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=AnMBPH02DuYGY2MheOyFB+xiwdNXTBzutsWZfqpdQaOB2fm3M+0jmHMXBAmfQYl+cP
         qoTh1W5h/4ON3mETNm2fOPAD5qlFlNUGF2AMmWeOjSr+hOxw7zu5rS/6C5Z4EsjfOPT1
         Wy6XG5AE7hEmR+p6KGIJN/hJpXIWzB/NCIsFryQlxzH0FJJRQ+0uVoHju9HyfeNlwXOf
         uJUclQe258UGTLIh0qKCTqFADGXetoI9T/ATPvMbDgirU5U8W7hs0K4mDx+VRDoVTMKj
         eIKo4PujRw4EWsCx8MrcoL2X1np3fn8vgUt1uLXahH0NEX57JL3UtAmuJLIE7aDUPDli
         234A==
X-Forwarded-Encrypted: i=1; AHgh+RpkDgy2RhvSpsZQHkB34jNCE1cn8K84A5XkVXtsX67Ox81N8VVeogk9yFNMca/m3uMDu+QJfeUxmx4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1iz7r82vtKEumO1w67F02arEuVj4PxO27KNpabgnXuyfM7Qmt
	MJAPQPuOwau13aV9m+ydFeKxJrErDtemTcQtRwcswdoV7NA/tHuCu28DloS6r6oGDLWDosw+uLf
	zW4swe7WMS1VbUum1d7sE/LJA9MON4ySleLccnzOE/yh1BxUUoTyKZjR2yt2dmxs=
X-Gm-Gg: AR+sD10FSUhpawmGjj1X8Du9W+V7Ppi1Br5cfkjaTHvaT6rdOIleKL0l9GeXcyXu9GM
	vcw+6ZZ9Of0oSA0y0/cXKzpFGXkFBoAFXo0r+wGqyMcd91Pl62mgJCHBCKch6xqkdB91xLXG+oe
	eBnfb2Pc45z1iYJbiMkOOlK9K3RmvB9iUxicajUaIOMjUr5G967TFjU/1ThmR2h0cAEkI8+fZG4
	LfLSL5WCMfPIsPwq4aQSQxDvvVYcLu5SkJa+qwutr5LslplmkG/Th2UZFSmgDwdV7HBa9rLdzhq
	U/qYTC/gmCTw6H8l6Oi7PZFa/ug8yx1Kmjq08iTwJH3FxW6SAGpwAdD+gcgppWW+wbmd7vn8EC9
	n1Dw2c2SLvj17W05gcGi3DGCNJAx7ukO0dV/viM+zvATfUbbigIgg8e730fVPS+Xr/x3CR952XF
	s3/5y+bGoIOya13tXfxoIbTBo=
X-Received: by 2002:a17:902:ec83:b0:2d3:7122:833 with SMTP id d9443c01a7336-2d37f7c3e97mr128280285ad.15.1786692830911;
        Fri, 14 Aug 2026 00:33:50 -0700 (PDT)
X-Received: by 2002:a17:902:ec83:b0:2d3:7122:833 with SMTP id d9443c01a7336-2d37f7c3e97mr128279735ad.15.1786692830500;
        Fri, 14 Aug 2026 00:33:50 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:33:50 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:44 +0530
Subject: [PATCH v2 13/15] dt-bindings: firmware: qcom,scm: Document SCM on
 Kuno SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-13-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692714; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
 b=LjytsBkPoYsdC9vRseuwegbAfCjR98WF6lyMXA6E4gV+//wSFMjNp4wjfU3xOcIuFr6RfUusP
 hR+zxeIFBwZCJ+4W+anZV058xUGhsJzxj02HcyfbAGnEYjizcYHTv/p
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: F3Qq8JI8bAZcsR8bXUfK7Kw_rRx1MbpF
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a7ec4e0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=M4Tw70yJP9P6qS8g1QAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX9s84KAeEs84i
 ajJ6ERLO1L/S2yuijHbLDru9/o3bS30LgXrmgaQdYI+Ynecxj1cnepeCAbl1uRWCQUZZLMT0bAP
 llfY9fre4tGkGIN/UTwNwxeDVQtaqyQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXweXz0wOcgtLS
 IXidca6aiDo63urIDdV2c9u6HW9IGI6EXCO47OabKvoZfoqHMBm+wMA1UahVOa+5du//45njtT7
 S8+a6He7B4jANPZUv/uFw4nkxsy/vww+WGQER0NT6WpFkGs3+1bop/uY9/+I1JblcASkuoVUkWo
 g7E2bkKcKrb3hh4V5ahgX8eBciimrA4JBI7BHkEqR9SNulBf5ZtWrz5vYdMz47P4FLi8gOrVSYG
 ZKEdF+9qhdTSbOV4ahWIS7lV7E3DIUv1EQXUdnQrTs6RfHBvWu4rNJGgyt9RqGsBlyAu0Xuj2PK
 LHHNpZgPf1c2mMysJcteni5TRM4UnmpX9ISIbdIWHDlkgfJGmaYzD32db/llyQw+Pkwtij26d30
 aTHxPXUukmOuGQFAdPoa4CtBG0KQ1ISmGyzeNgbN9E9OOuK9zjrYM/8yM88vskrvSsJW7Xr4n+C
 B5a9ADk4gm89971xcqg==
X-Proofpoint-GUID: F3Qq8JI8bAZcsR8bXUfK7Kw_rRx1MbpF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058

Document the SCM firmware interface found on the Qualcomm Kuno SoC.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f718..ecee5aef65a7 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,scm-ipq9574
           - qcom,scm-ipq9650
           - qcom,scm-kaanapali
+          - qcom,scm-kuno
           - qcom,scm-maili
           - qcom,scm-mdm9607
           - qcom,scm-milos

-- 
2.43.0

