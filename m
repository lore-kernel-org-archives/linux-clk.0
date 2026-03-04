Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EA13A6F11
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 14:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634456; cv=none; b=Y4nJjT/SmW/0PC+CALf9xbMpE+fHqm+mSvbs0ePB2m9xI1DTaML4oJq5Up0FkKmRJQgoUHPb71C4cRtobPPZrAUFrc3+ZusZQB0nmHgHDc0338V8GE5Llk0ShxkD7hl4em7UUR36Zbx1PQtgQcd9w0DrwUTxBQBent+1mxALGEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634456; c=relaxed/simple;
	bh=bgCnnnFl8K7xqbCcLxWjTrJVxvJNP3DYLROghUWAZEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAhKvsBXplQsn1UmcKcReTDJxIx6vq6jrvEMPrdBZad9DnwIx1q+VD1pGTo7asE2CqQlDkTq/a7D1tBfipa0pLd/lwtAddyEaLnIhKJKJg/GaqcG72Amq6FoRwimaaCaX+FAnH8oWjx5o22OBQ91sCvzwZlcIwzVN0DqgT+Fp8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=piUIV+Rz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xi3E2aSm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="piUIV+Rz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xi3E2aSm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CNaUJ152520
	for <linux-clk@vger.kernel.org>; Wed, 4 Mar 2026 14:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKYTPMRQVxp1T1VMh0oOSsdAnJQwKE1xv6nrL63c5wE=; b=piUIV+RzqTIZvevx
	cEb6iY6UwXKejNEhYXzzF7jKwZNYMcJiKWn4v+5/Bu0ACVwb02+bxJLvCMyV7SDn
	Q+nlLJe8cA/Jt35i5lCE7V0AqthF8tT8idKDlA+Gx6mySjxWt8+Jnxzbd4tHN0s4
	3KXj+6uvLCAHGvP+THeD0W/iD0ffBTge/0ZCV6p03GRRM9oD+DRNlbvzbxhgIkpd
	mHE9Vs9mC2H0mNvPhgIJEdyo7jjkA509fZpvJHu7vdVpmpnDDEuLxVi3cx3+m3yn
	Tbent/7c7x97CwJBHz7Y5g+mY9v+t4x/RDv5A7Ys5Rm4q1RCQ6sU9FfeXgTz0Sx+
	RJ7+Lw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp3tvkx0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 14:27:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70fadd9a3so87195785a.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 06:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772634454; x=1773239254; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CKYTPMRQVxp1T1VMh0oOSsdAnJQwKE1xv6nrL63c5wE=;
        b=Xi3E2aSm63uiQQBt9NopZ4q7tuHd5eOPqZEy/zR5UljERHHklui9tlyrpqGLlY0g+X
         sFr4DaPQi0Tl/nv6lrjAndwY/Hmh0nDrR9061MS9l19vvG3IWlh6vyhF/nizs2GairSl
         37G6ggLUC6ApXgTnLukhVnVBfTk32ppzCWGOpFgJX2H3Fwk+sQLdlXcH8RcrM7FZUV0a
         5sawgetIwHdyZR6VGvAB7GHBO72Lgb4iQmfL496BwPTYB+uEomxLKQ6UcCg06pVp3Wxs
         0tAHBfAV1P82oJIptaaiVufeckJzNKQzf0pVY70rhORQkJ4xzaCP8HdiYtPn4D5Tq+bc
         e9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772634454; x=1773239254;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CKYTPMRQVxp1T1VMh0oOSsdAnJQwKE1xv6nrL63c5wE=;
        b=q0Cb8xrNu4pMn+lEjaWIfOx5NRbaL6JWLlRqGZK3goiuW33q1PTNObVcEyz4hxY+uc
         tUDayAm8+yIZ96pA5mWqJyqPgcrQyWs5Ykna9thG6m66z8bbhx/Y80Cp1ADlO9EiczxS
         ATwRVPpODR5QfIr/A3qTYuAgPAYUAY/4nqbtqNAmFbGkWlk/CCt/ijBIXC2K0bdYUNmQ
         POY3udJ1J6RGae4q/pNP0l6xVHxKonuW8uw2yHuHr7bl8Cwp6gR6W9XmSL5Tn9F4qPGw
         jfj/7VhSK0PuUc8K+r6cJg6/hC2vOWO2Vmh82pVMN5JNxhhm7vMAcrwnR//rY1p5DUBf
         sd1w==
X-Forwarded-Encrypted: i=1; AJvYcCXL1AvGJgei30SvGYXN+3eGBJmCIHwJ763X8SGjUwMPDae7euCqERaqmEqpDYKXRIan4mEy9bAi3do=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVd3LVPrmb6RkZ3bWNhDZlDua5gwNq+/gQTEMduFOuC/774cHo
	NxiWQ1pE6QvZRPh1OB+E59jMJ7YpDPqVCt/HI3rZxn7KXgSWcYhdlV5fcpw3GJwlFXBsNaYiBOB
	bb2LfmQiNTscxHlcdbDygW3dtJZkk9bAUTsId23EjfNdv3eIoyoOoSHFxs7YKJJo=
X-Gm-Gg: ATEYQzwQuY98l/26/oOuPeh2ZRTsIgEe48UI2h5PUTCPWGA58X1yNxfvXRAM8cDgOHH
	bP+C+SsFoGlpX4sLroQCNj9/ehxq+uzP0zb4ahTyZIJ/wHwoWp0sMQJP1oZv/BkvK1K12ySzcjr
	61sFC9owbfO8lP+L+8PBaKeLjGRdpNShmVvwYUIrRp4ycjmDelW2GhIzEmyZzVS8UuppkJ5FcKb
	GeXwtd1R7um1gNpl6CY5uHcQCrKbBcWDtGYfemnbpj9RdEPXJqjFpLDNPdmTY7J3puAVntIwtn7
	LZU2dlxuZGU574vxLYO0aO8pgVxQpmw8cY+UW2dH75aTp4s+Gu0zbeShMpPoFkqxa8Upp8pGVKs
	UThc/guq/Zdfqg739UQgsQKNFqLYu/KEw76FUKfLq6BPUcTeo3XygdVjc/c//LsJ7p8wxI6bW7A
	5I+eaP1IVCE/0+UnHKxzEgNnK9eAvnFTDt950=
X-Received: by 2002:a05:620a:1aa1:b0:8c5:c9a0:ac28 with SMTP id af79cd13be357-8cd5aef69ccmr258891385a.21.1772634454231;
        Wed, 04 Mar 2026 06:27:34 -0800 (PST)
X-Received: by 2002:a05:620a:1aa1:b0:8c5:c9a0:ac28 with SMTP id af79cd13be357-8cd5aef69ccmr258887185a.21.1772634453784;
        Wed, 04 Mar 2026 06:27:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12356fe34sm1305809e87.90.2026.03.04.06.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:27:32 -0800 (PST)
Date: Wed, 4 Mar 2026 16:27:31 +0200
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
Subject: Re: [PATCH 3/5] clk: qcom: dispcc-milos: Fix DSI byte clock rate
 setting
Message-ID: <tyrqr7w55isdv3zwk5ddpsqkbsznk5k7iw27nyrgxvclwdyfzp@rbx7zl7xr36q>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
 <20260304-topic-dsi_byte_fixup-v1-3-b79b29f83176@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-3-b79b29f83176@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExNiBTYWx0ZWRfX+JDyerQja+dq
 nRfuHJYBkHsewjeTTpHh1lyUaDnLulUQWtA8wBm4qjqmT/j2uD6O5PZNMhkQDOOWsd6q78QGGJO
 RT9nw3LXrLbA9EyvsJs43jUhAlFxI8gxJdM+JkzU2KWDN71hkt/YvHNEiPzhsQtRnVPb4FCFH5s
 FebBM8I7lQajcaM30m37uaxAYoaXFlWhG/oMq147ya/RXhhl3a3RbyiZsOsKJugayfV6IZSnbId
 qZliCpNxzZp3Ez9xUOQVgapTJ4Pv31EuRE3TEMytNDxD+eCL59CzcbYIJXvlSDQ3NPR2lt0rMjU
 z5vspwWJd559aRRinh31FKJWri+ChHgXhQwPgsDlZQAJOrJlDFAcUZ3uIX4Wx1nBLpfYnSwZBUL
 uPsefxul449whUWNJuefgc49v+Wi4YIPQeVZEF/G3r+Y0ruw4n+HqWAE/TD8KW5Zz53WmWWonI2
 uNxYOHOiNItrptLY2LA==
X-Authority-Analysis: v=2.4 cv=VYv6/Vp9 c=1 sm=1 tr=0 ts=69a84157 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=P6JgDz5pW-ke-mV79CEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 21NOr_IUFcKRxLpH0Ozywy0N8R1Bj8hJ
X-Proofpoint-ORIG-GUID: 21NOr_IUFcKRxLpH0Ozywy0N8R1Bj8hJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040116

On Wed, Mar 04, 2026 at 02:48:29PM +0100, Konrad Dybcio wrote:
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
> Fixes: f40b5217dce1 ("clk: qcom: Add Display Clock controller (DISPCC) driver for Milos")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-milos.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
