Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2226A19ABAB
	for <linux-clk@vger.kernel.org>; Tue, 28 Jan 2025 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738064379; cv=none; b=MBdXWDKfiCOvUlQh4U10g4Qu4Y9XRjYZWzMThGW5F3066Gnw/2NUo9rkR94SyhcfXT2T/2Tu4s1hRFL02yRse+fnpuplSP5ixN+9SZdHpoocwGGj+QokhXJ2D6J0sKqiGTj9NwKkWuWmj1v1/oXXN3KJK1zj9PXCVCi3h7YAEF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738064379; c=relaxed/simple;
	bh=cYLJ80PwLEuMleEF7sdQCbPqBtjyrB1AENlTlmkEFCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XCDmCnNyvhxBY5nKciUSC10mFfSlsruXQ4e1ker6WO/XSIH/xlZcjk57RnvoENdJdLsbmsWMddI1kjR0iZcvgz+CXm9ZMALBMxXagIptKsp1X1+M6Gxu+Lgses5MIvhQ095AX16nCPi+gUZoB+TOqevBwn4A8UVQMVjv7IAXCJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xwnbn4e2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xwnbn4e2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SACwgS025397
	for <linux-clk@vger.kernel.org>; Tue, 28 Jan 2025 11:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c8G+n3ZngrU2GKCknxdXhyFizTUlkoDsJmcONKoxIhY=; b=Xwnbn4e2luTk7x/a
	xLMSwjOhT2k9FqYAWvyT0HjbWfJ/WzowulFkLpE94iVJD4q8JWC4x2Nvd2b3Iyfv
	iKCWgNOXh9+UBEF5KWLNlSsfmmkooTtRNBOKIr+mMRFqXeBaFmrsNA9hrR1+cnQd
	0TL7PQG3Jc9jhiscXzyhXRPNC6rQ0KzZ8AhZ7h/dXzZGMczoUqfuz+enZJ3yDMnn
	owfAIfirs6yNCzVyVrycIqnTKEgB0z/6+e+qbUM+i9xjVsqYcorWts/l6dXlOUzQ
	lxBEBajoWHjcCvMxjwxZOet9lZnOkfps9vyC0cH2zEfVNj7gqKm3zUb3XENLVhZ7
	vwqHCA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ew9n875x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 28 Jan 2025 11:39:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b704c982eeso133205085a.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Jan 2025 03:39:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738064376; x=1738669176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8G+n3ZngrU2GKCknxdXhyFizTUlkoDsJmcONKoxIhY=;
        b=hwd2azCwTlYpvQYaDQ8UeIJo0mSb2b6uY1/qMidS+qXDpeQNlXW/6P1HR0DmQex8pA
         /CR3gWs/Q+D6Aq8Uc5210NcGlv/vYWA5t4PgmsiSdznsJKoB935pXIa0cIPZNQWJC/Ok
         clCIYAsJe20tEQXIcUDml3Kh/selDblEpSNT4w1MUkrnvLvwunYFr00KGYV8oEZtJGs5
         QKGE2QPJFpFyTknERFJiKjZZ/diC2MSz+BVquWsBj8osQ40ReWeemr2IycOSYksvMMQa
         gJVkWhEmaHkyCY1ZuiPc51K7IwduUrnC4ea5rNPJ1IQ8/8M7/58JcrrxhIPhYdbcHpIN
         CNgw==
X-Forwarded-Encrypted: i=1; AJvYcCWx3RCdDg46e6jDBOWVwL4Npup2aOt+ksPNZmqM8/87qBrX97u5LOh7rLNEIa50sjUONILOUzdWZ50=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaG+yDhO/pN0LR31IfIb46DdPyDP/m8fajDxXPizcjPG063JCZ
	lcvj80ieVU4asxF6JqciGyb6wjrFgoAh6X5CCEwYdyshCx9eBKyRjV60uUxLm6o9C151YzAy22c
	oGksGvtDDu6KeXu1VNJ8irGq/+evkZJKLhtdp0mBPOpeKVGX0dnKKovJFy7w=
X-Gm-Gg: ASbGncvi1rSqFwxXKrGnPRsPgFb3D97WUz91sC6kk1/mmGHgiY+s6mpr8JnolH/AhpH
	zw7M3OdfUuuVKfCi+5aMXl0Vwq7+WoreU+H6KbGpyjkb7z5Kie+T2t7IeUVWWIfGPHY4pTP6VII
	cBlj8CPCPOgSVD5SB9qeWVQUmau4677qSwHNWk5vMAOkNWVr/hwtgYFtR5ePVHsiuEjYcikyPcQ
	4b/x/2q/r+CXoZ+JsdCArRyEEcbXlAZPrzIO8EARZO758kgxhern+G+bFfTekmzemVpbPsJWAwL
	GWUSLJ3PEX3Vbr3UqQlY4Wa2AFEDGpD1p+LSE+DAzAuM8aOiNcbZyYJEuIA=
X-Received: by 2002:a05:620a:25c9:b0:7a9:bf88:7d9a with SMTP id af79cd13be357-7be8b35df7fmr1577082585a.10.1738064375913;
        Tue, 28 Jan 2025 03:39:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEl/9vihPrePN5++74ggHEkvKcwadtpWp9DHg/uRR9be1hDo37w4XNpR0496AEEaGNUPkeNA==
X-Received: by 2002:a05:620a:25c9:b0:7a9:bf88:7d9a with SMTP id af79cd13be357-7be8b35df7fmr1577079785a.10.1738064375562;
        Tue, 28 Jan 2025 03:39:35 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc18619265sm7020915a12.7.2025.01.28.03.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:39:35 -0800 (PST)
Message-ID: <3e92c8e2-7745-4205-8a48-5ef783b098a2@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 12:39:31 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: ipq5424: Enable PCIe PHYs and
 controllers
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, lpieralisi@kernel.org,
        kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250125035920.2651972-1-quic_mmanikan@quicinc.com>
 <20250125035920.2651972-5-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250125035920.2651972-5-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uBfSV6Zwo2rfBW8bfz0Xvq_Z9MzFBMIT
X-Proofpoint-ORIG-GUID: uBfSV6Zwo2rfBW8bfz0Xvq_Z9MzFBMIT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501280089

On 25.01.2025 4:59 AM, Manikanta Mylavarapu wrote:
> Enable the PCIe controller and PHY nodes corresponding to RDP466.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
> Changes in V3:
> 	- No change.
> 
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 41 ++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> index b6e4bb3328b3..73e6b38ecc26 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> @@ -53,6 +53,30 @@ &dwc_1 {
>  	dr_mode = "host";
>  };
>  
> +&pcie2 {
> +	pinctrl-0 = <&pcie2_default_state>;
> +	pinctrl-names = "default";
> +
> +	perst-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
> +	status = "okay";

Please add a new line before 'status'

> +};
> +
> +&pcie2_phy {
> +	status = "okay";
> +};
> +
> +&pcie3 {
> +	pinctrl-0 = <&pcie3_default_state>;
> +	pinctrl-names = "default";
> +
> +	perst-gpios = <&tlmm 34 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&pcie3_phy {
> +	status = "okay";
> +};
> +
>  &qusb_phy_0 {
>  	vdd-supply = <&vreg_misc_0p925>;
>  	vdda-pll-supply = <&vreg_misc_1p8>;
> @@ -147,6 +171,22 @@ data-pins {
>  			bias-pull-up;
>  		};
>  	};
> +
> +	pcie2_default_state: pcie2-default-state {
> +		pins = "gpio31";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-up;
> +		output-low;
> +	};
> +
> +	pcie3_default_state: pcie3-default-state {
> +		pins = "gpio34";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-up;
> +		output-low;

The GPIO APIs are in control of in/out state instead, please remove the
last property from both entries

Konrad
