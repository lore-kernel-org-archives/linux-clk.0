Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B6338B7D4;
	Tue, 25 Aug 2026 05:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787635098; cv=none; b=MX5Bjg7UqSnSYvxhTSXOWKxCMFN0kYeNz+tyLm74qFPmrRMCBIzUSusJy80eBMnhmAKwEZ9S90Jp8GaU24FvpmcbgbOauWMvzDXFA+DLoro9bGw2GaP+d3C7inT0SDGmgtVGlW+Bvvm/l/ByY1SVE/Xq3SZ29JbJPv+1kkAUAgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787635098; c=relaxed/simple;
	bh=c8m+kP4UJbinGZZP2vZ7BLyVif62dvbVb9w5w4QtJ2c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DDRUMFRATVDKVa2nRV9IFuPpyqmuf61bFf3qJpirckGpN86ePmMKctOSfDonwSfn5brsMzJyhgVFXp1qZ+uBUy/zKIWyzE59qX6Ck5RhGwQrMA/fE9gbpcKV52dyHADJJDdSTcFw8st5Md/ccCYpiMOWfPK9dQhXK0GanpP8iXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GlvZm08+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GlvZm08+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86997C2BCB8;
	Tue, 25 Aug 2026 05:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787635097;
	bh=c8m+kP4UJbinGZZP2vZ7BLyVif62dvbVb9w5w4QtJ2c=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=GlvZm08+42w6wLq6hwEcRYRNHi+RyJXY9zp8MJI4NpgWSBe7BaDWDXlpkF7QVZcx5
	 bNR1NCG61x3IqaWsFIgol7BKR+Mdyp292HyRHWaWZlWKn2wONi8W3Z6FWawpfs+zCC
	 +ITBBUPWd+B9tMIrbJCmDgutdeLcdcDb5fshQJfCHe21V5bbWhS1aaYustaSPSbqSS
	 079hLZLMhQcgu2OA2Z4VyI2WvgG92VltBphNoJsczaTp9uSgOsMhw/uvSpvyRrscQ5
	 cD8CF3ssojd/SEf3M251aS1lJhDR0lepakd5GUOGKwmiIuIiyY0ercEMiBnBlOjPD7
	 wwyaGhfJom5SA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62541C5B572;
	Tue, 25 Aug 2026 05:18:17 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] Pinephone Pro Connectivity: Adding Modem,
 Bluetooth, and Wi-Fi
Date: Mon, 24 Aug 2026 22:18:15 -0700
Message-Id: <20260824-ppp_connectivity-v2-0-a4b0e11cd62c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOQQ6CMBBFr0JmbUlbEZSV9zDEQBlhEmlrWxsJ4
 e5WWDu7N/nz5i/g0RF6qLMFHEbyZHQCechAja0ekFGfGCSXJRdCMmvtXRmtUQWKFGZ2wj5N1RU
 XXkA6sw4f9NmUt2Znh693Mod9CV3rkSkzTRTqLFa5hF9uJB+Mm7cmUWzB/0+jYJzJc9GXeD52U
 sjrMLX0zJMVmnVdv9b81hvYAAAA
X-Change-ID: 20260112-ppp_connectivity-5edddd7b4904
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, linux-clk@vger.kernel.org, 
 mfd@lists.linux.dev, Martijn Braam <martijn@brixit.nl>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787635096; l=3246;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=c8m+kP4UJbinGZZP2vZ7BLyVif62dvbVb9w5w4QtJ2c=;
 b=eDOMM9OmCwYq19j0gxgg9RZnGrdgNhF6ujkRI210fik9net1+FPePUNOMqma7F1PoPW9p2xeD
 a56SRW7MxFjBjIRkeG3gkYif1H3LKFgLDw4rHnhD4d1/WZDeoDS1HWG
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

Continuing the work on upstreaming Pinephone Pro functionality,
this patch series gets the connectivity side of the Pinephone Pro
mainlined. Here are the following sources:

- https://codeberg.org/megi/linux
- https://gitlab.com/pine64-org/linux/-/commit/f9f847c6fd1

All credits to the following folks:
- Martijn Braam: original author for the Pinephone Pro bringup
- Kamil Trzcinski: original author for the Pinephone Pro bringup. No
  longer credited as I can't seem to contact this person
- Ondrej Jirman: maintains https://codeberg.org/megi/linux
- Dang Huynh: for the modem patch above

As far as I can tell, I've credited everyone that I know about, but
may be missing some because of how long its been since the original
implementation till now has been.

I've also included a short guide on how to test these patches. This
generally follows this page:
https://wiki.postmarketos.org/wiki/PINE64_PinePhone_Pro_(pine64-pinephonepro)

To test, please follow the following steps:
    https://wiki.postmarketos.org/wiki/PINE64_PinePhone_Pro_(pine64-pinephonepro)#External_storage_(microSD_card)

To build your own image, you will need to do something like this:
pmbootstrap init    # I typically choose Phosh. Defaults should work
wget https://gitlab.postmarketos.org/postmarketOS/pmaports/-/raw/main/device/community/linux-pine64-pinephonepro/config-pine64-pinephonepro.aarch64 -O arch/arm64/configs/orangepi_defconfig
make LLVM=1 CC="ccache clang" O=.output ARCH=arm64 -j $(nproc) W=1 orangepi_defconfig all
pmbootstrap build --envkernel linux-pine64-pinephonepro
pmbootstrap build --force device-pine64-pinephonepro
pmbootstrap install --sdcard=/dev/sdX    # Change /dev/sdX appropriately
pmbootstrap -y zap -a    # Cleanup everything

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Changes in v2:
- dropped removing the interrupt GPIO for Wifi as that is now merged into mainline
- reworked clkout2
- dropped all the signed-off-by's. credited in cover letter
- Link to v1: https://lore.kernel.org/r/20260112-ppp_connectivity-v1-0-284d6e83b212@gmail.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
To: Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: mfd@lists.linux.dev

---
Martijn Braam (2):
      arm64: dts: rockchip: Enable the EG25-G modem on the Pinephone Pro
      clk: rk808: Select the clock function of CLK32KOUT2 on the RK818

 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 69 ++++++++++++++++++++++
 drivers/clk/clk-rk808.c                            | 46 ++++++++++++++-
 include/linux/mfd/rk808.h                          |  1 +
 3 files changed, 115 insertions(+), 1 deletion(-)
---
base-commit: 237a1c39e8dfd3e1c6f1f023eea37a48ec04cc63
change-id: 20260112-ppp_connectivity-5edddd7b4904

Best regards,
--  
Rudraksha Gupta <guptarud@gmail.com>


