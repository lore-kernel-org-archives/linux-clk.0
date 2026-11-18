Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016953;
	b=x4RI2kzlTjPjIjLuYzkRo3/sUPN8O05vNIdgkWiMOH9qLN9LLWVT6rBV9NGvsWuraejO
	 FayTdzIfe9FNzAM/2TtKRQPGHfz6fZCoitgNqcFIPPQamEQGmVoWohDeReKc5eRPYGJs9
	 5l0WYe4eEzXXYqRxjw8OyVoQbNjNkspU4tAQnb/7vCT2fFyvqDiTv3STxsTWMBOAhNfal
	 ZgntJCKP554ETc25h2EBFzEZuav/psaHImLnGJbQm0fyEKk9XSzlVsvCoAFyNZi6ACgAo
	 c65RBXsnJvGTiSW23gBg4nEYtNvXb6PfhvQc9e0Ndo4HrRte0G47FQh5htQOy6J2Bfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=cer8YfO6jgJ8rX/jlVTUPHJd3RGw4HKBsstgFxqYGYA=;
	b=hDnlXEXidj9lO1hd2fEZwS03P8iFRvJpSHA7tTXzHWJ0Pxxm8SwqtixHZAiOvTSKbDbp
	 xNYMzvttMrYB2l8QAhBilsPGNiNbPRiCQtLKkxm17p1oUVLe+yNWevqF2wm7/IHPVPFmY
	 Nu60nla0QshSyyw9Fu8wmEKDp7xGwHT+cZ1akuvquPX/j6MXOrOph4y1EbkTQftaCFE/P
	 6TRDdPqdCBnxJCVjnD8zn6iEzQ+u0lZBXbMYpZyUmxA5ifodrdtD9m8H13aYct1l+iWOB
	 wiIVwhxpe40FV+fChEQGQm2qL2hMNDZCSuUEbKaUbMlJ6yGe1t7yMfocQG+G+rPjOPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ypGDTFJV;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089DF606A337
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 15:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 089DF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ypGDTFJV
Received: by mail-pj2-f11.google.com with SMTP id d9443c01a7336-2ea993271f2so3114475ad.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 07:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795016952; x=1795621752; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cer8YfO6jgJ8rX/jlVTUPHJd3RGw4HKBsstgFxqYGYA=;
        b=ypGDTFJVbxylofrs7RPLtLRc+FST4V+oVKo6JjaYkTo2SZwK/1/t7hQq+hoGa0E0M9
         ira0rz4fUFlP/11ZukY6PdKsJGNIHGFSNKTnyMwGyIRUYpdjmCDun9yrsZOOmxyNJ7A4
         mWf8cFYeCvso0ggjDvnSaGm6LkHSa/zZhaIB8UCWcOSiO/ZqP8ZUeCHWqje+I/Oz93qr
         i9zWR9IrnK8zUAsTiP/DT+5Obv9xGaAbt3lf34ZJ2Te/Tv0Wujfkt5Q6dEEcn5sUR7xB
         mf1c1PH0a3QLvm0hFIpUx4yPYUE/q33sRgG5293/ASc/kBcq+0uCL3YELc17ADVzBqwT
         2gLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016952; x=1795621752;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cer8YfO6jgJ8rX/jlVTUPHJd3RGw4HKBsstgFxqYGYA=;
        b=f+o4VlTNWrFXj3f3+QU8ljTIYpFYMVdvmkuj4Qq+TAe91c56u9/PKoIETSwoQQyrGa
         vr0PQjUrsUeivZ+uMZd1KctPoOcxMtxnXpCkyyKiqe3tabaF6K+tRlzvlJqbLe7y6p49
         iPxR0vLjmN8zhWoPeTQDD5dqNcQdlmiaNv+pqJVIHw+z8g4nCltU2kZ1QMzMvS6JsGMW
         uQfjnY8BbgDnAdOUMpk2ASdD9WOiZh7uccfZkk5v/g760G9Ou7JUaf3gDn2t0XZm0MnS
         VRRa8hUperKdYNep18EPfepjX3nQaRfrq+5LHWarkZMahLB4t2QqLCiPm8bXvBDVoOKj
         lESA==
X-Forwarded-Encrypted: i=1; AL+hErEgsYaLIwXqdXUCfybjjhlv31QdlBKerMGS61T+c/23Q0DZ9yi1JVrTVpLhRvAO5Cwndi23A/WS/t0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WKrzEdxPGMpLmnjfJnLErlpg2obw/iEmY2iC6KlImRiNLbs0b
	Ta4ttR9gLswziEuIlZ0Z5lxPhYpC2BAAZCgz2zLNyOsbqY5asoOt/iEB
X-Gm-Gg: AYBFou39TNDGaskDfdiS6P39rMl3MelrEqYe94bIav7FjihYX2mQnKaohu3BgyMSRoK
	c3mIaWN8/UumuAD5tTeTy6ofXA6wv/EqDTv+oYRUA2M3zD2ZXTtGlAvR0PsfAqSTKuu7PU+Ymer
	cIaWGO5fLagPdrUtE/whpKwSf0bvSSNEWI6imXx4SV3gh7nPFnv9/WSeZ4dHmpP4TNq1CoNsLS/
	GKn7JRfrGWsHC/X8EwTpb0O7M7tHEOw6pnpeysCrX8bJviDVz50AswzYOcu6gRWi6JXb7MIgmfB
	RjKrDd8vBmvSPnrmlDTswS++Thjm6vfd63lmAETAENhAGO3HdikXXISPTtun3Wc8rgEdz/M8jTV
	V1hPSP5ikglmKQb0Gv6mXiSrX++8Fk22H/wy2fQ5BjdvAjGJhSVFU79X0B5NJ5iaLJepcYhZQel
	0WP65nNULVCjAz402apDj3lmj3CSV666RwTJ7F+2nQYBkIWzK/aPJQ833H4SVhgT5KxRsEkeeK5
	gEm//YCKoryzAgYiEOFDZ2UgKkO7uFPLIk9LImmGJmnRk7hJDBfaaDOLEYHW+SgmQs8+kv7aBaU
	XCo=
X-Received: by 2002:a05:6a21:6e0c:b0:3e1:bb35:476c with SMTP id adf61e73a8af0-3fe8bdd7c38mr2965829637.72.1795016951931;
        Wed, 18 Nov 2026 07:49:11 -0800 (PST)
Received: from localhost ([2403:2c80:6::107b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c6660c2e4csm1055183b3a.22.2026.11.18.07.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:49:11 -0800 (PST)
Date: Wed, 18 Nov 2026 23:49:05 +0800
Message-ID: <e4eb5f5b7ed8b3b6bf47d709e4344e0a.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>, Guodong Xu <docular.xu@gmail.com>
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
 dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 15/17] riscv: dts: spacemit: k3-pico-itx: enable the
 DisplayPort output
In-Reply-To: <9d97d5dbcc619a9c52904ff8c6704a91fe8351e7.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-15-327d7910bf71@gmail.com>
 <576146d4f2752c3c3f6ec6c42812cb9956406383.camel@icenowy.me>
 <f4b8c87eb0676500661ebea67363ac27.docular.xu@gmail.com>
 <9d97d5dbcc619a9c52904ff8c6704a91fe8351e7.camel@icenowy.me>
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

Hi Icenowy, Guodong,

On Wed, 18 Nov 2026 14:25:38 +0800, Icenowy Zheng wrote:
> 在 2026-11-17二的 15:51 -0500，Guodong Xu写道：
> > On Thu, 03 Sep 2026 20:09:42 +0800, Icenowy Zheng wrote:
> > > The connector available on the Pico-ITX mainboard isn't a
> > > DisplayPort
> > > port -- it's a USB Type-C port instead.
> >
> > Right, it is a Type-C receptacle, and the commit message should say
> > so.

Agreed; v3 will say Type-C receptacle in the commit message.

> > > I think you need to model the Type-C port and alt functions of it.
> >
> > I am not sure that can be done on this board. The redriver/mux in
> > front of the receptacle and the PD controller that steers it both
> > sit on the EC's own I2C bus, and their interrupt goes to the EC too.
> > The SoC has no bus to either chip; all it gets from that side is the
> > DP1 HPD line.
>
> The ChromeOS EC firmware exposes some control for a Type-C port, you
> can search for `google,cros-ec-typec` and `google,extcon-usbc-cros-ec`
> compatible string in arch/arm64/boot/dts for more details.
>
> Although the K3 Pico ITX hardware connects the EC to the SoC with some
> not-so-embedded interface (eSPI), which needs to be handled first.

Thanks for the pointers, and thanks both for the review. With that, I
think in v3 I will leave the dp1_out endpoint unconnected, as it is in
v2. Let me know if you disagree.

Cody
