Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202E335CBD0
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029827; cv=none; b=u0/ngEyf04wpVwQCjVLpLFpoQzDOHACC2oNnHvo7qJctwYWkmqrDt5hHweNK3ZpxttT3Mmrp0L1MfaZr+RXh1LGqlYFCJQVH1Dus8jfYxQgqh2ouSDlFg+ixonKrpZaRLf1f3SWDJsVLiIP7vp9DY0w7eqaBvcciwwFiFCMLEAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029827; c=relaxed/simple;
	bh=cHCPLXQpZgOGWiQ9cqlN02EhhMLJIwoEMGitXXLzg34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ADgWWqmAKQwiEaKceOEWE9ERptKlTxG8kjF0+01eoIAiF+RPQV1xdyf3BTZIpJnfT+4zbaDgdgdH78a9QdU/aksz6rbQi+IWchmH2ddsqWVZCkS+OxhPqU2vQ5Jm5F/vjnzVoQXdpVh6YVQzWrgCqALmhL2rPAZojEn2qnDdaJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gl58j5km; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kUPp55+8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gl58j5km";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kUPp55+8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61270rP72028623
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 10:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TXnE7KlVVJV6vCllj6TWQGH1jIaQsMLhoWpK/hIRFgc=; b=Gl58j5kmWwhny2U6
	rebL4XEm3Q9wKWFJCfmT5eoh0KCbR5l5XVHjJb9X6CCR45iybMoNZnAm2aZO783I
	EWtAccV4rMfrSm0+ZLz77oG9vvJin2lucmQsiXbjStWVCAJoK2V0AD6jLTg4im9D
	Xdb01hj6aNkLNnzueeo5XZ8iyiI0cA9aQAA8ukZJJSikA3sWXlJfX3C/mSyqb2zZ
	Y0Mq2Zem08wmDSd1hUeGTW1BH6yCUQaIxp2hxQA0I5lk3/YIHx7x+lgg2qtv0bYo
	TYcJ2bCJsboJWzDMeTTtETbLT/2cuM51YoOmIEh9rFRm89JRhra8TnY2u6CEBrBH
	1oL+Bg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awdd49e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 10:57:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a76b0673dcso44292995ad.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 02:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770029824; x=1770634624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXnE7KlVVJV6vCllj6TWQGH1jIaQsMLhoWpK/hIRFgc=;
        b=kUPp55+8xqyd7iEaBe1NYdlvNL0kEd5gOwp1ogTIYDVmphB1aBeTN9JXNO8s0E/hg/
         KytTfBWuSj2HiLFsnLxFPeuCFt/4FM/LiuiBuQETyQzGMBThxNq+6ETtOi1ZMsVdEwaC
         gjt9T2oEPcyCrJZFcWVfza1y+f6J2tVgO085TOufKAFBUSWB0K7Nu6syz/b5OqHGd3d/
         JsA3KMEUNvJzizzj7BbMYO3r7UhXzZBw12uRJ67Dw+cooxG45FDIonrMcb/U6zAe9I3L
         VCBZxkEW7FoKISr9CboCMojB5YWZNVJB1jWpOKbXd5GQRURwQJKNbEgrMEEEdil2MO9x
         pQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770029824; x=1770634624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TXnE7KlVVJV6vCllj6TWQGH1jIaQsMLhoWpK/hIRFgc=;
        b=Z0vemNrKjVc4vC7uwiSDJpnLFH9YvJtd9W9SXjq1s4KxPagLtZuvXgdWvbD2f3TNHf
         S7oTuU9yz816mYMZ7d1DtylCiEO94BokqD4aC7HtHEYVOhH1IoiKdI5aoY5JkmlP2ypn
         Rb1AsOtZ2tU9DiQxNK64u9Itn144FiDWpZ/OcteJRAj4WRWKdJnL728W45m0my9vhacs
         0BkPzKmCwQ7lc3rcb5++ut7ntADCXbcbUA28mNO1tj4unJsA9ZM0KG5QhwrV/YC4MsFV
         4MBkMJJEAQn7lCOCLON2Gw1h2syrGAdNX89UmMxL8RLo1LLvUGOlJlk3m8gwpCT8HUkU
         X74g==
X-Forwarded-Encrypted: i=1; AJvYcCW6eDXhz39yWiF+E1QOjgi2sDI5O5RxSla//g2FM9A6H/0WXAi1hjMnnyLxFHMjuziE5J60Aq5N2/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG+w6yl3hDRn4tbgJDiNzKQeo3Mfw7FWHMQPv70QfJV3EeSPI4
	PPuamziAEZ4plYwJf91WZSkv13Mko+v6/BAUVBkUq/pAJMj6jfVKxJHboKYlKRTX+PTFNH+9i7z
	8iTzl16csa4Ug+We+T1FHFM3XeNPXu5GKhxzMhtF32nIAUDXU48KbxtOpBzFWKnMsVRiPoCg=
X-Gm-Gg: AZuq6aKj747Tf6JbYJW2ILPX8zRLGOZCDF/NI5exuigZS62n7V9lxi/Rg8tnVmvzRlR
	HXR5Ms3UHZ/AqWFuUVnMltwSAPf9RJJoV+8MsMfPB8UrJRQ309D59mYC6fbxOV512tzNFglGJ94
	h5IstsNwplPRY4V0hVTmb9NVrl3va8rC4DP7PPCCl5Cu2CZTGQtXsHCjppDwovBqBBBPZcoS+od
	ai8AMSnyx91Ofthd5hBm0Tpi8+E8lawBDP1VmS3ekCM0rHiiSStyJYDLl6zXJi//90OXs5O5eIW
	U3QrzA3L63RTD0JFXUNrnhoUMPf8CMyR8yEuPFXVDvP+I/V3JDZocb1x0z+5bFd2AM+b8l4om+t
	zK7DGaUJRBLLrXqbxboq5v6vScGszeYB13A==
X-Received: by 2002:a17:903:3b8f:b0:2a2:d4fb:2e4 with SMTP id d9443c01a7336-2a8d7eac07emr102189605ad.3.1770029824253;
        Mon, 02 Feb 2026 02:57:04 -0800 (PST)
X-Received: by 2002:a17:903:3b8f:b0:2a2:d4fb:2e4 with SMTP id d9443c01a7336-2a8d7eac07emr102189315ad.3.1770029823785;
        Mon, 02 Feb 2026 02:57:03 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c4665sm143981225ad.64.2026.02.02.02.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 02:57:03 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 02 Feb 2026 16:26:50 +0530
Subject: [PATCH v2 1/4] dt-bindings: clock: qcom: Add GCC video axi reset
 clock for Glymur
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-glymur_videocc-v2-1-8f7d8b4d8edd@oss.qualcomm.com>
References: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
In-Reply-To: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: 0zCKZ-gSLwz0b_1p9Ruao4Z0NNrpcwue
X-Proofpoint-ORIG-GUID: 0zCKZ-gSLwz0b_1p9Ruao4Z0NNrpcwue
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4OCBTYWx0ZWRfX81xgN+NODdLE
 R93dez7fVMV6fz4g8MxbgfmQFbpKLpP6eY0cVvS/5p5iAVRCNgyNC40X0gAgKBbUimXO5j5whlY
 1FJC9Orpj61FDemUUb/8sjammBqdydt0ZyBcD2Tb+6cO2NJsdtpZ3XEPCQvWmLnPl+6YGaffbjv
 WfXy/eQgmparT+xNh56RfGkDtIaeOmHfGtphoJT7f1MNhH8DNLpwtK6RZJfzo1Xbpp4zjxSD3t6
 haTmyOnnRIONkkWOZN2QHwFWa1GAi2/iCTLJBkpn219y+0KNld1HZHwqDKVuakMhuom/QThAAD4
 PP1Nz7+rnUAgXvDFBmz2JPrOux4AYN+tm9CQFtBAglcoDUsxZJB92HJNcqAKUpnTZaHTWjrrdoK
 frJZC9ZOx+xjI3cwW1he3LZ5uY44oQnqS0irxW5BBpqAItiUrBZhSpqS253bpm45/8Xr4t8LLAk
 Qj4fB5alLEYoZDT2fhA==
X-Authority-Analysis: v=2.4 cv=T8OBjvKQ c=1 sm=1 tr=0 ts=69808301 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=h3uFTQrF-vKaECCUKRQA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020088

The global clock controller video axi reset clocks are required by
the video SW driver to assert and deassert the clock resets.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,glymur-gcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,glymur-gcc.h b/include/dt-bindings/clock/qcom,glymur-gcc.h
index 10c12b8c51c34c5931c34b4437be03aea098ba53..6907653c79927f0ff32c98c75d830b719ce14d51 100644
--- a/include/dt-bindings/clock/qcom,glymur-gcc.h
+++ b/include/dt-bindings/clock/qcom,glymur-gcc.h
@@ -574,5 +574,6 @@
 #define GCC_VIDEO_AXI0_CLK_ARES					89
 #define GCC_VIDEO_AXI1_CLK_ARES					90
 #define GCC_VIDEO_BCR						91
+#define GCC_VIDEO_AXI0C_CLK_ARES				92
 
 #endif

-- 
2.34.1

