Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F43280A5B
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 11:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768908110; cv=none; b=PJ1krFhnHd5ixJrApnr4FieZuuovqCrlFIRtDQf1NzmW0Y/kZhk/iXEKJpyGpe9ns6GwP+ZNqdGIf87P50ZJVLwbNuwHBMb/4DnXJCNwjp8UUFW8Nc/MCHX9QJAfJRX5ifWvlacDmHWpu5WidqlKD0AVKp3RohPd77ZJuGxElSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768908110; c=relaxed/simple;
	bh=F0t5sbycw9YQ5W7Eletv4zTITIv2QNOjvOBgJ0EmP7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sZksEwA0mK03ZR+6XOn92z5ueq3PHBJ6cRuaRLoomkPJ12jr2E29TcpKIEdszPutSMvmVQU2tcgvEKl27CKVH9/i3qGB3VRFHqY0Jgxom9ZbAedwAGZygFlT0KbkE7dkY6lZ3bnt2tBMUdC5Fv3hSziiwwhoDPi7VRBiUVLZl/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cn5FwKto; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRBMD48V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cn5FwKto";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QRBMD48V"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K6hpvo428514
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 11:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4a0PQ+QMkBfoZo42ZG8lJzDFY2OErM69QALH+UBgI0o=; b=Cn5FwKto2g6hPBaw
	UsUSqS4m283A8SRLWkXhAn3W93rj48e9LGYOqcZzSs/KXaiveTBr2V8Etu+A85Go
	J23qd1hriOjIhmmpFirHP2Um2mKCXaiJ51IHRGGNBajCIysI/Vxhhb4FlaJr0vPB
	3mdVBzaDHIeTZuVn2UyFJTh96fkICve9vV0lnBqTEQ+ZK+A3KCaS6q0S51Zf/E0Y
	/CGqpj9nSpK5GjOV/ZjNEhtLxz8y7aK/CeIoeD9r1+DfMTqaIDEkWuMs8sGk8J0N
	Ivm5G6/cQLrAV/ATRTx5n2lWzZJnLkmCVERteTn/5WHMjtaCBWArL4+EpgXojsM0
	lOq8zA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4ps0trp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 11:21:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-501476535f8so17882651cf.3
        for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 03:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768908106; x=1769512906; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4a0PQ+QMkBfoZo42ZG8lJzDFY2OErM69QALH+UBgI0o=;
        b=QRBMD48VhGDy2WJhD1eRTxvy/xb+02jXLCDhdWcpgTVKHXbaoWk83H5JANYj6X2Le8
         tmzSA5STFhdydmJ1k7Yw02N17FJbyyoMtrNjLBipREAhJYU4PHYYWocn6lzE3NobX8jb
         vxczOsuIRPimoaRbTH3h6gQkOcYczEAA7TchqYwhk7LHdL7Tr2bJpjmVyDVxk8SUD+MG
         FDuox2Khj/V3eFW6gwJgpG7T/lMzJe7idyqzQ5Q3AXuI2Rk1CVRVDav6isU9qnP8Zfli
         sMWp+7AhwEdaw8XMHY6Ocde7cIwm51bfDVy1fFw4J9ZS/cbcwoYTJ9ysyyhAUJkbuK6v
         JbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768908106; x=1769512906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4a0PQ+QMkBfoZo42ZG8lJzDFY2OErM69QALH+UBgI0o=;
        b=RivjFPVXP38QvZA7k3z7cc5+DFpy+kOPoV9RNge14p4tEidGgSeBs5bQ8QYN5dtTE1
         V6FK3ozfQR4xDzJemcDQL3njv8gLTq0xncNCAusGUoOavMzA1kRDnbAJALlBIUp6NBJh
         mhGY+BVovon6VqQ02eymnScKf6RFu841offBEHDhiyW6ttm7vsni3QOOoRyzQ6KwqPz3
         w24BEp06Qpz9/OrEXvRLQ1+xOTA17zdC7jv7UfnmT51i0rG4b6abj/6k7CO5RssoiIhB
         g525yqtLrNo8g7lwh3fHZAXpYVS11UUY646/BpcpcPBnUKYoUtjsbEjCR9apTYfhBQXP
         YURw==
X-Forwarded-Encrypted: i=1; AJvYcCUfig3+GyDG0y8obbdTjPp4k1kQruSDFF8rHrsSYI41jyJ2eybxlrRroUCHb29Pc+jMgA6OVZeS3Es=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9qKuyh6VOYWEP8jMQxAli0U2Ms1H9xmEGS4Y4aQml9WJST4HR
	bnNxBjAY6J6q5mf5DxXMs81C1KlxhIbIG8+pdDEzNYH4AsuSpAMgGfbRSrIe59dKidThCYdftrG
	PyuoEja+xNZAc3Uckclm7N2wsztSUYGC4lBHJtQX1Whmlre9T72H7jHwgItYhDQ8=
X-Gm-Gg: AY/fxX7DgiP+2ahI4Q7zfqW/TUsBR7xE5evWm1cYJNjORPgfFS070jCDIQGXo5n8OEt
	yLsrW66ptDea4Yb8ONxfNDBssOGHyerqeid8Qxqbf/1GsmLjrznUKj5T6fpDEqcvVDJLhU9RQ0M
	9zQs9SBUf9sYxxtOBmDzVM8nRAqX5zUdKhIPtLL2D4n7N3KkpgW4Ldlw1J/cXyZTGPyUw6y2KzV
	FPxb0ivTzJ9Qr0mjek+HWJxQX8jVMJMb/AD6RgOyeJLt/NhnhqzB6ILOrFjd1HT6ZUVJbDgsf5M
	uxtvmTGhhaOoJwTGGdQ8hckvYTtGbLmhNehVs96Ba+O88RWPK/A3nXuCMe72vTCxSC7X8su+dV7
	4Xp56QMSOxZMittXeucGM2HqrbJc29F3T8+f8T6hbZVBGCJ+PdK3iHOmhrwiIqYGt16s=
X-Received: by 2002:a05:622a:51:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-502a168dce3mr167653131cf.4.1768908105754;
        Tue, 20 Jan 2026 03:21:45 -0800 (PST)
X-Received: by 2002:a05:622a:51:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-502a168dce3mr167652921cf.4.1768908105374;
        Tue, 20 Jan 2026 03:21:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6580ec85bc4sm90439a12.5.2026.01.20.03.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 03:21:44 -0800 (PST)
Message-ID: <b27bd055-d6e1-4021-a2e6-95064b2a0ea3@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 12:21:42 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc7180: Add missing MDSS core reset
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        cros-qcom-dts-watchers@chromium.org,
        Kalyan Thota
 <quic_kalyant@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Harigovindan P <harigovi@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
References: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
 <20260120-topic-7180_dispcc_bcr-v1-3-0b1b442156c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260120-topic-7180_dispcc_bcr-v1-3-0b1b442156c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nnebu_sPwemd6ppU4pwmU80uLGKCSEag
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA5MyBTYWx0ZWRfX47z/1lKlCtR4
 hBE6m8YHQx6goCNG3FZYvtV7GfIJ11fwe4VCucXYCmmxvcaTdYhatphjR4O9HlDiqZgcM46Wcc5
 iClQ8zD2DiqkY4ZVYN5Ex3Npyc04sFvbEuqunw2ZhUURxeOSeIVEYF7vW+dFbQXXrSHEYV6oMoY
 T1Hm9wMh48WVxXmGiamFEcMPU3hHf436x+vnAlDL+rJyKesPQm6xw3Kkvs6oqiKZNUbNHSx7eCM
 V9tj8HxchpF2VUZz0V+bCnFlZs4iybsWWjgcY0SvlCOHoFy++XsBp5kMDP3lyiPUgOvQki/ixKm
 GK6t0mgHvpjyyl8J3DKPAG1DHsnOVUa5GEc3Ip6rasvqK1hEfzaSojaV5q2N8+Bzlpretazlde6
 vd3O4UTPCojPDXHVciK5eWBISYc41HfpZZXU5YLTBpXA6yXg+K9g8TakErxm+RzW+3urXtQK17+
 yZw6Vk8ZiB11tGT5nIw==
X-Authority-Analysis: v=2.4 cv=PdfyRyhd c=1 sm=1 tr=0 ts=696f654a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ijxkZjTTDkK4w4DhjVMA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: nnebu_sPwemd6ppU4pwmU80uLGKCSEag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200093

On 1/20/26 12:19 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> To make sure the core starts in a predictable state, it's useful to
> first reset it.
> 
> Wire up the reset to fulfill that missing part of the HW description.
> 
> Reported-by: Val Packett <val@packett.cool>
> Fixes: a3db7ad1af49 ("arm64: dts: sc7180: add display dt nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 45b9864e3304..f7937fa88536 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -3221,6 +3221,8 @@ mdss: display-subsystem@ae00000 {
>  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
>  			clock-names = "iface", "ahb", "core";
>  
> +			resets = <&dispcc DISPCC_MDSS_CORE_BCR>;

^ won't compile without a _ between 'DISP' and 'CC', should have 
compile-tested harder..

Konrad
