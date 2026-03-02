Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C3032A3C8
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 16:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468353; cv=none; b=h1ootqEOf0CY3gEWSLf4xwDO3jocxs6idMyXE3jEDD9IAEGTaZBB+AL95jQpGwTypdd4MQI4D+s9waLcI8qfCtlHoVFB/g0j8L0nmZ0ml6n2ldS5FDXna4uvzjIsZNg0Fq+PE1v4eChmGBl8kzAleiu6VYe1YRrc5hqrL+4ieD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468353; c=relaxed/simple;
	bh=sYvyd0Zm5Ga2JIOjj5miURFzXTnvIdotwsCvsCSNo8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JuHk77vfHs5MN3oljHQcIr0EJoSLU3pwIuPGiB6ykRKsX9Ml5zVY65o7GP1a0PpWJIEZTQ2tZPExj2HDhYQZRnQTjD8p/LO3n6FZz4kmrjZXlY5KC2+t627HF7/II6f2wB1uLohciYFv6+U1iRg6745PWXHoRUtgvIEGVHulHL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N4Z9U6Pn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWGpTkY8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N4Z9U6Pn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWGpTkY8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622EqaWR2883312
	for <linux-clk@vger.kernel.org>; Mon, 2 Mar 2026 16:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vhjju8BOnGn4NgWCoflGT14vT5s6pSmdtD5C3RVGsmI=; b=N4Z9U6PnJAiI+Oc4
	Cr1dp0Twmmqj2RQn7Ja6QIgvgMnaM7cCtExRrbjIMbBQoOWHieUFJJOGdXvtUJD6
	Xx8hRmOvawnN30Wty/0IZpaajVBdc0TGDoagW9pXCcPJ8xGZpsR3iSSrf/HuvgGP
	eBK7DdF8LbFJDGQFjPf9o3Q7riwPac7uhu2vQns4UMTjJ9pgtLcCdawYYF+R5N9q
	13d7eRK+yZ+kKG4II9b62zlv89BNXCYMhWDJCWgDswz37VvcsKTEOaFFE64kBlri
	jGHUvA324UiEYZl2fSkHsH/c11+4nchSiFWFNk2U0MnLA9kaGrtAOKiCBZ2EZ322
	STYfBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbav5d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 16:19:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb38346fdbso430419585a.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 08:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772468347; x=1773073147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vhjju8BOnGn4NgWCoflGT14vT5s6pSmdtD5C3RVGsmI=;
        b=IWGpTkY8r0Xxd8wieMvwQrOrMXhVzlavSkj3D3fVzeum8m8RM66awRlXCRzaIslQWF
         g/aOWGgcQ4TTL2h1tFe5UdQJ9aAbBI39U752wwRRt1+tO1InU1hE0eqr2e4rURX3rMag
         fBGnUdL6gOV1r+Gptwm1L+KAe9IjOwwL3dZkn5s8QV7tuYRIRD9h2kV3yhrCtO96Y4F/
         DIxL9mig1ZoU9DD1JfiQlMoKUQn01w1ABGJAhn3gO2Lv2Mcs9uR6JObNCpFIhd9BnY7/
         H93Szhc59AlDlA+LH98auzk+FsGnan+hfIMUC3ygxSG9eT9e97BzIjTTknGcF5aZOlvR
         aMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772468347; x=1773073147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vhjju8BOnGn4NgWCoflGT14vT5s6pSmdtD5C3RVGsmI=;
        b=gYhmFPhpuW0uHZefkM8Zqog6j0mSp9meciaJ1DmVUZ+PPLLOX94arrF0LLCcSHI0f8
         cSsf3bIRA/mI5A2rRYoaygogF6FibBuUJgpqeOylG+yMo8CY6swiodyz+5lOMaFsf8iG
         vbY2noG74N4lJPapX3VLAIvwRTdKarNeUpeVDmZsKJYnPX2g8jlm6fTIzv1FiFnxIx0o
         3XFQU/VVsRf8KB1Lpy5j0wQMQZPw146bLoMlw5dq3xCIB3eq6xaKlEfjasAi0/G8YLoG
         f0JhK+mPrRidUnJblaDmEdWwBknn6yZ1T+9g3GJi8itgvDG2+XL1Fy0RLbeLqzmBBDrZ
         I5wg==
X-Forwarded-Encrypted: i=1; AJvYcCXCZP9Qj+RuKbAOButd2SxtK2cOhjPmdBYfB8vzw6dzCzxXPSKXrvHeDjulMvmnq316I7k0j3smMHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmt/SUw4jO5M5X5L5A3rEUlyWLyocN1ySiLW03JyPnI0BBEdam
	5Ih0bvzQt24wMpTxPEpRL7VMk3bZMS7Yg8c3Lx6YkJ8dUTiheAp2qfyxZ7MLUEtNY1MGaS14bKw
	livkwf8GRWEr8VGFUzvshJ3g0YD004t9NHafQ3TSM4Ch2EIkTVu5VNQAg62JArqc=
X-Gm-Gg: ATEYQzy5Rz5UshWme8mefgI10d5B0lOBhuzn66oHWnd4EyPMtu5BPMDZ69wvyF3Nodv
	/JP2Vzc/+fXZUvQ6t0rKGvfvluYDzPOv/Ni0fqCcBfx2Fq8d0V+Br5By77Prp0p7m3EeuFfJ3W3
	Ly0z5LWY/W3hYx075y6V5N54Yg0gLMb6WYDuGgi8a7pvzXQg68+bz1PM6SUYAWeVFcEC0jgObGb
	hHJWi5AbRxOOsYk6hJXE158h1iDpkurmyK5Qa80TO/7HTl1oG9GOd9+cdk53jJjuaN0Rm+5GGp3
	NyEVdrtIK1pgF4ztrlSbFjag0Q3DH2O8uS+DGi0tN/set+qQ1IIlHxiwhAvOSnF/M5OKqbGtwMK
	yQO9+gkIZ42kxGhuO04eInOCZZp7NuHmj1vTJjBzKK/YaB/iw062aShVSkccFPmOhHSYiyG1xnE
	Y+m7c=
X-Received: by 2002:a05:620a:d8a:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8cbc8f5c8afmr1174066285a.9.1772468347122;
        Mon, 02 Mar 2026 08:19:07 -0800 (PST)
X-Received: by 2002:a05:620a:d8a:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8cbc8f5c8afmr1174060985a.9.1772468346539;
        Mon, 02 Mar 2026 08:19:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd36224sm3743718a12.7.2026.03.02.08.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 08:19:05 -0800 (PST)
Message-ID: <4fab8e64-8251-4424-974c-19434ee04c76@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 17:19:02 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/18] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-8-95517393bcb2@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-8-95517393bcb2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzNSBTYWx0ZWRfXynRzPuiCnwRZ
 VBEVIyVFizyofiW1e9nRZ316VTaYvv9JiFqFVEmo6wdZqIyilAdRz5MizahtI7nahcPxvqgqcon
 GX/4d+TpTckILy4DJzKlbsgRFg5pON28GyraOuQOuckvTrl6DE63kru1MmJaL9C5FPWR22mO9uP
 461iHB9ZI419qz92YxmC0RVpUdRHkPTQ7WKxivEsuh+NbWBlyAOVyG15CB5u6ZIUYmE1k53XO87
 wLdhamu0fdn+1LTGERH4dvXcBph3WHtHRZ/kP5C4n1xHTM03jwV0pjQ1DN9iqwkbz2fcMti4yhV
 l2NiRyTzv2Q6tKkkKsYaGopELit7vSVzqx1jtDotnohUrZ0lEoMgfdusYZLaRWhbLspVq/woGLe
 khPo4WZnHd3gmYQ39X2xW/qznKznqyRoGiuK56uDVcL9v1DkG1u6nkTZD9yG1W87+gRROCUwRfG
 TXMim2D5bTYH5HE4w6Q==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a5b87c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=72T5t8mROkFztkF13RwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HPa7AG0Nh7RuD6j2U6FKEXaQeT82XzoW
X-Proofpoint-GUID: HPa7AG0Nh7RuD6j2U6FKEXaQeT82XzoW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020135

On 2/25/26 4:11 PM, Bryan O'Donoghue wrote:
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index db65c392e6189..f96411f481305 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
>  #include <dt-bindings/clock/qcom,sm8450-videocc.h>
> +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
> @@ -5464,6 +5465,23 @@ videocc: clock-controller@aaf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,x1e80100-camcc";
> +			reg = <0 0x0ade0000 0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;

Taniya, in light of the recent discoveries on other platforms, does x1
need a performance vote on MXA here?

Konrad
