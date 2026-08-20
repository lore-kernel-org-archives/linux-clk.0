Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29CE40F742
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220536; cv=none; b=VxFllwW2rhnMzX8jkczm1x98YvTot5VzCQNGn4mJwYNRkfTSllK0sY2jU9ow9UkxHL34GIhUPgIswloUrYrAfEW53NlliAtgw5gj8VsZgFQ7eWU8Ey/u+wERq0Meyy8FWbRf3AGa72csfkjGfmz8b2oSYKj23j5T+VnTM4bXlqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220536; c=relaxed/simple;
	bh=FcqtxdFZpVp3nYLm4I1E4WQ1ItWoFsNTPCkYOdg4+s8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L4j/A/n5YELjVKC9Unk3GrlyPgR+rks+duO3/EH4XZos54xJjk484lZebthM7VFaPelzpKDCUfWe87+2zEpS9hNf93EcMrz8cLw/FBB6ywYRMUIAehIUHY0ykBcP3KoiczDFtPKvYncBL5BGYL3KX5EsxbL4cJlvlVkI++G8Coo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mlPBqJBU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TccdmKj2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mlPBqJBU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TccdmKj2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K7LFvd2753074
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ls/d4OUPPjQ7nD5srBLCJAuyyXXGG9hlwOP3BxUVXrE=; b=mlPBqJBULjYXg08j
	vEEgG5Xi3okLgDfWqX+27ePD/po9VfhchxijxT1La1WskpwEisJaV7Yyozvm/o5O
	gEG+3ZdG6SLk+2Y7d8E5DEt3P7Y04LryeMAbe6o44BlXQUpTTf/4nvjbTy/xFMlS
	DaVgAhIF5VZoATa0b2MgbFCf+1eXjgGgkM8yOiBHzl2y9NHHtQL6bACekvmQzjYv
	cbT0tmlGQkPnmfKU5P5P3f4bJrxDK1sYTL2tANKe5ACt14jjBYGIYdKwhyS5j+uF
	Lp8nXBnLx+WMopWarCKDg8A2ImRnyb1FH8Iix9b1DR6JqbcQNVwOkPZkeSvxifRI
	5zFsbQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w498mnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:08:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934979ee9f1so256156985a.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 03:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220523; x=1787825323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ls/d4OUPPjQ7nD5srBLCJAuyyXXGG9hlwOP3BxUVXrE=;
        b=TccdmKj2f1AyFErjgBrD+XV53O1LN/ksfNZfRry6PREufAjHlOO/pWFdVzq/swFy4J
         1rAKfJ2Vaxg5iKDJg5onVQUaHjY3FgB3oOHHhjNvgZKuxHJnA7ccOh3Oc1KV0vF0isuO
         J4BjmQ4jsq55ppH413JZExvAKb/40TlsVDoOv8S7au/vZRY50ROg+byc3TdfpoeouMq2
         mlzyuzoKZtE7mz71UHLA0YbeB6kWJu7atKgOQvrZR+U/qLQN7uBpADhJsQRBKIbnSRfl
         IbMiLmJuRVfP9kuorN2roFRlutGPmzQx0I1d6nICj4kyenEZ85vgFbACWhIx4jxdBE5y
         BYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220523; x=1787825323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ls/d4OUPPjQ7nD5srBLCJAuyyXXGG9hlwOP3BxUVXrE=;
        b=En0neWQICN/KVGFxVAMqb2aUl9oA6KFkT65iSpqQomjMlmxspzrHwDLOLVo6wfOP+s
         KYbhn9DWMZWb10utj6k6s0QIknbHx8WvUhvDfC/slgKzuCYirpI1XDTgMF0R2s8ySqIi
         LBZZ83MbzDG06dA6vL9ghgHKWSYtw8FHBGjm64VRIzvMxTbxrz6DgBi4xsQmC3HHBuxS
         zSW1XZr3kJ5y0VmzK65G5FKInN4l2pI+gptUw59HpxydsZ29Mg/0DzAa9WINWosrM+9d
         pFub00Mv8kTC1zVC3DiS0ZF6Z4IzhHVd2zP3GodpiZTaItbzAjk0phAetD+DFHBSdMwu
         gtpQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLq37LyuEok91eBijuiEOq6WLwSr4/fjYwY4lSmjppCHrDplp/DNMwc6xnIczjMxZYgKMsDUtAAXM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5d4Z2eSgMGr6AgMz+fmRW8xME4Lmjak06/dDWnJyjLWb7wMRs
	sHLIFHhkakM0rqRtIUGwCZsm0FY7uM60m6RjHj0S8/9aLuJC5AgxnENuyLATN1XGCEDcelv+q47
	wgWFghyGaGWUaIS2DIMhpFtbwsPUTER7qARWrZWslQlpPdz2YMPr9zS2mQYx7EIg=
X-Gm-Gg: AR+sD13KxsC5z8NTmPBEw1Y4jHp/cmtEuuFd2Pqnu/rqq75pqJ00KvCJax/6BJLliUZ
	hQcsQG+FSOvfOo6+ToHEwpvPww3bsnVSd/LZVpaSDBrn8FLvOfSUi6nfKBjXLRsGf7XxRIOQtNl
	xzsykPDz/mkaceB9849g5sWQGChJAj53wMuFi8gT6fu2do56czX+Y2ppDcQhN78/sUhlLzSmYBr
	Ka3GdGNrhwJo89GyqlKU6UEcWXwQumWr0STPe9gSwTJfmNzpcDfrFRsmdXZldc+ONhycbwZHqHm
	HAvuGBcwRNMSBYcr0S4MX1SK3xn9sgPGeNntvPP2QNVyKUU15oCdywWSK/7MgIKcaUhqtyXlnhY
	YM+SUj+0X
X-Received: by 2002:a05:620a:2808:b0:936:41fe:2351 with SMTP id af79cd13be357-9371e6acae0mr1021503585a.30.1787220523369;
        Thu, 20 Aug 2026 03:08:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2808:b0:936:41fe:2351 with SMTP id af79cd13be357-9371e6acae0mr1021497085a.30.1787220522793;
        Thu, 20 Aug 2026 03:08:42 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:08:41 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:06 +0300
Subject: [PATCH v2 03/16] clk: qcom: gcc-sm8450: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-3-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=733;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=FcqtxdFZpVp3nYLm4I1E4WQ1ItWoFsNTPCkYOdg4+s8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtHiBThGaPKfvAFq4lgL/mlZl5zFKxgSZQzYW
 2dqZbpfONCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobR4gAKCRAbX0TJAJUV
 VqauD/91vkQVe78b8TwjmIucI+TuNFNTjAaYmt81IAMCZTCDPB9En7dut/mIibkjFOlSz7Ff18Y
 AVXgaRo5VXK/Tp2Z6GFU8gUUpgyyaP9bHgT90hXnDQXfjM/oLA8st+pJXzX7jPesgSCwd2IJv78
 7TQarkZbfW7UhMb5lmhrjRhCoFXNpQzZ85xhv37nqVrZbqIwmlv0GEINwYWOKPJgcyCZcdgIp1F
 E7gh79Rsix/AvW1/0UI2OMPIU/nOZmp4I2vhg0rRrEoajnDL2fSmTtn6pm8m2/GUnXmqXT60tNu
 N9f6Grcb9Odk7CVDtoSurJyRLS+8nX5A8WQqM3VliYJfWUXc67hSKAIB1PUC9zpAYeR1vL181Yg
 s3O0DetUS2ezpnqeS/3wi9sPb0RX4ozX/hBU3OZWh8WtZucjZRFwuS5FeDg1N24G3Zg8TRWgZgf
 o4KRejEt+dKMg6+vNpTpq8stFi25wdct2x70/8YKBbM7OMkxUrQCqgX+ZGRdd5nx9PgY3+amcPB
 iYr0AU1Jmc57H1R6bCEe34rkVRau0qcMXb/holS1akF7A4Gxxr4nntjs9VoBNeJqYYAZ1b6oxMh
 d7kDfGIveTlhpQRb+WEfC24d+dWXOa55lAu6U7oOXhF4CRxNx+E/k1NJm/iiQf65aHYhSf6Eky3
 IdQhirQB/He1bBQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX4e/CPWymeFfr
 lzwz+BtdqgwDpALVtRG/2lZcuWGZ/BPEi6P7QCm1sKEzgC/kmJ7NB2xZBizZ7/wkU/9KoObDus6
 cAQhGlO2UljZs12uQZ0LJTlFjzVs9n8=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a86d22c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Spu_5nIJ-eiCmSjGGdF3mfBHHof93etu
X-Proofpoint-GUID: Spu_5nIJ-eiCmSjGGdF3mfBHHof93etu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX0ldi/YBGyB9j
 nPIEVvjK/O9p0IdQ8cQw+NLKKPKZoT/KtJkMAowJ+q70ewGHunCH+KJIYf/uzCPMNSvUy7bJtVl
 YbCxEHK58htl+M0AnW2DbjROrrRJD1cia9tfbb/abROxGy6RD9W0Y4pQS6eS/SUZdHCzFgcq/sd
 Eqq2SCWjbm935GBw0ZCPhOzqbDNF2eGtRg0QEhDhOVMKzHjYJcbJASKJJ//X45eGX7G3q6Btyfc
 OXLDm4m2H7cJm8fHEP8zp1YawxDF1JhYISsHFZJbIXzQI6Hgl9W63xFHy2AANQo6C70i0DhfCxx
 vEIgbdqYCS19os9tm8qLB+knnBAQYwph/kaFoPkhbgSJf8kqxSXUyY1hoqPqfmhop39mn7bqEYf
 h81ZdDs9bBRMo0vsMTVP+WMDwrsnWd01SHT1chO+7sj2jHwRHaaGm9nlwu6xT6tKUr3wiaQ/T3Z
 035W7jggXoq0HPfutVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200074

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index b18bb34889ab..b3ab458048dc 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -3399,6 +3399,7 @@ static const struct qcom_cc_desc gcc_sm8450_desc = {
 	.resets = gcc_sm8450_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8450_resets),
 	.gdscs = gcc_sm8450_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8450_gdscs),
 };
 

-- 
2.54.0

