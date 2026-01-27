Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB21235FF41
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 16:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533091; cv=none; b=Zz+nsQXzLeLh5+3xmTM9ao6Fm5yDXklDXpzBylLf0mVMw0mP/KGUa2LXWpJskDpWm3rzXG/FXtT+pZjAY/IOGRvpgBNA/fO++uXaKlsl2iJ/NuOkeQ0AJSI+dPJ3iwNFpXEJgj1C4zEnZaRJooPMR7Iui0hGxVibPUNvT24SG7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533091; c=relaxed/simple;
	bh=DRwMkE7727E48dTCRQYX1VLgenqEZitjWoe1wzdnaNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hoIiPsb+lB3raz7pNdGgxRSs/0GvZXPP/3ieyViT3vN2nHrvhdAQIBxAbFAxCUrs6gTitloaOSQm26D+7UQ7yEFJOH5kjpk50qrtNHJZ35mspCxRpJv6RicZrQScn71k5DaJy6s0gsfMswxi9H9kigcLAFpBpt2ODE9ObTzNQB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pM6r0tg1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UYv/imWX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pM6r0tg1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UYv/imWX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RATCaF3715067
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 16:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=H+aFFfvZAT65PIB3kGeAl3DJ
	eyXkfenz8Wt4tLFaiNU=; b=pM6r0tg15Qcw0xouUrg2erPz3aMPtIcAFrN17kBX
	/A1+3EA5y9lGeeeqBA1g7v2aFHHodOhEWp3aUhGjyg8H9sT2m8m4trs71PCzZRBY
	ZaEf09La5hm/b0GDhDPlGzX3n2+eYc5tZeb3fwL6kF5UHXluiDn4KucwhSbJan1F
	TdFHKi1R9saySQpuQ9Z2LUntTSVsBsXJGCSE9RGz8h42fbmATcF5WT1E1rrJ61tE
	e1EXPj1KRsgKpZafdIxmffqivvx+CD43PcliszbgbmRAFrKnArgDDm5LIVymygrv
	vYrFve3yDxaq7z28mQjdMoWHQbmvbkkKFjPyL7caIE8Q5w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv0bv9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 16:58:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6b4058909so1381420485a.3
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 08:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769533088; x=1770137888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H+aFFfvZAT65PIB3kGeAl3DJeyXkfenz8Wt4tLFaiNU=;
        b=UYv/imWX9D8zZJ1i33J0mpkoD2thlN7feL/5YwyVBL+WF0QaQe/U+76pFmEjA+WpgF
         38i0mEBPRFMGA9V0y7uXQURtx4trvkmxvetrfNLeimJQ407SyaDm2wJaEvmlh4ENia3A
         DLEg5ddVJJQi/yDGSXB5gHq/tB7ut1Ilp6CNzdTTDotNb7zAfAQ1vMD1620idVRZkh0i
         AGwfWtRQtR7ijmNC1R3k2bLO/Ar4qIqO+vQxsJPSliqJQkcRoLwyB33sQoo2kr0WhwbT
         4l7sDjto8Xwwc9IMgNhJ8wYr8dZkgqfF6o4Au9sBiSwLSyvZ5i1mUlIhPdo33imK0lWF
         eiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769533088; x=1770137888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+aFFfvZAT65PIB3kGeAl3DJeyXkfenz8Wt4tLFaiNU=;
        b=rDtRQ62CJvyduMzsneY/Pu4lO7hjtr+3UKzs2shGEKJJSpvjNls8Zrt0PO8Ta1a0nn
         mDxFPjzYKCFtQjlOLjrctBrff1m5oBAMT9kuuoi3CnwUHyXzb9nQIbWQwi14Ng6rCkP+
         axmXnyLoYXmc67VdUR5+BmAPPxErZPFwK5qhlCGpRw2xDbkHvF5gVTxoeN1VIElzf8DW
         C5fdaAEwF5XAlqfLdNcJ/pnkcRXqqzTQWgf2Pjgc+ycyYBGeLyfIscjT8lRF3hWtkE2W
         QFFmQHasO6nvHWCqrYxZdNNO5UbDRHoC3TpHsBZN0S5UIs6WMWEy3j1pRutN8x5pNsl8
         SoIw==
X-Forwarded-Encrypted: i=1; AJvYcCUv3ktk+oQWVgInqoZ2l4RNYoN9v9GHAo9iWlPeFAkKFIY4cwHVRKsXndKIzWGvSgJGE9IHB1HyBsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA7ukxbO3puSlYvaFNwXh4Le2y6t5MkEYrobsiwa2ZoeUNgZ+T
	46WYC9ZaXgVj+Vqw7z3QPLUmIcrJ3fXBRItwzijxQI+hDfqR1r7RP9jPgPQzQlRGYIeQQuZ+6+x
	zjrvsA9WFJWVMqywOM+9+RdPQWrieHKwlGWnl8bR+5SY6Z5kOShd4o6XHKpqlZdc=
X-Gm-Gg: AZuq6aJNKDZWvqqj3A3ZffFZ8bFxfiK99d1tIxiCRlKlm/OaY0jeKuwCz25h90i+ZBm
	rf7OQvaUAtoYWbMnXi2JpJrEpckL4BfXELHMJmrPLHucE4kN9L2wdqy2bIDnPaJYBH6SwqYh7np
	C3TUlcBnAvqhmRWHUdByBrSgDA+v/UM6Rv1ubj6qTLEHBJ8lzoNgFks/6A4x7rnEZs43W8aRf+Y
	cuvHwhECpwJCk9JgDEjt/+Al/RC0y6DHiIagQjYe31PJbvC74rkGCjBY3Qubw0ye0diKnvnCxtD
	vqKun1XdDaa+KQqY/T9t5vH0tQoh2bN6Vbc9njEwQe8leph+Cyoz6a0x4JKwxfyJ5u0f/9peijE
	p1BzhKytnYdff1M2MrEa+gV2o2WlzDGvqRpysYgHE3X9RONkfpueqTXkP0P2jJtm75WF3EO9zkk
	6jNUsrov3JkrrzhTgKlBz7w34=
X-Received: by 2002:a05:620a:3942:b0:8c6:af5b:d50a with SMTP id af79cd13be357-8c70b8f2f76mr281933885a.43.1769533088029;
        Tue, 27 Jan 2026 08:58:08 -0800 (PST)
X-Received: by 2002:a05:620a:3942:b0:8c6:af5b:d50a with SMTP id af79cd13be357-8c70b8f2f76mr281930485a.43.1769533087570;
        Tue, 27 Jan 2026 08:58:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c8225bsm321201fa.18.2026.01.27.08.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 08:58:06 -0800 (PST)
Date: Tue, 27 Jan 2026 18:58:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
Message-ID: <giyq4toycioksypksfidvsyc7kc4p3ayjz6eqrtz6dufwtdqjk@62haln2puyl6>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-4-ccee9438b5c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-eliza-clocks-v2-4-ccee9438b5c8@oss.qualcomm.com>
X-Proofpoint-GUID: ahBc4_ofifsKSN3TEwLYi3cs9YvbUgZP
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=6978eea0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QfZBNxv062MJluzyly8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ahBc4_ofifsKSN3TEwLYi3cs9YvbUgZP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzNyBTYWx0ZWRfX7mO7cibYcizx
 jUSYjU8hDhL+lnOjqde1l+3quBrub6xrm8KpHqnYCt6E8upYH0OcINIht3qcu3CJdP2seDLUn5E
 ttF5LhjZoGF2UtHriV31jCbbYICiBVGyGzYXmzbUT3MFneQZ4mK0kLf+vAEGq/X0+fLSeXO6tzi
 XEgUT8tIlHMjGGVnuqnqUacguseW4xhVggN3Gp8L+oytGyCf6ZVzjkHd6W2H8EGg+cgUBHKJH/1
 0m3hMBxjhp6811MIqNOV0csIrQUbsYSOZdP37oorS+Uu/R0iG94qYsCyl/ccDO7pm6+QL1LKiyY
 YNVcrWdYWUkEIHPd6ClKycVz25V3uHSoN1U7HtDoVgaZF8sUY36w04j0srqJ+OhPReLCgFOhMkT
 PTGGcbE1G2KsVY0LOkwpKVVrRAicb2wF7Y9yan124cfdSNiMbS2sQSLg2Q5yPma67BFluNhmxfG
 Jwc0SrUYTzZ2tLlW5ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270137

On Tue, Jan 27, 2026 at 05:03:22PM +0200, Abel Vesa wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add the RPMH clocks present in Eliza SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
