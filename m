Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378123793D3
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 17:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767727; cv=none; b=p6kaYLg1LucWlyQRzbO3qt5cxT7q0dMo832q9jLsq8Gtt0v19hv4KZvRZvIC0v/7I7gbOJ7wUuqmlpIZl52MJpgOsCfiFXXRfYRDa6gcNK9TU0VF7vx2QLxKY8DNEFyjm1D3N/8OtA/YGCDG9Md9PCwolPD97lU9Au0yJr6LJ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767727; c=relaxed/simple;
	bh=JOZbAhPAb/jrYJluqtSnYP/eR0BQRIp7uBKX1lR1RxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kwr4mZ9BkNpa8dzD8JSMTNPJez7w17vnzsNfuAofz0zdrjUW/NVJmS/UXmr7xPbjQz1ASnWeEiGzRTRIRaDnhBX9FuHWvM5EjEn5Q3AWtSRlxUoVgaFL8iUFuJDJTEvud9YNTgBVZ935wHXLh1u5l510+Mn8IF1MUXb6RkbjmUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSMFtdtB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bqR5DK13; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSMFtdtB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bqR5DK13"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HGfKnL1413409
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 17:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lMqXRaEncaX84LcnOWNdxgfFY3qFRQryE+wAd+VB5k=; b=TSMFtdtBFWgzeSKS
	1cKS8GEVIQyDG1o5fFU5aWplzQq/1dbs9Q1jHGILgAcVLV9qrGnzXB8zX/aBrXQF
	sP4Gycyznoy/tGiF4Y1PbE/FuOm7dhd7RMuL2kIaj/AvQMFbnU5J4skS+rJ4oNYj
	z38u6Es5pGOp+X6gdjCFejGhP53adF8pIZygfu9g2S5E6TQVwb9Bb77ThqJC0KnW
	azDUDJtoD57gGKryigqdw8TiTv5Wb/F/WFQbXd/ZIHnPs/5j4M53tQXcXN4+pBki
	JONdSTw/7Ae6S7WM6JT5mdjgH1tUs3UsTL/J7oZBvk9l356bEj8Y+Ykx8muNvRWy
	3oVHqA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyapug4j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 17:15:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354490889b6so27988218a91.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 10:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773767724; x=1774372524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lMqXRaEncaX84LcnOWNdxgfFY3qFRQryE+wAd+VB5k=;
        b=bqR5DK13chHo2Ki+uh7r3KRJwqbK+aTiEaZQTFkiq//5OUEer20b+4AhkNHNr8o2EG
         //IbGXC0TKnzCLoyfixibznBLC551AzutzGD1b7ANwYNdILggZEMXcpqIh0qHWJco9i1
         rJEjgPJbHBPVpWz8PazQVo7PH6J7gU0LV8z7iKoqSOAcY/HECIimMz9UeMiISJf+E1Mj
         vuqzVSjnb8+JmNe6bcz+sOK9U/GZ+TjnbwAvOngVxi8/YtLw8TT0epJH6ounw6UFL8Yp
         lZbOSDI6NeHJ0/WbdWU6A9bw8neI+3v7PLLKPMm9cyawhQp40295AxUGsl54Mwz3gFFf
         jZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773767724; x=1774372524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+lMqXRaEncaX84LcnOWNdxgfFY3qFRQryE+wAd+VB5k=;
        b=FWc8g7joM7pTMmE/TdHorvaEUdz5bF/ckD3KAFG3gtCyRTI7iKBsc0P7e6jnAxCgHp
         0mgvliHDuf8KMvs3HxnUcE8qM/1M0htlBak+I18rEoFqXj4VIMZn2mmtZIXN6Y75sSfs
         qnYdMW3S+p2+vKxlyUD8aypVsXG0zSfxVL/DIS4znElJqdRIeMyeuE/eRFtohI+4K8iT
         FrywHk1Eh+do0KAdUOIBlkByynkbTVT6FYU47ukmNfZTpA9aGltL0ISRh0zqqWhffPck
         eiFYDu3RD91PQl0yzZXUOdF9xIKl4w+bKM9VVTn21NNdW4WMF1fe4o/qyDr3UihIj0dE
         qlqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX97RXoXADu8DaNdtuExejPmhSP+dDXZ0kSb8PPj43GJcfeNvIshDc/UkkVy7tH3Uiixi7kLXbqbtg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvj9lNR42Zjep6vulC2gcKO1CvQJthkaSPxFybPf8pRkSz4GIS
	t3ZWWz1ABEROURX9rE6it0RL+88rQoCZFLCDtrI7vhautQkFIx0NWhzZhc4Uci0XCZagGw/Phgy
	ujGIZoaDqDhSyGhlVcpdSx6uX2PdqhrW+gJ1qo5L2Lv/NAmBzGwRjAqx5ugQflPg=
X-Gm-Gg: ATEYQzwh2yh3GhDnAhsOatcSK3HRHMlaSlDtWsJ0fcxw2mHE5I03BdNN1Luk6492kBN
	9yWjGUlpnIX1Flh6IxE9Z3cPDrk8zFVH36FZsS9txCLwtsFEMYpW0oEDvocgr8V7EqljrX19WKC
	KogiEygVghGMUKLdoGLLshlup6c25JGKUJmQS5o8c+Ih0TWt7TmrUKXKCQe0uXhQA+wEHmDrQpJ
	apcYkdvDpu7wNp4DEHkUWGf0QQdc2yIVpC6pqOUa283wSnVsy0wht3OOh/4330L2bMohEUT6qd/
	AS+IHxg9CYk8mhcOJv5cMnccpq6aPSdMax9jgBGCauHojWoMkLFqQ85MPu2QDuOlt0HZRLdxDYP
	Xnq/y9bfVkE5UO7Vtt3f+RcAydJBxiTLneZ9EiuEB3STj0Q==
X-Received: by 2002:a17:90a:ec88:b0:35b:9894:f6e2 with SMTP id 98e67ed59e1d1-35bb9f65b32mr160849a91.33.1773767723897;
        Tue, 17 Mar 2026 10:15:23 -0700 (PDT)
X-Received: by 2002:a17:90a:ec88:b0:35b:9894:f6e2 with SMTP id 98e67ed59e1d1-35bb9f65b32mr160810a91.33.1773767723206;
        Tue, 17 Mar 2026 10:15:23 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bb9f1cb48sm28919a91.0.2026.03.17.10.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:15:22 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 22:44:28 +0530
Subject: [PATCH 7/7] arm64: defconfig: Enable clock controllers on Qualcomm
 Eliza SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-eliza_mm_clock_controllers_v1-v1-7-4696eeda8cfb@oss.qualcomm.com>
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
In-Reply-To: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=bKIb4f+Z c=1 sm=1 tr=0 ts=69b98c2d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sHU3hrrlAqMI5U2SAHQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1MiBTYWx0ZWRfX1Yock3nvl4x6
 h3WyIbnz22/5KVy1TCiANaQntilJXVIK1mjWbYiczEZu6EdhhfqyJ82365WxWPuJ425UHYMe3ZI
 7s9qtADuHpUVcgawVI9Z4awzDaSNOkZIIwVMSxJeFZDktvNAAQseErlF/t+6YBG+rre+CuG3sv8
 shgJ1lhp6Yjest4VGPn75qsBOkMxBJRY5msDjML90IzShG2qpiE011di/GGcXd1P5aRGMkjyQH/
 sVAnmREo9l6/B2k7IEFwg/byC8CtEkjAxQbP/aU19gPSTni5YW8FSNj9cSjowV4yvy7Eq5oI5Ig
 EJTMcfLQqeCIOXbyhmfW3Q6jlKsR0hNiEirGo2z3UGNpuzE/y9TxbtgFdlqlL7dFHs/Eq9O3+Nc
 EFD6CfIj67fq5G0LEpY28qIrNRx5RY3F1j69lN/esMuoaFTmIcWu2I5kLSLsMk4tsMMlaos5mvK
 QLChtAp7CR3SEp6aW8A==
X-Proofpoint-GUID: lCgrRKAm9BEFodUwBnZ7AOFcACRHM46k
X-Proofpoint-ORIG-GUID: lCgrRKAm9BEFodUwBnZ7AOFcACRHM46k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_03,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170152

Enable the video, camera and gpu clock controllers for their respective
functionalities on the Qualcomm Eliza boards.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 18881bd239f9c53e74ad5caa492bace394e4fde7..dd45d275d30a32fd567432b5c324896518aa4ad8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1458,6 +1458,11 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_ELIZA_CAMCC=m
+CONFIG_CLK_ELIZA_GCC=y
+CONFIG_CLK_ELIZA_GPUCC=m
+CONFIG_CLK_ELIZA_TCSRCC=m
+CONFIG_CLK_ELIZA_VIDEOCC=m
 CONFIG_CLK_GLYMUR_DISPCC=m
 CONFIG_CLK_GLYMUR_GCC=y
 CONFIG_CLK_GLYMUR_TCSRCC=m

-- 
2.34.1

