Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2A130F950
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146665; cv=none; b=Fa4ATojDlNQQrXL7rFT2OdaKMXkn4YAfciCim9xfm4tgAcxENarvr7OfqUx/siOkmpjIZGRY+qvhB2rG9pr49c08dZSGW4d1iaTitRFKL+WkrL4bYWIZQSISMoqQtfPRNgiHSWatRys5ZWuj3fOJ4tn5PWvPDLNXaZO4q6Vc0l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146665; c=relaxed/simple;
	bh=1VPX8FrYAEwKjNsDi3aHSl+yDtUX0tYMIGEHCYztrfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=keqaW25yeG/oUCQgw3WycKZmJ1yDEIw7dNnP+bUaI/bdxNtIXiCaVBFxgBFg6FD1rHpZsP7r6MMCRXZ2z9DQWrfmItlGao7sqM+yN24Q30nSzNP79gIgCAJ0SKxnkjtavDVVtWqTH0AtmZ+glbqV7SJyn1MvSR6bhN158GFY1Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eUxyjcRL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8VtFHDZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUxyjcRL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8VtFHDZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ5M2N22655357
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1JLHqADQhufZFw2ks1IdIl+O
	j7Um7DxqouzyTlqWn7g=; b=eUxyjcRLASWIQBTMAGXIDrdecegnwsk7SPjFgrU+
	HGl/Y4HmK2HmxmoIHa1w6lkLtadyicaeFCfcZqDyoYmBb5lQENVpHWaHT01BjajX
	6aBRoMeN0uD8h7VODhIlNB4J62OstimCixiZoR2kmB1+9FMqO74wccI+7pvg3iuj
	PVywWJFLqT4/YNCVEjy6m/v4eS/uEAfDJ657Di+886XOF5fEaO75n38w7AQBWwEl
	wPN1R0FxWgPNTLN3f/y+hHB6O04PQPe0Tl1vsY4THjr/BI62rEEmhZ8Au9OSaZr3
	usB3Vj+KgnalihS4A+nDgxG495ffWDgU84agjToX4whTNw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an9fxunhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 08:44:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-880501dcc67so257774536d6.3
        for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 00:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764146662; x=1764751462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1JLHqADQhufZFw2ks1IdIl+Oj7Um7DxqouzyTlqWn7g=;
        b=d8VtFHDZJrndS6yyNk1vwr/3ZvaZjJ8TtOTTNOBqzBI3qO+tbNVbJ2YQmR54/h6gnb
         jNJ1mEIMuCRWBVQTq+4M9G5z95oejO0r+1IgOuB/FzF1cfbZz8QSNr/RWGaD7UH9MCcS
         PXVGzWbLJL4kSclkZNdFKlw8zt+NObYqOQ3m+mhxsNv4qKkM0vZqhzHRPiT0kNqpOGxb
         qgKJVAmhFk3fZpfq0SRjZ9TTk8b9ItLSOwCuSdre2NsPoOUAq9mGjL3n+BoATi0vesbb
         PJewEFRAyryCKDke4BWGdBNrbysMioievklMt86N7L/0lGsMRSlg/ViEBigK8H6RxCif
         srOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146662; x=1764751462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JLHqADQhufZFw2ks1IdIl+Oj7Um7DxqouzyTlqWn7g=;
        b=RsHz/WqpAiAl/w1YJKrWnrIb4U0C9HzKRpYgDxX3+VHhQm67YTqeoWI5PLqDCr+unf
         2XWvqInOLPd+/1R/ARE2fvPCwU1argPo0fUj3HMz8QQADA8RjK0HE4iBK71cI3jb2E/3
         haJBCmvz7DVRQfqygmDgO6JR5OJyxDDQuU55I49AYHe3tc6zv/jmOObK68SSwxyNgKpN
         94QF+1zoT3/OqbRNP1qSdKsVTE4VOpKBzupqn2QOhLpe4zhm2xeoBPEZ8JH6+KGlDTMx
         1B2tOjHTmCSRpfX7ExVCtwT3uWK6FcmdDDoYWuGk011j5YPxsOnD4J/2Y345Gq8tZW+4
         O/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGsI268euOz5oEiIi5nbdYdCyYtN0o2Oau8NXzmPFru/WXUlkG2u+XcqMYdeYkmS5MGuOjiW5y7gw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1ibiFZeKgd1jWurZxOXep2FNvzdJb0TPi75gANFLuVZXnz7yL
	la1u4fl8E2iHvCQacOQWzHXEsMqPbPrVmR8jXec+Z+kNnF2bGh90gF7giGRjOQmYYGs+LWQo0n/
	sqbud+oDxTV4z1uDNnFPSNr3S2xWhyiT9O3hr7qNegQSpGnsxVddNIromDP3ZJ1U=
X-Gm-Gg: ASbGncs2nFEHATY3G7WY0uZ/uaSaCHBvnGtDpDzntrspnPYCCiCc47geSw/xKmYhxmk
	6j5wWZWpym1I2bS3fIlat2AO/MeRnsJqA88aDL3T9dukmRkpOq7XmuLOFmYw6NHwxuY+kP4lsaR
	vN/mo/VktcdISP6C55e3niaql70pl5wJWhTzgVYMOfC2DIrV9snigVN2PqCYQYC7PkoikMi30Ro
	7ednkPp/moroASt2MdT54Rk0kIYv/AAiPF8y4/HSQu5kP0nki2HbZghs3WAvu5yTCnzcbHZMRPO
	sFN2bgnwpw2DMhb7YS7YEIjxuhoO4Cd9/afEoqkYYqIBf8ORrVbZ4cuVfQkMBDsl1kUD+/SDGLM
	So4K4L5ACjT2Wo2XUBUo4r5q1SMJiWcIQFvrqbF1qXzXwd9LLx+TyGurro7h2OREc8ilUk1r214
	AOgPgKbxqatMGjjSS/1WnaY6M=
X-Received: by 2002:ad4:5743:0:b0:880:5cc1:6941 with SMTP id 6a1803df08f44-8847c539cb0mr278771286d6.58.1764146662010;
        Wed, 26 Nov 2025 00:44:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IES2wbK4gc4VUKaMlYVDrahRc7R6wUgs0miEGXEXBNKtKCdDb5/cjQml7XmCT/4TAFPDLieRw==
X-Received: by 2002:ad4:5743:0:b0:880:5cc1:6941 with SMTP id 6a1803df08f44-8847c539cb0mr278770966d6.58.1764146661585;
        Wed, 26 Nov 2025 00:44:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db756d3sm5893413e87.14.2025.11.26.00.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 00:44:20 -0800 (PST)
Date: Wed, 26 Nov 2025 10:44:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] clk: qcom: gcc-sdx75: Update the SDCC RCGs to use
 shared_floor_ops
Message-ID: <inwgdfbec5fjmfh5teonixnuec7yph3nzrh4lk7yb3ty4brhnt@5npz7cnquaao>
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-4-9038430dfed4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-4-9038430dfed4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I6tohdgg c=1 sm=1 tr=0 ts=6926bde7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=uvKQzzdzGMHFNaRMtNcA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3MCBTYWx0ZWRfXwjUi7EZIEoOu
 H08idAq96Utyod62uyN7VA554puzVOmAK6Syfg2DBLVG2aCmJ3/x9kSPHNOfC04hQBgKiih/2Qc
 8X40tZrbHe/+SIFOYPUdwyx8bLENjN484ps90nJvotvWqQx70y3IejdT5SBXGZHtc5b6gzII1fL
 WST32gvNRBTzie/twcyCZv/GWi7vluUnXdKkXYo+F+cWpzWDwKbDBnnP11+bqfdcyw+L2Wrvoqv
 Nl118rEmlo6tG9PazTX+U0hR0FyxqBCVPQcL30LjdgEeXJUS4O3wZBz04xPVwt8psDV4fbM78R9
 0fRnmORggmasGgqqaHpiQvk8mybSPpPosMnLZdMVA==
X-Proofpoint-ORIG-GUID: PhemwafyfVb3jnkhNsZEh-V87LuwkO6s
X-Proofpoint-GUID: PhemwafyfVb3jnkhNsZEh-V87LuwkO6s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260070

On Wed, Nov 26, 2025 at 09:45:53AM +0530, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: 108cdc09b2de ("clk: qcom: Add GCC driver support for SDX75")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sdx75.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
