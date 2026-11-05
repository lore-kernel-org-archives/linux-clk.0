Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904006;
	b=jHOhPNsydDcNX8xVKrmT52oMs6YzA9nf8astOOSzZTgVjQ2BqOz2zFXPCuEhV5wzLU8T
	 kg9GE0bm9SRStbtBlDh55h2kaoFtqc0V5SY3Nux1jDkb3IQcNSneF87OTiUsy947kYaHC
	 DBYA39H/gGCBxBCcC8l5GktmrIJD5zVOK21xO+xjVLz0Lg8p++CtfCh8qs4xqQoHY7L/7
	 TMFoaulA9wT/OM39WgGP1VXU5NG6pN66s6rRKQgYmElzGugigNZ/88bkUUUFmDwMRrdPW
	 lXW9l02JiSF0CfeHVnLnChEHfW/VD0ApCZSl3v1zgIorv30XyNBhhKCj+n3JEkLuPaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904006;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=SOmm+v5+q4Ie3UaOXttJQyvUvoppMzAuwuREpO3lnEM=;
	b=Li9ek4jqMxqTS01yHxobahJ1v2oklMiOrZ1VfhALf5sg+KkI05/wThQq2z1SfQvci0tJ
	 ixz408HMv/KLN1i4MywoXRczG/A9DQEIsCxDOxOo+3CXKs0ho1XV1RNf0FZPedTfMhzNT
	 fN65pxu/Kf7HUTojaWxmRBMksDxZE1xG2GP9N4ieaYrPc//myDSWYQZTzSPaSnFsifFYh
	 UpM2WUlqliQEbqCGlgdO2HmCVK5LtdbZ6+TYtyuKUAnl0SBISBDtdMpFg7VwbtnffyfOs
	 2l/4JG1pULunyTTNQ+ayMOrq8IQ41QBjqCOQgt30c1OYwCAgWOa/ddLj4rFgNQ+kVwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kHqVyogz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED93606A32C;
	Thu,  5 Nov 2026 18:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kHqVyogz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1217D1F00A18;
	Thu,  5 Nov 2026 18:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793904006;
	bh=SOmm+v5+q4Ie3UaOXttJQyvUvoppMzAuwuREpO3lnEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kHqVyogzxsCRzbS2q/auJxr4pB0zr5JgupIkFB6KKutUygpmgt7VYrAQFJue/Pz/w
	 28tnsWGOvYXwsiIvV0mvvH99HGIIS9wLk5ojKNiaJxPEseODZAIjI/S9+/OXG+vIo5
	 edjll3odBTvSxADMyEGsW9kNw6/HV+F7zDPAlKLUwOjHMLMDXe77uzptrzWAF/wCzN
	 3rYvxfMIxMHsRpovZdVUIn4U2H8phrrfBp4tgsUU1wCf0cLyLXb6xQb5GriPhh3tWB
	 9IaUxHBm4vvhLY2Ccrx8ff3jMCTw1FuBwqH3d8RNAstjN5wH6aNveqfreLOEl/ADyj
	 dfJjNPhZ9VQCA==
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
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: (subset) [PATCH v5 0/6] clk/reset: anlogic: add support for DR1V90 SoC
Date: Thu,  5 Nov 2026 18:39:42 +0000
Message-ID: <179390394383.1477457.11835179524789645900.b4-ty@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=598; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=1bhIAEPOqIDfQnMAOf+CD7PXBGi6CxXqji1n09U0SHw=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlvzuamnc3+cvftEbGlvI99zzNxFFX2KjW3f7uheVqN4 UzkhIzVHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhI+39Ghs7leoxhfKLLlV8t zpd6lKl5OHinLuM8E3erPENP3cgOFYb/Ee/vbmH7PZcvRuvujFNhjD+3Xw3Wr5h+ZpPD811rft3 p4QMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 14 May 2026 17:27:16 +0800, Junhui Liu wrote:
> Add Clock and Reset Unit (CRU) support for the Anlogic DR1V90 SoC, as
> well as corresponding dts bindings and dts integration.
> 
> The CRU driver framework is built around the clock controller as the
> primary device, with the reset controller implemented as an auxiliary
> device. The clock part refers to the vendor's code [1] to determine the
> structure of the clock tree.
> 
> [...]

Applied to riscv-soc-fixes, thanks!

[5/6] riscv: dts: anlogic: add clocks and CRU for DR1V90
      (no commit info)

Thanks,
Conor.
