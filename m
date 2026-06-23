Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D2230D3EC
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 16:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231164; cv=none; b=QgRc6PwgjKdcritwWBJhtayQjJbZcUOr+ij+e+EYvHeutuUFTQb91Du0s+CDx7nyD//eSh1hUicl9lYMLBe2GVxTBNJF+GAZbmGlK3ReVaOf4mBA0YQBubi6LyyWXt4mGdeKid88SE7kbT62PWRq8Npwy2m0d1aS22Hxr8M8Rwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231164; c=relaxed/simple;
	bh=OvrE28mQ6d3na6t/REXqRcrQw9Eosy5qUj9IpwYNXaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jQFlsJRkVri898qF1Lz4SKygzDQ3+Plxn6Edv4iSf5rp+TR1B4Tj+0i9ozv7DWt2HssH1Usa1DhgeZnUSQoyVWX/xVL0lyW7MGADgRdIL9MO960jTurs4wmqHKtVlqe226biQPs2MTtBUSN5vGqjjRP2WVqvgca+zLy4OCRFkgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bFQ4y553; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XuhpWTJf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bFQ4y553";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XuhpWTJf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBY17M3669185
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 16:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gecbAwohjaARZqbQURawjMipEUQQYR6zuTbVqRvKAx4=; b=bFQ4y5536/69ZTPx
	L3Gtbmpw5WEptlcAB12nFyl6e0zl799tikAc6eUQEQcSvBoQxKtPkx3rrlSuX+GK
	Qk4IbylRxw+1qiZ1moT/WcHRJ0+XkYI595grwZXjb+gkDohmSOaxlcyAywheMuE8
	h2fsr+6oqA7HdiuPwbb2qkim2GtDhJDItLSn5dp4gCFGmV9DCf6A1UaHnfSz84+I
	CV6sO2c8ud+HU7BfkQRQjb0V2DmZIXDYFP1gWro03MxVnbLiU0Tx1fxV7XHUpmqo
	Rk9yx3WXWEDE3GWkj+XmprB9CmesyUseh+5DVgx7Rdlmz2s/RLppaxii/l3xYlO3
	qVCuVg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppyhxvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 16:12:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8454912a507so116079b3a.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 09:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782231161; x=1782835961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gecbAwohjaARZqbQURawjMipEUQQYR6zuTbVqRvKAx4=;
        b=XuhpWTJfsHCUBPpSwAL20ojik4/jrP2CuKzBCiEjdyomdhOIFvF5lN8J9U5pB0IB/V
         02AJWZQDZ4pm+mbmCqoYivRGzJu2WBGjmhZbPa5me6MQtHNRFw3L0dwsgkXsIrnmYeER
         HVHJ2sGeFI5VSJf9V70MdCK6zuhOJBMA+1n7UrjsptXdtgu6JDqv6lWLzSbU8fTI36fM
         t+MdWI/wLSPiBCLa01uL+8MHNwT376cecYfnRDpYejNlpo05jii5VJI8phc8Xj15ldJ9
         nqY3LJpgnGdeBEw7DQCdEQlE5+piw0x/7p2OIra0XxreDST4IH5fkFUDb+HJSsSFDb0E
         8aGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782231161; x=1782835961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gecbAwohjaARZqbQURawjMipEUQQYR6zuTbVqRvKAx4=;
        b=HiPz1AoQoWOhhIc7tWoIb925QF9ZlNkl+EnGCnmddhxIJjGw6Cx6hdpLP7S4b7egfY
         hip1HeKdydHE+V3qH4EgTwsmkB88vOkJ70sd//Mzs/YRKPl/i53nFisXIO6MPuSaSxnu
         xxzz4eFE/N3zDR0z0pAVMZFqgBDmtvzamX+mxVBAP3CHwz3DqpXyzQRyRD9kB+yG9325
         UL3nyLGyR8hsazpyEmTfhp2r80attX1Tdt2t+RheIlCAsNZRFUbQX/pl6y7rWpwJso5b
         56Nb2B0QW0stOgJLctOr4JZ0VOUQaXdJxeeyCx/rn4jgIHlF5JC+fKaznSCPrHIPsPbA
         vduA==
X-Forwarded-Encrypted: i=1; AFNElJ8MGW1v88OVxfSAZViuoYbEvyQuGPOQckafIjMnc98iOgeM2XGLbTl2Aj8cz/Me2+sVLs7hQ225dxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxtUK8v/stkmmlMKSeZzrznf0qF8x6crITYVSWyCl/l6211NtE
	XZgdvqsc0i0FT7/H1pX0xmHZgEsmROO89wnQgeJ8ufH6b7BKxkdnnT8NsSIvC5VRfK182/Vaw2L
	nAkRMzN5XYjL9gDn5XE7rSD/0Ugdbg0X0iuAYLC2vDwi6UvcHqg7UNUErauLb08E=
X-Gm-Gg: AfdE7cnENJtJ0TUP+ClexeRiDi+bRMG7RYdYunZVu44mqwaUFN15Oa1F34/TVfbO1vD
	AQHLUE8YIOvjjZfEls2jbNb0SxNhjaf/c0W0cNvtkV5iGFuTqbJfht9aGww3vygX9f025e346WM
	WS/Pf+hySd4PPmb+7pXm/bl1StWQA04gk2ML/2vt2YYtBRvZxcBsH7qUOrrpi8q2jT450oOZHiF
	ElI/wxtKfQvUhqqtrj/yQLAh2RXi/9w9drYX7zso+B6pHbZx3goEBTKQEtxK4pK6jBKaHrNIIbJ
	uYEBBKp0nLdkgVHZvbqVWBgOLUDdsRou6i38CDlIyyCdOOcY/BkgAA9SRqlCcOeqcfZeA0SGEWY
	awyk8wMEwv1KULrpXhQsuTpNs+4+0Pdz5Gp3q5Q==
X-Received: by 2002:a05:6a00:b50:b0:82f:5034:77a4 with SMTP id d2e1a72fcca58-8455087bf08mr22324877b3a.21.1782231161255;
        Tue, 23 Jun 2026 09:12:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:b50:b0:82f:5034:77a4 with SMTP id d2e1a72fcca58-8455087bf08mr22324846b3a.21.1782231160830;
        Tue, 23 Jun 2026 09:12:40 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.30.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74727sm11049918b3a.39.2026.06.23.09.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:12:40 -0700 (PDT)
Message-ID: <816035fa-229c-4469-845e-758373afca52@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 21:42:35 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: dispcc-eliza: Fix disp_cc_mdss_mdp_clk_src RCG
 stall on Eliza EVK
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623115644.392477-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260623115644.392477-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMiBTYWx0ZWRfX3iHxpP5Hjqf7
 4HmVrPIniZqRMrkNzzs9ve0idNe8rmL4C8LkY76cTJNc16H/u5U8+8N+ShitqDVsglOkvRgrQIa
 kAy+c/LbUOGAQGnbI904SG79RFmHFxr6yLOLpqwcuWvr0iGETO8CDXQYuOJla2LaAO3cRv1xMDa
 Xg9hkhEIDCWTakoOip5dpfuhEn7mYWssT46706R+xC534oQBwukYdD7Jg1KFV+SQWj039U1Fg7r
 6A3oX0SwMFiBPJzDTM0xwUr8tNVR0ANfIT4dWxxdDZL+ClG2QKjAXuCLOyFL/aFxyNNPTkcrFU8
 kYOaCoZ7T5/nrdaJMYvhdeAQ/8Q/obhg5zv1WKoZUNSWa8q1UpPy28u6iRm6VRrsXw2pYZFQ/8a
 PRj+7ZOB/GAqMnjI7VSp8YVwk4FniA==
X-Proofpoint-GUID: hUBZRc88m4ryHQ-6mKjrTl5BdEp5XS8E
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3ab07a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=q18lXC+Bm01JYF5cPAQq0g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=fFR38OxDykJNwau6z64A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMiBTYWx0ZWRfX6BssVI77PGl4
 uYML8Aidf9uWAxDaasgp1hJH4JuHRuBiplSIMyLLwLwJEwO69ggfUh+x1sWi7/GBLhq5lyYmDS9
 8fpadlWxlLMh4KMioWKbbaNfZTn6hyk=
X-Proofpoint-ORIG-GUID: hUBZRc88m4ryHQ-6mKjrTl5BdEp5XS8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230132



On 6/23/2026 5:26 PM, Krzysztof Kozlowski wrote:
> ---
>  drivers/clk/qcom/dispcc-eliza.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-eliza.c b/drivers/clk/qcom/dispcc-eliza.c
> index 479f26e0dde2..e31c24125274 100644
> --- a/drivers/clk/qcom/dispcc-eliza.c
> +++ b/drivers/clk/qcom/dispcc-eliza.c
> @@ -757,7 +757,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
>  		.parent_data = disp_cc_parent_data_11,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_11),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_no_init_park_ops,
>  	},
>  };

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
-- 
Thanks,
Taniya Das

