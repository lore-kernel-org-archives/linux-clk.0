Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B92346AFC
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 10:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830676; cv=none; b=hpagbv6oF9rSB6rwZQentuq2w1mHbI+/haV+LcF00MCkPPdacqdjD6sUjoZZLM3+Bnlbzt/5AnvV+O/RsXd4oV+6mWA4uOdqanBJPXrjSndFKRiu28vxfbnNbFYplLBc8txWf30iUQ1iB8zr/XBzGaKLtzAh+vcF3L1xQFQr6gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830676; c=relaxed/simple;
	bh=Yji3btnVfV9CCokEpyjEwbVFo5fodmpKRObuzj0tlvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QujMmaC1o/AG+2NLzEtMgHNqaR/jx8TvHF9AttV+lbjTWhYUGv/t+w15BgB4jn9hByqWNS3E0e6QLIIaZPhVchLEoOOsuPkx9SCA82rljSOg2FXc8ovRCbtrQ4j/SVSHf+DsrMibVnGeeCXvFjbAA6fBP7SKDs6NO6NAzSXQ4kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AWGtY84O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MDuQr1T3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWGtY84O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MDuQr1T3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9760l1145979
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 10:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9YjRCIhwbUqkLyLDNcmvuCBkcpcTL0Nhz/SwuyLvWk=; b=AWGtY84OtoJ3zfGV
	vKnPTHpHW8bVTppFAiXEHFAzjDvTNxUCoJXqXFKZYRkSI/4DBIseFFG4iF+VW56X
	a0twHjgoetrEbHkleGC8FhrKCpAwHXkmgdnW5aDUYyAFKCoNiobrIWUb+rvA7cN0
	TuGOp2NAJw5Uctzy0/Nf2j+ql3jH+M/dp7LGlinItUIyUJlgw0o4XJyJI8a49IMi
	KICoZZMBIh/V6WPvPo8OYITA3BOQxX9E5Ny32wMI6yVUlWVRmw3LN2aowPt+I6HD
	YzlH31aNjbFnH87SfYRroYDUp7WUXp/xR9g2W93lcDwIKulZzfEALlguAVtfp1l6
	LIGDtQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyak3uurq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 10:44:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509118781dcso79045461cf.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 03:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773830673; x=1774435473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w9YjRCIhwbUqkLyLDNcmvuCBkcpcTL0Nhz/SwuyLvWk=;
        b=MDuQr1T3Mf1icDS29nY49eiZHSAkJ0PG4mV7zK0P0BCWZCogrz27GWxPU1Xwnb/n6K
         3WtNkZq3NOIzwpXngRnALXcv4gUn8WbSJxxCos4CMqmaklUTKo/3af16M2Vr2VIGgbp7
         Nc2oI0ggJO3icyU4EOOCUnA8jucYe+swKQcwJpYcVjjiaj2oBZs1L636RvyLPOb7aYdj
         6RVB+34lyNbuUne/C7OTqrrOeKmQPSTaX83g+lFm/OZTHbH3sxd4FYz+cfCrsFoZEW1d
         GEuyqesiabyViamnEr3XIuD2poJoJnN5FReSfhDr0xW7MCbq7IvfG5tsAHi41NIcQBZN
         zaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773830673; x=1774435473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9YjRCIhwbUqkLyLDNcmvuCBkcpcTL0Nhz/SwuyLvWk=;
        b=WxO6aKRRI4AUFj9TEF9+Qf79L4AA5wugSBoXw1/UeMW7yn3X3uBV0rRypCduB4M+Yp
         zVvZtEjj3eCJCCMA1y8V8wHePtvCEPeZW2kPI/jpq40h2EcffK4AYYgCMGMeFhbVE1YO
         PAmscFIw/JKlL/uT+pegAxWk/09yn38YIwUohxIz130LKhPV6srf/I8EzgYgC6EDjtYc
         PWclvB+mbekMwmreTevxTagjKhYkI/4DlM8zHYJyHxhNtJW76v811fpnYs6+rqTUaPGw
         rI33FXBVm55T75D7uZQMxSAFYPZ0iFef/PlqCKGY5IpHdxHaR0K1+WnBJSgDTuqxMA11
         oLfA==
X-Forwarded-Encrypted: i=1; AJvYcCWh5rFP71YHGYnaGufX5RIkACwEZskSQ36bt0bPyj/WtJpHcyyvpKcW0j4j/G70gdQlAYDaLgI1lhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLd71WHVpQKZNUpBCDFUkkJogpVw3KbSISaLWwiRVGBjGBZvG/
	dXuGcLGZuKKftpJB3eUW+TeTvaG4YF3hF9Imeggxb9wMXlhMva5G0ixk7Kq0cyVQpbBWopJnHmi
	bvxrwq6ROUUHy8p5PHLW30ZmIySvW7pQORmqgOCBYyZr1tIfKW12GK+zLL2bGyRE=
X-Gm-Gg: ATEYQzwxSNcqqp2rZYxsJhMcPWw3XLZry/yKTTD4t0X1Vw34oCZJhWGH9SthuYhePKv
	uWcdEO63wd5ctWwOVXvw9FVtIdFnh6+HrlKOW/0wP3v9rS41CfAsld2L/n9YXCyAV17kNK2AIRr
	9iUTP/hXU0H1rG31LdSyZPDneWx8KqRae9C1qYPE1GVGKwwjXCyrc2+R2xTBEwJ2sImqXJPZV/q
	Zt20yuGtSG2XDUREEdkij0Bgdz6g+4ZTykeJqPaBgCnha4s/qEbvSyik8+FTf9W4GQh9eOayqqA
	wptz3u0QOEO6hqr8nPurIDatwJbaEqgMQbsyce/3q4aQ8OPSmbRPH18tWdWgnfusiplsGrJYaqV
	HShdMLlcohKE/qn9y7xt6YVBreB6dKA+c7hXbEWVDTtmFHTg20Bcn/RgSd4inHlzzAdnEMqUwDY
	4JXSE=
X-Received: by 2002:a05:622a:50d:b0:509:39b5:a97a with SMTP id d75a77b69052e-50b146476eamr26767871cf.0.1773830673138;
        Wed, 18 Mar 2026 03:44:33 -0700 (PDT)
X-Received: by 2002:a05:622a:50d:b0:509:39b5:a97a with SMTP id d75a77b69052e-50b146476eamr26767671cf.0.1773830672775;
        Wed, 18 Mar 2026 03:44:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f13e9941sm184320466b.3.2026.03.18.03.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 03:44:32 -0700 (PDT)
Message-ID: <f1e369a7-ee5b-4342-919e-abe541611f38@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 11:44:30 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: defconfig: Enable Qualcomm Eliza SoC
 display clock controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
 <20260318-clk-qcom-dispcc-eliza-v2-3-8c05581168d1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-dispcc-eliza-v2-3-8c05581168d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A7Zh/qWG c=1 sm=1 tr=0 ts=69ba8212 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=iyqEaw9I7auMvmsjhYoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 7ZQiWVzIBX3LEZWSp-33jZcsDMVRqPrC
X-Proofpoint-ORIG-GUID: 7ZQiWVzIBX3LEZWSp-33jZcsDMVRqPrC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5MCBTYWx0ZWRfX4aDSVhvPcqWF
 3NINtC2kTsx6QgwU2vwCJ1Dd0Mn0+TM074I/DXW33wdGq0vx109HqP2L2ZdVJe+Sk5irpkSKinf
 Oai8XEnVl13LkN0kM1+OJnZ0nyJ7lb/x+p44BbzzzuU6PtDNWltP0UeFvG3WHStWP4MXrc92vWj
 whAUKqyEXb/HMrJ1RzuZb0P+dLQk6Nlx5PTq81tEpFar0PHHKZHMJwoYngkKcnRrYAFDusAEMjE
 zrQhhz6lr6t5PLiUSWZiJdCYa/qiyATighl9868Sesri04fzZE8gCaVjtT4IicKGyU45kuHQBal
 kGIp238wHqS88vPfCxt3EPNWA2E3wPABlNyhKN+pn5PuzlWnyzGz1J2HbtuPRs6bU/YHKGu0OGC
 +MWEQwYcIGYIlL6PaVNLabdZPRrRHqndtmBckn9pHsJiFwpDHoKJ7zhK0cJ4uQQSuKzdFSNx/+n
 0Vnkngy9YxgBVhNMyyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180090

On 3/18/26 11:39 AM, Krzysztof Kozlowski wrote:
> Enable the driver for Qualcomm Eliza SoC display clock controller, used
> for example on Qualcomm Eliza MTP board.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
