Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA52C25F988;
	Thu, 20 Nov 2025 22:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763677401; cv=none; b=l0o68kuaGBWRZe8jtHt+TE2gvY/4/iEaCl5LEQOkmBeGuVu52pNggsLGUiHVUx1oCU4jCqqk2PIyqj+Xw27CyzeDV7kRDE1KIippAgrguTi4JsxteDgnyW/mLSVmlE/w8lXK6LM+W1aYipj9wuYks32G3QvBpdHSBxmrHxqmCVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763677401; c=relaxed/simple;
	bh=13TBXBAZghj8+qMUGsT38LFJQAMa3KfpxxBGOMmKf4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JQvyMMHQD3iqAuyHzNhYHqD6A4UsKERMEiXKtP51uz2JdkboyBuN6cOrGM+qC1KsKdrdF95WMUqzlRT1CsbOv8J5l1/E9RBfAqzPSoZI9rfDuoq60NZ6MUif/X/AmldAUabItuVuseNEJXQLcg//3YRYzuGgTSRtK1khoXblOsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=GrDEL2lU; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="GrDEL2lU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ay8G70TckXdWe0geBLoljoycveBYJmFxR6OBjgKDvCc=; b=GrDEL2lUZb+iMM2U6dyw1oWvgB
	F6SkWcwJhO2331gNGz8Ujq9IJ1839/huZe55UrbsqN9ZbSIA/Qntx1EI8lj05BQk1Gg2ELNYSxQVH
	a/ODTCDwU9CMDiaeshGJW1Mg1JHisdNLs8nkb5aNruyIeye+W2iUchlgWckP9ku89qC8kn6SfQ9qi
	ptNwjKulD56Pm7Fr33LRmcz+AyYnjBXyXTlC8Y6CqjnLsW7oVwJ4G2z8Ke2mtKRux4ZWVjNgik/D9
	M/dHQsu5vO0T4upaoRhXhuDw6H6J0qQET5ipKeTGTJrY7M0++rTpJNXr6xgYwG+TV01ihQOLJ98Xe
	yhtknFVQ==;
Received: from [213.192.12.196] (helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vMD3a-0007Je-KO; Thu, 20 Nov 2025 23:23:14 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Elaine Zhang <zhangqing@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	finley.xiao@rock-chips.com,
	sugar.zhang@rock-chips.com
Subject: Re: (subset) [PATCH v7 0/5] clk: rockchip: Add clock controller for the
Date: Thu, 20 Nov 2025 23:23:05 +0100
Message-ID: <176367711155.9778.8068115837215397006.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251111025738.869847-1-zhangqing@rock-chips.com>
References: <20251111025738.869847-1-zhangqing@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 11 Nov 2025 10:57:33 +0800, Elaine Zhang wrote:
> Add yaml and dt-bindings for the RV1126B and RK3506.
> RK3506 depend on patches 1/5, so it is merged and submitted.
> 
> Change in V7:
> [PATCH v7 1/5]: No change
> [PATCH v7 2/5]: Redefine clk id(start at 0), drop RESETN for reset id.
> [PATCH v7 3/5]: Drop RESETN for reset id.
> [PATCH v7 4/5]: Fix "description: |", drop RESETN for reset id.
> [PATCH v7 5/5]: Drop RESETN for reset id.
> 
> [...]

Applied, thanks!

[1/5] clk: rockchip: Implement rockchip_clk_register_armclk_multi_pll()
      commit: 826eaa8f5bac6e919cf7c0b4161b2d783fdc45b3
[2/5] dt-bindings: clock, reset: Add support for rv1126b
      commit: d0d9a9629f505ac70e1ffd172e092ff71f5d989a
[3/5] clk: rockchip: Add clock controller for the RV1126B
      commit: 652c108cc44cd961b58b2998ff429f11ee60c9fd

Please address the review comments received from the DT maintainers for
the RK3506 binding - adding the xin24m supply clock, that is also
present on that RK3506, as with all previous socs :-)


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
