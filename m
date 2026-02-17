Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03182326950
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 11:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329057; cv=none; b=rkyAo5PPjQ5Q3gtCLUf2oxsCdFrtGgI6DVqoX8qCmKaRzqkaZfr5AYaA6TrvKejOtM5VqpM4UnHnwfXFdSAPnLz3/FI0XybX5mwyW7RfmC+XGMo8XHcCltNiGitPe6CLd2/wBB/QfM63NQyzFDgWZExJyxI4nauSGKq4Uokn7TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329057; c=relaxed/simple;
	bh=GfrhspEOoj2X17wPsezEFlowPHO0fecFDfA9xsF812o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=miI8ivIaZGI7B/gac1/qC05WV1SxqNW/fldeWJd2ZF8Wv5B8CRMqb7LCzl8HLHeYwdqwfBJQto6+efSoNY/6dDxGDH1XyaA2TchouUR27yAXeV78mGMcnc5fyIGr86RniIwNyIggJ6qgu9ktKr0y/5YLhanWHI8loD+mPi2bCQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pbz09iiM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvwTaGMD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pbz09iiM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvwTaGMD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HB1jNw912069
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 11:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HnkLXMMogq7XjsBUG9HORb7n5lxarzcSidwd8uzWC5E=; b=pbz09iiMCa8Qv3l7
	fCG76peBTjsmAYX/bi0yaJYI/Zuxn4XfHBQCpxum9jPLDShe8zpvJOtPZHx4arPH
	9oLScJK7Cukb5UgEeEBEvvt0+RR0t7InW2wps/R/tXO8seaGx88G5YCxphP3ICKB
	M5zAa1EuyPxNJf4bhBT6q8EF0Z/h6xMm57/zelb0ujMG/Jc3vWhoTWjPzbsAy1jk
	ZhW7S62E+21PUKpvQl6NWnkl7uxqwjf8Gm/5gvuGk15KxgJD+bc75S8fHY6NBQg1
	8URQS1AaWYRZ7MkujyH+g9/1VOy3cWpe6SLhcb/07CCveLSQ+IdmF2TyR0aQOPFL
	bDamhg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9t6wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 11:50:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89496f5086dso34238766d6.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 03:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329054; x=1771933854; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HnkLXMMogq7XjsBUG9HORb7n5lxarzcSidwd8uzWC5E=;
        b=WvwTaGMDZLXY/+h1rfz6S4iGnW35/Sdq4/R8yCWJn5IdGIYmSJb5RTNzCnKb3Oq2vZ
         jkhbpCXoFpC+Os+h7msE7KAg0MUgs+G+P921HuhnlwdQCghpruL/MyojVrbilO4k1tsN
         7LrJ2+GjZ8uSSEoUQbdl/6nFxN7DN5aVKeJJMF30hmI0YtKJ5XimriU5gjyUHCddawvM
         JYHL7bvp6+YkGUQctnjHP5jFiw+hTwqNmPHTzkcIVffnTIWH0Xbw//RV6UautaHolGFH
         AWMN0Ok18HwJIeB5S3JnESADKElLKgzMUwTvA/T1rhT1vXKITKyc8wnVtvv7IIV1Ej7+
         HzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329054; x=1771933854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HnkLXMMogq7XjsBUG9HORb7n5lxarzcSidwd8uzWC5E=;
        b=UzyjnR4dZneu5xSvBDDDppVeHv1bm1ynxf+O8lhB0rr4exdqOYFfJzH86aEK/9jxB5
         pToCcP8s9agdL41laV8TKxDy7y4Q/oOptMKW4h2p+vfgvXpkd2z9951jOFAuxrw/kXlH
         8J6YW/IpLPFdfrtVL12tSp5mhaOsNe/j9kyNaqGuoEjfBQKQst5o9VUYJ04pZoZA1ZiO
         hf4yK6LXIxTvXftumryDwRK94Fu0KVcWd+4fSOLgh0NyCN5BuSouqjtHu2Ztp+sksM+3
         Tf0gQtpD3MVwzTriZ0a8U01K8OgS2uMLptyDqn/t3x2fCg6x65guVIMyOL3V9pwvRLVI
         +pgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFTQn0DqWVBHP4auwoepRsIo3HLmXh6A9Z3oNVquI6o7q4dfvi89UbnwHojtoGpek4skHu6j3tbd4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9/3NcoZJhM6ZsStiZZbO7apHAOrrLlbQsVJlgeLD80Gy2GvdU
	Ylkx3+TWbjxWYl+lUjiiCfg9B6VUoLMCsO1DjAiCRDeydWDdWj9bTG7c3mkrt9Ruc3Io3773MYX
	55qVI/pRDSFQeXQmto8S704k9LGYUuuvxRuHui1D6dvPxfkOIyq0utufJDhRM4fo=
X-Gm-Gg: AZuq6aJ2JqbLtOR0qQetd3Lr/XFFcxm/K6veB8Q4iFpKFIOR5Wnp9ZN6bFQA0lHhSsD
	K9JO9n8w8pWAE4Hpw3aTLNX1I7ToNHCLCwywdMmq3sMoTAGPVgOb1GNbGh5W9yz6mXr+iFOxfpE
	fb1JdtOB5AB4vZgEgpTHafpTnNFzsnqbpdMUNnzogfMWvpg1+8WdZyvj1RZaSGLqRDMj50NKa6X
	vzg4TRtJB4NQ4zJgxHt9keoSnPSasCyuQ95ScwWXNrEDXpPDb1HJGT8qKGK/yy5SK1o6zoOLfje
	pgTXc8uIW8v4+TUFkDXJIwz0z4ymFgZXblLpD/kB8T5dygL5pmjKMj6TiImNUqtqe3N3QWGJVL0
	HRYd+ATtPbyBrOuM7vJMaCntbaM20XVnCNOZrqd604Ol8VinCrT6e4t+pL2H34N0qJogA+Xxy+X
	uL3ig=
X-Received: by 2002:a05:6214:8004:b0:895:4afd:5dea with SMTP id 6a1803df08f44-89734625af4mr140112166d6.0.1771329054513;
        Tue, 17 Feb 2026 03:50:54 -0800 (PST)
X-Received: by 2002:a05:6214:8004:b0:895:4afd:5dea with SMTP id 6a1803df08f44-89734625af4mr140111986d6.0.1771329054063;
        Tue, 17 Feb 2026 03:50:54 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc766579asm337738466b.54.2026.02.17.03.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 03:50:53 -0800 (PST)
Message-ID: <270589cf-383c-4062-baad-d232f7eef3d5@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 12:50:50 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/8] clk: qcom: Remove tcsrcc-sm8750
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das
 <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202-topic-8750_tcsr-v1-6-cd7e6648c64f@oss.qualcomm.com>
 <sxjrbxwi64ky6dcntpnnbi3y5ujtssz7uno22xiwiqjdhp7rxi@b2nsnmb74vnb>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <sxjrbxwi64ky6dcntpnnbi3y5ujtssz7uno22xiwiqjdhp7rxi@b2nsnmb74vnb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OCBTYWx0ZWRfX98ljhFcw1PfR
 brYX9lRPywIi1s9tUeTz2gL/YAskYb/Hpwu/Jzx98Nn8ugpkyrMNS0LBiZNSVqOQF/x5p0i8piY
 6MLMmtkBtCom+E8SCjZXDQlcDtlEF+kEbMaUJb7wEOQbrb3tNOtynMXPVc93UPJBbgtHWWuXek1
 E1PnxdTuvdmbw9U0nhfNlbaTt0SS+4RLTGtP+JrfKL9GY81jldmNUzAPaZUW8CuMSfjFfqx+63w
 rpQtBS1qd/QefoNdA12d92YCehu0tGi0ZzQTtFqnha8qkSAddv1zu/9B8JMap402teBtQNXbFan
 FN+DfQT3nRpRz/I1gKt9K04yFyhv+pe2FJ3XriAiQ1+M4sLNoYlBKsx6iXz0zLFD8wObCUf2q3H
 Sbq8th0XsBH6Vre/slFWZcRi/0rLejkEvm84PyI2/F4F73zMGH1PqYB9F15uQ1tXoDCo8w/C1nl
 7+jDelqc24lxUQkkMeQ==
X-Proofpoint-GUID: 0sE9kCtN_lfRkQFXCZBIZ1j11z7-WTl2
X-Proofpoint-ORIG-GUID: 0sE9kCtN_lfRkQFXCZBIZ1j11z7-WTl2
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=6994561f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=QE9C4deyE4KVDz0N1ssA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170098

On 2/17/26 12:48 PM, Abel Vesa wrote:
> On 26-02-02 15:57:38, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> This is now handled from within the pinctrl subsystem, since there is
>> no "CC" block inside SM8750's TCSR, as the corresponding hardware is
>> present within TLMM. Remove the leftovers.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> So bindings remain in then...

Yes, to limit the explosiveness I decided to reuse the existing
ones.. I think that's the reasonable way to go

Konrad
