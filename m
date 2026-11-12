Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480522;
	b=A8kDEKabKe2Jm2LpDuaYIpXoBEJWUxWXtJVNIMq/DiLBjDFMDmDonUxnz36FKPsHAF7X
	 pDq3WCTaGCD023FfD9Lfdcj3KkTc0AhqQWuNgJ+YwofTyJn01MzAktTQcyeDW4m1LWcEI
	 XjQwJbCB4dYY3dacqJz1JjWnZgDFpcN9otDjeDZMGVzpC5sWdYIqOpXcEiHVflcGViH1a
	 CUx55XrGafdlcugP79EaQighpE6oAnMB6pYhQwdbmliYLx58OjhQ5hiJbrg+foG4RkjDM
	 YIKYtqUkqV3axcMy5Lssu4mfXm2KDDG07YHreKrGTl46jlG8xhbGfXC5FWSbvJ8mo5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480522;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7wAtOqxrD4BTLp+R1ZFs3AjMfafFc50hSvx9IoLgwzw=;
	b=Stf2CEWBG0VWN1miaSG1YAXoJ6CKBiKgj7jHizW8OnPlFvw3lb2GwGCIIo+IaCWbbTCa
	 90K14M6Lq8nLYENFFbzJbwECCy1C7ZF2BSEbwMx/G/BO11Cml27YIWHp/0HXfTujmmBso
	 OIzzDUJkDvdg/7vNTPicF64UWPrcBXr2W61Z2HFw1XM0gtVc9LP6XXCOO/gKqtGzD7U8l
	 d2v2WIIEdGzbUu3s6ANXBEjVVwoLhr9F4uFz91jx7rZj9NwnkUnZaPxOnvVNnAw/jYn14
	 lz5UB0NlQFnxEosWNdCm3GSY7UQZO335YMX8lfhXtdnyIeBaMGbZdvwsY9Zi1ojt0pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AHsKVacT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA0F606A32A;
	Thu, 12 Nov 2026 10:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AHsKVacT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860BB1F00A05;
	Thu, 12 Nov 2026 10:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794480522;
	bh=7wAtOqxrD4BTLp+R1ZFs3AjMfafFc50hSvx9IoLgwzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AHsKVacT2twswiAV4WQn68kRU+QFsZEidKVb0pkKemCPGevxKGOcF+/RLNhmEzZUk
	 nK3t7R8r20rthTyrPOls70dl990ENhGVrMBOQgdnQyI6l9x9tQe5JTpQBZ+uT8dh0v
	 LrCMNDYZ92zcYffl15kg0b1gUo+2IFmJtRJXvuvWQXwM517vSObYI27xS6o0FhTWAn
	 bldhRo2emyDmykDEfKEPg++4Xi0/LjcDS8Ks8yQjP4GZ2pFsF9TRnosJgbMvdOyZyV
	 z3P6CCjd4wi14/qBwR/bCTpGXATMd9ikFGcWpUtKL4ALYakz9SLS+h6CJqvIdYmy2N
	 2HYnZz63djRoA==
Date: Thu, 12 Nov 2026 11:48:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Alban Bedel <albeu@free.fr>, 
	Antony Pavlov <antonynpavlov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/7] dt-bindings: clock: ath79: add the UART1 and PCIe
 PLL clocks
Message-ID: <20261112-charming-tricky-hippogriff-4e8e6a@quoll>
References: <20261111215729.10683-1-rosenp@gmail.com>
 <20261111215729.10683-6-rosenp@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111215729.10683-6-rosenp@gmail.com>

On Wed, Nov 11, 2026 at 01:57:27PM -0800, Rosen Penev wrote:
> Add IDs for two more clocks:
> 
> The second, high speed UART of AR934x, which is compatible with the
> qca,ar9330-uart one, can run from a 100 MHz clock instead of the
> reference clock.
> 
> AR724x, AR934x, QCA953x, QCA955x and QCA956x have a PCIe PLL, which the
> PCIe host controller nodes need to reference.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  include/dt-bindings/clock/ath79-clk.h | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

