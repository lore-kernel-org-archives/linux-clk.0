Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077BD34D3AA
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029956; cv=none; b=uCXdHIHFdvRZrYpceBWCsi72ZYMG1YnGNIGjDZ5OOy6sJw036lFGf28mSliDWoqSC4klv4ZecZeRoSA0M/Hef2/J5o1AzuIhda38SUVvfxAjLAELB4axH2zfB928wiyhBSCH6C868Bs5iqK9JWICWplE9NQyOGoMORIoTkyMh60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029956; c=relaxed/simple;
	bh=Dl3BIQHNAZA9K8D96BWlluSdepdKUs7++yL69iWcfYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nN86L1SMYONXs7Id1FVF86LLreu0hguwrKQtDAnF3lKtGhdzaG+8KpvRNi9OVhmHj+Oy//VTtyQeRx2mIwTrggOutB712e8KTnBRA97Pd4qmHrVb6E4rsl9YtJ8Vv3tBLPAuEU55/s++OR5zt8xcjec/DMohdqmjMBg/xqaSs88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WStFVmCN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y/rS5ek6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WStFVmCN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y/rS5ek6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127aUZJ1095098
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 10:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TfSoshNIZuoUQWdGf72ue86p/WcMY/Y5wpUVJbZySiQ=; b=WStFVmCNo3BWrXoL
	Amh3mV1I5frX/XLbKPIOi3XWVTDDEQloeny7cTZ4bs+HULUUvDd8BnLTesXgtjRK
	l5bJXksoaydEWmG55Lnk17DIl6r9tNet6R41HWxGP7sebyHMjh5+k8CWayapGAt8
	rTnzcD09JruggIysaoda0GFoqdaiKxh0Wyta6hy/03LCsWkGGKnobiHL7DDac+aE
	84Ch3mQqYtWcD4w/+GjxURopngRnYPptG5ItjDdVkezPd3jX9Saf+FwHva6+o9qm
	Y/W0mj2KVJ1m6J4BLKspEgw8CswbXUwZBnzZSTslfqDhyMCLEYMCoIjNsH3Zd/bT
	rFVUqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as4w5xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 10:59:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70c91c8b0so113591385a.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 02:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770029953; x=1770634753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TfSoshNIZuoUQWdGf72ue86p/WcMY/Y5wpUVJbZySiQ=;
        b=Y/rS5ek627e82qHf+xez/xhEifbmq5CBpBmLHKhTMlYROXRbigokaQ1mDdgdVKTmUR
         b7edMeUaDiXqh+uym8pgAPgmDHY3QsmMTOknFsN4R1u2X74sTFCfvpwq4CBpECIANYmp
         yCIDxiv+EwwgBDnPdbBmykO0080hfmUYDHTrIqRFFG48M4O6Gc9CE3q2xBP+SWU6EKr0
         hJzmGaMerT82M6s+IQAT9FSDvrwVZePRZ/V3eFRvxLtxeDYsu084mnvB74MsaXQdqB2e
         lTjp+MvFPTIIFz6oe8odXewhZwNIka871GypVDT4Yi/Us1D+oNUln/ppTNeGPJ55FIrn
         2QsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770029953; x=1770634753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfSoshNIZuoUQWdGf72ue86p/WcMY/Y5wpUVJbZySiQ=;
        b=BahOg6L1Fzw4+0qTr429OJ09JcKf/UgqremB6XR8jBB5e4ankwQnPoYsy6kDUWuPEC
         JKCVldsSFQGzzo0mGOpQEFg9WpRnQK2SnD8UssfA/cCdJPwh8z2ZvKQEgL9yS+fOZFXl
         LH2+zbJsEUJ0K9e+esKqHZYNWkXno1Pr4m6nUjGYdAxZaOZK7DU7xraofFNdn1wf+Lzn
         CL4ucmHt33RPHA0IM3Ht4PrswvVmMTQKH/FfL9EI217MlzabQ9rE995eovyac9NnvOgn
         zI5i3NBNHQoNg0Ip4QgqS/jXt0YcLbsWjei8xud8KBwTaygogGtBfDlPUV1RYVreBeXV
         sEkw==
X-Forwarded-Encrypted: i=1; AJvYcCUnDc4r3XXi1Gfj90qk4oLVdxvzFcwiQlsDXQBJpsxR/uNkWollQnkyPlDjp5coD2pj+FeXwcZWJn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNqBZYk/IVxEnGPUoAu3PY+R1suQYupV7jFFELMDpkl6iZhohg
	OfzxyWbonnyqPiU27T41syDTQzDzBgOb2CJ1Eg49qZ+UWDEmTAzAsbP8FnGrI/qNCNuJl5iK+85
	pZcQ4T4wkS/s3JJXErgJJTWKFN6BuQnR+l1G6U77h1jGj2v4lmUDC6Wex5fx1vWo=
X-Gm-Gg: AZuq6aLkaf1gjG+NaHv6ZgzLq7U/NHY25lSIHV9rLhXZK0tIhZzlbyg6dW1+dNxKPhR
	SCFLeIoic+aFoBpmJdR28Rk9eeJyokG1cBgyNSsPJKyQ+WmBck5f3muw0ZmB8ReS0xViAW7l2/Y
	luySrfa6nr0Mnf4RrdAZzHJK8Nh/Y2/JB3X3LHitcOjstQQuZHA6/5VX26IIn51SprWeomanIF3
	Oe/n0r09+ipSIcW9aSOMjTy9pLDKcX81AXlIIknrJBwYVZMuhPaYXG/LKOMAo7htMgb8W5/OtsO
	0KKsI2AsJIfqeEUzjiG+mswj5m7EdEsYcSHSZFNPo2B6vLBkNE2/DgxEOa+j5t1Y03GNLQWgU3D
	TsfknaTwu709sRql6bcqDhwbUXNyBiUtC/CHpLIz0/nXqOgAmMFhGAJ3XcWejID1EAfE=
X-Received: by 2002:a05:620a:28d4:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8c9eb34f249mr1055532385a.10.1770029953367;
        Mon, 02 Feb 2026 02:59:13 -0800 (PST)
X-Received: by 2002:a05:620a:28d4:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8c9eb34f249mr1055530885a.10.1770029952939;
        Mon, 02 Feb 2026 02:59:12 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2ecc73sm868627066b.62.2026.02.02.02.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:59:11 -0800 (PST)
Message-ID: <0bce6de3-9e3a-4a5c-b9cd-ec68096f9f1e@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:59:08 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: gcc-glymur: Add video axi clock resets
 for glymur
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
 <20260202-glymur_videocc-v2-3-8f7d8b4d8edd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202-glymur_videocc-v2-3-8f7d8b4d8edd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZDmI11mlE-n_3SsFaFP4C_Q1WDc9IYJz
X-Proofpoint-GUID: ZDmI11mlE-n_3SsFaFP4C_Q1WDc9IYJz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4OCBTYWx0ZWRfXwZKLslDy85ba
 Z+4JOXEPZWU0oWrGSMKD4aNFZGhBJETTCP3zpe6uH4HUwOks9BIqn1R2E9D6ImHACXww9/PzZPh
 zmtbZPaROqKof296Xgy3LiJc+3whjDeeOyfLrmAsZ9Jk+NE8JMxqotwde0FlvjBLTZnFVyw9k3j
 mXqQxOSni533TImJ8bTXyi/wjvL5rob1g2hlUlfK4E04/bgHZiH45TpgO+oXuqFAUcf3GcemDNQ
 0SmxPJ8/fDNDbE07uOgb1xLCNc0RqlK0Rq4XAehPS3frbA5H1RidYbBd2b3W6oHV06V8DLSfnap
 rFA3nwiQd9xdI68G8Qa9j2rumGEVeu322DTtCb7SzWvOy5rql2g47DMohBzoWg1Jiwfl8f6gnRg
 53qPmUVPSipMOkGwzIKeI30ERovBwMRK6AKt4z/LJx6WC7Z5jYXkSW9UNX4kdaSUt4a0gdrkWDu
 NTgI5yHOkihLeQ8Wscw==
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=69808382 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-zE5Bsz_LXmV53O_SacA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020088

On 2/2/26 11:56 AM, Taniya Das wrote:
> The global clock controller video axi reset clocks are required by
> the video SW driver to assert and deassert the clock resets during
> their power down sequence. Hence add these clock resets.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
