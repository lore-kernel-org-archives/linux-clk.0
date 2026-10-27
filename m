Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100779;
	b=3LJlWU26uzN8wBP9ldjCtuKSTduUAHtUXoJIoluBHTn47xW4/kVU515sgJxObQ3irElo
	 6vjr0tTYmjEWHp8KapGmnniaPNB/x8FMed1Uknj3vjg5TFELg6pFGYRqwo5snftwVhB6W
	 syCZ+I82Ikn+WinuPVG8mBs6ITIJYMb4SwioOPg5jX1eJ5CvRvk4floSiMiKye6wDtG/x
	 DUTll1BHriTScYoMdtOT56YbDTAK0OcYwhe5S+rnHXPL/VUYgSuvk+kbbuUq3GqNCxj4R
	 vCem+9z2plJSYbVlpKrgbGXsPQ1B5F//J3Kr5ZUU1/mjHEiw/NHTTpFsURhNA6DFQTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100779;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5Ve9ui8PilMxtzrantty91AettA4A9wQUP1tdJP+4uQ=;
	b=gnce/Y70SEo6b6xqWMsjlcyDrHteDHSYRHQn6WrENXOZGx49DpVd4UsKvAdTR1YrlalK
	 CT1QCZNtpFjfPZdHTHYoMVag5k/3DsVdWfC4Y8E/E3+o8A+2hTj8jSvElgidpU3RBGq2j
	 14MiWbOI+ZnlSaH275bRX6GRFnnMIOsXslzWVX5ZjdhZjV7tDV++vCanAzD9MRflhmVmY
	 zV/7y0TRipgfhatVZO+uCl57D5YtnXIl3QCtWSdb94QQyAYprh355RbmcrvUoSDXOheYo
	 y0Hx7AlusSYMYfGi3lwvmVORUdEU1kBkXhQ4qguCEhjuBJ992tgzRC5NiLTTUOuCUlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ELzUjXm4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EfQ8McQv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BCE60A381E
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 11:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13BCE60A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ELzUjXm4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EfQ8McQv
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdsW01973270
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 11:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5Ve9ui8PilMxtzrantty91Ae
	ttA4A9wQUP1tdJP+4uQ=; b=ELzUjXm4v7MAFja4JJbXr2MTcw/RSuWKkdJ+hy7O
	MrVDaMZHhSshavS3nj33YkeKPqWV806SwcXtqRqdXBAVAKjABVzQCstnCH/xEq2p
	XEFrLE/vwZXnCQidU0ldxENnTa99RkTMdSYYniz8Y9PDbENnMvHjG/MhfpxOw2HU
	Odplci2IeCh9CdxfWjQgZmTocOeGm4PhwoCAfUUH4WuCpVt1z7q707GLs3MoezAK
	W1UqYhv9zkbprhdgzAYtii8SccjJnM18nLKo8CMj5B8xJFVRAbsY0nBY5TfEgYQ9
	nGx6WbEm/IbX83ERcKSKLlBTiwSOjinbaz1M3Hg2QZTf/A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1gb08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 11:32:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c44b8fed1so78527346d6.1
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 04:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100777; x=1793705577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Ve9ui8PilMxtzrantty91AettA4A9wQUP1tdJP+4uQ=;
        b=EfQ8McQvH+DSDyFI+ak9B8ymsXvLPmTU5h06rgn2Hw4SgSTajH3f8rDXyTIOH7eNuM
         weMsyWmscxbSYcFZ29ankI9sMVZvYCX4xMhTHzddpvxWrNkL+gMwDrTh7daFlDaFdsAV
         GcUBogQZ37vrPLzmfqSbeo/kWy7YlZAGKE4AgUfjDdaNRAl/4S26ArjWoBs1i6srI1UZ
         BOIH1JLsLCe+v3Pkg5CllE2vS5qXnp7Bf+NHYRdM24Kv4Sz39ldCmstXM7ahoyBxd9KM
         AN44H9RD/kqOalLxwE54T0wT8/9QofIScvG+G6s1lAVwwFrDjDYNYcvQgUGb37PIBwIo
         aB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100777; x=1793705577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Ve9ui8PilMxtzrantty91AettA4A9wQUP1tdJP+4uQ=;
        b=KXtQAqXbOWkne988ww3VaZpRqYtDB0eDzQYKq0j0kTzJVnDubs6e+N0Ww+/8dk/sjH
         Kmzyk6k8Ch0F62k6ehRvMX9ubGNoqvfDEDU1Gc8C7p3XikzkV87T1UZI4YAOhm2QodFI
         MwKdiuejJVOZtHD+87yPyXpSQjxcfvcz+o9Y6q9lOQy+PwtInF3T8je+zNiQParJSUOP
         pvtdq3I10TNgJ8p5BrzYTjTZ1sEJBcUMjIEQOIR8g7rWXnIfIBEWLhKY56jGVnFiCL5M
         +5aJfsEGNd7DOmXzZ5gPowrbMLWGzf8Kt++Zze9RUUmdV9GScsAnj+I5pukGuEOpniEf
         2Y3w==
X-Forwarded-Encrypted: i=1; AKwUvBw/ZKsS8CHy8oCHB+GcX6AhEF9wYPtDMmOJv5jfDJyL1RfGNmSf+kUqJbLR5FsseNkjAHuigZhMPY8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL631xow0sgTJelRWtHAIVdwYgc7bgpw+DcrPI/aqeF10muW8y+
	Ug5Ve9eY2QwfOamHeIwhlqXRYIrSCn7mkijwGQxuFBL9Tl7UIl4EjCEwqSx0frijEbJK+LSt1aZ
	0WZJzd8ow7bXKUBgzaT99L/zwm5BsGrqCTx962g0M/wXW/zpJbDSipcO5s4qZjCc=
X-Gm-Gg: AYBFou1yzapT1vr1CybO8qtYvd8u3LBtTtbCXlKHKXc8eNbcUEYbaBJMDK6QpXaAkDt
	L3IC1hLCmpgjwtkx0z4vdyVShkOCBVTmUVEuyaixvFiqQ5uIqjMFf8cSEfX7BlWrKK2Iny0SjSl
	lbJmgXA7GRi2v31HkpydpVfwyb3Yu6QHF+cT485aGpL1bj97MGFnRo4v2nwMA1d2NQzoh/yaCXr
	3KPKC0MeoqThd+sPmVA5iJHGerEXbvCxUDyr9zvm5dZYaJmFeYuYOXwQ6O0InjOBI0wxPYDSmHa
	mPpiWF0FXjj2BRlq8y7eamfU+NI7VmjdLHoTGkl7gozl4PXpH60c26NbMjsCb4RccOApUTPPZiV
	msjRZeERHnvBFle0+
X-Received: by 2002:a05:620a:28ca:b0:93c:8544:6adb with SMTP id af79cd13be357-940ef8bd39fmr1696045585a.22.1793100777099;
        Tue, 27 Oct 2026 04:32:57 -0700 (PDT)
X-Received: by 2002:a05:620a:28ca:b0:93c:8544:6adb with SMTP id af79cd13be357-940ef8bd39fmr1696038185a.22.1793100776313;
        Tue, 27 Oct 2026 04:32:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb851sm19211985f8f.26.2026.10.27.04.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:55 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:32:54 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: patches@brar.si
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: qcom: Add SM7250 graphics clock controller
 driver
Message-ID: <natokcic7hm2l3erd2jhghzlkg4nvy5kejms27hi6dr4xmid5h@tnhinn7yjp3i>
References: <20261027-gpucc-sm7250-v2-0-773056e4043e@brar.si>
 <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
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
In-Reply-To: <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae08bea cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=SYyxiif7jT7wlZCutrwA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: V5iu5nL9ZQUTFoIPlecHb4E-LpPtNOBT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX09bDPkwayEI3
 gbZZ2IX5bOvEHCnAWIETlf+BiOi5STBha53huD3dLxguTrPWqa6EcVzX9uSSzJtuhgFYuGozfdK
 osF0E+3hQYDL9ICKtFeHyPTOuT3nKv4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX1GEsbyFMAK9B
 7W1royZAl6VawyGCZS/AfabWR6U3KHTG1oovLYMar2IfabMtGfzGJ+TGY1Qq0UepCGM/Djd8RnI
 /wUjqmzAbZGFzQPXdnruuIZzZlW52YXCg+12oAChHanKxgFpGBzsh5GyK8gGLlAKZNn9FdDdMGN
 YTkkE8QvyTa/qqpXBfoh0hgEy1ib64P7h1wEgf5GFfxHA0ECpRd6Yr+3EyhoBk+tp7DTu6t87qg
 jjJy2KQ8ukVvVUoLZvbMT/a8vu/cjWzvqKx8pNStC4snCVs4O0MD+00msxN1aObkJDQGY4HtGZm
 68I9eZR28qvQ8vAcdkbmm/Ap4zj/d+ljz4tZrhiW5mr7XRHVPdLBO1xpAtLvHWFqMpNgkyCE7bx
 nP0tVxsCgN+oHwGZrapucbIl/UPQFUgmQYGCUXREaiUkH1qXYFYAPAApzAEBG1BnKqhQtR1vvlc
 cpBLsFrS6EqoudCDYsg==
X-Proofpoint-GUID: V5iu5nL9ZQUTFoIPlecHb4E-LpPtNOBT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

On 26-10-27 10:05:02, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add a driver for the graphics clock controller of the Qualcomm SM7250
> SoC (Snapdragon 765/765G/768G). It provides the GMU clock and its PLL,
> the GPU CX and GX power domains, and the GPU SMMU vote clock. The layout
> follows the SM8250 driver, since both use a Lucid PLL and the same GMU
> clock setup; the PLL settings, frequency table, register offsets and
> GDSC data come from the downstream driver of the platform.
> 
> Tested on a OnePlus Nord: the controller probes and provides the clocks and
> power domains for the Adreno 620 GPU.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/clk/qcom/Kconfig        |  10 ++
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/gpucc-sm7250.c | 378 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 389 insertions(+)
> 

[...]

> +static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
> +	.halt_reg = 0x5000,
> +	.halt_check = BRANCH_HALT_VOTED,

sm8250 uses BRANCH_VOTED here.
