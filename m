Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA38A3C4577
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 13:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295884; cv=none; b=un3fQUUPyHZBjFo45x41byB3mMUX4p/GUSmSMclwiB08QVoXwMNrmNsGWoKiWhcHPoik5nq2bL+KHlVd1tjqBCDafmeA4IPxqwO939d+uUYvSYJ1q+WyioSgz+0lX2kVlc6ewIZrWKFh8rnz0RGXOyfHWqNtWrRPJKSz2KbMjg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295884; c=relaxed/simple;
	bh=HTrVirHkAZ88WnRz7XsFUiuvNW5SmPu4mYPKWSHGV/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/nLr9axgDySuQQb3m3zJxEsPBfsnJgEBd9RQBlSBo2PLG6tPKmgHWXr+4PS7WMpJRQAt0GlPnI43FgwRTSHdov9ViMkwh3HNTcOYhxlE5q7OZ+ESCwhadA8g7rD8g+ACJ8Of6H6nvUuj48ivKfyQDR5Kw5tYyBlffauHjvtohc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P4NgRrD1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnpEdmdl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P4NgRrD1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fnpEdmdl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RB73uZ1237224
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 13:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GlIS0COxbByFQx/A4+oy9WRIq+9vt2F7N2ykLMySeh0=; b=P4NgRrD1u3k9P+rA
	nTOluwo97ECbZPR26h8/bfWGOoJf/Vom2u74VmvlYNz8Wusl7pfINOytYowQ1kVC
	L3sjiVSdO/cY9dX1opJEtQh8y7fGFm3jly1Xv1fAmzMN/CtCwH3wRUP0akUGyYR6
	oeGyIyMSU5Wx3SoGD85Jqn1CBhro+r/vx8hVvloR8JiQqeoft7PrQB544G+oKawV
	IShBka56wwFy78x9dz/b4lLM+uLYoO7G0YiMDPk2JOAABroiNs0Tq47HG+PxoUds
	iqb/gxHbiMN4WLHvEIOmm/6rw5IjqkoFK3dyAqhpbdBQOCcRZYEQxzBRNyVwwtw7
	UGo+9w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt6n4ge0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 13:18:02 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9542ca218d4so595595241.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 06:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777295882; x=1777900682; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GlIS0COxbByFQx/A4+oy9WRIq+9vt2F7N2ykLMySeh0=;
        b=fnpEdmdlCf5zck5tbAcD+9yvRKJJsvYND6JxgX+5vmOwYGqULvAF/PPR0hSzg1LjU4
         rwr52dln/JYMMqeb4W4RxBrymtCTk5xw4arZAg0q7jneIr3PA54I4CDBlWNRZGDEXgz5
         OPxenR6qC+uR9l3so5Vh0KR6Gs/FImVeFx33qdXtNunPEp9UOYTo9H7ZWGgHf2H/GQ9f
         kNsZSldl/2s/6/y93O1chXeNb1mCr4QCytOSDfCcTqKBjq/2TElzX4487EuYYlLSI74v
         W9OOAzeXNoF7fPjN+o7bAfHouetGROeXrIXMvgrbkcySpO1wKsd2gRM0UbB08up/+ip1
         mZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777295882; x=1777900682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GlIS0COxbByFQx/A4+oy9WRIq+9vt2F7N2ykLMySeh0=;
        b=W5gujJNSU5T+TkXZccpdjQLe49dArRfpgBM0VwBJieM7gMORS3EkB9jQed+AmKAge4
         UCQlyOsHWqRCeowEZZlY7wDQgMWsFTbjpVM/pTP++xt0WHNwhw4uLk21LxZFQJIqo4zi
         qCYOl2DcLZ2YDNNi5Vh8TYZ/KA9A+s+0BkknM2DDzLVojUM6FGjXuqN+QB2eFnY3yE0q
         2zbyLopd+LkbvZUFhNklm/JkFBhD8e+F2cjVMPy/9b/MJWFNfJasSZHj+phuWbgCf4Qj
         +jQbndASouZc4+IxIkOEdz12SnfJ5N72pAYOMVQWIMC0VxHiBRIos1YFmOJGY5nFMh+2
         867w==
X-Forwarded-Encrypted: i=1; AFNElJ9yKoHt3iZ3serTP37dzFW5ZEYNH5LqQaG5ZLoepwb+KiQIp5W/BO9pNva8r1roAaZQeHqmJklEsJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ+i6d7CU00pzZyt9XEV3p3uoDvS7037/tyGt3FxXk/rShcGHz
	mgsoBh8nWF9XouoUjAuBTxwBqHodqGSHOjrn2R/LR/xLRchk3zs4ncPYJGXA9qNHE4mx67pgPn6
	MLB6EmAqIuNaCtj/KSE67ozqza4yv/sb9XJUQ38zrsIpn4+mcU9rgMKgc7fZcKvY=
X-Gm-Gg: AeBDieso11UX3Pvm5JNi4LUvqrHf88inpMM2sSxSl9lilWBIUbTN6BlWta+F0k7mhFX
	aYx5VzE/H7AcAGyaosx1LDMt5XxW0m882g83y3Nd8P2LDOzjvBXKuD+7+vMzwsTVplHcxJOrb9D
	C1G0IO4kVOciMJGXcOIE+pXfOoy9RBNoP5aBWcUZ+ubeDpmrBEpUDEnsDQs3yyObKuxlujQWkVP
	NY0WXFmHEXveJHY7FDuD70OaIUh43EsMskq+SsSAajX6n670MSwLWffTpTDAh5aatkjswoOIji9
	a6CskOysrDqcXuvAXNWUBbjBz1Eds74kHkllFHhSL7LWVHMeayp3PbyNGYKQWxQ/U3bUqTkoVFJ
	pUa88HlVJDP7rCUFqHUFBDsMMaic/fqFmklRwo/jFNr/2TgCE/fhcdR4AkuEADAHITFYXi6j6Gw
	fHjgHgWdoiooC+TA==
X-Received: by 2002:a05:6102:8501:20b0:623:52cd:4cb7 with SMTP id ada2fe7eead31-62352cd5657mr1122151137.1.1777295881755;
        Mon, 27 Apr 2026 06:18:01 -0700 (PDT)
X-Received: by 2002:a05:6102:8501:20b0:623:52cd:4cb7 with SMTP id ada2fe7eead31-62352cd5657mr1122124137.1.1777295880987;
        Mon, 27 Apr 2026 06:18:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e49sm1136706166b.10.2026.04.27.06.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 06:18:00 -0700 (PDT)
Message-ID: <5d2d7909-9b15-4378-a05b-6803daa27559@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:17:56 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] clk: qcom: common: ensure runtime PM suspend
 completes on probe
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
 <20260427-gfx-clk-fixes-v2-3-797e54b3d464@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-gfx-clk-fixes-v2-3-797e54b3d464@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SP5IMOXvWjFXHAVB1yUTHSWYkI4ADBh9
X-Authority-Analysis: v=2.4 cv=Xba5Co55 c=1 sm=1 tr=0 ts=69ef620a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FUsajQaAIeak7Cqb3WoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: SP5IMOXvWjFXHAVB1yUTHSWYkI4ADBh9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE0MSBTYWx0ZWRfX+Ldbev6JzCr3
 KHvMSMX/0JxkPjvnYppXu8SYOu+ASlWCFZlU+sIosUvNVlXMct07d2S44dqGCIXGAdd8uH8CIn1
 qdcu7V5xv2bAqaDEs6o3NDl1mdJnFPfwJm3G3429rK/SdN6Bs41nx9/d/ePxE7j8LBmzIzONAaO
 zIFrt4CZa+j6Uu3GfI/MZRdE7Sqpeq5HW6djSEvH32u+XPxu3YYscl5PVEvXGnBOooO9HFCip24
 dqhgMN66M1+SrrH0RiEyq1IehLf/GqnwKBVq8BjrXY9jTXIRcpx/BpfPC5FWnTumkdj2tQmqYRX
 6W1pGiw7Yg9TldHAxwrjgFW5txMnx6X5yI2vQmtsrCKuAbswBuywGcAqgkjU083fK+t/ZhkF7NS
 /mMJU/P915rVlFXjdrfKcC9A/p6D2C6vfgJr2Uvs151YoKiIOUOG8UrOtRbBN0SX1GbUAxmf7mZ
 hSzN42TzSoixR9vkpsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270141

On 4/27/26 8:38 AM, Taniya Das wrote:
> When the clock controller is probed with 'use_rpm' enabled, the
> runtime PM reference is currently released using pm_runtime_put(),
> which may return before the runtime suspend has completed. When the
> clock controller device is registered through this function, calling
> pm_runtime_disable() immediately after pm_runtime_put() prevents
> the runtime suspend from completing, leaving the clock controller
> active and the HW rails in the ON state.
> 
> Use pm_runtime_put_sync() instead to ensure the runtime PM “putV
> completes synchronously during probe. This does not have any functional
> impact, but it guarantees that the device is fully runtime-suspended
> before returning.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
