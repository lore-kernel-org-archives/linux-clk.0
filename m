Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.99.196.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578793;
	b=ofHRQLYse523hKR27g0iduTi1C12rpJJFimbj+/Q8Yu8xwIXjuidTUPMUpUYcaPP/k+c
	 3e5Cd8oQCRv/rBButJyd1Lklyr+v0Ml5MpjwC0vlb8155wtr+IoB5Emc19OPLP5SA3faB
	 gWepIcHk0LjoRsIXx3XAajQCftq4+hPKE8fzRjuqvoAS/85jnU9J97nroEy7FspTZUDii
	 TUXvZpBDRSG2hKdKu7uvbX/ygJBYgnKNvgoj2YGiZosVmKJY5Xn3yBnBMLByhsM4bbJJ0
	 Uy9CgojRUs4Efv6iAFHi+e/a43SSqMReGhFPnl1ajmop5OZIIBD7NoRXGFFEvnGvQdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578793;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Date:From:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=gpn0UCdoZZeC5B0l3wY/XpSaKvgOSjTK0REYdcoxBF4=;
	b=Sr2rWhjBrGHcIzSrA1xsff10+A73xZRBSvvT0HDpKTyHbSNVoht9hIJc+Fpi4SDFKUPJ
	 jM+63+JY4/bvt0k5tA0aBlVJ0Dko6K8ZG4NpXjk6aKPWUppbHqQR20yazJkIRycgt3XMS
	 9mdhRXW5B8l1I93lGY84PC1NX90ZPnbu61tsWemn2FtFLwNlAuKRH+fcifd4Sxw7qiJiV
	 c52ZlymwYSawF6YrF7wSro/nc1Vwx/G9EXsj23/hZvxr3WGh4CSVYuCWyp3q+ICCvtsiu
	 x/npVQBZ6meTPYpe8xozguLSXIj+95ZK0Be5uGl4OlrQk7L80HZFc7r5KluwNQ5cYVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=namei.org;
	spf=pass smtp.mailfrom=namei.org;
	dkim=pass header.d=namei.org header.i=@namei.org header.a=rsa-sha256 header.s=2 header.b=a3AeraWl;
	arc=none smtp.remote-ip=65.99.196.166
Received: from mail.namei.org (namei.org [65.99.196.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFD6606A321;
	Wed, 25 Nov 2026 03:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AFD6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=namei.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=namei.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=namei.org header.i=@namei.org header.a=rsa-sha256 header.s=2 header.b=a3AeraWl
Received: from localhost (localhost [127.0.0.1])
	by mail.namei.org (Postfix) with ESMTPS id 73F592FA;
	Wed, 25 Nov 2026 03:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.namei.org 73F592FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=namei.org; s=2;
	t=1795578791; bh=gpn0UCdoZZeC5B0l3wY/XpSaKvgOSjTK0REYdcoxBF4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=a3AeraWlEkmuoZtzUbJF8G20eVOhm2DteJPZL3L1bOGQ9DO5TMITBMCuGtxv1Lydh
	 7M8wg668sKPjnLtzsS9sDVgKfJPY7vUblJ39jCbNs5NCg5opFEvJbLxot19LSeCYqd
	 nca+i+o6iWgLl0x5++pzMMPda2h407h2YJEW+gYE=
Date: Tue, 24 Nov 2026 19:53:11 -0800 (PST)
From: James Morris <jmorris@namei.org>
To: codykang.hk@gmail.com
cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
    Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
    Maxime Ripard <mripard@kernel.org>, 
    Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
    Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
    Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
    Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>, 
    Michael Turquette <mturquette@baylibre.com>, 
    Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
    Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
    Guodong Xu <docular.xu@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
    Jerome Brunet <jbrunet+clk@baylibre.com>, 
    Sarah Emery <sarah.emery@canonical.com>, 
    Ze Huang <ze.huang@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
    Cody Kang <codykang@vsit.ai>, dri-devel@lists.freedesktop.org, 
    linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
    spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
    linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 00/17] drm/spacemit: add SpacemiT K3 display support
In-Reply-To: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
Message-ID: <87eaeb2-b6e9-9198-b9cf-7e9f96bdcbc@namei.org>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 21 Nov 2026, Cody Kang via B4 Relay wrote:

> This series adds display support for the SpacemiT K3 [2], a RISC-V SoC:
> a new DRM driver, a new PHY driver and three new bindings.


Tested-by: James Morris <jmorris@namei.org> # CoM260-IFX, DisplayPort

Assisted by an LLM.

v3 on v7.4-rc1 works on a SpacemiT K3 CoM260 IFX with an Acer EDB323QU
(2560x1440, 144 Hz) on the DisplayPort connector. The DRM, DP and PHY
drivers were built in, and Linux ran from an initramfs with
clk_ignore_unused.

The board has the vendor U-Boot 2022.10 built on May 21 2026, not the
uboot-for-k3-display-verify branch. That link in the cover letter
returns 404 for me.

What ran, over two boots:

- Probe: the DPU and the DP bridge bound and the fbdev console came up.
  The kernel log has no warning or error.
- Modes, with modetest: 2560x1440 at 60, 120 and 144 Hz, 1920x1080 at
  60 and 120 Hz, 1280x1024, 1280x720, 1024x768 and 640x480. The picture
  was clean in every mode I watched, including 2560x1440 at 60 and
  144 Hz.
- Link training: all 22 logged attempts passed at the first
  configuration tried: 1.62 Gbps x2, 2.7 Gbps x1, x2 and x4, and
  5.4 Gbps x4.
- Page flips, with modetest -v: 60.00 Hz at 1920x1080, and 144.00 Hz
  and 59.95 Hz at 2560x1440. An atomic plane flip held 59.95 Hz for
  80 s.
- DPMS: the fbdev console blanked and returned in eight cycles. I
  watched three; the link retrained and the picture came back each
  time.
- Hot-plug: I unplugged and replugged the cable with 2560x1440 active.
  The connector status followed and the picture came back.

Two observations:

1. The HPD interrupt never fired. /proc/interrupts stayed at 0 for
   cac88000.dp in both boots, also across the unplug and replug, when
   the stream was running. The connector poll caught both.

2. With the monitor asleep, nothing was displayed. It kept HPD high and
   returned a generic 1920x1080 EDID. Link training passed at
   2.7 Gbps x2, but the monitor stayed dark until I woke it by hand
   and a later modeset retrained the link. The kernel got no event
   when the monitor woke. I found no DP_SET_POWER write in the driver;
   could the sink be left in D3?



-- 
James Morris
<jmorris@namei.org>

