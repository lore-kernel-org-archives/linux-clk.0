Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED86A2222B2
	for <linux-clk@vger.kernel.org>; Thu,  1 Jan 2026 18:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767293786; cv=none; b=Nd4w5RsTMUwJc8gybZJsnQXGUUXJbMwlcxkv1r++aVNqZUkuWv2z41MP4mKz4zGBJjSc8p/Xc/Lbb1ywL16dxKXRUhMAiRU1WbztSHlBHT+Yx6EnEU7RSEIRLLsM6axX23eErSTqHPWLMwwXbC8XWXN3I7nf3gDSb9Aku+sKlDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767293786; c=relaxed/simple;
	bh=ztA4ERIUaOpybGOh4SHbJZ1suX1ZTxmjgGeeLvFb3ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtsFAWy6m7sqArCqk/EsHcZy1xNfbNzgKQ1pNJ3CEXZfRZBf0TDJZiVpJRMGFmPNAksnzNdJyWyuqsNwuHX8fmKh/1xnpCIsRTMVOPLyOuf3BE8gvJiwSX1PeHGB0GYuKBrpwiATaa0m5huQ20oNgb/EGC0UV5MZpr+mC2tU0Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QrHZUUVo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BlnVTt3c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QrHZUUVo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BlnVTt3c"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6016l242360090
	for <linux-clk@vger.kernel.org>; Thu, 1 Jan 2026 18:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qO1Bf50KUVnO0lVfdCvVquRm
	mso9xPQ1/QVgKeZcbRI=; b=QrHZUUVocHuODULCmSdVCjwrONDXtR/+OGtrDkAj
	WXrjDosHzVxFV90nFZi8r4tTb392Ov56biujKifdorn6kUI3IyuM7gCav27dr1iT
	bOeq5oMvL+qkxTvQ1OSI1bjROzlBQuTekTZrO4wWp71y6DLEzi0Ik07JSWZ0V6BR
	1Fcn2nN4s1+jC0ZD9qwv0aVNHJPA7sUIxDIZM9z6WzC567w7pD7QBeoYpSFmaRs0
	CDoUdp17dJNEfQK4+0jsxCcDbIYLG+EyOIW976vyJtxC0BatxcMJqKzgOXXOgLNA
	AR4WeT8pn1YfBpy+2jy59NO8/Qa4eO5vDHAfJPSx+5IxXQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd77v1we2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 01 Jan 2026 18:56:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso348402781cf.3
        for <linux-clk@vger.kernel.org>; Thu, 01 Jan 2026 10:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767293783; x=1767898583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qO1Bf50KUVnO0lVfdCvVquRmmso9xPQ1/QVgKeZcbRI=;
        b=BlnVTt3c0oLU1zzeFQ1/k5clK3FMxL5MGBWSPCCZrROTvuvrETyrWkhKtxPGg65H++
         EW3xwm5djefsr6+f7BnWjm4j27gXsCNom9KXUFFbIYOecc0wyS4JZzYfJa2FzbN/VQo9
         HPWCP+LR0z59dMzP/F30wwh9WMADcUpQ8SFdI1PSHXFAALNSKFaue/uGuKaPQb/qsdeP
         roO4hDjiyhZTn95kGAZIo8odZKnO+CZ4Vj+0dD3aFl2t0V0Zq9eqdVq+wIowNGYLW/TU
         9AxO+U3Gs2mTsoXjW6lgKe7ZPuGUfnd8sAmt82ue0PZZb5fwjelKDiMzw2ibBmSF26FH
         Nn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767293783; x=1767898583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qO1Bf50KUVnO0lVfdCvVquRmmso9xPQ1/QVgKeZcbRI=;
        b=sNn2awm1HYndS+QNYTmXwK6tWKn+wP15FJR6m+Q32tJsWtYRMwi3/D7S42FHXX9dHJ
         0m2x1QTaGZW3wRTDZ3dK5JIJuQn80trHRllRnNF0CfLixzN294+49c6Zb33ey44n1Bk7
         ZZUq91sx/lJn3fDixzeBhhTUR3GcuametguIitGMoNjALWklPDBvWXDg4xumx+Mwh24b
         U+htwEnkUep5gVnIv5+/mwPne2zVoBzIe0BiR3o+RMVV96DdwetrBdleDx0r5wfNZqks
         JKKsJquv4ft+By8uAWU6Qr1PzjNgQLnVPiakBv/HZVP6R1boxUFlK0MqilwhJ2ciaKXW
         Vqiw==
X-Forwarded-Encrypted: i=1; AJvYcCVIXEehsRPuVT6n/2QwHMNCZRXQSiGSFxSYeHf7lGpYBd/gZoHCqe6zjpw9HhmuaHxWlYWDPcRyuFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsxLRV5Ore18TlU1BditzqOYmq7yi9oVukiZytwDNect9fNsoH
	MiAGLCzzdhgaolDZ+4gw6P6AryqrSk3qyiNDjedXl9lnIBeMWlAU7w0PWxSf1E9qAu28x6KkMEc
	n1lGxm3Xq62BLWO6iklOpSmZf84xKqw6luwi/xApXHW8sgAL4/MlSUnUAeYzTi2g=
X-Gm-Gg: AY/fxX6SYK09vWMq39oRQt5QVVGWc5Fijye8F/6EvidFB4NwxzPpt3PiRE5+jARbCwy
	1CerYSLd2Y3DnVP9kXJi800t3kZp5je09HnjTX717UQHSUlKmItYH/ptewBb+lZ6kwZzTQuqMT6
	WFievMh6np3J8DbNDnF0f6fq3mCWb4omeVC9InsiCb6kR3PYHmPjbVWEAACKdL8jln8t7pdC2T0
	DvDDhmK4gM465eQpOFu//PDVCzF+mh7SlPDe7EiZheutnx3YZERtlRHVHP+8WmBBUE9z+u5azOM
	HEc3p1PC7ZuB3J++tLNz4+Eh9E+ByNOLHEoM8MttN28zP9CVGcr651wiUBtJWOYlyhV1RbM+JP9
	Xny1P+KblMSK29wBQfaen
X-Received: by 2002:ac8:4787:0:b0:4ee:26bd:13f3 with SMTP id d75a77b69052e-4f4c2c946e8mr340884101cf.8.1767293783233;
        Thu, 01 Jan 2026 10:56:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGvXKVfNf6JItm43nU/tdNJougEPfJ3rcs8qbHjPjq5ZWNYyaamji9kyzyAqX8oQhQTltCJQ==
X-Received: by 2002:ac8:4787:0:b0:4ee:26bd:13f3 with SMTP id d75a77b69052e-4f4c2c946e8mr340883801cf.8.1767293782713;
        Thu, 01 Jan 2026 10:56:22 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm80390448f8f.5.2026.01.01.10.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 10:56:22 -0800 (PST)
Date: Thu, 1 Jan 2026 20:56:19 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] clk: qcom: gcc-x1e80100: Add missing UFS symbol mux
 clocks
Message-ID: <32gaiw6k3pwzdiqxbvdga76rj5bfyuhkfq3xxnfad3eb5yhagi@rvial4rz27qu>
References: <20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com>
 <20251230-ufs_symbol_clk-v1-2-47d46b24c087@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230-ufs_symbol_clk-v1-2-47d46b24c087@oss.qualcomm.com>
X-Proofpoint-GUID: 3z64jc5k_yk7D1zyB2FmYU8rL97w2CR8
X-Proofpoint-ORIG-GUID: 3z64jc5k_yk7D1zyB2FmYU8rL97w2CR8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDE3MiBTYWx0ZWRfX/jx6wcFBrqe4
 Hv7D+NmiXkIIq5cPpcCXRsp3/Alif0CTZ1uXO4aRA1H+qDeUuQ/0tkoRL1V5hOQq59KCNH0q3c5
 2jj2fXRKTwt56k1FWHVRj8OwO79uU7KHfM8QrHIMZuYN4ItfDwavMQx02cs9zPDzV+dZZQKZlBc
 gGPgykM+J2uV2plylQoyfOetkMjx6/1qONczP8UOrZlLlE9E7w3fbs2Etz887JMoS5icMGvakV3
 RCL3EOCR93/637gG4DYFkISs0+Jybv9DH6DNXbVrxas5+UmXQPcDGFb0J9m9GzRBwZHJHIYRyDx
 pRn/MCMqxTymERiP0xxCieaPXJwOFc6Rba5Vi4LbJuD19iWq9I24Ha8M7mhOHWbqMx/7lytMSdq
 v+eOl9rwrr+LQNVPzr+t6qv8AVrm+eqgVoHtB99z3hZTq/rnhgN3H57xWZqF0NszH75VSfZucL+
 QL8Yjq0RxnrwV049kEQ==
X-Authority-Analysis: v=2.4 cv=ev7SD4pX c=1 sm=1 tr=0 ts=6956c357 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Tt4ZZnawlGJF5pWS1soA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601010172

On 25-12-30 23:08:35, Taniya Das wrote:
> The UFS symbol RX/TX mux clocks were not defined previously.
> Add these mux clocks so that clock rate propagation reaches
> the muxes correctly.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
