Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794503E5EEF
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774619121; cv=none; b=JNOTJqlcS6ix/tgNdcS2M9LiMhd7ecgHjQQ+b24Wmqpo79zcGuuVC1mRv+q8tQPRyZREmCh/MY1JjUlILmFnmuCOqBcoJyirEb6MGNfwcJzBedA30pfuj6pVpEY/1yZ1rYNKjVHNeZyPzwcNqAQ097s44kLUUkUNkUW4izIdNvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774619121; c=relaxed/simple;
	bh=DwcUac76vV09RAO9Jg0ZSLv+FZ3B+zJ71gF7JbdPL+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQ2jF34eFVEOYROZ5qN0PFjugaqsWGbsjKgwzIXsPlXI+Sbp0Z44rNvlNmtrbuBRg8kDwvjOeMeEcBZRa4yjTGYom4eKWq+XhFWNa97ub7VhGJYQx1bnSe2NL0/80dbhSagm6U4swB/pZLL6X9U5d0JlvH3n/LnvxOw69DxZhao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQA04hkK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BdiHNrsK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQA04hkK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BdiHNrsK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDho67316887
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 13:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XoentRkvS13HRF/jsn+wflQZ
	jGBlnUMdtdu55OVBkF4=; b=JQA04hkKdNHWKzRrGCogVYxXYRgiHrJ0hToiEp3u
	o4hgKW/AMmARNDzGoau1KRj3t8ZZgMXESNSmW3zys4qIxESWOsw52zhjN0PJl7Oz
	rK6FOEeYiGEOs4saPVuXcj+1PQtXQC1k1dHiJyIELOGd/3E9Tv+Drw3Bllu8JEUG
	fWBSY78qx75QF04MvzaYuNvXhrL2VGP2yZgYUkGhJ9da1A85nDHJZTcr2nwXj6qZ
	WCimS5g1pn02PHPAlf9LvEc3kLjjqOHPu/m1cqbJlDaowmJ8UdociG7CviGBvISv
	Lr9SEX0Cs458i2GkHURaUWwZcr+11GBGshtvuPC+RB+qmA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59s43pwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 13:45:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4031b86dso65732381cf.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 06:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774619119; x=1775223919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XoentRkvS13HRF/jsn+wflQZjGBlnUMdtdu55OVBkF4=;
        b=BdiHNrsKZjUKK/els+9dW35kh0ADht+DwQCunO1o1mup6+qPMJ32INqiY5AEJ/W8eq
         PXURmvtA1sTGQSigfOHkK/zt7yut5Tg21U0KpmyGhLm2fVFEgWK95csZhPuKLpv1fxNq
         +ekLpBJiAb1aDNgrl318Sbf21bXogRypVI3qcOOs5yDlNmFI4bjTtQ0X+/ZCdZ6YmlAJ
         3lBuJv8lyxUvxKUr7B1tP+WIorPJ+edJ2/L3mNIH+U2cEaTWiuB1m3DdaHngt6wqyGg4
         9eZ9FTIaQTVOKGu+WNiYws7J1aX4xHT/bjn2c+ekIN5ZuG0zsU/yEAg/N3EA0kPp6F1+
         L/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774619119; x=1775223919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoentRkvS13HRF/jsn+wflQZjGBlnUMdtdu55OVBkF4=;
        b=DXRCHLxYzZ4D3w7eZ0pBz+5rIv/gqIgAaBBmpRUQQC5iBGz4YLUp4Vfzul8vOtsVdW
         mSxZttCcIsX4e4HTvG5VCYyWO2ivbQ5NbSyDiUj1CKMbGraXGe8mvcbLxwotbUT+TNsc
         QMYQTUCeC0mPfgEVJLkBGpDmw4DfeA1XxvdpNCWw5tC1VVbOdSNjJiASlIiWCojQKmnK
         /vUnp8t4ve9Z/u9/LXn16iNY4hC4+ZL9l2Rw+hfFGLe0dh3vfRNaPpN8EpgUOyhc/K0l
         UJzyIlXHOx6H49oqfuOsgJrEctzWPyLZ0CCnIFMMDzoji4K7LhduN2aCbiOZVReqjIw9
         u+/g==
X-Forwarded-Encrypted: i=1; AJvYcCUdedSATUKej3a+DIdnIr3QXgUtKork1EJjoP0dk+fKMA3dLxAmdbMKAe5WwMiWJX8ZjV01Dw3tgT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YytyMA4BTXo/91agxLCWiwyadGHxHLk4tVjJKDA1vtP3hQOBHUu
	5wmCYyKAyDXPo+bftTdwtofwHJlRHDoDdi9rzWCdBeH9Lwf37O8G0znPU8Hmw5vMYLPhARk7CXC
	oJTdD5CGCgKV4PAml4bOSwIWomfGpQ+PdxWW4kgjpQ6nTurh/gasTDgK6B7kkaFM=
X-Gm-Gg: ATEYQzxNHh2WX7zVzmf8+kLwCRKatig+ZwRWpWLI/H6+qO66lo3LjWAqvZrtCZqq0kr
	Tf9ZS7ZQW7bGnEEmQZfROXczFWYwKh7lmSxMgvstVM6/p7AYLxJa9DcVDW+mo8EV4h1A5Wp7Pz2
	NXZFKhXXtxIDaPHX6Gapji/jo9tydpSi39WNS+q2la3O+VoPwO+gIaSYSXhSUvTCJwDJU1qcsTp
	njWWzTOBS/gOIg32gJHsyCZeVXnE4KgEzZ5imw3cH/5MAVsIHsAx3gqCHPF+DugiiqtJ+oCdx9I
	xjVUvQu7IU3FHjh7aWNxAHmWtVPArz7kbArX6FtAA+c5pbNg/N+trqEsj8pw6sD8ABmqzktQ4oc
	PHZ0Vl5deEGQL0pBdCsH5VrUmiowcojxx2g==
X-Received: by 2002:ac8:59c2:0:b0:50b:3831:417f with SMTP id d75a77b69052e-50ba38b227amr32993751cf.45.1774619118784;
        Fri, 27 Mar 2026 06:45:18 -0700 (PDT)
X-Received: by 2002:ac8:59c2:0:b0:50b:3831:417f with SMTP id d75a77b69052e-50ba38b227amr32992831cf.45.1774619118209;
        Fri, 27 Mar 2026 06:45:18 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df85csm21164885f8f.28.2026.03.27.06.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:45:17 -0700 (PDT)
Date: Fri, 27 Mar 2026 15:45:15 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add missing power-domains
 property
Message-ID: <szijgc6icwkzlssrxa5ceawgzaq73jo6lei6yubaxltbw64x5t@ru6x7a32igji>
References: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
 <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-1-f14a22c73fe9@oss.qualcomm.com>
 <fb5a1d45-822a-4894-bf89-026164491935@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb5a1d45-822a-4894-bf89-026164491935@kernel.org>
X-Proofpoint-ORIG-GUID: RayoY9_huhK4OmLrsQT0kiMQgkaY8xcA
X-Proofpoint-GUID: RayoY9_huhK4OmLrsQT0kiMQgkaY8xcA
X-Authority-Analysis: v=2.4 cv=CoGys34D c=1 sm=1 tr=0 ts=69c689ef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vx3vbEJZiE0Yo0wITGAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA5NCBTYWx0ZWRfX4zhIF1qTSNgT
 Coa0m+eFfY7FBroAbqrsSGE26slHlRLVXpz8lxzi7hfmUMt6TXQqpMchpCvgjTzfFPeXIupRM2Q
 44fcCdOxbf+wS5MT+pORQz8dC+1uSBiDlryx4VFSe1yMpLG5zN8Z978C9M46WKVH2seqI8kduZy
 YR14u3la7MdGxZ0Q9O5TRQS2w1HDxxGS4pS9PU+nRyaW+kmLCl0C+pdHUZMb3vYep5EhQN4kl3o
 hODyxNZi0ITgy/p6pR3InNA4J/zaOPjINWgE8rVOEsdu1duN7KpNJdDXV1/9ALHVx5H1YGKU/Z2
 petsUNF/mOTSWPaTwtsSlNLX5PfkWj2gUhsBNKfZtF0JJFy3WGSNyyO+uohBQuDmYPp9RK1YWqx
 tzhZQ0nLTEOXrrlEAtnlZc+acoB08CFDbaybDHSF//gZS75fNX/7GtQnoJHj52rRm3LQ9As+h4o
 +l54+QoyT08hZdC9POg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270094

On 26-03-27 14:37:17, Krzysztof Kozlowski wrote:
> On 27/03/2026 13:13, Abel Vesa wrote:
> > In order for the GCC votes on the GDSCs it provides to be propagated
> > to CX, CX needs to be declared as power domain of the GCC.
> 
> I assume this is true for Milos, not only Eliza.

My understanding of it is that this is true for all platforms.

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for reviewing!
