Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFF92951CF
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257631; cv=none; b=aa6cMzcoWbAT5DyJ+VyXSPfRaeqHmvdCKAQHOMEf7a7sYqoUV9s631RMSzxHzCau3OOZBtbAYGAhTcnPCjzaTsbHZBHk2g1hMaL/qvP1eEHgi1wtvBmle2nJICVEPJYHkFWvUH/2RU5GDmMinNSGU3vmgdBTIT0TWgoo2p69Jas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257631; c=relaxed/simple;
	bh=dKXXkyeDnyVFW4grSfvrYpjBsDjCE6AcHIzvzvZQQKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NR+5xvl3nVCMbdzrXaX5XHL+FqBhvyS1ADY1wIwByJSGhJE5thTXSEoOtEuvTN4/c9NeNOuhzAQTUmcGsdPO3uSAlxUHNb3p+HklZzMfjHYP/Ot90OtkOEbQtk5ZUG9MUjMGAHqfld/EIVooHfQmiyLFZcDJVT8QiRxchNy+XzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vx5izDoF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vx5izDoF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJYUv9020112
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2GCgOGdrnZt0SFcUDKGI7c0L
	8gkL0wloGd+Wl/mh66E=; b=Vx5izDoF4V3qD8sPR1lVadXnS1mchmLGU8f32SnG
	F1tmTs/7Ka8nBbPLZ6//WKOeSXfGHkv8CofdC4zhwyRdLiBrXFX+TfkS0TPvbBtH
	TnV9U4/tkdV/cBeX3k/F2deSiK05S0YUgVb4zm/r4gcYutJEhYvYVkoTRA5zkdt3
	mLHcjJH9YwCUDE2N3GwJVzzQlGx4RGjFvzMeD+P4ARJbAllBChUCVadEj9bvGPVi
	Nz1OSRzvgkXCg4h2FxJhjPJHb1NYzG/+oY3x44v1ie6/kO0MOahIPRLvJ97yAYM1
	im8CkP39vj8hC+Rv/Kuy6wl0asyCyjgTNSdzN/saTvEFBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnm3se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:20:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7caee990721so60657885a.1
        for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 14:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257627; x=1747862427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GCgOGdrnZt0SFcUDKGI7c0L8gkL0wloGd+Wl/mh66E=;
        b=S69VUzdl0j062hbRZgeqYdWZH/Us4CMAMdzNkttybww6VhtdASyLdr0oKyuDOz0MKH
         di+ahmpvPmfdgHy9pOkLOJ4IV+Q7xyfPOR7l1/Earq3hJIfrnqwBJiEqFYaRK5KQfYru
         eAqAQNbtyGowObgjaoq4Qj9QBrwcw29YAopKHkSKfW38tbSPjfPx8q68xPEaH5dKysRJ
         aIk0aejCwuLMbe4sUc7ogsPYjsapFdBc06Wb3Hzs3i/rWbYc0Yy9EviU+W2RwgIVEQvj
         P8oWGKvy36q+q9gos3ZUzJGEFEe+FXNJBjgKOQeWWwMcnJ/O7620kZ7aWs5SITCrfIIP
         milA==
X-Forwarded-Encrypted: i=1; AJvYcCU+n3lLN+WXq/hMNjJi/Wer1EiikzSkhmEQNRA0A6Cwl18S986SThhAqW2q3jQVzO3EahmKZGSxDlU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtsptRpwfq/CZ5kgEQZOh2gZJRVEYb0JfzPsg1iT9yLkB39Upf
	iWMyfwjMcJG8ErDUIao2nmmU6CHiUAR2UPuOEQL7mvM4+6hV2rumbMGF5n0nOPv8a+JX7lL/Va0
	HvZYP07SauEVr4dT1JmycfdcWjIYy5ik0vW4+IM/A0zfsBlp4qNuqA/nBwfc=
X-Gm-Gg: ASbGncvSGBsNbyy/R/z1d2m4o8+q+LMum2ziKCQ9RFhF6syhyGLDhppSegS20E7yG9K
	GWmRS4Vb/3fFNWPNkgLEAYSfj457unSbV2I4xNg8qQ1m6jg/GdaAtLjEXLLkRycVrVx29Krwglm
	Et6zLcAmX79Xz8BFRZOSDVrzQUwRCZAbjDbGkls6LwCKtsSvePylS2kajq0KwAwk2vZbACeXAg6
	2gImD066QErnnHLh+KkmC2Kc1dBhhX4Omf4AYpfB5vVPuxzrlz/mGACUINNphrL6JkOjVuVx3m5
	fiXuMlIq3gflCmNrK28PCPndNOSECEp00rEK5O8UMI5wHBWwAtavTpmAVs2FIzhWvDQdg2ekzeE
	=
X-Received: by 2002:a05:620a:17a1:b0:7c5:5d13:f186 with SMTP id af79cd13be357-7cd287f8e7cmr636196185a.10.1747257627377;
        Wed, 14 May 2025 14:20:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3q4xP/KFiqPpFuTzMa6gUHpPuBPwILvvqRM11pnp2aen1rdHKlrCCS3ZIbWjmOhuvvWpyUA==
X-Received: by 2002:a05:620a:17a1:b0:7c5:5d13:f186 with SMTP id af79cd13be357-7cd287f8e7cmr636192585a.10.1747257626942;
        Wed, 14 May 2025 14:20:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c321f2d7sm21110781fa.0.2025.05.14.14.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:20:26 -0700 (PDT)
Date: Thu, 15 May 2025 00:20:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 04/18] clk: qcom: clk-alpha-pll: Add support for
 common PLL configuration function
Message-ID: <s7ekugpsfdzxvz4wm7axshrvjudpsjgh7dlceyqtqtts5kmwba@q2rgggezzf4l>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-4-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-4-571c63297d01@quicinc.com>
X-Proofpoint-ORIG-GUID: yRoUEaaQI55QWBq86wnhMrg09M_wXC2L
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6825091c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mbcL5m-RS8wsDEqdrk8A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: yRoUEaaQI55QWBq86wnhMrg09M_wXC2L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5NyBTYWx0ZWRfX3rKt3gvLCP1X
 KXmsn4kYRaerhYKnUPWcNRQcIULspODqR9wLK3YeYqhmarsTBeQ2CNM2+skPtStLpn3/LUf4WGO
 zlEaxmISVn6mSw1zp23KDQKBIHN9dGNRU89yrVhMO0/4PHkNla7e0pbgIGGuNIDrC1/E9iVPYz/
 nMb0Sg+z0ZRN/v3Yb5YqtNyi2QrVh1GY6kfoGcy/OZ+Eso9bgxqa9y7NvdttMbDg52z3JQBny8F
 hfBCmjubxs0oecrfFt/GSM6bsIaE/8spQD7iDIDMCG6D/fg93XqvV3lrbogrf5omMevCcBsyNGt
 yW6EE3ckZkWARsriz0/racLJ0wkBO1o5yrqVZwh1JMG0P7rzq12H9TaUD2DC34RWSwX6BYNA8Fm
 SLGNH4PN7uQFH6v3e7QsyZAciISdr8St0tseaS3o7TF3Tihx0sT9D+GkswOb5OAkdFr5j5ox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140197

On Thu, May 15, 2025 at 12:38:49AM +0530, Jagadeesh Kona wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> To properly configure the PLLs on recent chipsets, it often requires more
> than one power domain to be kept ON. The support to enable multiple power
> domains is being added in qcom_cc_really_probe() and PLLs should be
> configured post all the required power domains are enabled.
> 
> Hence integrate PLL configuration into clk_alpha_pll structure and add
> support for qcom_clk_alpha_pll_configure() function which can be called
> from qcom_cc_really_probe() to configure the clock controller PLLs after
> all required power domains are enabled.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 57 ++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  3 +++
>  2 files changed, 60 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
