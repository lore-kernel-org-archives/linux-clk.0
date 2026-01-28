Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D30326927
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 08:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769588367; cv=none; b=s7ebk+Hn69isz3mSUWhVHoYbPtBHxrnf2x1qt0imA/tQGOlMEMJH9ewyEq4hV9OVP9iU0gStobCXP6cTpXtFwjzIZ6cNKu4W0Nxc0BeLvrg6eUjkhvovY0NrY+ThuVnDKzp8c3xm5XdKwPfABm6JrHu65AhaRAOQLGpG9ZWvAnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769588367; c=relaxed/simple;
	bh=3Wyw3SAGNuSalyR4UBy85YKmiqKR1HcCfdPx4/6RuHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJotbS2D2wqMt++w1DOc2niKANStQP99rnJJd2JI3KWRuoh6+uAxaE3eDELvg+9Zq2byXO42HVY2B/ogc0nGKARpR4EzumEsRf2cYp/73zqT/cH04iGcRCbzT0c3YPvwCn5hDb6eIUdsSNIykqGeW7B7ItHjd+YRheAz0RgLgm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M2/VZT2V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FaO2937T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M2/VZT2V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FaO2937T"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S7ks1f3712865
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 08:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k51npGhFF6R2OtGNT7VVc7h5
	xVQp5l2qHkrh59jczko=; b=M2/VZT2VPKI+wizyemjda+Kq5xNDl+lyp/6inxIW
	nEBPSNcCGvteuuaRHwPpRp0d/Hmp3xBhW7sZOYl/rCR7kYcOccp/L5Zsc1vUDoDs
	DmGYhGerwUVONsFgugrGLMXFLRHf/M7zxtkWh3fizxotn49x0ZQba0vx33qghXDK
	R5Ru7Juh/nInqgpFxsPZ7OqkDYkzkU/0p/+MGL50F73yfrofhx7aKlaI+/DXkkAa
	hg3NZZbx3r+0OL6w6TvEhiSjdmm0xkSihad3dDM6b4Cn+BW7BAk2tKM1BHwSfTzi
	iIvmrZ/4eiuT010zBjLjrTZE0A1EJmv2m7vv2DWmyfn7kg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by6qbhjwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 08:19:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52f07fbd0so2868302485a.2
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 00:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769588363; x=1770193163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k51npGhFF6R2OtGNT7VVc7h5xVQp5l2qHkrh59jczko=;
        b=FaO2937T6TyKePeQMkKsJ0gshNKf2FchbIvTfYqWknnItWIh/TEd7nriy7QOPQHREb
         p8p13bw8+8RKbBOHbqlFvdxWwjOa6g3Qm2CVraDaRZxyzU8vn+GrtFeCig+FwI8+XnYN
         1BhT8LW+QExnFOhPRsQYp/dEUfCmo3HsPmqeL5zfhnST9aOCmesEco/UwaCERZMtb6Jd
         h8Wj1RBFJwuQ3QviLwchyChdv2l2qQ2wZdXUUhxlUyOxgbEK4a22BJdU5a4+XwvCFMYX
         FR4UAVCHPTxA17TAhTK9p7c5IX9SepiAGjEfjB2UDkj1jpN+PChRfTjkpzSUb0Go5+D5
         gvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769588363; x=1770193163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k51npGhFF6R2OtGNT7VVc7h5xVQp5l2qHkrh59jczko=;
        b=whCa2pvMbl3pYmpCcTLB4arqj7Dr7MUQTzqlQSKMXwmvpw8JA6u2URmpzvJFjlVjdB
         pjx97XN/e6ZzVZsBCvYOTOEqEADUoyglMN5OQ7C39nfxmfk2Y5NOQlKCD5K22z/Uwira
         cyhyeqEc+G/rDRB89FdRZfj+GnqRmuo3pnccWs2T0xib8TKW2Q8fJ050x+YgbW1n6Dpg
         eaaYL2/EjLMRVpDUnU/Eu/BeEUiq4qhwbaCiFy4nhU9X/2cKwqF4Bu2RtAl0NQy0CKiM
         whO/ZE2Xpvf8RSOALZwJgZRwoGlb0k3o09GwnP60BUm1Brnl/KR5igAYTRwIxVprRWb1
         648w==
X-Forwarded-Encrypted: i=1; AJvYcCXKpj475P+JS3V64joZL6DAfASe9CRBDUPP8Qly98orBac2Hta3bhugbprv2Ro0ny9VcvlFHqrPpOM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywekn/c3oLuzxFX9YryHkyomzWS06NmtFnyKLQdOX1ww+Wap+qj
	S6xkmP+cbWZs5KV20BAFmcWlMqiq7WFS3ctBiHbf4/+dVsxnnmlGg1VMFIqQ+PhtcP6Ugkz5CSH
	aObZZA1zeFlHyL47E7Z6Yc069rJ46moKjf8GO3opduUHeWf4xA5XOGE+3lHLA8yU=
X-Gm-Gg: AZuq6aIxmVDLqbGVNQNQ1jKE2s7+8422Gl9UImBrlX6V2JBSJrnC84bDZJaPEqqvAAT
	nQFFOqRDfs3BpfwuSbjxh84dL3r9V39NQ62HfW+ngtAan8Hw5V8vr+G5qg1K3hxb9QcrJN4IuIZ
	wZemEwmkkrUtYAFA3vLq4l6C1aPglG2PqlsNeC3Y74ozofI73o5KBdjKaz3KtcNeQU9oKiwUwnv
	rhLps8xRIbY4dZMLe5aFoI6k8MSqpbGg3f1utj6n5z8D3Q/K/PYme8kSCpmyuQLpVchNCGamX0i
	99EkLU8EjidYtl5DLG7F5awx5GdZiOqdpsBlkn1vETT0AfjcRMw+iI557dxHy4MeKZRH6JwvO4D
	QpRt8W93wQE29zs5hVzzXzcsH
X-Received: by 2002:a05:620a:28c1:b0:8c7:33:cc97 with SMTP id af79cd13be357-8c70b841397mr552348885a.13.1769588362770;
        Wed, 28 Jan 2026 00:19:22 -0800 (PST)
X-Received: by 2002:a05:620a:28c1:b0:8c7:33:cc97 with SMTP id af79cd13be357-8c70b841397mr552346685a.13.1769588362315;
        Wed, 28 Jan 2026 00:19:22 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e490esm5004005f8f.9.2026.01.28.00.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 00:19:21 -0800 (PST)
Date: Wed, 28 Jan 2026 10:19:19 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 6/8] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Message-ID: <lccj743lus7hhn76xrcajjnms52nzm4zlul3n55l4dxyicr5yx@2upvvfapbjls>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-6-b23de57df5ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-purwa-videocc-camcc-v1-6-b23de57df5ba@oss.qualcomm.com>
X-Proofpoint-GUID: -M8s2fvFRaGMz0dqlED_S0cDI01bPNEw
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=6979c68b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=wZ8H7fhid0mjBLlCKuAA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -M8s2fvFRaGMz0dqlED_S0cDI01bPNEw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA2NyBTYWx0ZWRfX9GaitEGVNFhe
 yx9Czt8CNFw0G/h9Ok9VSTJqpEGBic6VfOozkki3ZnpJjxeschHqDiRJVSyDXg1zUA2r9ALnYdk
 s20bWoNGqayO8pxINWArDs3ub0lAhEgisGbQ063PuJZKAz+sVBy2b+nm0v8kdo4e5NBw2BOMvbQ
 ntPIlSoDBHTrjJGT3LCOnHlUV7ZHDYdWKCTsjUGo2HAH7FcezngLS8hdpm5XgCYaokSNOd1SxHw
 SxMz8w1c/Jx8WObFJ9sfXd2HQEr/8JOh7TgIAMq3e64T8BELqc/pOmIepZ0s8FbPpLGXguXZ2+i
 9FDt9/CFKDe940qCtfqZs3dfnwAsmpbE2VnJrm4+vgem5fq998VGYHyu7ThfCMQU0dzQ6/qu9hC
 bp/AhwLq6G6w/w2LXSB4wafj/mVZJpP4+80Fom/SqXDdpVTuw9+VtepXbk0W6bwZtyb0JafmtC5
 JO9vic/MyPfX7TzER5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280067

On 26-01-28 00:56:37, Jagadeesh Kona wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
