Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA613D6688
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836496; cv=none; b=CuQgqUdf0f1srE8oeasa17SY6f1OOItdv+J0VbIyC64C4wDrgZhzFS015vcUgC6WJwjdqmJcuIi4R9f4bS/u0OYDjiJnFfzEI1Q92H9IsAJqqvqZjuvUwP61SLkXEabx6/7F7Ia0rYibPiKp4o8C8N9rtiBkEUDjKWmhIEBnBtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836496; c=relaxed/simple;
	bh=421QLG5F0cxhuiRS6RjHzyGtT2DLMH10xbU89iV7+kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ee44xU6SIk0kps8WFBkEdf68LEV8VlBjviPUseBZVLmnEiZv9Rbl66wCjp5wsDbh44aTA3GWyuP4gPyDEsnCoSqq5ZG/ZGOzLMupn+AGYQnLKZgal4xu//KFUpJaaFcmf327VSVN59oFwzIG9vty9dgfljoM+eTk48mI7NTvOrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRBK/Ymo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KV8LmXBV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRBK/Ymo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KV8LmXBV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB1ihN1322885
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AL6o08/Adt6zB9TULDXvrWh0
	g9UMbWvqtlIH88nJT5Q=; b=jRBK/Ymo6QKyvpRm/K2Wc3tDvnSxoHaxvfSh6WU3
	eobZVsvxF91/dg1fJ5b4PMjZYM6y4fv+6sSxWepljDhOmU+3klzoDuIZI/RLASUU
	PAa4r/bjicOQh/kuKqkgs4QykHt/A0aRuY1KnygkJizCc9TGItcgtbs9uko7Y+uL
	ff7ijegCCz3dLCnpTYCu9Sxot83MgnJ/QxuSGXkh05NWlbgZkMjad0I3T+ApfVm6
	mMirqfS6LDC3m6u+rRX8mVpQhAnHTZ5Gv4Z9alJ8kuRYi6/Hrr/dNJLno2FEYLKN
	Gt9YBHKdfyoBeLvMZSw2gYlgsr/6g12G6Y0EWkzvffjvGw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyyh8w1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:54:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdd327d970so1266970eec.1
        for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 08:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775836493; x=1776441293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AL6o08/Adt6zB9TULDXvrWh0g9UMbWvqtlIH88nJT5Q=;
        b=KV8LmXBV23j4fb9dM/GDJwFjk81RGhr/pN3VG/oGicbD8N2VCV5bSoiLW87xporu5s
         +IRm+BxTz9gfKWM+agXp6wh5EBIwodi7jRtualU+71keMFCCM7M3Dp+665XUHFc14GbK
         ZyvO6h2prb+029XeNECvm3Zbj1ekM5yPtKweEDT2FichJ0vknu3H2KC4nPK8/rXI4/Nt
         bTPMIUgm/X4JrYBWfGfA+mrn7THv7LHgTobc2JKQSpR20sdE81z8PKdmc5IHdjCEEOIA
         m6atqqLor5PAL7+XcDBvK7Lw6E7XH0qXKwnD/6ulisgbBsoYey0TEiVB3+fjQ6l0xblG
         871Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836493; x=1776441293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AL6o08/Adt6zB9TULDXvrWh0g9UMbWvqtlIH88nJT5Q=;
        b=q+sHRQ/47tvkT/vwr8xbkgjil8lamZBatGfT/My+3X6XlGOV87r/zJ+qQWjZvHXUah
         AZ+EGR55XjsOg6ThPAuVu3TJvGRtPZ3L7XV0IIMRziB1u5PEsP15KpZb/xmpdRdsx2nT
         im17RITGKL2KQ1ziKgQHg9VzMkxhFE7S6yNEI0MQQNhu0nc2PpZ1mH+jLdqpEL7QhS92
         KhXUCF4jG3nRnGOF5kjkif2x3ZOAliHmNhX7kUzzCz6Ds5o1WMG+w65mxW897/k64Rks
         L7svi6Y3JSPtiaxYpWNBO5uNzycv/0xTgEv5jkgEfgsH0SYT45ULXcI0nXOM0IEfPdBk
         hFMg==
X-Forwarded-Encrypted: i=1; AJvYcCUoj4Ms1Le4WdW8He7xH8ImdcnEq27kbdv/j/6AzZ3etmDIbkOy5GgLgzbdRK7aC3ExIA3yIGMXx/0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Ttm0oaCM9yoVXx3GEPZeV3WuQEsIDZabGaq3hUxaKzGAK615
	tyL5i/xVG+8Pug/j3wXNFck362CCcBOAdV9OeN5x/0xGmBAVQys68otrO1xyi5GeBIphKpPM7o+
	GcsBh0mcyzJIvFLCNPIVj6YVncvK7V2+zjAYfB69NPe11PFmIXMN+G/rRNV6WbvU=
X-Gm-Gg: AeBDievQTgN0xlQfTO7BUf16E96ijnmVvrzOKNYE/l4OXiD7SHYNbXeOujY11ags81F
	gfCD3yjlRUbExC5yqZ2t5ZI5LgXI+1KsR+kLaRsP44rYkpCBZwqv6VwgcHm7g8gTH1gOLyNy97j
	wjuoeO21wiqg3iYN/65fRHx6iUKdA/EGJ3y1I5iozIBuLMgcrIhDJey984I7Syo0+DbSS43uYMI
	fQJ0rFvO1MNuqkpxR4hiP+DeEfsxR8dKmKkGHf1P2uJ/KhyFBjzDBwCo34GB79aKfMsg9xnPe3s
	k5tDDBz/PsGATMNTduV3/UExXr2aD+hlsrnY3vJkNEMNt7dKQ7xlAm8TElcs4LtjkOZMMbPqmUg
	2C0eM0zO4fRL9XAeyOKkBlSHWmS327oXFEN1O/TwWFo/sj88t86mVx49LJ3XQJK9uu+KzD9BSij
	Q=
X-Received: by 2002:a05:7300:1904:b0:2c6:7896:e2b2 with SMTP id 5a478bee46e88-2d40fce76afmr3904880eec.13.1775836492678;
        Fri, 10 Apr 2026 08:54:52 -0700 (PDT)
X-Received: by 2002:a05:7300:1904:b0:2c6:7896:e2b2 with SMTP id 5a478bee46e88-2d40fce76afmr3904856eec.13.1775836492126;
        Fri, 10 Apr 2026 08:54:52 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562eb05fcsm4824636eec.28.2026.04.10.08.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:54:51 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:54:50 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC
 bindings for Hawi
Message-ID: <adkdSnvSPe7yNt9I@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-1-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-1-c7a185389d9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0OSBTYWx0ZWRfX3OTA9fUIn4D2
 q1BeY4TncNNwB7xIG8MDjNyvhJa3GKl5oLA/2b5MdH7ypLgMNs0KqFNsFr0mqNFV+1HgdnsPyWf
 8yqvOU3JU2PlxJzRq4VKq9UDy3UN3CCnAp+/PTrBEwXUC1XAXGUjrcy0ccGh4Gd4lV7OBWqny8o
 TJzOos8Vlr45BtA4lP69uEJVKlf2huJIca5ItH4Xm6uuqfRKoeHWZuBVfUAXLeYHmjPwD4pTEGM
 0hRXb+y8ZVUZkspGibEGemeVUyJKYXrCBwL3MXUSbXu7dt7jQ4lMRr74Rg6c6qd053sRSwXaVf0
 HTFIbV1koG+bguhUWewCafej/McTGyix5HR4lirSJ4Uq+WUIqyJYT5xxF4vd4mzyYuYxn9oqJiK
 z6LOlnhipARTCuUaugEK1S47NIrjJhl9BI/v8wIHAZ7K8tGWI6+FZ1QtQG2t+XC8kLe6ngWJlgV
 XdgUYYGCBoxKFschR+Q==
X-Proofpoint-GUID: ltXYcf5cU-Iaz7UjX4uJjusMnV_SN6S-
X-Proofpoint-ORIG-GUID: ltXYcf5cU-Iaz7UjX4uJjusMnV_SN6S-
X-Authority-Analysis: v=2.4 cv=Wv8b99fv c=1 sm=1 tr=0 ts=69d91d4d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h0nsZIZg7VTWqUciHZQA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100149

On Thu, Apr 09, 2026 at 01:51:35PM -0700, Vivek Aknurwar wrote:
> Update documentation for the RPMH clock controller on the
> Qualcomm Hawi SoC.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  include/dt-bindings/clock/qcom,rpmh.h                    | 2 ++
>  2 files changed, 3 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike
