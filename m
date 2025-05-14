Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D162B295511
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257760; cv=none; b=rbyxJF772opE1IoDlbFCZe0lFZOweI0huL3XUXpdXMwnAnSSfaWIwa6Cc+hLiOoZJLXqdlGUN9LBkdxdJwVo/64izV5du3RhisdsF407YG9vTQNEv8Be5j/1xadt0QIVLTgG/lmgpNvP1hEigYg/1Kc8KviFFkFKTmJ4cfxQ6ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257760; c=relaxed/simple;
	bh=j7WsjS00K3b+a97k61GU+JejilHZrixnSaC0OSTnvJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sec9aMEk/iHgNqJTSY/5eEFWdcHnhx5dw8Fp4LAcWkcPYYzDXZUtDRG6h0zju/5NtGhEn3AzAZGqbpwYNI86bDFeNNIs1pGHhBGxzkq9ztRbKSpiqY6Tt5EdA1cYuaYbeEQ1VUkq4/BMKSyh+TCUoDl1akkBXRm/pn2hFnVYoPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqoKUfxl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqoKUfxl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EL6t1U003093
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NqN08L1o+DsIhnbifR4SWbDh
	2bpcoXr6Sqa16WdTVB4=; b=YqoKUfxlX6LrSNvIv4VpXjnzsCWs3vI0wHuJ+41e
	NQ7VVxMRHGI2+snTiktM8tPbIu+Dc7MZZyKEF0cDwoRGQLp92G+umcrISJBTpDww
	N4/qwrEwuFqjX+HRdHTHrMZ40WdYV59CV11ow7dd3UVdt6vdmBFo+nnCf3TpdjPO
	wwqh3jYjMDG0kb8NehkFNpFIUEpWp7CH8Y7R5MO38FxgFNDc2CcwD493LxTYxpa0
	6FgDNm9d8hAwWnCa5qZrV5jJ+Irw5BHMTLO84FmSr3w9SGijQQ6UUorTeazBak9e
	LFyK5XIIGjuZ59+FMAdeyvLanHhB5jTEyQqWCLOCZT8+Eg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrc2sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:22:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54a6b0c70so21880585a.0
        for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 14:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257756; x=1747862556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqN08L1o+DsIhnbifR4SWbDh2bpcoXr6Sqa16WdTVB4=;
        b=aBp7fjrS7/mmQYf7eB/CKRBGva1LbfrTq+0bsHcQFzF5e6HtB7+YSvvVG9y/AbGicU
         qaBofZKvIJKbeCGB9ZvVUF3U3NJEz5kktF0gyZyk+wUTR02uY2MnM3cdWCMJM4xoINj2
         /4S1FncARzrrSj7iSIAkEloZmwpve2guMuJHZwTD4JmRuQhdSgZjN6w/cNOc5mxDFIKt
         kPi0l+6Ql46Z/81GsXRRm9+XqdXqBcEtko14cAWEj5yfPNLIiD832lr6tNF09AfIahmj
         aQNmvlxY8xx1lUiW/7PDiAbXD2PqsU25bOT/0kvNhpdc5Q1odt9DvYXhZXU8WcRdlvU0
         GHlw==
X-Forwarded-Encrypted: i=1; AJvYcCXFwL9TGT5XWRpSzhC4AypFva/Pb55NYYOUFF0RAaQSInI5ff/ekihLrYmzhJWr5IC/9nYBbUlSh1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlCDNVFVUTN86Ied/aX9BvNbFFqtlKtKxoS8qs5SPdCFuWB8fX
	O+ht0no0tVbujvgpEG0H7KYaK0G6lg+TUqPzz3fv7lMW2bwtSIwEZl8JZ/L0kc1+Dy6isVi9/6q
	ZzSJhqqqdIoc6JLYl6LwJuvFmYqc6ppQPRN7qAeBNQkuABfFz8BrgFU3j4g4=
X-Gm-Gg: ASbGncsc8xLI5BtR8SAtSABXoI1CPqKVkPKdTcTVrLlBsp2jKuy+rQAaW+Seur80VMD
	xxf3rhdc3URoVsyFSvJEMAkovMdFZjeJVWtgjIvM7ctkH7K29CMpON6H48q0phVcnI3mFB120ZO
	us2kugfY0CahEII4pCHbZRUSupVWvSqCkxtIjzJwTGk4zvKHB0kRZ5IDf4MN7Br+w9CvWAiYZte
	ftt4DPnTMGPgG2o58m5pjokJIxh4IaWR5ta2tl4lurpHj332R/t+LiVuHM+oCMWDr03bv3nnVMH
	89qRbtoEnGxfGaPSHiVeqghzSKzKg4UXCStep/uCM3Od36CnkwP+Po+RVPZfvkGbNWF7kLEKH0g
	=
X-Received: by 2002:a05:620a:3915:b0:7c5:b909:fde1 with SMTP id af79cd13be357-7cd28830017mr670164285a.25.1747257756531;
        Wed, 14 May 2025 14:22:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3j8ZrN0KQo365y2Sc8Bjn+p8W6FoHjqjWpPbd0tLd2YG4QSuAxdOrqQ6cIDMVlXolfagIsw==
X-Received: by 2002:a05:620a:3915:b0:7c5:b909:fde1 with SMTP id af79cd13be357-7cd28830017mr670161785a.25.1747257756170;
        Wed, 14 May 2025 14:22:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fcbfsm2377737e87.50.2025.05.14.14.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:22:35 -0700 (PDT)
Date: Thu, 15 May 2025 00:22:33 +0300
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
Subject: Re: [PATCH v4 11/18] clk: qcom: camcc-sm8650: Move PLL & clk
 configuration to really probe
Message-ID: <n6sgzqmwcyadr7l4fwek4nq6zhgj3wcv3dxx7jwmmszwmwiw7c@d7a7qnd3cv4m>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-11-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-11-571c63297d01@quicinc.com>
X-Proofpoint-ORIG-GUID: iFTuHJRQsG7U7Rr4-lQkmdQWFPr0GS81
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5OCBTYWx0ZWRfXxwa+VRxkqTpQ
 QR1SLj6qHIluWDtvnCqYVqfIb7y0nxUSK/un5oqRsCz0Md3kc+MIga2aMxuitdIYJWINAdULMXa
 n8K4HXLaC7PwMMGhCZ1hcbTkKUV8qaVwdXDxCDOD7JPYlF+lCnCfywBFHOSBSIu9rYMh93Uk7/S
 n4emPxml6Vrx0uv2pfr92cOCVG7job7I4HKWyEOYf98Fc35+v+vpocT9Ya+i4rjaHCDQhri8R9y
 L5tqcCvfBUbT8MYNFNB8So5U1168KDuqPoeiSSkwfRx0E0P97vbJiVoD/aL4m2zwqgMp8oKA+Ff
 cCuYPilxo/5zyiHQtNKa0XoDI9huqgeo4OTrGx1/dYHB39qJ9JmoUHu6SfIe1/J4Y3gj/xhMzU/
 Uqk3fl4GvibAVkh6QsFSqE+xf6XiTLAFUNVmsfCC0Qd2ZvmsCS0ep7460q0lRCVkuE+gT/D3
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=6825099d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=R-MJ-YjwOO2PQHfhffwA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: iFTuHJRQsG7U7Rr4-lQkmdQWFPr0GS81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140198

On Thu, May 15, 2025 at 12:38:56AM +0530, Jagadeesh Kona wrote:
> Camera PLLs on SM8650 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management,
> PLL configuration and enabling critical clocks to qcom_cc_really_probe()
> which ensures all required power domains are in enabled state before
> configuring the PLLs or enabling the clocks.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/camcc-sm8650.c | 83 +++++++++++++++++++++--------------------
>  1 file changed, 42 insertions(+), 41 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
