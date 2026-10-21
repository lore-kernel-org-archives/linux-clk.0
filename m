Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571999;
	b=pX2Oh8+RYL/s575NiNWLyfI4/d8r2apNNRhT2r6PS3il1Uja5DmKtvL8b+iIgMk7DFnr
	 KW0LRu6Eg6S0EQYDGy6ILfJY88tidr4RyS0GbB3qJm6ENPwsu9o3CHBvOwzcwWnRVcJIf
	 9rNyBopoV7Ng00U8ZWlRCZCZBv5gkMhHrsYrAZGtAruVFZgz9UteKyCGwhzpsKbNvddSx
	 tXHTbgerWAVRjsr8VYmS6obRNfWLl4snxwYrJG+G0JvCfVlW/pIcKPlUg4KFQfXxMLMlf
	 BTh1nfkiFRP17NPB3ED0Ihb/sZVdKRBcozgJnp/r65yTCbPqttrzmhHdsG8R5XBH1qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571999;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Eu+VlkZRyZabpCBno7qI5H9BN7q4P+DGNA4Dm+cX548=;
	b=ZdmvC/scPMP2/dWMjzasCRAC0hCBYCxSjLXqD+jGq0+eA0qCDXWh45H4zr1vqKhcD/If
	 XY/Kqxa0XJwUHv+4XRJssvkKkyBd0mtpIukAKoo6of+T1iW4EULrBXrcKMOMN2uMDdTEl
	 tKGZuNEmwOvaGSSQEX/dtr3fH9ZQaCdOYmRLYCs8xkk/LjxGn5tv+d+8XH3Z9jk5PbW11
	 K/H0HDHEdjwmb0DF+Bo0svUkv6vjlexTnr7uR4ZoDJgHhyNNI7LNYz1vm3d77a8zpJYvw
	 B2HgZI3u4l7WogWTEDJhHSepPYwymecqiwFMwDFCMOQMjqQMywRpHIPvSKDF2weOJBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="T/qx+OFc";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DJKu3I6o;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7415260A2607
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 08:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7415260A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T/qx+OFc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DJKu3I6o
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j7uP793404
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 08:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Eu+VlkZRyZabpCBno7qI5H9B
	N7q4P+DGNA4Dm+cX548=; b=T/qx+OFcw9/2D6aQFQ52yElW5d9+dtOlK/AYphrn
	1Kp7TdIIM468zvynEAvijO1JOOeBLIl447DdhN+9JiOY5RjehQVo683FKLlgnTCj
	nB0sl6YcUQZ6sseYks9D7M2fyJlFEsxloKuRlSLUOMxjdS4Ekk+VmHIr4xo+S5XO
	aSCjB1TPVJz0DQkhvpPcSOessj+f0tlYKgAegUGyZEwBe+C8fIFypS6noTiper5Y
	MVJ1AJg7ai6n64bi3jvMsKsjH7AR9kv7zRSbNG5iDPnEm9738wmzlawdMkn4cPO7
	WD3up+RFqEmptY0SwGP/A4RkYW5GpL5Zd6jIvn/qA1sKQA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabk02r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 08:39:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caa0ce0cdso63685685a.2
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 01:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792571998; x=1793176798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eu+VlkZRyZabpCBno7qI5H9BN7q4P+DGNA4Dm+cX548=;
        b=DJKu3I6ozPRQajuG600bNUKwedCy/gzNDD8EAx9afw1KYbpnRUYC1grggvaKNrvE0E
         dTCzi/Re9VfBmZjmqjGCrG1RKgF47lAXutpCDIC9igoyKEYmt7+1a8zkG/110yf4YHI8
         Q4o89X4vHaA5bKSwE1Geagu0FVl3I7IorfvqKhsHz5ykv29JXUXwLNpeAzXzki6ufgXK
         tj/U69B712pFQA/RJtBqYwUJt3kMa73v2Zo8ft0saux+r5HZmxn2hvGfzFGXlSU1d9A6
         qtT1iTvEiGt2DxtJrM1yh4XFc/+/MvvIeYgA8XK7iCONWKIj1RHifpdkvtP/IQPJQre9
         MBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571998; x=1793176798;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eu+VlkZRyZabpCBno7qI5H9BN7q4P+DGNA4Dm+cX548=;
        b=arNGeDAsg0lXECqtZ7CQTfHrXHqyTdUCKgtft16YUNKTtFvTmDrW4nOVc7cIeFx7Vh
         Ym0PsVOBrnLznEc6Ia2ABnrhipmuFfAHr2vJejgeVDqG//HAv0UwgYiGgjkOeqPMOoTH
         jFya9nhZkfKwV59KKrvTLIV8/l16TRTZ1G2iVhrM0NZRzyTgKQcixWSfaWjh1Zp6yWen
         P7GkkTbfi63woKMSNQxdl3tJ3o5noLX6vz3oGeNMH40Z5hj4mMxqzhhtXE4+FuwYI38K
         g7MnGevkvtXGYPoXC5cp2WSJFFnw7K15tXQ9aN3G/M2YmvubQczbpWggcWe3PZEeo1dA
         PN3w==
X-Forwarded-Encrypted: i=1; AKwUvByI5teR1LDuaO7CTeVKaOXZtH4HUizbD9XSrdqZAC+NAfu6pgRAECotRJ3ymaDOI9gBx3FE0wsZ/hQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDWTeH9HETFi+doH6e+tXR/hlX+hr4DobJ896xZ+b7UurBG50C
	Q3iMHnfj+vWlPriarc4Sli6ABcJdc6MIBmfzFTUD2hKzu8J6vBjVYG3WP3QXY0D/lQbQV3K9BEH
	hF7dmvW/E+eFk+WygWTvimrDYKtvljNKCtXp/uj9VZwkoNDmGzeNy64bFEBJ91hQ=
X-Gm-Gg: AYBFou2McMnUgOfIN4fE2e5zduzVliC9/XyLKHOYMdK4RPmhsWOJhUIGVJUR5rsadFz
	nZts8GOBiEzSJILCfZchhqBbRAIWHAHdmnBBAwEr4O4tdhNdbTTgogPkhnQdDpgAlRfyr9g5kWP
	kCQfOhCG1fozaj8OtGEuoh9nHbe+4KhS6Iwcij+PECB8zDkgHJN3P9S6hJiCp3J+VuOaG5H8zcq
	Jgx/TbBnlVzKzTY9Y+UnB9w5Chk8bpwJZNzaVoefWPLX9Cog83Jpue/qMZW0aSn8UYZj47kidoK
	AQa49v+St5qCPdyvgfo1XalGK5f2MMdEbjjw/LIY3+tXID16+xrcNOJY/UIIJl75dtqsOTs7DkP
	6EJwU2pO+5xJlGwRb
X-Received: by 2002:a05:620a:44c4:b0:93c:b7f3:9f5b with SMTP id af79cd13be357-93f57f8184bmr302264885a.45.1792571997371;
        Wed, 21 Oct 2026 01:39:57 -0700 (PDT)
X-Received: by 2002:a05:620a:44c4:b0:93c:b7f3:9f5b with SMTP id af79cd13be357-93f57f8184bmr302262085a.45.1792571996712;
        Wed, 21 Oct 2026 01:39:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581eed3sm4383464f8f.12.2026.10.21.01.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:39:55 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:39:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sushmit Singh Rathore <sushmit718@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to
 bi_tcxo
Message-ID: <eqgi6p625bizyb3rnrwmdgnnzrwja4w5cywdy7rjdgokfc2vd2@i7e4da5ymatc>
References: <20261020142157.1749-1-sushmit718@gmail.com>
 <20261020142157.1749-2-sushmit718@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020142157.1749-2-sushmit718@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfXzmAoC0A/Yq90
 XWPua5Lwed8tGThIIzQnIxwDGz6OsACS/bSamehXk0URfOVkPWwWYJs48942W9djFyiweZ/P5PO
 4vNIGWtTf5CTGHWUIfO/r/OgIdBnc/w=
X-Proofpoint-ORIG-GUID: _FSLm6H1oae6MaQcMdcQpP8VLlxhLObj
X-Proofpoint-GUID: _FSLm6H1oae6MaQcMdcQpP8VLlxhLObj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX+5kDc/vWj+F5
 RovpdUb0hPMnn7IgnFvwl7/kWoVSZKR5GiRJlqbVfWkSSqWlPKn4M0bfuyVQg7BqRyIAgH0Jhx2
 ZvbmPbnIjTGLPNMLC7qReRgN7VQxO8nkIuUO5AMTsLqiKfV9GJhQqFDraoNysr6niaD4HOOkxlu
 zze1Ikgx4fJWzYvqv7J8SKF29H3CVc9XcQP8iJQ7DyVdc+wTdrNYZYYuGlHg+NcH7JLQRHGCszV
 TK9rZ1WfQOcF7gH0IVx1r0PECMvRo012GrVAOgIlLwW4usmHVK8uWAf8Nri37GJWPefCZpti6Gn
 sXCXa7zqWcQ7bxlhYBYciB9v8xa9H8G+TlUTM74wjTYIYVquynDqeofLJ/c7FfpiW+sL4xBJpvt
 /3ERA5PHpX24CO827BYiNyAzy+donWoTu50wXVdoI8NueeGi75cDvXEYCvXk5dFoor/AvxhYa2q
 m2HAVXkAM0FK3Q79H1w==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad87a5e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=b9oLyuJ6L9Q2BeRKDwEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210034

On 26-10-20 14:21:29, Sushmit Singh Rathore wrote:
> gcc_eusb3_0_clkref_en gates the XO reference to the eUSB2 PHY, but it
> has no parent, so its rate reads as 0. On SM8475 the SNPS eUSB2 PHY
> takes this clock as its reference and rejects a 0 Hz rate as
> unsupported, so USB doesn't probe.
> 
> Parent it to bi_tcxo, as tcsrcc-sm8550 does for its clkref branches.
> 
> Fixes: db0c944ee92b ("clk: qcom: Add clock driver for SM8450")
> Assisted-by: LLM
> Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
