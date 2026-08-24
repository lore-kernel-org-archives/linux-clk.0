Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4777C37C0FF
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 07:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557577; cv=none; b=nDMROe0Thxj5vfDSkrrYLKbsYR4YVyK+DweA8HTgRQqSuK5g4jSiXU51nNPHisf3FnDovsxTonBcEOS6okAP0whp4XIhTHAir11k5VYSoodv96byNSPhrnb/mYZropsjYyj/Yf1VcxYxQY33hUYhZ6m14WFps7pcJ9hkPSjq+vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557577; c=relaxed/simple;
	bh=oHDdeDzlMyKWjdnEU5UCzfkNdo9yiXY2stBua2Rdasw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7+oYn4EhRyhDbg6LVZYZpPxKqsA5Ok5DQeJsfd3/jaVo+sH/k9o6T8y2BXCXfgog8xkspkgobUgDZR27MIaFv3PrIUFiFX7GO8746swvIR47l4VeZo/hO56d9AbZ23PH3B9LAb4YLC5KkXbGsdJ+lDMdKioWASHV9k+Rn9ZiPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ebbm179a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JtraYgrk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ebbm179a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JtraYgrk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RPEN1008784
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 07:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u1UEfkp70xx0vLD/E4HUvwEd
	QnrJJo29zF4VvLZULIE=; b=ebbm179aTnExabRNo4ZQbYNeLgKwGWYOFwJVTYbe
	oqQKvsXbPIS8I8elsQS98Vxx9+ifEfmF2xl6pwR0vDpk1THK6e+KBrl2ngSuAuZE
	NlNcmveh9r3Un51vCDYyzd9prwusYrTg0ZrHqFp3IRpvv3nqvT/EOqmwRdr/jJ/3
	nITnt5Y0CrHAwJrnlowRDDzADz0VWXFHak9NEHJTYIxuxCXSLaaf/7bXXMiOLKV9
	sym8Elu4gUEqfg9qD/dJ3SRo/dhjM0+q8v6d9VtuK5t8HYXa2FdrnLcL4BUjZmvH
	Ak1AlFCYbns0RZO3jS/Lyo1Pw1ONdjoR5h4Rm/SrBPO0Lg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74xhdtpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 07:46:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5283df62d68so41126971cf.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 00:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787557574; x=1788162374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u1UEfkp70xx0vLD/E4HUvwEdQnrJJo29zF4VvLZULIE=;
        b=JtraYgrkcKsTYJncOuz6ucyu2ZmXE+4A32a8nmiOs3iMOIUKKQD/AdNPEmNBTHBDBf
         sJu1MC3PS9V0Vl5u9BEYK0aCyRVRTf1XGItpRUztssjQFvcCHkGXDMEgSDrTq8ZU9mFD
         nQE2Yu9PziKVgdNFG7g6flTl3rW1ZWQs7zGteeevloWzOnDZZhEq8lXrRuozN6NaE9Hs
         5PuYF8Sztx+cSmt3t0iTctlhKu0cj4wNYzkD/uK5WZFuUybpkYCmAMfGioLUGr1oaedY
         25Wu9hbMo5GGwqkS6tjDQ/3q254sqn9keOPUpa1yLXgy0mxh5vd/Cgdm20FtsXJgAZ+3
         oeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557574; x=1788162374;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1UEfkp70xx0vLD/E4HUvwEdQnrJJo29zF4VvLZULIE=;
        b=Rh1X23TznqGm86sMUEi5ZtrvqWX5/aa34szmo2MGr9W0pX0FQKv82yrSiYGCY1297m
         ztohTqjfL9P+TPdhh7Zs1NTXCAFnFD44bK66P3+CgThh1MrdtjgEDsLqM65zCM3vnmSV
         VTe6duyNKAD1QiG2I3hGWdmkqOdOBVIZHvqUjKlmJ28Jmo8OvF73jrFEFuWvH4e6ZkKS
         /w3Jf4pmo6wXAMvCio6kmyvmdoocGoZBltHl9l4wqnvuKvwUXVsvUdA3EXAdVQAmVJbY
         ciQO0kro+xg0WmrWDOWFR5GSNk+TUO7j/tLS7Og2GiBxrE9DorIEJdOloJF7LOdec7l1
         9nSw==
X-Forwarded-Encrypted: i=1; AHgh+Rpa5dtuATMe/4+UNJapeMX2K3iOfF20ihE0B7mwcAqwUw7DRXC2Mpp36WD203bRLdzLQ+UI5EeJE08=@vger.kernel.org
X-Gm-Message-State: AFuF++m7WXRVA0gTePs9cUin8XDpq3sVWLCdrmxVXvP/Lh09C7pSKRMQ
	5YRMxfoaR7RVfhb5dePNm3U7WvAXPV4SEkm2AXoysZ6+qPSH5r07slqMOEnwAYTBWtHvmX6/QV4
	IHeZOPQvXsX2mBaxSrUeqU72gbS/rao2psTVRrWS0XrAkF5lAnx7fzZOKwn4wP4g=
X-Gm-Gg: AR+sD12OeucspHcmIi7Hv8/DmabLXwGnkHXW6qmLuY9std6tplsPLk5aFCTZv27kOzQ
	5KNG28yB3BThWMMhSIlT4HnA3Rwk+mrfdGyV5YUJCyEzjwU/BN9wEDTCSOYR8ausFcIasMiA626
	e+QR6wkb8zwqdO3/b0JMCTh8wYr7sIuF9vAo+ewNclRL/VIXN9bOP4KyRJ33elbTwvhOm6Zoh4D
	jFceNnuGRuwg6HH9WjuA1l+5scJbutn75JOO0enXt0ecc422++dJVthzYOB65rKD/iUb77RoNlV
	mV3v7ZezELD6+WwxM3EwxRlZGNVHHojphmnyl61qWySgFwX4sX/uLRb6Q/xn31v5HY9Ps0WxOBj
	1H+ymGLIfLOwswh4=
X-Received: by 2002:a05:622a:a07:b0:52d:94c5:2212 with SMTP id d75a77b69052e-52df56f696amr234846371cf.3.1787557574350;
        Mon, 24 Aug 2026 00:46:14 -0700 (PDT)
X-Received: by 2002:a05:622a:a07:b0:52d:94c5:2212 with SMTP id d75a77b69052e-52df56f696amr234846011cf.3.1787557573742;
        Mon, 24 Aug 2026 00:46:13 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f9cbcsm1254309066b.29.2026.08.24.00.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:46:12 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:46:09 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Message-ID: <5gwqlrycd36aqu2xhzcil6rs55v5qbe7yshhbedwacq3xvaufh@5xi4z6xyhxls>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-5-196e2b306368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-5-196e2b306368@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: nSIHy4gwjGhrJdEiyurBm_gER1wKjSEd
X-Authority-Analysis: v=2.4 cv=GdQnWwXL c=1 sm=1 tr=0 ts=6a8bf6c7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-YGGs88sVoTMC7_f4VAA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NyBTYWx0ZWRfX6BEIABtdBRfy
 +o3pQvX5q2kA81V2RWHUn3paZBKPQrcF6JnrWw/NimxEK+ojB/7q8BmYOxaD7NuyHBahRocpwOL
 89ZCRBFM+j6izTHaETyK09L3+GpnS1yn/OZ+a1JmWekugCV3MT2TRrNEsoFwKqseNxdxAHQn1r1
 PbB74+4y27bV6ZatITqTwPrXy4Hgt7loe6hFdE1Hh3d/j+alc075FNWqcQ8FybGFlcB8Jkfov48
 fau1smtQZR9YogPCzhFYvuDx+guIdzKJ8jYFnqk8qxUkh0IZPv8mJBd5LMjEURaMa2yPT88/sjq
 rPV7YNBLG0dMeV6HJhmoRU9rZm0Ua08ngRfeA1irHDDXzMpcs/4+AqIGq+feODP3MkfM/5Y4cp6
 2OcI/XFXJwu9Hrb95Qtpzcxzm4kOu4gdo8dP2KqO6IyrH2XYqQb1Ob4RAhrLrkZSp7PhCbH16Rr
 INC8gOHT+Xt1PkQpMMw==
X-Proofpoint-GUID: nSIHy4gwjGhrJdEiyurBm_gER1wKjSEd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NyBTYWx0ZWRfX2b8jqLW9pJsA
 g1CHInAadDNLttfPZBxbktRQ1kigSfBdf5dzzPgtyD5exRvaMAeKXy+fpIoOBKQ8rK9W4MBTvCX
 ivIBul5tQSXK7zuTrIJ0zwuQZJuagdw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240067

On 26-08-21 21:38:58, Hardeep Sharma wrote:
> Add the RPMh clock description for the Qualcomm Kuno SoC so the
> qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
> consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
> always-on variant), the QPIC BCM clock and the IPA clock.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
