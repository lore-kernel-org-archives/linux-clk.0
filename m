Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BCA1CD1E1
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 20:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748635991; cv=none; b=Fx8E+/nqK0BMj5rF5cGKVZhZBTABM6RJ2kZRKfIgRM94lIoePSaonzparoP9oEIjz0bzLi3IXwnMnXtUGKLf84XPqIUNbN4SzSAmmmkdtm4P1ZscqOYOtxW8fPiimTolJZUwzqYruL8RjRji1laTJzwk1WxR7bj0AfiYU6OMbSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748635991; c=relaxed/simple;
	bh=hOe5SI0lYjyBYrLnsonVjJMdxbf/sFZk7MQhcKj8NC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQKO6WU7qTMfPCl7KjbwvHcf+z5ax8RKUrr6LvtRbmi82MDWlftN9lUzmr5Rrc0NrXoYhvYRsyZEC+vHdEeNMeo8sOXqqkwRgMvRJTRNQMH+a9ywrKTn6luzeKXoH1B7cuGmpVQPUpBEsPtuTEEXNBS9/4DwPqOlPo6rhmLvE4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfirfARK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfirfARK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBgIWp003603
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 20:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OadsK1rEyJ0H/6UeuCVG3zTO
	8HatytaJI7W16ZL8R1U=; b=cfirfARKU95wLmTLhM1DWv+6hCK9/XU6ApM7UDVy
	/MfEZhGslm/IOaZTSrX0RSap2IMua3gcVB8bpiQGgwIuaqWpidbq7kcSPVdtgxFe
	Q5/8GWxXK2tj0oWHgLVqg8TIzcjbyYZcp74YKStItp1gQSL43zmZb3jWvNJmY8YO
	AlwXClASF304pV8ET2tDoIN/C49C0TmXVgslCkQ+OANDjhqs91g4shygvwKBBvKL
	oOX16ZjdGC7ufWfbwWQY/oYI/6UOXDv0yuXMYuXHYpfzFqMYimp+50gefeLgBRw9
	AjJIFW/lHOULrVJ2tgGJt8gYXTv1Jv/tbi+YX7GpiHSn4A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549t9gh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 20:13:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c9305d29abso381421385a.1
        for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 13:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748635987; x=1749240787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OadsK1rEyJ0H/6UeuCVG3zTO8HatytaJI7W16ZL8R1U=;
        b=f4wUj5ADfBw6V/M9AuJil0FptOSEbscOVTUfs/6exrrZVX43IvIVq2KQea54vxRR/i
         O4mm74Hw5dxU2+MUXgQlr1ZGtBlpT8W3oUAejiLPPEz3AtJkmZmjtXWGYzFCV0rOLVMD
         rOZmnz127UGeSyN9ZqUDh8Ay49A5Ri7I7mRETlWgR5RNm3bwQSruHfXhR0uSnWgkMVoY
         MWrLGHcE7rFJnL6fGZtSkd+IimHmY40lRSk4Z2RMR3OQOnNVSrDtOG97qYEoxEz/Juc1
         WIOrDS3coIw76S8FffMrIOYOuzi/RMNnF6eoaehBMUUXC60s59ctzpU3s9BMUsFZmvfF
         keyg==
X-Forwarded-Encrypted: i=1; AJvYcCVL8p8pHG612QvFzA1i8nHR1GS0Xfbkd3+zjYxm8s+64T0OkDAI8D3SPf1sHibFjsAaWbVXd/9ru8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQKuJ2FGLaPpsOlpanMtCUsE1LzAez0zsRz2leMBcPt8IUDJ53
	NDtWlcoeXmTXsVBj2u5EtQ8AwX398GSHU/AKRH7PVBF4YwK7H1DBhaHbZhBzWLwrtrv35O/d79x
	Ffzrsw6ol06oeR8O1FPDjf6ZRUpA1SgNcD6nDFUw99ofMmPdqBHKeGmQ6sYx5DF8=
X-Gm-Gg: ASbGnct8mdOYI9Sf2ZVEBukLJzJjSdzw2w+D2MdZQ7GFNo6XF6UxSq/du2Sxn2y+f5z
	r5Nq99w8fIPwZUO4P8b2/8U+zTIsoDsmtwEnPNfQydFjNWnvMLzO7WgFvVPqdl37B9+S5Csp7r0
	8NI7mXnoq3xUhHNguIBdF4hv15OkyRFVCjY1xDWPlDPGpRTaOT/kaAKtAE7168fQDj7kt2OHvIT
	hjPVFDi+CXS5M5wO2mYErH2tOrRdwvf/N1QhiiM++F2GeKjDLcaTkjC9o0NyyI9lz7qe+LI30wq
	kbeJOQIgwBZcKLLPatbSGT5fmx9cooSHCmPOnV001ZpkgExvTzZGvVmK5+3YRnoUxQuNbodTgOk
	=
X-Received: by 2002:a05:620a:2796:b0:7c5:5d4b:e62f with SMTP id af79cd13be357-7d0a2016d83mr732918585a.43.1748635987453;
        Fri, 30 May 2025 13:13:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAE89MTxPgWdO4i0WDxPat+2lBREnl7QdMY9f1fr5cgF/Pe+0swZFpwTEUR+ykqh7B7ZTwzg==
X-Received: by 2002:a05:620a:2796:b0:7c5:5d4b:e62f with SMTP id af79cd13be357-7d0a2016d83mr732912785a.43.1748635987070;
        Fri, 30 May 2025 13:13:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85bc507csm7159961fa.71.2025.05.30.13.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 13:13:06 -0700 (PDT)
Date: Fri, 30 May 2025 23:13:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v2 4/5] dt-bindings: display/msm: add stream 1 pixel
 clock binding
Message-ID: <lrrq7cj3kw5sk7y4wjvbdvjf5qu3cwbhreod2twttvejcxtfzd@eygjcarxxd7m>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
 <20250530-dp_mst_bindings-v2-4-f925464d32a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-dp_mst_bindings-v2-4-f925464d32a8@oss.qualcomm.com>
X-Proofpoint-GUID: 9s9veIh19W-nQ-mrQWRD6Nb3SkevE_zm
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=683a1154 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=s_08DJon4HIwgivb4r0A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE4MCBTYWx0ZWRfXwqOeKnuqmlTP
 tfd44t3TFYPIX2TnWLqNhxjLMltcPKzt3jIzC5VRJ3PzRP+BP0288DuANpdRobQNifVb7ekfwcL
 JJDljCNgIvQN02CZ2FugQTMK+jYdY5ZZ/aP9GoIUakzNozajZp1OUA1+R7drYE6OorRu0VVTHHw
 vZ0rIBNFHXvSsbN1rfq1o5qMLecp8UADO7d/4XTmhcSc42G+wfDN0S39Z1IpfmLCM0eCrhZbo69
 Lx6PszAdKeqxDjY8lAcPsKrOdXY/B9vpUZBL1l9j6fnLHwpN7XP88B05eePVrmmaY0AIk6LKeel
 cDGxrKaRJGKdfS4P2rZaTNtnu+ItCiw4rBGMvbhtwpD0GuXf+CXBePlSnm3EhYUWPLxe6Ck0Gxp
 a1iVYyX6RihIDolZJUOrBys0NOXTVydRCmMoeukB9U+xjYssgX1Cvznc7lebFGUoZcLJxkhn
X-Proofpoint-ORIG-GUID: 9s9veIh19W-nQ-mrQWRD6Nb3SkevE_zm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300180

On Fri, May 30, 2025 at 10:47:27AM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> On some chipsets such as qcom,sa8775p-dp, qcom,sm8650-dp and some more,
> the display port controller can support more than one pixel stream
> (multi-stream transport).
> 
> To support MST on such chipsets, add the binding for stream 1 pixel
> clock for display port controller.

If I remember correctly, some of these chipsets support more than 2 MST
streams, which means more than 1 additional pixel clock. Could you
please clarify this?

If so, can we please describe all clocks, so that we don't have to
return back to the topic.

> 
> Since this mode is not supported on all chipsets, add exception
> rules and min/max items to clearly mark which chipsets support
> only SST mode (single stream) and which ones support MST.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 36 ++++++++++++++++++++--
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  9 ++++--
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  9 ++++--
>  .../bindings/display/msm/qcom,sc7280-mdss.yaml     |  9 ++++--
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  6 ++--
>  5 files changed, 56 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index a63efd8de42c..81ffc141e00d 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -54,25 +54,31 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 5
>      items:
>        - description: AHB clock to enable register access
>        - description: Display Port AUX clock
>        - description: Display Port Link clock
>        - description: Link interface clock between DP and PHY
> -      - description: Display Port Pixel clock
> +      - description: Display Port stream 0 Pixel clock
> +      - description: Display Port stream 1 Pixel clock
>  
>    clock-names:
> +    minItems: 5
>      items:
>        - const: core_iface
>        - const: core_aux
>        - const: ctrl_link
>        - const: ctrl_link_iface
>        - const: stream_pixel
> +      - const: stream_1_pixel
>  
>    assigned-clocks:
> +    minItems: 2
>      items:
>        - description: link clock source
> -      - description: pixel clock source
> +      - description: stream 0 pixel clock source
> +      - description: stream 1 pixel clock source
>  
>    phys:
>      maxItems: 1
> @@ -174,6 +180,32 @@ allOf:
>        required:
>          - "#sound-dai-cells"
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7280-dp
> +              - qcom,sm8150-dp
> +              - qcom,sc8180x-dp
> +              - qcom,sc8280xp-dp
> +              - qcom,sm8350-dp
> +              - qcom,sm8450-dp
> +              - qcom,sm8650-dp
> +              - qcom,sa8775p-dp
> +              - qcom,x1e80100-dp

Let's get this list sorted alphabetically. Also, do we need to list all
those entries? Some of those use fallback compatible to qcom,sm8350-dp,
so it should be enough to list just that entry for those.

> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +          maxItems: 6
> +
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 5
> +
>  additionalProperties: false
>  
>  examples:

-- 
With best wishes
Dmitry
