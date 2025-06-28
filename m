Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7421C860F
	for <linux-clk@vger.kernel.org>; Sat, 28 Jun 2025 01:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751075868; cv=none; b=LKi2EutdafdjysB4Zc8PH45Sr82R27h7kGYUOndVQftw2aYTiDeLnDSIP4Tu6M6ndshTF1PBMHQ+60oCIQ2vNVo38HZoj8gI566oHfnnw2sXtw4mqL3Bn4KxB+FOFAHEdXGXNsMoFMKW4uM9bg0rjwLvGuTLk8YhuFvzVkv2M84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751075868; c=relaxed/simple;
	bh=eB2h+WWGUWxTIdXYzQWwwYrg0DgFAVeaboMVJ48OFSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCjz5Rdmr5z5yzWdTxqzMmtq40Y47S6f2jcGlr6gvAWgcDPGQcvFR4yew72jwK1Ff8YilxfdlE5Pgs9gDe6tuWc1mawEibiDdqdi9vBhDhmHKfAy/0dRrIfhKRklw/23iGOMk2zU71T7pwNe5Ne9+3QF8KIGeqPHjssCCO96u4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2HEW8b7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2HEW8b7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DOX1011145
	for <linux-clk@vger.kernel.org>; Sat, 28 Jun 2025 01:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C1cLAjsBclJ0QBWDw60ZW2kU
	AMy0clXSWHYg54xP/7I=; b=a2HEW8b7NwtvWqvduqwrtvZYP2KmDBQihQJw9qF+
	t6OrJ5fyQpJpC+49AyB0QMlth9sZoUNjNPz5hDM894auBz0LGAC91rYKbzOOUM3n
	+zeqEtjULScwi6lMxT4rHy6Y6qFuSfafVD+5j4gydEvOis/VRxO3nPqQ5ExEDsLT
	heF6ksAC/Iul0c8CjaH/XEI2hidAVHG03MTKIom7Gtc9aoaeYnQG0Z7ohTABPlmM
	U3OPmV0y5lP1lsfPV1Cukb94IX6NBlhnqKrldPf5aPCqnhxkDgSPiJpUdgFKpTD3
	nDYmnqjb7TokykvNX3obqz2wS5L9Hl52tlfBvrIWojgn9Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j58tg4wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 28 Jun 2025 01:57:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3e90c3a81so36040485a.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 18:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751075864; x=1751680664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1cLAjsBclJ0QBWDw60ZW2kUAMy0clXSWHYg54xP/7I=;
        b=ZG0P9X0v4VWcVLtZr+gJGJqPD4112Zh4QomHnuOeHL08a3paYeUyjlTSWIN5i29pvQ
         9z3gc56SsibKgzAS3+YD0/700gVJztm1rPl+F6dOWibv6+Euc6UNfz5Zerjs+thF7Rla
         s2Fd5eQrcAeuhoajyHm/T1XFqO2D0Jyw6+VcEsU8PGwJB13PdDBN9pWwH9wdYKIQmAZ3
         TJs7/rZHIqkVaH3AAA4+ZRMlgB7th1oLqeSsR9hRYyafW62vZnDBTHN6Nhtp0LFO1H+z
         pRxmAdJ5I27Qf2VTj4xWzhjGgyUKsjj7tKzrNhz8qWilnVBQbH0rpvfYqVe2VhGDBC36
         1/og==
X-Forwarded-Encrypted: i=1; AJvYcCV/V7umdDzuXvi2Dcwt80MWjUdfm7VDDkKmDcoSbB8nYE5EQPm65k2+O1k4N2T9KAi6t5M1jysVyyg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdv5474FmiSeeNceou4bEdNfrOTnIbGvFclT7txgeOc0LbgqcY
	Agj7BzRcDPxOlPQz+ZbQFLR2T+8TnV+LU8v1uAQXCEC/GDpO+E+hisSohFCXxTf75ist9hZQ3ad
	KBXHnzhKCQHbV+G9/4Wjj/nGqxsxyeJcqXm/sYmXB3qbnIQscYLpJM+FJQ7DOEbQ=
X-Gm-Gg: ASbGncvKRxW8MG/OjaFZOYfjY+vteaIkHjqQ9uIZhibapYxWubkc3AjxtIJPukAzO4V
	gbOxJeOzI1aiHcq3cI5VleTXR0x5IsrcxwhoMLTEHRvN+lodkjnGzGSEpG+YLXzGMfF22e0ZETH
	UJleAMy8i/NlsufVBfwGLkPSH0EgZSkcuUozYJkOdtIW7QtnUqm68y8qXFlJLMqXUi3QWMZcEab
	27F1SOQFPJFRH9/v25y6VUSSZaMBuijgczk1LLQEMrAGELS92XMIIdV8CY2sN1LmKtmZrEjNaax
	7J9J/qIrzS0Br2kZB77MvTwrbR+AZJwMZLARnhTuHq5JB+plAzfla7InTw97DojFkrvosgcIFTA
	5ygUH2PZ+o9sQzFl0/enJO8CUZGU6rHiMKNc=
X-Received: by 2002:a05:620a:aa19:b0:7d4:4b0e:eb1b with SMTP id af79cd13be357-7d44b0eec28mr241537585a.45.1751075863753;
        Fri, 27 Jun 2025 18:57:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4Hltdir3SyFuBpeLJoJ4afHk65Pi5pMb3NzWsxG3FHxbeZRywpOH7wvixrcleSdr649yHIQ==
X-Received: by 2002:a05:620a:aa19:b0:7d4:4b0e:eb1b with SMTP id af79cd13be357-7d44b0eec28mr241535185a.45.1751075863298;
        Fri, 27 Jun 2025 18:57:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2f01ac0sm6638601fa.101.2025.06.27.18.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 18:57:41 -0700 (PDT)
Date: Sat, 28 Jun 2025 04:57:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] interconnect: qcom: qcs615: Drop IP0 interconnects
Message-ID: <3edj53e2tlwqg265udg7gjk5lfmlwz6higfm6roq6z65qye3o3@wjbjsjq77wjh>
References: <20250627-topic-qcs615_icc_ipa-v1-0-dc47596cde69@oss.qualcomm.com>
 <20250627-topic-qcs615_icc_ipa-v1-2-dc47596cde69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-topic-qcs615_icc_ipa-v1-2-dc47596cde69@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxMyBTYWx0ZWRfX0r1eL2/GnxZL
 UreKe5DRzkTDubm4cZE0lgPGi2AtrtjBNDW9fZAE326Zd3oZfGHKdzYS8A0h+eENsP6dUGXpX0n
 7zY5c38r4hA6KoqnRXEBTVXKwFZOSOj54vTf7lS6AuxFmaZIxEZT/0P0IN/m7Z6wmggFOY2IkfS
 1QvNvFRaPvRugdsBtuTsUvahcbFB/n3pw5bkAp2r4xzkMck1LRDIxwiWt1VdUw/gyNENU0Yu7mX
 XJgikXybvCLd4f9ujZkcgdqIkNwWfF2gjnbgPhNDK7jfcPUtZ1oYepUEe9B2LRgV/D3t1AnK2hy
 ja/eCdNkO3yOsw934+84I95QU+3Xs2mILfx0sxYgdlwlQice1nqJWpbIoDm/pNo/2EnSsJ0a4Bt
 Kh4Q7QH5pxALzqFJ/DMbAJMCXCuWyCFpmfEQzAgYmcWolzeej8zkuOeFBasHkkangS6n+Lmw
X-Authority-Analysis: v=2.4 cv=UZFRSLSN c=1 sm=1 tr=0 ts=685f4c19 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wxkdqnHnqkY9PcZr0RYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: kYcXPixeZgC1y3MdDTCBOqZm6FCSFz5z
X-Proofpoint-ORIG-GUID: kYcXPixeZgC1y3MdDTCBOqZm6FCSFz5z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 mlxlogscore=798 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280013

On Fri, Jun 27, 2025 at 09:37:56PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> In the same spirit as e.g. Commit b136d257ee0b ("interconnect: qcom:
> sc8280xp: Drop IP0 interconnects"), drop the resources that should be
> taken care of through the clk-rpmh driver.
> 
> Fixes: 77d79677b04b ("interconnect: qcom: add QCS615 interconnect provider driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/qcs615.c | 42 --------------------------------------
>  1 file changed, 42 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
