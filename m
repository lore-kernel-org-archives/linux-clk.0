Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DAF23C368
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771313825; cv=none; b=sjg7Xa6GiQy5DhIIqDzBqJIU6kjVMkv/AOAaiUNuVdY/jLh8Ni7ZC2bWPeCzjY81F8UGe2XCZ/PraWGIyefssK0PHZhmhS91PnmlmTGMROTARB2TEd39sSWiQBie/DfJtfXpN7qcU6N5WFEiYdGUzX/RuZzNeQuMNx46BPXDLbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771313825; c=relaxed/simple;
	bh=bm649JNZeV26nodFWhz70BQBjB2uTADIjYJ92op2J8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1H3XbKLLrbWlR+6M2CFD5E3cGDDxzcA95LkEtYaPqP590B9nSLGnVdBsnJXLzV7tJ88+1/ChUUM2M+k8qlHlkuljgaPNFIQli/XZ6robL5HKHYd0KYme6s1Lk1UR3nJtnoTWpCFgDXR+sNGBZbgPW2+sxjRJ3PNFoUIMCC1L3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1ejZRZf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EWOvpaX+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1ejZRZf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EWOvpaX+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GH4S7P985268
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7t4M9jcxIIwiP2uTSN2cmr8C
	9cmLt1ut6OeHScfvuJk=; b=D1ejZRZfgLCZ1eIlaKbUOazfYcpgzo6MWTMxKVLe
	nrJX4PeW9QP8cYpxBvJZiV5Tn9tmSwkEUO252YkBbEx7qcnKNNp2TJkJgd+f95Vs
	aiU0tKtGvPYt5N8d463EahfRFrQYe6ewVnbchLKbl3odiT+QkMEmEKx3qj20Nth5
	FXpQm1g0++i3uWno69Q7zx88rJkDnGZ/g6Bf6vADA9FGIkf3zaA9Fax8s0L38vbR
	/LRTYLCdrG0ffhKdAfLStgT7x8BukrwrLD8e4ENB4GSacuAm07yCQQEFYH5HlkZm
	tXARp29wa39Ai8V77l90o5HrjhyQ8b4NAsg4Mn6jxWLrQA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap1dh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:37:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb0595def4so2811034985a.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 23:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771313823; x=1771918623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7t4M9jcxIIwiP2uTSN2cmr8C9cmLt1ut6OeHScfvuJk=;
        b=EWOvpaX+MBUOeyWsWb70Pz/5pJqOGvUyOqI9PSdKeciHC36Qo86WlpZV9yO1bf28fP
         NdO2oFJuMsnlxB5w6JdEX13cAPY0P7Vr41ZGAhytrYQeUbk2YAQniQ5cBnEgrKu/dJNu
         uzXfFKShwubA8diivAc0Wrgxn3p+2A2YgbYjrSWjEKrFOE4/dG1vsiEO45eMRmnFyn/g
         o1M6OI2Qq1tgbxdpVDAiEOwtZnxSPyd3IPLPDfs7rTu0jPw1v998khSnhjTSfiAxj1ZH
         brvb2rMEf0fGVmaiuRep3KMNfRH80hNGnaRXls40TjCCW5/UAfmoVVHmAGgGJW1CioZ4
         OpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771313823; x=1771918623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7t4M9jcxIIwiP2uTSN2cmr8C9cmLt1ut6OeHScfvuJk=;
        b=SzXWdhvlG3lZao8a6Bq+3rzXLCFnIe97owqm0tAT4kbe/3ljhK3ihmy8fllnghsl6L
         d57NXe1diT9f2hJ3QXpd1SPJ3/HyGlkYDS16EwYMKQ42smmY4hnuD81Kh/pwP2PzUH7Q
         /tgIgHHcSG0ZsnSxfvHhvem0cEQP6WJrzi5A0xpf5qjliH+4rOkY7UkydVWK1N3k0PLB
         rrywjYP0llUNMP8xUi9N8q9PNy6twNH4oqDhbhT/5xVc9I0cJyj+SC6yff4QC2yt6TCm
         vB3TBltJRh9F1pm5rfmEwrhqu1GpG21hYzrDZLrNb8G7uS97PmBwxY314Wm5uAVI+3lg
         o1Og==
X-Forwarded-Encrypted: i=1; AJvYcCU+B3H8MwLBiP+okd4UjJC6ke4WZ4QevBSTYSIcutyS88TsXphwcCXPjnX93bMQuo8FBfqV4UMUZtA=@vger.kernel.org
X-Gm-Message-State: AOJu0YziGNvyIiH8jGiAOxTo3Sv15T91BrbxjK4vpQ3o12AudL4OIe2j
	PGiW/HYx9xFIFbvjBY0FRVVyMyiNOAqiECCjs5sgtwnfcb/jiEjxrCZzhcUhDbZNxZW5hvb3dJ2
	1mcmVzf/2SsmDX+NnjwvX0RSI9Rx7etzHSPOwobNtzcolZVgcktmlPKUjsbAONtg=
X-Gm-Gg: AZuq6aIS+sOcrkESL6B3pq3qzu945kMNIXAunfImR5TYVz//9bY+/VKpiKyHviwAWmT
	rokMi+AiL3Mwzv7GNVR+NHyGb11lCA8VgSJk34xscEdMew3JtS8u64Bz9jOUG9qWpixRMMJm1yR
	YyjfAtaDA6QIvQXpAuBDK2VPg2IjUSudCbgz0s3YxtZyWXTlnTJZc1rdIDyJB9zoTtWK5YcuWsJ
	hB27WChUPXuJPIixQY6WS7h4tBY/iErLCQrz0VN0GkPEqwq9Hm5vMWkH0YSw9R/4FHwwPWVYk++
	WgEyeMbu48LD1QOeRs/Pj8/P+SW2Dc/+BHQmEv7+OxwqloOQ4zvEFIvrdUmcKNMsIX/e6MTDoNk
	8P7zv8H147/fJvrxqVJzERBUOUZwh/5LTLixvQgF5yEWKdo8RCJDzYQnGo7DxJxecLSo03PBDFU
	8ukdfEjZhC8dOvDM1bv7GA8GCe0WssxBMIMKg=
X-Received: by 2002:a05:620a:408c:b0:8c7:14be:ea58 with SMTP id af79cd13be357-8cb4ac0a7fdmr1197237985a.19.1771313823182;
        Mon, 16 Feb 2026 23:37:03 -0800 (PST)
X-Received: by 2002:a05:620a:408c:b0:8c7:14be:ea58 with SMTP id af79cd13be357-8cb4ac0a7fdmr1197235885a.19.1771313822635;
        Mon, 16 Feb 2026 23:37:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068e5e11sm31662061fa.21.2026.02.16.23.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:37:01 -0800 (PST)
Date: Tue, 17 Feb 2026 09:36:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] clk: qcom: dispcc-sm6115: Add missing MDSS resets
Message-ID: <r733gmfae4jae3zkjougpagyr2llx6v7ry3lm6rldvmpma6rcn@ebmd3dgvd7ta>
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-5-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216233600.13098-5-val@packett.cool>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2MiBTYWx0ZWRfXwF4pR3JqCjVG
 NDj/n4yX5jC293I6MMfYdga6nIk7V1MEgQxMh/T4SC5HJLNpTjG57fgvQv28qTGvntz799QcDYW
 0JT7ESAKjrVSMbObQNY+HqSYuMoiI06s+7sS3SuV/do3pkrZA7pQmTLt4PfSmkYCYGAwwEjheZr
 6XYXyWmhu4FXhYJdgVdCo95+UZiYoPEWavBusi6uEqSAhnw9g68WjaZnoO6f2Nldcbm/n66xYeL
 Dc+SA6yN1vMxcmkz00kCTMv2u47t6wBuYJM5VLM41J/YQTOQMkU+jQtp8po1WadmiHLDOB0akDN
 dBj5N2ZsAjreLzgDhG1KPaizjZYgiubr3L3g+lAhDmQxYJ+Wy1uKZIFqjTDPDMciDnRi/EtUujG
 dmuG4YEbmTojBG27jduDKBJsSgBoko9O78pkp6fSUC/qANHk/El+YoE7EW9s4XcFKubhOwVupoF
 hr7BU6jwq4KQknQ3A6g==
X-Proofpoint-ORIG-GUID: w3i1NO3Cr40g-nAA8_VhINLhRHcOQALG
X-Proofpoint-GUID: w3i1NO3Cr40g-nAA8_VhINLhRHcOQALG
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=69941aa0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=GY9tGbHfO7DmpnXFqVcA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170062

On Mon, Feb 16, 2026 at 08:25:21PM -0300, Val Packett wrote:
> The MDSS resets were left undescribed, fix that.
> 
> Fixes: 9b518788631c ("clk: qcom: Add display clock controller driver for SM6115")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/dispcc-sm6115.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
