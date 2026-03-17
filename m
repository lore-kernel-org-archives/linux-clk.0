Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08413BE144
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 12:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773749671; cv=none; b=uAmU0FoN92dnNY4qli9dVZYHJfuU7tKw9Hz3y6tmY0HLHYjQKv+buAa5o0oO4iniPtys6j44nKUJBFQRXDC/JPNsUy0k+uFTs5u3huMdpQ+tOmxB85l3h/NFM1QHu5k0Gd5bkxtu7z1Ung+wT5A2KjF4VOmiMfZrjuqgmXDQmy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773749671; c=relaxed/simple;
	bh=Ueg1p2m/pOiM7sMP+EYdJR1vZIvtjQRbK1MHKIkw2HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cq+pwO5qwmTQx/4bn/Nnxw+d+FWdd+FXqJk951wPCl3F3sHN2FGVxf5YLVr5WYBa+7xqapG7WKmB9FzYrAKYRkHOjXvO0Q11cPcZDktlqPnx2l4FbNWsg2nwlMOkjpS3ZtddAHR6ggBiFQdgpeZOqhZGjbyqevbnpUvqGKpah6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QfRDZYdA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FxMwE9LJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QfRDZYdA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FxMwE9LJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7RQ4O2906089
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 12:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SxOfG7tOStpWqKuxmoaUoCgA
	Yix9uuGWUOMA+Wd1nZs=; b=QfRDZYdADhLeV2ZqDrhwmzileV/4QXXdig47p9jq
	rJV/cjZ7952RIf4QI14OmELhD4tuvJ1UWlMhsOYMJ3LO0ZmyezXrE3dJeBBtraSt
	eqxKIwH+Yyjwt2QGYSfRCX8xPsIXzu0aK7qQicjTsIlfvXKi20TDB+phLs3RktP+
	k0mFoAN0VisTZWLqeviSXhaVbplzKHrvWf+c4ZHb/LEWANUBNryqSNx937Mp/UIs
	ChxqqxxqvxyKGMu2df9/6fxFlUPPEnuu7j4vC/oTZ23N+lgIZ+1A3/oFSyM03YSq
	nNR473xiTbYFHIW6mYDBQXdfeSRVj8quFMPtplbVY3PVrQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2jxh1pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 12:14:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd8b37d4b2so767580685a.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 05:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773749669; x=1774354469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SxOfG7tOStpWqKuxmoaUoCgAYix9uuGWUOMA+Wd1nZs=;
        b=FxMwE9LJNoDJ67COw66tEZ9odgFnjfqggM0yUOSXVV/dcIxg60qussoZRZJ0IAzO/e
         3gaHBT0u2dj/PvaUCWC/e1cKFsVf9G3FvA8bQu0nGcpb1A2DNLkNGsoZc805jTNeuBLW
         pFeJmx5PwwRc3aDmtNio0ILNTigzTuUZbwUToRTxsUm29jIaIAfZPacVrJBkSlLRw16e
         55K9n27zVEv44Ewv2a6IHS+MtP+fLp9ojwaANZZKLK9jJ/IYe0NDTRBQCnK/faP4+n3w
         iyoQdNZp2ZvxcPtPSOKIIvNcQMcxUOR9z+KKFeBlbj808WyelS7HNA0mqqYHZsz+4zXB
         T0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773749669; x=1774354469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxOfG7tOStpWqKuxmoaUoCgAYix9uuGWUOMA+Wd1nZs=;
        b=rbdg37VSfS7gtdZ0cvIM+NOzJEAEWIcs5equK+Kp9YwuMoMBC3XTzn3hXz/CDoH4OM
         Heg0nxQy6WEuzstXjDLq8JUeR/rNDnv29twOHFPao17raha7wVzY44kzUATlPmgdF6wc
         jVCdgQjOMHzEOfzJIyF5CmaN7B4BSmVCm9y0P7d8tZGoJKFlCIdxQVsuxnBRXcWqT11b
         9KuMyla5ETmPrRsV0xArcX/+y76Wf1Pq4zKdAB5GRPAHMBNH+2ax+0fqOEqnld2YwQ52
         eRI2/MfuSq5h92OklBj50TdPWCqIhufI1WxZpL7LAmmdu9hl1J3W7W4tFt068XK/XJbP
         QKzg==
X-Forwarded-Encrypted: i=1; AJvYcCWNf6s0vpWfVZzDyu+G/dyak+7wXJnMplcoEmKiMYVtZyLFzhdiOTHJjDJJfNyJaT03yNJSRuPc+eY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzidMPA55zisSYmHEbuX5wTjUu3bfoaTnhr5P0A2vHP5yvpa6Cv
	s6E2oBS/AhHVzOBxk6QH2KklWEtMmPISIGsAieww8dGzDX8IN3wUmGEJ5BUm9HOXKWzrrjo3GE+
	BxPxJdC/fQNBM51M2DHHaQZYoyPpUeBEUsYcaxc2sw+FnYzV/QwSkVt8wkfr1htA=
X-Gm-Gg: ATEYQzxrjxOJireqVUCW+xqKw0l10I/wczaWoDFpU3anxnWSzfFxiyzOwuecNJg5U7B
	a1kc4b8kuvjwpzxiyLOVtVuCDXInGB0LMurCZIcBLyMWznVJXxO2iy0OPatAORH25JpY9hKOKr0
	HhnppeM1P+QOy5Cx/KyeSXrEG9Gmyq0xfobMeYlCfGTI+vXTape8UWZsg/PCu4t5Fy9OF1LuMHH
	Xiv7AYeBJlEqz1uNM7H3TkYJZqvFGz1tN4kXfks1MMIiUkfQQ8iCTH3sWECF9qRBp3iYbkigl8h
	WsqPUaO4u65e94xTF9RS10oXZZON0dOcSCPJ7lSMKwpSOCZYL39iT0T+vI9A7a44gl/a1NcCJXo
	WHNXPbVjOJ2wu7Iri9Pc+pPO5s8jQ0TLCNA==
X-Received: by 2002:a05:620a:44c7:b0:8ca:3c67:8920 with SMTP id af79cd13be357-8cdb5b70212mr2195506985a.69.1773749668449;
        Tue, 17 Mar 2026 05:14:28 -0700 (PDT)
X-Received: by 2002:a05:620a:44c7:b0:8ca:3c67:8920 with SMTP id af79cd13be357-8cdb5b70212mr2195501285a.69.1773749667878;
        Tue, 17 Mar 2026 05:14:27 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3b0e9b99sm27806074f8f.18.2026.03.17.05.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:14:26 -0700 (PDT)
Date: Tue, 17 Mar 2026 14:14:25 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-almond-leech-of-correction-2a2ef6@houat>
X-Proofpoint-GUID: p-AC-X3KUcs0740VFRyBU4nuAOi4rYdH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEwOCBTYWx0ZWRfX6MEtVdbQ6xiw
 GWw6gvJSVg+swRkl54FF9PNtO2GP07iC3zalwgKzlIAQ5okk2PhIY1pZKDLyEGA3VWAvDHDZX5O
 k7FboWY8+8NYKjRxgNtU3garSk+dLhSySHgJ6YSnFdET8fPb8/6Yqr54XfQuplp/7Fcd/EGf0sh
 7wHQdYIX7RhC+Q93NChqCy5Ot3WZGF5jTHA+G6UE0BZlc7DSQWfSNNByLYoJas+SqkNwJfjgZGH
 8Ul6BY4HMaPM+F+AbtH60cPInHVf/BEsWFJ9wIbGyGgWW5di1EsrzZEqahbThChxaL4UhXlV+AG
 9oPXVCrHLv95wGlJSUHNpE4zj3W7QuZPcCn2cIXivDwhkh5bYNZq1Y4n+s2zod41AtzlU8nmWBp
 FkEn+OwAsl8D/kkonQCRZpb2ZE6kb2o6wJV50oov9K1XT9EDmnETZNLoFTs39u1FuMHswbOHvbQ
 7171egxSPvl8oTpmCzg==
X-Authority-Analysis: v=2.4 cv=c4imgB9l c=1 sm=1 tr=0 ts=69b945a5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=vTr9H3xdAAAA:8 a=JBf41zNlYwkEi2lwROAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: p-AC-X3KUcs0740VFRyBU4nuAOi4rYdH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170108

On 26-03-17 08:30:24, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
> > At the 2023 Linux Plumbers Conference in Richmond VA, there was a
> > discussion about how large number of systems need to boot with
> > clk_ignore_unused. Per the discussions at the conference, the existing
> > behavior in the clk core is broken, and there is a desire to completely
> > remove this functionality.
> 
> Broken how?
> 
> clk_ignore_unused is to a point where it's seriously cargo-culted and
> documented as a silver bullet, when in reality it's just a debug tool
> for broken drivers, and the driver must be fixed.
> 
> But nobody is actually fixing it.
> 
> See
> https://fedoraproject.org/wiki/Changes/Automatic_DTB_selection_for_aarch64_EFI_systems#How_To_Test
> for example. The affected clock could be marked as CLK_IS_CRITICAL, and
> fedora wouldn't have to package anything, change anything, etc. But no,
> the problem is clk_ignore_unused.

Nope. Don't ever mark clocks as critical unless system crashes without
them.

Here is an example or why clocks cannot be marked as critical but need
to be kept by the clk_ignore_unused: display driver probes later.
If you mark it as critical you just made the clock stay enabled even
when display is off.

And this is just one example.
