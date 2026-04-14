Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ADE2D94AF
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 17:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189411; cv=none; b=Y2S2/ewDQbN/IwP0ypxlslq9m2NA/RdqWvnaGHk3e53G2X/RAaH+UPFPSo4PbRx5uBeBrDsy2y6m9amkPx5ONjStxDepSXjYfk0mutppy6iobACQlTkOYzzzopN6v0eNtNDOoR57udBRZn3zQHV1rGeNR3hVFmqlxLQU2yKm5wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189411; c=relaxed/simple;
	bh=JmUYA7u8bI0rqP02NiojMw1xs0wci/dwdBfsc+8gJ+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgDtEk1W4+Eme18i0OYKz/7WVS7LV/onIbJjgIBX+Pw36ndjgtPPm7UEuggV3MTvlTVXvj6n+F7TnYi2ZOEFFBSMpvWQGX8fLjU80bP10eEiHYbs/comlLnetDvtpYLYZrB4vaiGL5nq9r3ESdanESTgDFdmjuYJi3f9a1DjiHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GzUm+MIW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZEon/SXH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GzUm+MIW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZEon/SXH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EG4s7S2006431
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 17:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AlzvqUTo0KAH/PWsQIWJ5c+0
	+dLQFWbDd3Pk+ohC/e4=; b=GzUm+MIWYgZ6YRdYmsStqnh9YgsukUiCmZOc62iH
	Vx+zFFhkTNddEa6fXOP9zBp4/osK5ey5+j4dUhj6hfG5PVmEV7AqTbbjY5lJ1sZs
	pJPHmcqnuRPFjwsUJtK3e1RzmQe3gCJmWO0FZh29hk1F1jyqp5iNkHDmnzQXAmkI
	A7P6A1vp91GR9c3pl7bPpuTsGVOqzr9FJtq4wNambHry4W+IExetaEpxXaJKjzaz
	RSXaXVynuNGfndwuh7NweXCPpgsbX58HB1EffhPUoDtnbU9QGl9tQ1dMOra9yKVN
	uVjdT7yOX93VHFlGwYyKHWaqQF19IjMFoohgnKrm6xZ18g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrsjrf4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 17:56:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d812c898cso152359621cf.1
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 10:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776189405; x=1776794205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AlzvqUTo0KAH/PWsQIWJ5c+0+dLQFWbDd3Pk+ohC/e4=;
        b=ZEon/SXHdQseNT8LAIh8mMYeyBAvYgs36NtwxW+AgWR4yNUAVZG6T+hn3Pj6fobr/V
         I3p90DEPnZfCQRgqyaP16Xa2yAl25dhQTFJxnZrHohzWNJyl9lgKKK5BcNRjprDMYKqy
         kZKNBp2v8slGUArKXOJagZ7Ss4F963MXNLsbrJzmtIQl4TktBRtbQUzLX9Gg1DjdTpwB
         SotvTqU52Sk7EbWFus1iScRtazHIdZzkXeOUToPxMdqqpdyFLtr/iLZG6zW3ex/bLx48
         pxPeycXJ+dwY1ubjv3kkrBdO78UMz0wIGUuCYwnTEHcEVsKWsaP/odpj77hB+meyWRoI
         oP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776189405; x=1776794205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlzvqUTo0KAH/PWsQIWJ5c+0+dLQFWbDd3Pk+ohC/e4=;
        b=ICVMa2VC4l24FLZiyE9u90d/rzUpmAWkJq/luLMo/EUZvLQpraXzv+JKkaA0EazD2n
         0KICRdxRfB+ZZnUEjKVMEy4+gvMp5YjqJSvfXgW6mlknVfLDzn9G7wkYNVmL4yBHCppO
         VbhbPbX7TWLdmh0eHaGOUra55w+hJKbYTx1O/XkmixGqRkDe6C2anh382dK97rurN4H7
         J/6vjICWkbEXl7iBtos8iVM7cmVNGxiY9pTUJvWg6K3a5PYLS9xiMQygV+HIz2aP/S+V
         qG0GuMkC+/H1gWyKPXVBf3fxXlh9pU0/yrAUMEf3TedOw2zWs5zv+hwYON93x4kYRnmA
         q6iA==
X-Forwarded-Encrypted: i=1; AFNElJ9IZ6nDTdUP+cC0J7WVAy64PjeGW9azd7vLGSg3aQvF6Uuri+gRWGj217FbQv/4GIYq+Opw0hjKQzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYsSEntXmb+dmQ89XK73G0uAEN/zJZrPsp0l/D8tRzAT11Cog9
	P1+TV1pdCPVBzQx88d9UttFOxC6lWnoA6sK6vWtUb/TZ+/FJWeV/fcUL2xCeX00k90winkfz/kY
	PtQ53uWek+Zn3RYRd3MmbLsJFZVhMSQBEqRtxQnJnKG0BwgMMtQZ1+dcTqx76utrK8ND3B1I=
X-Gm-Gg: AeBDietXtMPlTC4EDQjN2pk7xVerL8xHDHHNL+AxPGItLmwJ2hoLE6S50xvu4s8E/yo
	I7FaLnHuXBkGOYqUKoon7Z+GrLueN13pgz9EGQ79mEDWdZqR1n6upye3QhJ+VkYK8Jva0ufoXr3
	R9t0g6/KlGxf1jbnYMMSZcD3OKtOgjs0FnC/u6tYAXWBVhiqp1gniHAvQ/JU4C6f6/wehH5t5jV
	CVyw5m3zoLqblvhv0kJ85pfhFXg+TChpztfQabimC9vDi/RxWFT7jHqnRr9KLsfoaA+avnVcHpF
	E9iHxqCZBn/j2Vyo4YgupHABXrc/CiYSpyL85zlwDMGDXVzB3h4PdN7J/Pl3uAsNSiElRTV/AzW
	Qv6tcUF+9UDrY1Oq5Gy6677K8HdjezS0K39ihMVcaFoy3eAoYsSdZFQu/sTzy7LU/DUW1ZhUDNd
	4UDqMheQnhKQ+rt2FLmP6sdZ0oghBYKDBpsdYInNpXxPp9Bg==
X-Received: by 2002:a05:622a:40cd:b0:50b:509e:790e with SMTP id d75a77b69052e-50dd5b3466amr274414801cf.10.1776189405201;
        Tue, 14 Apr 2026 10:56:45 -0700 (PDT)
X-Received: by 2002:a05:622a:40cd:b0:50b:509e:790e with SMTP id d75a77b69052e-50dd5b3466amr274414431cf.10.1776189404687;
        Tue, 14 Apr 2026 10:56:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e4926fc89sm32608971fa.4.2026.04.14.10.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:56:43 -0700 (PDT)
Date: Tue, 14 Apr 2026 20:56:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: qcom: clk-rpmh: Make all VRMs optional
Message-ID: <ui474rbttwjwvbbs2mcn6b5fh5h5ah2mj3xi64chtzp7y2m4fx@74w3au7l4oxv>
References: <20260414-clk-rpmh-vrm-opt-v3-1-8ca21469ffbc@pm.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-clk-rpmh-vrm-opt-v3-1-8ca21469ffbc@pm.me>
X-Authority-Analysis: v=2.4 cv=WKhPmHsR c=1 sm=1 tr=0 ts=69de7fdd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=hEP6UMytxTtgw7GBnusA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: LvWgjLNDskUwzVCb25oyla7M0eyogp3q
X-Proofpoint-GUID: LvWgjLNDskUwzVCb25oyla7M0eyogp3q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2NyBTYWx0ZWRfX/FvpzIGaqB/y
 KZN5+2M3+hu8Ll4dmKKil/U5RYUNAaX6LCF6PhmWUvy4W8kfsCpQWkIdOG5K86giWerOZ/w5VAn
 e6R1EpBiPr+J+4px4AOxisvNxvfeExyAu/J2wbeuAg3Ik62V8BYFsZkqz67e/pS316q1Jv/+0gN
 AMCcGWkJseWvK8BxD2fkCWkjfuIby/kKGBcs8exRJnhXplD5fZPdXQpW8dxcfQBTLjymkbGTyEg
 5a/wssFHipPLh3IQhZjIG+qKSdI+Zs5/HbNQ+JBL5G0lsYh/NClkwB0K/PW4gRE5h/MLzTIdLtn
 a+ui+6w+8SYapMHhkMp+iOI3g1iEkW/VAJvaP2ZhJUvbbOXJVgruo4wnVTSJyyRb+CdfaSVWjSG
 qjd8afAVvlPrDky/Wdvc16I8d0NRtdDXXMssJ2dQAB0mDm8ZAkPaDBXdZMF8FLoDNBNQdnTQyLW
 OmLZVGQJ7qVv7nPrghQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140167

On Tue, Apr 14, 2026 at 05:34:28PM +0000, Alexander Koskovich wrote:
> Some VRMs aren't present on all boards, so mark them as optional. This
> prevents probe failures on boards where not all VRMs are present.
> 
> This resolves an issue seen on the Nothing Phone (4a) Pro (Eliza) where
> probe fails due to RPMH_RF_CLK5 not being present on the board, this is
> due to this device having a slightly different PMIC configuration from
> the Eliza MTP.
> 
> This matches the downstream approach of marking all VRMs as optional
> and makes the previous clka_optional handling redundant.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
> Changes in v3:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
