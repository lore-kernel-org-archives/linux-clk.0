Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF5B3DA7CB
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836672; cv=none; b=VuZrLCoq1ppIyuXayWNwzhjwYgtsfD2LzcOJKiihSDSK0UIfSVutUsa5qQ7zX5Z66YdqYeZ+dBtko7qLenOAMrfG2JjG7K8impDPOAnDjqT7t8QQvbckgSABufHPilobRPj44fhoyh09lp51x7JV7GE1l9b5wFJH4v0HjyrW+GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836672; c=relaxed/simple;
	bh=fv5OMOu1zNM4pDbfg8Pmy6EMQUZjpcDL9MDQ0YUeFWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eEKZSxkPEnI9OisfcKQfATSMlAEHZp9Yw3VZScvcQXYQl6iSg8RJ+8fw0uqHsq/K9P01SeVYJNFU94gKeVvU1RDhVPQhD/3YAy13rT42oRdssnkSJUQsBB4otJ736UlHBGuS8dqCz3Uk9ATfFoeKAq+hhyVUlORZSBZ1DX1M1tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DdUAano0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GBcDWoo+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DdUAano0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GBcDWoo+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB11qT438809
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LqlI1O8H1DVEX4GBIht8xh6h
	Ovxmk7hf+alBV7/gD/k=; b=DdUAano0YtU1zUtJpvEimlyOh776s/+YXfnQMn1N
	ZxYdQeAWYYM5eiE0elyzYp29eZuJFxq9/OPqjTSEvDmuRNsDfTOvlkvmOTig7Uuj
	TvIj3SyMQvIx1pixzKoVYTmTsaIooL2f2/y8dB9WnrVjc36QQNDRcUk6JQzX+L13
	EY9Euh9MAnac9cLdDc5Nx/gO+Moc1Y4yFiXHkBBKbmkwmKtGUN9CIfqry0qG0F+g
	4/89kJcLPJ+NWCsI2lczA40OY7q7kUuHWVFnqUfmIhb8acAMxwHJBGFY5ruaccuw
	++/BbdJ3DtqiImhZjt43DXpsVb/iVH39GwNZBGu9RrlgXg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyy9rwm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:57:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ccc035f125so1032801eec.1
        for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 08:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775836670; x=1776441470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LqlI1O8H1DVEX4GBIht8xh6hOvxmk7hf+alBV7/gD/k=;
        b=GBcDWoo+6C6DY/20EnaoUq2rD4+vH8WeJpX+VppmJX7o/0oFcNf9mumfwwmFM3Biqj
         s3mCtQcnzPgetuzrQQChqDDl6UzkpL2sf76fRVtkYPAP3u4TDzrcb45n0/0fvMWPbDxN
         gnaiQnAjyIBWv+b1IWNoQmIsGwlynHQeToa8gN0JuOEUFMZzYHb0HXd5Cw5A++yGO286
         6i/K34X8FrDjPTnZe9xHd4ovFHCzbHJYVHGjGSSvOLgvRmCd79N8Dtoop0quR7jiCmv1
         jMzWjIiXuyWuVEiQs63cnzL/sbteIRG8Wl7pXrinPPUI3P5brY+Z5uvFumGp11wryaJd
         cgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836670; x=1776441470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqlI1O8H1DVEX4GBIht8xh6hOvxmk7hf+alBV7/gD/k=;
        b=UVnmSLjt66vAdmAqf/310BaRWEAaPeolsYstnTVPjloLkSRiS9s4k5c9aEdYtg3/MI
         UMiO3rABp36jR8WDeldiBnLqauy+cp0BLdcIcHAsRyEgIajF1oOdPksU2uN01H5y+6dE
         kmo2JcQ0EnV/bpg0ZMU9/B7uMibVtHN2WbbuR2MX9Bm6k50cz/wmQr2GDXXOVCi2rctZ
         OzWJOcRORXwDk3p+TPxqyrAoscUXu8yhomgBmjD4ajQoRZ5VizMvogd82HvpOAbfjDQu
         zD3KKE9olgRQhRJRmEDguadGz5l6vkyFRsvFJYho2ulngDpq+NR6la9z1185BsnLZ+Jn
         lsZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD/kyiUMrZYH6D9BV49ZbpqMnVOKFleEZiLTDah1GAKTpGPEqnGS0uyMFFPm1TcDA7qW3+8XKrU/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNPD2iM0ay/DVKqg35mIyVYbkCT+OjdtwaEE1NP4UHlyYE3WVL
	cJUgsP+tIjViCSEzB5uRo55cHlSTAl4jpW50oJLRnca7vT/VW7cwnR6aqzut+PyG27v457Kl4aZ
	ftlEuUUJK/X2wHhGQ9X/UTFcp2rDISrNr8FOqO5yRbd0Yr07fxJIKypYMUVYiAI8=
X-Gm-Gg: AeBDietTeXWa5hxcv7icZg3z0CLvpBMh/k07S2fslMhSTSaBVwjs2PQvkFZckyuBv63
	IbX/UbC6dBVRDUzqzJIytHmXTnXBl9IqRM3bY5q/lWKoQfzIdp2Z06gQsOtqix5BvO7iznqPSus
	FXevJQenLXa+abb5D/uDmVCUXfhjV3rqToAFvYDOiaLdfT6eqn5KxiZUf0Ln6BgpBxcqKfgxsUt
	ZAxoAfAGg+nb13Re9TWhRsuG7flyZgOsFGmuW5azmTnJXPrlkqLlPHv7EYzqVqVp2ZGvsTmfN1O
	dtJEQi/8CZAkhJW2hH/TDj3e/mPkGmsnAeL/kGUF7XjFV8fOUMxGPTclK/w2GW5QETKzC8B+cgP
	hOOAP0GNrdau/+4HIW4caUd8WTj+gJOjvOwcCoL1l1znRChhsEaXFnvurzIcM4tcR2EANeiJ9fj
	w=
X-Received: by 2002:a05:7022:793:b0:11f:1e5b:2dd6 with SMTP id a92af1059eb24-12c28c30fc1mr4140103c88.17.1775836669564;
        Fri, 10 Apr 2026 08:57:49 -0700 (PDT)
X-Received: by 2002:a05:7022:793:b0:11f:1e5b:2dd6 with SMTP id a92af1059eb24-12c28c30fc1mr4140081c88.17.1775836668991;
        Fri, 10 Apr 2026 08:57:48 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346eb314sm3734038c88.10.2026.04.10.08.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:57:48 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:57:46 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 6/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EHA_T PLL
Message-ID: <adkd+rbJZom/BLf3@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-6-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-6-c7a185389d9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0OSBTYWx0ZWRfX9y55F2E8eAen
 6EuUxH23sIgCoKg3nFSDrA/inSCOO7waXpVcFhc72kgIE5IMypu7oc9D93inB7ee8FzL9/n+D71
 D+GMDQW8Hz6wx97kRAmoHGUwcP3sOfYG16/NWh3byXqgmaNI4LBpZgKy17fOv1eLvhmY3XFfCcF
 bd/XPn7h3mvV6kBxZ9l0hQ6Y3GQB6CQ+GrKcPbG7BtnChN4ry1dqDYd7T26s00kpnBPXpU0IuYv
 QSInTrtMgCCKWPPFcslw1+y0/98VJ35QF6e6rLjup0qd527Une47hc77k6FpQuAfwng5wsl3qwk
 Fh1GsTedCcJUfeenmC5PCCi3MgE/abq0WUrtz0vXTIkY+cntPfzO/sQSXp5FdTym0HkeXHr+YgC
 LJGqLVKaxNDlR875BIotGXYV+/ml21XrsjdQMd487+tRzRmkhS8m64n47DSJ6EE5jYGMHSrPnP/
 2ib4ib1iLi8hR82ZrBA==
X-Proofpoint-GUID: aZjD5QMufWdoMZZs-xL6ZWe1bELMkgH5
X-Authority-Analysis: v=2.4 cv=d6fFDxjE c=1 sm=1 tr=0 ts=69d91dfe cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ejiLYX5kVw-NK1-vaKUA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: aZjD5QMufWdoMZZs-xL6ZWe1bELMkgH5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100149

On Thu, Apr 09, 2026 at 01:51:40PM -0700, Vivek Aknurwar wrote:
> Add clock operations and register offsets to enable control of the Taycan
> EHA_T PLL, allowing for proper configuration and management of the PLL.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike
