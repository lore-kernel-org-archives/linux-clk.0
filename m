Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C24330D2F
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 11:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822695; cv=none; b=g3TZHqEHAhDTa+UMWdVjfQzmSLsGnOMXso6S9Qo9RHwm/eu1iIt2iPGcGOUtp8Aox+PengNy0mDGlMDL7iqBYpllUnRVKCAMf6R6wOZlEazV6ahPSKpbvuAzLbMEAtcnIMpkHHsMLVPUAgxA1aA2RPv5XqL7bBIw5HEGMmPwucI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822695; c=relaxed/simple;
	bh=ctUO0h3bkvxYBr86tkrbliK/doG84nCjqEI/sOZ4WH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DyuJxhPZSTTARevtBkmJZK9uIRN9qyMjt6ZoaZuxqcpuQkT1H0/bILfaqlFD1MbreD6KzQFLWgxypGVIjsaAgyBtR+/AwANX2fnbx612peNeT14k8BoamT6wxrsd/5pjLSxjvy45KrFqM5OvyiudNfNEXhEy41/rUhamMeFFj5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VLC2u/lP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S2IKZK9D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLC2u/lP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S2IKZK9D"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U4xfbT2622764
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 11:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PDon4uLNy2yUeectcUHOsh5oGOg/cnHyQWjexZNhfK4=; b=VLC2u/lPXur0GJob
	17hFFVud8/MEeNG4GKJpWn+gH05lfyd/Gy46armaOCxDcp+LqPvaj3FNxJ8tfmrP
	b0SUPi5B4bsNWzdvGKFBzP0Pzxb+RzMzj22DcpCVwGG2J0TfXUrY+KFVFUOvg5Qk
	TJCkSt7k2pawd6KnJeJClPQVMj8JvaHWl57T4JnOaW70J5SNLZN75TFJYgjH5hqW
	E3ZMVIcCsRtcd5r+YJnr4QsALrlKbaRnn4Ln8aE3trdCXKWpXCL4CUTkM4dk3qnT
	8ohXE6L/f6JUsLzaXmy0/quOcXG4egL4NLmHL3OssZ7IGN/CqOiHOD38C7SAlOGj
	EDW0mg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a41fxh2ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 11:11:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-883618130f5so33537185a.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 04:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761822692; x=1762427492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PDon4uLNy2yUeectcUHOsh5oGOg/cnHyQWjexZNhfK4=;
        b=S2IKZK9Dm5xw77lsoQej5qWokCxjgHtf0RNJw/Y+xxw3oslVvBNejLDogyaEuKgz+t
         cJwcmyc6ahTj24ZJ7zpaG0rVFElygB5+UhHomhQ8+BRGSqI1/+CVZE/BBpDMlqYyhU90
         eaYaXe+pKKVP8+ut+wLEVGe62YmMcQ+ePkZHUqmfB6DWLfAwGBkAzN0wBmo6hZS9viKF
         g4v1p1jCjHMFNe/oeFs5+K5ulCcyEfF0DYEHgnvAJR9y1HiGxLDSdEKQMjPW1mVJHbQm
         TV/V5OxuNpIaxcW+GMdnDvP5YmbgiK4v0IvORXQJvKcf4LDHbMHMJAn/RLhW7ItR2kpo
         eU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761822692; x=1762427492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDon4uLNy2yUeectcUHOsh5oGOg/cnHyQWjexZNhfK4=;
        b=YEOF3ozRw08NV8F6SqFafIs62KFSODIMFn5T9HdEA4iWhqwIT9QgvEbi/6qpuowh12
         fRfKj3fEJq9b85CZTW7BCBZkLXMqgIrEqyBTd+dI1ThaThkI5jUHwU8X86gKsgWaS0oD
         ZzbOfvHeCRTCh6zwxBacpk8YtUWnz/J/teVsKS3yf3Y+0MaQ9nd09qXbEt569+TQQgVZ
         ySYyWosiN0F+c1mogl1hFJVWfSN8ikM5Y9y7W3oxKy37FRDjNvK4emaMjbsRpyHM0fdb
         o+PEtriq6T4bE62hQdH1jZAQxCbjzveifalOgu+7iiA1LAWSo12TE1euz4Ujmly0gYwe
         Cl6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8hmScBtnWql1JUAtcoMbE2y74TAU87XJMmLotWYIOZjFUs7NSgDXR0DbGXiV04O48tVmS20YURTU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9GKzRceRGVXlN5Or4F0RuzIOxxEb+w5xm3APhQ1x1X4G8MC4g
	0eREWRBt7/m/eN52Kc9Tip0zOfYOp90AQwM5lLwbqsgAu0DvOXNMwelxK3oCRqg2z7c7Qvi9eNE
	Ayy92uYPz5hKqvhdyOgW6xdrcYRwBDi1mKp0Ms6Z/2m/H0tB3XXpvSaE0rX9h1z0=
X-Gm-Gg: ASbGncvwormP+v+neNm3Suxf1e500B+YxOxz4bNDcBJaf/TMHKUmsOu1IR2zC+ZNV1X
	hvI4MzVxgr88LF/hynHhuFusHEWFOdu3MfXzArXfGpX0H3EFrFOHP9mUZVOtbHnujmIz+yu/T8s
	JXskgoJTJ1JxhV3iBojtbpvnZtGchqo/G4IgOkrP+MX8+EXNdGPHZojzVfjraedDBtUpmE8J1DK
	v0+MF23sZIULdKin66QtSb/K9WQRTTn9nvB1nQ1pBWI9NWMiueOGX0vG/ldPLMYFSMfwgVp2Nt7
	zuPLtuvT7xv08lbEjfWOMyStsokHC7aOdwvysS3UMUO0gLaoZDZ/i4S3srnTOVuocHy5RAB30GE
	Z/miyURe1orJxujpB8Yj9NZqbO8DrIQf+OLK6u4Jod8SsEu+6dPpH7ukr
X-Received: by 2002:a05:622a:54c:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ed15b4b304mr59170421cf.2.1761822692449;
        Thu, 30 Oct 2025 04:11:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUeZyE7zsL9Ndn5kVCCm7WCbI+wxddHa4VCy1ePFSnHykBK9zYrDXNkInOEGWmaNKPC/788g==
X-Received: by 2002:a05:622a:54c:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ed15b4b304mr59170111cf.2.1761822691954;
        Thu, 30 Oct 2025 04:11:31 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7efb97b3sm14460770a12.30.2025.10.30.04.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 04:11:31 -0700 (PDT)
Message-ID: <d001f158-008e-4aa2-9f30-a06d314377e0@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 12:11:28 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] clk: qcom: videocc-sm8750: Add video clock
 controller driver for SM8750
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251024-sm8750-videocc-v2-v3-0-6286bbda3c8e@oss.qualcomm.com>
 <20251024-sm8750-videocc-v2-v3-4-6286bbda3c8e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251024-sm8750-videocc-v2-v3-4-6286bbda3c8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tgx0ZCptODT-HnOU5_bVzOqH98FhW9T1
X-Authority-Analysis: v=2.4 cv=UJrQ3Sfy c=1 sm=1 tr=0 ts=690347e5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=d7ClhsmVZ3m4v3ji_18A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: tgx0ZCptODT-HnOU5_bVzOqH98FhW9T1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5MCBTYWx0ZWRfX7Kpj8n4vM6XC
 Gwm/R3tzI4/4/VupEcOmZ9c34CDnLAsHH36/B0NgfQc+0rX43yhNTTJ1pJK8sIUeIrYHpwb7Gcq
 MXXUtCUh2gA9pD8tt0svMeDnVrwxVEtskyx+YB7KX6Y2dqi2k/4knRnW6/QKUw6PKOsbxXyWlsh
 AbZ+KoKocxvN4qXe8ycs41PyHEGJbXvcnokHOJSkhwcqeIJSgjuL3Vq1hZAmcwwjv41iVBrSy8B
 rJT0ddQZBgiizIEe4e+BPrlk55h8rkXjReDHKkQHqRr11M9udItCieKo06dPLWfoOSGq14GiDqM
 s7D59uND5NdgBxj0bcRXStw35DX/qbwgdhPKudpvm8LxcatGiclFZvLQF3kEz/EO/rNvpuAw2Qj
 L5nFLkvtX6mwMqNgcaZ6Gnm+qjkr9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300090

On 10/24/25 6:24 AM, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on SM8750 platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]
> +static struct clk_mem_branch video_cc_mvs0_freerun_clk = {
> +	.mem_enable_reg = 0x8090,
> +	.mem_ack_reg =  0x8090,
> +	.mem_enable_mask = BIT(3),
> +	.mem_enable_ack_mask = 0xc00,

GENMASK(11, 10)

Konrad
