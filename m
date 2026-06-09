Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D4731197C
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 12:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009879; cv=none; b=Bbihn328VHDiHZg9QoUX8lH4tgO10TCJKEx6PjIFxuBsZEwPejguL0R1ACjb/ESPZONcdFjnBVjTDqSvQynJXqqVZO+rmer25Tbg45/WPvgruRMizwFtl7zzySGljkeGo23qc+DGi6Z9c2Lo+C0/+1HFduLkQ5cGCP401xpcdbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009879; c=relaxed/simple;
	bh=VeKcdjbjG9neMz/DzvyzOu0eKpXEomcIjl9R1GRbPbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PFxN4daI9VaI5JDl6dI2QAurtNiw/4YeJdM2+aRbTLDeGgQ8Us9AJbh0Vg302BLWVxklrPPJ0bLJlgAdmfF9b3mDUpJ6WpCKhOXEw9itO/dUjMzaiLdAOKGurL/IG9DMkDFJQ7KQFlhZcyrPr0/bgHbD3b11u97JATqu8ZD0A6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zim+083o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ygl5G+6i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zim+083o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ygl5G+6i"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClQuX2286783
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 12:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jGOsl3o1y58ZtNWsmGTcSIVSD26o9VXU5DHOJ3gam3A=; b=Zim+083orGh6vg/E
	dJbkU/d7rmClKcr8pxP2VksKpwGbPXv32HFrfdW3FOwNSGwMx2zV5sb8dmc8pX1D
	JBX2fcv3vSO9MdLGkjlFtOAfMKj6hbDS7RpOhyQAYJbq9Gt6PN9NMfOwOuCjtmQQ
	P0UbGWKbpAzvcK3gW8ipBJPp2+1bToDIJbJow64tJv5AUhgBultRxqg/x2NRDBXQ
	qKPeoqyjhC2s6aovT3oplxe7RpXnvxJR8Zl903egBlaaEH+lFfs+ChDaGhytZEmc
	x5pdWZneAUHpIgYMgg0I8Z7jDoO30ove3G1du3Bl565URYL9WGvvysiQv7cgTVvs
	7Cr8zA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jrw32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 12:57:57 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c5a5133221so196601137.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 05:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781009877; x=1781614677; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGOsl3o1y58ZtNWsmGTcSIVSD26o9VXU5DHOJ3gam3A=;
        b=Ygl5G+6iTfUw8BLZzlIwXNOK/Fah9iHbPXplHYkfYxPG/AJDqib3TymO5L3mYqylcE
         lbawX4E9F9OqiyJUx1Ol/Q9PDLzRgJNIe4ZpMAO6vLEhnZUWDOf+EA4JtGQ7BuS/KKpo
         IS31avH/eHrlEV82hUE/Sw/VtS93xhiLAeUXCjzqgWzFV06u3v76kmX1m2oMH9bkv5ZO
         ZsO7TIOgZk0iSjgODWXEHMplv4G67tljyvUs+nHxczfKZrWfL02LLW4D/CHLl+Mz/cQ3
         nzk4ZzojkINt+ZcinsZR3U1BxBZVbY6ArBy/GQ3wm+H2Bq+CUOIHIYDJHCfYpjNuUiQc
         EvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009877; x=1781614677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGOsl3o1y58ZtNWsmGTcSIVSD26o9VXU5DHOJ3gam3A=;
        b=hh17ChIN84kaFriHaKL9dIbuvDxT86h7abaY1Jt1A9qYGETinezIIGEBVeEv/P1KxI
         MKHqj5/Yw7+4xVWVhh/cauepEqKJRsvwHltNVTP9VuGk0WCmUMGi0457uYLz/v92WRDe
         ej66mO6y0XZCmk65DfrrhusryesINI16E6kRKoNZrylVpvd4TK/hrdOrZ1xxWHFkVurn
         z2JBMukJ95Ymc3zyx98gAIlYKgvuUMNT/fpUXmIPflWU7ihccp3guKpdEKQJviFC1HeU
         /+WxpNMyIUxI+49zQk8PvxY3uudCXc0J3QvnxsO3lu8LWFFgh6XRkGmkQTm07yHEuoRD
         w8ww==
X-Forwarded-Encrypted: i=1; AFNElJ8lGA4PsnYdNaVlOF4xNuS2Dh0QDK9+3BAS5ayjozcj5e+p47bK7joSe8XEuPym/EZ8icTSMFPs2B4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJageYjsSZRUvbmYWY8W1J3yA+ToufSQTwjGxZjq/nL58ykcXW
	XE5UtexrrvrAtvcmo2cxCzGacU86saMHPV91LpGAoRBJLkV+Nj2ucGRbxeALvZxvXKhEig7hrF/
	9ljFlu31x/JYr9K899QaYgkwZIm1bKKUmfP6+ZtaxpVO0eNI9uf4pDG0flcYDbPA=
X-Gm-Gg: Acq92OHn6HqofmufZq5swY2IvQKid9oz+v5URpBLKIH1pMVNhUcjYvTAdwA7y80tnXi
	L5eEMbg70xzi/jeAXy03eG3ch2zB2ANJaC4AnMwIhWNUQGbxO/iuakNOxv3GxOJWTQ1ZSlPX4EC
	sioy4BCcMF0QVWd/M39xgXy75ECl50sBfxJ33yO6wJEFS9JK4zbXfuOBhwJqP6tbgMriaEKmyQo
	hIe0wIZXmwbXSHzYqjVPD9NHZJuO/49iSwGsjbP2UNgmbUxaWSAmbjYPPx1eKrm6EB1WVgeSJH9
	CTQ90lGPFsgl9Jp+l4sYSi8JJ75JImuajP1YSOfqo9kOMVVKyMTgbFN05zEjdlQ/EvIvyU1PzYo
	HUpw0yYc94Z+Il6fS8e6KmPpKraQRLv1ee/pdiqEOGb0959ogZT8PfAjI
X-Received: by 2002:a05:6102:4494:b0:65a:fe89:c8e7 with SMTP id ada2fe7eead31-719254ae70fmr316660137.4.1781009876848;
        Tue, 09 Jun 2026 05:57:56 -0700 (PDT)
X-Received: by 2002:a05:6102:4494:b0:65a:fe89:c8e7 with SMTP id ada2fe7eead31-719254ae70fmr316651137.4.1781009876459;
        Tue, 09 Jun 2026 05:57:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99ca90sm4648052e87.84.2026.06.09.05.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:57:55 -0700 (PDT)
Message-ID: <b0479824-0c6d-498d-bdc8-63f678a6f2ee@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:57:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AXw5UPNScOMUAEcK0I-M2wnh3Vrw01c8
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a280dd5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZOZ9JJu0O6LkbGEWVdAA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyMSBTYWx0ZWRfX3Ax2JeLDjPSC
 TrxuX8KRN7CUP6qPaSrVpilqKKQQGNFlc/u6adSXMWkjQyeF+N6Slce8R27BYW8Mvva+ztu7ePd
 ZhSz7fdzumwPmPNkoldeAKo/grk20bxqRNfWMnK7wc3EoSSCxW/EAbsGlIJ8U/jRmlp0aK84lAJ
 aSn61B/32eGUx9wqRnYU3pxd0mVSOZ9J5kV08tO/z2hDwhdjw8cV9fOIfRHX6HhrRXBV3JP/Muu
 QpzrjxiHywakBmCOGalq3JQAFJaA5gq6UqfvMVeo/uUZlbPwPijcpeGRDh+aE0IuBfCRgGfGx1i
 bhuIYItD66NESloWznDX9FeUF57+TpPNolTilV8WaBK5Vgw8xrLSw3vTGXdacacMBNF7l6tMae/
 q24joCVh/ckhOgzcp5uNSPfKPG7ulnocZX08F9sFOgGfpdAd6Vts2zkLtsW/Ih5qbUdFY6Gd+NK
 FZWq0XOEul1tQA1Jccw==
X-Proofpoint-ORIG-GUID: AXw5UPNScOMUAEcK0I-M2wnh3Vrw01c8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090121

On 5/28/26 4:29 AM, Qiang Yu wrote:
> Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> register controls whether refclk is gated through to the PHY side.
> 
> These clkref controls are different from typical GCC branch clocks:
> - only a single enable bit is present, without branch-style config bits
> - regulators must be voted before enable and unvoted after disable
> 
> Model this as a dedicated clk_ref clock type with custom clk_ops instead
> of reusing struct clk_branch semantics.
> 
> Also provide a common registration/probe API so the same clkref model
> can be reused regardless of where clkref_en registers are placed, e.g.
> TCSR on glymur and TLMM on SM8750.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

[...]

> +static int qcom_clk_ref_enable(struct clk_hw *hw)
> +{
> +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> +	int ret;
> +
> +	ret = regmap_update_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK,
> +				 QCOM_CLK_REF_EN_MASK);

regmap_set_bits()

> +	if (ret)
> +		return ret;
> +
> +	udelay(10);
> +
> +	return 0;
> +}
> +
> +static void qcom_clk_ref_disable(struct clk_hw *hw)
> +{
> +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> +
> +	regmap_update_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK, 0);

regmap_clear_bits()

[...]

> +static int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
> +				 struct qcom_clk_ref *clk_refs,
> +				 const struct qcom_clk_ref_desc *descs,
> +				 size_t num_clk_refs)
> +{
> +	const struct qcom_clk_ref_desc *desc;
> +	struct qcom_clk_ref *clk_ref;
> +	size_t clk_idx;
> +	unsigned int i;
> +	int ret;
> +
> +	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
> +		clk_ref = &clk_refs[clk_idx];
> +		desc = &descs[clk_idx];
> +
> +		if (!desc->name)
> +			continue;

// this allows "holes" in dt-bindings for $reasons
if (!desc)
	continue;

// this makes sure the programmer did not omit something important
// while not taking the entire system down
if (WARN_ON(!desc->name)
	continue;


Konrad
