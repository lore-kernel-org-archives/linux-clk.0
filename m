Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904028;
	b=gBokfmrhXaiUQz9cRheciogWugMkNeDqPH5Gvk6RRzB/beewGtffKxKVHWZspcc6LeCj
	 19enSxlElABPhYcTqNi0nLj9D3ksHqbpc6pyjWblryiRZMjofpnpLxCIG96mI9O5RCn/M
	 CxH800sZ6aatrPr5NeuR0tXOiZQbNHZTKZEDZPUd/TsGJJ3WzwZvvkqbM3OcBpQFjwtGG
	 rqlMpdjxONoxtEEGIfcbwHz6lQanyjJw181vAS3ZOrdejusolIVKc4OTgzDYhMid6RJYC
	 J2vCCD/6jGFF+dYDrq71to9O719UrNJffXTIzEHmHJRDfMZrji+pSm9ftkdcTENL6aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904028;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=FWTdhllvzHmd3ZCW6mBaAn9ZyTGZc5+2hwtmFkAy1xA=;
	b=hMgaVh7vcIYf1gqsfzbo/I7fTpqFxb1Ccd5UMWEGNxAjCEJPMV4DnrPD7oxTxzk9jTfo
	 sf+XFi48u5894IUSDIEA+YYD7OiBb7exl0HBCDaugHdlIgnd5w3jZsA5t3ydsRnjJrxmM
	 1cvNBHnjfgrIAxagDsM+0QS+pBWSeFU5oyOFBcS1qjk5Hiez8HbINuMgKyQde+BKTVMVG
	 m9OG3pBfJ4dgtFNL4AaZpNIwYKpBCdJ5h2dRT6HG92lHm7Y1rlVAQFjqg0GGw3kDIvExQ
	 +zp64NisLQnhQje8lPv/Fyj5w431wdU5z6pfFDEhKfZBvYf2L4IwCyvy86GLrTfj0zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mw+dQQKZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA11E606A31B;
	Thu,  5 Nov 2026 18:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mw+dQQKZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846111F000C1;
	Thu,  5 Nov 2026 18:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793904027;
	bh=FWTdhllvzHmd3ZCW6mBaAn9ZyTGZc5+2hwtmFkAy1xA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Mw+dQQKZotTnJ9SZg5xPho7MFTVjDO980yFjUxbdCbS0ncLHOjSCE2W5cdqAqQPU1
	 wo8ZvO4gWa/QjB0I0+OcdY3T7G4B9V6wsd8+2hUY9p/42M/StFjarJLVfbpOej6i3Z
	 iPbrK43GuqwauoN3Im1yHiDlY0zJTlNE9cvdG5wib1hRVZREGaJSh9Mw3bWyZJbbfJ
	 9AM81P/S2eC4tpuDZ7hHZ+rO9HrQHR2gCfwPx9GqjJlbjYFQAsR0+8TAmFkkTzRrNU
	 Lxb8slp23GhPcUeKUi2Dxhi+8fK5xyqhgg1/EdvAY6Ew3UzCYSSsoOO+p7cPo6+Jf5
	 tETwrMtGHS4VA==
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jonathan Cameron <jic23@kernel.org>,
	Avi Weiss <thnkslprpt@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3] cache: sifive_ccache: propagate IRQ count errors
Date: Thu,  5 Nov 2026 18:39:43 +0000
Message-ID: <179390394385.1477457.3217607972839279522.b4-ty@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017151651.1138811-1-thnkslprpt@gmail.com>
References: <20261017151651.1138811-1-thnkslprpt@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=477; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=9lOpLeSu7E2eEt0dSM5/y+xGzK0tE1L3ZW5BvwhtpnI=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlvzuY6TmuV2Cim/PfNpYPt/jnceeXiAXfb0hbfT9r6P lTkOq9SRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACYSYM/wz2jW0ndPXhlxqE6R it7Atnnn37eL6hOerWws7z/zwMiVmY2RYdKCf+nn0zUnlgTdKhHTLj1z3ZA58+Z7Wb0+Xo4ZUum t/AA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Sat, 17 Oct 2026 18:16:51 +0300, Avi Weiss wrote:
> platform_irq_count() returns -EPROBE_DEFER when the
> interrupt provider is not ready, but
> sifive_ccache_probe() only checks for a zero count.
> 
> -EPROBE_DEFER seems to be the only negative return
> code possible here (currently).
> 
> [...]

Applied to riscv-soc-fixes, thanks!

[1/1] cache: sifive_ccache: propagate IRQ count errors
      https://git.kernel.org/conor/c/5820e9bc940b

Thanks,
Conor.
