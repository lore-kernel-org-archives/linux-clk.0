Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67B729BD90
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 02:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628838; cv=none; b=jZWMpx38GPCZhqpBr8kgY4qiaI9eZkVW5QgUB5lxIh/+S3K57jCG5neMkSvzynpXlbwBQUzR7EuWjvLWdekPkyGZl4g6YOr7xH5hIs1hhgkaVStgaaZ6ZQXYBOB12zeE0WMyO18UCXbjQ7KNHu6FHwCQ+TLBHgvG4aIQCgZlTTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628838; c=relaxed/simple;
	bh=vPO92Ia/yLV+3oDlLavvw7vih1R9AqXGrqeb7MQfF2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVaysSi5M1LFyyju4UaMig6kxFwLxIN7Yh15RqULTz0xxX18oY6w/6U8Er89mSbpG6Dp/wJRaZlyq/AXblm5D60+mFyUyzFq78gzQameoMOSGbdRwPIrgA4WfBs2PiDX4TV5qUTC+TkV2fzmhc9qvyY+87Z/P6lscDQhw2LTCqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMy8wOos; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KI3q7bKO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMy8wOos";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KI3q7bKO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62F6ThoP2577674
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 02:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cooflrjk5WASfitMN7XwdGXE
	Z+8BtZFRRkGUiUr4HJ8=; b=TMy8wOoskUcY/01XjbFPE7gI3zE4pCn0igJcZlIs
	WtkKVbNYYdJQ4mppdWiNC4hhg8+mqmE0sDqOmQCp8H42t0hZ/WNEQh4amgxbVv5l
	sQ8rT2kbXUavwvEpIdfLYHtIjqfKkFXA89FTHQIjkHaD193azRUR4Wwcb6DLMA96
	qdlfEFbaO8MZ9H2IpG1K8HRSkcGchpvpDxQXJ1/vGvm/pK84RuWIJw5fjYRXdTJ2
	cPvb75KNjz8lWN1b4XZyCqn41sXZ61jKO85AAWnHMGwOeFW+wJYIJ9lufkOvSRck
	+dlb+vL7dVl5DC0nNSwmwEpireoWO0MDiddy+SmZxeFCDA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc3rey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 02:40:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c514077a6so54951476d6.1
        for <linux-clk@vger.kernel.org>; Sun, 15 Mar 2026 19:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773628835; x=1774233635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cooflrjk5WASfitMN7XwdGXEZ+8BtZFRRkGUiUr4HJ8=;
        b=KI3q7bKOuBoLnbC40I2/3ufloUGkWp6qEAAbAZx6RfyFl4p/krX6fujmuaU5v0/H0B
         R5GZbnRlgwZLoNdcGhvk2TV5K9TTW+0l+YE+vze13O0dqAou4ISOKv+q8TEg6H7wUf1g
         x1IO34i4g4a6WvtaGIGVNcoCPklZLLLil/TnopeZG/+reL1kngRdAfl12RCp8yICD3G6
         dlxNmWGpOxnX1fo1e9t32jWAiSIaUfJ/dP47SYOsZXXbBeotNSoieZTkfOM4TjiYoHap
         xaql/LQF9R703r74tBnfO0qa+4M5/lIzLdErh3FM+xVPDWfZWsx0Drb7k7bd6mWertqK
         yxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773628835; x=1774233635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cooflrjk5WASfitMN7XwdGXEZ+8BtZFRRkGUiUr4HJ8=;
        b=SfhllSJBeTmIcK81xEl7t9+DEd2bj4IcgJZ4TIUF1PniSo6UyZ2VFBnodBIutZi/FC
         tto0lRXh3aWYtKmwv98XOeQ98ldJaHi49+Z99TBozbb3wILY1wY2aW1c2xiuEjXI2aSa
         4nR8Rqcyz8/1JZ1pGrqhUEd3ESbwR+43k7hyTfp8amwB5mXTtUruQk9PSodTYyU4LRtd
         EZGoCXPHdGk6SwuVFxqsYF4NNOVqoyyuSC2RWiw64iiOvIydhNJgSSMXuC3K2Qoa3768
         zY6goisZmVcipQHLtxIB3tYV0MQFmiTnmHsVyQ/xnIz3KVyLWggNQbukII6NwjZYWtLW
         OrTg==
X-Forwarded-Encrypted: i=1; AJvYcCU7T4VL0DN5ZQJD0tVURP7ZloiWqI2Z9QpG+mg63Xum/eAH1NVUhYuB8Rb6a+Z99XJ1D8FZaFeT7eM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbnwXdywlYCFZCOEE1Ym4Cm7GdQf7OiWnkPcbwEz/iiCJTfoBn
	ubjXEtOgNjWDyY0/1HRNL7m7VKqP8EwkZdNM5uye5mhlR9E2eDDlqcY19f5nB77ZG5s/5ZEFYXQ
	T2zZyzMJcg45VFJCwXo/Fn1gTLGP3LqZfp44EGP78SNZgih/pQLobyOITTjsWD282cdFNKSc=
X-Gm-Gg: ATEYQzy/6sQ0Qd0qiMQe35mpJn6AgcW4dkFpX39KATSz0Xa6dlLkNZ89WxyWeEZ68Dl
	RPbHwMwEfiBnBXaa1X1oUBtz+CHCa71umEsiy8k/LPnHLfhPX7t5CjPF78aEVoYB13k698mawLr
	BPOlJpHTTcC7Iy0LndHuWjnAJ0pEsud9vICjnpYdjlpFgA+18mN5nvmYYypfFT3WmlkCvPFJFJd
	Ampgb8giZWhSIGLz3EZ94GrprYQ0ljM20KkQKJidYzXXQgJj9wJ+28dJeEBAy68VvbViENpGt/g
	thmoUqzfLf5BDhcAeTTqjbo1tzFtBPHwNk2qB8UnsT9Vzk4MquKjTyOoF4hFufR6TVil34PXDQa
	6jXIwvjfm3tG8rWqB1p+dF/4KxgJoIZzNUpl3Y0paasl8ElVOqM9y9Jzy79UxA37jC3hef7HvK0
	yU3GEhVv0ZLBF54tJ9Of2nPg8giPqfrEYb0tk=
X-Received: by 2002:a05:620a:4096:b0:8ca:4288:b158 with SMTP id af79cd13be357-8cdb5b5aef8mr1476167185a.43.1773628835407;
        Sun, 15 Mar 2026 19:40:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4096:b0:8ca:4288:b158 with SMTP id af79cd13be357-8cdb5b5aef8mr1476163585a.43.1773628834787;
        Sun, 15 Mar 2026 19:40:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366676sm3137356e87.71.2026.03.15.19.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 19:40:32 -0700 (PDT)
Date: Mon, 16 Mar 2026 04:40:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v10 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
Message-ID: <jfaaykvuueentwpyq6c7rzu7uza7daz5tyf54zobximpflcude@6uhpcdl3emjm>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-2-fdfe984fe941@linaro.org>
 <6a25af47-1593-4d2d-b72a-38a68f76ead6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a25af47-1593-4d2d-b72a-38a68f76ead6@linaro.org>
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b76da4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=fU1sBuitqkfhUO8brV4A:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: OxZWPZX0-cXaMJKpw-4Whf1S-7yCNn1X
X-Proofpoint-ORIG-GUID: OxZWPZX0-cXaMJKpw-4Whf1S-7yCNn1X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAyMCBTYWx0ZWRfX1cReddhsJGej
 0MjBumTWx6WtWlxpTfeBFa+WrvVj17SEYM8HTWrBMUXEGAJ7phcxcmqNaMYnLcPM55Pk8O7K9bE
 favueVEHcsf71dPVNMJzAvI6wfws/zFEUrVovCV6YjJ0etWsaioPb0V0itOZ2e5tBMBhOAR0P08
 AspDQvJkDr0J60k+c78eBeSQD+Fvl4Sv+9FNCtfA4IRljAFYscqFqnvI8aamKMXF+Z4+GUtI3KR
 IBiLWZ1fGxRdigXq9DtGbqni8EhhY/o8URINy4mus9FDT/vnBkF0+333Kw9Mo36/hZLk/tHhyQz
 dFIcW2lrmuLJCVHG7VePMwwq/zQf4fCfyj4antE18MgGD5TnR5tJvyTIO2HQ0YKjPm26eOp7927
 uPHP5/sJ7Zvmht1sLGnjxOmEGx+UYjkEo/hVohCyPzFLqVkxv3wqrT/cOl84TmEpIAgeJpqepWQ
 AfBghLYTCDxus6J5Pmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160020

On Mon, Mar 16, 2026 at 04:07:43AM +0200, Vladimir Zapolskiy wrote:
> On 3/16/26 03:02, Bryan O'Donoghue wrote:
> > Add optional PHY handle definitions. This will allow for supporting both
> > legacy PHY definitions as well as supporting the optional new handle based
> > approach.
> > 
> > Drop the legacy high-level 0p8 and 1p2 supplies as required, each PHY has
> > its own individual rails. The old binding is still valid but with
> > individual nodes we define the rails in the CSIPHY sub-nodes.
> 
> The new proposed CSIPHY device tree nodes should be outside of CAMSS
> device tree node.

Why?

> 
> > 
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >   .../bindings/media/qcom,x1e80100-camss.yaml        | 33 ++++++++++++++++++++--
> >   1 file changed, 31 insertions(+), 2 deletions(-)
> > 
-- 
With best wishes
Dmitry
