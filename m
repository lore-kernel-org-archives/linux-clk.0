Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D152BDC3F
	for <linux-clk@vger.kernel.org>; Thu, 31 Jul 2025 10:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753957558; cv=none; b=WTfJx6AD4O1jtn47tOK74wCHVBsHhuzmjyJkn2kdVURIigE+0/BIeBIeCusKRrqbrMKoFHKSu7ExJcqPNDkz6hpphX8uC7ii9Xij+X1GtmQkob2ywT8jGngKueWLahwxZPlkPktMEMSOpe82VXBltcYJDyX8i2HWqdGQgGhN5Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753957558; c=relaxed/simple;
	bh=pOesqc3nlck8rVFgKqK9ggTjpcYdy+Gbb1ulQcN/kpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pHO8RpqIIlzipM0J+S4FXfgmt0ACsVE/0IsTSoOIVKA6PKh/eaeRc6lETMXkxF2wvcMzlh0H3AVI0Ml59oCUXVPYLRdqtL8NjfmMyExiYmyfdyqfDi/HTg0dUMXWSXzHc8LLVJXMwFftlBlM4HP5zh53wCntWbGJ0yigfIiQ3uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzxX0n9V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzxX0n9V"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V9fUE8032060
	for <linux-clk@vger.kernel.org>; Thu, 31 Jul 2025 10:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n81MtA2X1Y1YyhrlPlq4hNnzgx9bpd8NuR1dYQdg2w4=; b=UzxX0n9VpMqAv/sn
	DpQk+9hh32Id5CMtjQHZVMIj8CloLbAB5X9GBYOdZ7dqXcgnxx/aig/HglLZDdli
	WBWJ3XhxTcwjLHSA5hbTbu1f8ugrdVe7zHufvUPyIc3+kdh2QDEJvdP9C1newZ0u
	+UZO1FlWPSL6nv3kLFkCfe47JpBQQnyQ3ieolsAf8KdJ+ZtLTvbcZuXBhB5SKyW1
	5C8colKztf58qZHq9Y/wsWf0be+JXGKkRmsx5P6nhKG2PIAckx144noYkkUwZjzK
	BpNLEf382+fudtZuWyaPSEqghckUJebm27d8mJhgc8XrD8E4bfgBqJ0sBh3sL6nC
	Z/YIcA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyu7qdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 31 Jul 2025 10:25:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23fd831def4so2198315ad.3
        for <linux-clk@vger.kernel.org>; Thu, 31 Jul 2025 03:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753957555; x=1754562355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n81MtA2X1Y1YyhrlPlq4hNnzgx9bpd8NuR1dYQdg2w4=;
        b=ZiBd3Mar6KCgQZ6e29qgThGcLi0twE+b+4OXC44DjwtbZVozX/VlZ0xUH63Zc4ELCN
         bC5tG1M66X+S/Y711Dcbo5QFwsXkV+BG465na34N2yjRFcLl3+96Kd7uQVoizBi1tbwy
         vwwfKvHi0YTaYn1AaaG6gRc4WAaMa+lWktzpcbGd0CmtGQ63GDWKoDvcCZfd20Rfkih9
         kx2DXytQ/n8wl7NVhDipc0MVRXECrG5Hjo2ANc9VJNdWUh0HtcSPSHVfMEF0uCa9xgtm
         O+v5m1Ww2Z2Pp2EpU7lWUFZ4ZH+72NzmqOmqMyZTFMm4RI0KJ1F26tpJ6e96H813uyYa
         FMew==
X-Forwarded-Encrypted: i=1; AJvYcCV+0hHBrIz80qRWzVbBkKoC2DNoQimwlyOIU5OS1VfWRUGjknFWZvh3pDocJT5ZipYRbz9r6hMuUcY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6BsJnLdCU5zbxQudjK3sZ/IC/UG3bEcWjEu/DZ9Iha3udXHPs
	d0fo+qVlZ5QgSj+/UqJYA1JWDUKWKSDBsXLmCqW6ULsO29sXxDr8NaYzYxaUbXOh3JQ9fHIMtVg
	hlzVKz6z96EydYC3oJNblFyOSGECjBA02ewweQqEXTI3v1ARotXR5WQi5ALBfZeA=
X-Gm-Gg: ASbGncu6n/sMhmEM8nOHnOsvaS//Er3oWFtmH64fL2DA/fLh0nsGJGYY6/zb3DNxgob
	NLh3CkCLnKEvvU1l1XRSWjRMjWvZuPbV7fMw8yC3HF7aK7BoX+0RTJVvzoMAFuM1FfichcBpREJ
	ZxwWwhM07XvSpE2qC7OarKQWN+UWpocWdPNFCNqL5W0f2+dUggcEqM++kZpgJuHefz4TFk4KuDS
	vOhnOnyE/EknlrLeLu4CslD6cLraCCjvzNwHUcioieZyRe/JL0/vy78CRRuJF5RlttA4iqrLTh7
	XmVvldAS1c+ll5higQmjt4J0qW4Pa3vKqJHU/ToyVmnNHKsnK3NIwkIaKqtZL6vq79k=
X-Received: by 2002:a17:902:d50a:b0:234:8a4a:adad with SMTP id d9443c01a7336-24096b17831mr94319415ad.26.1753957555589;
        Thu, 31 Jul 2025 03:25:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEM5m9qng+CoWEOBFNqS5T93w6/fczPEEuuvGdp/UVzwiAltE668w8GzzZdGOMC3LU4BzfyQ==
X-Received: by 2002:a17:902:d50a:b0:234:8a4a:adad with SMTP id d9443c01a7336-24096b17831mr94319105ad.26.1753957555017;
        Thu, 31 Jul 2025 03:25:55 -0700 (PDT)
Received: from [10.217.216.26] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a917sm14198885ad.116.2025.07.31.03.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 03:25:54 -0700 (PDT)
Message-ID: <e490ce65-4f09-418d-83f5-fa0755b36aec@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 15:55:49 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Add support for Clock controllers for Glymur
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250730-axiomatic-colorful-gharial-1e6060@kuoka>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250730-axiomatic-colorful-gharial-1e6060@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rdRnYtYIC2GzsldjPfArfmTPlC23CRWq
X-Proofpoint-ORIG-GUID: rdRnYtYIC2GzsldjPfArfmTPlC23CRWq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA3MCBTYWx0ZWRfX8ygmDXkCGvVQ
 257dZSKC3qqi0OatJwqjzLT9DRMDbvDAAi8hqKPhWmk7doxPZT1artOdJCeD7GlAhl/L9P0RbLS
 w4kA00D8tERbbbVOnHTC4IsH5cV36+ki0xeNlANiQah1iZS+vF1X51ARgz5tSXHdUBZTsWvLhSk
 LILt4CIyIF4vtby60eAKaRsnbdmXWQhU65zAYOyrWCbLlAw9JHe3KWIKBcjyPxYJmZd3oQEUhLG
 V1HpMqpLVz4LH6+QmW7MYfb9Sj5bAQOpRF7aBzP90JHYSAJ1zp270MlO68EM7GKF1pYFz2cSKUr
 UYup+g1saygDX+KP+I1q99hhmfmdXmsHK3f9ij3H0btxJXCuThNhG8Kds1GKUkRrfgLFuBXEuE5
 t3IryFsQ9SePqC4oweoqfTfAnKKO3OvRTtqzmRRG24f876LeHRnvriXoiDqdvcPoAVRGCQB8
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=688b44b4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=1-OmqgVFb38NX0Eqym4A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507310070



On 7/30/2025 12:45 PM, Krzysztof Kozlowski wrote:
> On Tue, Jul 29, 2025 at 11:12:34AM +0530, Taniya Das wrote:
>> Add support for Global clock controller(GCC), TCSR and the RPMH clock
>> controller for the Qualcomm Glymur SoC.
>>
>> Changes in v3:
>> - Update the commit message for all the dt-bindings [Krzysztof]
>> - Update the commit message as required.
>> - Link to v2: https://lore.kernel.org/r/20250723-glymur-gcc-tcsrcc-rpmhcc-v2-0-7ea02c120c77@oss.qualcomm.com
>>
https://lore.kernel.org/lkml/20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com/

>> Changes in v2:
>> - Drop second/last, redundant "bindings" in TCSR and also align the
>>   filename [Krzysztof]
>> - Update the year to the copyright [Krzysztof]
>> - Align to the new Kconfig name CLK_GLYMUR_GCC/TCSR [Abel, Bjorn]
>> - Use qcom_cc_probe() for tcsrcc [Dmitry]
>> - Add RB tag from [Dmitry] to patch #5
>> - Link to v-1: https://lore.kernel.org/r/20250714-glymur-gcc-tcsrcc-rpmhcc-v1-0-7617eb7e44d8@oss.qualcomm.com

Not sure why these are broken
v1:
https://lore.kernel.org/lkml/20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com/

> 
> None of the links work.
> 
> Best regards,
> Krzysztof
> 

-- 
Thanks,
Taniya Das

