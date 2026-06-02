Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05043438BF
	for <linux-clk@vger.kernel.org>; Tue,  2 Jun 2026 10:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394825; cv=none; b=Limxj2OTEVre4QpOgAyb9AWX9DCVYTlXnYQWe010JExZfDCVDDtn9AV2NzWJqP+7zj8/rsQmkGWGTLNK8kQLXACw5NMVxBhK2vUBSWd9wKF8VuwIA/b6SJfaIl1yqFw7zxjlLbwAeWhjX2Bl7qHBpocVZv9xt4/2+l8fIHxs56Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394825; c=relaxed/simple;
	bh=oFckOThZXrtFOIRAKyJfKzFPakfUuQ6fb+vCXkUj+Oc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=l23qciN2LsH798VT5NIG1/tIlZ4n+U83i9J7VEd39XGWPyxVV0DrOGSpTIVHjhxWmaKXQZaaVwliHHAE47JycC0lZIMr0sdRe3y+GtY5a3g4IrQo+Df2etKKqWzMW/vFtsY0yyuzalAGdsHWMS7klaQRADE5lggYjlU6bY/onGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OuZsXfmF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dAzd905N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuZsXfmF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dAzd905N"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6527gZ6l3302651
	for <linux-clk@vger.kernel.org>; Tue, 2 Jun 2026 10:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IPVhhMpdgL5m6wyGE3iVUISjPwJWp/frQbyzQW9ovVU=; b=OuZsXfmF6yTSQZkQ
	rbl+81esGrMu29bk4kJnZURUQmWbcaoMbupuKZ45WHKKIRBXF24iGXQgoEeqX0bY
	A73luikRRxxv5CGqsT2pO6sUHC+dJGBLRunhGeQspL0SB5VgqARW7qd4NBQk6AJE
	Ezk2305fodIxEcyBXcP2GY5n+4A+9nTsGpRWpe91UZNWtCT7e9OawYvK/AzCQQ+/
	UaCQqtWK4ELJ/dIZuIsH3cat4d2cj7ZRjtDMM8WJo59xQgSyh1OpyIlK3mGpNhyr
	fKfK6XJHJld1usbZhFqa00sYRL6ZSNFNoqLGFxI2LmocOfN2F0ocCs8ol3jutMHB
	WfqF8w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu18gkjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 10:07:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842211d6e48so4125103b3a.0
        for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 03:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780394822; x=1780999622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IPVhhMpdgL5m6wyGE3iVUISjPwJWp/frQbyzQW9ovVU=;
        b=dAzd905Nd4dUYE/mmPEKWYvdslNVxUW8I4krm7WXAeZ57OO8nQjiGhDKb0WlkdRhZl
         KnqoGs9J8wlf3AdWOUvKMd8/IWtZ4zzhnrnn77iYubAc3le2bPk628fgNwuexX9icMOH
         KncwNcmVKCcrT83lmEzwKVcUmu9SHAi1lxpu/SbDAzR7SAl5aYCqOvzJB/doOX7sYOHA
         HioiurXVj+syMNG2mNnQYwauhrr/CbLNcSIppFXdxlKoGfsUOZi58am/jntSI2pJlNe+
         XVj36O42HoJysUbBNsgoeYsUO9OOFlseDROM1/lngzPvdmUuV1DbfwPqWZ6IEWX6Ikyk
         K/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780394822; x=1780999622;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IPVhhMpdgL5m6wyGE3iVUISjPwJWp/frQbyzQW9ovVU=;
        b=kEs+3eMHFkhp8neXuSWsILEm7WmIcpY8XAG+ENnkBSXj/KjLjjWNLFhSOfM2hTxdUE
         1N9y6VEf7YUEfcFUo9WioocOZADg95S5JdHoIxqXPzp381KRcDViP7Xr4JirQyOyIrrf
         UKAa4r9uATFl2cwD0f3GHT84bu3hBVWvFydHqCpN6A/eEr5+9nvbfatNXLtlYUaYJxMM
         oJVLfvCBMHPpdps5JgSXV5pCr0FSdTItLaptPbv1XG7dhC/91vAIfuKzdVmGaIb3m5/J
         ZQPqi4PSgLzg+9YwZcV6/efm0XZUDDots1wWN7CjaKJLfVX+smSKG5WH6zZbhu7wdgyW
         wMcA==
X-Forwarded-Encrypted: i=1; AFNElJ+zAWEk6/4lpPexfpuoWy8UIzZCeH/pwt6cWgpGelg1g6/YU5BzOUTJgqKemAhm66Mb2mSLqKot6i4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvQsh9cTwylWChsDalFbrH5DSSLW+BgGQjoX7HKsamuupdqLBn
	OrQafZ99ouHUQxFDCl5XJ5GVaCv17R+OrH8XEX38iTaCnaROJrPXwo4P39TOs6Vs+H913vqzi1W
	0nWheI6bqxKr/jPHI0lKKy0oA7a2IUlorwHvdLWl4uOsJ5nfG86oJMDzQpJ0CosY=
X-Gm-Gg: Acq92OHfQWk1F+BZtkt4EQ6JK4XU73hwIwEo9bVxdaxil9MzYdX7mu6AN9dFK40pNBm
	6F7JF/hJ04T1E0cHdiYcwvzYehgCPUJWzCjLtgvEKzjqa6iIE8ujkpbpvwbkgKNKkQHTJDhAQNR
	r1N9WKPiZqAW6yfyS1csvjiqSXc0AAIjUjyJ31oKN5dZI57G4CFN9FAtwFmCB7rk+E4zYbgKfT3
	ZMUu7LSiXqL5ds6VqYiRmy1Idclw0T/ipl5sCh+TduXVSfQtAM+B/rkAv7fC+hKH5NTsOVNGSwr
	RUd3VAI3HA80sqzp/oj/Hr2Tf5IOOdUKSd6YJ+c2eCL6h6VF8XhasgX0Tt3NCZcz5zDvoegX41K
	Jr6ufgjmZs5bfYryXAqaYX4FLjczb/TVjExRXlX4w9UuUwCI+ZGZv9MXapgvI34CHefJY/Bp5Ir
	FA
X-Received: by 2002:a05:6a00:408f:b0:82f:5034:77a4 with SMTP id d2e1a72fcca58-842253aaacemr13949853b3a.21.1780394822470;
        Tue, 02 Jun 2026 03:07:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:408f:b0:82f:5034:77a4 with SMTP id d2e1a72fcca58-842253aaacemr13949825b3a.21.1780394822048;
        Tue, 02 Jun 2026 03:07:02 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84238f1ce65sm8784399b3a.5.2026.06.02.03.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 03:07:00 -0700 (PDT)
Message-ID: <d2565822-ab8a-4dea-bafb-addd698cc35a@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 15:36:56 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq5424: drop the CLK_IGNORE_UNUSED flag
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260525-ipq5424_drop_clk_ignore_unused-v1-1-7ec63e347f2a@oss.qualcomm.com>
 <pa3xr7dqro6yxo2zsydnybu6fomx5su2x2ccawjndzd3yqubly@esevqd5q5jon>
 <005d1637-ec56-4f4e-be99-04386efc2524@oss.qualcomm.com>
 <sv6sja7rdwz6ke525e46zpfmtp4wht2vboxwwpyjnmiezibhhm@pbuvqlpkjpb7>
 <4358d0b5-48ae-49f2-a50c-115a54958505@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4358d0b5-48ae-49f2-a50c-115a54958505@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a1eab47 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=iHNwXCkMZG67nHgW-KcA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA5NiBTYWx0ZWRfXwIJjP7Lj17yI
 EmDlZtmMfB5pFkrVixjZIyG4fb8z2mIBV+iPsNP9s91ygz8WLouKuHfM5gVT5IxrNM0JiMhhtA7
 1CL8PABZ333oYeoBHP/+wWX2FmEbFVYLVlvBYSTR87Toph3NwLfXV4WR131bj6n9qL9wdHsLOhl
 HMAiwa8AOuB6XLz2QhcnWFPoEabAbWUG6T7X+LzGlcxXqCor3CPPQroEtqs+v12QYP9DuG+YO/6
 oqiBuv/TPU4BU4WDknlc6I8Xdx/r2XyS3j4pArqpgF56fMmOypVbP48jQiRjEhQO1Ki09+I7wkr
 8oeAnfHSXRP+Bk6YfWf0F1CvwRfqVQ7ppEc6y89vJZH6u0kyZt/aV/P14+zPz+4WKQwbp1ej76F
 VsxzEE8isFxz80wm4TwZN6GbNR8qGZ2+8XxDJdidgXgz8Ij/Cy4dGo+YnDrjA8CxuGd6fIThWEa
 ij6ENZ3riUH2K+J0r4w==
X-Proofpoint-GUID: EEeYZ6keyNopbIHnvs0lBZllk4GBlzVX
X-Proofpoint-ORIG-GUID: EEeYZ6keyNopbIHnvs0lBZllk4GBlzVX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020096


On 5/25/2026 10:49 PM, Kathiravan Thirumoorthy wrote:
>
> On 5/25/2026 8:55 PM, Dmitry Baryshkov wrote:
>> On Mon, May 25, 2026 at 08:35:16PM +0530, Kathiravan Thirumoorthy wrote:
>>> On 5/25/2026 3:39 PM, Dmitry Baryshkov wrote:
>>>> On Mon, May 25, 2026 at 03:07:17PM +0530, Kathiravan Thirumoorthy 
>>>> wrote:
>>>>> Now that Linux has the consumer for the GPLL4, drop the
>>>> what is the consumer? When was it added?
>>> PCIe and USB are the major consumers, which got added with the below 
>>> commits
>>> and landed in v6.16 and v6.14 respectively.
>>>
>>> ab7f31a3830d ("arm64: dts: qcom: ipq5424: Add PCIe PHYs and controller
>>> nodes")
>>>
>>> 113d52bdc820 ("arm64: dts: qcom: ipq5424: Add USB controller and phy 
>>> nodes")
>>>
>>> While I was revisiting the code found that this flag is not removed. 
>>> Hence I
>>> sent this.
>>>
>>> Shall I reword the commit message as below for the next spin?
>>>
>>> -- 
>>>
>>> Since PCIe and USB are enabled and consume GPLL4, there is no need to
>>> keep the CLK_IGNORE_UNUSED flag. Drop it.
>> Yes, it would be perfect. BTW: what happens if both are disabled (or not
>> probed at the boot time)?
>
> Until all the drivers probed, icc_sync_state() will not disable the 
> ICC clocks which will in turn keep GPLL4 in ON state. If we disable 
> the nodes, then system will go for the reboot without much information.

Dmitry, Do you have any further comments? Will that be okay if I can 
send the V2 with updated commit message?

