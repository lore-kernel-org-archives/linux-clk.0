Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F421D6DB5
	for <linux-clk@vger.kernel.org>; Sat, 22 Nov 2025 13:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763819763; cv=none; b=IwKwO89CzcbMzrnfk6R/CFaiRb6M8lQfFZlxG4guWuFQjzzTb4bE1r7QRxVTdhlokab5rthXPSfJaW9AR+xR8mzBAewzb25VDwZWnpHrdiO+sFwA1aNNJ656rpvWlpw33oKzpm5X7PP2NuEr0HkZYS9hg8IWEVtRhjBPODZtbPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763819763; c=relaxed/simple;
	bh=OMkrdbTwEAyXzEnIeLNxg6LxvDzp8j3ZTyYVqmcggb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H1jOiIwoPtTtkcKjxZ3yCWglBxDdDjI5dlmF74ah5kG5lI7DM0dLFg9qz7F4KevvNP5ao9XdsFM4KsX9j2GbyhDwmVpkD+HjDGYF4GGCmCbOuweZ7WMWXrJvecdiFsmHNCQlIPFbJCJeUAZoqfyTJVzYORY54MEpXAfe49enxp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oikzx43I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YpXLUfaY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oikzx43I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YpXLUfaY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AMCcn7P2606730
	for <linux-clk@vger.kernel.org>; Sat, 22 Nov 2025 13:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S1OOe1X9AcAjdPSLizU3SANSr5j5zr0pJz6UYNGyGyI=; b=oikzx43IbM7CKAmU
	85AwYWFP08aLOVstfFY1+YxQ6vt2qNNtkt4fbXEcuu51vfqg6zCMO+pgcs2SD3r4
	oL59Dp7hJ1XQsAqUtZsjF2herzi27Mycws9gHM4l+ZyKVtrjmExrFv3vaG4zDK96
	Ejmha49cGt1jCARCon8pCJgR5ClySrpzzIn8BDo2BFRcYwI2DqlN/Ts/DmlHGvMT
	FCn2KXLhnERjGfV8voYU0Jp2C/2XWshEN/sarlTfE8qC2/dLfyH01VDTCZ/DvEDe
	R7BAP7JWIT6C6jCxf+aqCxS8Pq4l43Lo3axnHSMbW/+1qnRR/yg/A1+ILfERCAD/
	JplPng==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak685rrta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 22 Nov 2025 13:55:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87ff7511178so8024966d6.2
        for <linux-clk@vger.kernel.org>; Sat, 22 Nov 2025 05:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763819759; x=1764424559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S1OOe1X9AcAjdPSLizU3SANSr5j5zr0pJz6UYNGyGyI=;
        b=YpXLUfaYtDIdCLBvEMryx6GwtSguNYDLRAsSVAK5foOFC5GjD1/PRPF0Rvb1Nxx88b
         8S+84qzxAi+rqtZ6MAtuRvfozPx33/xwHqnRqfy/5WiCdoS9KJUqK7vHN6zWjaAn8tMf
         gGx6AIjPc8PPQMpQ3O88adXkpVH0kBFPRwmeFyQjRnps9Ab3J45mSBTxSwGON0NuLaGw
         JeGiP+L4WOxEazvis9YRsrErO0uPGQD3tUd4IpfSGCNymsxEgopUDvvZJrEplHApzVOb
         h11Kg3Mgj7yvIPM/7KFv56pECtJseylwinNOpwRDHvDStDaeHnbufrsWowsiC6h8Q2wH
         B7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763819759; x=1764424559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1OOe1X9AcAjdPSLizU3SANSr5j5zr0pJz6UYNGyGyI=;
        b=oAp0QOVRDST/5xFiXKQg6xYFZhO9NHsDxRItMT8+hPxHQjEXeshrj7GY49Moq01x9o
         7Ymvyhy+gMvpwIt8jpC85R1FkfyjVGnmU1nlEXPq1qLybm6lix/yqGdaTvj7QljrH3oL
         LaI24xkpm58Y40OHLiFSQRmDC0OuL/78PeoTZf9VAoSKD15j9GBzmRNLpX107JeS6Eoz
         JnxL6PN+NQznrXenUxiFrljiz7hwRrG7Pbk4ndJOJHgd77SR2S6WBmWkIHFze3TvSZXo
         TcwLiY0bUmb0ttmslSnII1drEt//0T94Yk+XcsYX41nrdrJThjnJm4DL8jlrwjJir8CB
         W9lA==
X-Forwarded-Encrypted: i=1; AJvYcCUoWrstkXHjUg59Pr/m9zgY3oaQxAjbYSPf6JY2p6mymBGJkMp0Jav+VQ9cTlmIaJCeUepEHZtNNJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHs6Bh1GbnalwVMhinhKYbV9U2nIBsrFdhqXa+skjrD9PdWuMl
	w/bm9sH1Ss79v/kaaMXygaf7UF79CF9QeQRijwL/5WOFJvSOkw6/CdzQeznXpN+hIf7dN5MTDYl
	+CJH7r+jvCeKBeZHygfm4xIydfQHD3VbkTBNCn3bNuRNt4ryAcYQEVx8EpBOs8Kk=
X-Gm-Gg: ASbGncuEO2O9l2h/kbdfgovFAZHnObPQRBx1YWQVcK3kdppqSt0UYotLTGUSWRyL7TH
	4uAljgxkwuBnj5wr7DTKipSxfKLHEuxIDighNO008rtP7SjYRHUem7ZTvefPNrg42juWbBrILnd
	BASQVjnAh3ddd0qkflPB4II8V/kespRy9rw2qx0RyvmDi4zKQat1F3zNHZ0Xh0I2UYVKBb/3sKi
	cGEGTHvzolW2bjCwvJ3SNPd/pCNoCruRhiuy3FPjXkHGxvLDsjKPxEl0O4VeO1MsQShtIgqclA/
	OYEbCWqGfM35L6ieMRt5OYVMk5f7vCYLS1Oz4XRhx+PWQJFr7UZ/nuWvJnXNhPAArqWxIS6peLk
	7/tffPVN/9EDmOfifkZnWWqX96lVB0+VBnjuT70vW8njw0rIpuD89TJyFBdV7vgZacKI=
X-Received: by 2002:a05:622a:252:b0:4ee:1eb0:fbd9 with SMTP id d75a77b69052e-4ee5b70f141mr49143041cf.1.1763819759178;
        Sat, 22 Nov 2025 05:55:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQnoiO79VD3idFejfcP7dPdiRk2fgiH3fSmEboyc4erh9pW4HupMZNmFBJq9UtWU7JOVfCzg==
X-Received: by 2002:a05:622a:252:b0:4ee:1eb0:fbd9 with SMTP id d75a77b69052e-4ee5b70f141mr49142731cf.1.1763819758736;
        Sat, 22 Nov 2025 05:55:58 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd43e2sm724651066b.39.2025.11.22.05.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 05:55:58 -0800 (PST)
Message-ID: <e177d393-de17-4bdf-a0dc-002ae5b7f58e@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 14:55:56 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] clk: qcom: Add TCSR clock driver for Kaanapali
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
 <20251121-gcc_kaanapali-v3-v3-2-89a594985a46@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-gcc_kaanapali-v3-v3-2-89a594985a46@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Woom8Nfv c=1 sm=1 tr=0 ts=6921c0f0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UG0UE7FhrI7_8MC4d9kA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: BZDO11jZFx5tIML_ZEur2r4IeFzv1_Mg
X-Proofpoint-ORIG-GUID: BZDO11jZFx5tIML_ZEur2r4IeFzv1_Mg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDExNCBTYWx0ZWRfX4uWyzDwa0nhO
 GiCc3xeysi1AMFfZSXJA0u0P3SO/Ctq6ZbwsL23CMZYY/CcgiZ0tHXxRbBt1sv7EXMiENUlQp9u
 fnFopfhx1nGpbrS0tsoGCVcCSG4gX6sAKdU74avFM6Cm9pYNck+vc8gRdok6A1zfd3NbOo/xVhI
 4nzDnojYoal5pAN7cAenzk4CFa0T1eieTrYhkLL8YMXFWQ5mKuo+WACbOpjyVDjrV5I5iixt9nh
 jJn7xKdVvzTTOlhu/InyGb4opc8GelqxtSAUNDjLFPB+KlaNE1kqx1JDEwfaQhvMtm0jMaeu7xw
 jbB/447dKt3AExNE0tUZpxvhY+PWqpuEFOX/um2dlcLr2F57G819so97LCBOkq6C1qy3+GjbATx
 s7plW8XpM9DBsNvQLUO+gPI+mMlcuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220114

On 11/21/25 6:56 PM, Taniya Das wrote:
> Add the TCSR clock controller that provides the refclks on Kaanapali
> platform for PCIe, USB and UFS subsystems.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +static const struct regmap_config tcsr_cc_kaanapali_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0x2f000,

0x3d000

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
