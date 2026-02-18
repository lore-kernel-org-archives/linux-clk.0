Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9179934321B
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 15:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771430366; cv=none; b=FFNGAXhxMTlHhn50PZuiftlSLSB8UAjQuC8086zNKIkPeBP+oI1lEj6wm/LvVsq2WT/CZ8UVTNPcoMeHVkn+ZszODPVsQeXkhzPHG5lf+UlN1ggtEgtn8HOuaL4THmGt0ujo8rki/ubPAVpo9KoZbmUXToeRh32b9yvttfnXbqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771430366; c=relaxed/simple;
	bh=i88k5YkercAZNQo0w/ZRWr8Yk6HHpqOQj+1LiKmdzhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfbuh+GyFooU3JszQXwDUzTpelAq8VbIT6AJhISLcyTc5MWsU+iliQ4+HltviZN9HVzIU7IWTng8IEusfOPWZiT4x7fuA71iAdq6HmP43x5rxso3vbEIHjzBRMucYwIq8zDdpmhDG+vaxKGwcM0w3u42YdD8hzl2qg2ptE5tNm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQTCyQVK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nbhi6tDe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQTCyQVK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nbhi6tDe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I8X6g13380120
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 15:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3jScn2Aggys8WmvHt1k8JBxs
	Nk1nMV7cMPlxYxor5Og=; b=UQTCyQVKEbUHzebMP34qAL2YQs7UsH+4b84DPOqA
	U7dS4MkssCz7ics/mWd3JwdPzVd+50/5ZAlbH1uJr9EUitJMIa1ohsVDmwU0xRgb
	qAnafve6S89b778RZ3ZPwiSkHdYeL7t0YCMYzjYW5lVW7IdZM09x2j4XdPH7fJCD
	T/Fsc78onNCqTzNHEgR9pFWUgFsBurW7LhT47JNsqGBVc8BfxKy+BhtI/9W9UjNh
	djYC9QF7ewrlLeYvuxdoe7BSUIQDjYDfYhlo1wrAbNRQkI+tAncja7q1cwl+Tdq1
	fr4+IapegjE6ZfpzXzYZ0+Zx9Qf2wqXGmIA/fPRltgcCUQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccxnyjwe2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 15:59:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb706313beso237130585a.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 07:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771430363; x=1772035163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3jScn2Aggys8WmvHt1k8JBxsNk1nMV7cMPlxYxor5Og=;
        b=Nbhi6tDeRl0/rN+8RKFSTGcva2s4Rf0ttSEFr2K7GyF6VePerZcEwb/9OfZCmtoYfZ
         XfBZesDYL0OO752hEtG/0KD9GZMCzywMLUT/fM6xkln/56SkX/zx1HZSc5FCSejLZLD9
         mWH14IsCMBqp9T7LoWfxPrapchq4c5bl2poqCEAK04nb3WhHgiuxApFrprZykwx6TCE3
         lLlwKiuNk2w1E1rFlPyvwLSk6iA3OOkLdagqLdJbuZ4Ybf97e7brJHFC426+eGtRbVZi
         gG8ZPt5l4/sqnN7NiUc3xV/c8JWLkOH8pxZak3mmu2M2KCuXdVJaLIAOBtgQJnaio6zS
         02lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771430363; x=1772035163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jScn2Aggys8WmvHt1k8JBxsNk1nMV7cMPlxYxor5Og=;
        b=Bu9L5qPRnx2aemw71k7AcNmkw5kiEgdc5SikDEsBNS8DjgCminNymnTPwq4/OCmYyO
         08zcMMSixof5VM20OoP9dbFCX/E4b15pburHWQQo8FZeirgDWsCEN1+U65RKIXdQ24YL
         3ICbX7lmJRbDSiiBvFNo3uOkoi0rkLVHWzOrdZxDYbKPGbNT6yrqVRr16x2/LKS85bFt
         P6Q63xqVVWcsTeGlAFPaVHbEKrcnCQgVYo0hn4+MiUuDW2gSLglCGy2dTQnEAzQEPlbb
         rMAVBSQxxHSvhLnR+nwtOTjVEoxHYgVFHKyffjLhAZyYkgNvXIzIMYg2RpfJZAvUmX7W
         +y7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8vHnTKwpWtS8PKq6j3GIDqpWFgfnpsmy+zwgcwjNKIutn7/6nz3L7cd2QoOqQlZdvRr5iZh3rhBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR3mA+qbNpQRXFSrOY20/yE5GUTE4WktKNpBcESwOUwJak6mlS
	BbS4rkAPTOCciJ7Qe76SseDSADGS/xkwq5kvSA9hH78g2MZgXmVrwgrUc9lmuLnT1LczwzXZVTq
	LgEfnaFk0W86ueT42BKAiSr0HEVpoh9Ps+ZhedrNx76yFhJMNhZe0ncIdqmHutsc=
X-Gm-Gg: AZuq6aLUCy1iSEqsY0QpB8naqqoM1C2bP4EWwL1Su5ts/HS5sNrvY4l0wByNxdIO6RN
	OB1EPAs97tNyIbhzwKBTiaTSUTR8tLKTGDnuZzVoMZJewCCg92Rq7BeNkbzehMuEZkycnemmfLX
	bMOHxqCAeE3X+yC5+HZmCTTR0vEUVYxcND8biindaxLBzDfFwGS+AeqYATkgEirSc/S+IeyWrSq
	6iKgExY3P3uEVdd7r3mBJodYhkmNbzwjay8P9iKBRYNipZ/7LPYKKDbTGWZmyrU2FyPG9o+gxYb
	AMSleEqq0FEl/B3xiyW4ScYNU+fu+pbll6E3PElWf1bowaqmuaiXSjX9uJ30ec/9j2s2aY2v8sp
	XevmJhMkKb4IUZlr41c3O/XquWjtx4vrHSPnQUTwe4aedzz0/XKiXdFfF6HeAJ90feSAPdTxWjc
	3rzp7YGkPAK3bTDglnZDdsgTEP82eC7hzChwU=
X-Received: by 2002:a05:620a:448b:b0:8cb:4ba9:cce6 with SMTP id af79cd13be357-8cb740c5467mr252435585a.66.1771430363296;
        Wed, 18 Feb 2026 07:59:23 -0800 (PST)
X-Received: by 2002:a05:620a:448b:b0:8cb:4ba9:cce6 with SMTP id af79cd13be357-8cb740c5467mr252430685a.66.1771430362697;
        Wed, 18 Feb 2026 07:59:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5635a3sm4766803e87.8.2026.02.18.07.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:59:22 -0800 (PST)
Date: Wed, 18 Feb 2026 17:59:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
Message-ID: <t5akkkyyv5yebjmowvqu3nnweu5hz47tagdzv3ifzqwlgib2v2@5jugyaiav5wn>
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
 <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
 <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
 <9405b67b-9e08-472d-a937-38c038fdf73a@oss.qualcomm.com>
 <ljser6u4fd5qc4lxxde77igtxz6ertbeucsg6s3zbwlykfowpj@yf7h6tqh6cik>
 <9b4cb352-d1ed-402d-a55d-cce2d2fe1eed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b4cb352-d1ed-402d-a55d-cce2d2fe1eed@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: eq4RU-ciMOnQvEV2KrYOFBKE749PIaPK
X-Authority-Analysis: v=2.4 cv=Do5bOW/+ c=1 sm=1 tr=0 ts=6995e1dc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=SXzkmgPmAAAA:8
 a=VwQbUJbxAAAA:8 a=P78Ve_Sz14IPV4iFJdYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-GUID: eq4RU-ciMOnQvEV2KrYOFBKE749PIaPK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEzMyBTYWx0ZWRfX8jN7SFzBAR8g
 nXlmYJG64RvDRerNAY278uJ3n/dqpkrW7oo2IHrngFDm2Aqt1ElhL5pEw+9LRE/Lui8tRqoggtr
 5ibBWo65g4MNr/PUyaQPW15EDw1ZhMmr4zNsWWmOCQxDBm3orK01oHbxxcCg2PksF+dy0jlWS1N
 OdmXIg5BFaeBb2tObEx/KtWy30LyKQsHEFyo0aT4+epbckgTFGYZ8+SvZqQcTcc+M0IrlbW2j9r
 gb3gpkoOVUCOscv+Um2G1Z6lIO1y8W6tzBoLZOoBx9/m+lWuDBRZbEbCAh+w+VePyi+oeNwy+77
 qbKv1LsbSVvIkrJUhv/f6bE5jpWGq7Ko9E0AYO8KdcXdi3x/r6LbsHmSsaFGAFKCJKSSWMqEuJl
 OwPkIZjF1VuTCGv+4u28JCPXgvSIzfs4fpXd7p0iD/eltyWNC8LLtogjRMnQbzgpXMSywiUEURT
 PqKUHggIqJQHiVos6zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180133

On Wed, Feb 18, 2026 at 03:28:01PM +0100, Konrad Dybcio wrote:
> 
> 
> On 18-Feb-26 12:58, Dmitry Baryshkov wrote:
> > On Wed, Feb 18, 2026 at 12:24:26PM +0100, Konrad Dybcio wrote:
> >> On 2/18/26 12:18 PM, David Heidelberg wrote:
> >>> On 18/02/2026 11:30, Konrad Dybcio wrote:
> >>>> On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
> >>>>> From: David Heidelberg <david@ixit.cz>
> >>>>>
> >>>>> If the OS does not support recovering the state left by the
> >>>>> bootloader it needs a way to reset display hardware, so that it can
> >>>>> start from a clean state. Add a reference to the relevant reset.
> >>>>
> >>>> This is not the relevant reset
> >>>>
> >>>> You want MDSS_CORE_BCR @ 0xaf0_2000
> >>>
> >>> Thanks, I prepared the fixes [1].
> >>>
> >>> I'll try to test it if it's not breaking anything for us and send as v2 of [2].
> >>>
> >>> David
> >>>
> >>> [1] https://codeberg.org/sdm845/linux/commits/branch/b4/mdss-reset
> >>> [2] https://patchwork.kernel.org/project/linux-arm-msm/patch/20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz/
> >>
> >> Please don't alter the contents of dt-bindings, it really doesn't matter
> >> if on sdm845 it's reset0 or reset1, that's why we define them in the first
> >> place 
> > 
> > I dpn't think that will pass. Current reset is defined as RSCC, we can't
> > change that to CORE behind the scene. I'd prefer David's approach.
> 
> Back when I replied, David had a patch that removed the current RSCC
> reset definition in dt-bindings (at index 0) and re-used that index
> for CORE, putting RSCC at index 1. Perhaps it's better to link to
> specific commits when making comments, note to self :P

Yes, I saw the commit having two resets. Anyway, as we saw, it doesn't
work.

-- 
With best wishes
Dmitry
