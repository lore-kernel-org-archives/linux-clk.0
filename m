Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDEC33CE9D
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 10:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460955; cv=none; b=bqIgekEopwj4Z6EH17JbDHWBQykfNx+1AnuKZf0V3Ry8uxtmUf0VcF1o0bd1MWmHQDZtnahY/IEmp0p5zyHJXQbEh6zPtQvBIOzdNl28ysJBweFHi2woS+CBOmyGZGMJa+RAfuIknr/BJ50BiFBUrlIKht2xDuud7YJqXn3fOf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460955; c=relaxed/simple;
	bh=oNhHrsT/msNDEOJJM9+JUOOCPllRsO8OLiYiIztC8a8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PpS+kyvmhJ8/kiKrZbnIxZu86ytkcN/HLBtt33zsEUaQ3YCbRGG7HO6TURTxiO3LgwieIPEqKZZgtySdabMcvLrpmNgWvWw76p3OCW8dLflaqLRHMPMJTKMfBElYb0A763cK3SmjYzFxKdBo1SKJEwQEmIaTBwL9choAGbWw7c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HtD4xgtg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LV4GKeqG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HtD4xgtg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LV4GKeqG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI2x8tt375641
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 10:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PxQmAzQi/5l12tcrIg2/r4r0TNqEbqMpm2O7Owwp/l0=; b=HtD4xgtgXhaIHxkx
	/Q4ZnlKHr/uzusl24Dx0O28KJINa4kbiaPLrN41knjBWHWrkAnhWs3v5ZD05F7YF
	0pQR9nhcwvDP7JO3TnYqTxXKHyQVVxpSj5oI3tdggeQWDhhDTTm7AgFOvJhdIHII
	o6Fa6TTLNdu5L3U+4hDOK9mmx7A+3Q2+/uSBcVgEf71S+AbThxwuub5SZk/sZVpo
	nGdBqxJUEx1oUYhnT7ThZAgMYFMNLypLx2nUkUI41Ku9cn1FGSDAbm3Sll8HTXsl
	tCdh5QyC1y2EHmSrMCTlzSUSZodRisSCEaNVqAxr52nLNyRsIVAn5q5uHdnT0VNR
	VnAfvQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76njrw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 10:15:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-342701608e2so6408324a91.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 02:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763460950; x=1764065750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PxQmAzQi/5l12tcrIg2/r4r0TNqEbqMpm2O7Owwp/l0=;
        b=LV4GKeqGlUj5MHJqZLuCHcVvNqteiiY2hGxUdprjyxJX8JVB8EAtGR2PjMCk3xvHcb
         7On0LOKYjb9+b+NvK2OrvYOcVAD5AJHSgorR2X945dGCkI3XOikv1vCCtReiE8UMl/uJ
         Y7xG9wYYJqBmtf6sJBstmmN4g0skkEGJfUMmBnT+rHmb+uGaMlE7wJ4wApDT3cBN+qxr
         JZ5oSQR7QwDqmTRppW7WUMGHHBigdwHGsq+rFdfyNj15+eLbZG0gFGuEYaFHPPnle3RS
         gLxj4Yk0UM/i2JjJ2FqKdmJZb+6e5SD3iQLwtUrKA9m7JB0oTgDVmXYxoX8T84YOgnjY
         EIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460950; x=1764065750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxQmAzQi/5l12tcrIg2/r4r0TNqEbqMpm2O7Owwp/l0=;
        b=thYx5YyXut7PjXwo4ji6aQ7SwQPT/OikE6BmI5htqIbzY+5pqp1gdhpjskNV0Gf3q5
         lnTslVpFOxFk8K6ClIqO43vfdH39qeSheKUqv/z0ervutkznwp1dWj2fwGJIHziZC0Cr
         FiuOBgym4qc35PgWFvON7oyjZ13lxf3KJOoQMeL83ow9Zc8VaJXP2tf2KMaXFKHoUwjI
         /gwyc1/duNSJRvEKBTJatCVQ/Y5P0mQQ191Sy5zJRasAcb/ndDSE4Kx4lZafTrAmJq76
         qJ9be4xCB6UKEhh6o7i/0mRpyq3wZS2xqU+JGlB5dfopCUO152nOKyHGWcq2Pb8plOv4
         WVfw==
X-Forwarded-Encrypted: i=1; AJvYcCVTrEOhh7pu2rLIoBx38JWf9aMQILnWTW28VvaQlIvr/3RtHeZfTSArzB2woMFWbfAnyAKO2jTL5SE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZkGb1qfZCD7stKLeo6JhwLyu21Q/1dmTi50SNwSVuOj7JxJDx
	i2RVBuAGTzeh3yrUEx0JNToXpjbPG2FMP4WqgWzPivnGEMUD6qIMobR8e9w/FFFQKxY3Ey++0j5
	R88jL3oEva5GeXYprUTwv0HmSx3shNE12GnxMC/ZPYAHUY2rQtz5DYonTG3vvPfg=
X-Gm-Gg: ASbGnct41LmkXSnC82O5Qv8ant4WQawjY7FiIyCMKQispVqiq0uwSAZPlehTX5UvlPc
	KdxYVkUEs+0FwBj05nNZENL+Qmu1qJx2wjttDiJ9hi96spgtj8Vz7QhBODezIIeBZ2ED1TnR9ow
	1FC1ygxXW6yyrX5Jig0jqeyODF6+ZEbtkJf1aY46Pb72NlrpEAO08O8HhwrjYODmw5QYpBygHvo
	ztrgQNaIzJZedv2yZJYAh5j0Uz4hvJzs4Fj8HZzKQQnZHCpBbGysfBlDzlYZXKseoNs3qeMjgMY
	1RYvlN0PyzOFPlnZQDOog5ZVUkHw/HBjT3aWMGlQAP+uiNkISHrXi96lympZ29+8V0+/gOQJ9Z3
	9YjaD1uxcYoyqqQe2L2fuIJNfBg==
X-Received: by 2002:a17:90b:4f92:b0:32e:d599:1f66 with SMTP id 98e67ed59e1d1-343fa7412d4mr17099533a91.30.1763460949880;
        Tue, 18 Nov 2025 02:15:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8OnYBQVTnULke6ffL6/6lpUUQMDuYfOqlcHrnVpJUuu5DYdV0xlh4GGq7XhlBr8Lc/gOZIg==
X-Received: by 2002:a17:90b:4f92:b0:32e:d599:1f66 with SMTP id 98e67ed59e1d1-343fa7412d4mr17099502a91.30.1763460949430;
        Tue, 18 Nov 2025 02:15:49 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345b0384abfsm962647a91.4.2025.11.18.02.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 02:15:48 -0800 (PST)
Message-ID: <a9317023-2284-4e9d-8963-ee5d28288415@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 15:45:44 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] clk: qcom: clk_mem_branch: add enable mask and
 invert flags
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
 <20251118-sm8750-videocc-v2-v4-1-049882a70c9f@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251118-sm8750-videocc-v2-v4-1-049882a70c9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4MSBTYWx0ZWRfX8/RhdDTP7peN
 LMsA8jxQN6yhcjWtXqAJKtJflWtuLLBcTDfqvteEBFGQUUSI3xui/sAVUfhqr1AJrMiUHRLz4JX
 5WlJh4kJefDvr71FPX6Ve6sfETTqVvnH4+j2dZ9pIkqibXKQfirn1HLCqHyOC9B28Rifb2uJt1C
 0xzK93prS/rkwul1ZDN2wAUUxbjroVeuNeUmxFvxVEz+Fm1afObfCBfLoOAml6DyDIS7RK1MAVj
 d9rFvesTZbFSWDkakHxqSHX8DGsIDcwf1pV3bFW93g6K73j2Ci+f8qHwe6KpClmYLy4T1S0T9ZU
 JrEpmmwYysA4/dPgua8etq57SoUMHAlegkQzFHdw2y+oSvMnqilOPGMMjSX43ao75SABekLCPDu
 6CVRJr9T1olxk69g+pL9gUo9HIuZeQ==
X-Proofpoint-GUID: zlHZb_pf3jk1u3PoHeFcfMmX_T2gwcKD
X-Proofpoint-ORIG-GUID: zlHZb_pf3jk1u3PoHeFcfMmX_T2gwcKD
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691c4756 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dIrJftJwEK3lONcwLLMA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180081



On 11/18/2025 12:47 PM, Taniya Das wrote:
> Introduce mem_enable_mask and mem_enable_invert in clk_mem_branch to
> describe memory gating implementations that use a separate mask and/or
> inverted enable logic. This documents hardware behavior in data instead
> of code and will be used by upcoming platform descriptions.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-branch.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
