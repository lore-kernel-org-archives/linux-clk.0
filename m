Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793903996;
	b=ufMr2WV0RDkuKhsHaf1OmoOawqd0cqcacnge0Ms7HBChrr9vf2cS9c7vhxrvfCakrtgt
	 qC0W3LqF/QtOZFTpek/Flozqbx50JNVQ99uJCSUH2ltLRPHCSFBXIociaUMz7sW/O9not
	 9AFVG5RBB3QiCe8Poc7iu3Iabyghe3ttdKCdHZ3fJ2e+amyVBGr2HHcHwjo+tS9Y64PLl
	 FR634j3eTScggnZh0g7JZWVDPEJbNkIsyFNi6hbq0MZKeeRFXl3HIBNQ4Yn6tV2hYTuAB
	 BTkPs/TMMm+nYXm6jtunovxt8QuK6CSsmHsKMJHw0eFgr1BLbNaLDVI3kgJwSbC40Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793903996;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=oLnUQHYyXdNhT+rCItNWxapzit366l65YbXVvT4t9nI=;
	b=3VxohuboEzcUc6QkxsLCKwqayAEpA1cuH9INBVtb56HwltfTPcK3QBso61AlMG/GswXc
	 YtINIBsJ4z+3vVqGWtv2Vu+5En2866SmsmA6eNvQFySP0hZqkBnUqoIQz6aoLawsEalZF
	 R24ZOoxkTqa5vo2nbrKq/gmLHFWcraO1EGPEWEMUyrlsDnkUUOX4FvaQdBHAJrOfyoWa7
	 HDJhqCAz9Ua7MFk8HSgqz9rRED2n+LjRKfcOVpHVHvKrnzqgMfPQKjGNMkoJxihOiPreX
	 ZS2tNGfCnm1vgRRm8sYJzBpcjGXjr9YGkMxjw8D56ysN7D+24QjpqcnQmzouYTllZsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="k+QnTs/b";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E640606A32E;
	Thu,  5 Nov 2026 18:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k+QnTs/b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 817071F00A1A;
	Thu,  5 Nov 2026 18:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793903996;
	bh=oLnUQHYyXdNhT+rCItNWxapzit366l65YbXVvT4t9nI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k+QnTs/bDSCwBN660MzQuD8wNdgtNDePZ7KoYShjfYCdpSWEoJgljS5i5Kzld/T7o
	 DE3MdPgUx9qXwr+2Vsh2YJhhmOgQXty6Hoy7WqfHoJbm92F1oZfqbrw+2VgCkzgD8y
	 lAvBodgrw0rh5DzfOeEBnKtpky3JEjkaQ/klXdDbalVZKOZN7+7lGuEm9dKwa3pvs8
	 9A1Xaw+61ORXBN4ftIhkOsrwYSg5+3fxiQJD1G2jH5+l+71BlAKDbCHZm722vCFBeG
	 khOBUNdIQL1NksOY1Zet8G8xf/C5TxbYk0iiWEBI7CL2ssL6UwzuzmGQV7yglF9rZl
	 /qpqqTZArkzwQ==
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
	Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/2] riscv: dts: anlogic: dr1v90: fix clock dtbs_check errors
Date: Thu,  5 Nov 2026 18:39:40 +0000
Message-ID: <179390394384.1477457.6429216758645730448.b4-ty@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
References: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=911; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=YRRo86G5lO4jP2/ynMMu+/bhBF+irqBFrR4pAfSjzn4=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlvzuYkm81r+xr82CLTt22a3PPfR8yLrplwJ7esL9p3X vla+nGOjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExE/hkjw/Lw45d+Pnh/oNqp xnGXzt4VWstevtO76LuWZ9ET+7V2HLkM/yO+f9b798xa77fdnhebbuyv3W45dW7G4qSuo9XiX47 Mk+MFAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Sat, 03 Oct 2026 00:28:38 +0800, Junhui Liu wrote:
> The external CAN and watchdog clocks are optional board-level inputs to
> the DR1V90 CRU. The current binding requires both inputs, causing the
> common SoC device tree to provide fixed-clock placeholders without the
> required clock-frequency property. Consequently, dtbs_check reports:
> 
> arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dtb: clock-ext-can (fixed-clock): 'clock-frequency' is a required property
> 	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
> arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dtb: clock-ext-wdt (fixed-clock): 'clock-frequency' is a required property
> 	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
> 
> [...]

Applied to riscv-soc-fixes, thanks!

[2/2] riscv: dts: anlogic: drop unused DR1V90 external clocks
      (no commit info)

Thanks,
Conor.
