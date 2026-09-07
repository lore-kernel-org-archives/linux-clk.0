Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB60230264
	for <linux-clk@vger.kernel.org>; Mon,  7 Sep 2026 07:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767989; cv=none; b=hAAst8s0wC1Kh4vUG1lVX0NB528kcJ3vy92LZ0wY7loulA3G6yvrWp5gP5KhJkqMs7l/RFMOzhSUfloSo7Ibv2H5XKM6+gtetdA3Zp0NNvcRTKYjRCQaUBJKhazm6nCQfHgHrnezXlD3CHcwjIvidq6hqm800yX0so1CnBJ961I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767989; c=relaxed/simple;
	bh=lMurb8WHICjQOz0jHZq94HqsFYLXI7DQvOMCmN5b7iU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZ8NMxU1rgJtyNBJK6rVWFVrskTkKuVMUP8t0udqWlWlDLI6epilT0RCmo71E6H6subGBdQDuyy5FMziIGmI0spMDqRpIIoa4VlE5p11N8sGF9LPuDknVX6V29a891UsdqiRauG2U8RtI2n0KkGVsM5Twa+5FFZuD+XRZqcnlQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W6mBB4ik; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kXIpN6ZU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W6mBB4ik";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kXIpN6ZU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777vdg3686812
	for <linux-clk@vger.kernel.org>; Mon, 7 Sep 2026 07:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CjJ6/joxMNoyndUpWvHjimxDYdpj29kfkXilh/8W1fk=; b=W6mBB4ikriKG2TQk
	96O1PWEV3sZu/NePa52o8aBRQM1ZyKPW5VTnMR2MqemDK3A+FHLcGu7Y2cCiLJNL
	y7l+tq92dDeP/RiWDdaDxHW7Mzpxm8xteInCe2UZAWnrRpIfGmd/KeiEPZmfbhiW
	FFzwpr9z9P+rKJwq2Gr9dHZaBmFB6ssC95c4WsLngXR7CPdPYMP1p2xdgDh6sDGd
	IMdXOTAYtzCdT7EkyBEyPANDJjrKqzPENqK3Dw15eNY69eS6RxFX1eGsa0Z42SEy
	UpHc+N9rRzeV4wa6KYd5DPsh+MpQuIplVay5qhLhYtEbmOkOnuiZIrl7giJdjFIN
	GK5EOA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gga375y76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 07:59:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfd1772d8so6130741cf.1
        for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 00:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788767986; x=1789372786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjJ6/joxMNoyndUpWvHjimxDYdpj29kfkXilh/8W1fk=;
        b=kXIpN6ZUD+k7ECCcscEFXRbGsJa8KaEROzTrd8GO68c1Qlqn362mahVIZct46dYZ2o
         GlUqI4QGQ6h1jh63MkyP8k8qVUpJJ8/pGsTIK/pEEW1vHHWCY7DvurvLD3TC2A3k6OaG
         Ah42NzxQIxr4r0SqKdRsdoF7rkh0I1rZG/AfOaj0KAOcUxrvR697KoY89vc1lkAUMauN
         FjxfXCfvZdDo2ywSuYT110+dAb3cCnESqSwiWA4A/vVjcf8LMfzFkOiIj1sl6qgYu8cL
         XifhHq3KjgJEfZbF63hpJHN1acVjYKNwcWmksuQi0CLqdKy3dcExETL5+A6Po5+9v0Oa
         YRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767986; x=1789372786;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjJ6/joxMNoyndUpWvHjimxDYdpj29kfkXilh/8W1fk=;
        b=eJPAvmfZz8Nhq+0Bvgx9TfYVtEz01py7ZM4mGL8S3Bn9xnNmekWrfzDBrm3TjIccOm
         nfVFyZhbWUxUG1oebxgdNIe9PzSFGHYbS/CgJF7me0JRczIcJA02hbnt+HfXTifz5rT0
         QDmEybR5T7gJdV/s49fCfMUh919lZDt3ADrsVXwxdt7++ImSJ4S0wj+YtdGOAQZP99er
         KwNti0P5l+PAu8T7wWlIGYEDhqDWbAqyXotVB5g/iCF4SQR4R/BEz3S82a/ccjdfKEZh
         NyKGKnEK0Gxh9E3+7tqg15jtBnvnxf3O6WzF3UcH1FTcDMoMlDBFcgJGP3lX1QNyIpAb
         mcIA==
X-Forwarded-Encrypted: i=1; AKwUvBxx8neCTA9PbpcE43HS+jgPynvawYoA1v6BR6GTAvRqYYaKpdVYJa4Sd0NfEPRSycYySppn09vEcfA=@vger.kernel.org
X-Gm-Message-State: AFuF++nGLAMrNouYeNwmNeYzCnDeVN1/K69FieRW4M+lSw3TtJ8N/x5S
	pgmlGZdaM1qbgdzGzIs8f+7NPYO2GZfe9W4zLoxBIk6qjGEn2zw4qz6e60gnPTqSBPVtqrn2zk0
	xFoB5RxpTLhnEETVdyHVrmYFUCc4iK+R9n/lLH8QYojmKfZL1gXYnGQhs13uKF2o=
X-Gm-Gg: AYBFou13EIbdec0fp5/jJwgh+CG5MSxCvaTp2uTFAGvIbOk0M939eIUBs3BQXAPE8Qr
	Syg9ep5oLR2i/n87WzUNUGFx+VldNshgnj8Kheh20SCvYzQAqdysDJhiFSM/iUxK0vOf+zkxrkD
	dM7yi/cr7zUE8pR+eXAHqyO6eMRFCUbgv9lBjy6loxz0volS30X0qqApfu/LJ36ybCr0dCQUBvs
	FX7wIO4QBp3FCUkR/wkP/NLFTMLXMeiUjCYRRFIzQjR4UjDfKYVTJI3vXfIaQyfF2bRgWn/zuzm
	ZUVIu9Z8hJf5Gem14HXswNpSZ/15ew5bMWLzE2tZPZd59/zPPK16Ogb/n8bwK3cVQzyMbH/0KzI
	r/Cb8oipa156gxdcwSti1sw==
X-Received: by 2002:a05:622a:148c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53064575926mr120114351cf.2.1788767986005;
        Mon, 07 Sep 2026 00:59:46 -0700 (PDT)
X-Received: by 2002:a05:622a:148c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53064575926mr120114161cf.2.1788767985530;
        Mon, 07 Sep 2026 00:59:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6db6sm3684473a12.5.2026.09.07.00.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:59:44 -0700 (PDT)
Message-ID: <b4e9a3d5-385e-4cfe-b477-e3b5e5e8adfe@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 09:59:42 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: gcc-glymur: Use clk_regmap_phy_mux_ops for
 GCC UFS muxes
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-3-cdff2c67a8c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-3-cdff2c67a8c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P6UQ7qVJ__fkULhRv76d22PM5JNjqY0d
X-Proofpoint-ORIG-GUID: P6UQ7qVJ__fkULhRv76d22PM5JNjqY0d
X-Authority-Analysis: v=2.4 cv=CbQ4Irrl c=1 sm=1 tr=0 ts=6a9e6ef2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vZgVdhwgRuDMrAwUH48A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4NSBTYWx0ZWRfX68dbBrYvr2mL
 QVh4uSjClbJGbubUegJWGEqC2cYZotjPwV2BgUVoB52aErpi87mMH3ky42GYt7l4WdYWH3ktBGJ
 dFom08DJcEa+p2CT3mH7W/+sckcPwS8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4NSBTYWx0ZWRfX4oQtYFhZXLBk
 aCag1naDQKI02wDjjvblU9PJAej//j+7AMQ4EOX5w23Drm7YdONEqVPXRnosc3NdWkoqpb4WZ1o
 +VQToBjdtOldPVc49Ra7C9UmVCS/OIu3aBCtJKfNe2OoZ255u9dZwwzhBiCvTI+/qK4O+2GPOo2
 /+3uB7OL/li47RNzFGtK4hB146yQenh5by1KRMyM3JVEHrA96MuOlumuPjVJEWNEccbmdmcKoFU
 gMohlEMvAGIZPGDjK2nBNCArSH0Q3xBNDE0aPFf2U4Ri42D8StAj07Zivc8xidCTG3/tICrR0CU
 EYHk43UeImhZaLeBGycbPe92SoDYG7Qo2DaLT6EERYbrKqC65zr84yuzIH3i/cO1qsnGaPc7C+O
 gHUI4fodZCczhhPgt1eUg69C88bQluQwBHCricoKLE1FIZaxHrWNWdFaxmyGh1abJHGMvGR0kMB
 yrCLNHPfO9H2+5Np7xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070085

On 9/4/26 8:50 PM, Jagadeesh Kona wrote:
> Use clk_regmap_phy_mux_ops for GCC UFS muxes so these muxes are
> automatically switched to UFS external symbol clocks during enable and
> safely parked at XO clk during disable.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
