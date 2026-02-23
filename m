Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331E31E9B1A
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 10:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771843709; cv=none; b=g12yozYQcjhu/oJSjbVytLFbHOVSSTHdCRVvcUUhZxZccRy5eQPztfeYQlA7vZ4geXRa+iUNczYqixyIGbsU8qerzwFynRCDy/EnpeWtaAzsJAM/uHrsxk1fFzoXX7JTJBYvKLzp+45PDL28242oH6jvu/ysdIiPe0uYpvxnaKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771843709; c=relaxed/simple;
	bh=mF/dXOjuw4FuTjb/dEtJtfFCgvxjqU1xRfy42yJtOsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnAJSZFCBj6PlXkCgzD4NG/kSP65S1RF53O5JXBbPgRMLGMgNjJ/0sTbRgExQpPgg2tHXTzeo3mdVbm34UZ749/0UJ9DvOzDMyEmPTG6vVa7PvkVcg39ugETh7VGCxQriTdaXtpmXLrdXYBgxbFa7puRhcKPnyvhNbb1sFNfvBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDXVW/J0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F+qOLpps; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDXVW/J0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F+qOLpps"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N82MEp1323538
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 10:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F8poiyW8aZarGrmzuuKO1O+G
	LLPadEE1zSP4gJ5/zhI=; b=nDXVW/J0eJI0JSaZ5gjo+ZZUr97l/mDPLxxNWwpK
	zADaMz+S/POfyEi2Llze+c3f0avqNfsny/WhbcToFbSJJvcV1x2f4iFmUXwsiGlM
	F8DPmonnIjCGywIvTJ+HVXbSOislMzx+FI+kY/6WtUBwMMSNIWgVGRVi4RRumpwq
	JY0MaRj3qKCtxGbdCwxhiU3pHBVPNP1KQfRxH0bbCaruOHPl8Dpc6sXfc0ciM/9I
	KRmH6TPuy9iJCgmq92ZqwRIqJjdllghU/+hCta6EY0GNhX2Tro7vXJXay39167yf
	JXx3zjoYXRtCSDt6CR5N7dh5sn6jr7r8/xdHBDWxLdtpiA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wyvdtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 10:48:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb0595def4so5340373585a.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 02:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771843705; x=1772448505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F8poiyW8aZarGrmzuuKO1O+GLLPadEE1zSP4gJ5/zhI=;
        b=F+qOLppsmSmbF9+F5jPO/bG69yIxZvRf/5A0c83EEmZGvAsm91/A+/qjh1HzKYhRKY
         awWlJsZjvjiph0m2ik8PbQgbHnrVsINU9m6tAWhqZqN4IKlAqE4qoddhdIa204wujCFG
         x6JFDcayzH2G9C3/4cOhaYtQ5+eQ44O2xXMlTTJ43YbAFKFDZdUIQ+rvUN2S4zVyWL4v
         WZhOra+GhQmAloA6WELEPzZB9YRNtdZQN+1c6F42hcMSXtTRwzEIlC4iPbWC1RfH/53m
         AMbQEEykXppsh8/RK1NBEA4kkKNmYj1Oise/gaSIoIzznn19EZ0CG6hBVOjoNG+n+FE8
         ZYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771843705; x=1772448505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8poiyW8aZarGrmzuuKO1O+GLLPadEE1zSP4gJ5/zhI=;
        b=j/w2OGXfjEZJi9hxQrAlpUHzlkNKPzPWIxzWwrIY8eO2S34fuLRMx8NZHZ6bxx/SLm
         7Dxip3niKktV45uM6gjIH5f/fsOQvqgFHy7FFogamWKrGU75+e/BvHI+xCn+/zu0ZDYE
         TSEINGbKQ4S0J0AZO8A9GdpNuMKrYa/2T8IyteSFvl5+Y/a2oApVPqt4cRHscrGV6iV0
         TXkUKzf1i9LM32zlbkCypXOZuru7Sq8tqyUQ7V2aoz6bDx3P+Z7N4TsfTm2l7fv3U6EB
         N03Bm5w2Qzxw+NZzGIZaK+GPG/37EJZK1alnzwAgRWu7qob++jf2ep+sOlwWfTh1vVKb
         yzsw==
X-Forwarded-Encrypted: i=1; AJvYcCVuKNfbRbVIY2orsblCDuuXHoh+nWhQxr3OTTCLnkZTb0z7Y9/gzgnnziE1Gjfdp7NxDxnrsQViyaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDbBpUNigImUCTVckYvCkWepbpFP049ZLpExdOkw7eMNZyFblx
	2lqSpkS9yRnO85av3LFoKaw9HOfaHGDqoAG+OCep4e6uXO9+TdD4cJFRIQ7Ov9au53CWArGP5Fh
	bblUnFOrjgxRUzU4ZS+TsITg3GZiuXxNsYN0Seb2Tx+FqyE7u+6MkAwjvU+AKbHE=
X-Gm-Gg: AZuq6aIoG7MOZzPu8Bw1paXq4vlu3lSyx4zzanQ+RKDZRSmMhQZyHVNddQ9D06Wp74r
	udaF5i4bbNcYVQnXxZ2JUD8TzERU3cAfHV9mZrApU88bZU7VYDXQzzBXCmJG7BqLGdF/6siErYr
	TRIwwtJwEgDuhCGef/T0WjgtsT5eCNEzZDGS8SYtWXZajyQcWK84/ITuBSZwQ+WMiQ+AzdeUy+8
	p45Hi7L6eRFDAeb6zMnzGYGnnz3gvDF2isfdvAijYg35Oc8f+Of8k3TEZ86k5XaZOTQyOnO9Eru
	8Ld3oOreruUgkO2fDQNUiaR1XbqpIw+4Nvb3P7mDX06gEmx+jtu/mZ+JDK2FFkm66TDOiUd/NCM
	p48W32o4ACDCl3xc/jAJ23DEsV2ZC52mfmQ12
X-Received: by 2002:a05:620a:4484:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb7be731d4mr1621442185a.15.1771843705334;
        Mon, 23 Feb 2026 02:48:25 -0800 (PST)
X-Received: by 2002:a05:620a:4484:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb7be731d4mr1621440785a.15.1771843704773;
        Mon, 23 Feb 2026 02:48:24 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31f9475sm238175235e9.14.2026.02.23.02.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 02:48:24 -0800 (PST)
Date: Mon, 23 Feb 2026 12:48:22 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/6] clk: qcom: Add support for Global clock
 controller on Eliza
Message-ID: <abvtvyk7hsf5idtja5f5zxfnxvk3fkshnjmm65u4l5hpopw3dw@dlhdgxwufmyv>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
 <20260216-eliza-clocks-v3-5-8afc5a7e3a98@oss.qualcomm.com>
 <d6392cb9-9ab2-4743-a13f-7432ec03762c@oss.qualcomm.com>
 <iepxnbk7h6yti7biozcgw4uq6l6fmtaxrgxbt2tmcjxf5x2lep@expe5bgt3oin>
 <9933eb31-b77a-4ae8-b52f-c30999e99232@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9933eb31-b77a-4ae8-b52f-c30999e99232@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA5MyBTYWx0ZWRfXxFWir9++Pf5d
 ZxS6LWEtA0F1x2tv4virYEqiUSaQkPii8tAcJx0zunGJZqR0Owp/Ogzgq82CXzwzMkp+xmD+ioi
 yuEisKctCx1A8XLUt0DaV91a9k+42crZ0ZgpSXRl86lJ3WAw65SLU/mtAcL5y2Bk+CJyjm9OjaZ
 Lc3fb6Vl/GRNDL4e0iwF1EbYOy7vgvseCZ8tAqCLG0ZhdIVwYtMCgSDXHpIB/kcIG1gvSNisGHL
 tMp3MMLhm8udV+mfJWf7kD62DJP1Jh4uvz8trUtP7CxxT0+uw7co87JvGxTkRdAjod+vTCNedNM
 VD0dF3Xa3PYo/dDLlmlhrlbjocC8F0rpl3IelQeQiXfZiGoXvzEh8OtB2z0qysU6kW106RRAh9h
 8ykO9QEnSA+EiX+qXf209w04bS2Rit0GShpR+Xi7LNkgsucTnMkt3D2mraeB30Uho4PnEs+z+wz
 Yy8yFNGsyGYreZ6OQ8w==
X-Authority-Analysis: v=2.4 cv=UO/Q3Sfy c=1 sm=1 tr=0 ts=699c307a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZpqP6ph_56nX7r04S6wA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: htdtcFmOk_dG0-bl1xSfuEUtumrKrfPt
X-Proofpoint-ORIG-GUID: htdtcFmOk_dG0-bl1xSfuEUtumrKrfPt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230093

On 26-02-17 11:15:25, Konrad Dybcio wrote:
> On 2/17/26 8:58 AM, Abel Vesa wrote:
> > On 26-02-16 16:38:15, Konrad Dybcio wrote:
> >> On 2/16/26 2:43 PM, Abel Vesa wrote:
> >>> From: Taniya Das <taniya.das@oss.qualcomm.com>
> >>>
> >>> Add support for Global clock controller for Eliza Qualcomm SoC.
> >>>
> >>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>
> >>> +static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
> >>
> >> This and a number of others should be struct clk_regmap_phy_mux instead,
> >> cross-check with kaanapali and remember to drop the then-unused parentmaps
> > 
> > Oups, missed this in v4. Will fix in v5.
> > 
> >>
> >> [...]
> >>
> >>> +	[GCC_CAMERA_HF_CLK_EN_SLP_STG] = { 0x26018, 1 },
> >>> +	[GCC_CAMERA_SF_CLK_EN_SLP_STG] = { 0x26028, 1 },
> >>> +	[GCC_CAMERA_HF_CLK_EN_SEL_SLP_STG] = { 0x26018, 2 },
> >>> +	[GCC_CAMERA_SF_CLK_EN_SEL_SLP_STG] = { 0x26028, 2 },
> >>
> >> So SEL_SLP_STG=0x1 allows setting SLP_STG to =0x1 to assert the ARES,
> >> otherwise if SEL_SLP_STG=0x0, it's controlled by the HW state machine
> >>
> >> I don't think modelling the prior one as a reset is valid, but I don't
> >> know what considerations we need to take wrt dis/allowing hw control
> >> here and what the consumer expectations are.
> >>
> >> Taniya, would you know?
> 
> I see you've already sent a v5, but I'd like to see the above resolved..
> 
> Adding more context, bits 1 and 2 control the gating of the SLP_STG
> *clock*, whereas bits 4 and 5 control the reset.. I think if we don't have
> an immediate need for these, we may temporarily drop them as we try and
> figure out a way forward to avoid adding fake ABI

Will send v5 (you were refering to v4) with these dropped.

Taniya, can you explain why these were added in the first place ?

> 
> Konrad
