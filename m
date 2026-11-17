Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899204;
	b=QHmLN7jOxq4DnmOj+v2aiDB3z/rxwno7KAQujyjOjjfSOBJe3jXS0vWFVBgPJH3kqB30
	 Gh7+iID7gFBjOKLEfmTfMYHbIDx/fm5wE1ENSoB9AA3tKFkl4BtwEg5yKei+9ZJJBcPTM
	 gcbkBd9TtdNugc7q+92qkOWTZHeFYWnLHNCNbrM6DZtTRMFxVdPIlr5BlNRTdNzMbsH/F
	 2M6NUOJM6Mn6yT0L3NR3MBBDiAeEnoB/QhD83YbVdhXhyoJZoIdw9Ars0PYaE87B7yDxH
	 M4+Iu9A3yOs30wvDueM3g6/fuiGdy2ECQau0VYN0Z7/wMEoJwyCdZaPl+Ci+5SRDPlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899204;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=ErqlT8uu9onJmD7kLeSehR88okZ582+yvXLiq/u8Efw=;
	b=irCAp4xWks509yrlHqYrI2EvWaHjfUwEjLR9biiQO+OHMmyVhJX4iYL0184ioGkx2y7H
	 UAqRhc0LwWsFS1zbsvg5yx6d0B1WTsb3o7wGHn6+X7XtZQ0ktbTGOl4zF1J8J9j4Ev0XR
	 WMQtRWjcBE3mfVUjpXfvFCULYn9u0QXNYNkpfcguFiAYDVGvlCC/QCuaHzDTKiqqihFVF
	 WfcTIogLyvQu4laBHowVPPZ3ZCAaSLsEv0/GAjAg7b+79k9mvUwjny/LCGPX9z81C85jR
	 reAPCzJOkbEYfeFibBmXZ0ALnlfIbxEj931sMf4utz+7nPxIP1GpAfCKDO01DxQ4/Tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsL2DkMN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C62606A339;
	Tue, 17 Nov 2026 07:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsL2DkMN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794899204;
	b=oiQxN8SkiRVpnCxXDSzDtMQLSP2XfL/ASBgGzEhPQalVwzP6Lm0bNPXeQ7WXNfOT2l2H
	 6+ytwxkOXTUvFpad4+W/rSOKcEC/fKZ+vUCOBibMwJYOe0JV3wIT2HxoBt4XeO0pXNb0N
	 lusH+8pF4vS1ijb6esQe3Db+ISGmup2+Oy9BLujMDr2pnsDlx4dNRXwrfXW1uxuk/4oyB
	 PaLOm/rz3/WYR9LAd3H2HFr9Rp9iDbacJOrJYWMU3x2XnIBA7LAkEpUC2nwyS3OgEZ3eL
	 7rE7XVYTGOONNEGUqXUmMNSOz2rAIV68gjwHCXUnBONUTp7Rb1025bhJAg1QpN7H/Gw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794899204;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ErqlT8uu9onJmD7kLeSehR88okZ582+yvXLiq/u8Efw=;
	b=mMO2UOsDZRmc+N8rXDsUgkIH/NejDcYmXuUYgoOLtPhWChag7AZCOqArkkN5pKbpVheG
	 6/iq+DJLAmK5HUuK5oncyIBCqCMafr5tXHHQw2QggQ26ypd//2ITQHgneCc/2eZmpNIrk
	 DmwtOZnKDjWiNFTXKaG7l+gLCUkww1jQpYbbb9lwn9Gp1v3TOpQIQ6MEOVxY0t+kgxEju
	 ck/DdPhotX74j7nvhb3shbnZ7okmkM+PQI5H8KSUHGnGLhMtYchcTEktxdWAPIWxT6/hf
	 JcAxGSPJ39tuqmcmI8T6yl/zPAwHyimvGO6z914v/0I7UY3f9hUdAMY1cH8fbJ35iqw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98F511F000CC;
	Tue, 17 Nov 2026 07:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794899204;
	bh=ErqlT8uu9onJmD7kLeSehR88okZ582+yvXLiq/u8Efw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=AsL2DkMNFtg44Wb8r0PG4gpmQ4u/SA8pRXdj+p60UtV5oFzvnGYtbIK6oUwfNC43g
	 ovFeZr+rNYsfy++CETfeaA4fVXnHQKWP82BwXxUhXjKfodcfSSlF07g1p1/46n6AYO
	 xVKiBDiCUfwtwp+3YEfM42pKLzOCoUcwplJZHMInSNQIHYpw9DBdY3jLDPSQzNH8b0
	 EZA83Rxwdp4u0mbmPSJTkzxdP362WAPtsp+KTsJ9vjAoju+g1JR2rd9SSfn109WU5z
	 sju8Zf0iFQhyf9XMVcqyh+D0hcMblfh/ah6UdDpVf17KO3HpN9qc5bnDRpXEhY5KMj
	 7r7oqw3Ma7E/w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 271E34A6FE;
	Tue, 17 Nov 2026 07:06:43 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Subject: [PATCH v6 0/4] clk: rockchip: Add RK3572 clock and reset support
Date: Tue, 17 Nov 2026 15:06:20 +0800
Message-Id: <20261117-add-board-ok3572-c-clk-v6-0-cabad6610c5f@qq.com>
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
X-B4-Tracking: v=1; b=H4sIAOz8+2oC/3XP3U4DIRAF4FdpuBYDw08Xr3wP0wtgwGJtsdAST
 bPv7lKj2U3cy5PMfGfmRmooKVTytLmRElqqKZ+moB82xO/t6TXQhFMmwEBzBoJaROqyLUjzQag
 tUE/9+4EywzCiUhDRkGn5o4SYPu/wy+4n16t7C/7StT6xT/WSy9e9ufE+91sC/5U0ThlljkUcl
 BU8hOfz+dHnI+l6g/n+6pENJsMwZ4ZBaBf00hBzQ68aYjLQWRetMKgNLAw5N7arhuyG5AqcjAG
 tXRhqZgi2aqj+i5VCMuEdl+bPGMfxG88zvdzXAQAA
X-Change-ID: 20261023-add-board-ok3572-c-clk-090dfd552fd9
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Elaine Zhang <zhangqing@rock-chips.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: Cunhao Lu <1579567540@qq.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794899201; l=6582;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=6sJzRv9QfgUTJpwg5osDYEy1W96+xOk2+46BSTAQ4No=;
 b=8W+pI4Yevr4J421AC89b1HF8Lu9LIzmIbOIV8npWuvlJUGDPxuBafflMcIwsZv4+g9gD1eDl0
 Jj1XMpvtLCrDTbG5yBl9mwjlAxSbgCcO4okUeAjZ6aaD8qMAfn2O9N5
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
Reply-To: 1579567540@qq.com

This is one of the subsystem submissions for RK3572 support.

This series adds the CRU binding, clock and reset IDs, an internal
Rockchip 24-bit fractional divider helper, a composite clock macro with
mux-table support, and the RK3572 clock and reset driver. The shared
helpers precede the driver that uses them.

The RK3572 SoC has eight CPU cores: two Cortex-A73 cores and six
Cortex-A53 cores. It also integrates an Arm Mali-G310V2 MC1 GPU.
The OK3572-C board provides two Gigabit Ethernet ports, three USB3 Type-A
ports, a Type-C dual-role port, eMMC, microSD, and UART.

The driver provides the peripheral clock and reset trees, including the
three audio fractional clocks. It obtains the PMU0 GRF for the AUPLL
reference mux. CPU frequency scaling is controlled through SCMI; BPLL
and LPLL remain enabled for firmware use.

Testing was performed with Debian 13 minimal and Linux 7.3 on the
OK3572-C with the FET3572-C module. Shared peripheral tests were run with
the system booted from SD, while eMMC validation covered the complete
boot chain.

Passed functionality:

- SD and eMMC complete the firmware, kernel, and root filesystem
  boot chain.
- UART console works at 1500000 baud.
- SD read/write and data persistence checks pass.
- All eight CPUs start; CPU frequency scaling and hotplug checks pass.
- Both Ethernet ports obtain IPv4 addresses and pass bidirectional file
  transfers.
- All three Type-A ports pass USB2 and USB3 enumeration, data transfers,
  and reconnect persistence checks.
- Type-C host and device modes pass in both plug orientations. Physical
  reconnects correctly select the expected device, host, and device roles
  in sequence.

Stability:

- Repeated cold and software reboots complete on SD and eMMC without data
  integrity failures.
- A combined CPU, memory, network, SD, and USB3 stress test completes
  without a crash, lockup, CPU offline event, or thermal shutdown.
- Ethernet error and drop counters do not increase during bidirectional
  network tests.

Build and checks:

- The kernel, modules, and board DTB build successfully.
- Strict checkpatch reports the existing MAINTAINERS and Kconfig help
  warnings and a macro argument-reuse check.

Untested hardware and paths:

- NPU
- PCIe
- GPU, video output, and audio
- CPU rates above 1.2 GHz and voltage scaling
- Other low-speed external interfaces

Some files in this series are derived from the Forlinx OK3572-C BSP
Alpha1. Thanks to Forlinx for their support.

Thanks also to Rockchip's David Wu, Elaine Zhang, Finley Xiao, Frank
Wang, William Wu, and Ye Zhang for providing the driver source files.

AI assistance:

- Codex / DeepSeek V4.1 Flash were used for:
  - Reviewing and adjusting code style to follow community conventions
  - Automating tests
  - Collecting data

Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
Changes in v6:
- Explain the v1/v2 fractional-divider differences.
- Improve readability.
- Link to v5:
  https://patch.msgid.link/20261030-add-board-ok3572-c-clk-v5-0-9a43403cb149@qq.com

Changes in v5:
- Select encodable 24-bit fractional-divider ratios using the actual
  compensation and field-width limits.
- Keep fractional-divider rate determination, programming and rate
  recalculation consistent after integer-Hz rounding.
- Correct the clk_ddrphy_top_src and aclk_top parent selector mapping.
- Link to v4:
  https://patch.msgid.link/20261027-add-board-ok3572-c-clk-v4-0-d4152b4fedaa@qq.com

Changes in v4:
- Move COMPOSITE_MUXTBL into clk.h as a separate preparatory patch and
  use it in the RK3572 driver.
- Link to v3:
  https://patch.msgid.link/20261026-add-board-ok3572-c-clk-v3-0-dbabfa39d692@qq.com

Changes in v3:
- Close the reset ID gap while preserving the register mapping of each
  named reset.
- Check fractional-divider scaling against the actual field widths and
  reject unrepresentable compensated ratios during rate determination.
- Use signed negative PLL coefficients in the RK3572 rate table.
- Drop CLK_NR_CLKS from the binding and derive the provider size from
  registered clocks, keeping the existing clock IDs.
- Fix the indentation of the CRU binding example.
- Link to v2:
  https://patch.msgid.link/20261023-add-board-ok3572-c-clk-v2-0-90b98836be6e@qq.com

Changes in v2:
- Split the original RK3572 support series by subsystem.
- Port the vendor 24-bit fractional divider to the internal Rockchip
  clock helpers and adapt it to the determine_rate API.
- Register audio frac0-2. Keep internal SPLL factors outside the DT
  lookup so PPLL retains clock ID 0, and remove the unused xin12m factor.
- Link to v1:
  https://patch.msgid.link/20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com

---
Raw dmesg: see v2 cover letter.

To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney+clk@redhat.com>
To: Jerome Brunet <jbrunet+clk@baylibre.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
To: Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org

---
Elaine Zhang (4):
      dt-bindings: clock: rockchip: Add RK3572 CRU
      clk: rockchip: Add 24-bit fractional divider support
      clk: rockchip: Add composite clock macro with mux table
      clk: rockchip: Add RK3572 clock and reset support

 .../bindings/clock/rockchip,rk3572-cru.yaml        |   57 +
 drivers/clk/rockchip/Kconfig                       |    7 +
 drivers/clk/rockchip/Makefile                      |    2 +
 drivers/clk/rockchip/clk-fractional-divider-v2.c   |  371 ++++
 drivers/clk/rockchip/clk-rk3572.c                  | 1983 ++++++++++++++++++++
 drivers/clk/rockchip/clk.c                         |   10 +
 drivers/clk/rockchip/clk.h                         |   83 +
 drivers/clk/rockchip/rst-rk3572.c                  |  739 ++++++++
 include/dt-bindings/clock/rockchip,rk3572-cru.h    |  560 ++++++
 include/dt-bindings/reset/rockchip,rk3572-cru.h    |  713 +++++++
 10 files changed, 4525 insertions(+)
---
base-commit: a804c5742bff224d4cb4d25dd383554d598be32b
change-id: 20261023-add-board-ok3572-c-clk-090dfd552fd9

Best regards,
--  
Cunhao Lu <1579567540@qq.com>


