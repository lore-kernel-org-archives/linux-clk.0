Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013F438D6BA
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 13:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149540; cv=none; b=CEyrZ6KR2N5GKYsMzsP3B5GUHdZOyEGzqkG/66OXeqEBrKrYSZfcu6FvBBE2e9MV6PKHQtGakTBZkz+Vg9UOQT89nTiAU55LnlN43l4qkGjmjC038kh2yeLdThYLeN7142sSoIaEqkzzG30Jf8GqihjXEgEn1m9opkmna9cshxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149540; c=relaxed/simple;
	bh=y09ja/AsRoZju+Ks6o6jz6PynHLhaXdqYBnQb29LTGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PKM4xLWt4tZbNiyUZRSbqxQiWwQgSmwvt9RrKXHRfL0KfWxfK9ZwFOM/p923HMkpKwHNABAgoeNYTUe3MrHvH724pM//fZUCDWqKIwCSA6QbQUI7K20hsG3qTGPpyOUU+Pnb2QcYyybHfDDBtc/WllSlCIuvN5MP1bZHkeMVtAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jxaJvtlS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fE+vB1NU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jxaJvtlS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fE+vB1NU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaRS43417073
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 13:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hTHBGwandiuyyY7wOt4R1PkYKvTARIsGpSYpehy0tKk=; b=jxaJvtlSN9jgBvZk
	DAXLPHWrk1lWTqXBz8+0LM+XwxDiznoRQI2Ha+NGL0RAzEx7wThUHEGAIUxIg42H
	di70wFicoIkW5VOYn/vgPvpRPaUbd+MerTdZyvhkpu3jsw0B9N6X3r8buJB3ytNJ
	MliVKCP01er+toUcZhL5GgELO9Be0TPY7tdv+mQFz2FpA4CbJ3Y/QtDkZ/mV/aeL
	gJ/s1S5MRV7Ca1WMGNCyt02AU6ve7e6LXX9GPFxIAa5uFPSrhm1VNjFhVuFkrMTP
	2avmFEmpLkjlr+O+BhdySvnDRc5mYiM0b0M4QB6gqjkwlDrJH8U4Uak72dnQiovu
	UQtHsw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja28f8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 13:32:16 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4173d956b60so2467334fac.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 06:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773149536; x=1773754336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hTHBGwandiuyyY7wOt4R1PkYKvTARIsGpSYpehy0tKk=;
        b=fE+vB1NUlDP0wN3y+tkTGNgTc3HIUnZGotTAplxFdmxqSms0NcqvmR3l9dXpcY0FMC
         K8tAvZAj7o3Vv7vYex/AUx+IMrMkKMJ2EKzb+5HvlpGmgFt7DYDT7AFqxIfF/XD2ba5N
         hy/u2dshVF13gGolhid5KNfXz2Q3uP2v3ivLnOUaUTje3U2v2djTwHmP2NENEE8QCQHs
         PPXas8COMpT+w4HFnN0KTXsLua5/fB4mYzJhm7ROwQd/QyfjP+11xkprNFCi7E+fWiUJ
         pEFQH1D53qBNlqm7HyhkSDKaCmLf6UUVbpUnZwi2DLeNQnV1nvuDLa/UicXjjxU53XFN
         PQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149536; x=1773754336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTHBGwandiuyyY7wOt4R1PkYKvTARIsGpSYpehy0tKk=;
        b=L8lJl5FUC4isWdS/n/+v2Kk+nvrdzYEPQl5RJT+oahlNuzFuuoWbdAzShKYRQWKKaf
         9bkms4gscUWKq4QNpbZlu6wHQSkapdXwGP5O8IHo4EPqPM5ADtW6Bvb5DNYuv240t1Fu
         Xab43NTIvnsKAjg5UThWl9OuukjsWhau5H6txrKEUk6knYF8gPL+MrprUExfzPt6Too4
         IsucD3xCud7PwUna+ODA05OZ01InDTSCKP8SkXtvP6hT+4Q6zCGbyui168Q2LSFaHt40
         66KWzi6rZdk4+pH0a69iFzYzqJp+J8qI1tLw/gC4cZgjxXNOqYVI6bxW8k6oqZN9oyMH
         +oaw==
X-Forwarded-Encrypted: i=1; AJvYcCVdb4d1hb03llpuOBYQceWrW6L8e4rz2ycOSXZpU8SvuW9oATVTtor38N3qOR9I2tvKFLHomyUG+fY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Gg+gbEBZhLlMJ5t0K+XEtat+PTLK9DJNjoW8QZA/3pwg05+7
	txYgUPLDYSsvczCVPqeRl+JtkvEAf0QXBOnzrqLwDfI7RzwUOdiPRR7u3MFLKZ6Czc6NnhcCePm
	G3r2mG4ylqp6/amB/RXBKaCD2cA01iHKZcu0ciCJU3fIsVJGTWZFiZXB9YbwJGs8=
X-Gm-Gg: ATEYQzxXBxuBQ8A8oszBZpTT5TF59POJjVObk0DvBGg6jaCPi/PGsJFGodw2OWhAtvO
	sWL/bSY0jbOXFhZl4R8SmUsxyiMUjRJgda/n02MEBi9H1W9FxC+kKe+adg7qCrIJQHuMo6Afvve
	5gyxbghFd3YeTIt6LZIRK7z/iXyfSce3/mmv7G/Gs4hBA/q95n9vme3SPfDee0GGyd73s3K7sND
	QZQ2MtJyd4lQ9VXGNRTe3s4MUed7PB5RLYNAPYJ5hBtBpQmKpg31KvOyDuAHqIt+VNNHLTORFAe
	RqPm17QVT3ZkQA4Tv6+4cEZeI0jViAS4krngn3W+zESwfpQqvnccYL6ZSSeFyA4iqE0FeguZVDf
	OghZ3L+kZFVrg5ed66mx3JiW6R+e+ViHKG8MOUy0p8Z7s49KAT/UIxz6tlZpC8RBkmwoIbw3upC
	r9vEA=
X-Received: by 2002:a05:6871:2e94:b0:417:3414:3ce6 with SMTP id 586e51a60fabf-41734143f54mr3317746fac.0.1773149536160;
        Tue, 10 Mar 2026 06:32:16 -0700 (PDT)
X-Received: by 2002:a05:6871:2e94:b0:417:3414:3ce6 with SMTP id 586e51a60fabf-41734143f54mr3317726fac.0.1773149535720;
        Tue, 10 Mar 2026 06:32:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b96e07dc7aesm354874866b.35.2026.03.10.06.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:32:14 -0700 (PDT)
Message-ID: <af606d6c-3ce3-4342-bd5c-ce3ea28c6923@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:32:11 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU
 nodes
To: Pengyu Luo <mitltlatltl@gmail.com>, taniya.das@oss.qualcomm.com
Cc: abel.vesa@oss.qualcomm.com, ajit.pandey@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        imran.shaik@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
References: <CAH2e8h4R-nF+eV+OnkSySKSY5_H-V8Ndyfhac3=VNQ-bMaBeFg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h4R-nF+eV+OnkSySKSY5_H-V8Ndyfhac3=VNQ-bMaBeFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b01d60 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=wQPFRYplTptn7ZEjZC4A:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-ORIG-GUID: wCo7WXDiDIugNQ9nfgC2Khwg3DdaEAlv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNyBTYWx0ZWRfX9Xz8gJvycZQ5
 Jyxnos76MYmnxPdmC4gIsIvb7BpBca5jXSNdvtT+U9E3qL2peQte1GpM2t2dEFcenTgsaLIrVnF
 qa7e5hu7U5KgGQkPSZLXxifXDGbjVLA/Y0krgvX/swZtaURycZIbcfnuWvP00EkXmE/YLuGG/xx
 ziD5n2NaDGBKNTl4Z5XSAox8ZFlfkqqXEThRnWMsoloQcmNauKIj0oxTMY/wX890TRkd7EyELfs
 HrnzZQ+ZdEUBtUyEnTg0w8ASImXaBDg/3OtHclNVqTXBov8rer18nNbY700K7uv6JIduPXlbMk4
 NY/fouKb6kcTCqs0ONkWnfIFrBxu1vJ6TQBXlpwtOTKApHoGLKh/gpuClOKgroReWqbAxQOYQBh
 w1f8sEfXos2PROYTE+aqlgWg82+6lkaEjUm0DQGWm2mhTK2x+pTDNHy9/+6gw3AiGus6gTidHtC
 e93/qw9QfDyHxpA5AGg==
X-Proofpoint-GUID: wCo7WXDiDIugNQ9nfgC2Khwg3DdaEAlv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100117

On 3/9/26 11:27 AM, Pengyu Luo wrote:
> On Thu, Mar 5, 2026 6:40 PM Taniya Das <taniya.das@oss.qualcomm.com> wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
>> is simply a separate block housing the GX GDSC) nodes, required to
>> power up the graphics-related hardware.
>>
>> Make use of it by enabling the associated IOMMU as well. The GPU itself
>> needs some more work and will be enabled later.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>
> 
> Hi Taniya and Konrad, GX GDSC stuck at 'on' on my device
> the raw register values are
> 
> 0x3d68024: 0x00000000
> 0x3d68028: 0x00000000

These likely indicate that some clock or voltage rail is not accessible
at the very moment you're reading them back

GPU support for 8750 is not yet upstream (and A830 is somewhat different
vs the supported A840) - there may be something wrong in that sequence.

I heard it's in the works though, so you may be better off waiting a bit.

Konrad
