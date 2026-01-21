Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8210E32D0FC
	for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 22:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769036040; cv=none; b=kfqb7TuAh9JdJPLgefhzYHhuTs4pzl8j5/cI+3+yUTyFGKWXGmxyavK4uq012R2vhD+Ol2DiebkABdJ1eBdNcbGcDynoNqB6Gni+sxWDWhFaGKqJx5u3u8uz7hstKxFzKLteBVv0d+yUTs956vXSoUJhMA75/PVC9O+0q180VD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769036040; c=relaxed/simple;
	bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXd4W4WmXTAVy3l/POMq/vIr8go6I5IZY6CIbodhIB/u8JdPxYvuDjfNQoV3f0S2PZQkt2/uct8Nu1HWwtEnPoUB+lhh9DdUppVDmrmlC8v9JxtPgVNQF7E0CMUYqwEjXzd2yF0VWuhT6dWxhX66UXi3r35gHmry1po7Cf48hrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iHOtLHV1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GtDoFVbf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iHOtLHV1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GtDoFVbf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769036032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
	b=iHOtLHV1w7oSuPv+8F+UuBYkNIL+S59QcmkP0xKN1x8tnPUz2hkM9BDiW8ESUku4bt3n3V
	7SjcjFWhdZdVwIE75Xlyu/3mmaYW2VXPTgmxbr2Szk2X59tO/1nrg90gCqlT+QtMgxZEZF
	SqqmiRbwXzm/wY8vfNOt0LIgaJMzPk4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649--MWh5DHFP0SbSkrdLDgvgw-1; Wed, 21 Jan 2026 17:53:51 -0500
X-MC-Unique: -MWh5DHFP0SbSkrdLDgvgw-1
X-Mimecast-MFC-AGG-ID: -MWh5DHFP0SbSkrdLDgvgw_1769036031
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5019f8a18cdso11078571cf.2
        for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 14:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769036031; x=1769640831; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
        b=GtDoFVbfPIev6Y45lnUj8xiA8GxcY4vLl7Zc+zcX/Z69kLArm87l/wSqn/UI7DCfSf
         U30AimhGVESqjkpe/jreBjvHZgsNKn7docRbMu16NEBpLoFzCGFBxuqLQUgyXu5dVQis
         HaT4reFMxuhHlp5vW+xnI6QoI8md1+lGBpH4Eb4H/yOGB69lkFRTa1lL7OKfKMCx8Ztb
         SHjmUGudpNV/kOuCkjTFdlmS47bqkS46ZDIM4ORSaYcXzVvSvs2cwZCDSH5+19PCe80n
         iObPgZrtysxGJfgmz4JJmJvBVw1Pbm/IW6vXLbEl2gCIfT251WTL2usfoDhuCbaPGo68
         ebYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769036031; x=1769640831;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
        b=Lg2Slu6qopV9R9DZ952QGdww9Zuj8z1f20Bpz4FNfbKqJ/9MJC0sRGsyDQdlTYX8Ui
         VBUj9bL6hEUNryKOv3XQTFF8gtxU8T4tLcYzvwdoh20Vkl4cWfqMs3DEctnuF23aTOkx
         2bQRDQHDZyM1cS+sN/q3cfoZ/YqZ9kPsPVKol4GMq1/xMogiuReQFFjc+eY1+Vs8vDSM
         bEwHtYNwGf9XsAlmJv0ZAxLZnhBa6zKEYNoFZAFZ+3IQB/M9I0y96kLMjbMlsM4IJgUV
         2agCl0HCR+RFt60zGnv1FsPkdOiN5YB1T4Sl1nAGdaz3/INo3XlghET8JPspHiRzfZfB
         +EWQ==
X-Gm-Message-State: AOJu0Yyhmn7L+Wonyjj9JthSJKbKqzsltSo8vG6CVPqKSJN8yMgmhzWj
	+x7RutNMN0Gkd1/rdnvLWbQWBe4gPcCv7R3sS0xnvs0JDyR7riQBmKNKdBCdy31ab2CdRDBAhnQ
	E4LbiAXHHWRT8RtcLkgUw5StckHkwS20WkvzrFF0lMqqIiaaM6+D3PV48HA/7fw==
X-Gm-Gg: AZuq6aIKXVOgmItCQvh1m6MlJhllbqJ2pvKrvA2rdrZOJimO/4QMnBCkeXCtMU1+XpN
	MMiUGSv5GrrlXKuS9kvIktboHgzIHR1Lr1N4tOQI3NqGCGFV/mucnTGOrnlHq24FEvH602VqXPp
	c3FRcxAr1OEq/Ayea0QGGSDLdCNh+xM4Gkk55lBt9vdVTt9zm6K0M4P/jOkdEUD6woMQdp5iO/o
	KRlCq16Hc/eAtBro6mkb9X0B65E2pz7lt960YPceQn7/diu9P0lMCFmOvEKdJk3Y3I8BSPcWHU+
	XfEQU00ay8z9j4WGxosxF6Pt9SXb1g/uvfVbj6pG6CHk08QRqrzpYgh4naKejZ9Hz35DnyAGEkO
	T8JGI05kE
X-Received: by 2002:ac8:5fca:0:b0:4e7:2210:295f with SMTP id d75a77b69052e-502d84b0ca5mr87956941cf.13.1769036030754;
        Wed, 21 Jan 2026 14:53:50 -0800 (PST)
X-Received: by 2002:ac8:5fca:0:b0:4e7:2210:295f with SMTP id d75a77b69052e-502d84b0ca5mr87956771cf.13.1769036030338;
        Wed, 21 Jan 2026 14:53:50 -0800 (PST)
Received: from redhat.com ([2600:382:8125:73a8:e201:8ac3:bd7d:6acd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1f1abb9sm117138811cf.30.2026.01.21.14.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:53:49 -0800 (PST)
Date: Wed, 21 Jan 2026 17:53:44 -0500
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev,
	Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-actions@lists.infradead.org,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Michal Simek <michal.simek@amd.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 00/27] clk: remove deprecated API divider_round_rate()
 and friends
Message-ID: <aXFY-FxqeBv4BsHd@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Stephen,

On Thu, Jan 08, 2026 at 04:16:18PM -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.

I sent you a GIT PULL for what can go to Linus for the upcoming merge
window from this series:

https://lore.kernel.org/linux-clk/aXFYU324yQ6uBmk0@redhat.com/T/#u

Thanks,

Brian

