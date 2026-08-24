Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D2241A4F3
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572541; cv=none; b=VWeURjC9HTskb4JbFWSmDAcGoflYDyEQcD/l2XnLaUgzGA6ENRrDDb2kP1+fK7CUBjmVKD9ZZTaxvawVfyZ4GcjLUluYgDw2bBn76b2OHRTdPxMAuV//VniMKrpviQlS9/IabRqA3wEtXR0i6JhfJz6Hy83CoDX0yjtO7xa8TLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572541; c=relaxed/simple;
	bh=3PG+8pzZrRsl1xoLIbdwVtCtK9o6pwfuixMqEuKn8n0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+iMGnNclB3lPSXX3ulp88hTjZVIiAQ8TJdXnl927z15mv0//XnInZjKEe7UPUZ0f9NHEEpGOv1iA6u9Z/81taLa1xosiGu+OYXWa1YdSUmSSVICph8iveHEXO70HsAMIfO4GJCzK5aSEXzaz1B0L22U3aRsKo7p02JU6hnZkRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FGuxhK48; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjNtsoCj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FGuxhK48";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VjNtsoCj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMZXm1800281
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/ympg6kMeMlMMAtCOGkGblawvs88Q3zczsXdXxfpSA=; b=FGuxhK48hIJ+qT5y
	YGSi38eWO8nD9GPSkPx9klXybvE9sdMw39nWm1/Yyf839zABAjPjQtoUYlT9TU82
	L2FW2+URPQvkc29jYxHep3K2J1mlOiF6+s/+Ih02kBljEyUhi5Xy9vJG7wHp2IXS
	3w0m1R5gtbuxBGA1FPZg0tnfAZactk5TdR3PiICVXYaYI6BNFKXGtmW2b64GTF32
	xmWuaw/0GvliS4vMrxJ0D7ezyAU4VzZ3EB8q+k7SMfQ6h0C+Tf9swdWFfF+VA6R0
	44IB4lLdhLNODjgTN8Eq5t2rCHoOM3TPR2C1jT5/UHN5ZeiJ6N3SLVxu+MVHBTCi
	eTg4Pg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv78c1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e38fbc5so399916085a.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572538; x=1788177338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/ympg6kMeMlMMAtCOGkGblawvs88Q3zczsXdXxfpSA=;
        b=VjNtsoCjDfbeUWanhKv244rT5z1KivaprZmZt4E0A2wnJqxrLQr0JpqzaF0+OrYra7
         6pGi+iTYfbxN7Nsc/e5jSFfaSxSisqVcI/HZ4UkwtPj9nVqzzPzOJLeJk8StiPmQ5LNX
         cmVhbpEvlUfgbjkCol5+NvIeuS9/+lZAOstwIydkisODh8VQu9puD2Z7TsCV9scGBuRU
         EdH4FEE25ExHAlqY969pQ/w9bZYx/pas5RvaImhDM/+92+U1ubSwoFoTE+MHV4GxE61B
         Nh68hp5aJqGTvyyZI7z5wGG6gwobps71/28uwWWSvcrfvVWH83WuJ4QdbVOqbWmDJ+R1
         F0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572538; x=1788177338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/ympg6kMeMlMMAtCOGkGblawvs88Q3zczsXdXxfpSA=;
        b=fOB3zgr2816DPs66vO6eXN5F6m+TIgksT3RdXA6uPTWwjpQUKjaJ+FbYDVfLXYB9Kh
         hdZGRa3OwOZbW6lmj5aDpN3u6N5uGPhU4QQAYSAumNwG+mkBjVBXyE7IH6HklGsHelbg
         uaSUoItJSeOmTDEbcSIwzkkP6dhfxpokV4uVB3pBFjpv6/9K2JkEPPGA9CyykM1wmmQC
         03A+0bWSTmirHFdwaFL6ONj1yP+9f7rxU90VzLIfoWsIC6e1SHUovqWSGkYCWHtvUMkf
         VOTkyhurpwtb98vPb2To/So+ML5loOs7IjfbpwVG5lyYfOUrxmWieDbiAe6ABnnAAZ1n
         96hg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1NmgqW5dzeRmbuqc4v11QWfVSjwSxDQO4X2J5u8aeXSTdTS7QN9Yw99jPM/IwllpB30ypz7t3+B8=@vger.kernel.org
X-Gm-Message-State: AFuF++kCuS/9bGzVXz84KGNIJTH7SuhHcendkG9mN6bmBJl0WwqRNVdl
	hVzEzJH4/HbiX7RgzfUWCQNfcCZzBio8bvT37KXRrPOFJRD6FZ2tdpkjPNbARrncQZE+jbXJtvs
	UJIPAkUVaHZe7F7x/wdYa7EPIK8Hmz6ZwRJAmJWq592WBB+9Yi7tjNINM/ln69gU=
X-Gm-Gg: AR+sD13zvQDaghSCp6u0RnCrUf3jW4/QZcM+n4o9/0OLaGkER1puoo+GPp2UFhI+OV9
	qrB/0WWUdMAXpSxT2FqGaVhHVGeRafaumMyyqM5bGlbqoP6AzPaxZOc198SrTCMej/lOLMqtzE3
	uUJ99a0MP29OY19Pt5JwHoQBmr67RJ3eUXvUrFTMIDujyH0ZXjvAzPPaWyGx8I6s2m9kkKnMXn/
	3TtFM6uUn+AB1w71YS91r1jpxQbSs8+MDvxG7gTLc1E1pGrlY6U7H/Y7hxzrL/+qjKGdBFRpkf5
	sVqEPPpnvGelNn2TucyROk96d8EGelrFzLdu8/Fj73Jso0mjtiBK3oghi+ohhb6R4grLEl9M+zS
	TXI6goT1/
X-Received: by 2002:a05:6214:501a:b0:8dd:fde8:68c7 with SMTP id 6a1803df08f44-90c80ff04camr255164676d6.30.1787572537423;
        Mon, 24 Aug 2026 04:55:37 -0700 (PDT)
X-Received: by 2002:a05:6214:501a:b0:8dd:fde8:68c7 with SMTP id 6a1803df08f44-90c80ff04camr255163736d6.30.1787572536822;
        Mon, 24 Aug 2026 04:55:36 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:05 +0300
Subject: [PATCH v3 18/47] clk: qcom: gcc-sc7280: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-18-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=3PG+8pzZrRsl1xoLIbdwVtCtK9o6pwfuixMqEuKn8n0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDmY2hh7qjGzxIsb8lmqUt6ZKS8DG/HWHebm
 ZJOV9ei0giJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww5gAKCRAbX0TJAJUV
 Vpq7D/9vr+QUS7UKyHxlTeB7p6Rf2pa8+fvbgYGPAbV2itoiKyLNT+v7478h8/gNV++M/GT9T8J
 6SmsVnQUex23GdRwS+HWXraS0P13O+ygtLopGnJPdJrgolfIkCi8lqHhRovxXypzm8rx6eMv2MQ
 +9MrcvrJ6AGqOHcO1BhSAHLpDq8JaWcK0GLlikY/miwkkvylbbq9fx03WprfeNaZHtW3MNTBXqJ
 yuQY2F0XTxPWRcfyrra3fW++firxN/EbcI/06SffrVWtIa3t7jQ/C1O/vrUJhNSNnnxeyOeGQqe
 0lE6t9HZvEWkgYQaQnUVAG8ofs0UjPOqpyLLiNy011ITgkLd1jLWTaY/4oYyd5Dxg5oYsAEl12u
 gLULVvRa0s5LbXCbJy2ayIzyykiXw/6BqmtZMFJLMjEveSpPDBi9QDvfQsk0N9G8oOuHa7zmctA
 /uaUAgXDyMNPR9LPGXBdznxeQ2ItWvY5ypGwToMWQucowpq3/v72MvMDL05UtzH2iHec09Uw2XI
 CPBExeGKaYcKE9lrIFkUdh4VV/aqts1RZ6cBNQ3zW38LsgKNA3wuyhFhDU/pnDqCDFqdTAnz1Eh
 tA+sT5nuDYXNh6fnhVo6NKDkh2+cBDTQGbG9ATM9STx/uYlRLcGYvEqHUb8YjjUORfB4rG4e+ka
 YJg/CKABJujYeuA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c313a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXwuFevKFAAggk
 5yMygfSqxWxlDDiT6XyDV0DD8Ho10i4E6XIPUlHjzpq6fdJmC+ZcuhOZFCO9pJ/0F0WaF2UT9Mq
 iK3aRv4fThg/PyX1OuguGmxKqBxn2cQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX8aQFdfxRrywx
 GyorhbHZhMcMOg+BReQkC+cnHmBFQ5m+KkaZpf3LKDGUNv0iEfPGydLynshgSkRroDdPORLtSFE
 tZcOjSoRVy9x4NnPjm6U8CQEsTAGld3AeKcXSW0uPbz04IPnUkMLQalrub613W1MoJY2r9SqVUL
 RR4ufuBa/4LinFiT18pQMIz65J9aJwg4q4DnjoIotBPGYKhTkcL2KP28NFPhnMIeM7oHIrs6sIm
 gcM8eiI+HZaOydpsoLV/T/Bxrx6zSNm0zDSO9IV5H0o4VKobHFgGhyFDUYFb8c4vTLVqPuWyvBe
 GrUTtFECDJ0eW2lYPHGZQ7qea0ql/h2wzKKUtTG094Ey1WUBRLb7ZaJEz/qJxq8EMF+HDCKvRsb
 ZxPw0AnP5sFzkxatUJ6B3PKsFjfLM4ldFv6PSg9XUDyw3d5FlQQisu6leBSqCNby7Yeod7RUF8f
 BWKqQFsR2dfxl0K0dCQ==
X-Proofpoint-ORIG-GUID: KQs5okUmbvnxQsDAjxtVewLmonZ5a5e4
X-Proofpoint-GUID: KQs5okUmbvnxQsDAjxtVewLmonZ5a5e4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sc7280.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 4502926a2691..bb8f6efb88b1 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -3446,6 +3446,7 @@ static const struct qcom_cc_desc gcc_sc7280_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sc7280_resets),
 	.gdscs = gcc_sc7280_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sc7280_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sc7280_match_table[] = {

-- 
2.54.0

