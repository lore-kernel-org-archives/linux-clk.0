Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704787;
	b=aSz5p2vD2p0qBD8MS0IIfsQLNUcoPcakuIN0l1UreGPs9fOyxke1M8DbdJfAc3g0EHFL
	 aqC2760kq83wH1kwPRL17ek75cX1TY07nZZVUx4/ImjW7choawC7z5VfavEo85T2UObR/
	 s0RpsQBWJtqKQc5GiLy+ho/tNt0xIwHhtVjLamLxlHJMdQbSPTCRv5+1hyOYDCbQqWr+c
	 wn+qLhqgtgrZ7fBCSsdGoyggbnv4LpzdRtKi/unGDhxvKrObZwje4s6GWe7hXNWgM1yFh
	 4Orjt85P6ZC3p2JfM6ZCtUO9dcieGyBQzKxSJ9zcoE1k5GHVbouwBK280qXE6ZJ4+zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704787;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=8rXTF8S6SCImfx4kGM4o+l4VsRYzP0ZTlhaF52aqdlM=;
	b=H6JkoAU4yZdNwDrAuDs21hagx+pvzvNf+0FEpW24vh10Ie2gOmRXmyfNgVZixM973Xqw
	 1UdMx8paoYN23K40up4iU9FH0Cfb9JSuk6EgythMi4P21HpjvYPm1+DAOa+UhgUr714ac
	 3YwFkPQ9bWGEQxu8y/9oAQ8ZvXnKVKPWhH8SkJERXJwQjkYZlzHIotkStErL3ShblyxAT
	 6czHrs1mqdFj8pXajpMYckH/a8Y8YkFkH0nbVf4XqtbMb4pg0zndDi6SmqAWYe0YAW6VA
	 2uExwDMz16y6g3zk7Ie9qbdy2c6kRg52hqn8dXixd2r7Hb+NN8lqT9Nu40iMp6qxvwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=JnBWj0E6;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A54C606A687;
	Thu, 26 Nov 2026 14:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A54C606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=JnBWj0E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795704784;
	bh=Z99yblWrGkFB95zdt7nLTwpaeA6d3IbLOed7B8698CY=;
	h=From:Subject:Date:To:Cc:From;
	b=JnBWj0E6QnDwyfw1exMOhkXOAGFxlmwTm2TCzIY6++muW8/bI55BssVCc1KrCkszk
	 Ilp8hKPhXdd4wYM3YMKe9m76/ylB+UQiQO+ZVE2/SKHZg2BNTMRBgtYVAmJtrbdrvz
	 D9bTDmWA55wZUmzGOlLf8jNcdW5N2PO3R9cIGe5FQceXxd+y82Yiq9RpKQUowCIMpE
	 T2fvkZegMoeOqhpMlCh2WMzsjr5A4CBW7FzT2PK4ndUTE4l0FziQh+aSe6Xzm53DHY
	 sn8P4vvV+gyKC30pRdfrLuRZ5YtSnnAvQCoaE8DydCgDzkT9MoJvcoq8nxVghh63aN
	 1xrS3k6NR8XPw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A2B0817E04F7;
	Thu, 26 Nov 2026 15:53:04 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 5F1AD48002C; Thu, 26 Nov 2026 15:53:04 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v3 0/6] arm64: dts: rockchip: add RK3588 DFI clocks and
 RK3576 DFI
Date: Thu, 26 Nov 2026 15:52:35 +0100
Message-Id: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAwA0F8ZORuwLVbwV8TD2qQaJ21ptiGM/
 btVj+/yNlBuwgqXYYPGq6iU3OEOA8THmO+MQt1gj9YbYz1SEoyvEifFMRO2yZ3OHnWptbQZUyS
 y5HgMJkA/auMk799/vf2tS3hynL8p7PsHXuRevoEAAAA=
X-Change-ID: 20261126-dfi-clocks-and-rk3576-support-fcdd2d3eab1b
To: Heiko Stuebner <heiko@sntech.de>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chanwoo Choi <cwchoi00@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2148;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Z99yblWrGkFB95zdt7nLTwpaeA6d3IbLOed7B8698CY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsIR9DT7D1ADUqu10Ej8STv0K6p4ddyE2Zkf
 9D4Riz24KluqIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCEfQAAoJENju1/PI
 O/qaB4gP/08rY1SXm09rN9dmsfpvQiHOv5lh0aYWhKoGnZM5ReM32Pp7hWrJmOv0iaWmCgn7LpF
 s5D404oX60djiXBY/gvzNcArkAGxv+kpWVWKRcO/NPUjatF/PDDSTQ/sSR7yZyI4zQ/pPJsfeHk
 TxM/6HMRTcrqqrUuTYoaluNfCMv9DpR2VEGQNY514O6JvsTtBOk0k6D+fXrTaooMl6XfvuKkwrq
 wzO9N3OgF7k0hTl9naQrXncuDgsSpriubmLgwQTj8gC3IGS17gmjCFJz6zueFWziGAw8RKTdIj2
 IndJXkfzU9s9cgvtXf8RgJUc3bm0Td1EPwuOui4LCjDljlMVyxEUz5hxi5sqy7UZABfL50Am+Cz
 V4uTknk8Re8Xf9UZCarkPnwUA23MIgN+dvNHky0KH3FXOB2t4kBhdvxa+sW7/Yo1i9FUIeddu4T
 CbV9H4P+UUGcjwpdOjf/em86FM5XTUi0+PTE8j4suRuyIR2vfxFB1GoOf3KpV4AimESkbgCovAa
 dOGj9ZdJIxno54075yV2FVoA0SzNsDy0Rr2mJaSPoqSIv/g0OqqFFRcrQmW6Z/t51la7L4Rg/kv
 hCPqlOqqnahlS+PXAe+v5qYZoAt6P9jaOIlpFxdyAIRDqBrv2dfI5jqWJAaR4JuIghiIr8pYN3P
 TQhJFHWaa9QiCY8xwA2k6qQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

When RK3588 DFI support was added, support for the clocks was missed.
This series fixes that and also adds the clocks for RK3576 as well as
RK3576 DFI node itself.

The DT binding for the DFI side already got merged together with the
driver changes today, so there is no dependencies for this series:

https://lore.kernel.org/linux-pm/20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com/

I expect all patches in this series to be handled by Heiko and kept
them together in one series for simplicity even though they go through
different trees.

Changes in v3:
 * Link to v2 (part 1): https://lore.kernel.org/linux-rockchip/20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com/
 * Link to v2 (part 2): https://lore.kernel.org/linux-rockchip/20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com/
- Split out clock and DTS patches from two DFI series; the DFI driver
  patches got their own v3 (and v4 got applied as mentioned above)
- None of the patches in this series changed compared to v2

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Nicolas Frattaroli (6):
      dt-bindings: clock: rk3588: add PCLK_DDR_MON_CH clocks
      dt-bindings: clock: rk3576: add more DFI clocks
      clk: rockchip: rk3588: add PCLK_DDR_MON_CH gate branches
      clk: rockchip: rk3576: add missing DFI clock branch
      arm64: dts: rockchip: add dfi clocks on RK3588
      arm64: dts: rockchip: add DFI node to RK3576

 arch/arm64/boot/dts/rockchip/rk3576.dtsi        | 11 +++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi   |  4 ++++
 drivers/clk/rockchip/clk-rk3576.c               |  4 +++-
 drivers/clk/rockchip/clk-rk3588.c               |  8 ++++++++
 include/dt-bindings/clock/rockchip,rk3576-cru.h |  6 ++++++
 include/dt-bindings/clock/rockchip,rk3588-cru.h |  4 ++++
 6 files changed, 36 insertions(+), 1 deletion(-)
---
base-commit: 0202125a80af9dad6d762dfe52572b95ca7699db
change-id: 20261126-dfi-clocks-and-rk3576-support-fcdd2d3eab1b

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>

