Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911863;
	b=WyIlYhR1Cy3x9ul0LTM+PTwtxyMfHatiqFcBsq8kAUCMp5yOch67NVroqnnMjs8Dxwrb
	 OYCJhgyI9Efp7Ncsrfn2y29SM4QXRLeO5gGByEor0D0+QQmSvsrm5Lxk13fNHJxaKX4cD
	 /iX0+aLKRw5NbGe5A+4e5OsmwaIKGJIr7GbbOaCZtLgIwmLlgYn5qVWWRD85JEeWubN3q
	 eu1RxJrQAWmqC6kWZpV07ubbhguxZCuqLTOiBbnDj77Li/C9TmhErDx1eeC+7nd1Bln3A
	 xGo2RdXrqLMlTko6JJX9uzLpFf1IaqRvNNy50RJkP4+GeOJnge2sgE6RkCKmwp9v7HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911863;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=OCzz8H3TxGw+/7vThngYzbxdUKCNb5ZLl0FSNCHEuDM=;
	b=OQTc4HTgrEGtA+fAxPAGi7U5IXwz237HCz5Vur2hxz+WzOiO35UusJ6lKAH2GOziy7iD
	 fzIRgY7yQ7mPl2CAfxyGIfS6eJfZjWmEQgALDXL10a3RUDwP0xdOx8ywSQ3xf7TasIGy0
	 +R0sbbcNeLuMYXbQtdNs+mcS+no46tbpLyeFkiggHc5KCiyNEtqrkz91CC4XQ6JrTPEDi
	 a1Oq0cL5XcIqqkhqANb3QeqI4dJ4AcBFNgda0tbWj8eyArJwGlwGiN124PDUc8ARZawlb
	 dw7kDF1ch+yiY5nXJkQG4hsedUj52TNb9y4BlQCMzIt4/rY6fOM8CzyGthCmi4X+g3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="BI/rwMNA";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9D0606A331;
	Tue, 17 Nov 2026 10:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA9D0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BI/rwMNA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794911861;
	bh=oLqHnWeNPaNdJvvx6L2o2mFp/Q4oW4bnbdNmRLKxZDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BI/rwMNAkcMEaokg5Oiw8hB7K9Wjfa9zEQ0Yu/i7ruK9nuDO5Cna9wNSTCEpy6eT0
	 cwBldOlab7IGa3B9krgUJ1ugvTykE4asthlyc4+kk7A88T0BPCU4HdlE6fJtGBhXWW
	 8u+IglTLU1ges3fmtfS9al5H4ZPcD/EKbxPWuZSbWWxqbHOm/N0EbKM+u8SZI+34fw
	 CFbuoS7CRWMPg3eBfmMmoZcdRGyh92k6CFER1kk9z9zRdQ+DIUYLUq6Hev0lr4b0Up
	 V0UpjC3UixsWoRhD80a3rHQDm7EoraFgOgmXU8XiJlcHRF3t31J6YGMTLcCuUlsMQG
	 BAkkCRUe2oRJw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5F2A917E0390;
	Tue, 17 Nov 2026 11:37:40 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	zoan37 <agentzoan@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>,
	kernel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: mediatek: mt8189: Don't let the GPU reference mux retune MAINPLL
Date: Tue, 17 Nov 2026 11:37:28 +0100
Message-ID: <179491184090.148303.17314033722735832543.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011195612.1663714-1-agentzoan@gmail.com>
References: <20261011195612.1663714-1-agentzoan@gmail.com>
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

On Sun, 11 Oct 2026 15:56:12 -0400, zoan37 wrote:
> mfg_sel_mfgpll selects the GPU clock from mfg_ref_sel or mfgpll and has
> CLK_SET_RATE_PARENT, so a GPU rate request (Panfrost devfreq) goes
> through __clk_mux_determine_rate(), which evaluates both parents.
> mfg_ref_sel is a MUX_GATE_CLR_SET_UPD() and so also has
> CLK_SET_RATE_PARENT, as does its mainpll_d6 parent: through it, any GPU
> OPP can be met exactly by retuning MAINPLL to six times the requested
> rate. mfg_ref_sel is parent 0, so it wins over mfgpll whenever both match.
> 
> [...]

Applied to v7.4-next/clk, thanks!

[1/1] clk: mediatek: mt8189: Don't let the GPU reference mux retune MAINPLL
      commit: 838ddf25b4f1350a115d8921b47e9bbaa773a26c

Cheers,
Angelo

