Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A906F386572
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 09:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257917; cv=none; b=ncI/dpBJeDj+c8eZBrQoPUS4gQGRGAHyO0cpIp7V0k6MXW+dMWTgO3EMPw5tuduOIopGtlei5VQI41jxX/XzS5v1ZcIgeMpkhDl44dtj1zQ+CwknZPxLz1w5DLeilUaK3lUrf+wecr0yuRr33Baen7NReHjkpctaGHeklA3n9lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257917; c=relaxed/simple;
	bh=fkzyrRfvOep205PPN2JQYaKm2TXbSFQm30ctj7v+FRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oOaJ9kxVg7nDhpbr9UW4VldexejgAW46moDwKaapYCDMXm2cY+eoVKno36uOnSiklxqgwlNEI6eVOocUvYO/T/8d/kUrHWGRBe5yD/6rj4qplDjkOJi9VJyT3QCOF4gukgTTntE4pd3ZcKMuW16BeMlT/KOnXb2b38GXWENMYmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Da0EFngq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ES40Ybgy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Da0EFngq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ES40Ybgy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5l6AZ3769023
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 09:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sE9eYP9f7TvVimCcBKQPh/y7RUU8Zp3HBeEedcuDQrI=; b=Da0EFngqA2GZY9yQ
	/x7CeRvEu4ZMpyU/ET3laPVPH60/2OsR/fJk/eZuwG98/Ckx9eMCqRdevf+3AMDu
	0aiyy4G/NzFqFCQhJn5f0d5s4C/VSJQd5XEh3KnBFS/khTeJTrA+BLv9Pq8zkhLY
	ivszt0+O35STGcK6Jkrn1/VZhJ2rzzJGA9RWR5XgWXCmkhs2WRn3pcFx0Qum+K/L
	XD1eY0YY4in404pswtn55WkScBlh3eUfHIX2wSjAh3P/s7zC1qX1ZzYrTs9MxcPD
	+x0JqVUgBNxgzOW3Jnyk5ODg5lMdbCYUoO43I9Hy2rqH8MQ9Bs4WjM/JE+Jslivp
	zLB9/g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jwvmqfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 09:25:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a01982dc5so40099256d6.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 02:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257913; x=1774862713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sE9eYP9f7TvVimCcBKQPh/y7RUU8Zp3HBeEedcuDQrI=;
        b=ES40YbgyW3fGt9U8w6wSge3Qd9YtoZ0ksZTKhrEP64TrFKrviaidshwHI4unCVJ6Zq
         mfEU8CODwe6Uq07Ibw8lGXWBtyONsQQ7fKmTTeWE/GzuprgMFqyzIMT2mCY/UbD/Ag/z
         J1tuymDAACmPzAvJnP+6EGi2GtcS0FTZs4vg/kTZL7vTzqxZbwOnNujQP3Y5ULyI3ZIH
         1q0WXDlzBTMwC8XwUjidvFmOVZJPQPRzEVJ8Q8SIYJOio+OCUV/t1xcAnMLk6/zWc7O+
         Zesi7JJar9WnV5SgaKXl8KgXCGimPglp+ZRvpgPnBBDCN9yZKEvYx+wNqrEEdIW0N5i2
         p78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257913; x=1774862713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sE9eYP9f7TvVimCcBKQPh/y7RUU8Zp3HBeEedcuDQrI=;
        b=nPXXWdllPrzYVFgEjYEIHMZvSaT3fYRXt69nVkhEHDYS69iUoDpY5sMuEpH+JHlpmY
         OoWrdomPYULDbFkTfLYThVa2Np5CogJvV/B93nWXZL7Ww17ZObB3NxAhsIkt/jqP6lxZ
         ClL3qxotxeixZ58YVxE0CdivRLdIE8W+y9hFtztnJ8yZ6bKiDR2Bh3owaotz7CfLUzfq
         YDHsELGdRD+oS1ZXtqPlNFCbN/b2aaUFXUmppzUqjcgbcMW+xLmeBKX6KiVw2lcenXrJ
         LqmpFUcOJc5t8m9yEX5dMj2qgkHZ9cuFfV+StDvmTCKTDLcPSkIQkG+uwhwKYs1d2nD7
         FtOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXBE6WhcBe46zZjdPEwS3JiRrat+rr35NVdh3S4WtX9A7lmV9orMWz815tRAXDUoCsnXgkr75xsoU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyd6Cy5DtSkKofTz4Xs6uuTIA6lTBXl6LR1eJ2b+8XeN4oAaj1
	n6MqXYaQA7N6fqOV+rW2kVMszzFqIH12B4Y9wTXShINT4W0V9PmtKZr5yoS24t0DKXb4ouDgMK+
	7aiOSs48k3b2Lqy5vzGpy5ZoqwaNWtHBILRlL7ygWk544/vL9qNNFFbEJDLGWkvI=
X-Gm-Gg: ATEYQzyT1DKWootJ5ubLToHEYY4TXSvK+KwESBRpOAyK+WLvHL54vJ0OizJ7Ya3Vtf1
	sVGAscofdsSwJo5H3zqBEeCQMDzSq2WdzvQ/krwT3zdq+5kkjH0pBMaTouXqaLYBYy4V1IgeTwD
	d1SpNUMT25D30tHvGpov+Y30sO5Lk+CikBUhnRXjgr+w++jirJR6tWfvHzmG4RJPKk2e0RskNCi
	qTuuHSiFXZRigC/LOBQqB6fylx/wsog6SAMQmj1IjNu3BXWuH4KunYzAgBWUsTpNMjgyi9U5HS8
	gyThAR2wVbwDyVCKnO52kEWgGhVah/GOAbOy8tMFcJCH2Qhl0CsunnQDnopZRY38AeRU93sp/Fy
	26WLDDcqQbodvs0tegANTR9IbxJSZl/w1IQT1kgFtlqa6GljH3IpmshRPoeTIWoXPSfxZDA5oMj
	LeI/I=
X-Received: by 2002:a05:6214:62d:b0:89a:4fd5:6998 with SMTP id 6a1803df08f44-89c859d79f3mr144004596d6.1.1774257913022;
        Mon, 23 Mar 2026 02:25:13 -0700 (PDT)
X-Received: by 2002:a05:6214:62d:b0:89a:4fd5:6998 with SMTP id 6a1803df08f44-89c859d79f3mr144004356d6.1.1774257912595;
        Mon, 23 Mar 2026 02:25:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983388070csm460842566b.60.2026.03.23.02.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:25:11 -0700 (PDT)
Message-ID: <405c4ad1-a31a-4f51-a093-bc99b0218cd2@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:25:09 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-hamoa-usb-qtb-clk-always-on-v1-1-a29ac94f20f5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260316-hamoa-usb-qtb-clk-always-on-v1-1-a29ac94f20f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfX94A33tAMW1eM
 qV40r5Fx2B+cpv97yCLFyiiBdlFJ8SvjxfgaUOV6Q/ouc4mn0/svpPq0BMvge7XX8hMIERxEEs9
 17XG0oXNYdI4g9BkJfrXv7aeIZiyLWFfh0yQ0ft6yY+GBkEdpqH8QlAXbO+F5XjYd4FLGnUGDmi
 JF3dBzWcaF9hK1gNaLWKUp/mFt8Z9zp+7W0vQ2g1ZT6eEd9F0vfRMyg0QCU74bX0I9EitozzWAU
 T0Xn0KMTTVFuEgDcuL9jfQC85qW5HEBXw9Sh5/6pVSQRNSiPQBa3Dz1z1j6zun4yKppTjPHLV62
 y9D0f6YGTJquokToypaf4jeFXKSKF1pS47bADGRqRr1Zm0MwNJXgxwBW87ALObuGlGbMjduO/Hz
 t5Da+ruh68bQPXtSZLZKrxIOZ6hUFBCVNfoFMhrhZbJ9j2QBR7ny+5TQ/sIXdwEIOvAzg7kfGLx
 uhd61hW7CWTdWXUUnCQ==
X-Authority-Analysis: v=2.4 cv=bcdmkePB c=1 sm=1 tr=0 ts=69c106f9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Pr54VSv1RYEdn74eQc0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: pFWJF6X7dJKXl8t98qNLa1W4Hw7w5O3U
X-Proofpoint-GUID: pFWJF6X7dJKXl8t98qNLa1W4Hw7w5O3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230071

On 3/16/26 12:08 PM, Jagadeesh Kona wrote:
> Keep GCC USB QTB clock always ON which is required for SMMU
> invalidation on X1E80100 platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
