Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65FE35EDBD
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 13:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752587; cv=none; b=YMQTPoyI468lGBI3JFYi2/LMQi+r59CASQsEVnzi0l1Z+p+aE4ONGb4163eB/L3kya1tCxGCJAkjM7446486iqdVZlJTXHGOSZ4U4ganfIQlXEXra+Ezx7ysgjGrXG/mEF04/MDus5uvfFujXds08KOWD15PSTo8AjCNAyMru7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752587; c=relaxed/simple;
	bh=9TrlYkVhdbRnrso2/qxUuCyYFNiDvfawciCWOCjdfTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jG7eqkmC3HS76O/3TT9iNTMpQRApu1CAZcFfJEakLQutbJo61HYrJgYtC7wT+0IE4+BsQtwEfm1V654kIv+p70bXrGm8ksNPWA6P43Ej5mcERHHTvTLOuTQeGqTE62cG43/wWEaWiu5GkSUlFCCap+K/omyv1SFWZRUesVijiZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ezLS0iv9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L7og1iAq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ezLS0iv9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L7og1iAq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7RDwp2905953
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 13:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=08FCGsj0A8jfUn6QeECb9QwR
	OGThTWUGy2S8O64+Itk=; b=ezLS0iv9z5z7ZgBXxcZCvRLCa+5yadRgvA5PfksO
	GBsF5zB/c37oAOeE7d7+hCplqQx6DwBuLHBeqx0MgOGF6VZCooIPAFze3POvozOd
	+6SgMvY9wxv5VuzpN05P8ifw2VJbZkPfKw7V9v0GkkusWpDt8Tfoe0iDykg5gm/P
	lPVOn+lTU+4BcR5I1N8Cidyikg4q0hP2psh1+KN51c588mRxzxP2SLuLFjnSRaXB
	86k6A4flA+x1JdNf4j4P41bK0x1tvfgvrNNXcQRLjewDoTasA/0ztG8ol4zdL7Oi
	js02Ue99xE88M7o0AkTbqPIdfWouNTFD6qycBu1dm6vUBg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2jxh6uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 13:03:05 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffa0b00da1so8257105137.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 06:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773752585; x=1774357385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=08FCGsj0A8jfUn6QeECb9QwROGThTWUGy2S8O64+Itk=;
        b=L7og1iAqXQccjCOjnSnixP+5pywkaP29ObQJLx3LLUM+Zqc8/HpekB8vSR3zFRhcx1
         Yqo+Pjp7jnYIPjUGXETmA/AATc+gKSZIIvRumfTEcFcgWQTNT4v3JqBD5KGNoQii4Kin
         n9dTXbvnngcr0XBLxkf5WEiM03/wKQ1Enb156T535uOxGpsDbNGqD2eoQiIJMEIG4h4z
         gbGMkFitRlfL/Vre6vZu6NYx+j/GlqECNawB5w/CAzb2nKIZvkiDUx1SwXKYNJkkXRrT
         6PNjRlJPX1PjGeGJKbTXiM5sIgSS9cTSKmBH+XAjQGTCTvqWfxEu77C7LVsKP3ZzOk/E
         8Vdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773752585; x=1774357385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08FCGsj0A8jfUn6QeECb9QwROGThTWUGy2S8O64+Itk=;
        b=nDu9p5W6VRyKBTf16BiKzqyQF5US4S7qBoSmQLl6IShj87DGcd1Nb+WclQMLfFmpJa
         VqXjC+UCt0fblwBPBswFoEihXO3gt3SdspeGQsQLNi6z+I31MC/GWrFe/m5ziu7yRi3O
         JGv5ImlAggDZuGmlmTh0MetxtRkKKvpA3eFkpV2foXk6uRnJ6IyBtpLayPL21/wPq3Hz
         KHXCECJ6pB0UKFAvNUqlUNZ+yRapdqab1YrQ8HgQ8NDG7135iJbf3HvZMAnsAhbGnLKb
         YAYwN8lHkFA/JU8nwWr3kQZrTlMt/O26qaLzjGh44pZRHwPgiO8li6ozZ+MkxMjc1Xs4
         Uqfg==
X-Forwarded-Encrypted: i=1; AJvYcCUGQhoVeZahYFpQaIMCAcXeC9Zvc5m2ONmFm7jZjtHYS9HnnC7mThjeahxQUteHoL8w2EWAPj8p0uo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwFTDHGfGRd+ZAmIIw6NASTEJFK1KNk342sBytLeCl3s5zlfO2
	zzdc5DARQfzv7v89qKY+sUlWbgMFwM7QVURzEXWEKRPH8hcbqp1oSED9Rgdakhg7BRwdxeTUWGb
	zGIh0FLT+ITont+l4Ln5KD0zmCavpZkpZeZvXv6NuDLJDGYioUCtkMI9fomkFC2I=
X-Gm-Gg: ATEYQzzhzOWAshhzbPqk3kSUfPR40EYxHCRP26yx2kRFNxFXPWbw40lAetAcNI74uSj
	FZKMbHTEnosLjMDkRRtWiXE23zcFlae0lVx3AIT6HBraxvqvh05gS+GmbaqH2Mmyfv1z1t7vOxZ
	UiWJHShZYNWhrIxlFA6iklzXqzoavd3QZzFADbYgGa87AKeY7ECT/Wi9LD2guYe9zu1gTJjMxHI
	uYGzlmcGVYSkmexaWM7K370q6FbyNT5cHmGA4egjexpyb06DQ8qurtPvdjlG76N6YLTuepvfhTr
	nojSDhmtGJyD2y1iLDqPYwLr6rwYUCVImK/EGBsUvDWpUC1i6rwx0c5hu5u+tRGh9HgLgn1JtlM
	eNKf+eZpikq955IjUPUd4FByDjUgxNIXgUg==
X-Received: by 2002:a05:6102:26d1:b0:5ff:c831:b97f with SMTP id ada2fe7eead31-6020e176eb7mr6356422137.1.1773752584660;
        Tue, 17 Mar 2026 06:03:04 -0700 (PDT)
X-Received: by 2002:a05:6102:26d1:b0:5ff:c831:b97f with SMTP id ada2fe7eead31-6020e176eb7mr6356341137.1.1773752584106;
        Tue, 17 Mar 2026 06:03:04 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3a09e453sm28834405f8f.0.2026.03.17.06.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:03:03 -0700 (PDT)
Date: Tue, 17 Mar 2026 15:03:01 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Hans de Goede <hansg@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <vhwd56xafb6wml5podszezzi52e6gdnyv25pgwcpw2u262bgnj@x2uqnjbmb7d5>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
 <90efa4a3-7042-4fdd-9108-9234b0ba9573@kernel.org>
 <ablIc4OkoJvdeddT@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ablIc4OkoJvdeddT@redhat.com>
X-Proofpoint-GUID: xta828-XRFxsaO-RcXE99dRzo0a6rz9n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExNSBTYWx0ZWRfX9Fd6MnEvSH5C
 h4zKGtZieR6DzurXxSQ1DueOB/k2uqq9rgqu64vfCiU5Jqlhimn83Bzj58ponR5PjaGX0M7zCcU
 k4yVPM0f38T1PlavSBKs8c40rPp74NKNuE2yV+Yb+FpfiEFoDg3SLyLwYsuCAV/6j6DBzkaB6oj
 SLPpSgK1+Jl93L5spyjQZ7BmACI+qg7n78gbe+CRiwmdUCG3kBPkA33fAmkyW98jSEY/RrXkbTw
 ZQoem/oIynf/d8xzDGRBfRW1a671KlKogDZQVxy39606e96v2japC+0cWBS83nKH2YnM6076Ig5
 0E60y+UplgeZgqLNCw+M/7G/Cx5v5eT2deP5T31/Y2Sj7dOVst3FQBTAq1MBwUWtzSeXYcJibX4
 qtvSbgwZKjxiMvO5EnRw/Wc7Gkoif3DW8GEs8+cJJs4EedVIKBohDY7VEKqL6Fs8fLzkO0t9uqh
 UOGtrUnb8lWNudXrcSg==
X-Authority-Analysis: v=2.4 cv=c4imgB9l c=1 sm=1 tr=0 ts=69b95109 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=vTr9H3xdAAAA:8 a=__2JQzxBvQeR38EMPyQA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: xta828-XRFxsaO-RcXE99dRzo0a6rz9n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170115

On 26-03-17 08:26:27, Brian Masney wrote:
> Hi Hans,
> 
> On Tue, Mar 17, 2026 at 01:16:33PM +0100, Hans de Goede wrote:
> > On 17-Mar-26 13:14, Abel Vesa wrote:
> > > On 26-03-17 08:30:24, Maxime Ripard wrote:
> > >> On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
> > >>> At the 2023 Linux Plumbers Conference in Richmond VA, there was a
> > >>> discussion about how large number of systems need to boot with
> > >>> clk_ignore_unused. Per the discussions at the conference, the existing
> > >>> behavior in the clk core is broken, and there is a desire to completely
> > >>> remove this functionality.
> > >>
> > >> Broken how?
> > >>
> > >> clk_ignore_unused is to a point where it's seriously cargo-culted and
> > >> documented as a silver bullet, when in reality it's just a debug tool
> > >> for broken drivers, and the driver must be fixed.
> > >>
> > >> But nobody is actually fixing it.
> > >>
> > >> See
> > >> https://fedoraproject.org/wiki/Changes/Automatic_DTB_selection_for_aarch64_EFI_systems#How_To_Test
> > >> for example. The affected clock could be marked as CLK_IS_CRITICAL, and
> > >> fedora wouldn't have to package anything, change anything, etc. But no,
> > >> the problem is clk_ignore_unused.
> > > 
> > > Nope. Don't ever mark clocks as critical unless system crashes without
> > > them.
> > > 
> > > Here is an example or why clocks cannot be marked as critical but need
> > > to be kept by the clk_ignore_unused: display driver probes later.
> > > If you mark it as critical you just made the clock stay enabled even
> > > when display is off.
> > > 
> > > And this is just one example.
> > 
> > Interesting, so maybe we need a new way flag to mark clocks as not to
> > be turned off when turning unused clocks off, which does not block
> > them getting disabled normally later ?
> > 
> > (I was under the mistaken impression this is what CLK_IS_CRITICAL did)
> 
> There's a separate flag CLK_IGNORE_UNUSED that can be used instead.

But figuring out which clock needs to stay enabled until whatever
consumer module is provided and probes is a mess.

The solution is drop the clk_ignore_unused and rely on the sync_state of
each provider to do the job. Sync state isn't reached until all
providers probes, therefore the clocks stay on until then.

