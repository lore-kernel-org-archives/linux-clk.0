Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAB634164B
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 15:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771430327; cv=none; b=dPXIvw2z7fb8ceOEG0UxmbNyGUHtPJ7LhSENcvOfN7ZuBtHzn/PlHi50MwrTFMEbTEeJJgERUA7w3cW8Hy0UqzHb94vPabqwUC4rn7gV/vSBJqfozq5u2IZyUCrFrELkXwqCiJSFpDGL6R5qvej2BZlyCwr3UXyLWhICX/pXGkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771430327; c=relaxed/simple;
	bh=4UKsrMNfLCiF1xF8FvDDsNS8miSUkjRKIn22yVThOZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyVJTEchhMQltjkQqq+L3imWQ1yLt60yQ8qteyv6G2OB9pymJ7iem3dF4hc5EFPA3yWmL1j5oHEyjXF+5YtTsVLP4099QzwJYBgv1FZA2s/V4oHzTY4lFIJYcW0Jpu+zcjB0gUDbFkUqalaeCwxTS9xLHZFCOp/GgPsUmAItmDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VI+8b6zP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GtvM+UVQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VI+8b6zP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GtvM+UVQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IBcs7M413923
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 15:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w1emkyL2g0/kDWQ3j+VkHCmb
	QpoawetFO2n6H9Fw8Cw=; b=VI+8b6zPKSdkgvsz3S4TrP4UYgz+ewvj+mZLtcVU
	PQjOYyBFANihm1T8+A/u6H2xLus2GSa9v3PPwnxxIVNDspDH95MWpTcYVXSN+suU
	6FCI1Mon/E/YlZVPGREOkN5DZi3MnyQZCbcTUCVMSsxgxN2OiHAAuiQl+15YJbkS
	NF5nQsLPbviYo0lVIy2vUoLXV7Q90P6SRSF7W44OQOOUSmEI8v3e9DDQtLsG5y37
	FU824JczQ+mEdqNbKXLoAnoJsudjP2xolOeKrIRZiATedqUmlqcARJBCdI9R0LhK
	GToAmIMGp1Ms3H+pkri6Fg6jCLvgfTEj7AJjy5wVcKXOHQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd1q6t8rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 15:58:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70d16d5a9so3077568085a.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 07:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771430324; x=1772035124; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w1emkyL2g0/kDWQ3j+VkHCmbQpoawetFO2n6H9Fw8Cw=;
        b=GtvM+UVQ/JEo+t33j1nzJeVOpJw2sfVfCnHwES94qLR9VaApcRp7guWxrSM5uoaYvr
         jHuIP8JQruLGWyHZTAYAoi7JbK4xKPpB4S53UHaDsdPIo+EF0nEf5g9AAZS2ndGNfdTQ
         T2+ZFQNi4L8OG2iuz1vkQ5AS+GGs0PFxDOsSHHUeL7yNcV6kwlv1RREONVnScwCycKHl
         +2ncg6K0Rw7T6/UEfcvuwUn8uLcwMxPlSdIwotzTBPLeN2UbgMUradpeUSQAoGYZvnyD
         H/tNjZqajFoLFYCF50ajl/Zg0LkhhUQkg+OKDDZP8JK8saMHamlymvyBI79vVi5idSlu
         YZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771430324; x=1772035124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1emkyL2g0/kDWQ3j+VkHCmbQpoawetFO2n6H9Fw8Cw=;
        b=v4cCyscUkW7fsYrxVFf/1Xjnlz0WpZgc8QbDIYbmvI9LfaWmF4lwN1sJK/bohw97/S
         ly721MVi9jaRnoMAUkiOSffCjUkmoYJOomsxYuaNQxFfyyRBKyKI6s8pKF/JHMxYu0Io
         Hln3dQ93068kPlgbTnSFzgPbY5ySpsRhX7JCkbyOcJtbj54io2TV3Y/sZt1OjbeZACvK
         F04s1jTU7R8pjD5BV3ADwdnOTMvuiI6lWFotEdeNrDPVYG3Dw/nol26WC6NuazDA6Jyx
         Q+BaIP3UPlpEN5PAowpEUcr1IQS1mTHtubDk+IIhyYNE/vo3PwnPVKMxu1AgG6pDfl4D
         V5JA==
X-Forwarded-Encrypted: i=1; AJvYcCUwSVXjujcuve0gxhWwFOScuIe9+YnVOMu1F+/uB3rliKaAc55Lsr2rTkquS1Phri61oppn1hmEPcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT31CaufQm2mVqwArd/IBFsdEL/F2qrp12LTS35CUX4gfWox1I
	p0HAYtCUOk8iV/LQdZimGIfN1bZzazg1g4RbrQAgYtSaSCCO4bQJ8w05qWdkadOLuD1TqoqVuzA
	1963NOvQ5821mmtC9ZhxO/tZ+VE6HxjDR1U6G37gjhglfzBi7HFnPzVonfGYDeM4=
X-Gm-Gg: AZuq6aJJV2FwW8JZkLwKHh2B2elrrsORvIZzBPjpdgIIDUm9+Vt5pEO4W8L9u1CJ7wn
	+LyCmCgqUZC57q3+3H+5ob9rkfEdCYpqd/IdLTPTwP+ObmuxDLuynDpSq+k3qvDaPVL5S5DhzYV
	U6agc2GbyevYCSIyQ7No5bN+sd+iXZCbZM3D4SSJogxY4cPmnJiZEWJSsZK3wwjl3rRPOGK/qAU
	/V+dsWLkbnPKya2p8Wh6Pde8PVMrPW/Csj78Vx7PLHFid68wt+fCVbwV5koTUcJL+UaCDdjje8N
	eJorAf81WpsG4xXBYCabEsiS5QeqBKno76UuM5PeZ5wzqznTG8C3bNRNElKDqCmtJwezKKIeUzW
	PEEgM1NB/S5AOrqSfTZ/w98irQHjwcpr54x6/LbUuaj9Tf/WgXB3zrSb86Jl6hhxwgQoFLra6vC
	RX2EsVUtAukqCVU6KHmaVBz2z7fI8WKYSSAdg=
X-Received: by 2002:a05:620a:19a3:b0:8c5:c99d:b2c with SMTP id af79cd13be357-8cb4bfa7a4fmr1728976385a.34.1771430324079;
        Wed, 18 Feb 2026 07:58:44 -0800 (PST)
X-Received: by 2002:a05:620a:19a3:b0:8c5:c99d:b2c with SMTP id af79cd13be357-8cb4bfa7a4fmr1728972985a.34.1771430323548;
        Wed, 18 Feb 2026 07:58:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068923c3sm44147201fa.5.2026.02.18.07.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:58:41 -0800 (PST)
Date: Wed, 18 Feb 2026 17:58:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: qcom: dispcc-sdm845: set GENPD_FLAG_NO_STAY_ON
 flag for MDSS domain
Message-ID: <wiztxwsea2aojcxmcs2q4vskooli7lrw3oio75bij54273mrbr@ody4vonry2qr>
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-1-866f1965fef7@oss.qualcomm.com>
 <vbmo6qvepw5sjmtrffkdiaqulgqrhxlo3lrlzxhjz6i252efvg@uyhzdskc3jut>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vbmo6qvepw5sjmtrffkdiaqulgqrhxlo3lrlzxhjz6i252efvg@uyhzdskc3jut>
X-Authority-Analysis: v=2.4 cv=K60v3iWI c=1 sm=1 tr=0 ts=6995e1b5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=0j2gUKGghzJNiw40VA4A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: RZIrkACrqhr6yOWkoE8ICe6VrDtgc2BT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEzMyBTYWx0ZWRfX645zMSm8L7RC
 rHDz3c1qFnZaljNe4n0z4l5aU3V5FPRxcg1qF/RfKI15XMoINAyQoQ+WWbK0bwRvYJOuSr32PB4
 Cm78OHHwYfGeFYPVTP18ueh9/pEIYe2QqARIU3kmYnKAeDTP3NYebojEV3H5wO/cg2Eh3spztr5
 JYGBGyVfFGeEpFnuYlPios6WkxgWG0RzvBW97rVkrzZ9GERXfDvg7BnDHdZyNppHM4WTbNWQ+nT
 plFWkHk+V0EHVocJJq1i8js7lJwHhX+iS7GEBHHDYUQhsJU09MH7VDRnShI2BnnD7QETB+5pDo3
 +LJcNmEZuBX5YW2stttiE9ciH0JFJDVMwUe/7nybQrwA3uSNKxb2eynq0uvk2OFxokoGmaWznvK
 BKVBPgPTq8c5JkWHoB41EFy3B63j457vYEMaRpl9nHWDH8hAvNUyv9IgwT5FNF84Y+e4kSBXq8T
 LKPT28LB7sy5VvFYWUQ==
X-Proofpoint-ORIG-GUID: RZIrkACrqhr6yOWkoE8ICe6VrDtgc2BT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180133

On Wed, Feb 18, 2026 at 08:49:34AM -0600, Bjorn Andersson wrote:
> On Tue, Feb 17, 2026 at 11:20:42PM +0200, Dmitry Baryshkov wrote:
> > Since the commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds
> > on until late_initcall_sync") setting of the display clocks is partially
> > broken. For example, when on SDM845-HDK the bootloader leaves display
> > enabled, later the kernel can't set up DSI clocks, ending up with the
> > broken display, blinking blue.
> 
> This describes how the problem manifest itself. Can you please document
> why clocks are partially broken and how that relate to the GDSC state,
> and why setting GENPD_FLAG_NO_STAY_ON solves this?

Probably the best answer (for the second part of the question): I don't
know (yet).

-- 
With best wishes
Dmitry
