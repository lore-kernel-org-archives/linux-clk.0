Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA492AEF5
	for <linux-clk@vger.kernel.org>; Thu, 17 Jul 2025 20:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752784480; cv=none; b=bfBY/BnXOowjQoAuCZwOe5NaNAmqMtfAKwu0HQyhJjeALYuDiGDTLZfdRI9+RTs/TLy3clVjnwQbxfalUzlgDFnfYlxO4har5nyC0L96SQcVXYWFbCLrLgn+dB7OKsSBKGtMw/1vgTsG9A5/ixyPbWhhKddQ4HXKdkdaaZ92KP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752784480; c=relaxed/simple;
	bh=hGJR3V/1tcHMB31VvpC4R8Zsvg2CwbMItsyk5iZAxy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JJUM/0i7T6zr+iz6EiPV/gFR0OV3rsIrFRvOu4gvUsx3M35p4ezoBKziRtg8JNJH0rI26MQbawBC+Ly/x+ToTaL4tHqR9fAgXDYOPvd3YEWGCnZRiGhZLhCs3ORfPxpfQ4GCsVR/w4RCGgn4iaq2xqPXrR1BuFe6Hoittzaz/NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cqYJL4ES; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cqYJL4ES"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCg0vT021705
	for <linux-clk@vger.kernel.org>; Thu, 17 Jul 2025 20:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6kgP0d9tIR6NHctzVbidbhSLAjPMVFzktI4gkLXeKhY=; b=cqYJL4ESt1MD9auM
	Nrg42kIguegh6DhejQY0DnvxiAmqQzzhVtWUht+pNUGbe0C6SQcwPwf1ZzVM4rbE
	VlEIHpHPsYPwaAuPKBQ1QDjfAza5LT9R/pPT9TFRB4W3784Cq/qCuFlxbHTUVVIc
	kmrMI/ry8lDEyK4pOKBMI1ofO+fWqNKAaJPH0EOsZzPPdjMdNm7404nvC3duQ7nN
	fkG2Om5sqq3YOieAWk5LDh8xrw24vgVbHZpPsb9t8TIrH7aSaTbmgTwtZFD6QVuK
	7wsWZSARXvYXbwsEQXYTi7dmozJBtZ3dkLFY1OtVrVDQt2Dg8S9M1GRN7WqdE5TO
	T53f6A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8gxmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 17 Jul 2025 20:34:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab65611676so2854681cf.0
        for <linux-clk@vger.kernel.org>; Thu, 17 Jul 2025 13:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752784477; x=1753389277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6kgP0d9tIR6NHctzVbidbhSLAjPMVFzktI4gkLXeKhY=;
        b=OurPy4Jd/fqZGzF0MMSvBxv1NoscEra7h12wpc2YNFqvRyNExRDK6/YAGDisfsKD1X
         +g4o5WJu2pj9w/ofFqnMfGos7siFpm/wR/M9f5z4B301NhUEW14BVwlVE2MHeXqbELkN
         wJVFMPNfIRpQhFrk4t4ABqcTNkspyJ19FjIGUydTGGJbUndxfJSbqRNyEfjQRZPWwr55
         P7y/Sis4nbvk6+SE97KM77bhXCwBvY/XSNMvkDFNiT1mwu+HZQXD5egqriFyCkkf/J3+
         T7w/1M7k9EUTfFWoDskNctYHqgn3YHnxO6nv20Ilvg6lrdUT5oqjV/J8NFX6cLpVwIMO
         ILgA==
X-Forwarded-Encrypted: i=1; AJvYcCX5H8koI9Eme8bQiI3lxPqb1weeCOiTxKMvufPXRQOJxhaD1RYZqeuRP8Kmj0nl61ekChzIxGaFM/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa8OESZA20BDm6oETXVuO79jYoFbiQvwGZEds98BH3EbXZWU7A
	RRicsIN06FuGOaj5QmGmiItovFwQG2Quk1feRPWpg7C/iHtg5ZNUtqMO74oWUcQHfDY6Pstvsi2
	+SnIlszj13Dw/L70EIiKqHurRRFyEDS7OsLCAqvX8zhtO/sYuiI3CU5uK581txzk=
X-Gm-Gg: ASbGncvMFUx4w4pX8sZ6SPcsJKURBgSanbjguZf9ADnTQRTGxcJWxaXUWH5X6B7VB/v
	tKeMDgIh4DX0lc49dIZrH7yEXh+O64x/EOR5vFBjNlk5urWoiVEdXXMFfLE3f/brKg6mkC0MTi1
	ltHlvDovZM3ND+0HheBfWDJAjUXGKGsP2t+bkN0JtcvAyqe3AJGp4L2OCgeYnrARJh8HUsVpAs+
	1LDzI3XhinX1T+CSHmVcFHAuDRH2kkPLFh0PFvITQ6t57vbwjqfpFewT5k2WN6ELqVrxhQK4AFX
	93Uc5yo7AwgFN6NA+9zsL3WdWnxhmKIiIZqYcPMV0vItvuwqGhgBQBKntRpR7KZ/XNOrRIuZHVg
	1OCjDXUwlNW9RA9tuVyGl
X-Received: by 2002:a05:620a:2b49:b0:7e3:3419:90d with SMTP id af79cd13be357-7e342adfc02mr465485985a.7.1752784477308;
        Thu, 17 Jul 2025 13:34:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEupMN70iJ4oocSBV5jSP32Z5K9i0re731zgAYdP0kVX56HgTG8n+/PmtNQbmI3Nu0wihezSw==
X-Received: by 2002:a05:620a:2b49:b0:7e3:3419:90d with SMTP id af79cd13be357-7e342adfc02mr465484885a.7.1752784476917;
        Thu, 17 Jul 2025 13:34:36 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8264fbcsm1437115666b.75.2025.07.17.13.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 13:34:36 -0700 (PDT)
Message-ID: <27e4a27d-6e91-4e91-b55f-d6aa4a5be800@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 22:34:33 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/15] arm64: dts: qcom: x1e80100: Add MIPI CSI PHY
 nodes
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
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-8-0bc5da82f526@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-8-0bc5da82f526@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE4MSBTYWx0ZWRfX7yfiSilANmiE
 W8KRc7aaIs40IIvN1xqR7qWn4mE5jXlfsQH+cHYl/myXGBgCFC4O2YsCbzHCoe/eBoIiU5laGf1
 bJxGpNHsGVmA9+vtFMS1COLzCfBk1GVRkG9eV4TJ8A6C0OJnDm9VtgKPPAdzCemRT22G+gbWVSZ
 jon7Hm18NxK5jPyDx/ahoaNdYBUV/N5NKgCkJALic371SJHKwxD8r4qrcxEkaj7TE/wd2gOrSnD
 KpVm0mmBff+5e5OiOvMuB5CsvWscgPiwm0OdnCDXrZG/L0t7BxmePB527SUcFQySlBxQogHy20/
 Mc6rRr9ljgd3+Gud/V95xU7noBPMUXtnQqg0bHlaaaajMCVCNT55p/xZLpJYqGr0STWlkkvhAJq
 loM1v5DJwCbDmdAPCKPiE2AoeDPfjm1yU3wvKoAnqCYXwtwRQOe8deJUqYGH7DMKSh/Bdj+c
X-Proofpoint-ORIG-GUID: CiYxnWVBfoHJN4-tt7dPUB04r-aheZKd
X-Proofpoint-GUID: CiYxnWVBfoHJN4-tt7dPUB04r-aheZKd
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=68795e5e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=jM4f9QFlUBkeW2BXBzcA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170181

On 7/11/25 2:58 PM, Bryan O'Donoghue wrote:
> Add csiphy nodes for
> 
> - csiphy0
> - csiphy1
> - csiphy2
> - csiphy4
> 
> The irregular naming of the PHYs comes directly from the hardware which for
> whatever reason skipped csiphy3.
> 
> Separating the nodes from CAMSS as we have done with the sensor I2C bus aka
> the CCI interface is justified since the CSIPHYs have their own pinouts and
> voltage rails.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 88 ++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 41245e8592f78edf141141f2f5b7c5b841318f46..e385d6f329616360e089ba352be450c9eca6aab6 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -5244,6 +5244,94 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		csiphy0: csiphy@ace4000 {
> +			compatible = "qcom,x1e80100-mipi-csi2-combo-phy";
> +			reg = <0 0x0ace4000 0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "cpas_ahb",
> +				      "csiphy",
> +				      "csiphy_timer";
> +
> +			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;

I realize it may not be easy to test their functionality without the
rest of CAMSS being enabled, but are the CSIPHY's registers accessible
without the TOP GDSC being enabled?

Konrad
