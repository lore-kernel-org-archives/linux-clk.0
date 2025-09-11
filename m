Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FED12EA175
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 09:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757582915; cv=none; b=NijKxBjDRLvMwbVuvwh4bl8B+Wjj3zTSLYGlTnC5cWW78+RGtp6B9CAwADu+LaABC9fTzAoFm3hWIWmvy3pAJurwNjZyvEd8wE2Roin45SRVufG3AWKzrfPMZ8rzU94NS7VOIC42H8EnIwvF6+nBJ9vxtWdNypdJ+YXWBEJJdVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757582915; c=relaxed/simple;
	bh=poOizEiKiZyCIx3xZEYaychJQx2tdEeFeMoFXxpR8Wg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NGgzgmuKYzJMjSqPysFahgEQwIxXVKEHItbZkXO6mp+Gv93pOcTkuN9AjPF75TKDgnNoc06O+ekLB7+TLV4UumMOOjCC5YAYeGJ+nMzqvJA1dBWABQTm5G0Ti5BusW/5O+x6w/kwuhO3Km1H28HHSrTTA+5Hx3oMkM+H99hdt0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bv+w+ab8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bv+w+ab8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IfMY008248
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 09:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Cc6P34NtiRIuR3gg4cKYNTNOU7BO3/Vq9deYYEQduk=; b=bv+w+ab8ro36x5jz
	ElabyS1TMteBhmJox8FMlpHptAWELxu6oRKNUPk4SomY+hd4ZJ/hMIzaXPxYpe7d
	3O87q+hEDEaUWhxl49ThnpRs2HzQ+iwj0WbBDmiZBg2aQXo/FaMnZlNrSVyPSz5c
	IV7i+YQxPqCv24Qu8lbJtA7Vi3EpNB52bHpf9x+to9M4iqVfXWLHFORWvJs7BvGS
	f9Pu9VYPATRUPwhtzjSX2XZAk1E7wr/BzVq2HubhibBgtky4lVMDrNZjtHGXNnGS
	bQVXZui3M6cPWmr6fM/XS7AD1dIpL5bScJXySLdWW8qKZtFxDDbJcujTdWvLW4XM
	69Lz2w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapqbwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 09:28:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b604c02383so2650731cf.2
        for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 02:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757582912; x=1758187712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Cc6P34NtiRIuR3gg4cKYNTNOU7BO3/Vq9deYYEQduk=;
        b=P/gpuyo+Am9qx0SAHlQAEux6AWhoZjwKxCNB930/6W9iy5jTX6+EfGMenL4P5QZmAQ
         HnSl2XoQPm9mniH2mueKf8rQhEYeFelPnlLli1k7UF/u2Gt2Zt1srfpFleAk3N5OpZBi
         dtoNH1VdxX/JOlo1pnf1KB3LN0KcfdDjVSRiXwT+UcSKMs4tQDuKpl2dflrk2VQWgkjG
         v6DfrqQeRGcjhzy0gF8DMamYULlsI3o2Iha8V4Z7M0MveecvFPm6x1eR1Y1igJHoM895
         rf6CGZCOMJjp9iwEdIGN+seQYP+nxB1q7XHlMMfLwNV2Z5eCdp9yEY7CkZ83mPWzZ/Ea
         4NrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo6mncUfvt95Sl9W4w562/dAGuNLJmuZ/1hCH9b4ZXqEyR5yOMx+XRF/BmhVpinIaI23WNaaPOmTs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3/Zo7iVJft/eVhN+LUusJ2qrueGO5rstT2/qnsMTyb9P6SGJt
	Qm4JI0focgSpdvHFMC6l3PMa3wNKMPyRFThG5b7g0EjcY7T5I4uJtcK4nQ1d5pmHuyrDIWqh6Sp
	1tivmqsAesmv7wrGz1KqCeejSl3JLE7G4QANkZUOQPlwzCwkD/sWfX9J0y4w0ni0=
X-Gm-Gg: ASbGncsWwqINCS1OVpVx6HRlOQjs9bF/8pBg7hMJZAyrl/WnnIcXlZIIQ71nbL8L36d
	kC0lxAhYi/JsO9dP/NWhbHqhBoOQqNpNGE+Nq7RmqJH+ot8zb0akc8qgp5pHoHnriX4uQXwwTXZ
	mGVMGx3wj0ONTOuEsWhxcIDc7b/C0SaXvDUGSbRArWU213nX/RDlI//mvvWEymOZTA1KX+O+LbT
	qeYTIkJcZrC5zYHF1MLYFzx9vcbfIAF++6kuAKhLDro5QZvKL7OEol8pqPl0GdMIW5D61RgNTUL
	TlNSj664rvFFSgoLCQDDfdLLUcnP5iXAnraplE/e5JMV6N8UKUHAidQnFfl2b2+rAARRSEz43qx
	USYwqU7jF5n85W1FG4VJmhA==
X-Received: by 2002:a05:622a:494:b0:4b4:95d0:ffd3 with SMTP id d75a77b69052e-4b5f8377327mr122379251cf.1.1757582911831;
        Thu, 11 Sep 2025 02:28:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhG+r5MhQk3DtkHGVYAZ2SPXev3mp7KPx0SvmxN514iYiy6V4cdUPLo9Ey5HGku7IAAqpEJw==
X-Received: by 2002:a05:622a:494:b0:4b4:95d0:ffd3 with SMTP id d75a77b69052e-4b5f8377327mr122379141cf.1.1757582911416;
        Thu, 11 Sep 2025 02:28:31 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec33ac2efsm806457a12.12.2025.09.11.02.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:28:30 -0700 (PDT)
Message-ID: <fd01c457-abfe-4169-9290-27d8b131cb8e@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 11:28:29 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: camcc-sm7150: Specify Titan GDSC power
 domain as a parent to IPEx and BPS
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-5-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-5-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c29641 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=LDDDIuMr0XRAt-0CmwQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3Wgj5U6ZRuAS22OHLiiSrexGHsAxspO7
X-Proofpoint-ORIG-GUID: 3Wgj5U6ZRuAS22OHLiiSrexGHsAxspO7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXztbekAlOjQEa
 ldX4dCoG9Dl6W+Lqlwb282SKDRQdWbIp/oQQx5jg7RnOK64aSAegWFOoEfJGcHdnWyIjQNudyBq
 Ks00TLK1IkXhZ0DtlOnggf1NuuwqfsQBr/3xpazi/u3Symabm6i6pnS7uQP4xG7vyBkQG0iU4lH
 XzJcAAJnN5/hfREki8kHTwbUwbdhL/RUtQzA5AOFtJaZdKg9sksJa8avS2ov7vDrqBeD5QvVyrX
 zzpLKQfQymdG/9K3u0fdCGSw4SwAi7GQyQOz0UweamIkW+s/xyWt6SeX1zF+dpu76PufkO9NdCD
 l1YRfvg5MjoWudQQ/8CRBmyjj3OJyoKmlVo58sbRBC8j5ha8aqn+6fhIXN650nBghqqmycATb/c
 27bFsmdM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

On 9/11/25 3:12 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM7150 camera clock controller, and it should include
> IPE0/1 and BPS ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
