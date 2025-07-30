Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7B725761
	for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 18:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753898984; cv=none; b=gdVwBqpYINly8ldm9i1vCHe1Yw7QmiFWsDj0jZPZJGw1ksoHRYkKk/0dc+QC5LYPnPBB75TLvFSggdIt2XGJntWnrDEXjl3SpOqXO2LvzhmVMCP/4NXhJ7j9cA0NU5N08kKCj38C7zPAisMWFzaT+xZi/i1o/aYd7HHWaXwJ9ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753898984; c=relaxed/simple;
	bh=uysVQLDbrNrO2Dt1d2Mtse/kMVt7UURpOikxiU2uC7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PztbNvskoRt5/tGussaABBwIgiDqplmIUvBXjT1Zks3oQMayWX8wHKmM26vOH7Tjen0LT0NKfntZ4FoFB+CyEpOvyfKxtuIv3jxD8DWvR+TuqIED3yAoqw78nZlJQJH3nUKG4jn8GZErfV4KuCC+hgi2rtiJO6ZLXlO27IuLw+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxFC/qMW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxFC/qMW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCb8w7029139
	for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 18:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nvtzYg1hl8x/PPGrm3YFV7F+
	GFXE8yyZC3xOnR+O4uo=; b=kxFC/qMWH5RhBuGIQfIVYvRLv+aomLMieSlJGYsU
	xig53nUEDThyVhZ06mgZJVfStk6i5zT+GZ17rgL/vruU8hf08feCb/o06DnKwrnj
	PgX2apy5TW2ejJBXMqzk6E0JWyL/pxbSkfjIKj5WSRL6xOiJ9UO+n08CFXnhqr4W
	/Nw6+U26cU8l0kGp4nZPwAL9giQ6c2SynBcVXPo/4DFinJEDXgiNypKwzQkn5YyA
	wW1JMmfLi878vC1rNsATsxKKtT3EaKgZLomoGrAe0mu+SuhoR4fSCOIl1I4b20h7
	GuGwrfAW/GHzlrzWmC3G4dy1NNJjL6apHngweFTCwDXqdQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcrd1ha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 18:09:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7073f820d42so1142716d6.2
        for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 11:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753898981; x=1754503781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvtzYg1hl8x/PPGrm3YFV7F+GFXE8yyZC3xOnR+O4uo=;
        b=iKxS+sijaeAcCbXAQRYBGwwrFaF65M1iFEWsLxXvGlJQXuJj0NX1NjdY9uXF1K8/AX
         NV8hVqDu9CWvSo0Awa86cYKQyq3Jmw3wKS9DEsYWDIGQKW0TeXSMQBxvl++LNqwsKJXC
         KQDccmBZTkgiMPLVo6XUoH6+ByuyrfgGLO8go0yIAwomwqdEWXDN+jL6r3Jg27n9SPnk
         Ut9KEvkg9fOcK8VjFX6z85tGhgcB3giq9vMZxFqFOTIPj+2ygsKeOgHfox/KomYt1oZH
         7e7imu564BrJOg2MOJjTC55Zk+Ek3/5528iA4s+yAyngw+eBf/CWZXWGaWaiReRFs4Bn
         IXXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjK0Krgj2KCXIb6F+A0AVBZQYQgFGeQ2U8D7SNcnaPlHWgwJKnxdgiIIV68ahBgysPbWb2SJ/83+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFaxdhnvmyfLWmNwc8RmDu9eUkxfhZJ0EvPPnXWOyouBIMCZtm
	YOnl738Qc7VAoSFv4J9CWknr6S0i9b2nNs1ufI8PrAmxrnI/FJZk0dxV0kAgDndF29PsHncqow3
	kOpHOQlR8/4PpHA8bIW5vkCAFY7Jo9dsCdf3sFe8PiNlUgIbBmkvRwFAL2C1DTPg=
X-Gm-Gg: ASbGncvdZcibzBXlW35GmmlMe2NcisHhvXImOpE/XNIUYkLri4VGBcIMH1Q2HNOoVMQ
	LqEGiszUhwmQa9f0A5BuJHKtcwQLvvwScgP0sUPxGYNHsBpxPB+8AFQLciMWQS2tUvkqJ+xZDO9
	isiTiw23lms3wnW8+uarVDWq04PxP7zsmJxuPYfQzhiLaJYYNvr0vZzqm4Gm4WAwxBNjXYJaxxV
	29azq1Acc/qsgzBHGQUZJlCRDivgjaZYiCjnicQLjKerPDX5YH4uUVTVkJO3Hiew6jmQoO9K1co
	m92nyZWwbIBZ/3h3XCb3RtIaKTAMMQOdvJLgbuNKvt8XZrVpXLONFJEJcT0lNH+YppLUEiVhqwY
	vPkW95wpSmlJHLk41UEA2wmla7qNKHk45GkLhl1Qc6jaDxklnZrqs
X-Received: by 2002:a05:6214:248d:b0:707:5fbf:26d2 with SMTP id 6a1803df08f44-70766d59498mr60197066d6.2.1753898981322;
        Wed, 30 Jul 2025 11:09:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJt6gobol1sslUNlmAmCuSnfF9g1pOZQ34oC0tL/it58uEDXC0isYw713JWBv+Uf2VQAj2Bg==
X-Received: by 2002:a05:6214:248d:b0:707:5fbf:26d2 with SMTP id 6a1803df08f44-70766d59498mr60196546d6.2.1753898980852;
        Wed, 30 Jul 2025 11:09:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b63375a82sm2251205e87.134.2025.07.30.11.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 11:09:40 -0700 (PDT)
Date: Wed, 30 Jul 2025 21:09:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: tcsrcc-x1e80100: Set the bi_tcxo as parent to
 eDP refclk
Message-ID: <qu54efmofss6247jdnnrsxvuojlf6fyex4h4c5rzrinbtznwin@2vysndddddy6>
References: <20250730-clk-qcom-tcsrcc-x1e80100-parent-edp-refclk-v1-1-7a36ef06e045@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730-clk-qcom-tcsrcc-x1e80100-parent-edp-refclk-v1-1-7a36ef06e045@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDEzMSBTYWx0ZWRfX4WbBtfymCiVn
 YL6f+OqMdKg7rGP072MkKtHliAGhNd1/GV47V38tjnZmqhEZY/92G7JOPzyasy50K5lj40+5oej
 JaxLyYSq71dsRh8dwOjh0gnNOF6VCYb2Pq5OBYvPoJWjtlzvspl0T95N76OdGyierK+NyJr44hC
 y0vlc2PDj5nswy7qjjQ04pnPU/+A31Ei7fLu11gVEYk2L+VMZ2BuVpJQNUOCzsO+Tlk1XWhxLL0
 RCeebrSyCQL5a5CfONXk621rGjLCKnbMmgE093L91qFmOZn42IjTf/IF3EPbSaI++AvEBM3Osgw
 4Ct97i1B5VH3vlNcXV9MPJOGO+cOzqHkP2jP6V5vct4RBS37ENR017SBJbHfglh6jpQnDMcHNcB
 xvVBb+++R+F0bzPqTofFpySXkblGT1KoN5Ly2104rNtoNrtX6op0jxnjQqzgafWibAh2cejP
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=688a5fe6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=wC1PSKU0_OW3W4-qnQoA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eFiTs3tBsMbtsdd7jvyKlYd9lesAu9Ps
X-Proofpoint-ORIG-GUID: eFiTs3tBsMbtsdd7jvyKlYd9lesAu9Ps
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_05,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=584 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300131

On Wed, Jul 30, 2025 at 07:11:12PM +0300, Abel Vesa wrote:
> All the other ref clocks provided by this driver have the bi_tcxo
> as parent. The eDP refclk is the only one without a parent, leading
> to reporting its rate as 0. So set its parent to bi_tcxo, just like
> the rest of the refclks.
> 
> Cc: stable@vger.kernel.org # v6.9
> Fixes: 06aff116199c ("clk: qcom: Add TCSR clock driver for x1e80100")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/clk/qcom/tcsrcc-x1e80100.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
