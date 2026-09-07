Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D236409273
	for <linux-clk@vger.kernel.org>; Mon,  7 Sep 2026 10:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777062; cv=none; b=fHLQJr8qce3pnsgksOVPJtUUydkIWIJiQDTKQ5YPNnolw2Zpiva4A7Oi8XqctofhzriIPO85xKULNcL+Pg9cOZXnRyKfpo5FmUL7wvSl9KQCKsUrhRcoXtaL+k2T0dzUwFrz5kIxb6ML8ZvK1GALZFlEmFhJ0cJ0ULW3CdtdKNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777062; c=relaxed/simple;
	bh=TmrWz6bOPjP96DJHHe05YDQ1Unf2iuG6IEzup5sn/bY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCjJPUeNDrImCVdjAqHYlbOBWlcPDLHytTp1DDNffIQPIAw9XHJSVbHMbsWqOTVOmVfHjbHRPI1TwAsH04Xxoo6pYnQOfNI2oWgKjHU9sDsFBl1SJDoIAWD6HR8caT7oV9k/k93ul4jZ2VizTGdsSgoQbzVvmfVo2pt0SszlXTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkpvtxPk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGQmOK6u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkpvtxPk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGQmOK6u"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bg7J3189667
	for <linux-clk@vger.kernel.org>; Mon, 7 Sep 2026 10:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8MKYzD38ejq+QfCLrmAsGoMh
	9k2OMHUy0zDkIWzsaUI=; b=MkpvtxPkSNLm0L6xLv7oq8exFlMxuY55+z81JB4F
	YUNTYHSYkLaOENAyDw2RdHmKCGldRwY2efXjXPAEZk7aZ8myLk4bAOfw5X2lBtC8
	s5Bl6HJH6nuG/YA5RLdJ5lHz7UCMCZaTneXLTzPTgDv7wkzRsdtzj5uRXVXgWag7
	SL+NJMTPKrWJ/K/QcGhUDrVbaGsKVHEw50bh/2HQAHg3mWr6V8699HoaVymUDZRB
	6g2wlAh6CbVCDJC5t87swBIdkXUj3jWN8lKHFfCDErUz/KkH6u9ZEWzj9GYAxIMT
	W4oZ5XLk2r9SJ2bkPYmRgRBzlOg5WMFpD/CFkY4ED/5Zzw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx0bes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 10:30:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494cce712so612343185a.3
        for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 03:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788777058; x=1789381858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8MKYzD38ejq+QfCLrmAsGoMh9k2OMHUy0zDkIWzsaUI=;
        b=cGQmOK6uKD+ecuq9btDIqTX8gQ+3Pdo7u2YKjiqSrFflYbkOclep4JVfn6a+W8sNJR
         nzyekZuAMGLz79ZGfUatolrBoajEbDst2ohDN97HssqvY/AzhbmVJIKi3GO5wOALZuNR
         tX/yULnMJ7XTK9eAuj0AGYcELRRX4T0c0a67/FKH9d4p7Wl8l9EznoXCBVptD2pgPnm0
         V8mCNMB6y3lQ1gVQYbqMom79T7WPP+PW3ms0c8JRAaQrnGkVkYvLFZRDG0fFMGppbxmt
         NxaYcyegTf8UG4iL8OMAe4egs6MOfa7kbmPZpNwJ4O7IXiZGP+BphgeDUa+kYzwOCA2p
         A04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777058; x=1789381858;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8MKYzD38ejq+QfCLrmAsGoMh9k2OMHUy0zDkIWzsaUI=;
        b=D1rGKPz2CFmN1BEORrowBw3ee5mTdaiDxBcAoT4I5oGxA211VN+xQ2gkOU945RlYC7
         jU1rm+qyDznrXswRXwgJf9pUl5gR2HK/MHuz+QRXcKIPABmjTlEJUFEp2AYxagPcVqJy
         l5lk9iaypYELxAPA1U4DH2G+Rc1ZYkjANxPin1rjkdxQ42Ku9J2/+RZweJlXKkcUfEVx
         qqMb72EWfzwT5t+70NcEDz9XFfcq8fU5qWt0v6YmJWD0y89UzF3GZbQNlV8nQ0tKoUPF
         AkeR1c8VTjGVlaHXX80Ln4H9J75YsU5YQdsNV8UvfiC2PJ36xPTT5I+yH0iXlPlRviLz
         AotA==
X-Forwarded-Encrypted: i=1; AKwUvBxX+0rxqZtodccBag1EhmZQI96cDRkMQikjBTGj7jFkNQxL/DZT5RL1jJSlO7X4vDihoAAX1dZAoI8=@vger.kernel.org
X-Gm-Message-State: AFuF++kFm/bu0uDqbLcQg3bgVQR8roL6e7tuJJQsBXQhyJIiMUZqbsoJ
	OQMemVmfnL+DxBPZd760aKfwhwmjU4oSM97/N4FJP97o1S+vXDHPhuXxgZZ4KNE2UNjG0wFsIDO
	E5+5p3wv9sbbelnB5f7pmPMUztAU4ennmmPnTfpQs/ss/oNeAXA1bYyqwGXfuWJo=
X-Gm-Gg: AYBFou2XMF02+Xk9xu4SmAot2Uskdyxj2+UcFbHywrw6d2+i2N6/Z0KoNsuVZ/p9gBc
	x/gwgvIa2dgOgd8we7WeZaCwToBsQiVMnrnYYKy69ZB670Vlj3MHkm/sk9NaLZrcdc/GeHriMpF
	eJVptPAcdNfno6c+GOzf60HLBDL6C9tFh0neIpgxKrBKm60KSmGjGSJG11oPWGH+NmMk7eVTEqV
	6V67tIOPaNrpV5rvSnIq6G2WoNUZ4pdWRG2QzwulkWAo1onIPTTj4xATedU6+xF6WlsaM1TbHWQ
	k0Bq6BY0ontuVP2C9vDAfEM/GsCpKXq50ZhD18duwNQj3QZYdXE+4L+yaLh+cCSTzn4ub7suiok
	S79ZX5FZNa+15
X-Received: by 2002:a05:620a:1b8a:b0:939:ac74:1bbf with SMTP id af79cd13be357-939ac741dfdmr430148085a.4.1788777057602;
        Mon, 07 Sep 2026 03:30:57 -0700 (PDT)
X-Received: by 2002:a05:620a:1b8a:b0:939:ac74:1bbf with SMTP id af79cd13be357-939ac741dfdmr430141385a.4.1788777057034;
        Mon, 07 Sep 2026 03:30:57 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75cd8d0sm278699115e9.2.2026.09.07.03.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:30:55 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:30:53 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: qcom: clk-alpha-pll: support a 28-bit ALPHA_VAL
 width
Message-ID: <r6qvtedkounw2yvbzopjeoqqvz3shlffzmrmizobokfgpkkblj@p5fpetc65kv6>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
 <20260907-nords_dprx-v1-1-d472af3f01b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nords_dprx-v1-1-d472af3f01b1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9e9262 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=q38Eq4LkVyZCF8x0k14A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: bq1WI2w0ZGNnGtyux_f1uoAFi8E7WNa1
X-Proofpoint-ORIG-GUID: bq1WI2w0ZGNnGtyux_f1uoAFi8E7WNa1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExNCBTYWx0ZWRfX07rlzLZafFh7
 Itsm+3ZdoPPfQLnL6YuHyJnKnC32vx/UC7HvqgvxzXOq6wDE/lpLzTfNpv6iV5j1CrZxYNx1Vm1
 KkRl1pxN5GHJEWaM9d3C9BHZQOKOGVI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExNCBTYWx0ZWRfX9AZQ3p1DJ3S8
 3BoA1T0/KxbKObUhYrkgvcX3P9K2RA31caHZeKf5G++EFhu2QkGfuw9bhNU9KnIwNM+6y6XP1kl
 MUdSmOuG6jptbSDOpDQQ48+GWxsz5qkhWg+O0DqPbvTUFaQpoQdhCRcTdPVdPwCb0mcEgZyP4E7
 6r9Zgw+uXV/jkZy6HAXA24SJ9xD1igtq+yRza1gwytSI1z75m2udAU4P225olxt/qQk3UBtPrvk
 9SKHpJuxKQ+G+ErYy8TCPXiauIOirlwfMi+VuQz+eNEdTv73fA934Y5nfz7wGIr7q6c6lDVkX4c
 bT/DLLV2A31Ecvp1DSXDD6h/acbc2KiyMFgdCRv8upIAa/EobpPXmVjZqqCNsmlgoV9gOWCO8Qg
 315UTfRctxuE7PZWdGVeYMB6eP7e8L6FYqCWTqgkuUCuxyvT6p6t6GT1uVzgLLKy0Qqieufcrk1
 qMi25ALtgR8DJojSNtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070114

On 26-09-07 13:56:13, Taniya Das wrote:
> On some PLLs the PLL_ALPHA_VAL register has been increased to 28 bits to
> carry the fractional word at a finer resolution, for example the
> ZONDA_OLE instances on the Qualcomm Nord DPRX. The alpha-PLL core,
> however, derives the ALPHA_VAL width solely from the register-map layout
> and can only express 16 or 40 bits, so it programs and reads back the
> 28-bit configuration at the wrong scale on both the set_rate/slew and
> recalc_rate paths, making the PLL lock to and report the wrong rate.
> 
> Add a way to identify the wider register: an optional alpha_width field
> in struct clk_alpha_pll that, when non-zero, supersedes the
> register-derived width. This feeds pll_alpha_width(), so the recalc_rate
> and round_rate math scale the fractional word correctly, and the Zonda
> set_rate L-adjust MSB check is derived from the active width instead of
> a hardcoded BIT(15). PLLs that leave the field zero retain the previous
> behaviour.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
