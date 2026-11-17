Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948709;
	b=mhq1KShVX3EV1upUP8w8EuvmOCCA0z7H4x0tJek4nfnJXLkgCDJkfbfv/ak3ZtbDw4vz
	 sVRJT2sN6Z50L1c3PPPDg3R5l5g26IP8uLXwzmInRYnACz3d1VRXi6USG4XQ1Ew7qGxs0
	 mUDG3exnNIjxzhiAIMFG/KQ9qP1TQlKdkaiyI85RtKjDdJFXlONMUl2WH5deq2zzUA4W8
	 FuEQnZs66MpFsg3AolqJU4znD3eB84ZHdvTdc8rooeSRcVM0aDnIqXKv3QbsG3ReM+Gti
	 rjMzcfoZRVv9El30oqDT0Mv5y5WAInBYbujfBmFHxkJwLQBrDMkxDaMVLJLtTrzpfGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=H3h9IxdpOr+oov0x9AuL8BUQNJ9C7SGtsH7YFmYPEqA=;
	b=Yn+sZCL6nDVyZQadasjB4jdK6q1MNRNvvnR1pQS0YYZ3iX0Fu9vm1Tqgga2WcRwpeJZh
	 H7zmVq7Um+1N9RAOBflIJgpHkgdiPKc+O0WvQ77Y+saxpTqu3+9RDGgiLykeZLhVrljda
	 zp8iCNxyLgHGu8s2rQNPjUjElhVh/OS2OAMOPUq3kOaxDFE/3sP+ctb4qH+Toy1iRPLoa
	 m7JZaIXOb+UGpQaOM4dUP6gl0w3clEovA6OFf4P858RHgz9MeNsA1fJ1lLsbbKMFx/iOY
	 V6UAdGftYXAINIfZpI9cDJhB42D3wgLYULAmCUWrdyVbXaexPBiRPjDpPU04H2kcXjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PVf/MNIb";
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61D1606A31C
	for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 20:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C61D1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PVf/MNIb
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b4b9ba815bso1441237b3.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 12:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794948708; x=1795553508; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H3h9IxdpOr+oov0x9AuL8BUQNJ9C7SGtsH7YFmYPEqA=;
        b=PVf/MNIbC8a6bfWjqZsIxgcF6k2/UaWL3F+LZLDew2Ev/fZ2Lu81CYI2wWz7Stxkq7
         L6ByZQ6Z42kEUj+NdNL4lNmZJK+zv89zA++4ek3zydtxjSKHyqJU+05UPBXCTOD2ZG2z
         3vMal9prNOcq0SOcvs6A3Oq02OC0W8ncTrMwhoUQmiaXGVXbcf5cxEUO8dFV1hg1d70M
         2HLVh9M7my3KAxVDfSULrJabCnwF5iqImeMt3Q+2htXO4Vrk/B7KKWbgqKWVj7gpL08j
         OOWeeDVHafI94yxstctdFUyjan6C+EAof615/HWP1AlqJfwBGVOXnpZkm/+mPNuzwcRY
         UN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948708; x=1795553508;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3h9IxdpOr+oov0x9AuL8BUQNJ9C7SGtsH7YFmYPEqA=;
        b=h2N4fvh8BX6zK7e6Qi4EnqSdH91VRmy4OK/rnYyqNvAIq+nl4Wseat6AHWI9KBpSKM
         J5NoAzdOGCdMbd1/yXoaQsY2pp3tDzqESC8M+OS7PXOqLO6dnC5MSoGTgZscpBxaKgKy
         mV0k3WS9q1vAmCR/k9Y2DFwjvB3fvUS/GZFCK2Xosm768iilWL1OW+Nt0NG97jSUopw9
         94yZApnj2oOtaOP1NfUZfmF4cn5cEM9oBrvE82VnJ1ZV5xisxsKUYAi0IZaLs+ngi2O8
         QJRZLHZb2O//WxtPTXBhicIeIzc9JO89K3SeSW011xZKae6eB9aN6KPlqX1RRZUXFnNq
         aEQw==
X-Forwarded-Encrypted: i=1; AL+hErFU92pWXRoJF5v4aI6LNKFyh6JQCHOWIrSIuoqcin5kVCSUMjt+FWjsoThJmHDnKkjqJ3E43NaH+jw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Pf8DPCGuI51UenI+dd98AtfDPGv+X1xNOVjejB67S4EOZKXob
	7HjgnZZ6GXYQumwIVciuMaoPYLQmVrF3iFbBx+Bc7WnszcQyLrevQAcm
X-Gm-Gg: AZFdTZcLu5u5DeRIKKsNpLSGB/EgVTn93xuwWMIPCzsz6RkNeQd6e0tdGWYfKVl7C4N
	GSiwPvIi57XaEnY8HtZaRsuT9S3VZeULHTQwLiCePZAIxsH4iyTBlnHjxyxjn+6MiUXs+IuQIsC
	oMseaDvAfJ1FnBfSF21v2C0H5HPeVq+gMRjF6j/wOagRKV0C9AA+XymdX8ZophaF0Dq7MCQl9R0
	bMB97u5KHYPPw8todXwiVpFojtqV4DEkEpZuTHFbQTkP0QdJFksoDC5peu1rXO8aEvYxYuRfolq
	CYv2rtG1CKwQ+sGqQk6+iSBg/4XxEdfhwFiHG8ZwmErGhukqUm54VoFSU8i467vMgcb24M4Du9y
	m6VU4tKif9nxUzE2VtuEAnZQc3a0yEynR36n+NDhLJuOIZeP/g0QPvfbzvsfcPFQ+7/8RJhO22Q
	MArHkYQju/o82n7zgCESyoGHGZkIZZWKXAA4UrxUHxAVtC3E31VMALlOiKmkx4bIAhgBxfDCfQo
	/XdjRsMo+H2r6TR68rJey+s8y6J0I0WbzLKoudsgR1DNfXqYr4IIwGVfpkMcjUd3sjGB3KxZ1+X
	4kB4MKS6IjIWf1dZSaSKhFHC
X-Received: by 2002:a05:690c:306:b0:8b0:e479:6872 with SMTP id 00721157ae682-8b4fed09583mr3173897b3.17.1794948707375;
        Tue, 17 Nov 2026 12:51:47 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe057c1esm6086647b3.20.2026.11.17.12.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:51:46 -0800 (PST)
Date: Tue, 17 Nov 2026 15:51:42 -0500
Message-ID: <f4b8c87eb0676500661ebea67363ac27.docular.xu@gmail.com>
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
Subject: Re: [PATCH v2 15/17] riscv: dts: spacemit: k3-pico-itx: enable the
 DisplayPort output
In-Reply-To: <576146d4f2752c3c3f6ec6c42812cb9956406383.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-15-327d7910bf71@gmail.com>
 <576146d4f2752c3c3f6ec6c42812cb9956406383.camel@icenowy.me>
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

On Thu, 03 Sep 2026 20:09:42 +0800, Icenowy Zheng wrote:
> The connector available on the Pico-ITX mainboard isn't a DisplayPort
> port -- it's a USB Type-C port instead.

Right, it is a Type-C receptacle, and the commit message should say
so.

> I think you need to model the Type-C port and alt functions of it.

I am not sure that can be done on this board. The redriver/mux in
front of the receptacle and the PD controller that steers it both
sit on the EC's own I2C bus, and their interrupt goes to the EC too.
The SoC has no bus to either chip; all it gets from that side is the
DP1 HPD line.

So a usb-c-connector node would have nothing to link to here.

Guodong
