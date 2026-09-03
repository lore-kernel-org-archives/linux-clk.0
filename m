Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4097C3ECBDA
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 10:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430967; cv=none; b=MbsZtq/PuiBmaUdQSlwd5tVm9lCUsIazVDoeCXf7rgQY9N7LFbvJ+QYiJgcZS1zmNKec78soCLt07MRj71fWSxiKkKcw7W5/SWSE+AlQAfwuVLGLw16lM7RX07LE4E4ikE2747avcjP7IhyjQmG2r6pR6qik7IyJbLXyeX30W18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430967; c=relaxed/simple;
	bh=IMVVshXwxDDSJzE0l8MvT/fRHMRPsXvntd5GyUh3aFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhxtBNdk+77n70+5CWlTfLr5gar1YqCpNlPgCKbIzwhUUwyrE4EJuVTPtnaKhIa82+lbPw7eRtfoRw9qChGFMkhzijJyQxHvFzdkCQCnMCgNJofUOyPlVHUaxVWkah0UiPFp0ZhOa5HIaWi66p7axYeMPonirOa3Uoz2dMfzTBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/t0/AIQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iHCvlG6V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/t0/AIQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iHCvlG6V"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHAq8212404
	for <linux-clk@vger.kernel.org>; Thu, 3 Sep 2026 10:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MWzDrNxzthWPdsVZldsnWvMx
	9IcczP+HYo1LJtEAQps=; b=E/t0/AIQJNXxavIvF4DSXyZj0XFMxzjyKFoBboju
	8R6N1Darux0BmyjgQfyvsnYAbW88jDZ7/pMCxRBwQq73SRc0dKaeRXwoRvx4oU69
	xYnX4LRp+pFaJqQJ/hXZWq7B7/KqK4Haa6o6ClZv4ZzJbrgzFYLuzG86M4ivfKzz
	XR466xDjYKLFSGmrfvDG21XyL4wP9hQxCmouI8W7tvI6qYo6XovD8cD9inVfgmqg
	Nio5fA/LHms+iuYTVX9x1HgmlOcKicjFFZhW8nA70nFniMJ5/CFchnI3w7vE1sUW
	3To+/4/ZTDrHbDajvLFfE0A2Tc1w10AR+/bJy76HS7MFVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyhduy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 10:22:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ef13b61bcso492101885a.1
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 03:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788430963; x=1789035763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MWzDrNxzthWPdsVZldsnWvMx9IcczP+HYo1LJtEAQps=;
        b=iHCvlG6Vp1u7EWzgmoAR3o1n+AIUN1QOoekf8aA8lDEEJDGUyrepvCUUcG4zorY1iG
         XoPnpmWX1XiHAfNFXNb7wnaX9rf5EQZtU12HBkgbTdOl3zdnJHo1jxlnutaso17Fv0nq
         bf/fIhdN83dYv8FEcynUG/QnsbXGW2L/KiSOzA368HqaMUVn3jlM+aua5Krug7ZwDsOR
         tsuheBiNLh5XtFGCwjdLIflsNkjD7/ZguDQg/HeSu1+hwJpx2vY1A+lSSGF9rLmVzanD
         1DbmR+IOnBuDFbB+dRQeiM376v39lDDo7nMjZYRr/hyjytOxo0dF7CSfGgl2SjmhPftk
         joXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788430963; x=1789035763;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MWzDrNxzthWPdsVZldsnWvMx9IcczP+HYo1LJtEAQps=;
        b=dNxEDtbq7iY2MYw7FeK3Ifuiveo2PieBaLHF0VPJenYczCNnxUACXwC+ZG2VBtR+C3
         C+VfBny7sBHCOIKnpySOS1A38megsjDiCOsbaEH8tlpKAm4LWGQ/+dzqwdvz5Otmoi9V
         rxzM/jnZIchu8mqg4GPYdzDr8pHi352P3kK3FDHwmNIkSwCpLclmKX3OJj+Ky7qo3Nmy
         2YI95qioGtd8zjcW4bTfJMgFiNmRnxvu0Y+g7WQCdvW5kkL4pXeIUNxTmJqe0uoSOca2
         x39ketkvJXB98YS4xNWDmLo+MUTlg3r6w4KwMlQjtTVHs6ySc/CMXxFmF9vkNt9ADFtM
         umXA==
X-Forwarded-Encrypted: i=1; AKwUvByIwkxyD6IiTiYZsm4JlVXCoZtj3COl6xSW9+5edEjVx7Wek8j1P8S5J3JrYHjzXHLVs03pp5eZ8Jw=@vger.kernel.org
X-Gm-Message-State: AFuF++luhksWFOJrvR8vyLr8p0IiwSYr+zdQy31jyCi3fK9myP+wtJ55
	ILjQVjWvsS5ljIiAymjXH2jS+poR3QvjkKHKeKBUo0IENOAewO5QhtmK9g5utI6nOhBCJM8iwPE
	MrhWJuw1/Iq/8CV1/6FgJsewYWkK/TYRihMlBLXW5gfMSpei2GoJVHgJkBZQsJgo=
X-Gm-Gg: AYBFou24EO22niT3M+awGcww2GI4rSmD+4Tdv7JZu8MwAVyKxGOjFviOV/RednUIhKb
	+VUDqsIsMZXqGsyLP0HAFcwSKuRnO+E1JOFRqaOgMYoX7n8f2ik23LX/QLxy9v2L1jXIrshDl5m
	2MQK271s65Ik5La+tqTj6y/+QBP02x8dZxTg6NVxzlrN4v7QSno+LF3eXFe/CTbP2OelDi/4gRb
	TdMOV4TOGKPcFn8aLWDTd5ccMljmLEk2WuekKg4hbfydIwimOGc66aUnH6QnMO3WUNprQwxA6yl
	TuGAWizMmqZspXdJUM/8L6j3RmdL1xdli5RApZeQ6xnQC+4MBy2xpeaEC0wXGp9q9AtrJDYDsQQ
	uFzDQBlPmLRQTwA==
X-Received: by 2002:a05:620a:6010:b0:939:6132:62cc with SMTP id af79cd13be357-93961326388mr1435828985a.27.1788430963442;
        Thu, 03 Sep 2026 03:22:43 -0700 (PDT)
X-Received: by 2002:a05:620a:6010:b0:939:6132:62cc with SMTP id af79cd13be357-93961326388mr1435820785a.27.1788430962820;
        Thu, 03 Sep 2026 03:22:42 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5e589bsm55667075e9.13.2026.09.03.03.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:22:40 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:22:37 +0300
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
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/15] interconnect: qcom: Add Kuno interconnect
 provider driver
Message-ID: <xkyj7x2chonmrovnwaosd7sci2txi7bsbpvv522uzxdonkke7y@5kpqjal3i6nm>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-7-6d47636a8f09@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-kuno-soc-support-v5-7-6d47636a8f09@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4OSBTYWx0ZWRfX0VoRkVtIhh02
 ubQT2YaTF98Tvs6Gn5wq1iFCrBNJEXwZEBI6dQMP0ozZPeeEBGlrRzIGNrWJ20C5HRAd+z7BmWY
 h/DGbAeG0Je4rD4GLZvzzsJo/c6tfjh6v3Yreg25fUL5mriw74l0xnE1o5eOfP8lwj3Nbmdt9F7
 K63RQXMHXfwFOp9NhH2qH49c9HlAA3PJRQcWBKBBXgXE+pa/aatf2Bsl/BAdJ9impzRD2bCCvgd
 iK7sl+Cmldp976Irs7716XEIqBIIOxvPlYYaQnpZavIG2dKKGljlxyibldV7gNPxgdi63hrEP9p
 WWX3cRXGR1jSzY8v/kAmVaGRpeXulnQkME4HfEXZ4OCbhwA2Ji8qr2p85Tsq1gCxXw3OGFXBwWN
 wBSLmiL9BUloOg0mqdSDwHAknGsCs/nAxBqwi31JHNLLVU9BzstgAGTyeCsWKeY+iO81afuoa9C
 JUwlGHRf9dorFlJj5nw==
X-Proofpoint-ORIG-GUID: yZyBOs1XsD9qxj4fRxkQpzVtEUnVoMGy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4OSBTYWx0ZWRfX9Js5EGOHncbL
 mSJuGBI6TpSoN1IRGG3Z+Ex78kl29t65cD7wBt6TZlkJj3XJ7a+p7b0Bu9F6IdlMgK1KrOlngzX
 l785blVR7PIjUsi4YxSEf8k9aj5iVos=
X-Proofpoint-GUID: yZyBOs1XsD9qxj4fRxkQpzVtEUnVoMGy
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a994a74 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pe0felBmJweB1gBNqhwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030089

On 26-08-27 23:21:10, Hardeep Sharma wrote:
> Add the interconnect provider driver for the Qualcomm Kuno SoC to
> enable bus bandwidth voting on the platform. This includes the
> aggre-noc and cnoc-main NoC instances with their associated BCM
> nodes.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Looks OK now, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
