Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2352D2382
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 08:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459588; cv=none; b=Hxk/rP2SLX0eW0GF87wUQJUc1Rx7rmFAoYRIOEAe8nbhFau8dCfQwx7xBCB1jNocVuYjIHSbFtHNoR/1IoGeqdj76OuYa4uMkrwmi4sV9aV+fb1NfWnyXZzW+GIOUankrnhwVT/sOJs3dW7lTCViLucy0M/vaOgDODygXPy1hkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459588; c=relaxed/simple;
	bh=w2RqG3qclQ0b3vqrSZ7rQu/ZijuhNd982Z2cxVNhe9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S6UlmQ4SF6InL+QuoFESfhPPXUHMa9RV6tDIpJLnjGzqFOJxvqS218Kiixbue6CKZYbfsmqU3IIAjqGvouYbsxmZQ1VUUDPgp9N1+57eYk5bkxhn2tCHxa4wPjtB7+tRk80fhcZX94eH6grxr0Qs8Lk2NNRUtsDT+l9eFCkZCts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muRe7bLc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IlEjsoT5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muRe7bLc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IlEjsoT5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Zlxf2792541
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 08:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vL0BemdtzLl4WTs9lf/Artj78O0whwANYl+37coacXY=; b=muRe7bLcMrjbdwT9
	bbPfYnO3/3iqq98VbBcfNHh/i3tdzIRAFNv/8x0yL9QWeedaEBp8mvk2aP31dQvO
	09G37Ud52FQmqZdjiBAuvNFRGrYia/7vkA047P8TJTku/elO6fiByKCV5TDgzQR4
	iTsGr4855ij0i0haT8X/SuqE2qFaUTKE1HKkGkiDWfv3Bgx3vqUgB/2M9HdykAIy
	BoYpoZpntL8DbhVPjl/8OdePKZnXhtO0hcUbt7KTDycEOIaoxTi3aqzRoFAcvBx1
	8o6qoytJ/M+K0dX21vb47ZWXDprKIcv1utO63YtR1yzXRLbTC7meLVn3oDeLHVFx
	R9J1zw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtm9jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 08:06:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so5030548a91.2
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 01:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459584; x=1790064384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vL0BemdtzLl4WTs9lf/Artj78O0whwANYl+37coacXY=;
        b=IlEjsoT5j6a1EXvYhhv7LCCb+7OmmvXJNAfWcs7c9Rn20ujyGgPin90LaBXvSNgVA/
         OOjQ0nt7WqnsTcxAGc0RiOcL77XiivW8JAw4nsLkr0akwuWJ6rlAQcAc3g4EpG8QaCbv
         eAtbZQrswrK5UVSfzzsd3i5AR7V3oaq91deu1VsSu77NC8aEeVyi2VbCvDiU5gjj9++f
         kfq51MUYRg2wwP8MyVw9a5J2MS+MvQy1lzu88Ps3QH+oxRZ5zEfOOeP8viSAdP0LTD9v
         F7MbLm1hbf3F6d9n8seCZPQPLwwht4QD73d9FpZBBq3D7dloRzpZK/sYNxNtiyvqDABP
         9epQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459584; x=1790064384;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vL0BemdtzLl4WTs9lf/Artj78O0whwANYl+37coacXY=;
        b=jR9XI1OZp1qHfxUoIfs5T76vrDW5aH9yCXjwbGpj2uj+bcmPmjCHfhOCJU2HtKr9bC
         ZwpaWh7A+ydXzTpYk2mOBq/hxlKxYHzQWVz0E+csCRTp2r/BdSvWUP6PlQk8jrOWZd2E
         Zik9XILq+sSZcDVVcvR7Ma+UwbIkS7WVQi+lNP3+lYsYUF5SVl1ovvpuDlE7ja0NddB3
         QU88FS//+KD1b/NLOL1gTvvrHGTVttps1Lla4gegzfZ0YEo1czu5gEgn5pY5rgNuvyc/
         18MjvEcq9zaRTyTX4hY7wDx4zSBugh0J4fJBrZZP7u7cO1Y0hrQ0602S7nCSZA07q0+a
         thNQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9yaRAY1MyFcihs5OHMiUo9o5F/+vh6JCKSYG8Bx98gwD7eXkVsI42gudvT+lyWnL7wC486hSBE1c=@vger.kernel.org
X-Gm-Message-State: AFuF++mFHOT1Q8Gw3mMidUkhRROUIZnNFQFc4Qf4z6+hBUUYiaQirZIS
	PLthnt3Fk8SneU+Tq9qG1LvrJNZdzT4i1uUWccawkh/p7d4/cG1kcfkyA+76iuBCoyAVgLnKjyr
	RyYrnRVwggMxpV63JqWK3mEwv7HRnZZi2JLXvCl7T+tHtC59VLitDY3KHWDD3oXQ=
X-Gm-Gg: AYBFou3qNGIFRF9UykamhdRvPe+w4ETZawZUEeDHvRmg3eAbW7NNkI+mwUKUekUwubG
	hMVU2RlWM06pokmPSAclMtdTm3Jkjz8QdfIQM5YuKBZoU2cmxGoFjUKbKAdqY+5VyH+ucMfNK25
	CNZklVLJaYfBVgY0HZ0DcoSW+KDvfSvqRwEHyAd7rlLwtm713xW2wyZmQSp6qzAs7K2JqsW2mGk
	0MzAximNuIyXighFwFk3q+qbJ/bZRD4TgOu/y8JMAtrJRdGeSGao6QVDbGTY0A3MbNN6WSb6ewB
	xUdA2IkJQfW7rr3zWoq8VbI16lIcmQZH0ZWaprYuuV9zGBhRBYINUFhL6vSC0UrOqYQ0YjFXc4d
	8lw4juU5e17B+p/aEtlutPxDxyQg=
X-Received: by 2002:a17:90b:4407:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39debff3508mr11708458a91.10.1789459584240;
        Tue, 15 Sep 2026 01:06:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4407:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39debff3508mr11708373a91.10.1789459583685;
        Tue, 15 Sep 2026 01:06:23 -0700 (PDT)
Received: from [10.217.217.79] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm36397549eec.28.2026.09.15.01.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 01:06:23 -0700 (PDT)
Message-ID: <e239269c-89cc-4465-99f9-3257b213b35d@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 13:36:14 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/52] clk: qcom: gcc-sc7280: Tie the CX power domain
 to controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-23-9d5a606ada33@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-23-9d5a606ada33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa8fc81 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8AEooqP_IvclZvvwVwIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNSBTYWx0ZWRfXz1LuauTOLJtZ
 pUq/lojDztauo/mMxDJGTE4EljPLaUUnVxnAVJllIsags6pwIObmzxA1UIA/TXAvb7PyD0376QY
 4pFdSmZuLdjVwvNmcb7pPbSoOxOLZWdWNiArQkXGk67cOsc1+gHF9e34SrXaTceXG04c+w31C5m
 r1rSu1cGu3TVYw6nQpZVM602hP+bFT65fSzG3lCN7SvfD9eu2gmC2d1ifHwVBSCsGIpJltXJVFC
 5GNNMr8rl4+BRFz9CcihMGNlwuTod8hLWdA1tiowCfUOeMvhhYHeAF/9rMSWvWgkH8bFnziib+C
 6g8JcQKC9sLmLY2UKjPM2TdXryzC2rh+L8ZVFv3mzGjc2VziB0q19dsrTgOxmgfT8tlD6s92JSV
 YSysdhOQEwqEX6AXmiEM1r2ZUQU/ZxHKvegdPzaygCccKs2VEWFHiWugSNRZE6ApQrfC/Hv546K
 g0i3PosO7xbEYaY+ang==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNSBTYWx0ZWRfX+mgoHyqphHek
 gZiXUfBJOBeozzpfVkRNEFwAYI9rgSsaMyMYfe1dOYDpC/wH4chVWl48VOKTOOEUTO4rcR8zx/B
 SW/wP9YFtPazDfAcWbWd1fbTgpQG5FI=
X-Proofpoint-ORIG-GUID: d0bvA30mJUm6NjtIr7JLegw32va78QMP
X-Proofpoint-GUID: d0bvA30mJUm6NjtIr7JLegw32va78QMP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150115



On 9/14/2026 6:17 PM, Abel Vesa wrote:
> Enable runtime PM for the controller, allowing CX to be powered down
> once all GCC consumers have released their clocks and GDSCs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sc7280.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
> index 4502926a2691..bb8f6efb88b1 100644
> --- a/drivers/clk/qcom/gcc-sc7280.c
> +++ b/drivers/clk/qcom/gcc-sc7280.c
> @@ -3446,6 +3446,7 @@ static const struct qcom_cc_desc gcc_sc7280_desc = {
>  	.num_resets = ARRAY_SIZE(gcc_sc7280_resets),
>  	.gdscs = gcc_sc7280_gdscs,
>  	.num_gdscs = ARRAY_SIZE(gcc_sc7280_gdscs),
> +	.use_rpm = true,
>  };
>  
>  static const struct of_device_id gcc_sc7280_match_table[] = {
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

