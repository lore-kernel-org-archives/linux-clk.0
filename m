Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52F537AA8A
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 03:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778469701; cv=none; b=LNvqwfiLYrL/RMqX04P79vyLXvMJoJng0QyQFCw6MLCnDSlh+Z/jSQlSfR2m+ZcBZNK5ZldCUHyY+2lkFGT2oKF/AeAsaql6ESuoBpLSqDnSQHe1/yzqbk2ihKL3vOpRZRUuQKM3/9bSpUVXoIVwnq7bQPqi3RIWnVH2KgPWY0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778469701; c=relaxed/simple;
	bh=eNRiDEIcluIRSwWhC80cEyHWCnUatRnuX2GHrSiDM30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEifeREyDx/rR080taC9wC+uJN+C4oTprVZR7Ze5G9lIPSj6k7r4yxnurK88meydhTx2J/1JI5V/MKbLzUhwWm01AlQAGirNPn1uXMUCaj1IqMdhppFLeWGcz3OZkuDJiSCOeZqLzeZMbKtoO4kz4OKWpVrYpw0E/IshlUvoOMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a3Cbxw7K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZlnF3Sd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a3Cbxw7K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FZlnF3Sd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B2ppds1343221
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 03:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ot0AvZ++ETPuA0JLPkzl0nZT
	3QrDG0/3gj0Tx8fDXqQ=; b=a3Cbxw7Kl1S1swM5iIsFNoI4TCsmooEMOyn8FK7B
	20EXYxGH7whoOf3X/iL9dZeww+N5rBcJ2rmEsT6u15lPaI48QLfv/chJme+xJgwr
	WfxyCOOguqwX7krjnVWuTovV9GZ0WP7vBDJfnTf54DouxpN8pzqnm9GQdaoPyfmt
	c4ryzb8M7ORHQlEJuWazeQ4YUrLxlhHO8BqckmgCxQqkcLFEbO7MigzWWbMBl8Wa
	nyoqIN4OD9O419U+b1L1CxOVO40KR1omHOX6w/6le0Y60tNlPzsPs+MFfLhye3Xv
	6xTq4l8MgIuAdhqZcFFfT0Horxd2m9TdQ0fYwYiqJraBwA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e2dkstdme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 03:21:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5d1c2289so93479471cf.2
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 20:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778469698; x=1779074498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ot0AvZ++ETPuA0JLPkzl0nZT3QrDG0/3gj0Tx8fDXqQ=;
        b=FZlnF3Sdrpa3uDMn0A6uhCNbs+3S+Z4c4wiVJFubaanlNaEf17he2CCTL7GdDbVF8S
         hPYTWiuoNH/2WXaXoCbEDA3m9Uz8ugO+BeHeE+lALKanGvmvLeOsKTuaR6IoHj2mEY2z
         4x6tm1Pf4embQcHKh4Y98f3CauqnjzaBNDFGvIPZTivsArUo/oguzMPq3lq+foTYZu9r
         4GBtb0dXmzyed45mqlqC1yA/d3Pq1xEWl1s0QSY57Pj5Q0c/blo/KTVbOpfp/l/u47Zh
         Eu5HX0C5VRHKLQZEocfsWTC0qM6kPvP+f4xoNL25gBp5Y1U0KC03843Ez8tLPnslW+YL
         5fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778469698; x=1779074498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ot0AvZ++ETPuA0JLPkzl0nZT3QrDG0/3gj0Tx8fDXqQ=;
        b=V4FIrzJCothd4caKoKnsqC4kgr+0o8cUySq76owEyIWR9tHoHk4CuVrxFajrtAC2F/
         mBvbkxhD6zkwEEKUMojagXZpLo9qt7vI1uwVFwqxX2Dp+3DjfYrcwt7JRfrDBJ0ptzc8
         CdVsEQffhpANpZLCv8wspJ6RtzsumSk6qVB4rZBfiU0CiFfMIFg7M9V7Ub+BYIyfc0AW
         nX1T0Cnep5NE4cI/BUhY6+KIA0r4C+ymSadOYE6YNJBQcc9rN+UD8IOcEx9K5dkaTvhu
         jl5cPcEZd2n+cRXshifbmgPS9ECT9gG4MMf7bMks79a771SzxXazEyRSxsW0378tjw3r
         zfUA==
X-Forwarded-Encrypted: i=1; AFNElJ9VN3OIz2B199K/UlX7QXyh051IG9YfVUY8uwodlH++6TcbG5O/99SXNGYbl9ig2VOT1drqpW0mVH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkV/n3KbuezyNzPFqcOpUuc2S0CV/oNxZbuJdqP5PcCA7ptWDz
	K68bsX6M9iN5xFD9okNP5CLGghHIsEi/833abmzgEqnXz//sgEOlncTRqmKdcqVg0958sNP2cY6
	rU0hpwcjsmYlupyrtIqfAi68SYo0jRZyUQCjEg4D0T2FN0jERx7Sy1zWy818k/xg=
X-Gm-Gg: Acq92OFWOVQeFmAXA5TVh5wRL9glXT8VTsdRfBnl0N3K8Puxp404MEkrwfskd9utDtH
	LfRRfFWQY4ZBFaaTspUODsHWStRM7VtJEywcuTT6gi7Ma1cv5yCvKFuty6LYiffwElRv4drIet2
	49Jp9gCtXfnmPh+ktnpZv/1V8UXirAV92X5mfXI/KI3jQqoHd1P6jeKINMKqgd4YiGTfpAJEgXZ
	Mfp1sj5P+/aV8fb1OHgOZ0b+jspJ9DgLYjASsxcRV40yNMdCGNNMSFW2X98b6uS9wxY9ugdIpXF
	985i12eZwy9nqozBJ8CwXq6I9d1WNvN374iHOzg/J7HiqbBkZMGqEnpAoyWr+ODA4c13tp1dX/j
	k6cFA03T2ADK6Cpv48EL37gb7OnB+OwJP5kt8Bl81eCc55XgEg8Ikcej/k8QSxa8ZAk6IOKTSqW
	EFRoVyocTyYNNzRyDrc0bPoqOKsQLpUuK8W0g=
X-Received: by 2002:a05:622a:40c7:b0:50e:5f36:1da0 with SMTP id d75a77b69052e-5148e99c6b7mr178858661cf.49.1778469698178;
        Sun, 10 May 2026 20:21:38 -0700 (PDT)
X-Received: by 2002:a05:622a:40c7:b0:50e:5f36:1da0 with SMTP id d75a77b69052e-5148e99c6b7mr178858401cf.49.1778469697725;
        Sun, 10 May 2026 20:21:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8bd7d8974sm1274980e87.64.2026.05.10.20.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 20:21:35 -0700 (PDT)
Date: Mon, 11 May 2026 06:21:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Message-ID: <s67ja4ae5ogjvidv4b6lzlpiskvowctlzki5idkku5warfdmto@gtfy6nvnf4lj>
References: <Jxt4BbN1dL8VKh_Zjah1xecAjz3c9VfbhKSm4a0K2D1MNKfJKIFnCPLj2VvdW1q4LnMIQy8bCzV3YoVnLFYUlA==@protonmail.internalid>
 <0cee27b6-f566-4958-8634-2c43e099281e@gmail.com>
 <dd435489-0cf7-4274-99bf-a591a15e91e4@kernel.org>
 <-hM6afm_Cu_8Cha9U-hrlrg6CGDEb5D3PFpPPCfIh-QgkdFJp_r0Ah9k1dvAF4zkju2dPc3FZJxvOA4V4hupAA==@protonmail.internalid>
 <69f9a6b7-7431-442a-82a2-6305635a508a@gmail.com>
 <9bf43e04-f834-45b6-8942-bcae2e480371@kernel.org>
 <eiZczGoYszhu5QDfm96oeViUfzDjhlJ8JLLIm2YmOU6S2gfCQoBeo9K2T65EzVLvv9B4lSo0k1KCVWMGLnzL6Q==@protonmail.internalid>
 <1ee77cbb-9894-4b16-ae2b-8e9035fd6cd5@gmail.com>
 <6cbb9b37-9560-482a-9fa6-15d5370d258f@kernel.org>
 <1c2cdaf2-fe30-4443-b164-c37c26f3dd05@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c2cdaf2-fe30-4443-b164-c37c26f3dd05@gmail.com>
X-Proofpoint-GUID: 0tVK2d-29gv1Y9VuLS7uxMVnIYixP3rg
X-Authority-Analysis: v=2.4 cv=d93FDxjE c=1 sm=1 tr=0 ts=6a014b43 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bAtGagR5AAAA:20
 a=e3rO1A9j5ybCLOvar8sA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 0tVK2d-29gv1Y9VuLS7uxMVnIYixP3rg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDAzNCBTYWx0ZWRfX8ZBnSucLeyvl
 fd10PQ+EC76gnc0vx85mMGFc+tq62umc/m3PPS7czeTWAr6K1JWyOjYMNUgX92NvSiX9DdbvAUc
 pefkxNfFb2vU0K3SZpCuLmAdBDGQ+ibVm0ZZ+C9Qx2mp+6+l5r6OJeNSlnhkZnD3XFSt8UZyRo8
 Qmnqqbgc6mJgtFPMJo/GO6fg4sD1i6OZ1F+duK6Pq80u/izBzBhjmbdiqZDW+V6DeIvi8z/5zhf
 XuZT9Q3h5jtmleUa4ozGcP/7lNWu324TvNAAgAd60s0iKwfY0Zn2B1yqvhdaqDS0EfCNY5ronm5
 wSWXtCgg0TdzZmaRnUSA+xtU226Cgjo3jhB5RGqyPyYnKUnNAW8Z77L14WEGi4+bYvbJed13u3H
 0ck1gDIFLKRfDhrXOY/5+o1S8RzdlhpHwnGCIuMPIHROYCHznc3agUopcAPYK2BIEM4b01U1kub
 NvKcOBSp5OK8eU6dxKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110034

On Sun, May 10, 2026 at 01:14:02PM +0300, Erikas Bitovtas wrote:
> 
> >>> Last time I tried to enable only 1 of the cores, the following would
> >>> happen:
> >> - If core0 is enabled, HEVC decoding would work, but not the other
> >> codecs.
> >> - If core1 is enabled, the rest of codecs would work, but not HEVC.
> > 
> > Can you be a little clearer here do you mean - doesn't work on that core
> > or doesn't work on all cores ?
> > 
> 
> By that I mean that when I tried to play an HEVC video with mpv with
> only core0 enabled, it would play fine, but trying to play videos in
> another codec would result in power collapse fails. Likewise with core1,
> but in other codecs.
> 
> I assume this is how cores are split - core0 does HEVC decoding and
> core1 does the rest of codecs. This is confirmed by downstream code as

This is correct according to my knowledge.

> well (although the cores are flipped - core0 is the rest of codecs
> ("legacy") and core1 is HEVC):
> https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/arch/arm/boot/dts/qcom/msm8939-common.dtsi#L1589
> https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/Documentation/devicetree/bindings/media/video/msm-vidc.txt#L35

-- 
With best wishes
Dmitry
