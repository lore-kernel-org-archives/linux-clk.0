Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB4A37474D
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 14:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634437; cv=none; b=P89LddakU5LeIVu9TvmO2FIXcyauTG7341zLhCXTMZ6WCYGea3fx3wu96X8K1zofu3cVBTx68/e+nyMin0Zcm3GAvBDtplrhjczi/26cJ7zDtruPMAll6pJcMsYB5eiXE0XghRDwJ3CC+EsT46ww9ylz89eu5WaCPh7VjxLBPsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634437; c=relaxed/simple;
	bh=AYtzeDqeV0zgh+xREkN56wB5I06MNwE75vd0KP/Vscg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiOZoo87gOtOTzPnBMN2UraRLPYBWfDoUGbtSvk36qEukBcHMNwwXsjO3wi2fU0vRc0q6FmDvtB1GWejsgpfkPXQPVujuaFPE+VB3un7ap+S8dqHYOzg/hGdf1+OyBz3+3DYXL7ADCpHWWagEAvvibMJcyvecvSRLaE6ejNMspY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=guvYIiBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/Zt4bpd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="guvYIiBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/Zt4bpd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624D9Qrw2861379
	for <linux-clk@vger.kernel.org>; Wed, 4 Mar 2026 14:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OsXv7ufwdMilFRb6MU6fz/d4IdGrO64/6HMvep69cvk=; b=guvYIiBfmhrKPLdr
	YjTHWDM+zkQ+8/uo21bwiA1PF9ElHw2M+kqXeg7glmQVWEzN1bq3xgEe4Hk5QF75
	gX6sM2osGBVAo4rA4Y2NyR2D1hKb3w5KCSuSOUwI64gsXlE/A8wBqgEh9VXh6ROi
	wLqCVqznsJdjXEu84roq6l5VtbdUZvwq/KNr8xm29U7buxLGqCW/z3uAUMbGZthF
	Ubd79tAbf61JXH8MfanWNhbytw63Xbqh8kYXLpSp0wOK48L5whq2RJR+ZiPFakQ/
	LeGdo2TlImzkspWWWj9EB8U5/3pm//HCEkNvV87UVXhm83MPw8lPo318q0W3HxXO
	GNA+yg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9m6cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 14:27:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71655aa11so6249173285a.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 06:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772634433; x=1773239233; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OsXv7ufwdMilFRb6MU6fz/d4IdGrO64/6HMvep69cvk=;
        b=g/Zt4bpdfWAbrs00gzSlUORFr1gPKLZSR/wmTRBD0UAwOkygfdSLIG71FKJfx10elN
         1iElU7rvAkSELSKcvbfevI2KGyx7sWKImshx8SkWJud1v1fzJHMzEkbUtsEeshHlxD0a
         MSkV3N4I7bBO9rfx2yPk7g+LDCeTR5zKsOkQHEm4Z7aR9KkT3S+0/ZX2c/QWfJzMJzkx
         viGH2135FhncOysqk0Jlbr7k4F6G9EytMA2y9tlitOyQLBjj9ZScazJ0kw1DZzm558TC
         7SQy6H1eYmh6cSNtDScj2P4RL+xGlmzFkUqyMSwcl+/OtEerlCN0vL1bfTbDR1QlFokp
         N/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772634433; x=1773239233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OsXv7ufwdMilFRb6MU6fz/d4IdGrO64/6HMvep69cvk=;
        b=q0HylEKRKdXH5O/Gn9RoMaSdvniWnBLPSGSQ70UFet5xGXV3kFmWOo0S4jUiGs6vRV
         iMBHMNQ9RE3/tAYtvpQR5nzOEGUa//+KuneLbjG/uxmhKIRDpbydoeZA9P5Moew6cP9n
         JkHEptz0AtaxypvogW+Qg5gGWqjvmOie82+2vPKbcvhuRMCcLiWRB7XbmDbGP4hDibqe
         llg5oomB8iZIM27lDK/dX++nnRT/0DYkQyCUX165+nupmKAiCGaFNFVK7Z2o6H9Hcb/6
         fPX6RvMdK9Rh/19yrYYE5a6aJSQ1oHnoXbm0MvKrbrh1sgS4jMh+FxYqiEH9C77aw6Yn
         pyXw==
X-Forwarded-Encrypted: i=1; AJvYcCVCUs7XMllEIB1lxG4ayM4x7hVAlSy58HfEuwkOjGfMPiZFm74VfoTTDmi8RrpCDdSxD6smnyTysLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDv8oP3OEMOwltJKnHzYnBhhMGSf8Pfk+ZbZivPPlNGBL2eOXz
	V5O3mthI3gePmyRJMOUF+EhaKlVxV7lhXHSBR+9tU/3gS8dZrAiRDPmcTITpZXFG57C/aEUluTR
	ogQ3uE847yEb8lh221TfHlZSJ9LfrnHl9VL5kHsKevv+nsP638FjyakqVEJyR8EQ=
X-Gm-Gg: ATEYQzy0NOPmeC0li3YTZMbi6BOotfLua1z1N3M8ClMiEzugCc2EkGX4g/LQnvY/FaT
	R7lIB9N03Q5Z4LpPHKpywpUgLGJUmahXcmhKvYdkAz9cEjrn1m6rNSiqz1uv1De+7elmAj7cTiY
	4F5K39u/+NryHk1Xa7cC3skrE+G+Kvz8utilBVTNUAsPVjsPKSIfCs4cNU7UDkjjRIGbLPqCS1c
	HhPxfT8qlseetHRwYAkZ5J39cbpZ1fS7cDtcR6w8pOV27LoIXLTcmEUtCHLT1urYRFsgFwBDFdz
	cBEvWh5jQXqX9OUUOUTiai4VSBriWAuMHc+VdMZS9aaO0Jd+pDLIO10x8M/s9zFesb30NAYlT+M
	dWMCztkgHMSMiKc4oiJZzbNvU0alUiuOAjKanKOuJ3qqrNyR24K3BDRh8uvh7WciShZbdKjR+Xz
	pWx/4pvvoQKlpnqFZ2xrH+c258Mib/zrAjeK0=
X-Received: by 2002:a05:620a:3949:b0:8cb:fa4:7b45 with SMTP id af79cd13be357-8cd5afb7867mr240909585a.60.1772634433299;
        Wed, 04 Mar 2026 06:27:13 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8cb:fa4:7b45 with SMTP id af79cd13be357-8cd5afb7867mr240906285a.60.1772634432831;
        Wed, 04 Mar 2026 06:27:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12ebffe52sm148372e87.49.2026.03.04.06.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:27:11 -0800 (PST)
Date: Wed, 4 Mar 2026 16:27:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 5/5] clk: qcom: dispcc[01]-sa8775p: Fix DSI byte clock
 rate setting
Message-ID: <t7udcsoimdm4lfbeh42mgvfe7raxlk7nwgoimxddwgpctwukpp@abueuftzmz4y>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
 <20260304-topic-dsi_byte_fixup-v1-5-b79b29f83176@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-5-b79b29f83176@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExNiBTYWx0ZWRfX0F/sk9NpCBHL
 JsL8bt70gv3gCg2d4ma4uM5O4TnvHdxndbrYwEXJgIWCA3z8/1Lkf2hGcjpYQ5OkU2KjwAfNXLN
 2Gut1qWrceoHxpOfYz8tGz7CwNQFdvAlyyqgdMDwhVz4d/8xtstsq2y5sixj4H+Wj1hUhlfob68
 VV/g6x19dT5uoa81dQt8bJIfeTxSv9lSXZNgkWKOv8a6UIJoxNvJsIC/ZHcN1eGzdVOB2D4k2CN
 TnEg/PKMDzTSF0IPxcfK6QPmQlweRFVWkvZBU5BAvyb2Pyq64pUahyoNzQk9x1c85h3k5JTdIfo
 7iCU0KR9zQ58F6KqJFhE+7Vj8pwt01JJ+2gpo6ohVx6on8iOT725D4Nd4gqz/kQ8N0iHpZM1ZN0
 GAQs/k1oDv5cwupiq+2CJqzjOy4Sx7v0SteBxjSxHjNpGS7LV+QnLkpx1W7QcidhWupa+gD/l0d
 NjJ//CsXK3W6i5EjCvg==
X-Proofpoint-ORIG-GUID: RSk-TqMcAO10MlOIOSk82wYMQGtX5zSQ
X-Proofpoint-GUID: RSk-TqMcAO10MlOIOSk82wYMQGtX5zSQ
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a84143 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=P6JgDz5pW-ke-mV79CEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040116

On Wed, Mar 04, 2026 at 02:48:31PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The clock tree for byte_clk_src is as follows:
> 
>    ┌──────byte0_clk_src─────┐
>    │                        │
> byte0_clk            byte0_div_clk_src
>                             │
>                      byte0_intf_clk
> 
> If both of its direct children have CLK_SET_RATE_PARENT with different
> requests, byte0_clk_src (and its parent) will be reconfigured. In this
> case, byte0_intf should strictly follow the rate of byte0_clk (with
> some adjustments based on PHY mode).
> 
> Remove CLK_SET_RATE_PARENT from byte0_div_clk_src to avoid this issue.
> 
> Fixes: e700bfd2f976 ("clk: qcom: Add support for Display clock Controllers on SA8775P")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc0-sa8775p.c | 2 --
>  drivers/clk/qcom/dispcc1-sa8775p.c | 2 --
>  2 files changed, 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
