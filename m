Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486343;
	b=dlPqgN6PZYJa1ZfnsgemXlTXx6F3+P5Qe6BTo089UimuO3nQiYn57kNS1KrsMFMTSQNL
	 sg6uzbhZi3Y00OYiF+sA2jNihZp7AEJvGq55I6HNWm33/foK/6fJYQXO4RcsTb/yy2i11
	 Tq8wPsXXukNTh8bCv81CKAGnEqZjcj6zW4p3mdThbMrumAnjsAzOWrRq2oEnX6gGOKEyo
	 ZlTrTp6JxPra1Q5WpDw6IooB8OmTRpNLHUusyu8pudUq6MLgt5EuYhUIZcatsyuxU+Ngw
	 Yg1ux0ExT1pMl3gnFCJmGz52QsTI6I9BtrcEzXFW9HugAMont/LIpMvvxsfc0Bep50A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=DYJhcyx23MYrdnoVW3nJljPvokUxcXGxcoFSW0aOJ4Y=;
	b=Pk+yI6YMTzz2omK0iNYJW02SqoPbOb/gyLAE4On2cd9EXma3ccRW7fP321m9McD6gPiG
	 Xm/swTJRUVzMRagfib8NF+elK91ldeyfUSUx8WvM22GVhGXmkfvWOj4rMzcNqaxyH3ERY
	 xj5sASxPKflDI5rEORP3F2IxojFPANTbI87vXrDSp9cviVoBBv4EmMKbB/6Co6qpw6pXG
	 QelGGio0LqvmkbAWkCKvyMr99+q0/F7UAu4fXOQ3tygafdZy5YywsTeBSEcliqsZTlvPG
	 azmN8EcFqCZk7xnKMbvQxdj9E1pEkSQV0S+Oyo4Q+7Mp/51CjcpHZjvvXqgzrdXR05g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WkYlWrnT;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304D7606A326
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 02:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 304D7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WkYlWrnT
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3b3d125637aso777415a91.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 18:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795486341; x=1796091141; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DYJhcyx23MYrdnoVW3nJljPvokUxcXGxcoFSW0aOJ4Y=;
        b=WkYlWrnTqUdrWZZm1tK0o8QHAcJHKyc3XhplDP+3YX6tsrRhC0AYQcy4LTqT8tdoa9
         zj1O+B6mDS5A5xDFsf8Pkyh3hwyhSnYcHNqJMXLEhBDTTwOvTETI5S1b3+Rm5vi7Mcgy
         u42trG+PMkhfMsBT3ZMcC8gi23DZi2bzCk8IvpyzIbJmCQeY/hKyOsh96b/i2kleGL9M
         2UuvDDrXlDll0k3f2+m4a2uauQCe1pCsI+caGf3kRmjlxbfQk75Kr8XEK79c+XbG0Zwr
         XEr20HVO6BfOmhCjVPgMY7VNMyu9YagOmsLU3w9tu03Hegxbo8SHaR2gCOWaGLyOIsar
         5Aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486341; x=1796091141;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYJhcyx23MYrdnoVW3nJljPvokUxcXGxcoFSW0aOJ4Y=;
        b=KFzeT5atdAdASWbHSXfJT+/Vq6snPkfqJkAa17Kq5cC2ZbywhapNqs9FYjHptaafgc
         LhywIhmL+FCJI/hMXQ5UyWpwvDduAeh2KFApfP9B++0Dy3bWkDaOssCaGR+A/XawObWm
         9XVee4YqvpzsNN0Sl6kQgpg0KdPLr4smUB8mwf3cf5kD/xcaMVwYBp5/OHPZmjS8QLmW
         5XZbtoTTYLba8KqaOnkqarNyaTHr3VIS7N6RSFSWpjM/BOzXGKv1ERr+dhO9emGUtWC0
         W8PzFIJsh1oKBPk9rBW7Lc5cjipmzglM1gZkVZznL+EHSk7ZRSk10P4iyRShocu673Nr
         hSCg==
X-Forwarded-Encrypted: i=1; AL+hErG0weEv+D+Z3HRlO74kc+g692oEBLjA2rIFWHtX8JpiCIeDAzFJ+CAPEd1Mxi65pS+VPJcSzR6/oJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0Z3HRrhndodh7b+StY+VnGlTWiRt2mvYkWFLzS1cQHcR4nfEJ
	vYw7VBktR8lngZmSBXBgvfciYo5QwBD7JYGkwqvvOUXId+FjxdzU78Vl
X-Gm-Gg: AZFdTZe6r2WvmiIqiY/yfpB7EMOiL0UW0zIBJnxwUfKizONMUmrRrg67vpDq0IDFQg3
	+XArVwHgArzZSvRIy/pXHgJC20RdqVZD9/jig6naXqSJpqpQJ9Tfe7b2s89KddDut1tQeslu2JR
	NwfSM5IQZhMDjQrLO7S6d8kSrXoNwzBLN2qprmeD0ffHw6WyRzort0JBC09KY5y7hf+F6oiFlQC
	YYJmaRcCDGIqgU7Pkrp0ffcBuR9JE6k/omDbLhzgn3dACwINUOonewe2xLFtx9AEj3uxAl3SQRH
	RdR6v++908h7NVZmFElfoHat9il0/iaz9MPPAuKTcygSTQ0CiZ7C6a3p3JuDi3RDX9TAUvNjs31
	D/LBpOkgEM5DCNrH5DktuXqzK736UAVio8FAlBFgMcZVy+xn+KWA8+Fj4wAsOQ2CMaGq2+q3bUP
	t0rgue7TBb7G+bciPQ9yRB47MGOdHX99ahO5SPZVfy8l9C2kQSjRIUJhtqxlsHpEWwqmlBhBCyV
	mR6MBV7Y1/f8l4XZBHhB996/yX0wKh4VOvso9fVUXv+W5HFBhGFCWt884qMNr3Yy2f+SkACzpKo
	tDKTXAmz2GHEhVhLJBN9cs7lulEGaukZsRMZGRwW/M71qx3bIutKlhoglw==
X-Received: by 2002:a17:90b:4ec5:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b41c9476d3mr12780728a91.37.1795486341377;
        Mon, 23 Nov 2026 18:12:21 -0800 (PST)
Received: from localhost ([2403:2c80:6::10a9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm9869004a91.9.2026.11.23.18.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:12:19 -0800 (PST)
Date: Tue, 24 Nov 2026 10:12:15 +0800
Message-ID: <3b4d214b53b64cd7941260875bbc88d7.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Ze Huang <ze.huang@oss.qualcomm.com>
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
 Sarah Emery <sarah.emery@canonical.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 00/17] drm/spacemit: add SpacemiT K3 display support
In-Reply-To: <DN2OGZ2JLHQ1.3PK0UZ3K1VYKF@oss.qualcomm.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <DN2OGZ2JLHQ1.3PK0UZ3K1VYKF@oss.qualcomm.com>
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

Hi Ze,

On Mon, 23 Nov 2026 22:59:10 +0800, Ze Huang wrote:
> Thanks for v3. I tested the series based on v7.4-rc1 on the K3 Pico-ITX
> with an external DisplayPort monitor.
>
> Modesetting and page flipping with modetest work at 1920x1080@144Hz,
> and kmscube renders correctly using Mesa softpipe.
>
> Tested-by: Ze Huang <ze.huang@oss.qualcomm.com>

Thanks for testing v3.

Cody
