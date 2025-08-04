Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EE02405ED
	for <linux-clk@vger.kernel.org>; Mon,  4 Aug 2025 09:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298101; cv=none; b=q2BDcR6y8AJX8AGvVc/v4BhKbeQOqGyahUgRfPfTEpY3CQhwo6UN6BDQq+Fyxz3jvfT30nDsNYEljHPAvZPFlgnv5HLaPfHsJ+LYkkmrNlM6u3YsfdLKdws7tV+GJb4snMyZeS80KuML3SFWJs5nwc00/xNVUruN+tlLAHNeNDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298101; c=relaxed/simple;
	bh=8dT0hCsSa+pOFyIm2orcWN2fXAkvYbs0ddIV1PMTUy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHPu3Qvx/xOt9ogRGPCF6C6gBajqDguQOw9Zi8/lM/ywp807HqmucixzcZPFdZ705fiyD/B+z/TKevBPcPzSJnW6VZ0CMJ99uie46aj/ien2WUDAZtLm8yea8NLW1GC5ptC7JR6QgRg8uHMHJ+fZCZ7nZwwmTbJjpDQj4T+3eAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ld5Z1aLI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ld5Z1aLI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57490C5P029274
	for <linux-clk@vger.kernel.org>; Mon, 4 Aug 2025 09:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YSVwT60Y5j6SK3F/zYcMZ5PZCH+z92QqbFAGhTVhlu4=; b=ld5Z1aLIRZYNK8R7
	AkhNXfCzDQ4MLhIQFUZ5VRa+HNIveY4DVZavOyenNPwP+96h7bhgJ4r8RZ1yBrD6
	ORIOt7gGd0Crdve2Z83IlTbQhtt3eOgyt5B7pdi6q1MM5sW47PPwg+AfwAjIvrmA
	xfXJX4fBQ4Kj+HdXNf0GpHs/mbWeWZpCzaBZ5RX8ahHa/T58KhRr9XDZ7rogveux
	4eFaWEWR36qE0HevDHGvHocze+9f6O1bVDXWvaqMjESB4guNdyEStTtH8PJUxZiu
	KpEJTqNsJvoSfygcOyMG8iTowfVrYZVz5A7Q2GHashz/q7OzLyhRhcs9yn8P8C7y
	TEdJkA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48a2ke2axx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 04 Aug 2025 09:01:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b421d38d138so2631923a12.0
        for <linux-clk@vger.kernel.org>; Mon, 04 Aug 2025 02:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298098; x=1754902898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YSVwT60Y5j6SK3F/zYcMZ5PZCH+z92QqbFAGhTVhlu4=;
        b=wnDvuZCIe6b2sjo+6lzUC3r6IZjuj+zWX8pLWtsmu/4EyyG94FaySS1B/j1UbAokzm
         WpWivhdDEFh59oaEiFDh0zradYtVXrawbp+7ivpUnLGAtuJ+AH1fWcFWDMc3u2RZcwB3
         nHyU3LVjYQ3fROFBrzFXl3Cr4ePi0JtivKMwE8Rv/VXzExqAcz4lSxk8SmqbvPUEGxG5
         AmllCmg12j6BvSnAOUxRowX+s27J3YN2VzBOhAZ9Z/cEDqkrkOFJ8HVJMOMTBBqGNCZl
         vqHBLwuOLU9dodGwbQqVx/yLYYSwKTCm/lfV1h8xD98kiO4M2pMLMfCcKTWWHFyrueKy
         RG5w==
X-Forwarded-Encrypted: i=1; AJvYcCUNltuqYU+iHew4anXC4OWiUHjrj+2qKT9su80YwLkkOs1CfU7hKFSHhLUnHS6vET3hq0ICgv73goE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVngX2Fevz8dqIhVantS3M68FjlDzT9fPZCKnXbbGlp5nHj1RK
	KiCvOAhsflLI8OnVIRPNgPPRalFM62598MwJTxprBZGmpAmZJS7oam6uXkBmPStK33H+Sz0kaQn
	NEH6M2f1M8UoI/qla1MH2dHfdPo6ALPOVURq4fO0/Asi7tcYwoFen+ov6l8OzDpk=
X-Gm-Gg: ASbGnctN4S3m42UtbRoUNuWzQJB96EZL67M/ZBWYyl4EMaD8tfWbcj+gogpPK6908gE
	dQRI7ykexTmEz/9RsB4f7Nrj0z0n5TgQgi/b3ww7kWR/SvaCvi76+oNNAhqaXnIY3jNM/zgGfoX
	WM/m04LgqHgtexWiX8KGSKG96daaqGTDEZEkBpEI2D49O9rqjyeiGKhh05nzusVyiByrPqfBoN9
	jsEx5aHpJx1V8KSUaz0rtdH0tsMRSy7hqECn7xhKk6AfImxJMHUQRF5Ez8BjgBjW5rvZmO5kWiP
	a6lx/4HEIGDxcZaDgBUDuncwmUGRthfn5uXKzFY4SV7/buIDM4d0NPoiJ5xKzjI5+EI=
X-Received: by 2002:a05:6a20:a10b:b0:240:116b:cc4e with SMTP id adf61e73a8af0-240116bdcfamr2552175637.5.1754298097824;
        Mon, 04 Aug 2025 02:01:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMWc3XRarjZz0UicInQJgk7t7SP2zauTJ6j3s03rAStb/JNHrgMbiOAy2gd9heuPOjjuKTWg==
X-Received: by 2002:a05:6a20:a10b:b0:240:116b:cc4e with SMTP id adf61e73a8af0-240116bdcfamr2552105637.5.1754298097274;
        Mon, 04 Aug 2025 02:01:37 -0700 (PDT)
Received: from [10.218.30.152] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da6141sm13929997a91.1.2025.08.04.02.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 02:01:36 -0700 (PDT)
Message-ID: <677e1143-e38a-4c73-a445-923c9df5fcce@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 14:31:30 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] dt-bindings: clock: qcom: Document the Glymur TCSR
 Clock Controller
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
        linux-kernel@vger.kernel.org
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-2-227cfe5c8ef4@oss.qualcomm.com>
 <20250730-mottled-myrtle-bull-3ae03c@kuoka>
 <9cb06263-2a61-4acd-a9cc-157abb832d62@oss.qualcomm.com>
 <48610dd9-16c0-48ec-9997-2de9e0f7b3b6@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <48610dd9-16c0-48ec-9997-2de9e0f7b3b6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: y1tt88vaTtjWboxV9xzQrxLon2v4ZTby
X-Authority-Analysis: v=2.4 cv=TMNFS0la c=1 sm=1 tr=0 ts=689076f3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=3e4NYzSl0HTm_xoazEIA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA0OCBTYWx0ZWRfX1Ze7CwANnyLW
 bOdmSPJBR0xBuG0/QdxS1lHN/AHzF5D6Kb7o3py+qyEbETwJWYgbCYEujtwoQX9nFzP+qhOuSs0
 3rQz1Co6PD6pG45s40cIsB3t2w2sSf+Su5/tONklrkLuzu9HYz6qKhk9fgEqrPzDm7A8IdMdo0a
 hBsUgFucsJ6zJjMmro/2EDAToV/pguOlK3/U4a/D8z2HXQk7oTS+4lgLs+lOh2thwJyLs6gnZ3i
 1nWkkYNJa/nI0VVE/7TXrRGbQUBlxwpkHCFHZDAHufujcq6MdvxZFEdlEbM/8jDr/aRp5AMhkAH
 nwrlXiQjmcdeZI6qyjLeM2S22m2VMpNEtezzVB8R//qi+NLBuj7QPRHQTyT7ZGKoPYtB6SfxvmJ
 IdLUIx2SRqRkclpkp8YzJMW1MnhDuCTwKaD0OE2v5aqbxa/P3WKT/WP1jG64z0u1dcxl4d0o
X-Proofpoint-GUID: y1tt88vaTtjWboxV9xzQrxLon2v4ZTby
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040048



On 8/1/2025 2:40 PM, Krzysztof Kozlowski wrote:
> On 01/08/2025 06:14, Taniya Das wrote:
>>
>>
>> On 7/30/2025 12:47 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Jul 29, 2025 at 11:12:36AM +0530, Taniya Das wrote:
>>>> Add bindings documentation for the Glymur TCSR Clock Controller.
>>>
>>> Same question as for v1, what is Glymur?
>>
>> Glymur is the Qualcomm's next gen compute SoC.
> 
> Explain it in at least one commit msg, not in reply to me.
> 

Yes, I will add it in the next patch set.

>>
>>>
>>> Where is any DTS using this (or explanation of lack of DTS)?
>>>
>>
>> Krzysztof, the DTS will be posted separately once the driver and
>> bindings are reviewed.
> 
> Hm? That's not what I was told thus I ask. I am sure that above is not
> true, but if you insist and put it that way it is incorrect. You cannot
> send DTS because you wait with drivers to be reviewed. We want to see
> entire picture.
> 
> Best regards,
> Krzysztof

-- 
Thanks,
Taniya Das

