Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC91851814B
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984940; cv=none; b=e/gR6FToEYMYrsX0VrzSv9TTCq8Kaoo6FJlhuOuSU3vo1CaOlfbI5OJfdWfshAxl2TYmhnBpNtRWQq8X1jgsRYnykD7c1rgOFC476Rd7XjwMBe5gyq0YxA/SFES+XAoDradR/DLOMObRQUDblkFjVBcng08uYh3UpOkJpOuWu8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984940; c=relaxed/simple;
	bh=IlpqbHrz26EweNTVebA5NYWFDrcc+dfp5s1FMniEugU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HAnTsYVC7W7daRGPFze+pijzPeZCcWCtZwXRRjkqMkwKdeU20wUHvrj/vz8HKFYGoELFnQgvYG/2d/jM7oMgyUXvLzXro/4fopjgF64l5yKRsBzufiFV6nDg+W0zzSKl2a/xUIU8AbMJLuRxgmhEqSQ9UN1ObFgiw19qNs36ha4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSt/rCap; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6jgNpt1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSt/rCap";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6jgNpt1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9t9DU806741
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 13:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3oJjtNP80ClUlRJQPIJ5xMzy
	E/SdWULvgaeOPu3tEZU=; b=YSt/rCap38oBSiDonvSoUHWYieDW7AA788/GQYdp
	XLSfI7xGEpPtB4boX8OLXzQDk+fVeGUQ7VGylvdw5mgsvd9T/NLoAD3NtZz5ZzP6
	3wnXds0whZCrHtYV0mWJeCYyHLhzb3sCEgiXlkbBhTZoxbvHWKcUQx63iEvUjaZh
	F/V7B4RRVZgCvCVQY9FnsUCjgsEQ19i9Pnp30oJncktV7Z877VVQlLA1zzTtyGVs
	faOK1oX1MzhSSMddM/HEB4wZF8JNZe87v87lecWDb+i1UKYMjSp/BC2bNZmk5Mpa
	und//Lrbq3Z41nSs6BTvUMWOv5BqGngNkO1wphfdKQe7cA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6bpqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 13:35:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934956beec8so76726185a.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 06:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791984922; x=1792589722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3oJjtNP80ClUlRJQPIJ5xMzyE/SdWULvgaeOPu3tEZU=;
        b=C6jgNpt1DWcLNRj4vqBChWiM5uMqjGW3n964BSYPPd/HvSoiIidMFNCVV3yPjInPDU
         CLp1WRvOH2VEv37kDSOfUEHXoTp6zjL8SwU/cWqdkJXRh7fim4KHGD87PjBFuU5Pqf2v
         odQLkQuSof9aJ0vFwtMbC2XVucu0Z3YpYhaO8XiANrIRRk74LKYQpfpaJG/1K+NHWcXC
         PWzw3VljDykEEby+dYb39YVz6nj/G9D3rVsGhOPROLoCxJ348HHtxCJNNKslCy+NdhPf
         fro5zB/UmqOglw2CM0rLSGPSHrAybyGEyZtGF+Oem0p78BDgYEF3LNIbOJ/n+nmddkAU
         ZjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984922; x=1792589722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3oJjtNP80ClUlRJQPIJ5xMzyE/SdWULvgaeOPu3tEZU=;
        b=oGqGte/g15UE58NLpIgJ9wPeRvs7y0O05q2vyfE4w8/EilKilUISAJ0OVen2PpVaCW
         jBj1HDzqdWEjs8YhC4Q0Ct0EsPi249ITkmswEA9vsnbOYEX+/fx5+fzJVAsbMQx+i4e9
         OUwecOhaQpLOpKBAOyWLM5cgFGaj8Xxs7F4BTM9ppRzV1HMNKKCWe4FUGwgKmSfWFtz+
         +FXEXz5tijVB5FyVrbSd0Wf/A8zfSNWo1qh2a+RglCzCkNMVJ9L8B1ZmZzOsXDtoycEj
         EVQhEeVG5bbZ+Admdu74Pzmk6j+F9YwMjk0iP3ezve9WmCVoeT3TfpLI8wr/f4l+Cxrs
         Q8lw==
X-Forwarded-Encrypted: i=1; AKwUvBzEOOJwNgeZ8f2d13tiYBp6NI/xRICeLbx6jlNpuC50DYCHVP3nrmbOvlTMjJ+FUEtIRsDOOsOAAFw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdvKaJLn5lQwKBph7zJgipuPCYYV8DLfpIKXs3/DXXxz+kI1Sy
	K2vu2Xjoy8L15pSLmR/TJHxjkVfKiHRQpsAIAmdGR3h3miv7JsTzeMyfjkBdBKwwtbIOnPLqSyO
	xacoG5ATN/o53wZqtN7HhVxRM4uM5nb7edcTH6E6VqLoOAKLTswENQcyATCbg6ZMn+8uJ3j0=
X-Gm-Gg: AYBFou2EdJ//+J1TP9vovergLlGOXJhEH51xxGgDr1HnQrolJ8KdEXaFluJ5jd7Mjlh
	DER2xNxjyCMog3Dnp6RXbXBt3i/YwSRgDy0VyShUK9uKHj1yU2GWC7UDDEBI2cgp2U4fOWJlWch
	KnoJeurQniIWctGaPrGRajejRvQrKPQHFeyr7kkci71PLQ5Ixgt8Q/w1s0RSlvu+RiZX5z54+Jn
	BZjyTegg2OmLoC3aLKbgTA74y5YdPlYPh9X3iv8Jblc6+t8n5elS7HHkc8RNdyH8/gFVMkrBSB1
	yq361CRc0wf5ZI8tYof5a9katSHbFLMx/OmXIuK1wc0WY5+qMq3Ilphoq//tKSfaX/iyim4Gk0N
	idCNIM4wpaL2a+ER58WXcN0JAN01IHl0qwf/1NCzfd1u2vtlGoe99E3nNNJDQ1vDIzMIW2A9hde
	OhgO/UIf3+eVd3
X-Received: by 2002:a05:620a:471e:b0:93f:5ac:14b1 with SMTP id af79cd13be357-93f05ac16cfmr236552685a.67.1791984922454;
        Wed, 14 Oct 2026 06:35:22 -0700 (PDT)
X-Received: by 2002:a05:620a:471e:b0:93f:5ac:14b1 with SMTP id af79cd13be357-93f05ac16cfmr236544685a.67.1791984921806;
        Wed, 14 Oct 2026 06:35:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d857d9sm662845e87.49.2026.10.14.06.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:35:20 -0700 (PDT)
Date: Wed, 14 Oct 2026 16:35:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 03/16] OPP: Retry failed default single-clock
 transitions
Message-ID: <xkiu74kv2biofdix25gimmxxzqfqyocsq3wvdriqj7zscpynv4@us3hib36vops>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2WET_ncVvOl_DJCjsMrEiVpzhE_u6iC4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NCBTYWx0ZWRfXzZhNtmi9c2Zd
 v48fl1N8nLMZx2SHOus3ZPh8W2XrxhiM69SpK86MSS6nd278ZC9MUT6t4NI8J029vlNruJLPIrX
 hUaJsR1XX1ZodsPm96Ua9Za/LAkx86M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NCBTYWx0ZWRfX7vSRX1xuoXyQ
 cIM9t8cggNsY9mfL0gdC63vBFxrxEYXv4Fl2PeqO9g9c6OZi0eJ/S/UbjQ5F7KEsKRXEjBdjlml
 i2AI+bHgox9KAnl6WcVGk4Fb50cDgeB4fjDtNyojRpNGjKSjU2BCo7GC9HOFSqHRZnR6TiG2VJF
 bU2nbf9JxxNYkxmLvDriZY1kW3PS82sv2Haw3LZjyENA7nlhXcTVpSkUqPP7PHabe8mFMB4fAPh
 LijJTDE+6f2O4t2lSUQ+h+t2FL970Ng+rIuynOYM/H+t8V0O8xyWYpir7iUv89gD4KrwwSmwF0M
 XHF8BeSBOLR1fjwVTBNUDPP+HStP/EkSK4GAthGCLI4D6YSS+i0d4nAlycYaWw99HI7LOpsOPt3
 cMpIb1J/gRELiqN81KnsRJlsasE9ROkSWhujM5Ud9WSnHHmd5SDQFqtIlgUarVfOzmhN9BJe2dP
 N1fe48VPwK6AOU9kM2Q==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf851b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=3h-aFR46GQ2hTHGVm7IA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 2WET_ncVvOl_DJCjsMrEiVpzhE_u6iC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140054

On Wed, Oct 14, 2026 at 02:19:03PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> A failed OPP transition need not leave the clock at the last successful
> OPP's frequency. If hardware changed before the error, the default
> single-clock path can subsequently skip a necessary retry because its

What is a necessary retry? Shouldn't it be: try, rollback if it fails?

> cached OPP matches the request. It can also choose voltage and dependency
> ordering relative to the wrong operating point.
> 
> Treat an incomplete transition as dirty and use the observed clock rate
> to establish retry direction. Do not trust same-OPP or same-rate
> shortcuts, or allow table disable, until the state has been reconciled.
> 
> Limit this to the default single-clock path: custom callbacks can have
> additional state which cannot be recovered from a clock-rate readback.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/opp/core.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++-------
>  drivers/opp/opp.h  |  2 ++
>  2 files changed, 65 insertions(+), 9 deletions(-)
> 

-- 
With best wishes
Dmitry
