Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794074815;
	b=riLqL3X40u65Tp5VCFPTTDWLqRnqhKqVTPYI/rcI0HDiKKFQqgkB9pGano1SwZ2ov39c
	 sjZ8bxObirMZOD6cgqb9NayEKihHtWKiVwhmHAwTFRMUjqTtIwUUX1VN/RDNlFUktxkyL
	 MjkkDJscD13cPA4sgEK0psU27/Nnt+dF5yiuj+FeMRPyJ/Zr1nYGnix2EKkEozq9qX99L
	 cQeBTdqSv5cBN4wgc/1UVLt3SQt8yfbMLF4ntyZWhQktUkhAAj7ns1p1+92zlSzWxlDRM
	 4Kwpx2zQ//y7aaaAxoaPNDGyMJoBA9wbrP+a9BrGQTNF1MbeNsrtoCLTcDLDRjcnV5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074815;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KtXcfDwP0OI37SAv9nafNaChy8uheMzqgS7OX1e7QEo=;
	b=XcewEeUngmOI9yc0xwXg+PIzVqnc1BFWjoJcbg0RH7FpkKDPPrMqzH7gKy/zBdca9pvN
	 xQWZurZVtYx0iQJYa5a5J9xKAnZ3GVyRgmsm0mBFmqA3fPSZPyLILjxGhqnXQ6yXJvJKm
	 lTN4+q87sZ/591ezpn2R49IYiSLEizUn+61bmrwiZknQgEqX94bVo05yKSk7/wigPNSuN
	 eRjpYBCJY0fhvsccTM35UDuZOfAAVLxZ3f1W0eFfPvxl5AJPt5xpQIdRGS/+6gZLFZNNE
	 R4TP/YsNO/EK2QP7Ynx4S0bm4bths4qlNpC8CsimUaSbdDBTQb0gwjJf9M3eriVRaww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SreeR8Pf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EJxR6hjE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E649B606A326
	for <linux-clk@vger.kernel.org>; Sat,  7 Nov 2026 18:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E649B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SreeR8Pf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EJxR6hjE
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7Hte67206889
	for <linux-clk@vger.kernel.org>; Sat, 7 Nov 2026 18:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KtXcfDwP0OI37SAv9nafNa
	Chy8uheMzqgS7OX1e7QEo=; b=SreeR8PfOUXFldSESQfVsX5Yqmkvp1ACbfBR5c
	nybxUPAOJHvDNI3VlvdU1kRKc/j2sMU/ae58GpQMhHw0pDCytxxWxAfoEqyEFTwa
	xxfp5J+c29n0rfMa+CwIAPxjsiv2+IuU+ZBtqHaKIPsSXWcYUM/0wT8lFk25e85G
	NrLe2cGzTBuWzH6gW5gZPpWS6tuHAGxlg9bw81b5gQ6cdK/VOhKEC7RXh6y2Dn8m
	cjP1hTRNLQxraD7/VgVwq7MpHeGG9X7Og0B4hHY2Gq2n8QF5d5EhjMvRuqK/cVFr
	O7zSqY3raS0lDW1ySkxUsCbT4/r3gZlS1ZDlhyHQ4J3ooQLw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf1s17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 07 Nov 2026 18:06:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso2308831eec.0
        for <linux-clk@vger.kernel.org>; Sat, 07 Nov 2026 10:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794074814; x=1794679614; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KtXcfDwP0OI37SAv9nafNaChy8uheMzqgS7OX1e7QEo=;
        b=EJxR6hjEpPTAq/Q9kFqBqHGQ99+GIL2Uc0vI+sLW2oXwwnbkZ8Gt7mx+ZHa1lLtro8
         izR0A5xatBt1crM9igbIjM8Msff0d/P5g3xFvHJsniuaA8XRM+Qjp29Sj60jCMLHdYra
         60Z2ZTC6a+lDScX/3kfKOeOhsZxABh2iC/hWSC/bAj0ql+IV7HruOMuZOvdlPT8D2oZy
         skuQNqI/V0lYxZQAHg2ULO5fYUadFi8u9/laFHsXUG5t8jfrMXxci2Ky5C6r0iJEdWJr
         BE1vnVN86FopAw/3sD/zRA00W4TLdCQO9X4X7QhpwOmbL+dnZU9LOIfHPrwruLkRy51h
         K5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794074814; x=1794679614;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KtXcfDwP0OI37SAv9nafNaChy8uheMzqgS7OX1e7QEo=;
        b=a7vCY/VeSvkVF8Csr1ZsvhlHdo102pUQOOBcgtxBaSxAOuUlVbfYxyrX6mfKouRkPl
         kEEb7jwwMX+GWm6+aqFYyHL2V6Tfp9CuS6xb0Bn09tpE2XhPto2Byvg34bz8yZFjVzps
         6uOk8wImhuJajTWF+YjLuUMEStBGSV/c5m0W+OfSZAOgNEhu+zghWYlPhXIeke/R8Tuj
         5NdksU3BrAqeRGND0dgu/wBoZ6Y9Glv4bqGK3Qn8oON4Wzt/4z1vm08BsIGpvTnzS+iF
         7r+yLgInARDQYG0+TZoSxpyGukXD/I7dushKWkEAd0t9IrAvtleXk/XAh/zZ5+JP5cCn
         ppCg==
X-Forwarded-Encrypted: i=1; AL+hErGNleO5GtyXsralZjSKcO0jl70+hNPTojuD0HjwT8GBkhEHCBU0ic8K3+5ubA+1mtS8416ihGwLUcQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8a/Vo0t6y5ERYc4mN1oGmH4QYMfS5xIffMV3X58otl4AsCUGhN
	FgegcdsvX/6jcL14blVcgnUoYZBng1B3FiEg4CN85eYuIKRzc0hWJ0Gz3TJcgZSuKYLRB4V6Ju4
	saTn5/RtQVN9OmwqjsqrXS0Q6csW7RITc90Q1DpncU4DgEo8KpxCje8ltSMXUL4w=
X-Gm-Gg: AYBFou2bGsxe86ui08Mz50fCNCCrQbWWUX5958knPOvpDpmSkG9+n5FR6KehSwt+6iu
	Zox+ktnd7ti5WOhZbxdrm0OIIL0NJszXAMFCgKPAzvnGRVyRYq6Wo0F3x5I5BdvytAzCkf+nzgA
	fdpPM8qS6lOzRrKa+IP/jOWi6mDf1I/otWwyf6A5sF7nFFQtiAmvcTpShemERsQNOd7aMhG+AqU
	7c178xXp3hq+Cnfvkt1yrb3pCE9xLYM4JYYX8ze1veaw6ncnybBXQRaOM0VuaoZKp1muxjvnyz5
	0PMmEYwEqWTwBEC1lci7thQUdbDs+fHak0zIV7tL3Xz5ZYZdqXYat8DodrJA/uc44DzxHGhg3sp
	ZS0PaJhn8lpb0Sp51yvf0xHrN8aCJavxy2U1uaDj+fVyNcjEYPJGk0ffDIOtKTI6jdC/1ZC30
X-Received: by 2002:a05:7301:4d0d:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-36f75e28a16mr8095930eec.19.1794074813471;
        Sat, 07 Nov 2026 10:06:53 -0800 (PST)
X-Received: by 2002:a05:7301:4d0d:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-36f75e28a16mr8095877eec.19.1794074812701;
        Sat, 07 Nov 2026 10:06:52 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm24710212eec.6.2026.11.07.10.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:06:52 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add I2C and TSC clock support for Nord
Date: Sat, 07 Nov 2026 23:36:35 +0530
Message-Id: <20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKto72oC/x3MTQqAIBBA4avErBNS+4GuEiE2TjWbEqciiO6et
 PwW7z0glJgE+uKBRBcL71uGLgvA1W8LKQ7ZYCrTal11akF0bNAdgk7OGPd0qLb23jYm2EkHyGV
 MNPP9X4fxfT86/JO8ZQAAAA==
X-Change-ID: 20261107-gcc_i2c_tsc_support-64aa352d3b1d
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDA3MiBTYWx0ZWRfX5SCj3qr0H6sI
 lroNTjsDl9U+40XZdouNjKuhsxICgALaratkFc3pInumOs48fghyDr11GrS9AZWTbuo0S6oAbFJ
 8kAwIVbnnQKQXQS+dwAjWCGHTHpApEk=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6aef68be cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=L8zgO8z3qB8kSUkvw_kA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: REZ3JkOGJZpD1pWZEhb395IQtf6nNs8K
X-Proofpoint-ORIG-GUID: REZ3JkOGJZpD1pWZEhb395IQtf6nNs8K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDA3MiBTYWx0ZWRfX9bfYamhci2k0
 K6Hp/61bJbY2+TZe7+ryCzHfRNXRuWfCTd1blKjJY/qPvS4Xohdp2UrIn/xJOND2phiENzdt+AH
 3IkQSdqdjbv6/kpPoS64bAb8mqI3bui2152vpkmcxHEemNa/UOwlJ9+j+8oBTx8QXpAoKh/lIra
 WZHPboOxsHAO4bkSDKtqRopIo0YhNk/YnbPwS1og8+d6q2WrOcqQiVklB/nDnVfgkcSyYPEmFlD
 0DJ4T9yD5cP1lR2zTKrQJflgMFq08oDjXc7voExaSHDDjiBYZ4Rgc+Z//WMHKv/nONNkF/+r12C
 14McJtb9FzQ7n4ONRubtNDzk5RQm1jfIytvTUY+Q8dt4jnar7LG552k5yopc7PbzAJTkxrAsCZy
 gKdExUUThwpoEzDVotKqfr2tDSoyIVGrEUF3AlEhDcC9lmfwUJQ9axxrPAjxZfVFhz9sM4LFDAo
 4a09GE0/F4HUtW5aaBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611070072

The Nord SE GCC provides clocks and reset controls for its I2C slave and
TSC subsystem. The clock IDs for those resources are not currently
exported, preventing device-tree consumers from referencing them.

Add the binding IDs, then describe the I2C slave and TSC clocks, resets,
and TSC parent PLL in the Nord SE GCC driver.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: qcom: Add I2C and TSC clocks for Nord
      clk: qcom: segcc-nord: Add I2C and TSC clock support

 drivers/clk/qcom/segcc-nord.c               | 187 ++++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-segcc.h |  11 ++
 2 files changed, 198 insertions(+)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261107-gcc_i2c_tsc_support-64aa352d3b1d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

