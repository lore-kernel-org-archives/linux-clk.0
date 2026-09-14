Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083B33D9DC1
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 11:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384982; cv=none; b=Fdzh3Ym0CtV9++2q7lxvI8QA9OaANb8r4uKbcAb9EiKxRyJTUEH2Ay/lDlrrNOV6KifxbyVGnJINaT2PIwyvt7FBKQr/HHjy/geTFx1WnCmbk70ExISljXC/UyDv3TMDd/4gz9//s4ohBUfhXu3AK1Uj2ibdZWw8U3cjrjQMhUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384982; c=relaxed/simple;
	bh=qB15Tu0wQgvflvACMlEZFwV6PZUUfZT9UV5fY5oJj88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LxFqUAJiu/NTD4eQKFcvwA31xjps/hM7Zr0jpIBJGKm720Byp4Sn72p4Tv098dZPNSw8aCQFG/d5JfjCTCagF9qwkqa4FQ8Js1QW1/Z1uKsSNr59VRWLDn68Z9wbw8SajUvWsVjRUv3Qq5vyrTFLGN1v0eN0kuaTEk46Hz5+SXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V6eXEJqa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TY8Xbk1k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V6eXEJqa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TY8Xbk1k"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8MS530979
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 11:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	htoucfNJ1NBOznj2ucEtPoE5fys137bATrwbrwYNEEg=; b=V6eXEJqaW52sruVW
	KmAWqHedQKN92ge5YENWkiPjd+G4FUiYoi+rXuXHOXCHct/s2ruBO47fL403iyAH
	2SylfxfndayU9tuNs74mBf0Xj12d3kC5/2MhrMELYG8moOkZhHp5DR7YyqO0kNHs
	0Lw7qkc35AhQS+AgFCbu3IoOaFGpMQF7HP0nvezpOH9EjkcQG7/eI1EGSaOHqhHE
	tAFRbnOZo/0zdY6LMW69aKrcmdFxfdNVAuR98oQs9x/NZr3V+VuTPtOnn+xGBeb6
	5M5JFDIf2VvoFSBwfEjJixhhuEPdxOYVn7knVSt6iSa8pTvUSJQzCq5yrtQwVTO8
	3nO8Vw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hst6tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 11:22:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9106bb33cdfso7384266d6.2
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 04:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789384978; x=1789989778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=htoucfNJ1NBOznj2ucEtPoE5fys137bATrwbrwYNEEg=;
        b=TY8Xbk1k2YxpMzK/hLKk7URRPEjoLUwPSByfCcPtMKzYR4YH49rJsWXDYLRQlmKaKK
         X+ENG1DzvL5fLgYYq3GdL8Wwly+HGJhAveGLsEkJtE6v7AzLrHNjfeqhju7Dv0aTF8Hb
         OwK3nk5s5kMTo39eVvmD4RnW1iaGWL1CmGRAGrM6FNX1ffZKmP4xGihwoZkqGKAeJk1W
         yJMIlLGPL8K8wUQT/W5ez39I15/6K3kTWBaY5USnE5BmE5Qlom4OUMCEr+7SsFM7KPNh
         C6FeOLoA/Zw7gB4fFkp9Swjc8IO9zozRd2JwQRLvZOfL92GfFXENURAf2uYUTjZ81jC8
         egEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384978; x=1789989778;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=htoucfNJ1NBOznj2ucEtPoE5fys137bATrwbrwYNEEg=;
        b=ZSawdgxec8eSFH3iBS6Jvnv1xPUt4KD6el3kyn+ecu4BS3/2old4PIMOc76eF9cf3l
         WCEElhl34yN7XzImSPQuHAFvLEiMm+SEvlne783i+AnoDsiZzmHihos+ui1uEnDbE5Xx
         pWVguANzY5ZgMnDFlw88YtgbSNLgEjmUMaf37qzup4nzrPHpB5UajzPrdVZh8D0ms3mz
         6m0QmhVgjB6igom7uknOBIg7nXLfUAbojFGXK/JPcwl4FOfzz+ESEWBo4W+XD70fwV3n
         fGDJbwCFnm7pjfVH+K4dWGmL8wqCQSxWPzaE4qE7XlqGtUdTqJ2TKJenvX6JSONM+1V+
         NFbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyrXHGK2c0eGS8lo8nIsBawszJn8rbfQW8JfupI2WJBKxP0oDIPSob8M+RNg2hPERZ6PEQ64DWY+k=@vger.kernel.org
X-Gm-Message-State: AFuF++nSIA5HK7RyQOoAoyE+eqVErgnB5+BFYRXbnNTkTIvEdP1CEREy
	IvfYjFQ1LNdtpGXTg/3c95qU5Vk4y4/xcYMMBZjFoRhqRq/8D9UH7vs82je1Lq/LPlMEweeqptO
	+EKKct8LnGBDb20KloibJxD1g44rjLCJLwGePrMLaCTbmOI42WdtiHetZAagDfyU=
X-Gm-Gg: AYBFou1nTy6J52dd5g7p7fS29/Gwx+elNVW2qtKrnKqiw5JNKN/HBCxpXqIxQvKnKH0
	1DO/gWn6xPd/p1m6H4TNggZ+utrRcXVUodMnlkC5ootdBanBIaXu5tFmmAPw+iV2epzhMn8Ducs
	W+2PZjC1lUlRnVQL++hWpmz/XIJWNU7Qv0vQqKDAKDWHqs8XpdK7jEJrk8GS0kvVTztl9i8Cyn8
	YrBdP5DcZhNKduOUEheGrWkui0mdpoIJ3ykzz61hpdDum04jr7wTypgoiwfypzjKT7HmQnAg6pd
	QgUGGusrfkK/tPOoN098yHWu97ZAZvZFmEGUxFXoViWEUEDkTGucgUZaLS0HGNqHP3rXQQFaGG7
	eUtuQCmA6mDOeL+0YXAbEyA==
X-Received: by 2002:a05:6214:4883:b0:912:1f0f:b204 with SMTP id 6a1803df08f44-9122e4ccd58mr27340436d6.1.1789384978167;
        Mon, 14 Sep 2026 04:22:58 -0700 (PDT)
X-Received: by 2002:a05:6214:4883:b0:912:1f0f:b204 with SMTP id 6a1803df08f44-9122e4ccd58mr27339976d6.1.1789384977653;
        Mon, 14 Sep 2026 04:22:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b594f0fasm4216719a12.25.2026.09.14.04.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:22:56 -0700 (PDT)
Message-ID: <d0d7e3d0-15bf-4850-99ec-44d429c6bae1@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:22:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 20/20] arm64: dts: qcom: generalmobile-shamrock: new
 device
To: muzafferkadir@mainlining.org, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, Dang Huynh <danct12@riseup.net>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20260912-msm8952-initial-support-v1-0-0e742578b524@mainlining.org>
 <20260912-msm8952-initial-support-v1-20-0e742578b524@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912-msm8952-initial-support-v1-20-0e742578b524@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2MSBTYWx0ZWRfX3Ya1esf8/3BV
 uxDYbONu/wwmQ4cart86YxJYgzb8hY9SmT/QpaCndf2OdM3bvd0MmjXLRSD0XMd7Gh2gv4yfqJQ
 Lw4CnfJ91qFccpZzJBa/TR+L4QkHIp6Y75zJtQS9CewY/tA5J3o2pF860w4CMeYfM7+atNQseF9
 gJHSnk3tIESYxmOvpq6AojPuKye/kEWRWwTjBf6XNBotliEYD2dQdAqGBtlW8kNtUq1qpfgGO9b
 3+Xa+mJsuhfaoGTUumd+MadUpKaiUOFRAi1KkFF1krIuRKjlVsmATO4pyoju4KwQUxLlUiQtPcd
 /SiGuCdi9Frh4jTnFt64BL06T4m8GemmD3yYhhGbMiI9zhw8rV7EKYlBcY4mMpTsDEBQle6d4b2
 HTw6k3Uv2B7EWFCdTFlKhi2UeaqJ4OBpo/qEBsFUXKcAOjtPYZb0ZJcv8P9sk4P4W2lRQlguy2O
 MKyqT2/qAgEmpojhokw==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7d912 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=OuZLqq7tAAAA:8 a=orgwjQpZXFS75ENpSOkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: C0pfPFh7DbTFfy9AWIHaCU4YumL7rKTr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2MSBTYWx0ZWRfX9v1oh9I5WIaR
 Fa6Qdv/w974WQBujfWqiDUzNxvJrZTCYsyELHg1sibB3/BaxYRxWvLlvGzu6a5G9QaAoqwFnE12
 fcf8Yuo9xW387bVBMirRH7Jt0UU89d8=
X-Proofpoint-ORIG-GUID: C0pfPFh7DbTFfy9AWIHaCU4YumL7rKTr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140161

On 9/12/26 10:39 AM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add General Mobile Shamrock (GM 5 Plus).
> Shamrock is designed similar to L9300.
> Downstream reference is [1].

Please feel free to
wrap your messages at 72
characters, otherwise they are
a bit hard to read! :D

[...]


> +/ {
> +	model = "General Mobile GM 5 Plus (shamrock)";

It's not any "policy", but other DTs tend to only put the "pretty
name" here, without the codename


[...]

> +		framebuffer {
> +			compatible = "simple-framebuffer";
> +			memory-region = <&cont_splash_mem>;
> +
> +			width = <1080>;
> +			height = <1920>;
> +			stride = <(1080 * 3)>;
> +			format = "r8g8b8";
> +
> +			power-domains = <&gcc MDSS_GDSC>;
> +
> +			clocks = <&gcc GCC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_MDSS_AXI_CLK>,
> +					 <&gcc GCC_MDSS_VSYNC_CLK>,
> +					 <&gcc GCC_MDSS_MDP_CLK>,
> +					 <&gcc GCC_MDSS_BYTE0_CLK>,
> +					 <&gcc GCC_MDSS_PCLK0_CLK>,
> +					 <&gcc GCC_MDSS_ESC0_CLK>;

Please align the '<'s, make sure your tab width is set to 8

[...]

> +	multi-led {
> +		compatible = "leds-group-multicolor";
> +		color = <LED_COLOR_ID_RGB>;
> +		function = LED_FUNCTION_INDICATOR;
> +		leds = <&red_status>, <&green_status>, <&blue_status>;
> +	};
> +
> +};

Stray \n above

[...]

> +&ramoops_mem {
> +	status = "okay";
> +};
> +
> +&adsp {
> +	status = "okay";
> +};
> +
> +&lpass_mem {
> +	status = "okay";
> +};

Please sort the label references alphabetically

> +
> +&pm8950_spmi_regulators {
> +	// PM8950 S5 + S6 = VDD_APC supply

Let's use /* C-style comments */

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <20 4>; // Downstream doesn't use 21,22,23. 24 is mdss_te

Let's keep a \n between the last property and the following subnode

[...]

> +	tpa6130a2_default: tpa6130a2-default-state {
> +		pins = "gpio61";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-down;
> +		output-low;

Drop this property, the driver will take care of it 

Konrad
