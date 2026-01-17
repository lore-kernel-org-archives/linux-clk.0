Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44AB135A53
	for <linux-clk@vger.kernel.org>; Sat, 17 Jan 2026 20:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768680556; cv=none; b=GJp9ep/1KAQFi0Puz6BrTr+JZQ5b1K+28popM3zgxmKjXkjRT+AGJb4cbirXKDq+fpyJA4gjFnzEBMJNgYAr0IqA18thITCH9ISjwmcNAnxG1qqUzdaqhp6idMQCZgOJExvRsgQmhujhcxMrm5jT7gNkvAd6umm90OpMPf/7cwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768680556; c=relaxed/simple;
	bh=MJb33HNgU3Zmytnv3tpMnmIy6S7ipd+PtC4wbgRBWlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORZ8e3afvBukdzdeURBsxoXVBz+Bi32fr19OiySA0fSYzceBTf6VTdXXkpgCT8gJ23kU8YGyPtT32kSF+2ZKJPatnXYaxzv0Nue9+KfJOOHFEei+TM+ultgRbfT76w/7aaS4mNbgTl76C85jzEt/M0I6Ti3mEOlgCzD93O5isK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGqhU13B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=joaicTOb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGqhU13B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="joaicTOb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60HHxYTU2387327
	for <linux-clk@vger.kernel.org>; Sat, 17 Jan 2026 20:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7V8bBuKNKK2x8c3lgEfAbpN+
	fsyEP0+sJm1A0oWjeBg=; b=UGqhU13BRG9cSmRH9uJJRuX+l6ZHcGijsonHFWvF
	Bac58faD6rtFDBekyjGzPTLqB3jU5/oiEIRG+j0nRuRoMpElC44FbJQnclLvA3xC
	ZUcAJMAXfpYRDEJJ0BIoiqBPyD9TfQZ26XDdHbyf0x9V84xQwLl6VBzB6X+tS8iK
	pbAubTME6sS0AWmxbfr6ON0jjAH0HHwV3VXFGoUzsILi6pYQc86d5f3FMVOVKM63
	TYOiRG2WZaL44meNO0sCADWH/rbtABUunjk9vX8NxBhpJEtCw0qo9L/pKgbKq3qD
	0wxq6oGm7mySjwFyyAdFyLEuL0caqBRhu2e/NgfXPyh/Tg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br3kh177m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 17 Jan 2026 20:09:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52dcf85b2so1142861185a.0
        for <linux-clk@vger.kernel.org>; Sat, 17 Jan 2026 12:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768680553; x=1769285353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7V8bBuKNKK2x8c3lgEfAbpN+fsyEP0+sJm1A0oWjeBg=;
        b=joaicTOb6qXwAlt5xQxK7PISqRXnTvww6Bn295M73E5r/cdAQM1LG+BC48o8be/6IA
         c/MVhpigN4Jcrj+AAvOIiVYFF4qQfUuquRWhrvqf/GE9J8lyWqB5jxFdRXg7wCosXjFG
         /lncUcNvZ14qdEdOPPbl/doaidsln7RhnF4BSsPZEu0CwUOGDbJctzHFT8vabsPgUtSF
         nO5wO3oSJecNRRKXQcY78h2U6wPDcYQPTHfKGQghXn8o5hXVIohESTM0uXx36Ji8F25w
         RLPViX+LDga45r6eCdBS9lw6bZ5gz3pSd2ClD+Hdx5HD2tL64JzTsPuyi+VeCmlXpDhF
         0xjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768680553; x=1769285353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7V8bBuKNKK2x8c3lgEfAbpN+fsyEP0+sJm1A0oWjeBg=;
        b=E2tuHel0glJp1ctlQN9yEdR2sFZx4XF2Z6xElSq0/mrXvaMCeijYDyKDLpDjDtZmJs
         rp/kwyrrJt5InUCcYDz2oQiDZlt6R1F/2XhEscbTAO4grxxQ4G3/H/iFDmuGsfTKZEQ4
         k4Ch0LBdYVHWOxAAVviNlOOpJM7scg+lsgisadK5tZhrVo9bS9mk7nfx0gLLgVYF5Vh9
         fR3MsZBt171DXde7KNj6Na8mSs8MVlr74DcG3uDNn0qBd5ZcXQFH0ztmPATP8oGPC7Np
         dX4OKMTFizxrM9SCds5PZICOCUdGuUVe8674TjRLNVXfLbt5EH1b2qW1hsTOetFGAuWw
         6BpA==
X-Forwarded-Encrypted: i=1; AJvYcCXY5WAbh/lD2hJCt+vIPenWbKvWVqhFHoaPw37Ra+UW4BZW76ffkMdeiW+4jJO1//6/wL4GZrNyPvA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2568/aFkp6B+/kgfFNv60oQAkU0IF/Wk5/amv3k8Sc87Cz4xo
	LO+4XE1U/8DAHNy8Q1Df6+dL59w72Q3ONlgVAMwDWVMwIs+5sSdodHIFS7/G0/1c+rw9XFJwbFw
	vgGzpO8+P3aBCrYgQg9SQsRFi3pAIigdMIZjmo8ag8r8xUjInbKAzrxnyt6UltiE=
X-Gm-Gg: AY/fxX4mhiQjTcsxK2q09eEF5bPjlPs1HH2qyGPiXMV+jfSG3RTNdYdDYNILt29rwVD
	bJwhnA+GzsDYC6arcrDM87RsfhgnrwKvvC8DSmcym/aFeyU9aHo2Urf4TI6/CTVmxr8zCXevhZJ
	vjjLaH4pfAL65v45lIoqY3k7rtjc3C7z8QCf+Rc8urWuFuCCpuvpBQ/0LTBwYdY/cXPzKHYuH/J
	MyJAtM3tZ7c6t4CtH3VZjTlpVshwl0+Un6THsk56CVevzakHoRYD4DqXjZWt20ygKoNbhYVueD6
	ibuS3Q33dHTw5RZ2FdixDNEkywQ9w0hmCvqflhWxX0kCtYB6+avBFAf3d8Cik5Ae7XzEwdJJq0R
	mHn0+jk1YUFC2FRWxAYfVK9qW
X-Received: by 2002:a05:620a:4482:b0:8c5:3881:da82 with SMTP id af79cd13be357-8c6a6944c4bmr929201985a.48.1768680552944;
        Sat, 17 Jan 2026 12:09:12 -0800 (PST)
X-Received: by 2002:a05:620a:4482:b0:8c5:3881:da82 with SMTP id af79cd13be357-8c6a6944c4bmr929198585a.48.1768680552304;
        Sat, 17 Jan 2026 12:09:12 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997df75sm12742304f8f.29.2026.01.17.12.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:09:11 -0800 (PST)
Date: Sat, 17 Jan 2026 22:09:09 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] clk: imx: fracn-gppll: Add 241.90 MHz Support
Message-ID: <zf7yc4s7i3fo6tcbenzmce5n5jszanw47umqixczxomx4ryby3@bo62yj6fyviy>
References: <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
 <20260113-v6-18-topic-clk-fracn-gppll-v3-2-45da70f43c98@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v3-2-45da70f43c98@pengutronix.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDE3MCBTYWx0ZWRfXyqfP7lJFS9Xl
 YYWDyvDqnK+i3oC7CeRTAOwifoAXDwSnImDVuoUhyL1LaceHuax2ru9C+XnvUQLgavsz1A9ieCU
 JIXPiQ1Ai9a7K/r6zJ7D41ylVlS6kB2y2idHizcsNnUlFOBaCyi2dNpf+oz0PYUY8+x7en4TWXy
 bOHyc7KY47qsyITRP9RGrzIEz/YIPkN8tHTywHRho589Wm/DAcfBfMmZN++dtiUQ5+oYQUoFD7a
 SkHa7VTmL/vwyVzINNAwOCYz745FpvtsGvgO6DhQkpx5/sARWVzlt0diLz/fp8VXgY/kkCdQed8
 cgdVnNc/IiMsJ1HNp7d5OWMjwWJ39Sf2OsVrOm67M3Xp6wpAgjXqh6kc9ao/RNl80VDlxkpxCie
 tAxpHlojmyPnuzyXP7eEdsEQb7jpmpk6GJI/SaCgbhis0krEGF/jUpAQxqmWk5O0jWbrvOCHPSG
 f5OBJfuj1wi9RYOfURQ==
X-Proofpoint-ORIG-GUID: StFRYol9HxoWQHKnEFydIJFcnQBpBYSE
X-Authority-Analysis: v=2.4 cv=JcyxbEKV c=1 sm=1 tr=0 ts=696bec6a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kZO3GQxq1qvB2pjO5BgA:9
 a=CjuIK1q_8ugA:10 a=_pNNAR3j44AA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: StFRYol9HxoWQHKnEFydIJFcnQBpBYSE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601170170

On 26-01-13 15:52:42, Marco Felsch wrote:
> Some parallel panels have a pixelclk of 24.19 MHz. Add support for
> 241.90 MHz so a by 10 divider can be used to derive the exact pixelclk.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
