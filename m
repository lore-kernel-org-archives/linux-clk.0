Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615610;
	b=5ceIQaAoG+8P3kLxfNBaGW+h6lST815i21qvoau+aVAe6g/DKNB54gz7edvUA8y6wZgW
	 XbXkDqctOvqAbs+dWS5W2PlYKOwugkHE6MMdOdncibWww5kHEB2XBsn+7m1vAgNasxT3/
	 9zYhFH1WnoRjfdM+U+zoYK9PzGb7cu+oa+Zcxx4CncGLny4wVrbWlwrOKSqZHshreICA/
	 +epr286C4i6hOJp8puZkQRPonQrsdmacYWddaJYX1xohOEIMUZEgWL1HH46FkDtnEVg39
	 nMIbmDwoOuZtCXJFA74Ar7iCZIn3nfQsZKQDLg4HET4SFFzyGpz16CHJsteHRiHuKdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=MP09FK8BKciK7H/NzSBFI5ee4XjfPiGr8z/17qMy3kI=;
	b=kuTVmuF9hLy8Nj4esczTC5BDZpva+5SWaUa/Fpj8a/bWgvK7rOqGGHQZE8xk3SuVo7Wa
	 D3y1QaeaLWGC4+1x/GpdwM1PxJLUE9/VSaXrC1E3aVX5y+D++LL890DS77HCtwSHN6NCf
	 V8mBbyqqqHRSEb+aYoLBTp5mdavgbX0OL3sarirLUMS6Giu3U0S8Y7x6nFnLOefvEJUuQ
	 bikwHEjl+fe6lKqhL09bMsfP8HoUCubKWzzcnarCvibLUEXdnr0S/o8/5RdRXDTTHg5Ok
	 6+W+5PCa3PqJncAuOd5jHO1kUTdAzC3q4VnB5JeB0CjVjDYswZpzjIQmJYmEekoPadA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVeMPU2L;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5105F606A326
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 14:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5105F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVeMPU2L
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-1397ad3d891so813027c88.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 06:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795615608; x=1796220408; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MP09FK8BKciK7H/NzSBFI5ee4XjfPiGr8z/17qMy3kI=;
        b=fVeMPU2LQflS9t5Hux2xZmBbd7AQUgCcFsHVsMBbyb1onFoxxv3rIAiSh8CTXacTz+
         mICIXq3wAe4SwVyPYoPXICZjy5J+0ufY/gVPITAUp1VduxA6gs5TKZ7ujaR+CNRDdVke
         qseDoHa6B02E4Al6EO6DimgZyCpiUI0Mp/xCUBDjxMHVjVSNkWK/TMndxsQyephR/Ami
         AgLrZbfaIMMJOnAFvi1fgUon/13tg7hzXIWWbeU1E6SM3hEDzj2mGRbFjpkx6oOBnpiw
         2U5MkOtkZrRf3aUiyMSho4m5cajyw7M7+d3xs+w6weTOoBLbjnXZPTGNbBb/jBVKN8Gv
         6JWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795615608; x=1796220408;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MP09FK8BKciK7H/NzSBFI5ee4XjfPiGr8z/17qMy3kI=;
        b=Ra5O2ZzhDYH50t9YCoBD2/yzJ9m2AWdC/B+lkc4SswnClUIpv60OdgjHWf4/jMxXrZ
         zAWJ/86C+WwIi3Q/0RZNSzlrYufFtDOFb6j+N9EZLCxOIDm+3Az73i9XE34inHyfiUey
         uEGf4D3SAoltenYTPQm5eK81vMCf6Zd49Y8zKb4HKvwrGKpILghwy9LrupXf4DrlAU4o
         paqu47mXAI/Dco5ZXQwVAhj/NjR6YAczQIz0a29bryPlnVzKKyAzwNwDTehwtm196q3o
         6C9XOAJMg4SDLQkt9zthIWHl0KaY0brhL7EzB3UktahYFQGJ/WEPch7gGQDk1hfIhL00
         wGNg==
X-Forwarded-Encrypted: i=1; AL+hErFaf54zhd+CoWRvAa69UK2AzJE+q7j375rMdu2pD4c1Qoq4Uk3b7RVFedJucGjwTUFZF0nEkV/kS+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q8GS4d7ZdTzHZfbtAdOkzI2TiMIlnFbDImhMPDlhhYQqrCjkd
	bjmA7OOpxvPpfGM25LY47ekdTwwf0IaFD/h5xG2el41x9dDuGChZBe38
X-Gm-Gg: AZFdTZfKZ+jO7xpfppwcIM0C+uaKreDIm4wYAAPhuhE/TA8aF5EVLZjTZ46uMXNw7/m
	9fgJgJeX+ub9Fl09GxdM6jZXjEtsibusk/aVcs8CXfHx55XLMkkURbNCzJ3fv5CvJ2KimesDtsi
	bUKpYfNlttDtpOrBj1XP641OULLrdaXYDdeYDRYYmdvDh5JwJdvK3jxNJuY226RE//x2q12Yu95
	O7EP9Xk7ZjBlcGu9T1XP2HiBMp7dgKPsd9yXWyYBeUfs+bR4m/mntQ7qPmk6ZyYAwCAzeUL9JIj
	74WBgj6zPIbyLM0tE62J/4VfUFi2+lrNjoDErzaTVEpwj8EWqVkkhbxrOdItdLqoSCEI3UqNCpB
	5ZVsE7nyuNbP+cuaV8tW/vSKdqDSIvVdXR9yjxm/EU5oAOTvF21OuAfJOUlXp0/BKmw5Y4Sorim
	J2eQr98cL0/bCoGQcgzyIJLPu4lZFzBvcvn+Q76yUWQziTfwfrTzyqCVOgtfDo8y0mnTGzjowvA
	Kz2QwodPYWsrxDS2DzLgynIEGE1YuZEj9wRCwa+msnVMcUJomlKTL8cS+oTkoz2awvoloRWVea4
	rpACQlvYNXIdjNm48AXMp4tSnIXpFo9Y7MTPoaIFbA==
X-Received: by 2002:a05:701a:844e:10b0:1b0:20:6444 with SMTP id a92af1059eb24-1b56e185990mr10444498c88.39.1795615608143;
        Wed, 25 Nov 2026 06:06:48 -0800 (PST)
Received: from localhost ([2604:a840:3:1e0::3003])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm61981028eec.26.2026.11.25.06.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:06:47 -0800 (PST)
Date: Wed, 25 Nov 2026 22:06:43 +0800
Message-ID: <eccf3f1e6dc94fbe847d112e8804c053.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: James Morris <jmorris@namei.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Sarah Emery <sarah.emery@canonical.com>, Ze Huang <ze.huang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 00/17] drm/spacemit: add SpacemiT K3 display support
In-Reply-To: <87eaeb2-b6e9-9198-b9cf-7e9f96bdcbc@namei.org>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <87eaeb2-b6e9-9198-b9cf-7e9f96bdcbc@namei.org>
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

Hi James,

On Tue, 24 Nov 2026 19:53:11 -0800, James Morris wrote:
> On Sat, 21 Nov 2026, Cody Kang via B4 Relay wrote:
>
> > This series adds display support for the SpacemiT K3 [2], a RISC-V SoC:
> > a new DRM driver, a new PHY driver and three new bindings.
>
>
> Tested-by: James Morris <jmorris@namei.org> # CoM260-IFX, DisplayPort
>
> Assisted by an LLM.
>
> v3 on v7.4-rc1 works on a SpacemiT K3 CoM260 IFX with an Acer EDB323QU
> (2560x1440, 144 Hz) on the DisplayPort connector. The DRM, DP and PHY
> drivers were built in, and Linux ran from an initramfs with
> clk_ignore_unused.

Thanks for testing v3. I will add your Tested-by in v4, on the PHY,
DRM driver, SoC device tree and CoM260-IFX patches.

> The board has the vendor U-Boot 2022.10 built on May 21 2026, not the
> uboot-for-k3-display-verify branch. That link in the cover letter
> returns 404 for me.

I will drop that link in v4.

[...]
> Two observations:
>
> 1. The HPD interrupt never fired. /proc/interrupts stayed at 0 for
>    cac88000.dp in both boots, also across the unplug and replug, when
>    the stream was running. The connector poll caught both.

Same on my CoM260-IFX: the count stays at 0, also across an unplug
and replug with the output on.

The external DP connector is polled on purpose. The interrupt needs
the pixel clock, so it cannot report a plug into an idle port, and the
bridge leaves out DRM_BRIDGE_OP_HPD there.

> 2. With the monitor asleep, nothing was displayed. It kept HPD high and
>    returned a generic 1920x1080 EDID. Link training passed at
>    2.7 Gbps x2, but the monitor stayed dark until I woke it by hand
>    and a later modeset retrained the link. The kernel got no event
>    when the monitor woke. I found no DP_SET_POWER write in the driver;
>    could the sink be left in D3?

Right, v3 never writes DP_SET_POWER. v4 will set the sink to D0
before link training.

Cody
