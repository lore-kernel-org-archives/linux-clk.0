Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124338;
	b=GdRQmzXiVVOprhTRjkY1Ux90hYgMFNcHY53BAUedUWeGc/UjaxJdjAVmbmyWB6S7rC+4
	 VpFNMMeglIDdm+VNpxy0SpUdVblwTQa1kR1nOHEgoe/YbZqlQ7myJ0dq7fhNSHdC3W6fE
	 1XYC139iHkHxDs70yGcwtCDpKNBBRLYyB/ChjCVc4oEGPpMDgq052X9YOvTnAK22+T9xf
	 5B8BCJwMvSwuFJCwhU4mdcaumuPbQANJFqj7crRheETk/lQeu/pByTO9FpM5+wCnOw6Qc
	 g8MgEJWsqMehcbj/LHVZ1R7WIw54C0MuY9xuY4FLTc2f/x3SjsrAa0SIzmjIe+lJxkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=kZCnjg9SNOEIBkstvPO0BHnnQE09Drv6532P18ADAkU=;
	b=1lM7mtRleLER95Og3gboYGunFYxc0CKUesuHgOepGevnToW1Mf4ui/46dzVgOLD7dnfn
	 GicYpZWS+SLLeJL7GEg6WwYjxeJp0r0aCEyERFugUW91pApoV1tSe/YXRu7Ae+k3DR6o1
	 3Tf+EOcSJWismQ+nmoWSXYSbkwD70p82o2WhaNbGlzEnq+mkpcBcjzrDJIcqfMChNpUcj
	 1TZi+1cWDZ4vhRBGDUaYPBWTxcKVzMwUVomyMtN9SG2YNmmAtUmx6khtFt2b3/sAo6O1Y
	 1G8grWGNsGdZDaM15iNeZHzIV2V/pWk0oeG+qkc3gYU6IgX2ZIe7vdz26NZH3inSE2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyiTt0Wl;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BCB60A2606
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 21:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33BCB60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyiTt0Wl
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b51389f58cso2630107b3.3
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 13:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795124337; x=1795729137; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kZCnjg9SNOEIBkstvPO0BHnnQE09Drv6532P18ADAkU=;
        b=oyiTt0WlsE/V9D5hUQXI608VV5yECoIwBcFPiIx2eeFBJ3YWZeyoL5guMklQc5hlik
         ZcxuF7J7ibR7FrDfwlg2hPem3bjlTBY/us13BV0ah6NZNOHDDDgPGNMAoIjmBcRTbB93
         Rg+/+tzF8PjUxGMDMn+RXK6rRtfxBrH2/ijOUDvfiJDhJKdK7VE/i6GDMsnZ+OzPs/v8
         e0+xsvjtPScOV+jOBisrqNbz45YXgrnX2hkYbi3wW2EfHTF23zAvo+LVrQGfzcXoD8dS
         jNaM0H/aya5hSf6JQDujLE2cDMUl2/13tpxg2CJUUbrq3IfhPNe5mogv/YlUY6iGBYsH
         CQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795124337; x=1795729137;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZCnjg9SNOEIBkstvPO0BHnnQE09Drv6532P18ADAkU=;
        b=XdXY3fjiqG7pvWZZRBo/KM54F9jzOnpoW/S/5PRObgUTQIlU6ffoNUbGsDXeSNsjNs
         60XUcOvAsR3aFotjC5AivkcYzhqPPL8i1lztw8nb6xW6OHZBaNn5VPE53qpgGodhRPzw
         LEkY/PLyEhnZsmJcOys3HqjNjj0kuMpG836Rz5K6fwgK2H+CNsugCY1oev8z6Ha2KXyy
         LwdSwndZiSaLcHRIuvz+W8Ku2sMDL+WEfYlZJgng6fI4O7afj1biP9v/zHPEXTUPY61d
         vgS4xc8sZSMbs32zEEGGUvTzDaln+GlIBhSMuVsMQLpaTZb3phLwl4SeXLFktNeXkYhJ
         nrXg==
X-Forwarded-Encrypted: i=1; AL+hErFrVxTcaePa5eQ5AK1XALvvHe+hNpRpalfIQviMenUSUpzmtkcedinzl3KnucwxFkG7OX0SK8G/vSM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nOY/zG8tyKBEJ//QvzyU0wFzkhaXGNMmhPYM2V9n5aLlRYt4T
	8E1BVq22G+w2ejuSsedoEdkCjqeXXJa5YtXuB23ToTINQzCrw0gUSEL+
X-Gm-Gg: AZFdTZe3A9o6C5Tpio7gf5Z3WqjQqEprkjgkjNwImwfmlglnIie2qJBFHlBVRzeHS40
	dMOgzLqiDDhG1IJwLjhZI/yu5YQFSDHijd/p+wzGqFGwFWqnzwqkqpFrrm6gTTnvA+XQJyYL2PN
	bDIFSltZDOpVSIbFQI7N+9DiLfrrQDQAXSfynB169knMrDdO5Z2XXbkcIhY84oJgwGIr9jqpMD+
	L9n/AZPzNJ0itPRwaHB3CvnZMdVTQsEDfNKLm8eZk+PDa1G4cBkdSiHuXkHhdME45OwMK2vUvRt
	vdmYZTOz0pu6oVVfJ74S74DD9ZnQSwzPEHCkGXaCG8daG3FU+94pW521Ty4vZS/tf5V1nLkrq1S
	K7qS6y6kO4sjbbTWYFUybTGOIOBGOtnKrJlZwiIRmTPrLCTtc6brlPIYXcIvLerwh4y//pI0Djk
	zxwLjD7xCaXckj4+1AdiQCHMgL9bRX131ct8NqwA9Yt2qjNXMYaR4kLnaMcrVyRWxYOyC67+FzI
	c/tYLhuKBA/CAnZ48M2bvBE/8IaD22cxvf6SPaNOAj1VifE9ywmqfMVEm1JCJ2rpKFmgxV2HcF/
	CCLGWlnanHWsMRPGeNKKkVZD
X-Received: by 2002:a05:690c:c9e:b0:8b0:95a7:37e2 with SMTP id 00721157ae682-8b5204ebe00mr4585427b3.80.1795124336861;
        Thu, 19 Nov 2026 13:38:56 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33b7502sm663093d50.20.2026.11.19.13.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:38:56 -0800 (PST)
Date: Thu, 19 Nov 2026 16:38:52 -0500
Message-ID: <7072ab495239e6bd28e2e9ed75244e24.docular.xu@gmail.com>
From: Guodong Xu <docular.xu@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Cody Kang <codykang.hk@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
 dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 07/17] drm/spacemit: add Saturn DPU register model
In-Reply-To: <bffbf989f2c99aa8c463719347930aca44962615.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-7-327d7910bf71@gmail.com>
 <edd7ae1b38ebc687d0b2bfb2509c40fb8a45e625.camel@icenowy.me>
 <19ceb44df3141049a955c2c30fe64766.docular.xu@gmail.com>
 <bffbf989f2c99aa8c463719347930aca44962615.camel@icenowy.me>
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

On Wed, 18 Nov 2026 18:18:11 +0800, Icenowy Zheng wrote:
> 在 2026-11-17二的 16:48 -0500，Guodong Xu写道：
> > For example, the blocks sit at different addresses, and most fields
> > are at a different word or bit. In dpu_int.h, CFG_RDY_CLR is bit 4 on
> > the K1 and bit 5 on the K3, and the underrun bit is 9 and 8.
>
> Yes, this IP weirdly doesn't consider register map compatiblity at all.

Exactly.

> > IMHO a K1 port should add its own compatible, its own field header
>
> Well I don't think field headers would work for a mainlined driver;
> maybe things like regmap_field could be used to mitigate the
> difference.

Fair point, but maybe that can be done when the K1 is added. For now,
in this series, let's make sure the field header and its users are
self-contained, so that K1 support is easier to add later.

Guodong
