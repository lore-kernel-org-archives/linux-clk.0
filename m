Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86569285CA4
	for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 13:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048402; cv=none; b=lqIApkNQc/QJRfP0sDyd7hC3+/joI/I/Pa4l2w++oV4J2HOxENrrwjRv0937VdD7ckO/A1HT+Ht1OJsb2d+isCv08gMJSk2NlyWBo/R1LKW9+c3blKJEJuEWPn72b41jWN05NbjHBEVGvo1CM0o5CnDHxH9kNdtSi2KVsaeFKE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048402; c=relaxed/simple;
	bh=hfHWjo9FdSPX2jmzryMtVbG/nLdH4mx1WlJkHIUmHN4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=adSZx5kVq55wHBLl+3Wkybre4eHuOe27Jhu5UBVUAz/Int3qZRYUMIYiwQ9dHtMKspPDtm3fzjAJjVsB2N0Vs79Tft0lITvs+OEYZXcv9QJS9+Is7qTFuJyFmX++HIw+p+DIMcZ1LEVotpMMvjVaUreN7pqYcUPKELf2j/aTjtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cYCNRrUZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IbBfT124; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cYCNRrUZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IbBfT124"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L9ulr92009716
	for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 13:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gw0JBm5jyNzHqpIwq5NkGoy55xlvkBZ7zb2fd6emL1U=; b=cYCNRrUZIoopXNVV
	BkZk86isDyFb/V2tIEKGUHqg+KwqK7JCfhrIbVoYu1hTMktwGXbyYMtF3JY/EdqC
	mKHCDtJq1sAdqUd2SuOf5N5aDvWi08WZSyMXqBcgyz7pAoUkvLQTlhPlpc46emrq
	5o7HVS4efps4ujn3O/nIkqexTkvqswqzvlEj6BwOoIFMFExVetbQNRoITCzvd8po
	R4sbrj3b9VY5kSGfBLH0YvgjdudcCtvNUcJjMaJ9XTywtcetUSemsrFY8tGEVsHi
	88n8rfxegIQQczMJpZdCIxH0fdSjqvxsqQr6SfV0+i+6cruZq662Yz2+7d2nh1E+
	p+OarQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewg7mkd4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 13:26:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso73041165ad.3
        for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 06:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048399; x=1782653199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gw0JBm5jyNzHqpIwq5NkGoy55xlvkBZ7zb2fd6emL1U=;
        b=IbBfT124p1Z9k0CRdbO2M0C+sN5KukZqW1AQS5fkD9rRYQ1hUgkEubnJNdNE4qcajI
         Af8kNTxEDSkzMiqwU+gudnrs5d6O++BBLOkwa3pO0TB7cZbveay9O8WgZyGgP5Bewgw+
         0boX4Dk50675O2ReM21knijQOUsyQ7Y4Ci+AqAShKjeFgxe0QgIKTEpY2+XaVb3ZRkWq
         MoTLQJAQs5eNm6CVtZO7BGz5X4rlU/E0/Q/19mTDzMToghW6kiXyxeg8dfHZmjy+W5HV
         +JhlYLpF8OPuBTk4ccT0kGPVAA8BipQG1Fz9MePNk+5J4Ht/d9Yw5M01kPI4TlB/b4CH
         RkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048399; x=1782653199;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gw0JBm5jyNzHqpIwq5NkGoy55xlvkBZ7zb2fd6emL1U=;
        b=sIz15W3CQ/hLRgp8Zv6HlFx7gAnft/KTsGOacP4gjq0ovwg9o7OQ7JDVhNralvm4/f
         78rinCKqucuYnaYENo1pPFOlRQs5njJfyiG8mOvbARs9H8RSroINR75w4g7LleUGtnEt
         fM4A0AZ1UPmhNWatUomDSOrQFfL8HgTnFSnCLj0BeXWMvTNAoLB4vR/yXwE5C/F85ROM
         KO4n0NUS4pxGMg2UEB+eIyGOTMYfkJDNd2wT2MkcBkgzI2Zj8feafuScXstmrvbKabZK
         Ci4lKz1hJzAdea4zPwPDB83H6kBCl8k1P9105HhfrQAE5qKE0QM4NHHx/RScLi1crCnc
         41FQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAfkuLv130XzW911RmUuS4LgeNAvjQDIMHg+kFzkGrvj1V9WOarA33Xk9an+WFxnESq0nDl15kmW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaWk+xUh91CoENRQ0Ousmp33qjBgyuUDEcMPGFytIhgWyU3JCG
	rrY7lLr29Xfhr/tk7epNsQc1C4x/oKU6OdYTJYFNqJ4XjJURxsgIB9ksGBagcN9kj55nn0Ago6z
	MfZhXiTfZ+Y7Kk3DrTkyJAt3fCr0AOyesb5AVNhKdgNCn4rNLs+qOIKBjNPYGpLM=
X-Gm-Gg: AfdE7clVHMHk3o7C0Cqwd8RHP5azDDklV9Fjb9ZTove3LfH6lVd/VfzGtAje2MtTHhj
	MrY9ZCWtdRAAG3S3286EhloiDnRTbunYJikiahSayVw4CoHZOvx9hUVln+zelLYOdWwMPGJ5Adh
	3Y/sV1vGlztxsGypMU4lzUolOCcMhgvQQ7YiiPFHbgqUDQVRe0cBKinrHnFQ7Y3248eLiWi4ZD3
	DD57BidvEyO9OrB7WqFbUNMAY9BVfSl5+lkFwvSXJNxchgoJcHyaf4kEVaH0LMKKxJTqK7hrRGp
	Uxtespb9J+cGWGHzdSZfgObqu3TQUOeIhDbTg24zBcNFxtlp+l0xELzQ6fHx9UXnC05rBBrZ/pw
	5imjRZYGEFR67KxxA/kRDOP3mvvK7x1rT1R8fcEcv
X-Received: by 2002:a17:902:f683:b0:2c2:245a:3368 with SMTP id d9443c01a7336-2c718ed584emr114639155ad.14.1782048399433;
        Sun, 21 Jun 2026 06:26:39 -0700 (PDT)
X-Received: by 2002:a17:902:f683:b0:2c2:245a:3368 with SMTP id d9443c01a7336-2c718ed584emr114638825ad.14.1782048398998;
        Sun, 21 Jun 2026 06:26:38 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8d11sm50109435ad.43.2026.06.21.06.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:26:38 -0700 (PDT)
Message-ID: <0071c7e6-cd2f-4693-8311-21a112422bfd@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 18:56:30 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v4 03/13] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-3-8204f1029311@oss.qualcomm.com>
 <20260605-bipedal-aquamarine-tuatara-e1fd62@quoll>
Content-Language: en-US
In-Reply-To: <20260605-bipedal-aquamarine-tuatara-e1fd62@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNiBTYWx0ZWRfX5CJ9ZXyo0Ltv
 pJATyGSxrUaj77K6JGlutDp0EtAxtQFSvALvIzWHBUADIT+OAO5IKti8Vec48RNOhe88nU1905H
 U5dz4dTuWHYTjeLjfwscsaV4Z6tnvig2sWxRiVQNjV1HXhD7C1p2Bao14T73m96403PsuqE+jCw
 Yzdw5k9e9iqvL3znkZXlfqnLg4n2419yvGUFoP1qe1Zz4UyNZ7M4DYonzhQb0P0hFsqBCQDfUBN
 EAGYOHMtO8QyYER02Wj2MMpF0JXdEmzyRX3cgHTAMFPwHFUoYJ5pUVDT9XTUMGp47GIyMYlhi8H
 iiLJ5+UeUOOJt8lb5Z8zobevnYQL86ZrwLzyRSPdDcYUD/5qArQIWVYq7OF/KSrabNZEclprFNS
 9+emWA3XlvrXdvM74egBwa2IbsZ/5PJ9n1tOp9TL96hT8CkHqEJ5b4KyVw4VD5fc5g2pVYrFNgq
 zGnsC8W3kjmQ1DaEJBg==
X-Authority-Analysis: v=2.4 cv=IOMyzAvG c=1 sm=1 tr=0 ts=6a37e690 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=CoFMXLd-oDv0mI1FUD8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNiBTYWx0ZWRfX0HSFnCiXp/Pn
 Anev2NVCYSlEbGVlvssQ2Wn2g+JMVW/k5AuBoKCgMUywVfGkmh7qUZX1Eii8I9ufLIIqLp59GPo
 HZ1PWlZrHKAMb41xFRev9VIpTZU4ZXU=
X-Proofpoint-ORIG-GUID: iTWAjonIlQ1lgPr_6AJMpnpH8GAMSryM
X-Proofpoint-GUID: iTWAjonIlQ1lgPr_6AJMpnpH8GAMSryM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210136



On 05-06-2026 03:55 pm, Krzysztof Kozlowski wrote:
> On Thu, Jun 04, 2026 at 10:56:09AM +0530, Imran Shaik wrote:
>> The Qualcomm Shikra Display clock controller is similar to QCM2290
>> DISPCC hardware block. Hence, reuse the QCM2290 DISPCC bindings for
> 
> Similar or compatible? You are not reusing the bindings here, but
> stating that Shikra is compatible with QCM2290. Just say that.
> 

Sure, I will update that the Shikra DISPCC is compatible with QCM2290 
DISPCC in the next series.

Thanks,
Imran

>> Qualcomm Shikra SoC.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> Best regards,
> Krzysztof
> 

