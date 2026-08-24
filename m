Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1CB33C195
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584561; cv=none; b=TpkA5ffi90c1cr/FckwSEZ+9ANp3AJ35+z4dbwvnHtzBhUVtsL0gkRRjP25S9FBXrOd0PAgnzwMT+FelF1BZCmxSckK+0fQtpJGu9SF19mgdwILBQz/N9g4EdEXrLzGfIRZbUmOrAW4xEbsunNNBGGARWsU/IH8Q/zNnZbLuy6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584561; c=relaxed/simple;
	bh=1qUsgZ8wbphGCdO7fA4r2wXYfPVuzJaLibcePC1Gy4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mqy+dgSeakXilRABns1JgOnggf2PzhwrmWJrDBnIu2yasVdICgwNMbJgF8F3Fb92kDJJ/wMAJJz1xoEsSdSHd96GFZHcU44bsGfsvb1bSIImHNBGXU5d3DpGjnEG6uzOblVlYw/8l45q/38MgzDDIdSLqXHHPWthKCJDj/0i9iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bFpSLd6m; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bf88Wg03; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bFpSLd6m";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bf88Wg03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EKvGLa80ZT9txpe0vw2U1X8sS6g8NCFrqzM4G1SwujA=;
	b=bFpSLd6maPmTcly4ZfaG/kwOWseEZF2aAcYa6zpkqpiLt3PKxtJJdVzafAkMJEFmQRPrnA
	SH8vmBA0ocxeoJkxQLXJtkycItCB0qvPZT6OnyicfwwQC0MY7myZdBPCNccbIFFQJPyHvF
	de0EnQKfZab85cgtoToyBo5YP/x02+E=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-2w20ka-PNdqvgkQIQ9tjHw-1; Mon, 24 Aug 2026 11:15:57 -0400
X-MC-Unique: 2w20ka-PNdqvgkQIQ9tjHw-1
X-Mimecast-MFC-AGG-ID: 2w20ka-PNdqvgkQIQ9tjHw_1787584557
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-907ca5abf1bso20602456d6.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787584557; x=1788189357; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EKvGLa80ZT9txpe0vw2U1X8sS6g8NCFrqzM4G1SwujA=;
        b=bf88Wg039DDYOxNLadJkq47VhI0H5C7Xt/yyBQRe9A9LdHfYS5CW6TtvGoF9141Ble
         63FAxzI3C48g6rZCN7ksU7kGyITnmJ5aDXbkeiEGijwWOagvOSVvt0EtOylJ5e1C6mpN
         giUcuVEGaZ1mX0d1d6xKeK+mZs1YbBYI9nSEctR4Yl8fHm4XSC48f50LXsEApwHTB8Da
         5joy4YCBax53J+jnJbt3fozPR+XdOE1Y+tV9WYf+cMCQJNFyWRqyHvzstR+m2nDlmso5
         rW+wN0wHxuvpT5B/t/d1KPmpbxLZiPkEWs3xZQnWOjOmo13qYP3G1d6Bj07enC36srcT
         wxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584557; x=1788189357;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EKvGLa80ZT9txpe0vw2U1X8sS6g8NCFrqzM4G1SwujA=;
        b=lmIOKxCyvhKdr3DUd31jzfyPX+Kq//BmQrqjxKX0lqnLWC05arwKTl+fH7oTWyhnw6
         nK72qM6a7b3jdmiMGAtXc6mXbOgdv3FZr5CAS+M04X6OVA0tepHpuZY+bMp3zOiZ0+sd
         M+/ObsSTQMLm5ElIHvuhDT6aVZkymwp034YF7prKFxbmrMbJr16JkFZehWZmcfqPmvds
         uGqGwibZ6PqhRT5k8+u/tD+N4UnK/FaB4VUY09AAXJTetOEtB9s2k1qrQOOx8uVSil2W
         w9tByIX0QQTJsaIcixdifkC2bZICTjqYvB5Xfoy8Sb8slU2ABmedoPsqQLfPcqRVoN22
         q9Vw==
X-Forwarded-Encrypted: i=1; AHgh+RrOXi/xr3URNRbIKfZxD1aIn5EhiNrh2oysmbxO2qOu/eSE4R8wt/OP5RzBVClLKolX6y3ttAHrxXY=@vger.kernel.org
X-Gm-Message-State: AFuF++lShjEtg6+Z4qlwwnWTl8oVMVZbusf7gN7kGacIJzpmTOyYwXhA
	elizbhhVPqUxS7G/vtAiFIBw93bbzxe50rf1w+OxRpmwRPJnIpJE5TIvqRbGySLPI+aR4kg/fuV
	1JkQVGm7/RUcNhrlhEA+uMqKYWMDQ5QrlMMxZShlxkgJbgDC15u90ZvnkhNcGyCuBvpo1Oi++
X-Gm-Gg: AR+sD13+S3DBMgjkkh4wyMFL8gXxIS9C0FlIbDXnM4xesPYYiPfHXu4N4EnWS0kFfti
	xn2GNarlsNVdzWu+eahThbYaTjOjukLTmiCjcEoE0ct6Dh8X/TZ+HelQl3h7CtWZWOgEFupda0a
	eyYaUoZ8QtjH5O5QhYfUM8AO1y8f9hfL6Ah2XM8m5P0r+1HvkAFPmvfiUe/h8C3PkldYC5sptv5
	pFahId99bSuzWF9oIrq4fzzTcP0wiTmXAEet/vLYsjUP9aNNZV7RG6fBkxsxAsKam/GggTvslt5
	SEnhl/zZMmIXlkatjOymY0UZkrg1WMwX+LzClwA14VIbvQjlNEwhoyFkebj904rdI93//QlKW8p
	lmoeuKB6tVqyT3A9dPQZcJ16z/NDjCXiolGg=
X-Received: by 2002:a05:6214:3c99:b0:907:5150:a2dd with SMTP id 6a1803df08f44-90c80de23camr297867466d6.14.1787584556588;
        Mon, 24 Aug 2026 08:15:56 -0700 (PDT)
X-Received: by 2002:a05:6214:3c99:b0:907:5150:a2dd with SMTP id 6a1803df08f44-90c80de23camr297866236d6.14.1787584556058;
        Mon, 24 Aug 2026 08:15:56 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c939314d2sm64503026d6.25.2026.08.24.08.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:15:55 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:15:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/sun4i: Make sure clk_init_data is fully
 initialized
Message-ID: <aoxgKneyW6uUtrVs@redhat.com>
References: <cover.1787239944.git.geert+renesas@glider.be>
 <0f37278d04c02461e17f42032a379dccfb773171.1787239944.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f37278d04c02461e17f42032a379dccfb773171.1787239944.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 12:03:02PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

