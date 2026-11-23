Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.79.60.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795398707;
	b=PbSKW/nPXnZgYizTZ9pQGguGXsqomxFSt06i0NpSZjg75wAXOoRJI+0qdBoo3JfL3cJD
	 a9ZEusc1mA6mwSdErv3U+4zfNkxi+89Gp/Gu0Ng9ZZwD+ubp6pmM2iII6t+y6CKpa2S2b
	 FRr0SvKc9r3+36sX7O37U9wKgmbASdgL3fg8kEEaQAboM21vTGu2K+Wgkrf7Xhh0XrGja
	 qqPSsH1uYPum+85KuJfSU64wvl4QXJRieJBdI7TwDR68s1hRC9Pq9R/wr6p+3cw1Kllbm
	 U19q6a2OJla0SEUZ+ABRD5+Yd/NHo2rgli7jqEyKAOHjyOyeT9mlK3B0nLDjmjpVOeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398707;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=Q9NunyhRXef+uYLUVcBJxPIw1fxbnbcm5osyb8TqXYc=;
	b=QKsHkxh9PgYaOeSy15I6MtGYzYIdKm+Cmx2k5U70237sEmxSlpNpc8Omra7P+UL3dXrN
	 OoAA5QqdYxpGseqKEkBfcLcRqE15wI8F1xgSLTx7PJfcHFIlExefUSlINGx9hy+uqyiUT
	 HqmkcVfviia0ZlpPTRSwAp2w7HdDTGKhhvPiC9UmyMHbLaA91nA8iuVWF3S6JzsO1Smn+
	 9+0UU1pBHXK4YIBCVteuvn+KLE+ilh/U2oBgGkpfRMlaTmNoMLSf/zISVISqCNAwYChwM
	 UTYimqZdWBcIxWcv4KXZdw2lICRkEjpA4JlFIeaSPEhRPUALXhYtYOkavOxRQyJ9C/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b="NJoD1TY/";
	arc=none smtp.remote-ip=210.79.60.76
Received: from mail-m6076.netease.com (mail-m6076.netease.com [210.79.60.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3693606A31A;
	Mon, 23 Nov 2026 01:51:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3693606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=NJoD1TY/
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5595de3af;
	Mon, 23 Nov 2026 09:51:34 +0800 (GMT+08:00)
Message-ID: <5176e5e2-72f3-4175-8b29-1dbc64c4e418@rock-chips.com>
Date: Mon, 23 Nov 2026 09:51:32 +0800
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] clk: rockchip: rk3506: Add the SAI MCLK output
 gate clocks
To: Xiangyu Zhu <1194781887@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <tencent_C2AD19EB4A6C91A75AD3DC4089CB875C4005@qq.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <tencent_C2AD19EB4A6C91A75AD3DC4089CB875C4005@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa20619f63c03a7kunm9ecc2466b555bb
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQkwdVkNJH0hDQk9CTEIYGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=NJoD1TY/x5HC+BNx2DhEsOexcaA3iF2SBwoYNe3h21uciMr+ZKulGD2CmX3tWEuWoWlx+JRbSnUoWMVVqTcm+C10FJTNIwn1lVOklkI9jXhJJ21KejXGgvp9IaaViHs4YFlyGtsfsu7MPnqwVfPKHG58LodKmT8Ysv35BcjRq/k=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Q9NunyhRXef+uYLUVcBJxPIw1fxbnbcm5osyb8TqXYc=;
	h=date:mime-version:subject:message-id:from;

Hi Xiangyu,

On 11/23/2026 8:38 AM, Xiangyu Zhu wrote:
> The RK3506 has four SAI MCLK output gates: SAI0 and SAI1 are controlled
> by bits in the PMU GRF, SAI2 and SAI3 by bits in the system GRF.  Model
> them as GRF gate clocks so the SAI MCLK pin direction can be controlled
> through the clock framework.
> 
> This is v4 of the earlier "rockchip,clk-out" binding/driver submission.
> That one introduced a generic "rockchip,clk-out" compatible plus a
> standalone driver, which is not acceptable: upstream already has generic
> GRF gate support (branch_grf_gate together with rockchip_clk_add_grf()),
> and RK3576 and RK3588 register their SAI/I2S MCLK output gates with it.
> No device tree changes are included.

Please slow down the pace at which you send patches so that people have
time to read them. Don't send your patches within 24 hours.

In addition, your Message-ID seems to have been modified by your email
provider:

Message-ID: <tencent_C4C715C962613597F98212938F8940633306@qq.com>

Please try the downgrade the git version[0] you use for
git send-email, or switch to a different email provider.

[0]: https://lore.kernel.org/all/8771714B848C3A9F+9f64a309-ff70-466f-8d29-15950318b728@airkyi.com/

> 
> v2 registered all four gates from one branch table while only the PMU GRF
> was added as an auxiliary GRF.  The two system GRF gates therefore came
> right after two PMU GRF gates in the same table, and
> rockchip_clk_register_branches() keeps using the regmap it picked for the
> previous branch when it finds no entry for a branch's grf_type, so they
> ended up toggling bits of the PMU GRF.  The SAI0/SAI1 gates are now
> registered from their own table, and only once the PMU GRF was really
> added, so no branch table mixes two GRF types and the PMU GRF gates can
> no longer fall back to the system GRF.
> 
> The series now also documents the RK3506 GRF compatibles in the Rockchip
> GRF binding, including the "rockchip,rk3506-pmu-grf" name used by the
> clock driver.  The RK3506 DTS uses the same PMU GRF compatible; that
> rename is part of the RK3506 DTS series.
> 
> Tested on a RK3506B board: the SAI0 MCLK output runs at 12.288 MHz and
> drives the ES8388 codec, audio playback works, and the GRF gate bits were
> read back from the registers to confirm that they get set.  Enabling the
> SAI2/SAI3 gates sets bit 2 and bit 3 of the system GRF (0xff288004) and
> leaves the PMU GRF alone.
> 
> Changes since v3:
>  - add the RK3506 GRF compatibles to the Rockchip GRF binding
>  - look up the PMU GRF using the documented "rockchip,rk3506-pmu-grf"
>    compatible instead of the vendor's "rockchip,rk3506-grf-pmu" name
> 
> Changes since v2:
>  - register the SAI0/SAI1 gates from a separate table that is only used
>    when the PMU GRF was added successfully
> 
> Changes since v1:
>  - drop the rockchip,clk-out binding and driver
>  - use the existing GATE_GRF support like RK3576 and RK3588 do
>  - limit the series to the clock driver and the dt-bindings IDs
> 
> Xiangyu Zhu (3):
>   dt-bindings: soc: rockchip: Add RK3506 GRF compatibles
>   dt-bindings: clock: rockchip,rk3506-cru: Add SAI MCLK output gate IDs
>   clk: rockchip: rk3506: Register the SAI MCLK output gates
> 
>  .../devicetree/bindings/soc/rockchip/grf.yaml |  4 +++
>  drivers/clk/rockchip/clk-rk3506.c             | 27 +++++++++++++++++++
>  .../dt-bindings/clock/rockchip,rk3506-cru.h   |  4 +++
>  3 files changed, 35 insertions(+)
> 

-- 
Best, 
Chaoyi
