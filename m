Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75379230BE4
	for <linux-clk@vger.kernel.org>; Wed,  2 Jul 2025 22:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495353; cv=none; b=EQM66So5Q+EFtFeg+qOeFM4Fm0KsQXo2DKgkjKOpytIzhg14y/mg6YdCJHz7R2BWpou2mLE7roFwynWyQZyZWZDRUHnhB21J/c0u1xtDzCHjnqiG5ybi4whqU9+OQmQbOPVdv0p4dkGbqsAMeT/n9AFgzc+jsu0GqRqsvyh1Gb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495353; c=relaxed/simple;
	bh=up5bIfuRe1fh3Im2a2gPebVavaYz7/DHfHtuntIyrf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NszH9sJnATfSZHFR+VkylP50b0o6FeHI1irsIvfYvd2+dtW3dvnhjomcQhZAuEaMTNhHMmIlaLyuNs5NxSGMwe+jLKr0jhpWQQSfH/ldmsU8NX//hfu8rHzrEqNPo0KFvqxxbDc3JYnhuW4Xq0ESG5HEZRud2djcK0ZO3Zt/lhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wz3TSuHy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wz3TSuHy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562CRv9K018560
	for <linux-clk@vger.kernel.org>; Wed, 2 Jul 2025 22:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BgDDI86k+9nrqehhROmR+AQC
	x3airBLaLzyH+/CSltk=; b=Wz3TSuHy8B9lSuyMjnWMsvL8ffmgZOBUjpAb9o+B
	WxvSXCHUXubtjRRdR8Hwf1xFjBDhL4n+XhdVygBtclHUPRU6vCW1Utc2QjFVGEyv
	EDWTZd4a2i42N8SKSwIBMNFqf4tlzdvsoinqos4/7/6Wp+G02mGS/BKtZYEqptXc
	fFpaqvJcU5pUSWI9Rh30GRqNYsEvErvQ6IzXWIVtx9HZc6vuEIaMlZXtABs6+a35
	g5vz8OPC3uJcuGso2lHWIfYtSiP3I3QKKcg1l4bKfsILU2ZJCk6G2cvkzdKSXcTh
	3177S7rczzTCCKpAyZPFKaeOAxn4r5A4zXgNOBqt4F0Agg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxp9hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 02 Jul 2025 22:29:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d399065d55so1005223785a.1
        for <linux-clk@vger.kernel.org>; Wed, 02 Jul 2025 15:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751495349; x=1752100149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgDDI86k+9nrqehhROmR+AQCx3airBLaLzyH+/CSltk=;
        b=QFde/Qyiu2aTQ154h5jhtrwQIu7zYF5t/SpH5+f90ukHNR94LMrDw24gtXFFMG4iXs
         w9JH0X4CSMQ3sGmU5EqVBoxVTpxELq9v4PqeIoUJrxAYtvLTZDCApoX/optkzsMFG/AG
         F17rTm0LixkuYZ5rDC4i9Kdxwhsuttt1HhrBVHZHd5dRDrwkrBOyXJaVbsulA9W4BnqD
         kVYkGpvQ+BDVzyVhzWWQ4RE5u9yMRl/Fp5KIUVU2p1kjyiOAA7A2C4drv9Bk7YzDGUZV
         wJDjp3PFU+25M0GxE69+bMtLi1EOt9onQPNwh+djwSnwVl6XnvJhb7fR9/wbOKbfNUM4
         cItQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSQ4oSqnAPYzhl738o7eU4wc3TAvrCwfSLUJgu8iQ0d+nett6AHxY/xWja9rF9j/O+o+oDY2Avj58=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCle4K8lfP4VeI3w2cAt/r+bQnVzAWCtm+Wu9PaHqEEDF2+qDu
	xkQqX5CivliqM9KEUcN/UbRNGeSJ7yAHMwD1T8l6LAZE8TBAXDZyXh51zNuroL/YTn4UkmeEr1y
	15+E+vo+qXhAj/QzI64CsW77Hml+EV67S0U9pyXYnInLuGXz3o+gmJCkvT67ydmo=
X-Gm-Gg: ASbGncvJ5M81LWjPsH5TTTw4GzJSas2mWkxPQcnJdmyw3UIDdqbikRalbWDTQCRA4vK
	c/ecpgZcVyAurEV9/d2lw5DLR8YWX99fHQK1I1sqK6qJJQ9jyw3cixHeGwby+dHTPFj00loI5DI
	IA0XUTd5gX/zZHMHKMN4S6bJY+vdCOepqw7ybPx573NIeCVT6sRCZGTOIm9dGACsEuGE5hsOcwm
	x28BAH6qj9o9c+5jDh7hcH5v9BtaTFTx/VRVBTlIFl8kbvWn3H7NAK1pIlaFaiSL07ZCOX3YePx
	0XfRd56XHVkBpZnni8sNm/buG56HhVMc6yWgv5pAuktOqlTZfWhxXSxigZwmQ2SudFaBz5R8rXz
	DLeTDhy5PwHcamFDUOXwwyNwEdm2CjRrPYRU=
X-Received: by 2002:a05:620a:46a6:b0:7d4:5c30:2acd with SMTP id af79cd13be357-7d5c4717717mr613057085a.28.1751495349316;
        Wed, 02 Jul 2025 15:29:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrSVTOJQ9y1rva3UBmjLIEBviVC9kwZsRJcNapTvyl3wOwWuQm4n9kgbG/8VBXUhQbv5kwMQ==
X-Received: by 2002:a05:620a:46a6:b0:7d4:5c30:2acd with SMTP id af79cd13be357-7d5c4717717mr613052785a.28.1751495348903;
        Wed, 02 Jul 2025 15:29:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2eff7dsm2261580e87.246.2025.07.02.15.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 15:29:07 -0700 (PDT)
Date: Thu, 3 Jul 2025 01:29:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: qcom,videocc: Add sc8180x
 compatible
Message-ID: <mzmer4g7df7xqhnstpfhyzcm2irpmsk4iwtx6esjksp34lpkk5@76lrsoyb5cp6>
References: <20250702-sc8180x-videocc-dt-v3-0-916d443d8a38@quicinc.com>
 <20250702-sc8180x-videocc-dt-v3-1-916d443d8a38@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-sc8180x-videocc-dt-v3-1-916d443d8a38@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4NiBTYWx0ZWRfX+pARH85YvyuN
 DzviEUUlcY2A39hQU4Yrp5fMHGIsOeT3mRUlThRWiAeDZ5hO5fa3TkNMHiK2V7zD3f9fdaNyXd8
 9tnmR2RozpkuX29EB7f4M+4FqMSQEo74g3xptcZQowtjTVUUtxj8JQK+kSuMXlKl4fcbPwVZLPt
 9jzZuS6C8R71BtgpsTggS+awNg66l8gTQxu9mxTktky/4FzxKMf2IyfY8lHQ84bWVEIGTzn6qKl
 fJFiN4yQBccuE7C70TVi30QV4ET03WlWYbbclsGCWyRTFTynrrnDxpNPdE3iFCRNELZ9CNcpXX0
 g9hYqow2tPhDHe8m+N0eDLRnEvf2avrMIM5PgQM+ktUTle5itr3mjLyZrqNxFBEIUEnbLRXJQ8B
 5d3njUuFF0jKMoOpH70TDyYCROIunY1xBYrcSpWs91nEh6F5ES0rmr8jU79ABTwcikdWSv/X
X-Proofpoint-GUID: ChuDVH8pxYeNBtCEyh9ZaqKAT-ra3xcY
X-Proofpoint-ORIG-GUID: ChuDVH8pxYeNBtCEyh9ZaqKAT-ra3xcY
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6865b2b6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=_TNEKbHo1ymzoaDRxC8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020186

On Wed, Jul 02, 2025 at 08:43:13PM +0530, Satya Priya Kakitapalli wrote:
> The sc8180x video clock controller block is identical to that
> of sm8150. Add a new compatible string for sc8180x videocc and
> use sm8150 as fallback.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,videocc.yaml       | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> index 5f7738d6835c4ba999402e163fc85a07e3a47a5a..b490caaf843243a7a96395fdd2b99972a45679f9 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> @@ -23,13 +23,17 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,sc7180-videocc
> -      - qcom,sc7280-videocc
> -      - qcom,sdm845-videocc
> -      - qcom,sm6350-videocc
> -      - qcom,sm8150-videocc
> -      - qcom,sm8250-videocc
> +    oneOf:
> +      - enum:
> +          - qcom,sc7180-videocc
> +          - qcom,sc7280-videocc
> +          - qcom,sdm845-videocc
> +          - qcom,sm6350-videocc
> +          - qcom,sm8150-videocc
> +          - qcom,sm8250-videocc
> +      - items:
> +          - const: qcom,sc8180x-videocc
> +          - const: qcom,sm8150-videocc
>  
>    clocks:
>      minItems: 1
> @@ -111,6 +115,7 @@ allOf:
>        properties:
>          compatible:
>            enum:
> +            - qcom,sc8180x-videocc

Is there a need for this? Isn't it already covered by the SM8150 entry?

>              - qcom,sm8150-videocc
>      then:
>        properties:
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
