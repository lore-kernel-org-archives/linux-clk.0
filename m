Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B0535BDC9
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 16:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418169; cv=none; b=J3nZPEOglundDM2J56G9o5S8hq06gHvq3o/d7eqxoArboHtfqfzu6ErD//T6KzzJ90ovv7DL3sr1cWunZNq5DyXmpyVvVieDpBeaHYWn2f/kZRbff4CjOR6qXvPfnIPniIbB0DxyQujuCgiMuY7JMHfqzlU6w+a/H4tJiRovzco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418169; c=relaxed/simple;
	bh=iihJ6G2glai3LfV6OsWXxGEnrOYpm8RkkrKTZjXasTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWMvAVz2nUpRYipxTerLERUjnajliNTeP0XscOgxZoScLFr5qILkc9UtYI77yty0DIoqIcs4YY+32AOsgKH2gAs5FiuWpM+dIrUgm9kSpysSpo2rKLEjUzhjYziOUJPWlHVg71wt3IcxbwNtA4ToQjwTiiqc/xIkIeU7xtuHrQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCUNzVw9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HrvVaTCU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCUNzVw9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HrvVaTCU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8v978481510
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 16:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8I4q9a3KfKyDHzN1MBIbMh4h
	6MhvhvFPqz3BvEDRvwE=; b=mCUNzVw9tl64ghspQuEG5hGE6/wORJiVsaDCBYmN
	hk+rSn59ITg+K52ZrXbGM9D1YZNjtFci/kLpXBmVKzSVWhO4mnEhIpNX7x5yiNGs
	dQbXGwfd62OErytxZT/RCfNSHRjrId95HPeh3K1cimceOEZviukM4OWRxNhRelWq
	HpmiYy+wrYcQY8c3x3CDy80PAxTeZLzIlLY2LnqjbZI1tGg2AmwKSg8zN7vHQduT
	uAWkaILJXupic2T3uPIJUaJSyfw6+r1hJbyNHdWQkWBJJ7u7kl2VY8X4Be58NaxE
	e188Ff37GepJ6O+Y7mXZ9E6T9XJflviiqC3RoZ1X3pnaUw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7sg1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 16:09:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd858e8709so2406449385a.3
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 09:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773418167; x=1774022967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8I4q9a3KfKyDHzN1MBIbMh4h6MhvhvFPqz3BvEDRvwE=;
        b=HrvVaTCUc5WOFBQi2grTnIar19tDIGF/OQ4KQ4+zKEzcAOoS6D9U2x8P1l58ThmQ5w
         a7QIP2F0zNydmwXXCokegDjmzlfrxYW+8I6mT6gT/u99cMWKu9bCDLclznx0AoNG11J8
         VSeFbISTGScvZjBOgi/cFOHCoMC5+8hHjvu2Kp2ukWXZSKsKvJm4auz4v+xDXZnEf7N2
         zxanR7X5S20kmhHfWReuvPcFe109N3HmT1mRYyCTWQI9xJCQDPXKw9hxlgphRrGnIlnc
         2WQud4BTNVRfYFj+zwScK2UmaXHakneOZnm3zR1LQ43a9+1jCwBrmPNBOXhrCmBuNthA
         mQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773418167; x=1774022967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8I4q9a3KfKyDHzN1MBIbMh4h6MhvhvFPqz3BvEDRvwE=;
        b=hMsrB0xeeyvopY8ibFNKGexa8CubjvBZjOr5W6kBDwt1OFg2f2RD7g8mRmgwkRqzHT
         lKDvJcDAkkpb9wDWQvl2RXoiwaxl0gdGrPUihWBTFqa0rzOzKHcvi7iGspU+KBZuNgtn
         YMs8G3N3mOLKRl0uqlIdbOq7QJQgPTqLokp01fY1LZBzmJVimtZI58zJfVtZKtOdozcC
         ClshQ315WCUhDjiibwgSce3TBiTkahVt/oCcXFTzCPORs1DEtMEPMscRSGzJ4XwIrEEh
         i9hUNst1H0PqUs8qNLGOVPXx5/Plwcrf0NlN7CT4RCN66XyzD62bUoAQKRosn+OzSbLi
         p3zA==
X-Forwarded-Encrypted: i=1; AJvYcCXR3lKOZCKYSUReoB/6i8ehPoeeogxsVHSghZ8m17voQ07RqrF7JJSZFS4E+g03ovrsmPWVjLctcb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9uSylDmLkAE6PJiEHyqsko8IM4YqCyw0E7+Bx8uIgBtMUVIF9
	2bIuHwZfwzmNMepAa+VVdNOyghu+SLZPe0BpCAwUiybD5oYCEIY1MXLYfBag59Z5tjJGBEXXFwB
	yHANFzndR4kee7ns1KvK3TwGui5BADT5Hv7sDoCGTDbdT+Sn2VU7hMDHNoC4G3Fc=
X-Gm-Gg: ATEYQzzAs+Cq86sI26TSKhax78UQ1bIj4z8pcUiaCfOjebNSkIjQ0yF++yQ27LmsV2f
	Nv9LpvgUsQKwUoNT9KwjpSQ1WMK9ZdA5r9wf8gbCZGOR17hFL6+kO6mC3IclTJPmF6SrbAkAHFN
	+LWe1uqp0sbNondHXdYtlup28EV9Qj8e2zJ2At+8d4i5srsh+4jUVJL12nLdoU8nsJS62XfA69a
	S1IrF5P9eykSdsQNDQJOh6T4r57TOh78R12idwM3HsjNOLWJR9l8/wiL3JNTVWnzRBJlrcKJGDg
	0qXxlTNU6rRbo1X5XC2q8Nqg4N9j38XOMqcOyzOh6C2d3rYlTTvv8xiblx/6vefbQGqJoqLjfRt
	YpinFc0NS/mFGtmSJhL0Iif31cyhTvTCCrDorM8Jfspn9Ci2PLZW2Q2cMJ0ZTU/ejLlrZ0A8f3f
	TZXafMldz96xkBSIPNKPsP10lLCdrjyw6nnUY=
X-Received: by 2002:a05:620a:4081:b0:8cd:79f2:dc48 with SMTP id af79cd13be357-8cdb5a9751bmr565298285a.28.1773418166798;
        Fri, 13 Mar 2026 09:09:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4081:b0:8cd:79f2:dc48 with SMTP id af79cd13be357-8cdb5a9751bmr565292485a.28.1773418166254;
        Fri, 13 Mar 2026 09:09:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366682sm1602254e87.72.2026.03.13.09.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:09:25 -0700 (PDT)
Date: Fri, 13 Mar 2026 18:09:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: videocc-sm8350: use depend on instead of
 select
Message-ID: <hbb6v54npcet2n4tpv3fguofxmco6k5bpji2ai4fubu4wczhwb@umo7x25c4z4v>
References: <20260313111018.130068-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313111018.130068-1-mitltlatltl@gmail.com>
X-Proofpoint-ORIG-GUID: 9fVLMZ1WhrcEWH38_Raz9Tdv0Anidgh-
X-Proofpoint-GUID: 9fVLMZ1WhrcEWH38_Raz9Tdv0Anidgh-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyOSBTYWx0ZWRfX4pbYBzvgyMkl
 OGnIeC7oG3dJS1v2ZQ03sDJ1daLxGpZrevP5bRLJWZZEtRGrsT3cqg2hcH3DBPWp/PTZX7LHznm
 YKuQzZ5rrLxWX+HD5BiG/QonEe/1W8Z8ex1EYr7uzybOyzwuj8SFnMgk3omxMg97Fev0iLPFbB2
 bqxENnfNv7LJLiMQ1c38AuDrd7AsVJ2JgoeeZRDVCO/ekJ2YzU979d8v8+1DG5do2qAOmk/eS+q
 ud6sHoUSyc4pP7vi9wCFSBCI3iKz9d4dOzouJEmV0wTJ8CkVEvSAKzxpghmb3KvjKOeBE4N81RT
 nUZjbEWYPI4wa6WYcBr9GHxDoNoS87ArMYlYfUxT18N3kYGvJ3djAfzvrFX5rU+OCVSGgnV2wD0
 wVo2lA8E9d/wbh/ugpSvoN1Dg/ZTVFBCcoquC9dl1/EpkuTIdB3kd9NT/GV3MYUbjFHvNAJdsxq
 yAvWE5/2TDVLwrKbuTQ==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b436b7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=waaz1P1htruZV5NjjJsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130129

On Fri, Mar 13, 2026 at 07:10:18PM +0800, Pengyu Luo wrote:
> Both sm8350 and sc8280xp use this, on sc8280xp, this would select
> gcc-sm8350, we don't neet it on sc8280xp. use depend on to fix it.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/clk/qcom/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
