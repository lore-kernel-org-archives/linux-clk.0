Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911867;
	b=h5a3eanATYAEksrHPprkpK3UW+GOo7M2vAL85rlU1mhTA3snuEF6m4RVlo46JucfWkaE
	 5LNGwiIzfIRuVn2fP00G8yVtmhLNS2JN8c2Ub/N7UZ/b/hP1SBO9EPekxBcXVXB+4OzUW
	 69pSkLkqB4BB9JkjMVBf6A3LWHl55aXX9CDVEechwrRCrdnn+aYHkjDtI/GmNardM4L+O
	 ecWyDE+XVvTzFBesGS+Flal2L7/286PoaHZGRwMPMmtEsOwiVCHfDNFb+U81XaVudW6R5
	 j4YEvvylgfosekt8Fnax3rosKMme6GSGXThBO+9f0ejSWwg5ToW0VAKvf0Wiqv9tXcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911867;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pF2uX8usi/urRyXLEA8qruLqKt0rT757jeRqUbBO8Wo=;
	b=xBLQt10y11I1Lt89IqaMkE08bw+ZSqr66Tv2WCzoQ3q7lf+6ysVex7z98y+W241T0m0q
	 aByY+NsgFjTOzlHv13SFPsqESf14T9lOfjS5rHj6uGKBi5hvcplldB6wanZjg9jBe6i7D
	 wC3VH23av65y4Fsq0UO+JXLsXLq09U4/GT2k9r9SU8splNMQa3o4GksWnpp+hwyeUWpk7
	 29zffcIUyRFZWC2/6OyseV6brPYiV/6ujxZMmZ9qlL1lVnaQLTcPR+62w5nyUGt4n5hba
	 5AhGbuoz7JzMeuplxy3JZnM0uGfwniJ2DW06k+E7ziwLARsGC53VEJJTNufhJJDmRTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=FBXGh9Xr;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC36B606A330;
	Tue, 17 Nov 2026 10:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC36B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=FBXGh9Xr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794911865;
	bh=tzmU+oKL8ufSRRiPnLgwPQcHnJoIFDbyMhFuK367CL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FBXGh9XrZVP9Cs2qXMT19upl0khfXGHZuJ+p1wigI2HcJXTvxl/k4G0YSLXV19XXy
	 QIaLFV31wdlSJIsUsfiN3Bv7BCFm2yhvmLVn9XiRVdTtJ21AkhtgqzqkZb2o4lEace
	 xIqCQq9/pabvbww5uB2tB/qYeYN6lfs0qFl7p9rqYYtt2ReuZ4e8mStNS+/kuypB+j
	 lNfPhTo/ZlHdaBW/kOuTYqvuanTUMklYYQFTi6djmVOVSCtWynfLXG+cjew5kuK4+a
	 j2LNQZiuuPUemcPNXbG2Csd8rv1+0gxncSIFDoM3oIQcJounZzb7A4R8JDDNBVNLxq
	 BUQQnZaac0z6Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 88E3917E0D3B;
	Tue, 17 Nov 2026 11:37:44 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	zoan37 <agentzoan@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Ryan Brue <ryanbrue.dev@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>,
	kernel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] clk: mediatek: Fix FHCTL DDS mask widths for mt8173, mt6795
Date: Tue, 17 Nov 2026 11:37:32 +0100
Message-ID: <179491184086.148303.17587897994322834590.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
References: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
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

On Fri, 13 Nov 2026 14:34:54 -0600, Ryan Brue wrote:
> Discovered this while working on bringup for the Amazon Fire HD 10 (2017).
> 
> In f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping
> through FHCTL"), and 45a5cbe05d1f ("clk: mediatek: mt8173: Add support
> for frequency hopping through FHCTL"), the DDS masks were set to the same
> GENMASK(21, 0) as mt8186, mt8192, and mt8195, despite not having the same
> pcwbits (21 as opposed to 22). These two patches correct that.
> 
> [...]

Applied to v7.4-next/clk, thanks!

[1/2] clk: mediatek: mt8173: fix the FHCTL DDS mask width
      commit: 351444cd006ef61fd925f757e86dfa27a83cc4f1
[2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
      commit: 336f7db3af40ccde96849f73cce2952b017b256c

Cheers,
Angelo

