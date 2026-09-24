Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61173DDAE1
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 09:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243194; cv=none; b=tTv2nF1WZIMho8CQtpyrcQEsDubsJAa0Qxm4uX1XoiuoRWYY3n29xxgPWWybIgOct+o6bY69Um99hQFfe2G+uYzOKZYhx6Ot4yLyA10HEFyRdy3sU0viA3Q6ZMFG2v0d+6Mbu1VTVk1Y1QUhf7jAiEAQkZnUZPuNGlqeJKeXUZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243194; c=relaxed/simple;
	bh=BKUDHptu/pTStIcuP/3NukT0Zd0pTYKYIbdx/fx4C1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gliQx+22ORgZc9DI/XeXNYr0RVFoBiRtJNixxG+0GHLFkcP/ZVHqD8P2TYXJZ+fDixjMkU2bdiPxJnH4Jkla0eqMjptpjloPLMt5gUYCUTkcXXv+HQqleDWunq9Usx7wQT6CPtXMqdyspq2WkEN4vRTXAlJYBUsFl6c+AwGghFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y46bAqj0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWpzU8ZO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y46bAqj0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JWpzU8ZO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9Poj91270859
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 09:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6m4Yo8FaInz+j4YxvNfbbwU2
	rN4O/h4O+OLLY3MVmc8=; b=Y46bAqj0B55P90xFi5jZ4tm3jCQgLYZwUIoqKhup
	/xr7OFr3LGS//QA6l6kITgOFHeAlRRHyA1+CkbCUYlH8JMMBGy21h/AWDEdF7qBx
	47QSwgZIMrq3x8TgJB/P4zNn4BioRhAEvjbIwBqdhwS8dejXAnAVXPrO2QtjUoe/
	PAaacbJdJ98DMXorL5+5HZR7Wxtzt9MD78PR5lJSsZRYVXnkYu7JZeVnugbX8zoV
	N3j7K+a3UYum28t/4yRoneoUMt/Efe7vQdNPS2C2WtOxt0UibAREbkXeq2ID0QRm
	tnRRCqgAH4jew62HUJV+8le2RjjmvKiOr14Lrb7XpbSEBw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90a5nn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 09:46:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33baaba6371so2033678eec.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 02:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790243183; x=1790847983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6m4Yo8FaInz+j4YxvNfbbwU2rN4O/h4O+OLLY3MVmc8=;
        b=JWpzU8ZOs5N3UomK188yAIrtU8gBkTYfVcuE04KaowI2XnWGgCrW925sk9Lda8zT33
         oT8Od3UP6BNs9LkXM4RhIv9+p2+0As4ddhnh/VUKmkCE9/BVeO5LYobU+EhVpE19+3K+
         L0ethqQjDF2SBz5nH/WRJXB6hSB/76vv6i3qK07EnPfE3cg0KucbHoHSgX/jqNfWl/Zg
         qdhvDnbNYLtxjq6zoOYBZtgktYDS7rMZ2wcvlI1yzgGvBDYGGckXgu0iZNdRabOfWhqv
         DsVjYQBkE9w8xq9dgGpOvEaKPwxgF0z2RP8mZoiysCOIJk8B/GJIKnJQxaepZYeWxVFf
         o+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790243183; x=1790847983;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6m4Yo8FaInz+j4YxvNfbbwU2rN4O/h4O+OLLY3MVmc8=;
        b=mGXOblY1/ayoAtOLNRgkUmTNTxyU4rIuKdBzea5uXRbHOeujQr5KfF1S7RdB21mCGe
         nsVzo52L2/yH5tJkjPunXMRJ21YphmQh3SIjzW37mNFsmprrnlu5TA4jvKKs6k86mzNL
         ha6z+LdlWvntM7zVQz+gBcgM3Li3y+4Q1gyevOBbLwFtFJA4RlvM13K8YEOzsfwczCQ2
         O5C4RdGjdEhIuQSQKevjNHyzP3dIibHLeOuGhGzQrnF97KaqH28Qslg7VQ2XZFlVCjo4
         iHtIDCXp7VRNk7niXu0Mwgg0oM99JmN62E3OC5eGPYMLgTzObQoO+8zcSnbsCg4Hz1pS
         DfCA==
X-Forwarded-Encrypted: i=1; AKwUvBz0hzHLprK7VFR+J4/76JZ/zWEypTIGrkFuJBKiDmXORlMoEvwAaWfxWWwfkjMX1A08/nP4HzzAD5o=@vger.kernel.org
X-Gm-Message-State: AFuF++nsevdROQMnaqtB+BnuUt8pUmTlW7R4YE1s8rZ9Jx6rWZxUp84W
	D82zmtXDWEhQN2voOvaVZmpneGrjnIg3GrBtXx8F31RCwrDWD2Xm3puc90GmEDgdMb0wFg/BWxG
	O5YS7aAEIAJV7Oevw8negHPzCCnq6k5BjGGu+W7jqQbXAdrnLAiprqCsrU89IEPQ=
X-Gm-Gg: AYBFou2OmBDidacEXk6IouMhEUb1oqb7jDXjkLtYMkzDg7ayplGP85vLIztyXgZtAhT
	jPcb9Boi+bAMJSxdrUxY3D5Pw24FxumG+GINKRAvW9kVqXj4pfORvINGRCQzk6uGrKGc9odyrpe
	J4+12l+aWw5EtRV4iTYwooUIKNd0B/0D0zVzytcFqg+7BmV/US/WIvWm9mSjlAdN2XldZHYbX2O
	egjtTJhTBEwpm/RYIwmzSVoQu58GGCV17ft59//TZOkoK+HnwZCuhMnlgxWx/aSLxOfrWF5mC/u
	L3XMMCV/iUIGVtinRLha8igVBy2lNBkWzasBIJoNMBRO890DbxTp6KxZjvshbjx2VW81Bu2XMbV
	MUwFjqP2pbmxe3wA4FxD5tmsuSrC6tFDIznl883pVIw==
X-Received: by 2002:a05:693c:66cf:10b0:33c:e9d:6d4b with SMTP id 5a478bee46e88-34003cac91emr1522055eec.41.1790243183376;
        Thu, 24 Sep 2026 02:46:23 -0700 (PDT)
X-Received: by 2002:a05:693c:66cf:10b0:33c:e9d:6d4b with SMTP id 5a478bee46e88-34003cac91emr1522039eec.41.1790243182838;
        Thu, 24 Sep 2026 02:46:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9bea11b8sm13829938eec.7.2026.09.24.02.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:46:22 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:46:16 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc: Fix GPLL enable register offset for Nord
 SoC
Message-ID: <arTxaIIDkomvxfWp@QCOM-aGQu4IUr3Y>
References: <20260924-nord_gcc_offset_fix-v1-1-230ffad2dae9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-nord_gcc_offset_fix-v1-1-230ffad2dae9@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX8fWW5exVEbdE
 OJ2Ae/kkyiQB2hmDkKZMUsqqIpIGhJXrDRzwMk6X1Uf0ZnvlwOvuy61LWnJMxzmTbY9QQ1Y85Tg
 3VGUdEeQOwBXwIQ5Pr0twf8dleeGwn4=
X-Proofpoint-GUID: XR9_KvMPaqxlvb7k_vxzuvtue22RAFVB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX5/y9BaJD2Qb1
 4b91oCSIIZQP6IGEKc/z90NsPO8u4TqfQhUsqtJiNwYWCcYI5u7aOnuITo7bPa4ZZ3elP60dZg8
 BEtda5djgZDIh+050YDfjY8ezgOCaqJPkKseflTi0Rv0gF0teSXmo/9vLroTuDcYClY5gHcjsHZ
 bvP1vRxfJYcRHSv2yPIyhdmdief2rYE9m7hpIC+LCxoWfRya8VxN/t1Ay7aUcpOvMwoqIIcY9uA
 OWu42Dz4cRNL8MPCK2L6B3uBtKEo9LqC4E1dkPur3oc0+js2fe8tLFkQ0+czt1ZHXDBFlKQGLo0
 rpdx53ULJvHEpjTsi5+eEgg/AFR5EQlk42G/+aYqhCq6BHHCXCoqcpUubw75t/0J1L4TjHSyQFI
 URNxj7SHUEe2gyG56gff3NMIO8RYNHjNsB0cChAHxDYCXKu2F9d/8z7wnl3ipdpJZ77OKGlgvvP
 Q4BSmQ7US47S2bMhfeQ==
X-Proofpoint-ORIG-GUID: XR9_KvMPaqxlvb7k_vxzuvtue22RAFVB
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab4f170 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7o7Fz_jXMTEYJjNRgMcA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240040

On Thu, Sep 24, 2026 at 03:09:56PM +0530, Taniya Das wrote:
> The GPLLs in the North-East, North-West and South-East global clock
> controllers on the Qualcomm Nord SoC were registered with a placeholder
> enable register offset of 0x0. As a result the shared PLL voting register
> was never programmed, leaving the PLLs' enable state uncontrolled.
> 
> Point each GPLL at its actual GPLL_ENABLE register (0x57010 for the
> North-East and South-East controllers, 0x76008 for the North-West
> controller). Each PLL continues to select its own vote bit through
> enable_mask.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
