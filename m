Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAF43D75D3
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 11:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780054397; cv=none; b=G5uoZGZ5APvLVJ2W74cYKKaXrgOhbBgdz6EH2E3RVP67ej9tIIpT7e1F4rQiuN7e7/Ta3p4wKMe2pjsQqvUIij4tIiWN3dCZRd9rrg+vTl9aCfFD+pxvR+LLZaYCGlcWzaMeoP+AOyWuPw3ZjIhQPBBOXuj8AnG+0gYsb0B7sSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780054397; c=relaxed/simple;
	bh=tk/ESQWS+XA0G3eL/z1s7DjariWy4PtM1reR0QtNh74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSTcGIJDDmp8clpxNiP9mEtHASrFwrK/mKfNHaGEDpSn2KRO+YF+UIF04+fextZQYDm/bOsFQOkxYeZKfBNE/ReQesH1D6Pb07iPthP4yD2zopowpYPnFcB+a8EnNYQIDAEg8ZUFq0VqRiJMK5Tndty52HPTzphnM7SY1nVGoc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LizHpr71; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jL5DzQsd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LizHpr71";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jL5DzQsd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T739Lu1829458
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 11:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kcwCFtKnzv3LShfYkyp0eS23
	qFCvWy1MIYWSH6XRLXo=; b=LizHpr71MNelzjU50M2oTILZa3oluiEqrGNOIJaZ
	jFvUim2QVC8TfqbCb2p5wI/pbu6M28cfJuBaRFUeEuYM55tDiksGVKcO/8O4hZlm
	eMMAt6Hj9H6vC7Adi1/10gZ7XKm3HyhxPbsZmaY9GLDQGyxFCsJ+TZbQIIfBR88u
	5sU+7IVjE29w9B43hUUuXGu/ak5fpy3qMHTgb4BwBmAFVRGMQ3fCCnEGcnyQxoEC
	mly95J+ztao+tYwn0c3bob4TnU8vbUinuompOBeSaeIgSgeCrXWBHwimleXKP88A
	3UfJ/zO86fkBt1qZwOsJHd9iWxb/FQBtUKIEa2dbAxbW5w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eex6m31xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 11:33:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516d58f74b0so87614561cf.0
        for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 04:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780054394; x=1780659194; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kcwCFtKnzv3LShfYkyp0eS23qFCvWy1MIYWSH6XRLXo=;
        b=jL5DzQsdxOmkJhQew646xItMtH2rUb0+9hwVxcCrSyODkO7B64wmvtGOoy7YLJcaRr
         /OZ/oj+eWb1zFwl4hOjnHEUD1pGCWf7K35PU7rgHHl2FeadUp1Y7694PBWRIR4r398Yf
         KQFqbrZUn8ua9kWQhOWQEJh9AzqIDCT0WIVULu6/b7b8gxNkBM8EnDIrPYth9ztWRRNS
         p6bC6zW7+Z367IArFpGfL8txg0DhyZ0lyCblnRJ9w2N0whhRZuRUdv6Fkkr/7/nQALxu
         yIU0N21WVUE5ms8OLcYF+p4UeXko5BM+ClLCEKloeinzF6OdQcKHZU7EMhyGjpZyqILQ
         UnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780054394; x=1780659194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcwCFtKnzv3LShfYkyp0eS23qFCvWy1MIYWSH6XRLXo=;
        b=VyowMm8+GJK4zK2ru6ayNgG14gH7tQe2OQwCjmLWzgHLHzKpqIwq3dKuYiseXf6skX
         etPGEzCsM8WnAbk9xMiXq/xOXGAdF5YgfcMB6K7Q86q9WWNqFDUupabbR9FzGH4B6V6c
         8eIY94OtpuHkXOVt3mPGvE7ZsfpM58WOl6daM3BFYc0xzvjDrxV1W2xuclFTx2Hq3CN+
         e7S1DUJa1RbZvUXJH0aDs0sL03ouOz3GCMQbnWa9zNpiypXT/0W2jaQCK1FMrIL5YVW8
         ZuaWElNY/l7oVrsqjXCCaxh3FvqMXqTkpVqFAxXkXEWETC+CnQt+3wTDYo0flhsXyAA5
         Esmw==
X-Forwarded-Encrypted: i=1; AFNElJ9QwDkh2OhUI8RKSSCcvyX1J9EyrZVIT4sn7imFAbDc+9CrdJJv7t4w8aRzZPEbPS1xDVxVoG/zOBI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ni4TZy6eImGtASTwe7P88TJFjzqqd/o+5pdZBr0DoIBoWtyK
	pz4jAljnvtaX6VRVhKzo6R25Tbb/VKxSEqxVo7in/WXWwIyJktiB7ti9FeaHkYyv+u6WcBr5akP
	rWnbiSR3T7QbFIg1BwW/d2VeiR0jKrQintk2qGA+DtDVeGX4y8NSdMxaUQs5m0F8=
X-Gm-Gg: Acq92OGS8LJ8xEmmjyDokBYDIuO4zdBVqzbUmZwwyiH2xxKnqsVWuqAGbVfhOULtuYN
	JcFjrguznMFTUezqwJ8stvKVLY2QR0xv5ZD+cqksO8/9nYVQPa3xhs6FbNJAB1x+UkgO5lRUVDw
	4sTteXmOZkISlmW/2WLT5hoN6S+srxVKzhZtVxxOEcE4TEwiV6YPdbNWs/PLw/pcbX6DL16YEmz
	y08CBLD2yXXoKoQTjLdcbWvXASluFwmLIRXYS7e4EJUGcy5krwLmsMO1KM+yrJ35JqIZVXg5FD4
	V8knqjNk+YvjkETj5nflco7lczVLC4RTeoaRwxYXpGip1a7OjOqM2t0/E5/TI0tPvWcjF6TMZto
	agN8rdkR831OSFNj5Uc0qc+Yg044o/EhiZWcQVdMa1TRZtc/mTHvsemBl9z+uuCpOJy8NZV2SHG
	2Z5J77aPZhQUvlxDXuQvEmXB0zY7aLYvNVy4ghwdDNoh/R4w==
X-Received: by 2002:ac8:57cf:0:b0:516:e0eb:d87 with SMTP id d75a77b69052e-5172dc50433mr31984241cf.16.1780054394345;
        Fri, 29 May 2026 04:33:14 -0700 (PDT)
X-Received: by 2002:ac8:57cf:0:b0:516:e0eb:d87 with SMTP id d75a77b69052e-5172dc50433mr31983871cf.16.1780054393846;
        Fri, 29 May 2026 04:33:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b06892fsm226898e87.13.2026.05.29.04.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:33:12 -0700 (PDT)
Date: Fri, 29 May 2026 14:33:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Message-ID: <pxio3igdcylbowpfiwb7r6s7q5spbo7g6i4iiun64zwn77v6xw@2kfvhzuhyxex>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-2-953f246a0fbb@oss.qualcomm.com>
 <5nghgd3lt6vyewd3a7l4kahlxiidxdhgtu42tuyb7xeq62ztvu@tvclo336xtpi>
 <6d5fa33f-449e-4f22-b0d1-60a3a21a9907@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d5fa33f-449e-4f22-b0d1-60a3a21a9907@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDExNSBTYWx0ZWRfX3rF6xt4RYJsw
 FMfp/dlQ5ZvhJ4w4P2Hz/vheLz4FtkxvK/v07dR6JOU+qQcIV7Gw6tM9y65fR3/HxIsnGLnPPad
 QKp3H30ZyjFB7noKW3i3pN38BfkhE60bk684WK0ZTlbBCPTH4Dvepm1BUbDnvbCW5EdmXzUXaKy
 q/Vu62nbQ2FP+Pe1mqsTYQxa2hGci4aYL/mcwdgWRqLHsCvRvCMgSg33CYNmZewHV6NuMog6e4M
 1tLv0knDX/R+iPSVeOlUpfCiq9LhDfXu9ciXZJPdwJUZdKGdaXjeXmu0m8N9t8fe2pbUgFNiyZq
 lCCrKSuSa0HUTuZ9Gs0ZEiXAAJHvpk66TE7fyg2zW+rs8nceFxJLRBnlkIVpiivzuucWpY7Ccyc
 YWPtCPGH+nalITbpZmOpltFn8Lzk44XYVOnupc03in0FGiXUtxW8LMVCqpxrItv+YARxezqccgu
 fGg8ofwDUveKyt+KJKw==
X-Authority-Analysis: v=2.4 cv=frnsol4f c=1 sm=1 tr=0 ts=6a19797b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=ru1DF8YJaokbvtfr2H4A:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: PDTe09aL1CH-IBI0WKKTWbIyRMr8vpg5
X-Proofpoint-ORIG-GUID: PDTe09aL1CH-IBI0WKKTWbIyRMr8vpg5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290115

On Fri, May 29, 2026 at 02:53:29PM +0530, Imran Shaik wrote:
> 
> 
> On 28-05-2026 07:14 pm, Dmitry Baryshkov wrote:
> > On Thu, May 28, 2026 at 03:37:03PM +0530, Imran Shaik wrote:
> > > The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
> > > but has minor differences with the number of input clocks. Update the
> > > existing QCM2290 DISPCC bindings using conditional schema so that the
> > > QCM2290 requirements remain unchanged while accommodating the additional
> > > clocks required for Shikra.
> > 
> > According to the IPcat, display clock controller also has (unused)
> > inputs for the DSI1. Please extend the ABI for Agatti, then extend add
> > Shikra.
> > 
> 
> Sure, will add the DSI1 to Agatti as well. Since we are extending the ABI
> for Agatti, I will remove the clock-names from the bindings

Why?

> and update the
> DISPCC driver to use the indices-based approach instead.
> 
> With these updates, the bindings, driver, and Agatti DT must be picked
> together to avoid any functional issues or ABI breakage. I will explicitly
> document these details in the commit message in the next series.

Well, no. DT comes through a separate tree anyway. Be sure that the
updated driver works with the old DT. Also make sure to not change the
order of the clocks, you can't break the ABI.

> 
> Thanks,
> Imran

-- 
With best wishes
Dmitry
