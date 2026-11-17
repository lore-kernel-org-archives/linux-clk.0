Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911864;
	b=TN5iEW6g6yMJQ7y8PWr8QjdfCpiphv9Nw9hdCGzRGzACK6AJWbe23aaX9q5w5mmRONHS
	 oh8JN407x6JXuR6GUMjBEcURCBwdT6mNEmwaBzCgEWeK4J2emsAZcYgcV+ia+sEhBxY/x
	 IByTR8SvPHQks2XQk3GxqAy+k1b8kainVotOT9v5BVftL1gPIdcvPMHnigSvGAdSLFawX
	 jmLoukdVGqTCVDqQo6Twlk0ACq+A+cpVvEpRokUn8ohqVdDUabfzRueZK5cBhySgo0hlx
	 E4fzJaLjPEYWh0XRjnTXHh7XMab6PJedzZSRkO5VlNIdNo6BOVvhIj8R607rF1jLWfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911864;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hoWf3LruwvxscR/X3fkl3XvLYalXXkWV48a76CyMCi4=;
	b=cJqtKmA5rQMZykneF6pqJH1OdnlbsIFZz6rd9rWMvquBWT7y4X9Q6+8eMaDb15n5ONE+
	 j0+CuhBQ1/iYDTKB+KqiVZaIep+as0bkZ3PqgPX8JmbuybBC3R61aHg7NjIeM8RvPVYN6
	 ZgFtO3hesEPlm8F7IvEOcqoZ5u0saBrVElOUwWcs0AZfsTU406i9LOBoZVhRNp3u9MSFX
	 OPJ6T4DGLQFdl6aZcCMAYVXhFHwl1+Ay9yVU+07M9a5ETNjFcfF/7lBaO+h6yJe2BqfeD
	 4eJI8wdiAj8TcgZRzzGHYo1qaZaVgYFgsfRGtEQGNZG+pQeEJ6l42Mf92oBEgk9G7aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=c8Tj4FLN;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C25606A885;
	Tue, 17 Nov 2026 10:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90C25606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=c8Tj4FLN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794911862;
	bh=wEBiVaD6NsiPNk+K0zY+bNHgPd2fjrZ3R/9puTARgmQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c8Tj4FLNlUnIrv9fqoaXqE/BZBck8Dbtrdf5PzvtJwo2R56GdU5WAPkpiuMknu0If
	 kPjuRX7Mmxt9XG/4Mqr3tN+37orXSVUCUpE2kgwOr/ZY6n8/kl2vFYWVSjOfHqXNmA
	 MjEtF2m9mfBOyrii4nj6EV+a9QctWlmSERrXhoKA3+KRx36f7HVSndX+IB4TsGTM62
	 XwVW+/GIs0liH7ATNba7qUJp5TSedIRu5kVMWvINsPjZcnOY5EFtFZ21pZ5leIEmOy
	 J10NkT00A6+IXR2ZgEt0d9dlz7Az/6T2mVYQbWU5r/nIg+rFgNewNhurFLXpzTU5Ug
	 L/Q1YUTO79V6A==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34A6917E07F6;
	Tue, 17 Nov 2026 11:37:41 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	zoan37 <agentzoan@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>,
	kernel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Laura Nao <laura.nao@collabora.com>,
	Sjoerd Simons <sjoerd@collabora.com>
Subject: Re: [PATCH 0/6] clk: mediatek: Fix descriptor clock ID allocation
Date: Tue, 17 Nov 2026 11:37:29 +0100
Message-ID: <179491184088.148303.2061993914612529497.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921102522.1640072-1-akkun11.open@gmail.com>
References: <20260921102522.1640072-1-akkun11.open@gmail.com>
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
Content-Transfer-Encoding: 8bit

On Mon, 21 Sep 2026 19:25:16 +0900, Akari Tsuyukusa wrote:
> Several MediaTek clock providers have clock IDs that do not match the
> size of the clock array allocated by the common descriptor-based probe.
> 
> Add dummy entries for missing IDs so that the allocated onecell data
> covers the complete clock ID space used by each provider.
> 
> Akari Tsuyukusa (6):
>   clk: mediatek: Fix MT6779 clock onecell IDs
>   clk: mediatek: Fix MT6797 clock onecell IDs
>   clk: mediatek: Reserve missing MT8167 clock ID
>   clk: mediatek: Reserve missing MT8173 topckgen IDs
>   clk: mediatek: Reserve missing MT8196 MDP clock IDs
>   clk: mediatek: Reserve missing MT8516 top clock IDs
> 
> [...]

Applied to v7.4-next/clk, thanks!

[1/6] clk: mediatek: Fix MT6779 clock onecell IDs
      commit: 8dcfe9e6b3cc7e0a2ae54ee89b27fc75048875d9
[2/6] clk: mediatek: Fix MT6797 clock onecell IDs
      commit: dbed26f4c489548a1aed48db66ec9d7b98f4189e
[3/6] clk: mediatek: Reserve missing MT8167 clock ID
      commit: 3ccbdb37d10af155da69a7bf26dd68e62abd45cd
[4/6] clk: mediatek: Reserve missing MT8173 topckgen IDs
      commit: afd8231b5a43486458b5b17608e7f9986bfde675
[5/6] clk: mediatek: Reserve missing MT8196 MDP clock IDs
      commit: 8779893558124fd4e4a189c2bcb1ad4ae7014e9e
[6/6] clk: mediatek: Reserve missing MT8516 top clock IDs
      commit: 24bf5189aadf39d713b33e58b61f39854a99b1d9

Cheers,
Angelo

