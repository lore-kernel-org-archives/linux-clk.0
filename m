Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628B827BF93;
	Thu,  6 Aug 2026 16:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786033575; cv=none; b=OVMFIKSat/GVJNGd1vlhzbojHb4MbMEVNlh0AWQ0yzniNnlWO6gSC6X9LOBdtWAWJ3J8Ln6zrHAL/03MYYwQcv1FMm4nZ2zB3TwhNhYlkDJxEc4fn24vePVhtwU4A7L2GmjQSd6d7uWMggGcUhpUJrSqhHmXP3NIHR/VEYamwos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786033575; c=relaxed/simple;
	bh=vp3HeyBsKm5QM4/gsd7Sj5jvC9ezIp8qQvyYAsqqfX4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TTw63OPfXtGqjuGRgmFf8A2wRsXOnOKXyufDTUnbBna05wcRw3wiATZ8BLPqyiTZxB4UBRNhf/O9anF2ZeYxpID6l9/tPvJMQcxsRXyfCjIWSE6xJhQMXQNieHE6fTeimYe3gGOi6/alQcIDRr8Uks6D1QYbvYjrFMu7bjSbyTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yo1YvEtl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yo1YvEtl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D0C1F000E9;
	Thu,  6 Aug 2026 16:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786033573;
	bh=FKkPZaVYoltg/L8op3kBjttnUeSwREqYX0CaIydI8ow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Yo1YvEtlsSycfv4PyQF/qZI7okNOuWjDJ4W4tB3NbkJALUqICb3yHIaoxuxpo3ZEU
	 DiPf8Kk9ydFEK5BRVNVo3c4hKYCKIcuZUr4jnZQTp7mBo0NxCSnl++Tfnl0cnxeLfI
	 /CHdZ4c5LGB/UNEvZHM5ALOHiqzLdY/W7JrWJpVL2jc6QMYRSbHHvj3jrPD8LSzuaE
	 a54ehei8mxy/pLchdt5QJbqQQW22uWWpo8JdR56ldN5yWolP5hRvtNlSQqtsdBGp4k
	 Qzqu8TbWgdoZxZYbX41RBlxg/QP3knQhX/45Mw3UpNG3HiCGVN5InNKk6l/f6oPiSi
	 sHmciL2c0GLwA==
From: Vinod Koul <vkoul@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
References: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
Subject: Re: (subset) [PATCH v6 00/10] Add RZ/G3L USB2.0 host support
Message-Id: <178603356779.674490.693458204654739135.b4-ty@kernel.org>
Date: Thu, 06 Aug 2026 21:56:07 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 06 Aug 2026 11:22:19 +0100, Biju wrote:
> This patch series aims to add USB2.0 host support for the RZ/G3L SMARC
> EVK. The RZ/G3L USB PHY block is similar to RZ/G3S, but each port
> has an OTG controller, unlike RZ/G3S, which has an OTG controller only on
> port 1. This series migrates regulator driver to use id-table so there
> is hard dependency between reset driver and regulator driver.
> 
> Merge strategy:
>   An Ack/Rb tag from Regulator Maintainer for patch#1 and #5.
>   Patch #1,#2,#3,#4,#5 - Reset subsystem
>   Patch #5,#6,#7 - PHY subsystem
>   Patch #8,#9 - Renesas SoC
> 
> [...]

Applied, thanks!

[06/10] dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
        commit: e6c3be558da06062a6a6fcbb8d33986832db3d60
[07/10] phy: renesas: phy-rcar-gen3-usb2: Add RZ/G3L support
        commit: 881f6b6f4ccdbdd6b856a574445694bb1f56d79e
[08/10] phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for disabled VBUS regulator
        commit: 49c9b71b45081e5e5eeb507a2d6edb80d332dc59

Best regards,
-- 
~Vinod


