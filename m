Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19BE24CEEA
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 00:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769647084; cv=none; b=mMNBoDZoLuCCMRi/6xCKuxh6LP65K8jYYUyQDS/HVRhSA+SJKRSKlZwEh2OFigk+Kp20Kub1aLpimyVj7q4A0Ss4H+xRPKCvnbNZOJRNZURt0g4icqd/+tXPqNEZ3Jvww/VIpyDl0V5A1wETah7yjlntx0/MpnzZeCiW2r6Ex1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769647084; c=relaxed/simple;
	bh=3h2odQ/t1doW2JNGfy9kr0gBTfOLjPqb4aMua9YTTIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CssOnWWyHqMESssgAZ4cRwTvilpICDTd0MYMcx/WcATTx1u1IlnDh1y3nP5T/PVEphr4cO0BipIuFxv/B2quvgqJdbNhqqfNvU7R9PmiPwDSnv1w/FEhs0Rl7hVMX4zANJjaz6v71sLvHsiJYRVDCilzX1E1YtAKHoYHUdD13CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DQ3kXp3N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hrDc02Cw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DQ3kXp3N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hrDc02Cw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SFeHD7590353
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 00:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8VScJznvPkf3cRKoX+GiVPA2
	1+Y2FNUyfD0B6qzVeCU=; b=DQ3kXp3NuoN2ube+UHYjupk5F2JhJ7uN4mub1WF0
	dC3g1JtUQ5kFB6PX52Jw0GMVS819ZTlDap68nKNOgwthvug7Hm0z8qZjgot/Won5
	WuaSqOuV6JbHfOH/bxaSPIkbdpXC8ziU7JH4+5UYhrNi0sFwClcKrqYBHsT/2o9k
	mqLw/kb4vlkakPfEXLBniB6+vFiAZ8uwN15befh+R5Ug8SltVfgFcDfdjki7RyDG
	2VUIxB14otpC7i9YBEN1oqQppdEsKWWR9QLmWJqgWk5YLdheVj7AbMZVBlW9AcwQ
	KXpxzjwfh25kgbXxD5ylu6E2InEVdhUXWvebA0RvWdDm0g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byna7hjm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 00:38:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70e610242so110381885a.2
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 16:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769647080; x=1770251880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8VScJznvPkf3cRKoX+GiVPA21+Y2FNUyfD0B6qzVeCU=;
        b=hrDc02CwSocTHyY2Q7rme+2aXxIGloearl6mc7wzdLLPnZFUd8K/fno+7DkZu98dW2
         F9O7oGCn13Qdz3aEmnmBeco5zCSP8En8+Zg7gL7p11lNzACCZPyL0+5lrfHqM8Xh1eg8
         QX7uGqKKT7ESJ7UEJqDyjavDzg2Co0tNJJRh+FhiFgGfN36wC6oz1k9v8ylLoABYj5UH
         u+DwCcU4wYBKyEstRVLzu2pKrN+qGihZxkbT4fTMD9KKlp+GCrKpkB5Dk2PtHh16LtTb
         ogeBfjhKEadr8ZjKqfnzuBAyPLFOwHPkw8cX6jFaMDspJ8V4hkCFFdixPYcTtPhqr7k3
         c6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769647080; x=1770251880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8VScJznvPkf3cRKoX+GiVPA21+Y2FNUyfD0B6qzVeCU=;
        b=mJCrMhOaZlK8u/CAhJNrPm3h6z/puXbxPqk9iN4ce9f8Krw3StqFA4Hl07tRiVZOyG
         uxijPhYczq3E7l3LQw2HdP9uuoB00B//1VJynp5GW/igih4jtj6kgg5izXnDFDT0Po8z
         6eqGA6HStyQ8B4QZvp5S+luOoNoaD9s9NlqJwYXCGZKWLx40U6F6gfhUp5aJF04kDPPz
         fMaKBECZL8VvbWVebBYLrz0txS3PpzLYUzWbwv2jbKa0mLE+zOfqJptlHLjEXkLabs5W
         JW+48tZsRNLJVhUbijweA4cQjHAgqAVLwHE9VagG24muJoKA5V5v1P2czWN1SoI10U2a
         4A5w==
X-Forwarded-Encrypted: i=1; AJvYcCWZpcoX5xiZPksGBBXN1QxQW5zZzDxrJ4a6Q1e3gWcY9+Y8r5aQtK/Yms7vG0um6+NVameaJGxI4O8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/WOdQucrzXG2ucevhP55h2BQpNyIOL1ggeUG+tEslZFdJE7aN
	X7hCJwlLaDs3teZDNB8ACFq4aqw7KD+EqTh1uzNsDdJEyFM80ud5Vc53YgqGJZmsRAI0hcMW/uP
	vC8h9hwPU+5LxBY9iVEkRswy8qEhKxzjNOp7T9Tn+GdBDRRPD0TGaSnFE8w+qylw=
X-Gm-Gg: AZuq6aITBibAQrsLi7EwtaSAnY68yDuv5vuh8ZnhRVUEmPCDrQVE7qAmaxNgyT/+b9R
	v3IkyV9Zx+3u1aXOJ2J0hkcBKfijsypi10tPCHvsjU2d/ctGuMBBQ6NEDAN0rs+wY7JFFd7yZ05
	60zmszOtQKNPFznJJzAcYPkYA/AxfN41AnBf+Cz6wgLyiMgXaR3/olwtkygw0e1a6Gv0T4HGLWz
	z+dB0iJan/WQtDmgyCcDkuKM9LYqZanhK92AY/lnf2uq16Dt2SqpIOSh3S2zAdu9M5iyzHkekCV
	d1wSgeOu2Yc5mCEPMyh4UY3QAWGm7YwBJ6/XRh9DG4+6NOb3pzlF8KLG1FlstpvI8oQR7AfGILJ
	Tn2mfBBEr/9YDbxXtvy5UWJGJ6HlP5WUITlv08daTPZpYyJaEeYBKlxtPvdGtw8DVhRZc8+z2da
	WufMeqyyhagxFhYGKYGz6Pg+I=
X-Received: by 2002:a05:620a:4507:b0:8c0:ceb0:890a with SMTP id af79cd13be357-8c70b84033cmr844933985a.16.1769647080014;
        Wed, 28 Jan 2026 16:38:00 -0800 (PST)
X-Received: by 2002:a05:620a:4507:b0:8c0:ceb0:890a with SMTP id af79cd13be357-8c70b84033cmr844930885a.16.1769647079587;
        Wed, 28 Jan 2026 16:37:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625f6c2f3sm5830711fa.26.2026.01.28.16.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:37:58 -0800 (PST)
Date: Thu, 29 Jan 2026 02:37:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] clk: qcom: videocc-x1p42100: Add support for video
 clock controller
Message-ID: <aki2cw65fdl2toctcquprkzpltz4tejsyf2sudlfqy5hsluvx3@ayi7wqaa2csq>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-3-b23de57df5ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-purwa-videocc-camcc-v1-3-b23de57df5ba@oss.qualcomm.com>
X-Proofpoint-GUID: j2prw38ZMqOjX8s3qUsHAeM0obb8HJQK
X-Authority-Analysis: v=2.4 cv=J72nLQnS c=1 sm=1 tr=0 ts=697aabe8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=rAeN3jnYVyXTJrfZgKIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: j2prw38ZMqOjX8s3qUsHAeM0obb8HJQK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAwMiBTYWx0ZWRfX2LeuMvYvRcIc
 nDxQN6O6BetbVtgVgc/bL1QszfFXzO6klR3gHEP82X6iZQY05WOuZ8578K+pC9G+lByeWsSTjwP
 mOX/hFfkog09rlsSiLneSslgPEAbpPDV3PZ/GaEwCETAlOYYmZeFDLfbDnPTgd57TvbaxRh3juA
 s8zV7hRrLwn2QgLJ6vwnCzbuY/Dce6gXkMM7q0iuVdQHoYVbNmTmXR840XTEEv87VEbzJJlnRXF
 Dze8km+ZwSiZDNWLMSzOquXxpwqq6Tey6rWt4wSBmvUs+NJ65etWD7VXdLgvYflPGuH8ET3KGe6
 jDRyJ3rWMfTw4IjkRKtyyK4vTICxYmkmE3r4svQboT2tCN34W4BjmmSz/G/71iRCwZBPqqL14tj
 563DbKeRHf1pKF9l78cqYHfi9RqmnXrMCWXVydC6sQgLWfZZwQMeedmzGnQvbuedgxu0QqatS2w
 cbc+lqk1JlSS7rQ5mcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290002

On Wed, Jan 28, 2026 at 12:56:34AM +0530, Jagadeesh Kona wrote:
> Add support for the video clock controller for video clients to be
> able to request for videocc clocks on X1P42100 platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig            |  10 +
>  drivers/clk/qcom/Makefile           |   1 +
>  drivers/clk/qcom/videocc-x1p42100.c | 585 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 596 insertions(+)

The videocc driver looks almost like videocc-sm8550.c. Would it be
easier to merge them into a single file?


-- 
With best wishes
Dmitry
