Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDF437882A
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 04:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400286; cv=none; b=HZC2p+9cy3X9ryHbZwWc3Ij5YJc15Gv/VsFDCeqtZNEyRJGawGbWSMwZCBn2c+qWVY+IlBF6nM1zsla14zG6g5bfxk0g7gQBADAuaxcm/bX/or+AJP1Z/3vTFA3hN4qPGhDg25SLFlN0U+TbEteEf0SbGnBZZyT8FmuN5SRsxdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400286; c=relaxed/simple;
	bh=j9wWEBK+fxdZ7pkfwKUB3cmnFKbY+8pHaBxHQBIN6Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bml7ayvQ3viG/7WdMmPh5q6hmOY/hvW9NYM0/s/n+0DvZ1dFgJ0ekoqQD7xsA9V7DGHC+eBPVDUmili6861dsKdPvgaZPVEtBK77c1XRwCUMro+VX2UQ26/+8Z1SeV83GR2/foTVNhbrm/HsFyO+x3VjMTDyPXlJ4Jv06Sa9OtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jit2uvZA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMzqd2IP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jit2uvZA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMzqd2IP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667495na2526303
	for <linux-clk@vger.kernel.org>; Tue, 7 Jul 2026 04:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ia+WE0mh6J0dIj20YDNVJvH7fAFMVn1LfWfLhiGS4QM=; b=jit2uvZAWr+ObEBI
	3ZGHeYcEMMtdtoi2YvyYdgjIGMj20K+xSETDPUSFd82K+fkckHWUIIha+QKmr/3u
	LSO9ulTw+NQbl4WAQNJOIsTcFuSNS8qcQELAssp94dKwZlQSWI8DoZOyyK7V/8pN
	iXZFjWiDrsvAk14C5wJehhZR9DzsVW7sIFeuisJzqOLAYDX0sgrPafApM8Mge0Zt
	EYyeesSoV0wEu+4JJ8rw753IMpjvPRa9BK+MhkFABhB4Vf6Z31eUlOYiGHYPBQEv
	Ae9smLcjJT+xSGsWm+tUukXs+iBmt6rvu/Or+n6PzBOVrhfo/y2VPdQgNtU4fe3W
	ktE+HQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98m238-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 04:58:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c916d17dd43so5967975a12.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 21:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783400284; x=1784005084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ia+WE0mh6J0dIj20YDNVJvH7fAFMVn1LfWfLhiGS4QM=;
        b=EMzqd2IPD38NL5AOdHAEf3pJkYMW36AGxQLaxm7FUL2+9OEkH5JU+jObk7isItPmTt
         hMUF0o4pBeQSEFKWM9ifELYmPLTNOufVXkTR5mFj0gORAs+I3LnE/cKBhxGCIm2TWiHz
         wRWBDIdifTNGS7YIWjKlz2+ojjJLPElvXOH5xxT0nbzBGtBTAPAv4wfiGzYEuR/PbErJ
         GwQDKzcBBv8ZWqJpbLKF0FV7XRmY4bJcPF1Y5SHogTms3gHGZjOFbf/i/yA47rbKK2dD
         UdqBSTM803Z4ERfumhaFeQAc/qw4XvL5pF/Us+VTGuon2dHnx5H9Afr2iiKyLaFEtVne
         kKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400284; x=1784005084;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ia+WE0mh6J0dIj20YDNVJvH7fAFMVn1LfWfLhiGS4QM=;
        b=lIbf1ORPTG+OvcJQG1iAEjlj5molLXzLLK1fdRAvIgIXT2yDy7JXqEeHGL8GFcz/ZP
         ZMFdazp4g0uxJ3V+cWO/sVHlkkX618Z4F/Z5x428TI0gCASKWRgEehe3FXgwv+ONNBGA
         XVclp6ke0dZWG1G+DFqY4DZiz2pyXr6EU5JOhaImq38kkxzmmX+E16fegdnkERvFxSgW
         lduNcqeyrX/l6tbeiSLNt0KFI/Y+e87gQM/9W2bgKaYohHrGUXN0gyCkioc0WlvqFuDr
         FZuMsKcLs1uHz4V/reJ6tahIUT/UZliT1/nYv0T5ZKlXyIIccQbhwMsb2KlHM6P7Z++7
         xo9g==
X-Forwarded-Encrypted: i=1; AHgh+RqHKESxlOBycjWEJ3QjE0qXm9BRTlqwSAVPSudwFGN1xp6wfjNAQRH/v7U43JDte9lkrr2jouKuwyk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywytg1iGweF2Svv7grV/bvYVDbnCP3jxpjZsz9bhte+Uu/hJsdI
	4DoofELVzzBuxRmBW+5RFQUgeyYyQp1OjDSi13jNUeIpiKlCZrUqk3T9Orlscmh9BzoPgZNSVob
	brzBM7sh4aJ+M/Yp+yGM0bA5bs5/cw/HJn8p3qadcVYUtCsm7kW1ezVUg4UGvOnE=
X-Gm-Gg: AfdE7ckc8ytaaTvWICMXmIoy3ZDfuhiNTZ35uXrSOEpx4Bzc8sfoL+F3HgQfAyP0IjG
	fNKgcPsQ+ft7Ajdt70+XtvuCfaz6Qt77j0lRQA0e1ucANsZDANCE7fY2FOd7aD9LDPspA3NUYdB
	vYEG47kutHBltZfrRRLPDUemb3Eb01I6b7IRIkdgxIDpj0tSvzEQ9aWh0baW3+N3dT46/aMZzUm
	5tfmqcyS6ZbHmsNFBqVkXRlvjlRItctzgpMdfDbDM2+RpHVY25uWmhU/p6hr1Q7jlwn9KeEhPXP
	nbPCUL1LSg7RGMmfW6K5d1bR8/AruVQrfGBmmXJ04EorreA9k/iYyBJLLvAmozjRtzsgsGNbuql
	5t/Rn+FwpXBWUotrN9z/fkKCo7c3PSgpS3+RkiEw=
X-Received: by 2002:a17:90b:3cc4:b0:36b:b3f4:d578 with SMTP id 98e67ed59e1d1-387573b0493mr3687121a91.15.1783400284091;
        Mon, 06 Jul 2026 21:58:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3cc4:b0:36b:b3f4:d578 with SMTP id 98e67ed59e1d1-387573b0493mr3687095a91.15.1783400283615;
        Mon, 06 Jul 2026 21:58:03 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387b6b1f182sm294410a91.1.2026.07.06.21.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 21:58:03 -0700 (PDT)
Message-ID: <dbd7c44e-eca4-4295-8d20-c9e9e8cd0fea@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:27:56 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] dt-bindings: clock: qcom: Document Nord GPU clock
 controllers
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-5-860c84539804@oss.qualcomm.com>
 <ajtGd6OLJeK_67JS@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <ajtGd6OLJeK_67JS@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4c875c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Z6pN661gba3QK_V_KyYA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0NCBTYWx0ZWRfXxuO/DvJyvZR4
 +SBgbPRcRev45lM5t8HDtEIWAcaWZp931GgdlgxmcfksClkS/KWWGEK7dGeBKnVXKdIfmKkU6xv
 cUBvs1AUMMtFzv8RslaUFDEbFiY2WxJGRKvIXBsHbkBUt0XzHYrpp6iobj7uKmaUe0yDS0MM7ST
 G8QATYjcK1rp8dsPDY/fczNCzbY6BJWRLp41MtCR52fGQ6B9eIva5hm/BIQ6B/E5JW/Ta4yV7K/
 T2pAiLkUW1mXbjuc5mumVZt2bGQMHb6cRlSMD2JleMhqGcObPVmU2+wvjvSXf+8c1ci+H7t/hkL
 TfN2lv5hFMcp7/icU4ugre35bvZgTAU8iSrR95Qh/Oy+zicUsCYs6Qd0ZfsCIUOYJOEFZ1xoqUt
 qNtzxJ9dZm+Tiq/mvXZgdOvCqAuQl8mYaZurJDDMZ//eiLSWx4SWDOtWOV2WCOSj1meaaD8KF6y
 +Kgg8lz2QwCI4GVWfCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0NCBTYWx0ZWRfX/9pwY8pD3ryG
 gRXZyMiwopeWYLPbVsxC5ZGJUvdACLmuVqM0E8HqeYPoKan495Uqx6YkD2W6M+KRXD2NNxPM3Xe
 y1xNb90gruldA89Xv3B+HYmRyEtba0k=
X-Proofpoint-GUID: 5ESb0vymPMFqoi0s-wfiDX_xc7m3rC-2
X-Proofpoint-ORIG-GUID: 5ESb0vymPMFqoi0s-wfiDX_xc7m3rC-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070044



On 6/24/2026 8:22 AM, Shawn Guo wrote:
>> +      - qcom,nord-gpu2cc
>> +      - qcom,nord-gpucc
> I see inconsistency in naming between dispcc0/dispcc1 and gpucc/gpu2cc.

The hardware name of the clock controller is GPU2CC, that is the reason
to leave it the same.

-- 
Thanks,
Taniya Das

