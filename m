Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22563B95EB
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 13:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773321287; cv=none; b=T4tFcAWONX26djvaZSmplsQnmkn1HCANV5RG6R8JqZFazr6oIhtJQXjjc25IQ4/L6hBuSxGk1BMVFCTh0DJ8Fh6zp4FQZjAbnAi4U1FBCZ/BcWxYjXZb4ot7dbxC1Gbvt03JLykFfUvYkjIXOIiF2U5T4PsiRcGCnmxsF00mVaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773321287; c=relaxed/simple;
	bh=ePrBOIgh1g3/NiYzYd+xgOop9K7VpKCJ57VPnRxbi64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJ13U9P6VluKbGGCwri3emIMrxFug3TpElK4gj/SkDeuJHMamnLOFubkZmWsxkqITpuyVD7DDWmkI6LAmdOE87rwgZAf1ay+6QCiPyBsQ43RdjKmH59WatFDQYANkcLyM6Jzh9X6j5YpECcux6c+RY0AojfklRCteSEg/e3k5WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSsLW5/c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZO0ZpIIx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSsLW5/c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZO0ZpIIx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C7eFva510100
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 13:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ldanf7ZxN5751Df+TS+u/IOh
	H1KN8mIyUIiBDd3ib+8=; b=eSsLW5/cKmIVP3E6e5WHjMOF3pbd4IXixBZcmSw4
	Fse2NC1+CUhq5V4mXfpBiL3TYbQgjtvzgEMG8HHhAfnVzGicDKoUnHkIIXkxsOMR
	KV7T/ihHNzmFWqS/SLAmEvyBUKRWvBPpz7mbRr8qdkr/MXOcFEk3DNue9nLIViIB
	5qaMMib6MVm8R/Muxskz+udLr++ZyTPBnrvPzCgIS9OgsCdAPJuiWo/K1a2/Rl8C
	AsY4yawI0ROzG3t1Av5ZHOniX49b5qMy7ZPtSj7aeCdhfuIMoFT5/JlPq4/91cr5
	fTH2coKcs+j8obAsWyg6zmJvTBtG8MFS4EqYccnBkcF/DQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w0u6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 13:14:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7fec8d44so675810585a.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 06:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773321282; x=1773926082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ldanf7ZxN5751Df+TS+u/IOhH1KN8mIyUIiBDd3ib+8=;
        b=ZO0ZpIIxvmkLLmsikN02eIc65ac2YUeumCXdOuYE7X6pHxnOvH59aeViNKLUwXQLwX
         b/EaRPkxXebFvMkPOkr/GqqcaWujkdQUvMSWrpgB7ReXUS+JKvQsdKp6Pd0MJxozJoa6
         Gpu8o1fcQ5QdOTNY9kz78+NdYThQlmmyzUG+JAPRpI9kp0/cIfKZEnSu1t3NqPK0OFH2
         98OVM9VbTajTrkei3IVTxoHLUFqEeQFU6YX8hwkPorIBfaQq2x9OrntUV5JmCLoENiOV
         2fUQFVK54TGR9a4ZO38/L/a7jKQ+sywuVcWn4iARiBu03ss/2RcJzo8W2RlcYqrTCzTM
         tI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773321282; x=1773926082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ldanf7ZxN5751Df+TS+u/IOhH1KN8mIyUIiBDd3ib+8=;
        b=ppTXAEHYT1wPRw6twKKu6g3B9K8uhhiBFW9SPCOi27ESWvd+wKk5f9MoqUXsbosLUy
         1gL6PWjJgUSdpI4GSRh6D8ggudWwKE7iX7so/2FNKBMgfRmlXH2ehbxuler6GIdOWRJQ
         Ts/MjprAlJpP8zzJWzlYVH87TmWaRzdKj3E/gA6f5rPumCexi8P77YazEEzf69rPqXon
         Cpm5p11YA1/pZDin64lQZVyCPc8knnD8zzWBP96FZWWeCpKzqEwR/dXWvimzfuFPunsC
         cv5bov5CKbbJIXAZYR1iONRGvPj36cuw6U9xTYBPYSHUIwMHi5osW5wPnmXd/3FahB6j
         zZCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWntn101MqiIkgglk6qtr2CavFaxZXS57BmCwcf6iwMCfmErSErSdPvSLGr9/vTc6to5MfvVqpDa7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR9Y/YZOWiCttyHLeVT6x75Z30FSdkMboyVGJyhwIGXlF9kDok
	7P8kiiXrRUAZ/uyBMV3dro9H9ENUn4AW+h72IAUKD8/ARZCRgbQ7qoiGqrEvYj8yvsNrgn2zKrC
	JLpX84Qwe2ehJrjIEAAdJQnYKnEcZ0IxTgfEKYBqVaoFV19YpdxVqeB4NRN0/nfw=
X-Gm-Gg: ATEYQzzTF8DTIgbuzyWFQz3cAZ7WVeprdz4jkph4MAi1NPUVDfH18B54p3pLkZMyGze
	q8Js2W9prfV38UfHaAOPAW2gK+V85LkpmNblpDx0N3EdRvom8WYx866HfCLNgfEmOzkfHDfOydZ
	kECcrunUu1mILjFMqE+N9KYp1cZO+NW6/mJrd/EpTPoEq9LMiLlDkto/KwYIy39WSbsvlXeYMkP
	CMHVp7+YxcyCtIzXGDBL2o8qNnHZHwiraAkEhJ8UjKe8gvRNGpr/L7LPJPJ30IIVZ6npZYzKgwC
	9hBWa1BsVfnNqogShjdPFuZr8DYhhMwM31RdAKwF8g/NIvreBzSNIXNnJwHT8nVgXTcSdizKHR+
	iwsWWXcgAt3bwFKfZElMiJTVFzpcVdiNMdLzIZALR1pp43rzVuwTYmd4wswjiVxzlqwOO13tvWa
	5kcGkCYyXLqC9sSoyRinOAuT9N0S0hbkPgqaA=
X-Received: by 2002:a05:620a:404f:b0:8cb:678b:4877 with SMTP id af79cd13be357-8cda1ac6db9mr705918285a.57.1773321282141;
        Thu, 12 Mar 2026 06:14:42 -0700 (PDT)
X-Received: by 2002:a05:620a:404f:b0:8cb:678b:4877 with SMTP id af79cd13be357-8cda1ac6db9mr705915385a.57.1773321281622;
        Thu, 12 Mar 2026 06:14:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e7d9sm948962e87.35.2026.03.12.06.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:14:40 -0700 (PDT)
Date: Thu, 12 Mar 2026 15:14:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/11] clk: qcom: camcc-sc8180x: Refactor to use
 qcom_cc_driver_data
Message-ID: <oouftqosryziap5gkojd4sx3zwc3ecpdocxfndhrxxrk4yto4h@zdqnxr75hyip>
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-12-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312112321.370983-12-val@packett.cool>
X-Proofpoint-GUID: zjKg-H_VfLLPPS6jmpa3zKZw4Mskogty
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b2bc42 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ma-uBWqLQOsuroI5m_MA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNSBTYWx0ZWRfXx9j8/ERkX51x
 tuEhpNJyM9m8ZeyZoDoMN4SMcKUfkBtHBSQb1U0XGOcxLbf1wctPdNa4ipqxcvVH2O9ITTlTyOZ
 eswu9kFMMlPFYu9afqmC1GRyu91pnBFdtYwnPrr0tVDHIV26wn0OL5iBzKc//AOGdnhspxvRbMf
 qE5h+KmacIF4TYlBN+l0zCKOl3bL4R35RwQI2zrAbCsIECC0P8x1S964YJo1U5I2DaXkoTumGF+
 rk/Lt8Ha3PD+D/ajiUyQLuq+T0AZlNJBT9+VOcyiD+eIh6InVusGVdUGRtWnzToF34CxIBoCsRN
 uZVyu/lzmQGOlYIhRQzaXrWFYE3HUq+c8r5OD/Z1PlM/AkuNFZwQYy6kHv9XtHOteVui9WhYPHQ
 RHIC4q/FYEpf+YE2uEDFMX7UH+loqJBSjrOhQqmg3n8Eikf1VdGxGfEuYnMfjDUpAFT1gdkRiJv
 giy+R5unJR5jP9gjEdA==
X-Proofpoint-ORIG-GUID: zjKg-H_VfLLPPS6jmpa3zKZw4Mskogty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120105

On Thu, Mar 12, 2026 at 08:12:16AM -0300, Val Packett wrote:
> Use a qcom_cc_driver_data struct instead of a long custom probe
> callback to align with modern qcom/gcc-*.c style.
> 
> No functional change intended.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/camcc-sc8180x.c | 67 +++++++++++++++-----------------
>  1 file changed, 32 insertions(+), 35 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
