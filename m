Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49EA4E9C1A
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 09:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055136; cv=none; b=uEeZ4AXLeVWm1D54bGMxrz7kxebRAFjdmxZ8SfuOvka3X+R6Zc38MuEmaYNQsBXiYlf6OyvwsaW5jHMUhhOfuK/DsdVJHhOcg/53zdtpM+DDmyy40JurKzzTlKtY5r8L8/ZGmV8MfScyV0WznhbMoV5G+KUrTUhyM2Ua1/fWTdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055136; c=relaxed/simple;
	bh=OUqTwbkZvyiF4PoOq5Y73xoEFUcz7p6Iok5sZvcMJi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=axuJgWDIZLwL5thETgnvYJhGiwWfjUDbU5Dpb5/nXDSEYRXyT8k4ze+pI0TycNSyPB/ANMTiSVg8+5UpRoi2xVDx94C5Cz0caVmpsHJ5CfKJWV/Ns5KRdNpyNAJZP86ig6j7v4PqZLXlTgYDkrQDEDt7FbNqWjy8rjgpjsyneR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bYM7+4SU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WStVywSa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bYM7+4SU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WStVywSa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F8IbXm3468831
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 09:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6KhkIKXiGFzfMiy8Pf33B+AzaUwHeRu9kWddJRO8RNo=; b=bYM7+4SUef/10euO
	qfESKJxdw4GfDaurbPkcnInLrnnyUK7BSmh98VPX1069ENitHq/kMWsCK3klIoiI
	1Pgp/5/juUwpHaEE2+wzfBkinHkQrP4rEmmTztfL0WrEkuq+PEEJ33NQWytHg3tL
	TKu+4sfoZPvZ/ZzXxKhIXBQ0FC4sUf7CDe1ekeZMPjSlxraVuxn1aYevbVp0NubF
	h4rki04hVozj0bjigBOfwGX/IeFEO5dNcyVc0S0x6vMW7Bhzo9PS1JBdPPWc0hjA
	NKuXP3VOSqEgKLU3bFY6bPlgybiCSVQtHLn0y6p3tSknx8rwePuwFxb7UkzqWA6X
	2ovesQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7bdxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 09:05:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53391022d8fso11495901cf.3
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 02:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055133; x=1792659933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6KhkIKXiGFzfMiy8Pf33B+AzaUwHeRu9kWddJRO8RNo=;
        b=WStVywSa5SCbvNtV5kmAFAdBmR40DX/ULTE5wrL6FYceMCjgWntTJ5EbSTRJfnjCwd
         gMmixHdsuz5rGdW3kEjuzRRciNgT6ZcbD4GCPI4xkh9klzXz7tQlvv1qIBznx519H6nv
         mFCoS2bg+NUo6yULDZIZrOg8AnCiTZfwmsZL75/sKtx1EtWTvzGtzM0F5mEXPYWGQZ44
         NK1mrbx21et96sT2QNXPYqZ974zpFBgeJei/Sq7+zE3dE2a8qMIDZp7aZqTaF6l8LHxY
         lfyykYwwaZHQ7p7x1M6V+38f10FDYuWWlJyTQ6TDxLCdZmYLg/lHTlQST5t8Gz+iTt90
         AL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055133; x=1792659933;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6KhkIKXiGFzfMiy8Pf33B+AzaUwHeRu9kWddJRO8RNo=;
        b=CO1IidpHjcK9JbOxOe8ts6JecEg21dhNB+F5Nms9Q7beTthsomki5liRAY3O3m2dCC
         6UDN6xu3p3cmlLQchiovQ0FzKwywYNUbbYmGRyeiDECuwtKX4wz5eG06yMXzgLveMYaY
         rlMVNR8OGKhAOzKqRKNC/XgwqDSnr9Te5+HmW24bRKS8FVPKq8BmokeUYUNyej0zt9HU
         sGR4TioOnddxXHhC1a9bHnlKLNGQsjFADyAVtNTjxYDxLAVSe0Z0NfJO48WpLHcYi6gZ
         NztuVaIQbjvrcV5EtIbj7viKp9j9TyX+D35h42iImZ1AbDJYPQZpWSfb+70id4XlFeE0
         55Sg==
X-Forwarded-Encrypted: i=1; AKwUvBxo9gQ7D+gWvsFtb6sn/uJ4lcCzd4J8t3QAO8r+fKtO8LW26Dgy9s3ggvdKKT2Zg8V3GqnP7hhW8w0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvooHpfMksgzjQgoMTp6xsW3MlQ99+McVGw/jisZ9eX7frcOz+
	/Bsrj6Y4Vy/t59/ppruTMMOLmLlYj1A915bNySjHtpoBUtsjFinvr+6ofAQhKzaQgLeVWPRMQod
	JOKGO4fFL7UNp+M5iiEmDD/rkOEj0HBZWExB7iOcnzGJOXTMtGG0/mkeA2efnuJM=
X-Gm-Gg: AYBFou3GRGRbALwF/HJqZZ3esmKK/kCsfD+p8WSz3+gY/vgQPlNdJEAy9Zn2t6oGM3Y
	8DJnIRD5OwvL8fFFuUho4PJVWemYC6Mo+cHSJy71vCjd0ZarVU5kQpAzcUzUhXmb1wBa6xRGASb
	G7VsyYzl4xpQn1AX13QW5XLzOCTT1oF8Yi/ywTGLxXJ4GbO6PX1bGvnR8Vul5uXxSdDxDQTdyPR
	vkOkgjZHl/Q22lrTLAg+c0GwJ44UMkU2KtPqG7WsE2FexnYMrpUhiAJbeQjGBig0fSqD0xvhLha
	5oaZNLVFsQmFl6kw8WwEMpjDEGfNEikDoGuJ4pHQeha4wTY2J0OuxNdJricyCQFY1je4KxkFxCm
	pMoo6YN8tYrRNuiccHlBvCg==
X-Received: by 2002:ac8:7f53:0:b0:533:9739:f400 with SMTP id d75a77b69052e-5359fe05967mr342348341cf.5.1792055133137;
        Thu, 15 Oct 2026 02:05:33 -0700 (PDT)
X-Received: by 2002:ac8:7f53:0:b0:533:9739:f400 with SMTP id d75a77b69052e-5359fe05967mr342347921cf.5.1792055132437;
        Thu, 15 Oct 2026 02:05:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3f063cec41sm83079566b.16.2026.10.15.02.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:05:30 -0700 (PDT)
Message-ID: <31afc73d-590e-4b15-9e70-0f577e02f448@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:05:26 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: add device tree for SDM845-HDK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261015-sdm845-hdk-v4-0-b532b9f4029c@oss.qualcomm.com>
 <20261015-sdm845-hdk-v4-4-b532b9f4029c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-sdm845-hdk-v4-4-b532b9f4029c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad0975e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=oI7WG5CdvwguPHJV7y0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: wNih8BAIWPan_YRSRapxPyh7sG0imKH_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX9M9ZLk90CBUe
 OcLp/Y3D0xxPKFVAKOJPbW+Mv5Ojb8aW0SapPSjRiK9vzyX1qNi9r7gRb+NOFmtMGJeGlBK0ChR
 /UaEpY+TKA6WIHFELv6NOjPCcQMFRZAXmI7yzwxQcmE/LzqafWz21GEpeBPmWLp448BIE+qXI4B
 pX6VRbGmsiWW67k74fD8Co1pwPA1i2rgEyG5lhYU+JDJ6YdD3GzL2qmNYP+g2BqQx+G2hdtDJ+C
 lNSlaQD9XhtR7j8MscnBiGMsweSlbaWjiFroMVa4qazpA+EsER/9/riaOkesuHqCnlHVZbhpkCX
 Mo1ydL0W3WDCj33ejOGM1KQOYIOSrNSRK6Qzm8xptJiZgCYiepuM9S7F0idIAWvm1CJr4Z2xc0z
 9nrprx332DOzCGqWiJzuGS9FWhyBQIVMR9GVcdojIZ8h66YP7fqWYBudTDhcTrdINDNpFvUDvOf
 O94nllW3G6eWoDX8BWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX+q2nLzEWpe6d
 R9e//LGwI6dMEC+K+GHe85cfMPumLmhEtbBBbmrB6erGOFtASwKbXo3Z4qFBoVJ7M/+sYoSVjW1
 /+XiEUutzyLMIAhbEMb0q/JpurVe+p4=
X-Proofpoint-ORIG-GUID: wNih8BAIWPan_YRSRapxPyh7sG0imKH_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150036

On 10/15/26 10:39 AM, Dmitry Baryshkov wrote:
> Add device tree for the Qualcomm / Lantronix SDM845 HDK. It is the
> development platform using the modem-less (SDA845) SoC, optional onboard
> DSI panel and a rich set of connectors.

[...]

> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		autorepeat;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&home_pin_a>, <&vol_up_pin_a>;

property-n
property-names

please

[...]

> +&cluster_sleep_0 {
> +	/* default, 0x4100c244, kills the board */
> +	arm,psci-suspend-param = <0x41008244>;
> +};

Really?

[...]

> +&mdss_dsi0 {
> +	status = "okay";

status last, with a \n before it, please

[...]

> +&pmi8998_wled {
> +	status = "disabled";
> +};

Is there a problem with leaving it as-is?


[...]

> +&tlmm {
> +	gpio-reserved-ranges = <0 4>, /* SPI (eSE - embedded Secure Element) */
> +			       <81 4>; /* SPI (fingerprint reader) */
> +
> +	lt9611_irq_pin: lt9611-irq-state {
> +		pins = "gpio113";
> +		function = "gpio";
> +		bias-disable;
> +	};

Sort by pin #, please

[...]

> +&venus {
> +	status = "okay";

firmware-name, please

otherwise generally lg

Konrad
