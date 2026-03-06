Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DAF38F250
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 14:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809122; cv=none; b=BtV/WQJYy/budQPLtN9UK4H+l12ik1FU021QLpOLyXaEVX1Tzd/ORSxJxabBcqngMf3Ac6xjE3biF+s2oJYeXdYGj1PanUSANtboNGv5vj38PhC2XAZoGxSM2oBr87YerxXRWEY9FZUiDb8HnmItvqEx+zK+wa/GytKj7yBJoaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809122; c=relaxed/simple;
	bh=bwjilBTEBISnA9MRCHz5a28UWCOJqJK3s4JWR2vnaPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QS6z4nc1KTCyYKfbXL8ihc3E5+Nzc4ljleNWpQbrkAOEEgmixoDkR4IdWaeFopOo94Q9xcjovseqB/ozRUZEzcuw22bRXIJ6JstazPM7/xs3YsRR1+SCQSTeyltcjwVHHYmrt5rzXxIObvIvHOKkc6RxsRTsv1OFkZFx9RF99hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcPb6H30; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I86UXxza; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcPb6H30";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I86UXxza"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BauOi864927
	for <linux-clk@vger.kernel.org>; Fri, 6 Mar 2026 14:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DYWfBwn/reMz1eYK1IJk/FvySNHJ0NTJNTSO0VoHBCU=; b=WcPb6H30LOfVn6ON
	Zf6nnTrGLLSCIlO++fX+mMuWz3mWIwDc0FS5LiA6+Zlxh2jaDlFcmGDe3DfbxAlN
	WExNMrNPGnGeuNBsjh0qjb4apv6mG1gMLFhf6g85IJaW3KTeKCA890At3g0WadIY
	8hEsv0zDLkIEzSqv3aIDzzcEWxHR7+D3QDdAg9OHl71gDo6R0YcBUcR7Gy7XoAPw
	UF3L+lpk/epH2Y9R4l4uAN4rZaR8aqVUncmd5XR5yX0kqLNefrHkqlbKTzyxOkr0
	Wwj5EfiBD6ZRW+Zs0LkNvKz1J+tmaNgUb+v1bQIzWW8g476fP78C/p0XD3X2S/TN
	qTeFQw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5suk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 14:58:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae66ee7354so35781855ad.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 06:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772809119; x=1773413919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DYWfBwn/reMz1eYK1IJk/FvySNHJ0NTJNTSO0VoHBCU=;
        b=I86UXxza0xH+zdbudVD/sKBP/HRoFlzr7D6YrwEKPkPXVH+0Io4EGCg44MU9R6jlbD
         ywuR3EF3dkvDGTQHQdliybilIv/mz2usCrmDyB26q93HhP3Lb1fa+4jsVdOOyxiee84Y
         HBdMiSwKtYR6PvpaQn2XQk3L9U3mhevqbx0bp6j52c4TOJKYiQ23NGMt3O0ErAKtjCCh
         B1FMkWby/855NgGewlC3NdIHGwDrN3Dgb0dBi5cv/SrwG1LlTJiiAlz4Hb6tdst4H7DH
         OgXL2wtY4U01rnpGy12N+yTRvT+fDRRPyIhCsdB8oFICxg+NFo8UF0KSM1a8cngMXRTG
         uZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809119; x=1773413919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYWfBwn/reMz1eYK1IJk/FvySNHJ0NTJNTSO0VoHBCU=;
        b=EofTn7PVUmU0DweHJ5i3TEyruGSlW9dtHR4h7djr58ZWjzLalxH3MlMwT5syNlePCM
         UbXqOVZccl9bLzYnjuqW1iKKztHrvDRUdnS6Jn1UlxdLio93/+9/qraHQoKekkTMS5jA
         y5vGQelQ/aZAyFpTvGl1yI98UzjXwhNnuAFA8o/SQcwA45yyjXmgQZ6VU+tleQKjdxlK
         v2l+etKoRpPrZMq3IWPJ4Pisnn8ZeYaSQ/73I5n3TDw8h+jFHUTGn6hqzjqtJaEMHxEe
         k7O4/fma8r2QY8HnrE6b0wCW8JRzcxMteRRYbs6hioid7Y5tI42nQTP5rKv0IpjyM9DG
         CDxA==
X-Forwarded-Encrypted: i=1; AJvYcCWND6Nz2hCBehVrjy2Ovi1xdyKepxHyQ5tMBREPsqPWUOEg5Nw37hNbwA4SCg+QCpPCRQOzkwggsRg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykybx8I4ow4Bv6ixsgzd4KDhSar7gB9zodJd9KVwIMIkItG/Bw
	1Sm5DngvpVJroQoCnqdUalEIJeScOpMKZkvXaYw7AfC8EBrq3IBbAhIUbUFJUM52cnP1HGvnAoR
	pAf8z7f6JuO4W9h/lEQ0H2L8j1UmYkSM8YM984kd4IQcVSHgPMklfShPr8dxF+eE=
X-Gm-Gg: ATEYQzzS8vxtsErQcnGTk8YOUEF0qP+OWBsBlKpVhmbMlRPrrTCH/IutdNtDh+vjg1v
	F0e+iPGyi6kaq9YnO7uKz4u0f29Mm37LaA5buW/nbcfiZLiAG49aF31BT+MMCPUKEImtkKTbBnA
	ibFtqPmKAGrdNXEnHRZf3jcFgw4ipAjZ8FlM8JxmX+o0grS5J6FQU0HoIFNr8AUpPkXf6wf6wxo
	EGz9D651eXJEFiljkqX4cTzEj9xQyRdtCm9MWzrog4oJJ1BxYbEZeczNdEchG2P606JgmEJg+ZK
	t/zOQK/XVW3tShjRhWm8ZBUojfaxgeR6rp2gRu5MVpi65tL5lfrSPSrivVT/atJsnOS3qY7ZYVf
	yibxicZMx/X9q7v/tT9t4DQFzg2yYjrBgsJgEsQPEqdmNxJ75+qrDlpzsgkB0yiiPMCBrPYeeVn
	9HJawK2x4W4rg=
X-Received: by 2002:a17:902:d48b:b0:2ae:3d7d:d903 with SMTP id d9443c01a7336-2ae824465e5mr26588785ad.18.1772809118981;
        Fri, 06 Mar 2026 06:58:38 -0800 (PST)
X-Received: by 2002:a17:902:d48b:b0:2ae:3d7d:d903 with SMTP id d9443c01a7336-2ae824465e5mr26588485ad.18.1772809118457;
        Fri, 06 Mar 2026 06:58:38 -0800 (PST)
Received: from ?IPV6:2401:4900:88f5:81:e13b:ce78:7823:d9c3? ([2401:4900:88f5:81:e13b:ce78:7823:d9c3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575f3sm31997295ad.8.2026.03.06.06.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 06:58:38 -0800 (PST)
Message-ID: <d9d8f959-9386-4460-a63c-200fa3853f48@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:28:28 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-6-dbbd2d258bd6@oss.qualcomm.com>
 <3f69539c-7383-4321-8cc6-1f5a8cc23822@kernel.org>
 <dd256b85-b88f-4163-a1e0-52c976089eae@kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <dd256b85-b88f-4163-a1e0-52c976089eae@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6BHwQgd0fgmSq-o3QSOFp5QbbIx2WQtp
X-Proofpoint-GUID: 6BHwQgd0fgmSq-o3QSOFp5QbbIx2WQtp
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69aaeba0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=x1fEtfQZAWo4FmDVKCEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0MyBTYWx0ZWRfX38CXvsjH+l5W
 13DM9f+ibvWAG5GmhBb5CBGH0AQ6xxWsh2LcuGIGdzOdv9VDp+QIUkpBz7Q6wXAwQyCcXVukvqH
 JgFDBi87EbfCTPsOneI3lk8OyrhaulfPrieBwnBgjrCrdcmI19lSejzdGxxqD7KbqZ211iivUz8
 feyyHe50Rm7cDgD+dFPRAjxfka/5cwWyrCtpfs085rlFbDuOWhU9+4P7SkQBiugDiNCbhfhCTPa
 s3AA7Rxq+m6PPGBNIZ4q/4A35YFEkshnF3Rc3gGiGkWdHNZ8mtqz3PY4v3wUSGsgGJqtR2qixgN
 5tXwxxA7/Q55tfAhIBJdRhttHModJuKkUP1ZXEsHyp0UfyLMmg4dE1YloZIYrpyt8csMj4F/2dJ
 /hC4rWanqTbqKmArxG63CkvXnQeetL8aOhxgL9mnXKt9LzYf8P78Ob/wpXe03WKID1N285ENwD7
 2h8+tl2n0PY7iMyT9Iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060143



On 3/5/2026 5:30 PM, Krzysztof Kozlowski wrote:
> On 05/03/2026 12:58, Krzysztof Kozlowski wrote:
>> On 04/03/2026 18:40, Jagadeesh Kona wrote:
>>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>
>>> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
>>> of previous CAMCC blocks with the exception of having two required
>>> power-domains not just one. And update the compatible for camcc and
>>> videocc nodes on Purwa to match with their respective Purwa (X1P42100)
>>> specific drivers.
>>>
>>> Fixes: a8a5ea012471 ("arm64: dts: qcom: x1e80100: Add videocc")
>>
>> How is this a fix? Describe the user-observable bug in such case.
>>
>>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>
>> Three people reviewed this...
>>
> 
> Actually I checked now - all the people reviewed commit without fixes
> tag and you just added.
> 
> OK, this starts looking bad because it is more of such patterns from
> Qualcomm these two weeks.
> 
> Stop funneling features into LTS kernels.
> 
> NAK
> 

There was a comment in previous series to add fixes tag for Purwa DT
change that updates the compatible for videocc & camcc nodes since Purwa
was using incorrect drivers currently, and squash that patch into this
change. 

Since I squashed that other patch into this change, I added fixes tag to
this change, I will drop fixes tag in the next series.

Thanks,
Jagadeesh 




