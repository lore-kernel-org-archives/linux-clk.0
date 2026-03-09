Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9FA3446A5
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 21:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773091876; cv=none; b=Uv2+ViVfOk/tCQ2/SXTKn+Ip3N7N8u4GSRtp25VzBn5MjvaezQn3Q67kXNMVMYjjvmzkKNlqh9QUXpKlF2CapimD6wB2jt3lfatYFnmUKGFHTgZicrNdc8KVsXeG2oUkHqxViy1+ZrFmSKQLCO1+KTph4WWcOBbPeBcPBt/zvvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773091876; c=relaxed/simple;
	bh=QMfppnJB0bOmLxXStgiwpIw3NO4O3DrzoI6RFVjD6kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PwadAXDCKRMknnL8vwrDZEN/Leztc3mT4/59MTpy4EuqH6BzjagWKzurS23Ku3s4Z0VLty+lCM2PxaVQkgGS5WCS/dK8eoe4lgkJEXUvnJ9Toqi5ccR2fSXNsnNwrMke0z+U2juZa5gmzL9SF5e52O0XmmSDP1nOs00AOc93DsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6ucDigm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJ+hr0ZH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6ucDigm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJ+hr0ZH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBkAG859602
	for <linux-clk@vger.kernel.org>; Mon, 9 Mar 2026 21:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/erZTekXRBJfl6UaU98s9N9P
	EOnpIY6iDEfc9ousCHA=; b=R6ucDigm4RD8BxJVg6VvO1A2GLolKLoFLb6WNLC8
	nhLMSf7U6DvW77L7xuqtly8Gao24o8Ug5zLF1kPKv6EJW3kCSug+pphhNQR943Hm
	7rMDK06xKd15pIBuw8wGvLC2b8rZaecdIlDIm/Ug3zCmSADFMvAJHjGzF3Gd3GCn
	hPb1t0ZwAX77aULgdAOZmCX8BztW8GaBca9hfkbndKazs+4O+dQBMOeFn/zdIHCv
	MTE5MPG2oCoYgnPQuiNmLCp5h0wj/AfPjJYjhbfMalFfDjVdDpcbhzaLJOB1MOHo
	6ewRGqIZouPDR0svc22iLQmj+0j2gXlN/Y6dxFT1NyJ+1Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbsev1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 21:31:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd77502295so1375935685a.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 14:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773091874; x=1773696674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/erZTekXRBJfl6UaU98s9N9PEOnpIY6iDEfc9ousCHA=;
        b=DJ+hr0ZHRExAEMCNTXBE5NBgEnrT5k1pXVXf2ongnzPJnUOL5H/CoFLPIS/ykPOQzQ
         YWXiIXGv9swxHok+x/274lHs7SPOccSxec54TvrCuZbg+wE+6V0+ithHImtuA9f9fGjx
         kIkHEXcrt/Sajq/BfX+ZsURn+3fgyim2yiSQUJSXkR5llgxnCtlVRL840ZGwCnSWLodc
         25w4Voz1UAzz1PwlLomj4U92b2RuLgtsbomm9rpGdUL4ZVAwrpIWbl3/PJIwWLA8M2Ai
         NmXTwxi2dTx+KmvAbjBpsCSjEIj76rGm+q10CrvbtHiE/01NOT05RXG0zmKb5ptgVn+C
         WnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773091874; x=1773696674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/erZTekXRBJfl6UaU98s9N9PEOnpIY6iDEfc9ousCHA=;
        b=vAjJQOkhtjMTC5m0njCd+hOIH+VZunYAn7b8AqcvnwhStrMFJtlkXX/H00XGQ6sAlD
         FPOZxlawooeOrpB4fSAFCA/dPMqQfsfkGkdO6GnoL/+hpW0Ym8Axv7cTeS8HxE+oXzkC
         4V6cwRDUOSFSvAn1K89XkcHX0JGipPbHZKgyqcj/9CiL1n1uX9aOZ3yeVctsDfutRBsF
         eSTEmNys//NTo1z0P6+K+6YyQPH4j3VgudUc7dDhPm7ljQTNcqoPZFm5WUVWvgCPWKNx
         Cp/CbmkEfno+9zFmeRP/FGkowFzU9vkjMCfnee6vJD2NbHWuoyPatZgsoSD2tCa/zcrD
         bSfw==
X-Forwarded-Encrypted: i=1; AJvYcCVCwqsZ6VMtXb2pPGIthhfdrUadhf4iLFkmAW4f33DGC1GkAwvOFGE64CTtzMSIKTPRx4zVtAk2g20=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAN88MuToad9KyRw/SHkgLI1QTfo3oRWS1NviJ49M2uqCYvXVW
	4qjFXgIOb2KRCZO/c/154UcUjeCW8Bg6LYTrl/eEVLzccCzESkMzdwkK53GpM+fDlIEMFK+00Pn
	MxGpp8xuEgs567vWUQWu7gAtkg4CA9ymarjFTBLQwdPEs4oq6HMp3mNt1nlVh/oE=
X-Gm-Gg: ATEYQzzMqkliWoZSiaP9ekShBWLnCMopoaeNm8gqLqjrn8plw8gANA8adeRDzoU8jfh
	mku+Ij7Pkupgi6c1nzIpaSR4yw4hlqLmgD5ntu85mo+Vtmhsna4V2rs/C3oCSxcJUS7xTT5C6R5
	w3s+f6ClRPWZ9VrbQ6paHBIVFrTWBRk0w234LJRwpV0IPwgUjlAfausuAeDvR9mvcwB8TIrbd6S
	DVPdN+2qSc/vrCP+uhwjd5y1KPj00UIRnxKemodyvRvXCMAxcFKbaJNwD3hVciXMB1lluN1e+q4
	yP8VfBzRv2KIgZhBaaePLNNH3xwAF0aZ/P83baegSoyPzQs4bEg5orRiqZJ0BjJEysbcVEfmV6Y
	M1Jc6Ony7DK6COMDl0rpye4JCa4EgyqEnux++iDHydYHwpty4ZF7c6nBpI6qI+6PCMKFTAQJcB+
	z2W2z40PYYIh7agF66yA+xsbfnPWtSonmahOA=
X-Received: by 2002:a05:620a:7017:b0:8b2:eae0:bbf4 with SMTP id af79cd13be357-8cd6d407d59mr1565780385a.19.1773091873631;
        Mon, 09 Mar 2026 14:31:13 -0700 (PDT)
X-Received: by 2002:a05:620a:7017:b0:8b2:eae0:bbf4 with SMTP id af79cd13be357-8cd6d407d59mr1565775185a.19.1773091873189;
        Mon, 09 Mar 2026 14:31:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfc545bsm1463281fa.13.2026.03.09.14.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:31:12 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:31:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: glymur: Tie up the CX power
 domain to GCC
Message-ID: <zhgwgzgf2sdsxooqdknhxvk62mif57vcu3g73roptqwxblofbb@4hsgltmqpru2>
References: <20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com>
 <20260309-glymur-fix-gcc-cx-scaling-v2-3-d7a58a0a9ecb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v2-3-d7a58a0a9ecb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af3c22 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=XFCnTzhwHPFgJtnojrQA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE5MSBTYWx0ZWRfX6Bu41AASu1XF
 IgxFS0kyeiDh3NQEnO9yMBcbScG2qHIHmlY+EmMzjLgWd1HkcQlmW3w1hkMReKA219NvBwdaZwS
 ijIQe0dFBo5/CsBq2dmcWNb3636M1UEuyQVwCSOvjemhWBxe+I57Fj0nj4zmrtaSfUMSk57J0GJ
 zOeSBczxsZjg7Thhj0pfNO5rqRTieqPm/HDi/kxFkva9AGrz/+fIx+w2gn7JiB4tdnYCSVvmbM/
 gUMTcN/TZHYZyGaDFbBXXFnWtLWlft01gjSwh87RB/XjSMHxF4DrRZ8NYfZ2zFiiefqTdNGrLIx
 XUiw+xl67eFdYe5wnCQRssWirZ121wr123bK9OmAG3B2enQPB8PEZxSEdZszZX7CWVv90ZuS7IA
 lz1eYzJOlvjjw3QZX4whdE/E8ERuejegEUiHWz1mAiMPtNHf4Q9qeoLeuq4Ub4uKtUstLm5m1wp
 sQb8gjTidEEUjDigmwQ==
X-Proofpoint-GUID: F4EXN795CVzXOPL4hvy4iHzCYNuKXxYt
X-Proofpoint-ORIG-GUID: F4EXN795CVzXOPL4hvy4iHzCYNuKXxYt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090191

On Mon, Mar 09, 2026 at 02:08:18PM +0200, Abel Vesa wrote:
> It has been concluded off-list that the Global Clock Controller needs to
> scale the RPMh CX power domain, otherwise some of the subsystems might
> crash or be unstable. So adding the RPMh CX power domain to the clock
> controller which will result in all GDSCs being parented by CX. This way,
> the vote from the consumers of each GDSC will trickle all the way to CX.

c&p of the same set of phrases doesn't really help. Please write commit
messages, describing why the change is necessary.

> 
> So add the power domain.
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index e269cec7942c..5f8f208f6063 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -764,6 +764,7 @@ gcc: clock-controller@100000 {
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
> +			power-domains = <&rpmhpd RPMHPD_CX>;
>  		};
>  
>  		gpi_dma2: dma-controller@800000 {
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
