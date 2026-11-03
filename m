Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793671600;
	b=1llEm/wTelz049APFj87aAXRD+bvGwg4oLECeZ/wAyv8XuHEETUu9fE19E4nDSmmCH5o
	 V+b8XiVomB+49S2dAWcKuA5NPtGTCEm1Yzkx7sR2eqh+yCtFXxp+ZpPaeGODXgIQqDHFx
	 LoN2S2s9cSm86oeKouAD96KFFBAoCPTjdZcQs175fNsoXK/mQc5KfL40NucO2EW1YKELz
	 rpjIwTcZiP4adbM4Dp8Uchan6YtaNFoxwfR45hpY4RkeKX2d3D3RePBw8VZkk1YG5yRkp
	 9nN+IekX55WF5T7oExriLSQN0s21KiXtYeIBSRseTII3/4rAfdc7jXFYHaNpCiwjXpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793671600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7edVmlDXqBmOKChW+ZBxMZA1iVKu3C6UNjM+2ZNf5wM=;
	b=Xzru/9QCCRkiPuggILnbsuRD+BvQtQtSa/CebczBsWEGMMQZCUjTS0rUmw5/blWFSsoA
	 vfBsdWHZ23UlYQDUqiHp1jpfrF5zEJ9OaV9+tPqa6yby8HoQL0JWvWLFwS1TaY+CcEvLX
	 Pz2g/mv0sJF282s4uFDyS5G689zeWRtJrGX1bDk4h9Ubn+01R4z3AFnt0oyB7s8+iFlgF
	 CAIUu8Pfmz6LU37GmmO/6b6qf+sXVnP+yMaku6WfGQnhU+hAmM4+HErGTlj/gP52M/IyE
	 d6mAxzMImUNs2EfCFC0x4G1BTkqe0ZJ19LeKDAjoyVg3b32WG4G5D/gMK11L4r8AnQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mAQ0+p5l;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105A9606D80D
	for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2026 02:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 105A9606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mAQ0+p5l
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-353804b591eso6476253eec.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 18:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793671599; x=1794276399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7edVmlDXqBmOKChW+ZBxMZA1iVKu3C6UNjM+2ZNf5wM=;
        b=mAQ0+p5lGe83v747xCyqCS4N8Akjbdkj3F4Iz2/8iImspy/v52+UuU1pE1/Bf6MR50
         E2qDfWgV7bzTU9JYVsGuVRf/bSzdw7SGqRzm0piGjvkzs5eN3BDwZTqZ3vUQsCyWwqzT
         eKkyuVd25qAhw0WgVLwLZD9VIBXnP3Zi75qdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793671599; x=1794276399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7edVmlDXqBmOKChW+ZBxMZA1iVKu3C6UNjM+2ZNf5wM=;
        b=jJdUxVcS01ga6V9+bb3lHOxakwzyw5UbdkWVGVST5IxQ/QNiUEr14IXW0QBa5zbcv1
         3zcjlmEemfkPhoNlFVgsz5dFN58zzgtL/wRLDl+hCR3NqAJ/WPcTBFRpau2EdJFS30NN
         EV6dLEc79Y02sD5ooTGdPSQrjgy4C4XlPYg012f1Z6JU0PwAj/ajLl6yaVq1fZZkq6mW
         IhYh4ZoVJNg+joqiiwll4u8r2iEe8Oh3vlEAszr4vDRwU2eZ2Nprm6DYQX8+MRiX61vb
         nOh2j0bjbfsvTfmn/Bh0SpleM+vWKr3VnOZK64TffdrKPJHnwxHiRoT34E8/C6I9eM9N
         K1qQ==
X-Forwarded-Encrypted: i=1; AKwUvByCf4pvLknVfspEaZSsBOm8xIwjpYFcfkZMhGkSOCuVCOkZlaaQyhqAba62DCv8SLTR2Af9ITYYL0Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIU4s0LMfbJGbBg2ErSwZ9IOpeWb3d/81ra2hBeQh7fzy087wti
	edeHZK8rqv3bxuu7OygraKTg37dIw1SXTSAFONoKV27vJ0K71cusCtOdNT3ingIj5h75iHJnWvf
	EOe0=
X-Gm-Gg: AYBFou1VlHU2Uqmohgz2PY+ntZBUF836iAJ648+sr9QGbd84kGcAtfdDBUmM+U6qWWf
	zSw/vZ6j6JL9KipM0nAmPtXHvvNcU6zxsdddXBxjPelLk80Y/jN+3+CitUNre6GvdlfXdP6DcGe
	xpe2+lRKYWUUWkgpI39XYhrBpVJrtQphMoWIqX1v04xZzTGpH+vROsirIo4UgfD8vzYDiPaKzWA
	K/c4r4vVaLZf0+8PPn/OTIBxZIILcXdBAfgE4sD8jOTsslCPpF3piUO1o1OPpSiFsRLZUPX9+e4
	oVkyWFiogUo5gz2Yo9NB3ADWBfAqDisa5XDyZfqVub+wFfABsC+UIo/ADGhpiYn7SfVgNhX2yZT
	wnVhUKYgn8dR2r1kySJ5CGn1LB/wlocwVVFDtpfwoJ0/YznifG8P0O8kqhD/vm82RvFywj5rfnV
	/nE7KA71VN0lXIcaaPsbMfATvh3Ijq/IGz62HB2Eoxsa8KwH8TLWtpo0sC8beWZ1PgrlZhrtKeO
	0BzX6ZDzEs01VVGn2z9EoT/UjsarQPpZQ/7qSyrAzOSrC9vS4Kn+iYZy8bpa9yeOBlMmsSyOERy
	3zDGwH7tu31IE/lyp489GpB2uZJxgpUMHaZ1zQi1Ga/ZzYH3bYhKweOXBmDCSupRgt4=
X-Received: by 2002:a05:7023:a56:20b0:1b2:3742:828e with SMTP id a92af1059eb24-1b23742830emr3971156c88.3.1793671599060;
        Mon, 02 Nov 2026 18:06:39 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:c57d:c93d:3543:aab5])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1ac19f4a04esm37837284c88.15.2026.11.02.18.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 18:06:38 -0800 (PST)
Date: Mon, 2 Nov 2026 18:06:36 -0800
From: Brian Norris <briannorris@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 0/9] google: Add support for Laguna CPM
Message-ID: <aulBrFWi54E6a7Br@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261028-armored-glistening-cheetah-6f3070@quoll>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-armored-glistening-cheetah-6f3070@quoll>

On Wed, Oct 28, 2026 at 02:24:35PM +0100, Krzysztof Kozlowski wrote:
> Either you expect review or not. RFC means no.

OK, PATCH.

> If that's patch, then at
> the top level of cover letter, as the most important thing, you explain
> the dependency and merging proposal of this.

OK, I'll try to move it up. To be fair though, every change that has any
dependency is clearly noted in its below-the-fold notes.

> You combined here like 5
> different subsystens...

What do you recommend here? I believe the general principles of DT
binding development suggest there should be a single binding doc for
describing the "Central Power Manager" (and the services it supports).
CPM supports functionality covered by many subsystems.

While in theory, bindings can be written without corresponding software
support (drivers), in practice it usually works out better to develop
them together, to prove that the binding describes the hardware/firmware
sufficiently.

And even if the binding goes separately, I don't think I can 100% split
the driver support by subsystem, as they all require the same underlying
CPM helpers, and those helpers don't have much meaning without their
clients. So some multi-subsystem work is still necessary IMO.

So I don't really see how I can address your complaint. But I'm open to
your ideas.

Brian
