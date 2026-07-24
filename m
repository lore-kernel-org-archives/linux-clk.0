Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465343E3178
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784908248; cv=none; b=c6l8Ol35wW4BJZf2xlqqCZ0qAkMxsj6I79Qo/i6ll0sRkaI8jBJkT/VM6ZEtG7KdzASq2Zrija/8Jf2IU0rMDHE45f9V1vE5L8Ho+/a8pRfUbmdgEeiHoYDWXP94vlpBRuWbus34zLMCYK1KFbUPGJMZWwNHCOpShRJlknqCXdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784908248; c=relaxed/simple;
	bh=H1wc9vGVsGCeG48/JExdFPP0oJJqqWCSm2PIC2HdVTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O1SS+iVighjdFrVjQeLGo6Xc4mfZAEENT3n76GoYl2oz4H9rgNKq6uBupRXnAP4dt5TwbaS4NPYbAZS/T+TafdRit8XbKHX12dmQsm/TGjoVqT2RCgWGxEviBFubOSDmoEKxIS+lTVwfvK1KurMeE4sN+DH7/fvqGMw/Iz+ub4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hC6EVB1Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dC6RSvx3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hC6EVB1Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dC6RSvx3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbLCI151720
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AsLrz+AUtIAsWpyhnYd38/0R5o2hWRM61PfRwNfUs84=; b=hC6EVB1YB052qg1j
	JzfLHBn+EON/IJbaqOMREWXDflpiA2k+S3WSfUrz99Ej1ceiZ7pf0zpdJ1nrLHPt
	SqsXNwxX+2UpKDK0FagHmQFG1CWRNbfKXMwm+MIPwQ5dhQZ8/OhSzehG3fDFUBUD
	UKly15G9psdj8ykoAHbHzr+hJn/FecvmnVbiQFzXJ3KqaptvwQoBZx3opBf2LITv
	CZzqf+z/9F8Z5Zk3llr6EKyzY4YUG2VZoFqJEc7BzEdCMdJAtTDZNTvezmrhwu8c
	dtnGDa7bGER6+1p6OFcpf/GtxNfpiHlKOPOAn8HLovSzx45N+gVcTNZlnAR1zf+i
	3Syxlg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8ck8nbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:50:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfa45b280so375701cf.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 08:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784908245; x=1785513045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AsLrz+AUtIAsWpyhnYd38/0R5o2hWRM61PfRwNfUs84=;
        b=dC6RSvx3GVGiwC7fUVKiwwZK4g7Ne+aj1oGI7pH+N1/MhRgPVHGT4vMBmPvIzv9zbG
         4A5oH6dBMY+TiUz8MqCtG/7ijr3Cn4Nwe2k9M7JwoWau1NWwBMwpCK+ZcT8JBo7ef14U
         RQwf5VsoNqwoT698bAVMaK/g6PlXo66l8Pwy5Von2CLVIpaiVY/2ptpBgZMgPgPiegbw
         90mKkRf3iDGT8hTbUjTojjLztZJ7BAimmvcYTcayHwFPBzOoeI+dUoU8+RkGxKUuP04u
         lGEbidTh17AOtmeSKA/H7uiUexp1mhSUvN3LiuzqrcK/EXJFCXSAw32zRR2/Wv7cmkFs
         Zgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784908245; x=1785513045;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsLrz+AUtIAsWpyhnYd38/0R5o2hWRM61PfRwNfUs84=;
        b=NYj+wwzEE9CCAA1ptQFbcs4S/uOlcjJoNYlhxQcFohO33iiyc9Cr8fHM4ZPH+0Xd/E
         LX7ohtgAClSXvOW032IsOw2D0GHFGgB16mbxM4kPO7n1EKfd6xK0eFLcE98AITz4mGzF
         ZEgPUgClFCeQXbg/B2f+bGrGfiQfAfDRlLwHyWoUQXQTYUor2DaJ+JGK1taSIBoMErWz
         GMTeXRvTOADFI1gTyvMJZ5F7g7pVwMgUXgS0GwnAX0WsFEPOpKc5TNVqna3mlSVqBFBv
         4MBUMcwni/PseeW5zGLurUkEpYnTcIdnnn/eCNhP+6pTZd6FJT/bSGMGN9k8vskTgxGu
         JN7g==
X-Forwarded-Encrypted: i=1; AHgh+RoVOA+tvzr5QH3AU0uNGdjd/EnJp2h3A8NNtOCn4IXE5sowPHeQk+dF3pR2ZSEZuz/rfmzKa+/WY9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDkcM/4doZXrW852gBiRABIyoHKjl1zKzKnE7y2yjxzVyl8g98
	HSlwSQUyJ6/bFHQ4cp7vUpCRx640nlsoSyIF5r/D3HGCnxSgbE5eJuGLKjzLpA96hTc1c+xm5XC
	4tGCQunWg70F22De31LkXUrWcHgPAEiymK0n0vDZsg5OdX6sehr8MQntxyiDiROk=
X-Gm-Gg: AR+sD13Qw0KlcC4xo84AgyRlOZuZuVx5Pwm7sk6xxGWAgdZGET1cPnw43HIDEKuhrgB
	7+09cCN/8DEOzENyEqoUI8HcPrMkSiuuZaX373suZv/8++e/FgVPKhhHldB9SFLqOLrqwRAupfO
	T9v1FlS2zyQfmvbKsAt9AwH0ND2c2XaiZRiXtdVKnoJrbnuLCOdVcM0t1Uj2l6rzmoJz6URvkpQ
	zS+x2TFEm+/1PwzlULSZw9bhsGvDE5FyjF5GpNv1hF3TGx11St+6tZrHHzcNzn9XPNNBJVziZbf
	PR25DVNYv27iXiIgH2EmjAZ1Syul9MvLYURUvHj1pN0QVgB+tVBkmjj7Wbk+HnUiFZRuAwRQzfc
	RNGpdmlYT1ry/j+1dNVFpvrFL
X-Received: by 2002:ac8:614b:0:10b0:51c:857f:9c1c with SMTP id d75a77b69052e-5283dff23f2mr45688341cf.11.1784908245604;
        Fri, 24 Jul 2026 08:50:45 -0700 (PDT)
X-Received: by 2002:ac8:614b:0:10b0:51c:857f:9c1c with SMTP id d75a77b69052e-5283dff23f2mr45688121cf.11.1784908245047;
        Fri, 24 Jul 2026 08:50:45 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1f8fb1sm7929e87.72.2026.07.24.08.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 08:50:44 -0700 (PDT)
Message-ID: <bc845149-2a19-430f-9768-3443b10c0c65@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:50:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] clk: qcom: ipq-cmn-pll: Use
 devm_clk_hw_register_fixed_rate_parent_data
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-1-a8b8679d215f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-1-a8b8679d215f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE0MiBTYWx0ZWRfXyWe/nBpK/eYI
 moy84G2+xSGLnoCkVo/7A3zpJoAjeo8aWSuBEVil04HMUFXJLh1+KSt63Gx6pB8WqpeYNIBVi3e
 I5akFwgHg8JR0QaXIKsYDK+c0zsX8p/rlrUHvbhfpICfwIggcG241xtur5pYzbIIKvzNpETXAwc
 oZrdn6kNVFIhopAUP/r/gUF6Te8A0x1bMBMUw8FMjaFHwrQCgDOjTU5JIQAxInct0wBf/FovQRk
 wNCELsafWxCZGzmjS88+gmOiY+wHLNamQfw2saTAk9FcJJxFpLEmU8tgWsY4TIcLQH9m6ZiKKzk
 7xpz2KDt2d9WigjQIfkmT/+62XVkrdO+VPlSxb5bXFhwL/oy36IoZwyvL6o4rpwYAU4z63+VuWW
 aCpoKdK9TKXJjgs5u28q9AyKcUCqfPujP6AZHid4aWP626OmObu1SdLx2kr5srJGXqgFWn3I54p
 aOrsZEN2GYPNQwzgpkQ==
X-Proofpoint-GUID: _X3R3LGxc5ZxYy46pFI1oy6emV0HmdIl
X-Proofpoint-ORIG-GUID: _X3R3LGxc5ZxYy46pFI1oy6emV0HmdIl
X-Authority-Analysis: v=2.4 cv=F79nsKhN c=1 sm=1 tr=0 ts=6a6389d6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=C_jcV2f4aFh2m0BU-kAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE0MiBTYWx0ZWRfX1vD4nu31r+IG
 raTag0VjnPg+82t/P++isfezHLiQkH/cOQZn8OMgtStcDHU6HuhOaPFesV8TRxfCJ3AVdXRO0Bl
 kIGXQmYXFe4ssXmVxXfk8Qm1WguTdc8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240142

On 7/24/26 5:00 PM, Luo Jie wrote:
> Replace clk_hw_register_fixed_rate_parent_hw() with the managed
> devm_clk_hw_register_fixed_rate_parent_data() so the fixed-rate output
> clocks are automatically unregistered when the device is unbound.
> 
> Since all clocks in the driver are now registered via devm_ variants,
> the remove callback 'ipq_cmn_pll_clk_remove()' and the manual
> 'unregister_fixed_clk' error-path loop are no longer needed and are
> removed.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
