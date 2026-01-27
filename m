Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ABD32A3DA
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 06:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769494256; cv=none; b=TpSfDWUoXsQbRvE9wCB3W1tEyrOi01YSBV/+PfE5a1RKTmVpmsMQPPscFqBPYBUP0f9lOK/XU+rNt7a3rL01nX8VVQHupOXvpyTps4qAZ3unP040rcTSJzkqdlACvcOOAt3YhxGVs07SF+bR7oY2zVO3DuXlH+pIb07Sa7Rww0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769494256; c=relaxed/simple;
	bh=bYxB/Q5s5jMstJtbLmkZ3aOBTD8StTx0sKfJ7KdfYf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AXAtfgkIfWDyC7sixLhIH6FKp1BBkfrJJNN+/TUvT29pNFtNpAgrPYq4/SuNFTMtAhQV51dGa2dQuGiSR4//DDLIJ9fUIhUc0Z8ostK9DS07bJWp1SAS7UDZk9TzXuMfD1/zAgrms+ngVAwqJaRuCr0v02QGVIETLepmnG0Y0kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJXgeYff; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZEUJPyx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJXgeYff";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZEUJPyx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4UBDa495943
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 06:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EG+LTvaFYz5tDIHZuLPqCOwZqB2vgKH3Jn22xQ26IIw=; b=GJXgeYffDf+rKo2q
	KlE/eddSXMulhqi6auZng3AqrWp2CJswVQt/bSQgtKCZK3oHPQMThI8l18j5pDtQ
	tL3iDE8uXDr8rAdg83N7Y5lgai35awXyJi2ChMkHn0JjV5c3TUGmpq4nRJQJ3U8z
	b86J2PugcsqQZYADgm8oJbhT5Km7nYgSejLB+hEdQAm8FjlpdBNkt5Nw78zAB58d
	l2/L23gNDcz/io2VPnfxzkzvClvwGp4VVS/16B+V11hRXAEM1umsMBQj/mfkcYdm
	FRKuX9i3eV1EjwnlrV4CxtYAXYTjaa+czQWlKf/3CXZStiv2rwZwOzM5rlS2b6eq
	2QmQ/g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3bhf14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 06:10:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c93f0849dso5000584a91.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 22:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769494253; x=1770099053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EG+LTvaFYz5tDIHZuLPqCOwZqB2vgKH3Jn22xQ26IIw=;
        b=PZEUJPyxS9A63yB8zC6M9o4YU0PE6FukDaQLN8yVdzKXA30rxZKMpBPCDjLTZkRZAI
         n9s/35pCYViTaUmHDMlNykNxY4KArzZY5Ymo6bNNKEZYktapRrQBdklayKYpHIFoOQsY
         OX0mk4RWeCLk415jdNn1uZwsbaOoGzKCeywmmJUmRIvqeKDXlU5gCZOfUFojIm299B7T
         +Zl1ifAxiREG0SxPeGCUxaO+Fw75uvof8pcZggwC6r7NZJ3O8AuWU5S+QZY2kjbzh1WU
         Klso+s34ELEfndIhnlpT2SdKQGMe5YTVAIhH6jQMIkRlnoPV/nhNlgkIUabFvEjPTpSe
         z1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769494253; x=1770099053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EG+LTvaFYz5tDIHZuLPqCOwZqB2vgKH3Jn22xQ26IIw=;
        b=NsixuJc0WSoYJcHnHpnBvg2GRbJAvWbJ8/U8lJw9JWreHsqaAEiF7pSSqXDetu6FhM
         wXpiCfQv2PTuqYs2/qQ/TNNg/fhkoXBPj0ZfiG+Zs8ejoKHVDAw1KKUn1otK1NrvxJJ1
         bbKWExu/iSV2wiAnD2nD87n69LiLvmR03knUjMWhr/Iep0dR1gn1wrTOKDOgzZs4S5+A
         bXjl861QwCCtj2AtgcAJqPYxq4ZifO8kAumCC6gYwPS+C4kSA+R6TdlePe5S9fNvA4Os
         d9MTRFp1PQtgWqsZREFXQJKTZInD44y+V8Bcs7caMiizTa1YN405l7GwfA8Q9PjTa5y7
         SErw==
X-Forwarded-Encrypted: i=1; AJvYcCXYhvDLD0+eHIKUrAZXG4nBwuhuhIWYp6xdoGHw6mWFfnId/TtB/9BKOhwzfRgpJx8NMOpYgWs/XrM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz354CcnAGSZ16EfdLET/LQE9XrioAjvw1q1PntNpGbaYnGR0G8
	osuJ8LfUOynu0lo2CW2O0lVxf5+oKLK/HdreJ8OTZ2BMxpeTKm0xxy1QRKcZQ9KunjSnzdMtY7I
	3XyhTyCezHAVJYUZGM6DBELlRunTKMHfjeZZ5L3zfKbI80Um8Few2QLPk9qVMhHc=
X-Gm-Gg: AZuq6aI93q4yDHvtETzqHm6QIqvUuZvEvs0cy8KqkCpi6Qo+1NHzftKUp3xN5T44Qz8
	3NHet8HJ/zL24IKSb/G0pY7vw2sgg82ANJBgJep9dcbL/kRNc7ZnksLPVTgmipNSFcuPiaRjpV3
	fBisnq4xDtQU2ytreIHa+DBG9krmAHQHhHPY+Fes0pEgYqvk1k4p5GdWEstvb5rR+QvsbeuZ6Et
	rEusoj/9j0mw+MpSYQUWdJSNKfMuN7ViOgXNqfYSr1QYpaK0cDe5iDlPcGOSS5cvUlRlJCE4w4D
	6S11qE2s1tKSHVfOn3IA5A56pEVsEd/K3FbNtpJ1/QZgzeM+rRr02ONKKcnODmBq0cYWIhEEDhG
	UWN42je0bReCh1/TQlO7pv4bmtXoCHQft4bsuRw==
X-Received: by 2002:a17:90b:2dcc:b0:352:ece8:1f6c with SMTP id 98e67ed59e1d1-353ff8f1955mr532694a91.8.1769494253530;
        Mon, 26 Jan 2026 22:10:53 -0800 (PST)
X-Received: by 2002:a17:90b:2dcc:b0:352:ece8:1f6c with SMTP id 98e67ed59e1d1-353ff8f1955mr532679a91.8.1769494253014;
        Mon, 26 Jan 2026 22:10:53 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f616f897sm1268060a91.17.2026.01.26.22.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 22:10:52 -0800 (PST)
Message-ID: <cb3a3788-e8ab-4c2c-811c-b2bc4d9281ef@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 11:40:46 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add video clock controller
 on Glymur SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260124-glymur_videocc-v1-0-668f8b9c63be@oss.qualcomm.com>
 <20260124-glymur_videocc-v1-1-668f8b9c63be@oss.qualcomm.com>
 <gxbzaayts6esoje4kwak3iey2pj7wu4focdgd3vmu7qr2qqrld@wlaf5kclbvmv>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <gxbzaayts6esoje4kwak3iey2pj7wu4focdgd3vmu7qr2qqrld@wlaf5kclbvmv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KMZEa1l27vf0ycf1_C3ABhykoDKyz_yG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA0OCBTYWx0ZWRfX5MzYeVenBHuu
 gT42sdRMjPg+ShvJXn8curCZIho1jrZo1hzwaQH6DQe7O3CLI7UiDJ409ToPGdRVLPfsLrPos53
 7JT/A9MYeJf0duujxV3PEfBROkXRKMtRzrIWkVDYxKZGQTLimlfiZXQME1X66YCFwGFz4V0By0F
 3uy2EFs7rPLdbTeHa8of3B11rJS8G5ZQ9rV1VYanFUDsRWGa4vTGx3qlS3b/iN78RBxDPUuuept
 B/mBKe0PF2qPgavtvHZdZfvXfmL7jmkfVB58c4oivTe8H0dmc1H18pcRKHONHhMKmh/gLNTx3eP
 2wWTSxxy6u4854SZkZpsxXtQc/0Sz9AxqIUgfsizFL82M70NqHXRNbYQxSBfCpP2sRmeEVXbnGj
 +nTlbPCSPq7IjlIXw+AL6Y0ymksHD/S17dCgTJfyeokIJ2oZH0jNtTBND87VxXJ80uIBT3bwglD
 Lj/tq+n9/DTQaUekd3A==
X-Proofpoint-GUID: KMZEa1l27vf0ycf1_C3ABhykoDKyz_yG
X-Authority-Analysis: v=2.4 cv=AOFXvqQI c=1 sm=1 tr=0 ts=697856ee cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Tx_EphR7kuRjRygJVO8A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270048



On 1/25/2026 1:50 AM, Dmitry Baryshkov wrote:
> On Sat, Jan 24, 2026 at 11:05:02PM +0530, Taniya Das wrote:
>> Add compatible string for Glymur video clock controller and the bindings
>> for Glymur Qualcomm SoC. Add the clock resets required from the GCC
>> clock controller for Video.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
>>  include/dt-bindings/clock/qcom,glymur-gcc.h        |  1 +
>>  include/dt-bindings/clock/qcom,glymur-videocc.h    | 45 ++++++++++++++++++++++
>>  3 files changed, 49 insertions(+)
>>
>> diff --git a/include/dt-bindings/clock/qcom,glymur-gcc.h b/include/dt-bindings/clock/qcom,glymur-gcc.h
>> index 10c12b8c51c34c5931c34b4437be03aea098ba53..6907653c79927f0ff32c98c75d830b719ce14d51 100644
>> --- a/include/dt-bindings/clock/qcom,glymur-gcc.h
>> +++ b/include/dt-bindings/clock/qcom,glymur-gcc.h
>> @@ -574,5 +574,6 @@
>>  #define GCC_VIDEO_AXI0_CLK_ARES					89
>>  #define GCC_VIDEO_AXI1_CLK_ARES					90
>>  #define GCC_VIDEO_BCR						91
>> +#define GCC_VIDEO_AXI0C_CLK_ARES				92
> 
> I think this one should be split to a separate patch and paired with the
> corresponding driver change.
> 

Sure, will split it up.

>>  
>>  #endif
> 

-- 
Thanks,
Taniya Das

