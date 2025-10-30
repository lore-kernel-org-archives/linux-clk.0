Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C373D2F6165
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 06:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761805486; cv=none; b=tRL+pW8MDwveL7QjH2WS2Db/K58OiTUx2QdGFvzDZihuzVFdIThJY5Ul0XPupQXWfEMSmsrRwll4TWorJvZ27fFvuxa9e8oZL67M6xvADeyoaQR5msG+IvX/MAHlPAgsYKMZcasrvTs6TTBUERliSA6N4y0Q/k1yu9F4VqiPR9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761805486; c=relaxed/simple;
	bh=kYEpluhes8vtvdUH9J/X084zA0gsfE52X2hDQISOSCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ebb0/HMlE81wc1vd07DqdDucQT+uUGlm/myyA+s2nYZV3cJ65MMJAOSWEATHKYSKSq+H08eg4YIiPiJcYLgSZ2l6QeTELjpzTnstNybH6TMpe7GEs2v6Esv3s0f3ca12+DFlDLHp6JIyBXSLyQwPxFh9v0cApJwEw5RG4Iln3wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJFiDHJz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWzECnMk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJFiDHJz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HWzECnMk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U2bPss4135998
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 06:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TupfMC0hAShbDroEeKNyDAfoUtonaMFCsnoDLZ49ALI=; b=gJFiDHJzFdm7P/MF
	0aWVQFIiQEsrQaT06BSmsW5X63H/cxKXxgUahTncYilvKA/SC7BXtaE9+54Pv+Gr
	ZEWEQsCrxyYCZyyfYTGj86XUEAwjX2XE6xRbxkQ9LY0yX8K28++rlFuLIKKWAWdX
	kE3EmWUcmq0scuJk9hk2NlOUUKXU8FJfCU6FudfIgLLkFhvbqB4rNACV6sY9pQu6
	kK7dNxZj+Fhtx/LgI7VxI9hdFbk1EBo4IoldDv+mN1uLz1OYcLCdT7mEa67eKiNc
	Dhasqo9PkgDEHdFzbFX4QJuhOxJNNyN92h+8JYrtffCNb0/d2lDksVsqdRI3n6c/
	UtX9cw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ff9ujsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 06:24:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-286a252bfbfso14982555ad.3
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 23:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761805483; x=1762410283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TupfMC0hAShbDroEeKNyDAfoUtonaMFCsnoDLZ49ALI=;
        b=HWzECnMkapn7noACRhh0EkwEU9H9S2139h1OovqPC/E5la3N1oy1bdbwgGUVR74TqI
         /5DEX0FQhQO48bDr9nPqAH/2sC4cVt6GWIInXkiL/IQN5DAaWKO9vLFs7/KPuzEVx8NW
         RCczm0S+So/GjCYMm+s6YM2PUh77fl8nLCCAjJBB0NuRUatCXzhor97D2XBbpFFbKg9e
         PIE86lDdA/GG0MITLstxUaBf5YdCQz9Hh0hYdr/2bAyhhdNT/ahA1pzlCjTwch0Lcgws
         7a49CiFr1yZpa9If4ai4A9niQvF2vGvAp8aJdW1/Ar19vcNG+Q4XTk9cYy/+Hc9A83+b
         egHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761805483; x=1762410283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TupfMC0hAShbDroEeKNyDAfoUtonaMFCsnoDLZ49ALI=;
        b=Mj02+pITwtpJQS7eiZ0nkW8+1pywpPnEc1q4frgIpuU31rFPE4qa8fdGLTXkVyaG99
         Yh0Ik5OfdkU/0QphCB9RzDqrg5p++qAhHmhgkjpFD91FJl/RNvsCvYR+tPDKo3y0Qh5Y
         RJVsVZ8z/wd8vTd15iAC330YQ1g9A8p7RDRYCZVGDddx6ZJgCpRhyt0YdihvFh6VqO66
         p5zhWQxHE+cZxL266V8Zb0/hxidnIuAJEMnxISvHxVFD8Z5zjpMMww5ZkWPgD1W+Zuf5
         P2bI2NJuvp/qXaJLeF8Cyqz9iwcNCxk2bqoHogyzUzyEw2/ZrXoXBkCpfnUjOzRf9Unz
         Xaxg==
X-Forwarded-Encrypted: i=1; AJvYcCU/NbXHP2tOfA3GuApWlIjvEr2JrZS+ecxdUWT43akapqU11UEo5o9sM+7R8UzKhwSF3cQZs3iRWF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzLvlU3SD1J7pMkcQCIZkxgp7VVXAP7rkUf8SyiZ77zSNnCY7M
	QHyrjXxa+t29plOmxI8Tc+cR/00qYjDBXR2si9gWilVp4C5Dpl9tnvDDYa1XKWby7hocdZpQ28c
	cU0Wd1vR0a3mA1q94/ayT59ymeBsYuur4CcP6o6G7T6NNH/g3fpemccKBGTtUDcI=
X-Gm-Gg: ASbGncshxh6xbOV7EbYPLVRVHQiljUM222uUHIh1XhbYggrLpKmQYspgTvGnPHkQZZc
	JT4cwD1qzncO7qsNaTCnmofpdj2ZqsDJck2xBwbpB7gwCeAOZu1kB7f3JYPjt3pp4ZSidlYOeXN
	jLcHSSUinN/dck0Xu+BDYDzFoHxrbq2ONpSWAkAv3zY8tvCabmxqMXeKCdJ+2wHzBBLzusZE3K2
	icLooN7u64FUo4aN+0QdPLpIjdQ/MDyO1NfUNLkF301HH80egJdk63197HpTkU0+8FBeTUqZgqg
	FHgKrjwQDNtYVc+oZc9WNigPLk9NYIuAxVqz4Dy7IYonH13z3+Zzr+Avvbcx3PUyn+dSxqppWpL
	hZiyAx/HEu02djSxkeLNB80Ni/Q==
X-Received: by 2002:a17:903:2342:b0:27e:ed58:25e5 with SMTP id d9443c01a7336-294ee363bb2mr22404455ad.24.1761805483110;
        Wed, 29 Oct 2025 23:24:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJz1GrisRyN7i/NmCFoFsgU5+BoDtItFURjecEFsMAgMf5fYaBLHcaaSAGXDnvsc0wTyLO2A==
X-Received: by 2002:a17:903:2342:b0:27e:ed58:25e5 with SMTP id d9443c01a7336-294ee363bb2mr22404175ad.24.1761805482652;
        Wed, 29 Oct 2025 23:24:42 -0700 (PDT)
Received: from [10.218.35.249] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d09a33sm171725965ad.32.2025.10.29.23.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 23:24:42 -0700 (PDT)
Message-ID: <e308a74f-1724-48d4-9d1a-fba6d06a29aa@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 11:54:36 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: qcom: ecpricc-qdu100: Add mem_enable_mask to
 the clock memory branch
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251024-sm8750-videocc-v2-v3-0-6286bbda3c8e@oss.qualcomm.com>
 <20251024-sm8750-videocc-v2-v3-2-6286bbda3c8e@oss.qualcomm.com>
 <102d9042-49cb-4aff-8b93-a882ed8da27c@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <102d9042-49cb-4aff-8b93-a882ed8da27c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: v6WB7DPMMtvg-9_lTc9qoi1LeGC1rc8z
X-Proofpoint-GUID: v6WB7DPMMtvg-9_lTc9qoi1LeGC1rc8z
X-Authority-Analysis: v=2.4 cv=Cf4FJbrl c=1 sm=1 tr=0 ts=690304ab cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FkIjl_B119Hb-vYOz_IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA1MCBTYWx0ZWRfX+fED8bCcqwBD
 h/tkDVaqEDxzOUtMjDzliCOLVrCXjpuU0QLSNvqsmaVYuoX2IVKy97s8N1QFTG7ZJcTy2V0S5II
 UyEbmvm1v/OxYqwyYIvwg1buGwEY+KYMPQu4BFI6vBdxdSPn8CECZU/FiZTxlBMb2mvzlLqVsZT
 vPqV/Jt6fyxokxsFpFpzPU0yv2pZO+TmWIerpZoESX4+xQI7e4Bvjh4W62amjpDRvBgisircQht
 aWHEw/idE9cyOjdggVB2GS+J+Zhf9lv0Yk3hTYSkDCimMX+ZQzuQVIbEwN/Ge/3mQqoZTy4EQ2J
 1nGvUfg4yQDWy5i0KW+YZAotXD4vjCoJeYdUyGFeuCO92PSuLWste4184ldsOSkzbyz+mWc3TqA
 9psr4TlQeYHI6gpNu/oge2Ror7wT8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300050



On 10/24/2025 2:09 PM, Konrad Dybcio wrote:
> On 10/24/25 6:24 AM, Taniya Das wrote:
>> Add the newly introduced 'mem_enable_mask' to the memory control branch
>> clocks of ECPRI clock controller to align to the new mem_ops handling.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> This probably fixes some ugly issue, could you please mention what
> the impact/problem is?
> 
Konrad, this isn’t an issue. Previously, the ECPRI clock controller’s
mem_ops clocks used the mem_enable_ack_mask bit directly for both
setting and polling. However, this approach didn’t apply to newer
mem_ops clocks.

Based on the feedback from v2, I’ve refactored the mem_ops code to
handle these cases more cleanly, which required updating the ECPRI
clocks as well.

-- 
Thanks,
Taniya Das

