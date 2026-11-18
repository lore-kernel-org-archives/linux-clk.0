Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017028;
	b=K+NT9wPLO4D+eXU1y3yADssrmhMteWAH/zhllo/J5sp+sWYijADMJ9uT0bcJml4GKlCL
	 EgPjtNTmvh1E0gmk+Izv7coAyit5rj/rQk9pyj0O4Fd12W+s1PdH78XWYIDBHFgwcyOqf
	 iA4QrutRTlQ81jK53t6FTFz0qJIL8X+KVSho9l/wM6drVdAwTKnDfsR550cVe2V78znqF
	 fskZqKoJiQGaZJGwt7V90OZqhbbYZHXxIU8EM8w+Lo8I+8vKwsmZwWLgYwAYhPiUy3CIE
	 MkrjJZGKY8FSs5ocNPJraJy2Mof4siNGYkQwVF61issvSSPqOfRMNqIFcJfGrCwMwAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=4lLupD4z98CK9UrD3eQfsjdZUJgyZTecsH4A98HzZRA=;
	b=xgKdnIOBvQnvVhWgjECe4bIaBW8XPKBQOCxM/FZZyn87fMP4w2yKs/bJxA8GNI/K8VNi
	 IN0R+mM4pvq1N7PMAHzs+RIFpFs09A2KIAZ/RekeErwyZV5w/onnPaAMDAtdXBl0qmQUq
	 SShoq8LhxvjsdEQ5mKyc5ZGgAfpzHW4hPN3xYKjZju/jIAMqcRYFvym5kMAjSDoM0QGwq
	 rkmmVJiRYwmm5hgOruWvDp75FRjooe0sFap4823JOGlszuoPGCs1kD2qHJ0+UQq3Cn1gQ
	 EK9ZBzy0JaNbx80oq9VI7Zv6E6UI9uto9/yksPn7DnnRVwR2NgMWufg4xbl9yWNBoVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MSO35Hm6;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA2E606A325
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 15:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BA2E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MSO35Hm6
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3b094d5f1b4so228983a91.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 07:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795017028; x=1795621828; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4lLupD4z98CK9UrD3eQfsjdZUJgyZTecsH4A98HzZRA=;
        b=MSO35Hm6I/4kMAm6rw/yxcLf4rXYh1V8nShplW0798fPwvqCSiPt6Q6viUQuxOWdSa
         DyUQrEukZoLJ6rxQwsHQbvzI89LmfNKBmSjiwWbwXEHGbmhvAudUjl+7HahYcdqoE67W
         VB2ehkQHIxUfqpiD/4BlgAuK1gu1LrsWI7Ml1ahXovIaXVDUj5OMvIjAvFcc/XOG4iFt
         eH9VteH5wHSfuh7G3AayJU+egp6im8+fKsbpPe2uxVWftUhmK2dIJtsxDzVeP5hPU67D
         t1h5lsPSrR09qZErNDCpKhBFmtChIoTnhCdgYBkJcW4iYINPBhjETDS0Q7y08j9EJLcj
         5PRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017028; x=1795621828;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lLupD4z98CK9UrD3eQfsjdZUJgyZTecsH4A98HzZRA=;
        b=maATH/erB+HE4VHDtHVzB+fEMe58/wbXpjrUT7yKiZn5VlzvEW8FTtXWm/cN+l5cGl
         wiqLk64bU8MHKEOgModNZuxqxxg/vVYwvjFLNyXkIaoWP9qrhIUaXR9PCMU+Zz3+R9lc
         Kc/DaBA+ZoP3Ah0C1/OdBwsPhygXSdqxzoAjaOaEh7CFmznFKrY+1pOHn3yYHW2au8M+
         IFPLGZMZ6i2qSx/4FeWj+b1pZEmz9BctAO4EAQRC8IzoonBXgdMbG2dhCFrzF/WRhW/X
         z82bW4s0asr2ehgVzqxxq3ARMV36Qb3+4YC3hyTF2+n52GLXL/UnDneKwgeE5wZPQVyj
         xLlg==
X-Forwarded-Encrypted: i=1; AL+hErHomIUdvb6appVLiG175lBM1ckRSTD0/I13rPNnxQsNibLy224E3WKUFxVQqnBW3GRn6hVm4x58knY=@vger.kernel.org
X-Gm-Message-State: APuU4Z96hGDSaVdW+KYP9ozbShUHCGNTXVIB5hNcE1VxGenOXB03y7pi
	drzHTXfURPd0CJVyUv2s10XKq5pPKLooViIi8ExWLwzovLVsntMrbk4R
X-Gm-Gg: AZFdTZeSaeuKh+/bpmssLH+wubts5/iXyZxqxxzYQYZm7FcwToAV9k0yghSL7IQUfxF
	SY8+FKTGs0uPfPCP45mU7ieryqMLyztszXT9GtnM4EauIWDjB1pqcQLvil77EOsl57t27BopeDA
	aRSxFRFsbt+CUtpFFdkDiY2xX6eRupQkb3jfpIjQfrwCAgkT/yszDEuLnEYz4KpV24VjhWNRAuy
	j96HyQWSXjHOmjlJCMYmrZpJpTBVR58KYO6bXDF0KcstBECpEXzWBHWE1OXDUVDSpIO3Q9FFWR5
	+t9DZvidwfo2xot+6AVpGztEgcn4Vdg+8T/+NPaKgOlGwMkkhqL+ZquqOnaxv9SIPcjLgD5f6qN
	gLTHGxbj/DQ8o2PwrBI2ok2FRbdC3QVfaGR7X2V8ySjD4g3jr952bjbuz/AE3J1FKIlPyilPExU
	+pudiwM1t2dU9q6ZxrCNodKhKpDeuLz4LNTNKA3oL1J33U7cyGvi2rDkdQuc+J6cW2/K/+B/rkB
	N6jPyPOZDVdxJoY4G0d1GgfbaybAJ3wZCTnUlRx7nXrTdIaQK90M3fYmEUVkUIWY7M9skgctlku
	yVQ=
X-Received: by 2002:a17:90a:dfcf:b0:3ac:9d14:feb1 with SMTP id 98e67ed59e1d1-3b3d07c9ca5mr3201351a91.43.1795017027692;
        Wed, 18 Nov 2026 07:50:27 -0800 (PST)
Received: from localhost ([2403:2c80:6::107b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534ae0edsm193214a12.21.2026.11.18.07.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:50:27 -0800 (PST)
Date: Wed, 18 Nov 2026 23:50:21 +0800
Message-ID: <aee275aa2ebf093d8518e53c5d264064.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 11/17] drm/spacemit: add Saturn DPU DRM device driver
In-Reply-To: <e492222feabaa5c72229c93ce75f9500e4346da1.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-11-327d7910bf71@gmail.com>
 <e492222feabaa5c72229c93ce75f9500e4346da1.camel@icenowy.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Icenowy,

On Thu, 03 Sep 2026 20:07:32 +0800, Icenowy Zheng wrote:
> 在 2026-08-09日的 21:14 +0800，Cody Kang via B4 Relay写道：
> > From: Cody Kang <codykang.hk@gmail.com>
[...]
> > +	drm->mode_config.min_width = 1;
> > +	drm->mode_config.min_height = 1;
> > +	/* K3 user manual: each DPU scans out at most 3840x2160@60
> > */
> > +	drm->mode_config.max_width = 3840;
> > +	drm->mode_config.max_height = 2160;
>
> This is for the biggest possible framebuffer instead of the possible
> scanout pixel count.
>
> The width here should be based on the maximum allowed pitch of the
> display controller instead of the single-GPU maximum size, otherwise it
> won't be able to drive two 3840x2160 screens in a side-by-side
> configuration because this will create a 7680x2160 framebuffer.

Thanks for the review. Agreed; will fix in v3.

v3 will take max_width/max_height from what the RDMA registers can
address (a 16-bit byte stride and 16-bit image dimensions), and move
the 3840x2160 limit into the CRTC's mode_valid.

Cody
