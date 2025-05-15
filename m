Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E87020C026
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323530; cv=none; b=GMCK720wzWR/89FppSfkLZmYG3B7m5Rnqwpl+uoVvAqBy2ppnXDVQYffoz7+mibqdrV0gVG5vh5OIOFgSU8IqAFdvDWfRkyRhvQuhK8i9UJ572/LNkefZyWfKMGdCW16iAYfJWlND7TXm1FsuOWZuMBJ/xuo+eZHweusTFAU4jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323530; c=relaxed/simple;
	bh=YhjkVdXvtRWQPDDaVu+qCIt2CPoR+SqpafwJoDvxh2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=caVqXqk0+KH6EESw8XKUpX8CK5qHoe4c2xrjVXotG0J15WOYVlm//2/6ZqN2LBddk8Phi8ieKueykg+b1Ozw9rFsKxrc89Ltn/bNhK4+xHoqrxQYrk7t66AVGuA59aUSMOrmy13NRgjmTCccg0nn7vNk4bCmpsPELvjFgE1n0OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E99OL5Kk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E99OL5Kk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFrJi027175
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3pdbEuEDP4tcdmm5ZtqXD3QPjEEiKtDhYgXWKQaq6K4=; b=E99OL5KkvoXjEGVA
	dQVWygwR+q35M6qlbHilW5smNXW7p04WezGoOETsCn2zMLv7f80AK2uiUIydRNdo
	E46/DCW1LYSBpX1WH3EOcBTYoFjyiovgv8Sl19I8PQEwf20Zk9GRPYXzWxzsI3Zz
	6pehrAv9RdORg5Y/bHGRi6LlVUSIkdOsF1Z3TCpUJq3LGgUz1BGlSV3NmyOtsJOw
	YCi9B7NB+k0gvJuvXQ6v/qwiPwcDVNTVhYEUOrGAcC0d0eHXKTnE5b9Y3sYtRxiW
	+6qrtH3b61sn9tqgcKCczwbpM/qTEXVAFWwnUQWmOHC3bSmDffCv87oebIPlKwy0
	W7iVXg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyptqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:38:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f54a16de59so1909486d6.0
        for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 08:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323526; x=1747928326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3pdbEuEDP4tcdmm5ZtqXD3QPjEEiKtDhYgXWKQaq6K4=;
        b=B23dTPLNTyynq6plkcQtx/WajxhTXjoRODQ7WA+zuu5dI7fVuYtBIFz0puYTWZWxFn
         8o/YeDkvjXyPfK8mOXJyb/rCF5q9t0XEVx4FnixW9MphQ2H43o4ybUeC9whfig6s7rcf
         Mtw8MT6p3oDEENLfad3Q1eGVVsevFdvPVyi3wUEq6Sm9jKB2qeu/gFMzNNTIHW2LUiQJ
         nX80OUapIbeoqSyXrvOg0rMJ4B/Y/GA6zV3OYTZRriBUeFeNyrHfl0R329laHYVLC+I1
         TbDKAUMtouKBZJJJroS0IA9uw+m1i/FFIqDYXKRhikYqYFzqF075EVAcAUdayihyUxnf
         9X1A==
X-Forwarded-Encrypted: i=1; AJvYcCV+9r1LNTTJZ62WXYM/cJyYlPfAic/3nGfk1s17btNot2YrwKCHIVlbq3DJQoxcLqDuMog7aTcP4xU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb1JGNs/XbxwtllT/JJJdf0uZc/67jLYJx/mXRvmOnHkG4kVR3
	Iv4ReFk+Eu4aT38XmD/5jiG8XAOrYqjh4bXz7vNZSnN4ckJHSFVc+jF2wfWzdRyupAb582w63Bw
	/jlm8UHvArIvgy74liVuFUYS7zWhzzC4aLplDsbJeP041csOwo/esPSqn7OLGNiI=
X-Gm-Gg: ASbGncslzERQAggb+0gfXf/CqeFA2iclgQZEQ3LRsyNwp0dArjX9xQa44ViboCfloWr
	+potEqlBX48mf4TiPt0/MEqSnc7+UO3SBCF/wU6MlgrWOQRDkQcipp/1K/PHU7/vZXY7ue+pDDn
	XLoAtHa24Bfi0ktaFVLmdJEeugrrwBif2cw+ghJgMVPamLy7xVkuQ01BiMdkT5o5Ogc9fOqaOHx
	zn81XHySe21aJaG/8OCtPeh//SOd0KL97SSCClRsUFijxAE/HiqRQxisJitHRjPtUfxlu+YDPNc
	o3aYVvEwIVcswqU1tPdv9PcjBaiPtqauY76DgqgH9oZISdid0aSSqQVqi5x3W+arEQ==
X-Received: by 2002:a05:6214:2345:b0:6f5:4259:297c with SMTP id 6a1803df08f44-6f8b08cefecmr936926d6.7.1747323526140;
        Thu, 15 May 2025 08:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHv3PeSvVVZHsqNQh1a6BwEeriW62crZna4w75F08uWKfsdhOTODl+xgVRMR+9uF6E3AiEoA==
X-Received: by 2002:a05:6214:2345:b0:6f5:4259:297c with SMTP id 6a1803df08f44-6f8b08cefecmr936596d6.7.1747323525704;
        Thu, 15 May 2025 08:38:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ae3b824sm2851a12.79.2025.05.15.08.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:38:44 -0700 (PDT)
Message-ID: <51947214-47b7-496c-ac26-8185bcda2312@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:38:41 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/18] clk: qcom: videocc-sm8550: Move PLL & clk
 configuration to really probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-8-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-8-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ATMLguo66ETasdbLD-zd_Xk3RUkCD8iS
X-Proofpoint-ORIG-GUID: ATMLguo66ETasdbLD-zd_Xk3RUkCD8iS
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=68260a87 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=CXQnK64LRHhqnx0rWp8A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NSBTYWx0ZWRfX3MPDgJOrhO40
 GLl6facf+VsuXgP9NeVGDweLsNgcCYWmei7G0NLjOLsyo1BzEVfiSrOSbtnufZb0IIkD6lXSjzn
 lSOeYgOqa33KlyyExR5JTOowi0ep4jQMdZFpm2CE6zbseFNR/7KgluQvT3ExNXNsmktFHztSVe0
 oR63xG649XRNg6KcbfbAmLpQHBAqeczC5sagSY3Ts+iTNUY1GU6VYH0ABGqLLbInXLFb50dCG6l
 bRKFQCrC8yITchg9OJ/Xg7C38/H/DyivEVFYoZBHkZlcmLefe943cy3VsoLRl9EAWXEZzgHf2nI
 XEWIqFUkiCAx8m7C3UTZw4948PLhsWDDpygHqMPqerfu4gU+dnc37gOEursvMlnWoTT5ZGLjDn6
 Mi+ZiX9Q/Rg6Sxooj+8H/qIRHRQhL/2uqvGFgOSjbdmTo/9PXfCfjtjGRV35ecrkzPKOYxl3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150155

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Video PLLs on SM8550/SM8650 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management, PLL
> configuration and enable critical clocks to qcom_cc_really_probe() which
> ensures all required power domains are in enabled state before configuring
> the PLLs or enabling the clocks.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

[...]

> -
> -	pm_runtime_put(&pdev->dev);
> +		/* Sleep clock offset changed to 0x8150 on SM8650 */
> +		video_cc_sm8550_critical_cbcrs[2] = 0x8150;
> +	}

Because we tend to sort these by address, this index will likely break
the next time someone touches this

please introduce a separate array for 8650 instead

Konrad
