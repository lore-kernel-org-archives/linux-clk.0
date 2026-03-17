Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D023C3BFB
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 12:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752267; cv=none; b=lvTZAlgfDMp2XMUS/PCqsVTkMEPrSPu6//6h9Ob4LY7iid4lDqfq78z9GdfjgS3SB+ZiSU3UH56ot8J42q8i5EkM6MnDSAYHI74ZkbXYxd8Ezn79IbepK317uLae6w0NSpbjXrnElGUHxJwYbQzBiBc1P5n/UOnhCJesDcmE1Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752267; c=relaxed/simple;
	bh=/oTeYXwjrQQ/M5nRTF+O8D7/sA6vHKbvNjYcLhgGZ0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmbPMcvVD4jVqAJ4r9bVZZvhF7INNkARPn4jH4QYbcn8Gf/FWyAEm+ApeIGm6KlPgjCpPFXHUbflDCBn0LDqp0Op7Gmj/gkX7Czr6SJlHBsXJT2cYXBME3s0L77dRODObJJN39ywzb49Hwd5AF9vXW/tbJnJzWbGjovIY2+GfiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8o04HTA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e89gakZb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8o04HTA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e89gakZb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H9CDEe3102502
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 12:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=thnf8yKaw/E+GLdoSsnuXZU/
	c5PUkd0G5cs1DXiHAEs=; b=N8o04HTA5Y2pMCYTioA+sAUucvoWbc2JD8fQ8AD0
	7oOStFKOxhDCqZzmxWyizEL2ZepokC+P5bo4+RCcr3wxyCWflPggWnlyWa4Rwqsx
	pbE+k1qLhCDzbn9n+E4lmfCkR0rPXDJR0DEhdaxFWRVxkycLzy3uZz2izTVt3QDZ
	wl/Wnq0QRVNDn7XovgH5j6vlTg5f2aynfOZPfkP3NGZy8Oy5qNUMv9vkgTeHVGst
	IMbF83gakY/eo+ssfeo9VvrpKX2ovJBt4UvWL7xqiDIJoBsnyohPS4LrL19HYDRJ
	SqubNgXamAJnf4ArCbQ2PzoFCIS8pqwEVD/nlBB3IISxQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxnb7btxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 12:57:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7ea0bb20so3285049385a.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 05:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773752264; x=1774357064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=thnf8yKaw/E+GLdoSsnuXZU/c5PUkd0G5cs1DXiHAEs=;
        b=e89gakZbuBH4zXD4CouvenN+xFmeLpR6nnaowvsa7X+/MpOmNSzHHu+h5pGmMsblGV
         EHnPaAiwB85eYsY86fEv3oF2YUNUfLn75/d/NvQlBNL/IRqqA/9zRdBNKCdwBMCOn7Kq
         l+7NdCiIhOa6cKDDZIX7uHyaW8CrLF+C0ChRo45LhwxFYWmEH/4CK8faoRBfuX5PwVeQ
         +7hJcx/Nus3A1fScTKeHIOsGcQ+4hJR3PwMEgunjvRNg9jQdY+lVsCIcpMwt9PjEAeKj
         3v1FVbK3wURYUKFxV2qtCTh1uaBwpD2mBwqUsHe9uoctRwiNgqK+UWom7C9P30RgRTBs
         ZzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773752264; x=1774357064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thnf8yKaw/E+GLdoSsnuXZU/c5PUkd0G5cs1DXiHAEs=;
        b=ENGIpUeN9zFtultxusx9Uj+oq6Tc8Vt3x88RjTYUXpEQRfqWypCGcZQAjgYdFX215E
         a2P88iFSyZh/PfS9lv3tbz71qEocwyx+mg1MH/p7f5JqSQGoPODTnbXGi/u8bNCedWOi
         0dmFYuu94a/y3DkdGxBVdQPUzBpmIf0ZiUZyvddxESOPzuZ30IhonlDQgIFLH6XJwFvJ
         o2xWWrnbyk1njusFCiIU/x8esw8HYWpO0/s+nLixBgGO19gr7JK3e08DxwGJWx6jJ2jb
         fhHWZTfLx1JJUTdoBlbESZqBNY8yGWa8TO34OMnEdn/4MKPNAVvLjoUjU8fyDfEpKsIC
         o0FA==
X-Forwarded-Encrypted: i=1; AJvYcCWtDzZL21DM5dK8DW0s31I4bxE4xFqFAeS7c/4FLtly9z/k52Wn72QnuyCwZgfAqQplzPAUIDWda2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkaaqOu7xQx69SKmOcyzg5u9A81HESYLBZTqsyP/468JQnedWE
	CAL8iGNvaDq0REPkDG/f9kHraEYztY627gx2ku+SWLNoHj9ipnG50jFZRcLHFdGuCbSFlnLVs12
	VkqFJzkZw0lyBWnoKGJR2SAyY4O68+LleVTi6MKt+zxe0lsguZ7X2/gEwQrh/jgU=
X-Gm-Gg: ATEYQzyhXku81z7aF2YYTa+8GK320MS8bVT4lHXk18eWj32Qevt02l9ovzBNoTqFexV
	wi7Yc4At8UefcWWoO4Hhmft5t6dykmIBNeKT8R4v9twuQ4BJYn6mXmXsntOtdZAAIbmYw/oeI9j
	Ko/2Mw7JgqDBvr8EvA4EQPcxGJOKuxsLlsPuqBj4Zl+5kzR41ooqjJS9kB/BVQJnVD+ol0C/0Yx
	WqFhVesFJ90XwWEtqgtFG5qDt96D2LMtwqQ2ZsA3Jhuh9Nu3JZsh2KstkjoYRovKuma3fiIV7F5
	SFroQg6AtNUArVq8+DDOvrokkLAqmiW4i/2XOpqNIpbKEUEtIq4ZhVJLttrhgws6INihh9rB3i1
	tCt04zf6QQythnctDPqM3GtKWTg9PS3uykw==
X-Received: by 2002:a05:620a:4489:b0:8cd:94a5:2f1f with SMTP id af79cd13be357-8cdb5baf610mr2047758185a.60.1773752264191;
        Tue, 17 Mar 2026 05:57:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4489:b0:8cd:94a5:2f1f with SMTP id af79cd13be357-8cdb5baf610mr2047753685a.60.1773752263611;
        Tue, 17 Mar 2026 05:57:43 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea98070sm64174785e9.6.2026.03.17.05.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:57:42 -0700 (PDT)
Date: Tue, 17 Mar 2026 14:57:41 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <ta7l34cyi4esksa6tqy2zsf5ajua4zl3foxjputefuzglbnrvb@bhy6crts4y4o>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
 <90efa4a3-7042-4fdd-9108-9234b0ba9573@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90efa4a3-7042-4fdd-9108-9234b0ba9573@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExNCBTYWx0ZWRfX2EVpyZLHUykr
 2vpIbIZQP3ucF3Z58pElVBVT4oCQvnHgcr7Ejg2JW1yuCL/CBrv7W1R/6GHxemWQwG2of3CR0t3
 EfvDBpqscoz/tDRFNWfBeDJsZdliUmaYzsESt2Jptp3HAxFa6sJ5UGqaiuJH7jAFYlzd4QQlm7c
 tDGTrxXnMFJYzMQ2fO6vjzovc1igqORQ2zZNhcNhP3YLkjlurU0BzqHbjgMcv1XpXsGm7qnokPM
 fyQnFe9TCZaPHrs1ZVbC6Dj8LUbgH5pP5/Ad+Kyp7Y/e69bNRoj2FEtl9ssc52AAFE4pBUJr86m
 RIGSFWX8UUVYGieHCFGuRsyQjA46nSfp7htajLZvTKMVKfD6m7AScTRDVTHRsrde5p5zLP2vhzF
 uix0c/k/d12GwRruTUr9+XWn6f0LSTNVfg7Wlobc4N5qWlRIPQRbTRkiZQHDx9YSx2oQdSo705q
 RYpSxXLzQTgdK52DNdg==
X-Authority-Analysis: v=2.4 cv=D7pK6/Rj c=1 sm=1 tr=0 ts=69b94fc9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=vTr9H3xdAAAA:8 a=Yq19YlwYyIruqN7yymoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: HGdw4k0AdBkQWCNyCM1xRcolwOXNKUrT
X-Proofpoint-GUID: HGdw4k0AdBkQWCNyCM1xRcolwOXNKUrT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170114

On 26-03-17 13:16:33, Hans de Goede wrote:
> Hi,
> 
> On 17-Mar-26 13:14, Abel Vesa wrote:
> > On 26-03-17 08:30:24, Maxime Ripard wrote:
> >> Hi,
> >>
> >> On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
> >>> At the 2023 Linux Plumbers Conference in Richmond VA, there was a
> >>> discussion about how large number of systems need to boot with
> >>> clk_ignore_unused. Per the discussions at the conference, the existing
> >>> behavior in the clk core is broken, and there is a desire to completely
> >>> remove this functionality.
> >>
> >> Broken how?
> >>
> >> clk_ignore_unused is to a point where it's seriously cargo-culted and
> >> documented as a silver bullet, when in reality it's just a debug tool
> >> for broken drivers, and the driver must be fixed.
> >>
> >> But nobody is actually fixing it.
> >>
> >> See
> >> https://fedoraproject.org/wiki/Changes/Automatic_DTB_selection_for_aarch64_EFI_systems#How_To_Test
> >> for example. The affected clock could be marked as CLK_IS_CRITICAL, and
> >> fedora wouldn't have to package anything, change anything, etc. But no,
> >> the problem is clk_ignore_unused.
> > 
> > Nope. Don't ever mark clocks as critical unless system crashes without
> > them.
> > 
> > Here is an example or why clocks cannot be marked as critical but need
> > to be kept by the clk_ignore_unused: display driver probes later.
> > If you mark it as critical you just made the clock stay enabled even
> > when display is off.
> > 
> > And this is just one example.
> 
> Interesting, so maybe we need a new way flag to mark clocks as not to
> be turned off when turning unused clocks off, which does not block
> them getting disabled normally later ?
> 
> (I was under the mistaken impression this is what CLK_IS_CRITICAL did)

Nope. Critical means system cannot work without it, so do not gate ever.

There is however the CLK_IGNORE_UNUSED flag, but then we need to figure
out which clocks should have the flag. Which is basically a whack-a-mole
game until we get it right in all scenarios, on all platforms.

I think Stephen at some point said he will drop the clk_ignore_unused
late_initcall entirely, but I guess that didn't happen.
