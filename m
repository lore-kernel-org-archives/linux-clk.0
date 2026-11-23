Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433167;
	b=DAsRr/HDI7vDVjb2wOQWa+xca8a476GMU4KvbDVDdlbCZmYV3CuoyArwRDTsVNMVJJF0
	 fUVoQnqgJ1rxP+CuAM969PWjyz0cWXcK0qcBeD8F4M7bFtNipi/oZMXSxmn1vWcYfzlFW
	 Yn4iy9M7k1Nk3bSxmLKYfv7xDckTRmyirrWA0NRBHLHTzbbAHRycGKct2rZtLCj33dnES
	 n6UfSPVvVli9Uv0MmvdXzJuQ6AiGhFk64c7NzDRcEhvtqqOhxOcvjqOHI3DhdiowabsnX
	 +71EkZyABUEE5dvr9Mg77pEVA8bKnuVVFaEoU68cYI+ABXeGQhyAdOI+fA3Go4l9aDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Io7ujKNNt7SQhbgiNtNsmPHGRtWoUuLSgdS1AFaBjnc=;
	b=NqkUwvLfmwu84gE/HzpwgEo+nGJZjSt8QOXQ2Q/TSsYbI6cbCn3VGJUmOkyTPknMxGH5
	 M3zL0WFrmFD1Dh8zuwZ+at2CD59m6gTH+umef/QLZ/u1/aiIZ1ECdtRf0qF4FuDaaFZ9X
	 3sFex8FkGnM57t4YqDjb0whhKFiX3snpvPPtIhG72VtBmilngDbxf54BQMQYulhXsJAGL
	 xSzbUSTkgDvqQe39X7dTdhORCng3ZszzffcMC8ZHGQcmS5k7SQw7H/3dGBRiYOKCr5rd7
	 r2GH3FBOoDsFrDwWGplhQSz+U+cv0WvcCp5qcKX00V44aOhRE27Kv9lcVRdUTVCd0cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DmuyGlSV;
	arc=none smtp.remote-ip=74.125.227.129
Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEE1606A32D
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFEE1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DmuyGlSV
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-3b10718b387so1717596a91.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 03:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795433166; x=1796037966; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Io7ujKNNt7SQhbgiNtNsmPHGRtWoUuLSgdS1AFaBjnc=;
        b=DmuyGlSVyG0u5kdHOp1ild90T4N/HC7n+JkFjIWZ7Qz0SJ/qFf78h+3H1j8N1TLC8/
         dFYgp2JnaSmUDKnkMd4SWTZ7Sr/32VbO71cd5+kUIBjBCy2YfgrbHSjV4Mi774QTss4L
         58rqlv5QMJZSVsd3hLGM1ziY8Udp8cnfbjZGpQRuZYH3E5ojg/owA6GyvNumphsyF8pw
         F94jWV42N+KzboOAVlP0DCuL38oHmXRmrrCwE7OY2+nFiA72NaD7E1UQnts9UqCt1WLD
         zhB31LMAV2ev4ZD5wC+U/dscosPhA+hfIuN3zZZGQWXcML0UnxKaGSjP8sIH7mdWslFM
         KlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433166; x=1796037966;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Io7ujKNNt7SQhbgiNtNsmPHGRtWoUuLSgdS1AFaBjnc=;
        b=Z3uqEnJ9LOXXqG2OKbHPfcQzEU20Yj4sAmudq9J50ftNCwGmMAlZKfSDylgMl0FzEG
         PhmjTeOslAMnkHmibQX64wdOCPkwymMgkzQNNaRydYTvuB3L3sA2uctF9gfGW5/6E0Zi
         KSVP3+3nCReX5yRF/Q8r2yi5yt7/AzRak9FmFzQuYobCi/lhfvRCR7CefwI7Cw0zIkLa
         L9myAqfubYK8hxkuK1FXSItx60b5CdN0H/ZApFyKDmME9mDzyispI5C1Ql5ZClLZrOPT
         OUheI6ZikIdQhX2cL1mWYUsU6lBeYOXQW5Og5dAU+Y1ALD79q4K2FQNnZN9dtqsGzL8N
         qNiA==
X-Forwarded-Encrypted: i=1; AL+hErHJXne6IlrvZ3oAcKBqtL+9zl0+cnChJ+nLHaHIcqkCeSg+sSiVHvoO7wadwG+IJIktGIJnSnTeW50=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ce5XpDZJtpAy1YiB/1LSuppPjo3IbQyD8YZPlWScnF0gBUkG1
	HEhbJYy9djJW7cq/BV1o2xGk/oORXQ4kYoNObhZQZm47qNF2nl+2jjNc
X-Gm-Gg: AZFdTZdEQUlwR4OVrgadvs8xU3dBDDvj9fzicKDooH98bm77rOf5gmlWL/UjaRdfffN
	NK5F1Psgi2FPOWnzhxkHIX+W1ifOwph/eRr4uKgiJm5nnn/od9wTrIsdyR0utziAH/tYepzkmp0
	Uil9Xz8lCS019Diyc0eluSRKXrVrvtZj0qwoGkwgq5rReA4ClHO+hovNX/O2Kw4NFy4Alb+OjVo
	QHU+PwgIJqDrhdiisVQqW4V7k52+aNEOJeWzZjVixNVIVLbYAljYZZBM4rKkwqhposetpAaxJuP
	pGX1VsjhvZMoEezGECajeBLQCqdf0aKxIy/vc8meLLuUmyrQgdCGPSiQLJRoyBu7FfkpxSprAQU
	YKLp2aCMLA1pjt3SHNLurnCO3TH9pBKXrjJzPSAxllAsC5tlGt8vO+hmPLVimEeuDQUXRj2K4Tv
	S2KJsvZvsIIkem0EgRbG20cHgCefTUxPXOMZTlUByK5EBTrQY/luMMSVH1EZZuYeZcUJHDTEcx4
	MNhnWxdGLJugT8oHTdgiDqbVKZez5qrEvnONxrzIiGY/INLDFbW6PZJnwsIR4jL2pBTjYKe4FUJ
	l0y5wbIYQwOutwjwflJlyKBpfMKVJVPzC+k=
X-Received: by 2002:a17:90b:4c07:b0:3b4:f92:ade7 with SMTP id 98e67ed59e1d1-3b41cb20eb8mr10517519a91.52.1795433165943;
        Mon, 23 Nov 2026 03:26:05 -0800 (PST)
Received: from localhost ([2403:2c80:6::10a9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm17449770a91.11.2026.11.23.03.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:26:05 -0800 (PST)
Date: Mon, 23 Nov 2026 19:26:02 +0800
Message-ID: <f5c6f44bfb6040289653cdc079b1cb2a.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
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
Subject: Re: [PATCH v3 10/17] drm/spacemit: add Saturn DPU KMS pipeline
In-Reply-To: <awPxPHpr4NYxqdmf@houat>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <20261121-k3-display-v3-10-ec419e8e96b8@gmail.com> <awPxPHpr4NYxqdmf@houat>
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

Hi Maxime,

On Mon, 23 Nov 2026 08:55:40 +0100, Maxime Ripard wrote:
> On Sat, Nov 21, 2026 at 03:40:49PM +0800, Cody Kang via B4 Relay wrote:
> > +static int spacemit_drm_master_bind(struct device *dev)
[...]
> > +	drm_mode_config_reset(drm);
>
> You need to use drm_mode_config_create_initial_state().

Thanks for the review. Will fix in v4.

Cody
