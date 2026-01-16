Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2357279907
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 16:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768581256; cv=none; b=BuWMDVH+wkyxNIP3LfXp6iOmL7DQybWADN0zPVAlq/2BjS8kIyGaGPg0tXtb360LEw77ViPs9DBIwxCz8pRM6reGWpyq6GU6NyV3uqxJBPhLuo5mFAVIhYygeoDvhO65k/bLpajCtKYo9LHv3Hut5JHzmzNRZZCW917SJ2OexFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768581256; c=relaxed/simple;
	bh=q74+5ZnUwcdx1btcAy2zqzv4xpPqKeKYliKs8FQFcvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASlSU3mKjA+xEYz7kaLPOuQ6t1OC+EBm2NP2VH9ghnDzYbMkQHuoDeSpNDYE8Sxj+tGLzBbmmOVP1RrJKz15CKghks3PYchsQc4fpO4PFVinyInHCRLmLPYn6oyk84YZkGlWlZfTIq1KPKG7NX1eMu2T4UhkAv/s6AS5gxLMBqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BlklGxgX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wx5Y/UfI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BlklGxgX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wx5Y/UfI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GDZxfm1196568
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 16:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ibXM/IJs9WDuZYSVdiNej6sR
	HQ0vHmfue7ThjW1H/ok=; b=BlklGxgXzEpdrHjixzkmtBz5qOh0KAbcMtdkXqLf
	thqtFeDPUY0ZsYsz821bAIawLyT6WN1MZRD6cwJUzSCgC/YzTYAWUJegDG4iVnIC
	17fuY/iUtlI7EObiMSOGcKL9MR+QsGeSj7toXEv3WOscKFWmtzTeo5trtJ2IPcav
	KR7l5iQ3y2tpMdJqgaNGAZkj66Sed19vhNQ+1Omm1Yr7Ydb2T0Lw+XRmMDmRQE2i
	h4L1mwgYQyCnH3w6WfXfHyySci90LAuxZCuuq+12j7wJOladCRbvxGhDEhY/EEYp
	8hkXxzPYoJqk0oh87VMPfvI4p/a1WbLAVl3i1HjVLb+7Ng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqpbr0gxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 16:34:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52fd47227so412405285a.2
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 08:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768581252; x=1769186052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ibXM/IJs9WDuZYSVdiNej6sRHQ0vHmfue7ThjW1H/ok=;
        b=Wx5Y/UfIFLTOoi32qYscrXw75WFj1apllJFzinR1rTEojY6eKrNAZyVPfk2S8pHuU+
         mq5oq6UEOyilijxVgpL7PzIwkoXDjt8dczU54NMQFEMn8fqRM4ZIFT7zWlDf88ocKVSO
         VgQurAG30zDL2L0hr/lJqAl/WtuE/2pca8qldLqer5ajIuJdKJujKfQyX7ODIF2+WD4a
         KPXj/Mbuiymay83paXpcWDSus77uZ85inlP+W9rBLeBQWz28odgu/HH5/Wu5SPgkhNbi
         Woa/eg4adycSLd9V5y+lTsrjbkipwmA70r0NjY/ktIzxx+3Iq5Q2QScVfyeDZEDpFhZR
         Ptqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768581252; x=1769186052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibXM/IJs9WDuZYSVdiNej6sRHQ0vHmfue7ThjW1H/ok=;
        b=B0im8MQknyKSYLLYiBwqR//278IiCC9YsmfdTCY6s3m64/SZ3odR8gjreL+X6EYvw5
         2IKci1mhOL+/+zjS9SXRrT5he3ocYxaYvBN7An95k7NGp+zWu3Qb/ASmppW/VH0n5wcy
         ehnvAnyCd6NuUtNpMoVqFErvEryZ7q9oSglLN3Rvpp8DrCpHudr85qn3tb1vYj9KUEgE
         /JGBsCndVLTyd/tn/8vOyQssBd3rH7z2dGqm7Kb+KEnWpn1MJN/fvFp/NQ4egxy3nqzj
         KV/BD/FVCgD6vJiicmuikqa0eF3OIVHH/HjTomjT24D6O3nkwmBjBl31bQVQra6D2IgR
         KB5w==
X-Forwarded-Encrypted: i=1; AJvYcCU+9eoCo5cLkPV9dBdJ1BAtBOVBIqPpMDo7jXI6DPfxrT8xYJyVxxcHkhcWycrO/4tKJIGRzGcrb4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoCVJu7bkp7t/EnfrNyTRtTcKL36Hz+62DL7aPD7ksA57B5k3m
	SA+HIAWZBEsKxTnUsVuoc9vJBE56tU3HyJdFuvVGC8+3TVf1yfKuAee853Q9nwz9FA3gALcqUsr
	pll+uBaxmxGxZpoxKqqqW2HbaepdpVtjW9cNBcDBGIEMysHVS5448vVz2ZHwRTKI=
X-Gm-Gg: AY/fxX60IsyVIuVwuuGm9z5HOOGGmpEFPNtFAFnIeS24t809VNMctZ2C3BO9NZRPpQn
	j68a99PMGCQFKT9CE8Vlad0EWB9Fn7//tClGhyGdpHIL0pN5HYBA/iltW4qenqOtn64pyCIiage
	ULGQXG6cTJLxUwfgx4q34FCUgzG1etBJpnBdn1Oz2BoTYHUuI3ZAMncAQXpv+lQ6o2xybGXtcOP
	4EWZpqv11nITbcW1slWQElYuGbFj8o0/K/3zX2yZdelYaj+JkTOroitULIdTU8dT7muoS1HbT21
	L0dQRtqzbeYwNvxL7rBrgv7pNOCYL/dx1tInRy8Cq9boD07TM6xFxA3ZzkeR6ENbNqC9tdLHfkk
	ZFf2NUD6wZOzIYb15mcPLqbfkWyPZlf0Fc+zWpyZgnLGcD29fLUoJtOCztJDn72dkfj8e3Mcn/X
	BsqDQK8iJvravxF51/ORvSpsc=
X-Received: by 2002:a05:620a:454d:b0:8c6:a22b:e135 with SMTP id af79cd13be357-8c6a68e828amr459905485a.36.1768581252227;
        Fri, 16 Jan 2026 08:34:12 -0800 (PST)
X-Received: by 2002:a05:620a:454d:b0:8c6:a22b:e135 with SMTP id af79cd13be357-8c6a68e828amr459900185a.36.1768581251735;
        Fri, 16 Jan 2026 08:34:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33e7fcsm905003e87.20.2026.01.16.08.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:34:11 -0800 (PST)
Date: Fri, 16 Jan 2026 18:34:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] clk: qcom: camcc-milos: Declare icc path dependency
 for CAMSS_TOP_GDSC
Message-ID: <cdtaituwzxzhv653ahzfmrcux6emgmrnpp43xzs45e6dsy3uls@vefliexuk6vk>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-4-400b7fcd156a@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116-milos-camcc-icc-v1-4-400b7fcd156a@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEyMCBTYWx0ZWRfX1+Q/EGfBMeGw
 sdK/DmrkGyXq4D617PpxEGF4CK23t2D4CWkf/CKkZO2ed9yZ3qaKCTM1chRi+Thio2ZbemqHq2J
 ZHZSFHJHibmIVCuu2nBW63P8YVHGWvALodyki3ewYn7i55s9i4mgihKrSzpVVgIRdikKPOItSzW
 AzmbGPsVtzngPEziwoSkEGXV0KsuV9DzRJn4p0eGs83tWqGIpVo1aSb891y8rMhWeWkC+7031pt
 VJf8S5VXpjO4vimNUdg6oP519owHuUOrYxZe5DkOfYeBqXZcqsmC03uR81UeO0a+t6tEjtvybtr
 A6/FJBSsZjElMHSHXAL78xP/GHvdlyVy4NbEw9ehJz6C8xvwonmtLmC2yet4T3dovS5gLvPzLdx
 wP7ZgbKjqKblIfm3JxJWqTn355IbaxYuAt3Ggz7mXwl+yKqkAbyfNrnMFB2+JtZbR7Q0jc49JK8
 TrTM8AaaeFAKWg/av8A==
X-Authority-Analysis: v=2.4 cv=dL6rWeZb c=1 sm=1 tr=0 ts=696a6884 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=uEvfv33MuhQ9VhGiz4IA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: VMZ8VRf77qCjhMwAHgv-pI3VNk-0GYgJ
X-Proofpoint-ORIG-GUID: VMZ8VRf77qCjhMwAHgv-pI3VNk-0GYgJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160120

On Fri, Jan 16, 2026 at 02:17:23PM +0100, Luca Weiss wrote:
> This GDSC requires an interconnect path to be enabled, otherwise the
> GDSC will be stuck on 'off' and can't be enabled.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/camcc-milos.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
