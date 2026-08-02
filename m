Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE021DE4FB;
	Sun,  2 Aug 2026 01:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785634264; cv=none; b=Rmp6qYpOy8L3XbtXyDhkLP+c45KZ/dQEbviIjq6/yW2PDJ9BKgUuw7y1jx17NM8GwJdPT0yyMjml3UVNTvtTuI+uR8W78VdG4eAqnL4VnNuRTXk81sfGnTdMWIFOdn8zNm+qFRb4fglJv4ZG1RlkGJ7aEEYD8wuqGkOmHLlJPjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785634264; c=relaxed/simple;
	bh=QiRMI7iOL6WknIFRoN15qOxJv2SIX8sIO5xw+RCivRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ni6OuxJE3O1CSb83s/zbvHKd7i/TpseV/Vcg8O7VlWepEpNnyvBjjQnp07xWaWhrqCVhWBKTMFYlQOXPfm2hTkYGucpoLJ1h+TjhDw1HazoH6aZB3rYZ29ldSfh38ocmUkibc0dlVlMVua5Cpk/ofR5bZkNIBVb3MoGzo2Kryrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mikZ1883; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mikZ1883"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D9C1F00AC4;
	Sun,  2 Aug 2026 01:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785634263;
	bh=kF/jmHcAj/bSIW3njrcjP3ttcfjXyFDEpBH1tBCyzRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mikZ1883IUq3+1exW3KCr0FvI4UO2SWkwv5a7cduHXhtS3bE/4+wgIlm4qptjvf8x
	 IsDyPOvxfeY1g5PWcpgtBHvLng83oEzf7crjSL5cv3mkmvky3o97JEb11sKzQawZEq
	 tX+OVH8wcNGUVEcwd6FZyCEQ9y9qDwZU+TtB6l+4zrJQkf6RhqMM772jtD+RZpAP9p
	 aUelbLWnFbTGJZJy43X8kxEWopdhpzQWQCPGAaxhxg/fYCEVaLPnRWbSBV0QXktOl9
	 RSKmYr41TJ8t/18l5FM3XmsnD8fA6ANaoAwqDy5jHtX1ZMIxfde0V3zIknBsguPVmA
	 ixo5dxGFbCkTA==
From: Yixun Lan <dlan@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: spacemit: k3: fix i2s clock topology and divider rates
Date: Sun,  2 Aug 2026 01:30:55 +0000
Message-ID: <178563403274.1609232.15890573449451118017.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
References: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 17 Jul 2026 00:26:00 -0700, Troy Mitchell wrote:
> The K3 i2s clock tree was modelled on the K1 layout but does not match
> the actual K3 hardware topology, leading to incorrect clock rates being
> reported and programmed.
> 
> Three fixes are provided in dependency order:
> 
> First, the MPMU_ISCCR syscon register is renamed to MPMU_ISCCR1 to
> match the hardware register name, and MPMU_ISCCR0 (offset 0x0040) is
> added. This prepares the header for the clock topology corrections that
> follow.
> 
> [...]

Applied, thanks! Also fixed minor comments from sashiko bot

[1/3] dt-bindings: soc: spacemit: k3: add i2s_sysclk, i2s_bclk_factor and i2s1_sysclk_src IDs
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=cf59a8742581aa4a026b20c7a413be06f4fc9831
[2/3] clk: spacemit: k3: fix i2s clock topology
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=e6b17a690c2f920963d6a9328642bb090f3be587
[3/3] clk: spacemit: k3: fix missing /2 factor in i2s sysclk dividers
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=8a7d4b1924d2a424b1a6fe69de4f9464ee1fb485

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
