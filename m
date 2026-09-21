Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A64736A033
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 06:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971611; cv=none; b=OZCMTnJYsb+YLMw/ZWu2drTiMtd5zosSzI1voc6MBnhTi6EIPU1ZLTg2OvliURvrF76yXn8KUNEly4i/YokUqgUEg35r92S1KAQzrysE/QBXBWiUlYzMhnWjP9lLAYX5AKvYiOzNwiimWWeJUFn1O6J555AWkhdEyjmOWp1wWYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971611; c=relaxed/simple;
	bh=nub8YchaXe+fEs7vARMi1DJduhsG6p4g9wlPVkeXOik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DmHzd2mfrgzZV7/u2ZwyxBHLf2DCJCRGhqD6NtUOe2usAf3/BmbPWY5o7tZGSkA5aylUkv8ISWGBASrWXUcjzWdvaA14upSvgMkFKcW39N0XInoukBsXm7HsA2RI2C816Q7mAi5lEJDhMX7DgJfe2cWAFcOPxKJvTvBz7KOOQ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UbLFOLgS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TYi+DQu1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UbLFOLgS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TYi+DQu1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3ZR3a635344
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 06:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mUv4XNsYY7RWg/oB9/eJvRwSDlNc6B92miYnzdDmack=; b=UbLFOLgS8rjw6YAb
	jwHQoLNsga5DeNrRWQgQ8MrdIQMcgn40m+iWRW/5XMccD5lkH/LVrs8R2dPpRcxd
	Ga7ixO5JsvRigkrIr0ms583AIk0IY/g+DU1F3NtQ+Sflu1lXmj9fOQM3UceUUFKO
	Z4gGovv+xURURecGryr0RM5PiwVZZEz9j0AWkXMWVnjexU8PmLDMbm2hZQGDi2LW
	ECqjq2N7T49t4fijc6KLBH57tKaCrTxzGAYHPKwtDl2mgu61anhKWXqwjyDfI1al
	SOsrklJj4xB05m6ovrVYgvEuEBkZ6kDDTsG3tqKZyDw+29uvw5K0Jboivpeh+dOp
	UvKiuA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshyxw1ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 06:20:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86a59faf521so4419193b3a.2
        for <linux-clk@vger.kernel.org>; Sun, 20 Sep 2026 23:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971608; x=1790576408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUv4XNsYY7RWg/oB9/eJvRwSDlNc6B92miYnzdDmack=;
        b=TYi+DQu1TOaf5GjM6n6xAp7+VlpEKkwdFQUBpmP753FbmPMsYX+vg17hsqrexYHdqd
         IcS9p0QRioPDaw8s7tk5chVHbRvs4omOp7wHHtIzpvJalI6/NSKEsJuvsJLKN2gq0Lu7
         lG8IZjcle+7EfUPN4xe3r+uUhRleNju/ecQc1SP+5+1Lwxr1hhbWN3aOeux1FsnZd2zB
         Csbl8UgZmBczbs3R++13lyRvihycBbj2Ggsdqj5AiAjX2Bqd6I9+8beOFHPyRgz5EGQr
         2+m1ATf8GxejeUl7Px4XfoqAWJehNRLIpCTFw7eyQmbRcw/NIQQ1Ss8SmClnceTARgSv
         Z6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971608; x=1790576408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mUv4XNsYY7RWg/oB9/eJvRwSDlNc6B92miYnzdDmack=;
        b=vdu9KPxNZ1M5fX9EGsZ0liLJahlK/OG+sCefakyWcypmVAYQZlvQDybx/nUsXIRvKn
         irHUDsLEpHj9tXjtq28fRidn5bBfgwKYVMxba6W1vJ+Ho8dy22dpO6oJ60nDWrvc0rgm
         g4JdWtZdyzsYWcf9wR6jckSN461bK6/VfwrSXMc76//0NPIdcmEL9Gnr7PeHzsHqmntq
         cZjOmKBtSkColHyhQkqxb9UJ1YE0iZl8svjYf26ozERhZPtgztGjMrvcGS1dya7E46fv
         Z+yS3bFchlDHXEilOpkfE2XSGBtSjVJK/8MFW85FqQGHonE1a5d8SM59I8r/tbjT5zUW
         2WVA==
X-Forwarded-Encrypted: i=1; AKwUvBxcbyb7T7YkQe8+oyQnKTtyVp6P1BoeR+t35lyxnBZfqkDJTrMemzjor7cMEd3Gg1oCQ9yB67Uk2GE=@vger.kernel.org
X-Gm-Message-State: AFuF++lOQtSdDiKkOyltBNHGc5E5Bi/5oCKJVB/a8mIvoPA1zzL/ppHW
	rY4vzLlL/u9jtxaBE53Jmx8QIiZRf4ebOVeVcU+tEeMsG10qzpCLVXVyEmvjspm6bCT+ulCskeQ
	Ed2lo4vccLBxJhY4eCNrYt5kNQlSU6o0asTZSif+owniQI2IMwVHGe8Sy2WjHUJY=
X-Gm-Gg: AYBFou1eadcfKpry1Opt8fwhLRVdxwPENeOabUUSN3ErAvyQhj/c/o/0g1/1yM7U//E
	QJuFhQkCIGI0ab02XvVtKyfiUIaxG1+3xjstIxenrn5W0PbkwJuwCo1kSuX4fg0kwTu+euS9YeU
	POdUKwFcoDnwZxr7NefOmDGRX06baYrXA9QFYCdjENKEJCO1r3uhZxpSmGa+9yhRWiWitubOGv6
	p61Cg/eH7gHgOBBZIM/nFC+GUnj9d3d4R3bz7y+xYqULkY4kMs+iU+6HwVrITHo1RVKG+ubp5Z9
	L3E+AZMxO7O8qkiBX4ZbIiuIZO9ZGYtgDFZiSaUvQNwWqMveuzG2Cy0Vvqoe1MnFNBM6f+Q8FRd
	700JKKX2TakLMx9hGhk93DycBZ93Qb91yfScObTPf8iQ5U6WLPCrjKupjdTYwRzbfnuaxb48Isg
	/Iwdb+yDGXywjO8zc0R52XnutemDREvtuABQ==
X-Received: by 2002:a05:6a20:cd95:b0:3dd:85a9:55b6 with SMTP id adf61e73a8af0-3dd8c5d2212mr15954778637.33.1789971608350;
        Sun, 20 Sep 2026 23:20:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:cd95:b0:3dd:85a9:55b6 with SMTP id adf61e73a8af0-3dd8c5d2212mr15954699637.33.1789971607300;
        Sun, 20 Sep 2026 23:20:07 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:20:06 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:36 +0530
Subject: [PATCH 03/11] clk: qcom: ipq5210: add 24MHz rate for USB UTMI
 clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-3-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=PaRqFShd c=1 sm=1 tr=0 ts=6ab0cc99 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T_jLbkAMJ8GdCbUqRukA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX42TdKne/wHBg
 mkc8nSsix89S8BiJUIOhFRASy5zy9STb6mGg9QRGiZ/t7fpbOD6KPX7cAGa+CaE544f5/N7SDBZ
 Yw8m+1tKaEtUVd6TB0PfYLsKDStxnfs=
X-Proofpoint-GUID: 1QoKonIAiKGcEf1FABHrnnXYnzH3RPxr
X-Proofpoint-ORIG-GUID: 1QoKonIAiKGcEf1FABHrnnXYnzH3RPxr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX39RW4f0xRy/q
 GRhI4NAYgW0NMbHB+PpasJAzdxSUnsfBTT27wHncTAqmaV8mBK8BknO1clQafSzVnVms1y2cdr0
 yGhqxjZrAMab2mSsdf2yo73tJ7np+jG/lSWR1eRCY1DEiaSaARKdz7zv74l1Xy7YyVDj2tmVmpb
 lJ1i2BxIA0GYuRxkq8VlPbMU1dxpEVKz4tRVAEaH4la3yEYXjDAj5iCvApFE4XvtmnCU7bmaTxX
 LuvOadw5QFJVU74rqhSd6Kea5BCfdU0LSDMFBFGKX9uVN7KHygZ/uv8chHkL21JMydejvwvENI6
 BWmsnbgXeTpZzQJIXnoeO9wpFmdtOEr+lLIH8A5NF7aDopUlsbEUuV696bluQ6rQQNRFQaW14aZ
 0ts34AjTGPJVHric/KEIT6VeLhrhlhqklqUa0//CUJGZM+30AjnpDCKMRJ8qeNLb4LTFaGKlwW4
 b5mvOtjqG5I97KwdXaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

The USB UTMI reference clock must operate at 24 MHz, as recommended
by the hardware team, for reliable USB operation.

Validation showed that USB 3.2 hub enumeration with USB 2.0 devices
fails when the UTMI reference clock is not configured to the required
24 MHz rate. Configuring the UTMI reference clock to 24 MHz to resolve
the enumeration failure and ensure successful device detection.

Cc: stable@vger.kernel.org
Fixes: 844be6e24afd ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5210 SoC")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq5210.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-ipq5210.c b/drivers/clk/qcom/gcc-ipq5210.c
index 3a786a21bdff..76adfa8bf2ad 100644
--- a/drivers/clk/qcom/gcc-ipq5210.c
+++ b/drivers/clk/qcom/gcc-ipq5210.c
@@ -716,6 +716,7 @@ static struct clk_rcg2 gcc_usb0_master_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_usb0_mock_utmi_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
 	F(60000000, P_GPLL4_OUT_AUX, 10, 1, 2),
 	{ }
 };

-- 
2.34.1

