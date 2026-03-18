Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236613BA253
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773834273; cv=none; b=bQcZkXGR0oKERY+CfPhI1UFwdT7LyHlkD4UE539g5S9xPszPV9BOA1K2W/nIM3804GaTNfIFnndLiNtdJmMHjgPVzigPtMKHT9lfUtkRlMqX+EM82csNGMnFnygKy5urZP9OfiHjgUddXNLmUPPAMfiHy9miEZ0WneDeUC4qyrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773834273; c=relaxed/simple;
	bh=9L28kowxIIemfNyOytDxHCf7inashgWwKKT2MHSuFb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BXVQsgr6vF2LSN+qaNgDAx2uA207fq6khUHKJpzEZCkIxT8Ch4BXmNdZfxCZaMQCUASf8NJ8flEV0Q0AoY9oDEyXS1IbX4InfypF2yo8eMzIWdOkqtGSazvGIqFZXlnA41dUM7cchlSEEYjOfD7gtbUFhfr4flOOvRzG4VuUvO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGUaYhA8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gc7KNHEr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGUaYhA8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gc7KNHEr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9MulH3358496
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4mBU27RxE/tgVlcezl4VCqqbw3jruljluXdk9Ij5H0g=; b=XGUaYhA8U74U/fH5
	H/XUwF9h+GQnBI/AAp3/r3Wh0KFhUZrOW3SsK6ZB3GkJCbzegUW7p3MbeiCRaa07
	Khxv+wEta4tK1q2D1/ZBXRWpUY/xWUx/SZh9/SLNgyxIW95JurUGvD6/B9Dc1JJS
	/0vwehpzjc85CQYRt08VgsmZPPsvJIA6Kdt5JfTRcYJ7UX/YiRxF6f4ySWPx8Ig0
	UJgJlFtL4JN/Gv7XqJseaJRrp7fzAp40WQ4CKNvTwQM+sT2PfKRVgxcdSvQ3dlLm
	PwZbUKdJ2aBUxdSf+xIz3xfvmRGn5RVHwzCa/Y0Waek0UQA2r9rRKMhmotVDSaYE
	vAaaaQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb0g7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:44:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb38346fdbso480911985a.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 04:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773834270; x=1774439070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4mBU27RxE/tgVlcezl4VCqqbw3jruljluXdk9Ij5H0g=;
        b=Gc7KNHEr/UTxDE6WDbBp696CECf35RTrswlwNrtMPXjIX0awFgiRoe3iWVP7m/+lPw
         REbdc0kZQNFKaXcwP/tHwm0TaIpFymEfg8V6Rgz+Zs3QwzHG7HbfU0McuXC55lS1BOs0
         SLsgxzyG9eeJmAY3lGbmrBmcypzZxs8FD3lC0mXHJ4XS50iOe1/CRrSTkUDjOtF3iINb
         KEAfLGZ9o/HKfYPl81YEJXYvCk4AzuVQRH6GHNwYbRz3oj4RN74JdZWw3ltrmVpcAEop
         /ZoK7tVL8tJQm8M4YvIRAyNLyv8wB3JfWmcNIsH5V4r2XsVE4vy4ZTudo1jKbe8fMEfe
         yn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773834270; x=1774439070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mBU27RxE/tgVlcezl4VCqqbw3jruljluXdk9Ij5H0g=;
        b=M4bzi6b6/2zPxfVDkx5y9Pc44z+SFEukxdqCUFIv/IdPc8uua6YfTOVIJUEF086/jI
         4MTKZ2qllBPqkzR+QDxc/BAD5/G6saiZuU6JzqvRvBNXl3OJ1N0p/dKVwc4/y7KuzQJh
         hWBMYPexwUxjdV+sBxJkhBYsaIdIVZKM3knzvY9mPqdx5QaSVz91HCOmv5ze+xWUzU0t
         NtpBodpxy1Zxo4KREBc8sLoc5IYyI4RnPe61uBl7aHciffMEJB4+Z6CUTGNZV27Pr7fB
         iMA4A6wh27Mz6wwVT9vrWZwL1pQi+CHXTh0w5YlR3A04ccgdaPWTy14pbCy+6Mwrg4/S
         MVyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbOQ3KLV0qwFBKuspKM+xYLwiBuNoJV8HROIPK3e/MIY+cT+ZEPGnMe5Cfe7RVy3mLGc9s26QPe9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtZ2un9/nA8GLuLvNwwl2dx1Kn9c+k2nA1Xbz7qHR0AWsPWIDj
	JQjYgNtY6IocuMTx8UqFbCtRBUZO792TMZdMdGwyQGDrAf92doYwbGwWyt9AgtMWRruXICcQjOA
	J4ltNtDO6cP+JWANm+v49eRV4KsrFYn4SZo9GRns+B3UTSEOU8kWDPShWiL14apA=
X-Gm-Gg: ATEYQzyT/MgfwzD30Cyy6Z6CE0GgeZFbEDZ2IsspxUFYb+3Jn4kAfgwuT3tnYAMWHOS
	tjeEpHPA7jSjlWc9SWa9G+5yC8f62Dqk3j41oUea/PJHWxlHrfEm3GItLuJtiSeqj9BrRmS+9vm
	j/69H6pbI49kblAZBm30zl9E4EEwF84ECbN0rSHF1yWGH6oFsaYgCm4YDsy/usPAvUfvqebikEC
	VD/Ykznlzev2DcZourXrhwjlY2VYA89CA30kP3jIiq21oxzb2Vk+6XGIe0Dl2F5Y6ERkWwuVD4n
	W4Rdi12Ud3dKCDHNTSZYICguUOfLDGtZZr/qrd7Uc+v26qhWYHssCKljzdAeFJ8b+518fzTWe46
	L/te1N0jjzHGlppWvCkvUBk3W5EluQMdmWfgmSHDNOyN2m/IG2xfh4GG47eti9oT95uKAQR1Vrz
	sAr3o=
X-Received: by 2002:a05:622a:50d:b0:509:39b5:a97a with SMTP id d75a77b69052e-50b146476eamr28548341cf.0.1773834270532;
        Wed, 18 Mar 2026 04:44:30 -0700 (PDT)
X-Received: by 2002:a05:622a:50d:b0:509:39b5:a97a with SMTP id d75a77b69052e-50b146476eamr28548091cf.0.1773834270129;
        Wed, 18 Mar 2026 04:44:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f13e83c8sm187232666b.2.2026.03.18.04.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:44:29 -0700 (PDT)
Message-ID: <c0effabb-3daa-4752-9069-c49a562edc63@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:44:26 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: add IPQ5210 SoC and rdp504 board
 support
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
 <20260318-ipq5210_boot_to_shell-v2-5-a87e27c37070@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-ipq5210_boot_to_shell-v2-5-a87e27c37070@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6Aj1RNiP2DGU7QKGuU-4DRhQuCWCoQsD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5OSBTYWx0ZWRfX0oaukaiTHpbO
 MFh0UQp7iXyPHj1TLsplMY3PWwRzburMj4S8jnzR9ifddRFg+RGnrnP1OZT4QMZgxP1zCnFpFCP
 nMWbHsSu2KYNhhJi+SnHLQIQD0ZV9OkPV2fm+FRTFKsxpqygDgvCJFQ8I59mHjpfZ6ZEGb6gqhG
 uoTm8SqQ0uTfSSOjVDZ0U0BL39pxwbCGdwBr2DlZXg6MLpSQDwhjmS+2J3+hjp0+6XreKXTD6F0
 zodMAeQ8CIFgO65ODya3Ds1P2KjsZYV6aAC7yzDM3SCf6s8vhPPXtE5TY5JAgbT61XkEa4BuECV
 hsLv2SN4LtkgvF+zdSPR87OgU5fS9gxKwyp5IOQ6QsD0/zLX9MWfIfw+gH46QnKEnpniFTluIID
 FmaOBDftR0ECoJkpQO7Q46Zbk0iKm3hWMmO6GGEjghRLhkg2Yn0C4DJkX0YJ+gCOeLyEU13QSyt
 PV4jdqz+5VPj+JT7A3g==
X-Proofpoint-GUID: 6Aj1RNiP2DGU7QKGuU-4DRhQuCWCoQsD
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69ba901f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Fu2ZoqZfox1az8yWQm0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180099

On 3/18/26 9:39 AM, Kathiravan Thirumoorthy wrote:
> Add initial device tree support for the Qualcomm IPQ5210 SoC and
> rdp504 board.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

[...]

> +&sdhc {
> +	max-frequency = <192000000>;
> +	bus-width = <4>;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	pinctrl-0 = <&sdhc_default_state>;
> +	pinctrl-names = "default";
> +	status = "okay";

nit: Please keep a uniform \n before 'status', file-wide

[...]

> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2_0>;

Since we have PSCI, is there some sort of cpuidle?

[...]

> +		intc: interrupt-controller@b000000 {
> +			compatible = "qcom,msm-qgic2";
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			reg = <0x0 0xb000000 0x0 0x1000>,  /* GICD */
> +			      <0x0 0xb002000 0x0 0x1000>,  /* GICC */
> +			      <0x0 0xb001000 0x0 0x1000>,  /* GICH */
> +			      <0x0 0xb004000 0x0 0x1000>;  /* GICV */

let's drop these comments

[...]

> +		timer@b120000 {
> +			compatible = "arm,armv7-timer-mem";
> +			reg = <0x0 0xb120000 0x0 0x1000>;

Please pad the address part of reg with leading zeroes to 8 hex digits
(i.e. 0x0b120000 etc.)

otherwise I think lgtm

Konrad
