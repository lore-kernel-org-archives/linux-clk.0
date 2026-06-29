Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1259A3E9F8D
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 08:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721282; cv=none; b=gmhRakMbe6hw5wcbCDEVyCzRBWidPOK1lVUTgbOP+nnIAXi4eYKKPx8QywKW2rjZak49+lZ7GhJUPo1/v53+gyVlHtKv6dt7DdJVk3/lBvAMrgUKU4aoLuK5Q8jEGsFI7LaH7ZdC8Q1u9rGlETmOI0QvR/Z5KubPlA8GUjtotzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721282; c=relaxed/simple;
	bh=19bsCcsmbWBA2J5T8belQs5CPNmzQymzeF4aAeBu0f0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGaqDRJMOlul0VWL12JQcIdoAUMFrzM2bj6IVFSB+RUomgms2zuXy4wiPDIrlpgpODyHzLzEQpdE++9l7WR8mSIxAPexWaoFf4M3rk5DeNxpUfPAouw/J7cHq2xTsCcuLG51L9BPU7Jh9t61a6Nbe71Q4bZhTNgmPouAWoZryYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PKYIA4K8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ib9Z28Uw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PKYIA4K8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ib9Z28Uw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rdJY2125079
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 08:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lWxO6LQZLUQAJzOYM2xHkVek
	pymet/2dgmsuICKY63M=; b=PKYIA4K8AS48AQLbJX82jzM2q+/PzW26RkGFM6r+
	AQK6x5yVZSMCT7lg1wMRPm2xQowK86BmvpNE+6Lvw/J01DgD+jKRGL8ou9+PPNkS
	hA8gp7GOZH+l/8J1d3jxHpTnKC3I9sQtHCOfAtVUBYQyN+XHJ8zSVnh0l73suzpU
	6gI/72pk4TPIcHJKvjBtvfHfjqL3tY3eVfOwJgRfBXaIn86MrGdd86TUiNfXRdTb
	6MTZcj9a1wPOEcYq3bo/x9hxyp8bdqqy6JN3yUydo5nYodSQ0mQJ0cGqyHeGPjy7
	9oA1SB7qcKA5fpNft1sH9mwZmDo4Cnyj92m0BmJCnLMivg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27335gkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 08:21:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92d1cae5939so291402085a.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 01:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782721271; x=1783326071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lWxO6LQZLUQAJzOYM2xHkVekpymet/2dgmsuICKY63M=;
        b=ib9Z28UwkcvLqI44pcSlr3979ojkhZewIZGz6XtEZa9DRuWLJDy4VTy02prQ0ViqvM
         EsGuH4Li0e4/1eymaq8qtMGWA310yI7MOzJ3SBRiiqLi6L++nmuxNqPVhd1fVatemd0R
         eRVzjh8IpILvdjpYvpPhVFT4t2pq/tuRg1HncmtFd1pfjz7Iq+wzcicm/xvV9VlZHABG
         cjXFvrYxom7DclShFBciNpBT0HPe9LYUK2D5ulDrUjjlRArJYBzMqmuciv+4YzuTneZ7
         PULK4DVHOnZgErswBdj/9TWXZhmnZ33fFv3+uus8tWIVrmR9hkCel2hOvK9KM7B3iExX
         LdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721271; x=1783326071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWxO6LQZLUQAJzOYM2xHkVekpymet/2dgmsuICKY63M=;
        b=X+2xQIBcWjetN8nCKF0bz0yoq3QFaGW3CzgoW9zrtVdVOjhFLg3PkpUu5eAgFdUAcL
         y0mb1PBPc7YaqWJhmEUsibcqj855CulLeig/qzhnb90DYXmyTUTefzDoc9DyFVv5f0Dr
         Szzu3CDFdvdz3ZTNDlLJzI/Y139Dse/ZLlMfa7/0jsW1gELKM1D7vzBek2DdNQMDUw+y
         t6eBJC1Yzh/UB8YHfXr68oQJyyj7vMESb0I53YgZs37zyiMk/662bmJhU3P3z3s/KR2C
         NgAUWU2/RzY2gFUHHGusRfhagE15+XBZjPivTxg6hgFxiAO6t38tGaj0ItU70Yu4tYJd
         uUtQ==
X-Forwarded-Encrypted: i=1; AFNElJ849lkwwkahA3snxDDX25IDA8UY7r2ouRBLFF7qjlz41jDVYRzDPsIs7cX1yyjKyIHUQTbQi6OhCUE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvhmp81gKs/diiWKfGh7vCHnsOPwHamz8Z81teVNzJjoJt3Mku
	wetqkM6rpyJqZ2DeChqyPDEZi7lqhU4GCgD5w5mz/U8IDbPzf1WTNoDV9VKZj/oN7zidnTHZ3jw
	eFdQqdAzCn6d3PzTjGTdGrFakI7npjN+jkBqH4E6iQmwYTQaZw1coA1UvgG7bCrM=
X-Gm-Gg: AfdE7cl2ggGYSgb7XzghtTJlIpGtuXuHbB9D8fIRRYxyHUw4ounvELF39qUaypN6QhV
	x4za/IH6jdJHWahRhYC0jLNLR1PVD2ENqt/6ZtTmHjEId5wD/YYcU5DISJNdgKpowwkM7itgc+s
	YgZilhgU3PJlPLUnethw7ZNPiKdCDKFrTQ/EjhvzTHoApZA63+KePut71dutYbzN7w14v7RFenB
	4OWXAflbgHeY8fpcRPBCfHZ+PxpxBXdfTvPH6l0iLH9UQRug5Vd8D7uBi4JvunLspKfD2bxwLSt
	fFc0C7qykjI3Xx7ie5iUoNysmVDqJlLXf/fqub0M2j5OqVJ8HpTrY6p0EPHjBmaIImQvLgGQIpi
	8JD26QPNXI1F6VcmKeoQv4cYMh3El53XrRCSPPgE14CXdy+zSMPY/DoMfoxTzWa9os5vA+85Vyn
	TY+ft9Lr39zcs39ap42JEgRsxt
X-Received: by 2002:a05:620a:28c4:b0:92e:52df:3523 with SMTP id af79cd13be357-92e52df3fe0mr275005485a.8.1782721270760;
        Mon, 29 Jun 2026 01:21:10 -0700 (PDT)
X-Received: by 2002:a05:620a:28c4:b0:92e:52df:3523 with SMTP id af79cd13be357-92e52df3fe0mr275000685a.8.1782721270097;
        Mon, 29 Jun 2026 01:21:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39aee2d65d4sm16765571fa.41.2026.06.29.01.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:21:09 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:21:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: apss-ipq-pll: Add IPQ5210 support
Message-ID: <7smlazccqigokclnnbwl7alqgqfi4dgbaqlpygg3db23yyvxtz@eaed2ucv7v2b>
References: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
 <20260629-apss-clk-v1-2-8c92fe118ce4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-apss-clk-v1-2-8c92fe118ce4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=F+FnsKhN c=1 sm=1 tr=0 ts=6a422af7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=vcd5Yh-9S4NXlGS7D9AA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: qzb4xVaugCZKyhjG88Ev4al7jonPYUp5
X-Proofpoint-ORIG-GUID: qzb4xVaugCZKyhjG88Ev4al7jonPYUp5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2NSBTYWx0ZWRfX64cA6K8dTBn3
 FzQ4aFloRBQLd6XgVKhoU/bSy2VpO80kxNB6JpDtwCkOjJ/3hoJ9vsrLIWUSIu5L+piieu2isN7
 CvPZTXUenYEIyezTMPWzLVEGk4Zw3pHee6wz9GYniQ9SXjCW6xYXR1Oaz5M7VUMkLQZde6oQFeM
 s9V4zKstFOtp30db/w2ILtVXOwRvQpZk1chXgOm8tdO6zU837+y3AqK7aY3b+nnfgb/5zxL5IxT
 1jrRckXg7BdBTCrQULVv5OX/B8fpmcIqdQ4fJx+HWKuv+BojqmN/enLWTiawureS9pAQyDjFWAs
 XCLyGv0IqG0iWx5lQcP6Whqz9ymuAe8arHVKnnZcZS+87HfHH172WXIsusTt/KYZ50Yc09JvChJ
 c+XQfi4dwqGXiC27Bmy6XecuUE+92OlJl+GIh0zC447HZaxVbTJdf2Bw/IpPI/JJy3QVcJ2m2wc
 Di8JpwwsZe9+MylEHdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2NSBTYWx0ZWRfX2GzwDMqjx6mG
 6Ac02phCr8G0Q7PIsRfdrzLPNZwVCKcBIzIxskglqkdY/2OKhce9Ojnb5I1c/57Flho34uzqr0Q
 109YCPh5N71/WaKSbBjiFPCfxFKDs2Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290065

On Mon, Jun 29, 2026 at 10:08:43AM +0530, Varadarajan Narayanan wrote:
> The Application Processor Subsystem on the IPQ5210 platform sources
> its clock from the Huayra PLL. Add the configuration data necessary
> to set it up.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/apss-ipq-pll.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
