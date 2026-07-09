Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94153FBB5B
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 10:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592890; cv=none; b=URy8THeJDBMmUAnPDUwwbOyRf91aG8jETKLd/ph1m4Q+NoTGN+dI4ASPZpEWFhVSkQNaRJpfVWhO1TORfMDG3ML1m5N1TEWi5+gv8n26E6EXQkyyXK9Uc0zo6KiE4K+IMnrL+rbcCy92eZA1jxIQ4N56XPNFN45de+j23MTB5Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592890; c=relaxed/simple;
	bh=pqexknD8on3L3GLefZ+md4dIoKVfLl+/H00x1fJ83kE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyVVTJEkuxUmEGVjETymiv7tF23Az0qOir3T2Mt8IZHI0aZyLaiqJQw5/ldO0UtHhpo+atJkfvSWRI2M+uoFP+wRicryPUfjcE2I8AGY3UUerdNKuHsip+YsqflFsOawweoo9SZxUKaBLn814t1tHWoXecqFFiAjsSwDe4E35tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oO+PeiCG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFUkoin/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oO+PeiCG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFUkoin/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669ANiRv1536978
	for <linux-clk@vger.kernel.org>; Thu, 9 Jul 2026 10:28:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=igZX3grvnhIhD3DQIxHwSmvF
	05FX0mYhoyqwIQDOVzw=; b=oO+PeiCGNkYPCX+jneQZkVQIZo9jE9Fgo/BQ0iWd
	tUJFhExJvFPEGsBpvr4BWhUuPjU3bTGUhDlv6btmnHoA3Ryz//EDBeOX9gPFNI/R
	wiNQt1+LRpY7Oo5aUQlfPTSdXGOnVkF7U8LqzK2r5BZ+eN6SXSaopqprTCsfNrJm
	LPeNVn57uKRw+5f9pMyVdYeOubBHSfyVudp8S4o5shgaG1ku9pHhIbsWjPZYwofU
	RmHgZUuXG9qGyyPbIurMDBgAJ8wAe/3TKoeyjWLw562qlemKluhUHSxvSyIqh3kc
	E0ToRELBul8v+NaLdPo+c6KSkr7MOfZ1n0j3Yt0WntYeAA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqsbr2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 10:28:07 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-964172af027so781236241.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 03:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783592887; x=1784197687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=igZX3grvnhIhD3DQIxHwSmvF05FX0mYhoyqwIQDOVzw=;
        b=WFUkoin/Pi4JKblc48tvV/Dqro30dfU/fbzzTWeOCE+Poy7zPMpM32XVGduoiUD+p8
         XAJv9loNkq5rbuYgJFdL8MyVwf42ukE90wy3gEfzZwoQezfG0xuhGJJ3HLlI+6VeTS0w
         gxrRqPBJB8FezOnUeQVTt5ZDBOoMcOXZPOxloPGgrVeEjM9oCBie0f6yKYi9uQELChop
         bDBn6GBvnhVxS7cc/l1U5J6/E686YKGqGevtKLYJpq7qT+8noB2Ina8bBEB710awej73
         AqxWrZNAXILRpcUP7hB1hEA1c20+L4qHrz37zF63bjnzTvrGF0RzansqmNYWWBlMMJMZ
         VoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783592887; x=1784197687;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=igZX3grvnhIhD3DQIxHwSmvF05FX0mYhoyqwIQDOVzw=;
        b=oJQfQkI82qTKgIPX1wJXUnqnfWgl79zF4U9bR5kCKUo1Mr5mNFAd3lKCCSMespuV+8
         EnYSCtR2mU25Zjh3pHCtJZkjY/c/JhclE+lk6sw576d8k3LMTfYVKV2qtRgQDGlbyKgr
         PlU5l/ZnD/n/lUoPu8bAW3rCs7Cuf55rl1SBG4tFO7kZWl/RhXSFjo1udBJR3o2gSlNP
         r4yg1kIoJKSrLSz6HwFf4JezkAHArpOHsONKv48lE8+2pNKbNeSZK5t9pcKoz1PRhdt4
         OQehy5wr4Z1Xcr5pfu2Mcu9ye0TPuiZ4E8kvNKZeJ/e1ji1/sd58TCFLQkOuKTFto8sj
         i6Qg==
X-Forwarded-Encrypted: i=1; AHgh+Rpg7+4gjsKKISir7xZtxVu9nubRDS5f1jX36qB3gMvLf/xBuDWqfGjm8ILwJm8WyHt/IjHvLEh9ggU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHuDoRL+doQ0PeKA+NXgalM7YpzkAMEXsgeiibvEJATZ6jFFKu
	6+Azo7Witgj1UBDFFqqXgZ5eLfQWB3Jq3QeXg23Le52cbEA6HSW/Ez0rA7cG21CjYgLa+zGOHCS
	hjjx9J0r10zvKAYa0x/wviunlUSyROD0EMj4Rvh2vqRIOnZsMqe71OL/Ih5n7/ls=
X-Gm-Gg: AfdE7cl0M+jDpB+Ut1d77ClpykzBIItAVIpojiIhOTxYLjxOuu17vIgu88QoHwcaBwH
	wEi/c944/MMNzPkBVtTtamXiTPA9gAqU0PVgDrhziSb+2N0yQw2o0Uds3zGHcpL5pSXXztweQEu
	fk+QYIIHYKk2O80LwsBf0k1Ut8M7vThImZMHhASRQubWpK1PJjZFrLBG2ykTgaDHxysZM6CXVPe
	wXPVQycVUNbB8MvImRn1KwexeyuH2UPXrvqCT6Bpt1XckqZYYOeIePcJu2tGS0HPbwY+E2F2kun
	GCl6bn8/nxjkGJKgjixYb1whOv9wr2bz5XSIsMUaxaK4HkIU5J//jXsqD3m0oS66W3vUav7XuhE
	80y3Q7OG1JEsNY1XTFKGVgcK6IODmIbX3XLuOtB6DeezOpgnbjDP2FATEIi9xMHXeGhXu/PU2u0
	Ij5MLoiW0GJ4rmqV48JCPzJYPa
X-Received: by 2002:a05:6102:b02:b0:73e:5068:823d with SMTP id ada2fe7eead31-744e0010e3emr3884192137.18.1783592887025;
        Thu, 09 Jul 2026 03:28:07 -0700 (PDT)
X-Received: by 2002:a05:6102:b02:b0:73e:5068:823d with SMTP id ada2fe7eead31-744e0010e3emr3884169137.18.1783592886502;
        Thu, 09 Jul 2026 03:28:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13839ccsm5186335e87.37.2026.07.09.03.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:28:05 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:28:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] clk: qcom: common: Register reset controller only
 when resets are present
Message-ID: <ptdrtaeza6f2la6q6572nugz7jaeh646no5dc66vkrrjywj2vs@7nu5vusyxtcm>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-1-b320d822cdd0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-shikra-audiocorecc-v2-1-b320d822cdd0@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwMSBTYWx0ZWRfX2naGdkM7TgCe
 7WKSsnEhR1gIhthPJQH4sDawp6Egr5Ln5eplQ9S0BmoEvrBtnccTPFPwnAzi5g9hdnX8ShspXgF
 L6Q2ULpc1ml+8880z2X4IUKrZ17i13k=
X-Proofpoint-GUID: SNKfT47pVl39d0mhEAWNWzGbs7xKjTGD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwMSBTYWx0ZWRfX/EL7ZFVj4+5n
 HyzEOLxNSZINto/9rjajwrPpzJLsTH56n2s+UMH9ofO2P37zCox3rCkIt2v4Is2nZkVsBUQHlX/
 87j0buvQg0zpyQmGb9FpRkZgQqR9HdwerBiB3cXnoavmwogmxZ7pWD15IB9mFGXdRwcID8/yldp
 wAtRQW4Kx1KTOm3zVST3BKE6330zsAPaBPuPhfIXkiIjkWgTtpcc2XthyfVVNEnvxQv3v3Q+Bsa
 Z+PrHGrHrD8t+oNyVbUJwdQiSwYQae9yO5rnLkEAd/n686JFhqkxado4yHhgPbGkNg3v8piWNdx
 Djh5pf5EeOKBwXcSDWmQ5/9WVMCrmjKOaQuzH26IcWshXpjAjsqQ8K1QEU6+ieHWDBy2EXXs2mx
 PMpvnxy3IyyygXErp6GgNhrTOu4nw4+n7M0yyjViiQkZLx1fUwWAhVyxSwTVjg9QzMdBnOZmDWq
 GOXbAlk3VcLepB9NzGQ==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4f77b7 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=s18ixZmPgrtx1irfEwkA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: SNKfT47pVl39d0mhEAWNWzGbs7xKjTGD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090101

On Wed, Jul 08, 2026 at 11:55:05PM +0530, Imran Shaik wrote:
> Some clock controller descriptors do not define resets. Avoid registering
> a reset controller in such cases by checking desc->num_resets.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/common.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
