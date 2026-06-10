Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8112C339847
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 17:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781112703; cv=none; b=kypSzkfHIgy2s80a2gMN8T9lX63oTG9Vem2n8zMwzIy9UVlWESphPtKqGNE1bLlLrmc6sdbUGSSEa+JfUrW1HBIJRR86x+t6C/T2XEntMqQBD46bO3gq/ewJeNXJ77mQUXwha+ITEasSKUSz/5qg5EWbDun1aVexOZUx27QveM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781112703; c=relaxed/simple;
	bh=zoAVZM9lw9OZBoKsWFzZss54eAd7kTsWGiBNL3Nahj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tNddhO+nSdGnieABTOPJl+/iDc2R+5vyLMB21jPa8UGH1jWXX0nk8ZQChx7/CJPdVy3up9sfkSkAp0YH72Z1wLjbWM21Oq7F+94aNxL/XEFpyCLYYu8jqMX3J/eTMFCuvHVLNKvAI+RjA1bCR+z2SgI8X9eezMOkxILFRikZnwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PmNX02+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZy39txV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PmNX02+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZy39txV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AFxLu21670974
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 17:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wuaZqI72kcvOWTcAMRw9YZ+vyHkrkFtJRQmO3nBSIeo=; b=PmNX02+QZ3r7rAax
	caZqRDHPJ75DNM5P7Xfqj64k0255t1UZI+rT5xQiwqtqLA+Ov0FRQQlD1GxDNKz5
	cVstyCu1BPXXaT7GA7FsCl4qz+JNpMfqd8mals8xWBwsBc6Hkn8tfBmqreLFsiDq
	pr190h78ksV7bCrnw0rvdBiHu9ZLV0wZR+xiADTSeTV2Rii2+VAimb6sF6VHmfcY
	dYy8ppOkNNLCMgeoIxuSMcHgaNHtk0+g/fK4C73bcuqFcM3dRDGxKpET1THMcQ40
	nMkPKX6yCt+Tect8Jj5NPTthphA0Eg0GIJ3gghfall2iqU4P9HUyLzCYob3iRmlN
	SKInxQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1u57d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 17:31:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8425a9979e1so4823622b3a.2
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 10:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781112701; x=1781717501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wuaZqI72kcvOWTcAMRw9YZ+vyHkrkFtJRQmO3nBSIeo=;
        b=GZy39txV5stzo/cZuxK285ZoyKfx5wnY7mu96K6wlziRZakgEfAmizo1qdnVbPtMSu
         keP79NAZ3BDA7uH41TVki9W3y50zWsP93iLAFpjkpsQ4mgLm8K2ocM6B217E1xe7yHuI
         vB731KfobtJ3mPPBNXV8zvjzeQWHUL40c8DsmibjiTWVZ2E4kpvYfJFuRpRnSMA6cJ/A
         IgY2iYipuktnfS7jSKQzcSRNDuWBr9l5xnRJtwaBCbpXnFByoFCJcnt78lwUp/aoZbGt
         c6h6nCdsAbKAJyFKUtR3+Y5m+fVLTRvD79jrqJ2HHyg1vkbBNgO2AudsfYxnwhZwcpiL
         iKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781112701; x=1781717501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wuaZqI72kcvOWTcAMRw9YZ+vyHkrkFtJRQmO3nBSIeo=;
        b=ZYftWUroFtMTP4GMeA5fWycpQ6glV6rrRUW/ng1bQvBXTf7IipJ/IdPl2SvmuMS9bL
         kCJa3GPjFqI8EVODWsIC38KbyfTwpNPQmIj34OJZsAuGTe0OIqcAh8daisWuZVlp1QPM
         tURVbw59wonRCppLwzGjDUsUDsun1a2Dy8TAf9X9PbOZJyRBtAYNsmKLMqI3MvJ5yBrU
         kr+lQ2bhxV3H2d0x4vX97w94bgnJXdka68crrp5OPGot/rreF4rK0zKpm/sgJG1JYYvH
         9XJE7ssIj/nBFErQLNOEFGcEK6JsORbx/aYnreceZLrivQ1jVgRw0W0zX+aI4WcYkm4+
         y/gg==
X-Forwarded-Encrypted: i=1; AFNElJ8mSKnup5jcjf66eUEZNeIDgIgEDB2XWNKwVenPvo2VOboSm9wQBZXe92R0giHk0fzlVxb+m3tV2+g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7tPcJzE5i2nddPPGIn+qkrHSR4Cq5BL6/mEPEnho7iDtIj3Gb
	VoIdSwu78UeIise8HQOR+IQQkjqEfm/EXldc843uQnd2y6RhLt667X255j0dVEg4kqoWBSOscLd
	JeDiSQ2Sqg2dPWY5Rvu8MB5mFzNSc2ONbDiA206uV/DOQww2uLlp1tLUBoi55Q2A=
X-Gm-Gg: Acq92OEjI7cA9zlszXTXYxLjxqaKLz+a2zV2EHTDperZs07UyoWomEPh/BwADiDQgo+
	LJqdz2XSkOI2UNA9kxfziyaYPuikWu1JdTJscPS2gRcWyD1xEnsdVx4CPq0TRCuAqXxHfHoWRg6
	hoJX95qvUh4QfbIufR0x+Ix24RfuS2hwsRzudsXCv6iH5ZChsv4EqceCVLbKGDc5mB9BasV/JYq
	aDKoRdDkQEVdZUeQMealsQaX8BoYYTOimoxaRl+LHJ/468tprPSdS2TCXjnkOu+4WsHZOy5Nsxe
	U801rlR0eaRttrC3n0EKCAj0w1pdYIc4BFGDvEhL5ehSTpdwsGoQfgtkkb1Q0U0R4zzxmKk7px6
	uDam5vqqT/nCRU3XJufd8QGTYpWbBx3TI05NXML8Nasz53KvD70oeKYknRdeY
X-Received: by 2002:a05:6a00:391d:b0:842:2f09:fde9 with SMTP id d2e1a72fcca58-8430a62fa44mr9456290b3a.8.1781112701205;
        Wed, 10 Jun 2026 10:31:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:391d:b0:842:2f09:fde9 with SMTP id d2e1a72fcca58-8430a62fa44mr9456240b3a.8.1781112700712;
        Wed, 10 Jun 2026 10:31:40 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.30.116])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221a7e9sm32993890b3a.11.2026.06.10.10.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 10:31:40 -0700 (PDT)
Message-ID: <ad9a18e0-c2a5-4a6e-a9f3-677e923b495f@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 23:01:34 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] clk: qcom: gcc-mdm9607: Drop redundant register
 update during probe
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-12-5e9717faf842@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-12-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE2NSBTYWx0ZWRfX8s4lx82k6KKK
 mBVp7H1CY9ufuN+4FZ3N2WRMlm806roy8ZxPPHQlCK29gi0xaH+VH4nZJTqVdFo9jAlV0fop2VB
 eOp54WabkuPlTFS6F5dsnjatIXubc92jBypjH6+VudmDpBhk6upQIKtO9T3JdPyJ0tUnPQzLfmR
 olLqiPDdJHKrKQTdIPhLt5ptkhtd0QLFcB4AZDdMCs56TEoY4fB7pqpK6pHs5iwnKoogEUmIZJU
 7JkpMJWp24Kv2lF5ZstXN6uySIRcN+4vrwAMIokOQcavxKugW7waSuKBjP2lBepypz159hOkxcA
 RtVDszE7Fd2/ZySp7XAbdJbtnzy5gEbS6e4+Pj7dkL/iJYT00TNU/QL+5b9f8YnwhPtz1zWmYCo
 dewWK/MGaA6sINE3BbapgZ71Kg4ALIhRMpxMi18wyorK7XaTSkzOPfw62AaeYZkiEsF9G8yzFhp
 oebJtp7ruk74l5uJ94A==
X-Proofpoint-GUID: Nou4WBFNGwi1NW5KaG9KbRUBDwcEZcn6
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a299f7d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=wot0Jldcyx0dIQi3j0aq2Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=j8Cu_9a8AAAA:8 a=naHRbAbjXZXVQ0aMeuoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=A2jcf3dkIZPIRbEE90CI:22
X-Proofpoint-ORIG-GUID: Nou4WBFNGwi1NW5KaG9KbRUBDwcEZcn6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100165



On 6/9/2026 7:44 PM, Stephan Gerhold wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> GPLL0 is pretty much guaranteed to be already on (and voted) during boot,
> since it's used by the CPU and also various other components such as UART.
> We also vote for this bit in the actual GPLL0 definition, which will be set
> as soon as any driver in the kernel requires using the GPLL0 clock.
> 
> All in all, this makes separately voting for GPLL0 during probe redundant,
> especially because the "acpuclock" in the comment is a downstream construct
> that does not exist in upstream.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  drivers/clk/qcom/gcc-mdm9607.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
> index 0bd4c12483cd..ce78ebc8ffec 100644
> --- a/drivers/clk/qcom/gcc-mdm9607.c
> +++ b/drivers/clk/qcom/gcc-mdm9607.c
> @@ -1565,16 +1565,7 @@ MODULE_DEVICE_TABLE(of, gcc_mdm9607_match_table);
>  
>  static int gcc_mdm9607_probe(struct platform_device *pdev)
>  {
> -	struct regmap *regmap;
> -
> -	regmap = qcom_cc_map(pdev, &gcc_mdm9607_desc);
> -	if (IS_ERR(regmap))
> -		return PTR_ERR(regmap);
> -
> -	/* Vote for GPLL0 to turn on. Needed by acpuclock. */
> -	regmap_update_bits(regmap, 0x45000, BIT(0), BIT(0));

This was to ensure that the (APCS_GPLL_ENA_VOTE) vote indeed has a vote
from CPU. AFAIR, the boot up was not using this particular PLL vote
register and no piggy backing for the GPLL vote.

> -
> -	return qcom_cc_really_probe(&pdev->dev, &gcc_mdm9607_desc, regmap);
> +	return qcom_cc_probe(pdev, &gcc_mdm9607_desc);
>  }
>  
>  static struct platform_driver gcc_mdm9607_driver = {
> 

-- 
Thanks,
Taniya Das

