Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A572D9EC8
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771315058; cv=none; b=akvagkdQ+Am9smGLt8eLdCVivooxGZl/Ri2HmaHWvr2YpF6P0pH0SLUlHlVv8AZxWddzAYZfuF6s/GEby46JoZrjf+zN9lxG1cYsFk/rR0LhU7hGqMg7rlBcFmbAb5k/SIgy7/X0FCLdS1tZCxA8pj3Q6EQmSKXM1Fd9UhE1ufY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771315058; c=relaxed/simple;
	bh=aSA0eXGHu5r3sIqWw29YfnvPs7Z+W9VI0QX28jCOCa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/ne0klIz9fuFYIcK5+5UjbKhZYGLHlin8HAQxYVIidInYr/L8rkWxQ+6C4rdq6GC/23TnVtUjix1Z1y4RnPP5RZWvW8yaTk2wnN5TL/3TMmRxElkkmKdyayUIvTF1hROLFjZKcTuU3BCNPLWT9/vX81/Aa22eQXgMayVG5KXtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FTv7OwRv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZT/VPEAq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FTv7OwRv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZT/VPEAq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GFkWHs982450
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OfFn9J2O36xLkkoFUh/wBFcA
	u8l3dtrlwSn+kDOeeDs=; b=FTv7OwRv8JOGffb9M4nXAP360nKOUl2lqjZJzavC
	d+esdMtsimF4b1Wj/SU0P04yRTgnU8sWdqV88A0p1cPZc20l0fpH+wX8m1nQuGWL
	Ma/YX/FWLGACQqbh/vrcKUW/c6mbTL7Kue1f9ppFdd119uTEWp8MvXCWZoHEnAJP
	jsN6qLVg81G4eO8vzPem+x2upqTnejDsCox7C+W+bVVqLvFkxOtY3PkcUzSWGPRV
	UehhcwWLNvlfrisz580JM657nXZlaSyZXurugXwfqDAIJ3OtLu6ic6wXcLcCV5td
	ILq9xAR1l2dkRj2wIpHEvQi+YqLljFSeag+FS5iLINSofg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662skk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:57:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb37db8b79so4547622885a.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 23:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771315056; x=1771919856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OfFn9J2O36xLkkoFUh/wBFcAu8l3dtrlwSn+kDOeeDs=;
        b=ZT/VPEAqbrOW6nowqsP2rnlR4CW+YwLxqNr/i5JoLddHH56SCGlrGlKZP3eoEVUliw
         JhLRQs5SAM8BLgtiBFBY6gWrvc8i3B7agIq51e7XRLG4j1NP5J+2hj4rjPT8t0lvnteQ
         DwlKZRkZu51YIup/6N3H6EsSS3iZQbafyMMUT4g8Cizv75nGegYmarmIGw62b6GfMrC8
         wKUV4xS6+Hz4tMnptRrxoogoqjdAu7qZ5tVSy0CQmg9CnS9rH0xu5Oceeo20IlfNxEXf
         sJTo7ZeAG7f+0IbmrYXYkW9I4oifQUQCTz//B8rIWCjBJYKPkZyYEJhqRu6DwBYDn4no
         7d4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771315056; x=1771919856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfFn9J2O36xLkkoFUh/wBFcAu8l3dtrlwSn+kDOeeDs=;
        b=mH8D67b1isj8FOKeYe2vRxRSy8jvJY8EGf9PeYivRkMdWigSLFR+ZDwG/mruK7VyZd
         //1/AXysmOKO3n9aKCxbN1A3FlfRL72rmfZ87+s7W7akqnqU4RFC4IoXZqH+f4hgLJzU
         pE1mxiCBM0AlgxALgmxYhrnE87Y0BC7YUQ2BVhJM6nkzd1ugcJ0gHHuC09aWAOdtcjEA
         fEicd249p4Qlpo4HQ9C8zxpwtW56PgtjTTdVJXLJIrYnA7pu9YPtD+oI4Hzh7LggD7nb
         Wy3+zHsnaIUeILUzRm3nJSDNfxip+hsI0UwZWSbFmOAxIwJofdJXEKbezHBy7TbdrMMY
         KuaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpqTDLD/VKwNIgNekB0riVRyrJsSOUkF/j0IRS5vZ++SzaaLv79SnOaNdYL0LWUccUWaZ3+yKUeow=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP+ZhO1JAecvnhWMVNkOtgOYBOtgX2+PC/wGRqs82L+K83ZwaN
	FI90tQTEjhDjSD8f+Ju4KVo66YzXa/irxLK6ktttE+KmYzKghLh/29QUWqRSy7EzWJ1Wnh7ErZu
	6soBh8pA4/+P0gzUo4QLyhxO4RkZVM/u1Y5CbuJNnE74UV8t1XHL51lJgJRF7HS4=
X-Gm-Gg: AZuq6aI7AHsqEBcWb3zGjrMzRpUWGW4cCDBvWH3VL2IjjOKwRU5TIiqHCQ3UepA+73B
	qwcaZV5AFJ+vsQyQwS17DEfqT+Up4Qw1GMcnPbgcu1oMVk00E8Ws2uqEXvr1ZSw+AxnqpJQgd+e
	Yz3JYKjm70WJWYH7sqYvCuEAxTlXFgE3zTUlhgo6Y2X9W9s7iI0IBexOPyJVwCb9HVUNc5cWosM
	XivXlL3Iz4wWb5TqZq+jrr0xzteyUjms84e21JnqSoFN45CAbR0sASw/wwbAjEZc/y0YBiJL4Tn
	PRwWd0afLm2pcifs0S4F3JuuPeogLK5xw8+4KcjUIel0PbsNk9nzNetofkRnU/9E0V6NDzP2+tP
	ifJu2uKE4o8xSkMmPQfGlyUyPWKRvomsXPcPu
X-Received: by 2002:a05:620a:4107:b0:8c7:1ade:29a8 with SMTP id af79cd13be357-8cb4bf954c1mr1327363285a.23.1771315055800;
        Mon, 16 Feb 2026 23:57:35 -0800 (PST)
X-Received: by 2002:a05:620a:4107:b0:8c7:1ade:29a8 with SMTP id af79cd13be357-8cb4bf954c1mr1327360885a.23.1771315055268;
        Mon, 16 Feb 2026 23:57:35 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6b563sm32439944f8f.12.2026.02.16.23.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:57:34 -0800 (PST)
Date: Tue, 17 Feb 2026 09:57:33 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Message-ID: <cqx6t5tcshcqyof4aaeawa7gyocaokzyqjmyxgxis7xsfc4wwg@jeggol3ifwu7>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
 <20260216-eliza-clocks-v3-5-8afc5a7e3a98@oss.qualcomm.com>
 <0f3fec98-4d58-4197-82e4-41480066d42b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f3fec98-4d58-4197-82e4-41480066d42b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2NSBTYWx0ZWRfX2tJBL1l2DFtl
 snnM11PA/yJ8UR9UE5OxVXsx1nqCwYHGYPwdEaAWx6TiSPYfnPKpUKSUOlOC1kDJknogHArTsXq
 56vVGaj2xtk1pDlHGQKuJei6G7IMTcIacMHUylEhidP1HrQGqO6nvb8xha796vQiYBK6dzQlN6Z
 obU4I0NVPkMDBAG1sjNb8oaWUXfBD99VuWmCuHxDyAE53cgZtCkIF+ktvn/ZacYnFWgrUmYGX6j
 sOyzcvJz245B/W36C9jqJ9YuRNQDiugyMQT3kuxWld2UikqUrzvWXRLoTMDL56/9qMRfJIi7ZNU
 cb9zb7Cn3WzE55W/PbVaEmLBTAkdbRD73NrXKnGJlGdGNKjSKjny7PmLWU2m8HXFAFXeJhRlSAZ
 79iih1cZYaw8YvY+QUjbN3qNOHXQ/xBMYF9tsmb9u/m0GQkjgKLn0N8YtFRWbYUlaxzC8gbkwXu
 2Lva+XiCsX36aqWWoow==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=69941f70 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=UaMvVmrrPUi0RUkZ2zcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ruK9lpTxWPQ54e_iuOF-gd2hgl5hPPhE
X-Proofpoint-ORIG-GUID: ruK9lpTxWPQ54e_iuOF-gd2hgl5hPPhE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170065

On 26-02-16 16:57:24, Konrad Dybcio wrote:
> On 2/16/26 2:43 PM, Abel Vesa wrote:
> > From: Taniya Das <taniya.das@oss.qualcomm.com>
> > 
> > Add support for Global clock controller for Eliza Qualcomm SoC.
> > 
> > Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> Do we need force_mem_on on UFS clocks?

Not sure yet as UFS isn't up.
