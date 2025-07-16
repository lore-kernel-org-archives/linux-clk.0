Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB46B2EF9C1
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679236; cv=none; b=M9lGrNmjtJaNYj0VE3ytO0ErsVZubb/rPbzJ9WebKpDreGFVWXKedRHTn5GaoElfQJpr2Q2G/3dMJfKXuhwVLT7pccoSDBlGWnevrTxLEXFFpbepFFQJeUCSZBAvi5Uvhp44vv2D4snvFX/dKGGROkIc7Il33YiGPYvNPED9tj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679236; c=relaxed/simple;
	bh=chDPFM/gKsIkCz2uGNvcZOhIr1MQ7Z5mLou4364bH0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BoICkVvVWBl+cC9IV6qNhxI5QTas1+CjPO7PStFSyXeB86cuIdx2JSRN28VHaEQzucTGruFOTP825d1yVD3BZh7PCpZNh07hpZ7Q2qmLgiT5zw7PjtWyFJCYUdYQj/LAtJnZFJv5mezbUhgyMKNhMgSeweARTKQWQ/zWLHyA5nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dd3dqEwa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dd3dqEwa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GDc7dH003273
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7kAuUkf6gQb
	DezV71kriyxf9UqTXCD2n6sjYNZXCI88=; b=Dd3dqEwalwMaSVaOto17nsBIFoH
	6ebpDriaGWfzFfbkizbWCF2szhaSXCssVvz4e1Wu3A0fxnoVKIexgQQ0bqsS2N9w
	4lxUhw8UOiFpRM9oqNPQIS4HahBudi1UPwTjn52gEzB56FCR6FAirmiAN97IKSnL
	21aIOpBf4SW9uYAwpk65WIale+14rpyTkg7HCohYie7WQkH2Br6w8A9EtL1/m1bX
	DFiIKcOT2I+CoSyw57emozIqUVi8vNrgKhOMn8W6XmyFzMKQ29HE//XI32qQtGJb
	F54UXcoNvSINmemrsiBah+R51igZmYuGkl+79EcR/l+kgzTgczX8u2tLSZQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drqe9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:20:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74d15d90cdbso42195b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 08:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679232; x=1753284032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kAuUkf6gQbDezV71kriyxf9UqTXCD2n6sjYNZXCI88=;
        b=nfLcCRILlcyTcVqidZaKbKOS9oenNDevwpQ+LkDpusj95sw/45V6sDuaYKIEHcUGwx
         57UjPmE5ucc164jxREHpgeicRB+5EcUjS8aYYBY4tgUk1G3tv7BtY/GYqzPddDUpkT+V
         Bwy5bClqSr+8eMS+Tk9aiPrQxrtvd6Rk9byxmee9V1rPRoQWq4lReL4xQZM3n2kmwngm
         r802qA+LTIqeQC9PDXvU13q2QvQCOoXfZ9yRhJYuchjWO9+W1IeinJb1km9AtvGw9x2g
         J5nAsOSAtQNm2MQP6W6K+YHwAJlwV9aaHR0pQ/DtNX40AIMu0ocVgcRk6D7LGzhZWQfe
         veiw==
X-Gm-Message-State: AOJu0YxXhyz9G9pG/H9jl3DWnDTyFnAnIKGlL4cc9wZxtWDiEiSGs74w
	PszhMKiMw3ZpRbOsoaXjzfqTuWMoK3eJL6JvbQn7+/3Y8RydBKo9VVUrdP9MJ02tUvt32rngL/3
	bD9JlSTONdiKPJZC0wyq55+9I9O4DQRVtCKsvRcb1JDhtPCKYvTRg2pQh+yr2mrE=
X-Gm-Gg: ASbGncst6sUpGfFIkFGhsaNGH4ukjXmljAMH2l0UGawrx4Cn0GG1B4JH6b6IjHlgrgM
	YalkynuFkvd/kX1X2GcJ6Yz8uLGo2z5+wILmnomKFGjNeFRWhoH6S4X0/rLxyyT0vJAcdFO6UK8
	BQYSFutikkOVAz2vl1jFZ/e3dxYRn/CmFTN1btrv3qyfZWLUkOL1ab1z45HE09V83T72x+ldDNg
	vxzr1aE55EjN3mlwyL8ulEwaMmLEUWtyA0U17DsiKAFXif5YRvrmlIB8W8XqMZN7S8WOmhkmfuu
	KHAJAwm7ew6vjPULYvKLo+Dy9g9JeNE2Mkp+XspWTkgyHaygBhfvCBKTrBzhMZnh/H0GiZO3xOb
	UP3IYFAa1CrggZNgcKjgvtwny+lyUFoDl9ZHVVQX/SJR+p9S/WuWVkZBsx5ha
X-Received: by 2002:a05:6a20:2588:b0:220:1ca5:957c with SMTP id adf61e73a8af0-23814269fa7mr6035098637.31.1752679232435;
        Wed, 16 Jul 2025 08:20:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhWL+P4EBROycejWOKigF482qtWta4UpPGPsaG5+brLj9Rnoju1DZYfQKmw4BL4DfeSQ5H4Q==
X-Received: by 2002:a05:6a20:2588:b0:220:1ca5:957c with SMTP id adf61e73a8af0-23814269fa7mr6035032637.31.1752679231921;
        Wed, 16 Jul 2025 08:20:31 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6bd8f8sm13912054a12.38.2025.07.16.08.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:20:31 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: clock: qcom-rpmhcc: Add support for Glymur SoCs
Date: Wed, 16 Jul 2025 20:50:11 +0530
Message-Id: <20250716152017.4070029-2-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: j0ZHnfIvZCM4FrHGAPKCDba6vX9LDkoH
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=6877c341 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=RYbyPGwfGPyvG-E-d-UA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: j0ZHnfIvZCM4FrHGAPKCDba6vX9LDkoH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzOCBTYWx0ZWRfX0gCzscrNL53I
 Qu1Rvn0UDXQeABNzfwL+Tgz5eVMO9Wr05HQFQ9jkTjslZ1ZRucWT/5NKM8RHJhad7nBpd+ahrqb
 2fJ8JnpP+QgFrvdFF9FlI8sPy/HLH5bJwN6a4YxJvuqBilW4Tr6F9QSZMHIl6UnfqLDTbI09WHj
 emlSRpnBP45gWW9d1/RTTL6SIElpyBa6JW/drbZlUkiN1JWIy/QVOwT2iCK8UodV+lw49h7cr8h
 O/FmSgtn0XR2PlId2O6dBzIz0x0vwa/1N8gfsCuLxdQhGhX4x7S8vrvLvEpUc4ifx6XfwUzfBrW
 nMlxttHjLqnZN8fc2RKCM2853RIEf3VN1MNc39o03uT8Vp5wind9hk3PhsevFHzEGe+PSFutWZb
 L6H1TGawxB+579t+QP+Eb1VoDP76h0KL/7xsfXPPcng7EEN00qZqyHcLf9w3fmtnwcG6I54S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160138

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add devicetree binding for Glymur SoC RPMHCC

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index dcb872b9cf3e..27307e7bcfbc 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,glymur-rpmh-clk
       - qcom,qcs615-rpmh-clk
       - qcom,qdu1000-rpmh-clk
       - qcom,sa8775p-rpmh-clk
-- 
2.34.1

