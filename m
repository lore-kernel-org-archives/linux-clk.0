Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4BA23C4F3
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 09:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950993; cv=none; b=usju5tydGmu4ydnI53HP6cl3wa+zbgDSNRUiNIPLse8osw3we5xQ5rYCjfdxgWk54we0ESd3kWsp3RFfS/aGWfDutSp1M74JWE30cwkGhVEDzj+oB/vIVGhC+omj2B3LCwSGQKFXiYcpZdmDHvDMPiNGjwRtjVeWPwx6NJbJbB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950993; c=relaxed/simple;
	bh=qLH3+LsoQDK36n1KPvfyio91r+N+YODHZlioin48h3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfvYIR7bKqNAobDxzMzZIKaiJ0VvtmQdg+2kpkVNui1iHiCohNHc2B9IxFbo7gk04eiJXqCaQeUR35y2/5M8UIWx4NzwqtJ5tKGsKG/BMgxI1JUwK+SeDQMN84Xck6o7XWGZIoJo5jBoY9pSZM1Ycn6qzj43pjmv9vxhNlXLUFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkuXLcFV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QUFun1Lj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkuXLcFV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QUFun1Lj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098RAAV2327455
	for <linux-clk@vger.kernel.org>; Fri, 9 Jan 2026 09:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rRpTpzQR8ExrbdL/F8XL9JZf
	0Q5dvO5YHpixCRZhmJ8=; b=LkuXLcFVJVGueu+PgdtFAUc8KLvOB4MDXyDRZDUt
	fgbw56l0wty9ZvEFcoyYO0c9CEpgKtdvciLPFOny4keFVgkY/OtNfTo4rww8/cVz
	xqeYdsprJGbxZfFB9bObGvjgP4R7evezj33MjETENm+Kg8zY8pllhOxpeds08pom
	t18LZsgGR49y3d4S+6jlONqTb7xTNAOrq0Kg3kl5/Mb1lb/5UnglI/Krdm3J9fTL
	iMkipS5bx7eLzqFi7XozK2vwmreK929gToAbIgJobfA1BnkJF8D8VarVdvw/PK2g
	lETjgihfnOanC/azuvf3KAUi+H6swQy7G0ptnsrvu4ptIw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfdaasp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 09:29:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b259f0da04so1017003685a.0
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 01:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767950990; x=1768555790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rRpTpzQR8ExrbdL/F8XL9JZf0Q5dvO5YHpixCRZhmJ8=;
        b=QUFun1LjneV9OPQR562UfpP5YAuphlaK0T3Mvj74YTSvYy9aaZazHluJuCfnuQTC2B
         wUI4gj0uBxm0uy1HdXDt5enamHyqA1WVqRw9smxirp20ubB16pJWwMeO2S6oUn+5UNg7
         QX3ZMdfFWy1Q7aIQMeEZzR0W2WLLGhP2N+wK5duQUfWTwZDPR2J/MkPhPgbuueiCDCiz
         HCiVQJ+BJtY8U7NGR6CEm3iLmVCUGu+JVdcbKJ/4Fsj1xuSHrASw66Tel/Xt4i+hFrPr
         QvvhYkKC8AMVXoJrTasRGu1Hry1ktYnAlErw72pOjv9CurHrBm+SqckmC9IBeNd1BPvj
         c0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950990; x=1768555790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRpTpzQR8ExrbdL/F8XL9JZf0Q5dvO5YHpixCRZhmJ8=;
        b=qLaLQnGS8bWrHvFXahrokkNQwCXXCvnyqCYfh00/bomH0TvKviMzL6/ywp6WV5caKU
         w0Rmmi6InL2LpFz4GzoueiIRvZqVtJt7E7S23uQau6k0P0yrgIwaop8Mhq6EfeuMVIHE
         j1T0GbPfUKydM+CSpcj693R3jnwqTJSwos0mFSTdR/cIXi3dcZIbor3y+/sl4Aev2xy1
         bhMoCsVY97mv1ANa2AhZRvsz8O5oPvFuiVnrnU/wzj5pkpl6+dcp1+J9d5D5N45Gv0bb
         rVm7m5OF5gjR6HzmzfuxfMOJfemAeQ5jpmBLISs2mQ4eY0OHZcn4MfGmQ5ixVsyKcwkW
         PKdw==
X-Forwarded-Encrypted: i=1; AJvYcCV2NOhRk0WjKKz78pxTYwRDEw5G41X/glyDb0Qu/ssKVdX0naG5VhQVLFOT8kUqAC/WdvZW1eyyEzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL1lXejKbv0jGW6ANglY0mQHew0l4vMz87QQTxCxlcJ6VyIadL
	QZhRQ97Iy8IuIfWvrCn5aA/A5weqkLFXSVjjpeK5mcyCvwoTjsVsxCZH0H3uRrbHzLhZa3oCE2b
	a/ua6wLCpzniAS7Bl27ykxiplN2bku5bbxBKYzLkUCdIczY1N68EtuXjfeH+44Zk=
X-Gm-Gg: AY/fxX5UgZkvfC986VKmMpmKFic57l1MOKL/9KXYwSJgr377yGH0srs5VMj1hiCfTbJ
	doCjR4O1l/EpzOgTtQ5N62jk3RWadNN4IwGcPJfCBfhOw8EWH3FFkHmF0ki8gxqhgNSmbugJN2v
	InLqR62AQpP7wqVgtkbJyjCD0U22xCebi/A5Z6wlh3Hpf5qmGlMe3iv5JUJXM6Q5//QIDZyTyT8
	/A4txobZdrfh6zEfOPZgrhZq7ctT96qPK4Vj2oe6YjPZRk5iWTfci0W1ssoUpi/Bxp4FTOujZav
	Vk19iE6uy2UFcd+OcNy3Kn6FHFSfEDun+fupjgCftVXFJVqwjhwgRari7Klc1/HPMux3MAkBuMp
	m8WCvUMn5+9tzLqfMSFAl
X-Received: by 2002:a05:620a:4149:b0:8a1:21a6:e04f with SMTP id af79cd13be357-8c38939254amr1257044985a.28.1767950989811;
        Fri, 09 Jan 2026 01:29:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXoLCG5LO6zefGjgD+xKyAVNrDH56nL2+22oLiyLggqcBqmC9ow0fJTq3cPgpQOVlQjcJAWA==
X-Received: by 2002:a05:620a:4149:b0:8a1:21a6:e04f with SMTP id af79cd13be357-8c38939254amr1257042385a.28.1767950989227;
        Fri, 09 Jan 2026 01:29:49 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d029bsm1076667766b.41.2026.01.09.01.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:29:48 -0800 (PST)
Date: Fri, 9 Jan 2026 11:29:46 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 24/27] drm/msm/dsi_phy_14nm: convert from
 divider_round_rate() to divider_determine_rate()
Message-ID: <7t7ctq5vasottsmiuvo6zwqsnlcocc3c72fno7qlhgeqhmhxid@5tsjevpuobty>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-24-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-clk-divider-round-rate-v1-24-535a3ed73bf3@redhat.com>
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=6960ca8e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=MmoDKESpECQAgM94Xi4A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: co5WMlr3Lbyeon35qYozUbKTGvu5CC2U
X-Proofpoint-GUID: co5WMlr3Lbyeon35qYozUbKTGvu5CC2U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX2ZrViE+svaLW
 qgQQnVSbW+Xc+6yUnSxVw4rYyI8lwI7suqySUcokQAESdOMHYsR97tBEzstYA5OWueYVRVYAuhx
 HO8AkP6pYwYcyn5gnOuNTCWM8KYl6r/OyyXO1HNlO9ieIgJHXVwcYGQIxjovkM4QbcvhtVF6WCc
 wflGnN9JSYXy8Z7dMd+dwHOHNocyMjUMFpudnmexv89R2pKgamjLgs/kNfD5rEv0BJbRt3XtPbG
 rCmtlM6s4mmZ5wkp5bP1tjjDvTvIBBofXmnEa+Q1YEUNgyB8pYvPjK6Q9DOyZAcCqPi8oXLE+2D
 6LDcXn4tZ2mblhJU12kM3Zv7RHuIGbDSc5JtujbHIbBvJNh1VgFJJaAylxWhqY+gPWc1xS6/JRF
 J8VHMiUh534UXkm56FnBsF1aE5Gm41zUytyEj6H4a4BCyjdHUD3ZOup/NJa7jfNmvN2l/LHPiLb
 Mjib4uF9z6I2tfkpKEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090065

On 26-01-08 16:16:42, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: cc41f29a6b04 ("drm/msm/dsi_phy_14nm: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
