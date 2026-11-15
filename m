Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794751503;
	b=B4IHRyqefwNlZzrJZ9NjXhndP6zRlunc0bNpG2XzQBtcNdIVIey7tqKcg3dET76xpHc4
	 nMzqq2thGDLdxkzkFKbQoTx71OEtIecaGbjnoaQiIXAfLA+td/TBXbsuEZTYq02lXGZ1G
	 fKvQFBFPByynec9fZzxJXdx+fgrSN3cGLfV/sIzVrHsuWswdq9AZzb50twFhKGOXH4i7v
	 HytlmaIL/o5mKsNWqdHq5AsXdtV0Ia98oec/CR8JI1YWfCD7tpo9vxj+4FkZWhpjavYmo
	 fa1hPPUVojUr8IrIthPACbi6YzpyhWZsGIes3XhBbq90Yv69lT2f8Zk+qsBbdrpy88w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794751503;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XWgHxxw6EzmAFNHm6I5mTHp/KXf3zQq3hfRAvmIG95Q=;
	b=NXwLL9QPOXqkn16ihY3cNulZ9RESII1wzImwAWaakwPUj4rquxB2CKVgkLNU5WQIl63s
	 wsvcfyie9PO3FdYRJ6a34O76YhDFhTtA8FuUnHzrV7xVwJJeirOh6jU0lVOQs5dFtnQV+
	 7wEzMqwI0bKESzq0zQmuxkv4+oUZt5QhdckIufaonuyDpC4yrDnkQxq7xK4PDrxwlY2pT
	 tXl0v2Dh/bvxQBJ6B5Nd9EcFEdtwsT9NRVmG91V2LH6tH7+PfodoPEKfcQ85uCOKV/sXV
	 i04vpJdihIsXkWosoTy/X6YDwRup6ECiwrcitMeL+pleqdQDNqbb8unfOv/iJHjG2Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DHmikIoq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3300F606A31D
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DHmikIoq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014061F000CE
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 14:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794751503;
	bh=XWgHxxw6EzmAFNHm6I5mTHp/KXf3zQq3hfRAvmIG95Q=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=DHmikIoqoA22jou79nFPP6iVVKr/WcDGON2aE4C8Axj7L8F3fkMNUoZYTdklMRKXG
	 NK7tyA7Fr3XZD8iHHH08E3nedo/wrttTJTg+tXtgk4OC4oQzo1cS5LJfD8tw8+pxR8
	 Ra7wLraVk3W2vsCxI1CjtIwSptBSqIkSycIMbG3lTTxD9d0ccAovYYlEEqWoGW0h2l
	 p0N6ZDFg2U22SOOx96Gl3h0kWiGDck8cKBw9oriP5k14J5egXlPMnfIgj6pLhk8MuB
	 z3fNnAQZ8ETyO0lwv22D6FIr/ErOsFIpP1NK6ROiHzWWbXelmSxK6A+ucgy/yAH2p/
	 pSX4yQOq885Vg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3adfe77d35aso27184551fa.1
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 06:05:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEB2xIZ1DyIr7o028RWh4dPJ61ogBJV485Uj/bNUUEiuT6RxJ6jRo53DvFES9sHuMMqAUZ8ABYQycI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LVyMwLTJoG9Fey74r09QfoYi1wM8yiWheVq0FVDw5mZVHsb1v
	+9aGDB0taNnkClfLdJIy4H+88SDWXirWTkDbTSgDlhGN0lnyqB49Fffxaob2jw4B25+B6OSp/6L
	ZPeLdEh3qm6csnc13QgKOWfgm1G9qBPs=
X-Received: by 2002:a2e:bc90:0:b0:3aa:ee7a:5466 with SMTP id
 38308e7fff4ca-3ae2b4f52f0mr25507651fa.16.1794751501306; Sun, 15 Nov 2026
 06:05:01 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115061102.229680-1-jernej.skrabec@gmail.com> <20261115061102.229680-5-jernej.skrabec@gmail.com>
In-Reply-To: <20261115061102.229680-5-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 22:04:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v643JrFOwrLrhUOTenSVbRgOVz+hEDFqXDR+0eF9fNpOfw@mail.gmail.com>
X-Gm-Features: AclHuK8_QfEct_D3A6zPG8V_CU046sWNEFKONymgEnMQSD9bb71yZqe8AOLlRsI
Message-ID: <CAGb2v643JrFOwrLrhUOTenSVbRgOVz+hEDFqXDR+0eF9fNpOfw@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] drm/sun4i: vi_layer: Limit formats for DE33
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, sboyd@kernel.org, 
	Andre Przywara <andre.przywara@arm.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 2:11=E2=80=AFPM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> YUV formats need scaler support due to chroma upscaling, but that's not
> yet supported in the driver. Remove them from supported list until
> DE33 scaler is properly supported.

Somewhat related, but I think you also need a patch to block fractional
coordinates? IIRC that also uses the scaler.

This was flagged by my review agent, but I vaguely remember it being the
case from working on the DRM DMA helpers.


ChenYu
