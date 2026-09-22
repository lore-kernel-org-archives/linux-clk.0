Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EB049E5CE
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 20:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109681; cv=none; b=aKZ/KOygpdEHMG+Ye0jJ4xmWbdyQQhT1NxqkRs+9p/Uy45Z2tGvEq36TSGMbH4BGLakl5M/tBE+NUBvbXM2nHPaiHfc2CbRBLXkoLl7h1hww+yTITxFqHVQe2oyh+q+WsvfGljWF/KkqnqLj/76Dy19eBheZezuKF9p/xDJ2NuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109681; c=relaxed/simple;
	bh=Was9xrJcKA0i5gWxWGN8G4b+EGFRxvYGC6c1tInqrrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nC1Ps4gJnROPI1RhC9qSdbebJDeiSAmgqFDbjoCh+ey5DT6E8P6oGGuIMNUn+bIsI7aSiI0+0ohPnfJ+E20iQxNpI74k5gRei43WdRTKKBeAfXfOByuZwawgzxdvmd7oohA8X6CMrtNMg7+luswFImMeqh2EZZT8QOYpJEHw8a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JE2AiTm6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f8UbU0rG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JE2AiTm6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f8UbU0rG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJBkCa3897620
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 20:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kpSBu9jvqWp5KjJaZ47d6NVO
	S4pKiq3srWWOoTSWhdc=; b=JE2AiTm624Nz2B/YsNFX2W7LqpTQpX9Yh/3jJjfZ
	0CrqXl912W5uaWLr29JAO/zJsUKnuF4DQbqWjcWgv3kwUk7Us4iU4pFJdoomeNKO
	zd2LWkzp+i06V0/OumiOHxlYhUYcMYsYWqf9BeNk70yI+U0mEQSBtq9iLK8CzsGF
	jEs87pMVdRmTqRDCWqbAR1esY7Uf7NZQnXi0jZNE6u95J1Jact+xm9LjzP0SQE4t
	XWJ+dZ9hL3ciNsOtHJm+lrqtZpMXTKndWRIAJtmEFRFwGhJwhbMLYEY+N2AVJRaJ
	pGXWmLJ450mccGRVuQtYwf/Llx7bLwV9hBfqixEDxJbSiQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma0f7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 20:40:59 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fb9f59781so271038137.1
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 13:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790109659; x=1790714459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kpSBu9jvqWp5KjJaZ47d6NVOS4pKiq3srWWOoTSWhdc=;
        b=f8UbU0rGAfened+Vhx9NFgFGtPe2KJ3E87RmiVCE/l5zN3Skca1vsoN1SmOt7twzn3
         1Nc3truS9Lz3tMu7NcVKat9Uij8TdVb/ShQtOrkk1q82aiZtXeZKmSr3SDCClR2qWVEG
         33SPZCjKQV4DvqvgGebuzmM3hUOAkGeYlrGZ5IRPHcQHsRXIqwMyXnXWUoYGJnPDx1LV
         qw7h/cRsLd3YkIBedzb8W4+Ag4SLZpsMjx6FqQO1Lg8lbXSNBAZMwDSc1afLApYCTGzR
         ij5sNJ0iJLhuWtWWzXrg2QXab1B0yyioohxFXpWuppllbx99sg+c9ROayhoa+KzSIfEZ
         P9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109659; x=1790714459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpSBu9jvqWp5KjJaZ47d6NVOS4pKiq3srWWOoTSWhdc=;
        b=XYXi/AryTQF91vzgpYltAFsqC5hpBZAfO5kqN+HnqxpE41meUExHD9qxaUGbfKXsLV
         IkkIA/gUJrb3T9NA4YjboX9EDsZlYg+jiYmry++web7gwB9svabLE5q8IFjri21mJXKb
         oeC2+oADEktHvBMiiVJbrRZrWFG1gD2sxWuanor8G4+Wqlu6qHsOccx3lEmavO4PJmIw
         pNlS7guZiiijRJB99SQ//mT4KcPiOb3L/wZVe8s47QaVE2lD5L0tHCcB1XsmQ+5yfmqY
         VzLn45NuyjoAoj1bez3V4G+g3+g84McD+dzdMDSelja4fLgDu6XqAsT62ZRl39cQ8WwZ
         fXbg==
X-Forwarded-Encrypted: i=1; AKwUvByqSZzWtCG53K9Rp6IPiSYPym6MZvAI0jPsfZObzLor6cy6CGrejj+mRVeI4JCPxj/Oe/vOSDvH600=@vger.kernel.org
X-Gm-Message-State: AFuF++lXKhRKb8MU1DCRTEGN+PSUGsPR6smccF1o6LnR9apvQT2Ebbm6
	CcLsAKHToIVLYSExQwMn9//ObtxW2EVcvVBRIFbHSIzv3CVAKnmbNVfRU6y7Tn2W+5rlmeDz49g
	hUoLrjA+ve74Bo9sO/RLqvEuG/FitOCoIR0rc2WX2AeZgj6f9e8IpMTNCCPod66o=
X-Gm-Gg: AYBFou0lGVYXU+qUAaYt193Q2hGwFLCLkrAIk8NW0J1XlLHfBh4fCYImw1TXY7Mn2io
	BAnefWnMx18QCrt0JU/lu/fnrRswKXd1EzTCOhNRPKDpoS1iqS4difWMPf87+zDnmckWWclxeBR
	mq4y68VMvGcNpV+7xatFtfSEnkVXxLSLC+IJ2DcxPliE6pLdJrmxTduP62hsVBZfdH2Q0jGZz+d
	YE/vsdTubCObLywVeRRkrUDMHyKLBgJsKAG5UbQsGmw7+dxvatrfNCLQqtwdi+LOQPGR52hytVl
	QieFDSaiw8+1K1GeWXRSSIYX/YlMVYRntq/gcJddoAfHsoQ3yNHSTR/EpdXVz/ANOHLDUQYwFvO
	0xcgdq5BKvg1+RQ==
X-Received: by 2002:a05:6102:6896:b0:7a1:f7d2:e82a with SMTP id ada2fe7eead31-7ac1e65c1c3mr771098137.35.1790109658748;
        Tue, 22 Sep 2026 13:40:58 -0700 (PDT)
X-Received: by 2002:a05:6102:6896:b0:7a1:f7d2:e82a with SMTP id ada2fe7eead31-7ac1e65c1c3mr771060137.35.1790109658190;
        Tue, 22 Sep 2026 13:40:58 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1e045dsm18896285e9.11.2026.09.22.13.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:40:57 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:40:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: Add lpass audio clock controller driver
 for Glymur
Message-ID: <acfvnzzcwzqq2pcchzxkrnesdcpqthmucax4elht2xzw6kd767@yqium6n6lb3r>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260922184425.56114-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922184425.56114-4-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: hlxv4MjrD3dq_TifH1Tin_WOwCB80GIu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfX3B3pAlviGs55
 b+SM5N+S+o9hFFW+WwvXPh/V/P2k3ajmWyhLwYobu+3AXVfDqC1t2ueFbNyzOO4M5tqFWcPvCAe
 DWT/60MsH1k/tsLTcMtfUgmGH0mu8Og=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfX/hW1wHU9mLME
 Vkp7XS3j3xccHW8Dixhy0PzjyAh2B6lCOTOl6TTigQp1d1I6IpBtI9K7wRkjGmP7wXef5AEmdmw
 W8t4GX3pnaO7Ary3fkLB5Ah/asVFpQBYbLNXlnK+jAEYm5fOagsWngs1JbG5r0jtCioEAsJ6vi3
 xPRebzz+KRfHvuYyktLYqI+GN0nxgKcdvYN69pSYuGINxfsvVzJ6ceno98qR8qlaI06S3zvwUoH
 YF7Mt6jqvbHs3xmM2ytqy0WYOy/WhEb+ByzpRqp5dJiPJF2AJEodEw26RxBzexxXIPxz1bDfOS8
 5PeGO4uqP/I1aAs8k0ud1+Q/rcGdCbO7GjjVq8ZU8K6EiJ1qyD0OH0680ubp2PVwObgfA/dr+Uq
 bupX9R0e57AWTSstQkP6A7Fg8hz9m+KgQJCgPu7kg8dmXrw+sM2WZE3G3kDC6HWb5JZmqPCqhHY
 ED41g6wqBimar0pHL1g==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab2e7db cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6XYEiC8ceDmu1LDSX3kA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: hlxv4MjrD3dq_TifH1Tin_WOwCB80GIu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220295

On 26-09-22 19:44:24, Srinivas Kandagatla wrote:
> Add support for the lpass audio clock controller found on Glymur based
> devices. This would allow lpass peripheral loader drivers to control the
> clocks and bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
