Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477938;
	b=BvkxBS+xj7GeNMRyle/m8ygBFf1sE7UzxDdQC5iv9pO7mIe8aOBdo1u7REuCYglQEYhd
	 oZFRuM9swgswvh2xJJ51ibknluV0z/Vvf7unYnBBWR4DKjE6kHmnbeCESgE6QcS9dXLv6
	 3SwoumeqQ3tA1U3vtB0hkmka47O1V2QiYz44WnORizcM7MkzJtpysS5dTFn2AE8sVqMkl
	 Vlb/OA6nCAXTlr6O8rgNFWII4R8nyRW26kmkDkapwjhCLi7pA+HIkP0Z/u5gkf5RmYBsJ
	 uTkVZtyc50c0QmaXAvusYUu5eiI/9LjX7BDOJuufHurSWJr7Z/C/tfv6c3cT1r2Eemw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477938;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tM4uJzcUE8cGnYHZwlKlpkbsbDNLRDuDbEkZ2CKoHi4=;
	b=MGUs0bx7Jvh2R4LBt3m0nOBByjoNbhF4xVDhaR8EhB5UNq3gqvWRSkXRemyuwJy9oHNE
	 MrF0tGs1pByusG0CmLzKuCZVr4/b0NxyIshiUpQUt6Cdcg+CJBOniecpDiCfwGqxk80Xx
	 BL3VhLzwiNPaFyavg9fR0LoJtGKk4NJuGff6KLOquXgb0agpax6+CHVUHEfNroV+GEeJB
	 NDGi2DB5IdZ8e1cmBmyk9kcW5D81q+6x2aMr+kd+c1Gg3EuHDMlKYF10eZHwG/Is9zJS5
	 S6VHL4RIKRYqMyjs7kPENwirwm/w9NwOJSTcpIaeT2WL+6TZMC21S/EcRGru/BMqMfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iAKdP7Q6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjemuhTK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A8A606A31D
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67A8A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iAKdP7Q6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjemuhTK
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t36s3485511
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tM4uJzcUE8cGnYHZwlKlpkbsbDNLRDuDbEkZ2CKoHi4=; b=iAKdP7Q6l9EwQ+FD
	k1vMbc0KJs1sjjcBfe89BztPzmJH9eXvzHLjXTCa6yOTNp1/9lrM2dZWD23/NLTr
	7GAVfv0/rgOEB+x0LLpPCx/omrDuCsBC1i5KlhtnugDmOX+lEce/WFb/oFPugeos
	8QG3BMNPJl27ntPV9bHX0kBe/m11TXGWzfU4DbZpSFf500nDskx0SX44jzqEwBXE
	vxp5Xfz6lIQH7HYBSzWzDHYdhcBChKBCUcbz0D/B9W9lFLWaPd3EehHF1rL0Xnkr
	pXH2dqbvHJPkNTFShtvOPUigaPFpVVugDQ/STAdo5wb1yAQPvpSWceqQmR3Bn4pP
	2OKAmg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n166j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:32:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90c4d46037eso4526776d6.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 23:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477936; x=1793082736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tM4uJzcUE8cGnYHZwlKlpkbsbDNLRDuDbEkZ2CKoHi4=;
        b=YjemuhTKYgxZyoW0gTQqAe5YWqmsDPEvVx24+nzApkPUwvbCI3af9SRbSIEYjcw7LR
         1cixsj0o1VsClq0KdzuciKwlZYMNJWLMEkbX68VpBK1SEHXNZZ4iTnBeOkPtZWLhEq3Q
         w59cuXPOKPCVvvwKDTeHBRP+uAQ1C0rPT+OemTwjCbZ0v5Q4dG2DO2Ls/tY4X6mIeiC1
         yH/dyLkETlRIYzV4L4PZ8yOLYzrEa6Sf1H49ACCXhoWzmH8TfPrmTJMOerSQiBIeSdq8
         m7FX2vO1LL5nQlsQwsW8dElRbO6HYR1QqoKCNd+bTXghBDKBQcBuwo65MQJ+2FL3lfge
         jPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477936; x=1793082736;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tM4uJzcUE8cGnYHZwlKlpkbsbDNLRDuDbEkZ2CKoHi4=;
        b=BvlwOXmWwgIuiIUDhYUL1jpj0UJey/Qd0eLsyyh6jRrfLtZYW6IwvpZ/UlvBRo+XgK
         wgdXkiGvnS6CorN7Z+X8WtKTlpnpbNY0oFvizuLkOSVpAVMeWBKb8dbYlAwSqCxS32cs
         z77A03D6HIoISy/7w5fXFmaoNMDuRjrunuIDxZH49g8LtiidTO2otONNSCBHlarSQKyW
         wI0K+hX0EARzYAICWFJgojN8Ywb8t9oYD84YsLMtgPoLfKCidiXwhia2yrUReS6zkFlq
         2Y71Xb07HZ4lQTRnw9hHo/6bcXTiIfuG4zvntm1/XqjIeOCY1T9T8OGgIwde/cBj6TtR
         nSpw==
X-Forwarded-Encrypted: i=1; AKwUvBy5dbo905rB7vOOkm9W8xiG3YcgXmdMHxNh4xxOaQCR1wtRPkdX16vexj5fIR5oT1h8Pdcx1Bo+YUU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIldl0I0NdXUEHPs+b4xqQC5N9XZqWU03jY2Yox2nAIZxhKjjiS
	cL/zJd3SPqxxyDXyFO/fmO0eHSTTj3e4ZPYEM6dhSVMroC+gnwfJPJUHb9+kcbFqVkWxlSUpjZs
	1J6yM3pA6s3haTmzjiMZuPjNlJJM70XcXwWLnceTb1g5Tky1CyhKEbeExpg+5BJQ=
X-Gm-Gg: AYBFou1mzBDeEDnzqTFVQesiiz5DAn3H8xLC5N/FjTiT7MHNUZPP/DAZ82GeM+aWaNy
	vFvAwlClLuK0n4RlzAWLzXRwztV/EMQsDmNEA42eLpZVr3DWtW8sDuAHkKlHKVwcdKcB00zgJpv
	ADYwZV42cALg0iwRhB8KEEyHUy5lcOEost+pwdntJQFga6Y5wiVqjllgDvgh0PaQEVTU4C3yMQy
	OVsR1WvSDswas03JzN0+5L7tbT7PDInjN2MZKEiXXJLN7ApO8biJXNuCW7ZqmAgHiSUlaA1MiPW
	wlhqgD+PO6CKZV4QLb7rD+fyblaYRxnsZL27wzeWlyR1OAnA5uguuicksK+66dGGb/TPk5AFJGL
	Ja0hs3aD4h/LPaQ5/7MQsEg==
X-Received: by 2002:a05:622a:164d:b0:535:6cc1:589b with SMTP id d75a77b69052e-53645c2aea6mr173775531cf.1.1792477935580;
        Mon, 19 Oct 2026 23:32:15 -0700 (PDT)
X-Received: by 2002:a05:622a:164d:b0:535:6cc1:589b with SMTP id d75a77b69052e-53645c2aea6mr173775201cf.1.1792477935127;
        Mon, 19 Oct 2026 23:32:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c615esm446762566b.42.2026.10.19.23.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:32:14 -0700 (PDT)
Message-ID: <d01450d9-94ad-441e-855f-540f45aefc82@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:32:10 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] clk: qcom: gpucc-msm8998: set the droop detector
 bit in the right register
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-3-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-3-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad70af0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=d4jy3kBXdueBcoqUgmMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX7XhBmQ0Xo4dC
 MwYkvt7uhCtBLQpPWLBY48XegzE9jUoaXrWnAGrpElvRgRxQ2Hie5RldK5A6B0p6vSEB6zXEwAi
 3Hs8Sodd6ydmPomhcLr7Uly1vfA62zA=
X-Proofpoint-GUID: 2FCfNFTAL55ygHgdAx9gE4ZlKz5grrbZ
X-Proofpoint-ORIG-GUID: 2FCfNFTAL55ygHgdAx9gE4ZlKz5grrbZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfXzQBUpgPOE0B8
 5/AYuzGDZ0j/yjgDJLf9GWyuofA0TnnHBz9ALjw4x6wihoMU0R3d7jQ8kGWC2cTn9PpHEDbGmaR
 Vm+wP60EKX4w/RYMo6Ya5wGYmw1e7wf9kQoMIQLAL+yyz3MCKxEk0A0t4tSeCG72Z/b0xm52BJ4
 nzRp6alBbcZbaVjRmYsCxx9nX6Puo+qDpyxo1ZZobQdiQFrrAmttnRvCGKpFRCTuIOAwmboxol9
 102i/ohkZB/Q36NTekKtdhcsGkJct30pM9wqQyGEKAuOIHIsJ2sUcsdOhNt1l9Q3pb5dfU+GrhO
 hYnY/r8kkp7gBJmgxNIJngKFLRlFs25SGm1yWkai3IjSiXbErD+XHQjYqd3dWVbvqzXYEhbLqP8
 kHbAcfAEUcidzTnQjGQzEqOvH7KfGQrzU/me7PV9l20M1oIRvEGDRNQ8OuXlWQ/V6dBlt3wdTm/
 1vob7ZTy3Za+tBfKY3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200025

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> The probe means to power down the GPU droop detector to cut the leakage
> between the graphics and CX rails, but it sets bit 0 of the GFX3D branch
> register instead of GPUCC_GPU_DD_WRAP_CTRL. That force-enables the GFX3D
> clock and leaves the droop detector alone.
> 
> Write the bit to GPUCC_GPU_DD_WRAP_CTRL, as the vendor driver does.
> 
> Fixes: 3f7df5baa259 ("clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-msm8998.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
> index 066793e47f79..8da10027f1f2 100644
> --- a/drivers/clk/qcom/gpucc-msm8998.c
> +++ b/drivers/clk/qcom/gpucc-msm8998.c
> @@ -330,7 +330,7 @@ static int gpucc_msm8998_probe(struct platform_device *pdev)
>  	/* force periph logic on to avoid perf counter corruption */
>  	regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(13), BIT(13));
>  	/* tweak droop detector (GPUCC_GPU_DD_WRAP_CTRL) to reduce leakage */
> -	regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(0), BIT(0));
> +	regmap_write_bits(regmap, 0x430, BIT(0), BIT(0));

regmap_set_bits(), would also be nice if this was moved to the new
driver_data. with or without that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
