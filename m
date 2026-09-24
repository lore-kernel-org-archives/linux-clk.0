Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A09C480976
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246460; cv=none; b=fmPsv2WRzqmsmUF45UfGAyHkBE6fQs70CDBWixcbz/B/KUkPVO4p8A0SaQJdTHx0GU5n75t27eWIoCYrq8iCj7MRAv7WSBI+Vx2h15Eteve3NSQOwX6Es38kgHnPlsw7DWnrAY1VwbYuWpxZYlJ1+HSHfnctpirNKeLsIs8ixHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246460; c=relaxed/simple;
	bh=rlaDdwuN40epUY1QhKgOTaP94Fc4GH3BVIniMJyBXrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qN+AmiS44bCp5ZAo09aV3cgAISkG9eGb5yrJEidhz6ksXY3A+EpRspszMyJ7DuU7FW6hMBsQkouJ4zGM67IrJ5N5+q0OqtDL/aoEWMMZDerPXILFxOMfG9hn1VgRynUzRlSA4+pomyJc27s/7LlnsBDo25uOPhcAY4C2d3KWmU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfJlkB40; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NswHOQtf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfJlkB40";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NswHOQtf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PuEI1644510
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=; b=gfJlkB405b++OL5N
	op6WolJSASwZhA7khx0c9jVI3MwYSB4FFeiqpxG4RRVc1f18cjtDUS5ljzYRnsBW
	VOVEhgGzMdtceodX3CRBuwCBxm0yppmTjLI/rHUMKsXf4ztDGTXqqaGhrLdAB3/O
	AIa8nlctt+CfYBLWwsQFxQTO+kn/q1RCOvvkXNywIEbspac9V4pFUtx6mNQD2UC6
	tUwOAxB9lXZdeS4XQbY64qV9zfm1GuaXIqOXJ1MDi452NIZxVJHZ+4QnmXjyrlwJ
	8SoUfBzOVwW0stqETVSGH0uAyRS9/jgRnrwvVDrBd38nR0xZ//BsJvAC9eM0HIgB
	CUWJsg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrb404-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 10:40:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso162487685a.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 03:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246457; x=1790851257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=;
        b=NswHOQtf8uac9UgihZYr8vthKStxrBYb0QDv2Jm1IRWfmBeiw4aqdUtMOVQHFjLvft
         ZnBquNLlLiA7QSB5mhXuMbEBXs1KfEQa6Erzd44HHZXhx4o5zEie0eH6UmYA/5ddOl2t
         QzCAvq5mrwWonr6xGtXaYj5tP5Kmxj+R/FKMeLSqH1jlw122jIlAYDczs58Gqm8Jb8RI
         31gD6ouTodV/3AtFlwCpwkSqr446qpH108wbJ/m80z5kH1d70Zcdb/bISzvMqEIT5s27
         lCcWSyTDOIAhArPF8/H0ULZm0jgxzwTa9ehQoFJP8nhfYeKX3UtIJxKMXsi5vnk+Z9TU
         NM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246457; x=1790851257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=;
        b=bttv/cIVQwpMK+pSpMEqto7nIxuwBhOOa8qRx+RSEpilW8wnEvkuSPmJtZossNJm8U
         FQhWKSgLgS/ycsacNcDeUitNMhMV8wDIkHjyI6GcuiIzFvcEuxaVsevpPKcgOQbPCEq+
         UJjq2plD7nM3rHRkSqr7j/F1Gy2HfbcqUXPY8vFWvLtxFehZbEOMccUhboRGoFdj/7Mo
         NTHF9bfiXpQsO+jJc/5u6f6mNsuLmVXb4DPNvRSpv5qv/e8ixctALeLaXabQRkfVO1Ez
         oW4I4D6xbYu6pIJ6wQErjDiJWUoSVSgPihzsmSpH0pwJ5ylZRQoCBO1rznOVkbtFvNWQ
         LwRQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6dv8QMlmIoU/cNv6EflCTbCniYnrP5R+cvmO+/muyAF4VnYHO3PHaefE2xQL2TnoDKNUZPRDWp/w=@vger.kernel.org
X-Gm-Message-State: AFuF++mXQLFkcjHB4H2aoBxeXVI3w+7FZSzqpbgmpQLiS05QlIZDPxCn
	AOfvhETfYPiEQRnhz6YLtqGXA26Urt5R8VYbPP+izq5uiDYca4fzUNvN/fPf7SxcCDhfVQcpvno
	KiFfvG8QYWx1CV4w3hAUZEIinp1cj6IMpZZV1JPoNg/pTpz+GM9i3qyAu8xc887k=
X-Gm-Gg: AYBFou3TlumOM9uClU8d4j9VWppeJM9bzLBKQGzkYIZnOwwsIflk68PqBCkdqlBjdLB
	HO+ymfnZ6Cg5TUlpfQP8/Xh5amahNdrCTq936U5fGR7rpNu2cUkdJNmR3cSGrF4PUMfF65eSFnK
	nCZp2mD3VDl95ij+SPdDBIc0si/KHJIL4WJaMF1v2wke3ZSOGjuyFU9KgRMgasqskJBXfZ2A77N
	/sEWQ4kHnPClSQ2bJvV7n9wnYlrt9K4QWTFQ6dRBj4BCzB4eAR8gqjt53NnzYDASoC2P3dsTKGU
	QtPltm2hJ30MfroFt0TniOZKPb16NIs+HoNWXys8JCtIR/GSt3WB6s3enwe2YsmAcElTnxdROMw
	UdQpNswsB
X-Received: by 2002:a05:620a:2584:b0:939:fcf1:5c27 with SMTP id af79cd13be357-93c36654ff1mr207737885a.8.1790246457007;
        Thu, 24 Sep 2026 03:40:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2584:b0:939:fcf1:5c27 with SMTP id af79cd13be357-93c36654ff1mr207732285a.8.1790246456397;
        Thu, 24 Sep 2026 03:40:56 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:33 +0300
Subject: [PATCH v5 17/42] clk: qcom: gcc-sa8775p: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-17-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=rlaDdwuN40epUY1QhKgOTaP94Fc4GH3BVIniMJyBXrc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3qwI9XIIYy6eZAKKx1jQOfULxdTshmcpiCV
 29TYHy4G3mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT96gAKCRAbX0TJAJUV
 VvzbD/4xw6e9Uo9c0purWmAoVYIptLOFvt++YDlJURkP1uCtjQxzJPvdaRCxuB1eh9yBJWVd5JD
 SgcWHuXoPoju9nTdu4smidfgRtFIKM/Rnfbsp4mTgib59WNANbBSjjb+g8klF0/on39AAWI3iCH
 CqRFLFPcbCfog/mt0O7RDwmNLzUrtcZe3wOp3/JjMJ3AN2fPC9ItmNQIwssAIdGgkG01bF7WHuO
 e3hIWHYxpO6rbuouIPU8wVkmnjZPnEQiOHjVRJuFSRfCnWpohmi+k4fkf82cxsah86m3k3M8mun
 2hsCacZQwhJnAsHQiO9sLvkljYiihjKoRBtDobVMboVAyKHhR6eQi1WuViDJ2VOialwj1Z08Xwg
 SKmbHiHzFiQS+Uj8yh/VchEyUpLWjSqUf5OHMb8TENmtykf2Y85ZbY5ny8PHVJXigmWiATqtbYi
 q8YcX5E0OO/slWeI3uYEyEOwkTpCxmTGq0NdEiarD6pE7F6Klg5zkfjNt6YZWFfKkMWC1QuWh5S
 dlICZ4bcZQWKNZaMx8fykCwsYDfB4pjcov8CTZGxn27QvFigLO83uwYkpFvxTR+jLAqtXAXrlv+
 i8i6kN6APOXIJxTJ5d+mZNLBPQQYXwTsRbcxKbw2tiZRgLDAQH+5oXgZLO4ot4P7qV+sZ7YAmZV
 6L2cX8mY56/LSPA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX5JqrZDRy1olW
 rqAs6EEKtRmq0EkTlZgnOrY6yETiU6czjtB9WUze82fCJq9+f5A5WLJ2mACpr6wFZJXziAB8JPA
 h+PxPC11Fv/X/2EBFjyzFZsIKL526ekflLykgO3xCuRIiLHSgoAttTe8BGNkmEFlsVXyzo4nwsl
 HEjDBGABd1NFlFyz65fgdRv+MxgomzkOYnbivu5/Za0qrwCuCp0+foInGR17Iph8mKEzmD4Pmq7
 98E4bmgAFLOaAfKNGDvvYj8zpHI2fxO5yId3Xwm8LffvT0c432BjpsD/w/NiuX4gO1V512ysr8W
 6yBWOMNDm+0hoBysRaP6ZfAriIp+giBegRtT+EuXl+r5cRIh8sDGo6szAwU7Sh/kfYbbiGXQ8ch
 vGBx1WemSUh/MVbEfeNX0EkG3j1EbCF3FKegRIelyXdDgtjFx6T46Mmnpe1ertxqNjW5m/XqAJU
 L4v2M3cf7gqnCoQThIA==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab4fe39 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX2+ah/ZTkcPNn
 1H2Q4l4tfP9fq5UzMevTREAqgt3nsvgjqN4PqMmVI/eWCQisvIhO/L/LyEW3oaMreIk23Mwvfkd
 KNnMKB5UslQarF6HjA34jD5C79ykG0s=
X-Proofpoint-GUID: PiYGq8Xi2Jsql_sfv6cUJ9liILjffQn9
X-Proofpoint-ORIG-GUID: PiYGq8Xi2Jsql_sfv6cUJ9liILjffQn9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sa8775p.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index dca316decd0e..2f867596bbc5 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -4652,6 +4652,7 @@ static const struct qcom_cc_desc gcc_sa8775p_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sa8775p_resets),
 	.gdscs = gcc_sa8775p_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sa8775p_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sa8775p_match_table[] = {

-- 
2.54.0

