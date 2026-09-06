Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77970233956;
	Sun,  6 Sep 2026 07:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788678454; cv=pass; b=q/f7ehzj1+8zly1SGZ15b3asYpSmNrtHt19w7Whv1YrHrm/YKOGlBEMfSpsQzIXTkqPg88XnWEYAcEvIiUwPQET9ZUkCL/ois/96FqHBtsPt77s0RrItmzENG4sMiokG8DoAKrSTELjeQBuC2EmDwPbtjXDUjoCAXFAOSwu3qPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788678454; c=relaxed/simple;
	bh=iKacs7dw+/b845xjJsLw2XuiPPAnkyl59zLiFFJQOGk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HdLpPkjVZ7glXOg0ueeP2R3W4ZjDyNWUmMO/eD/YWtHyffzE0LTeDVIAdV/ZeV4nuZuqfZDHTlJFmmNNJVQKxFDQZ9/O86PTBLK9/EUe+A3vAakHWVhKfxkA/GjYVMqPDe1wJ/mdrp2rkBHcZ0E6TO6QIFJfUBrI7f2A39iuBCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=Y037Dvrw; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="Y037Dvrw"
ARC-Seal: i=1; a=rsa-sha256; t=1788678429; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GU8Gw3pgmv5ENNEAPoh9K5f5gUMs2yTtMoZ24Vu2oIfXyiivo9utKhkzdMujzBf34Ldtsln8uN/PSbEEWxGroSnCvECwaQVwoAc8R+8E9UcJIKTpL7XGEFv4JZ4VmOPE8Y8y1uo27mT4XZCt9z5E74uEsq7DCl7fPvR++wc0CQk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788678429; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gefUybkzcJMt8GUfplUl0JMUrxgfiEae4tnmk2w8Y4A=; 
	b=TZyhfMyKLQIKizNMdn1JCFzYd/Tc0WoNmmLZAJZ+Bo7MG3mcEmAIYNEN/dEfYgZKtC0ljMkcQByNzQ0wfCMhEp8kvEEDKog/Hnutuidi5aDLAydKE62vLIV61F5o1LHd4d4ZpMxp7WxJ96ijeezYrl1YwQSMUcGHdQP1XdF4EhQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788678429;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=gefUybkzcJMt8GUfplUl0JMUrxgfiEae4tnmk2w8Y4A=;
	b=Y037DvrwqTN5toJhjziaJ/7FRQq2TAxLR/eKe1KKfQDh8xEQYGa0TGqrZ7sR763/
	PkYM+/PXwZKObE4Rzo5XlcOiJ2wfA5NWnUhUtMKoeOz+QRfDJksb3C3R383q+D+LT8K
	uAtkqYA/ccvP9mJ7Fe0LJvPHoABug0ID3f9qDIGg=
Received: by mx.zohomail.com with SMTPS id 1788678426986262.3131105999689;
	Sun, 6 Sep 2026 00:07:06 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH 0/4] clk: sunxi-ng: a523: Fix single-divider clocks
Date: Sun, 06 Sep 2026 15:06:37 +0800
Message-Id: <20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwMz3eLSvIpM3eScbN28fN0C3ZRUY1Nzk1RTCyPjRCWgpoKi1LTMCrC
 B0bEQfnFpUlZqcgnIFKXaWgAkAhN5cgAAAA==
X-Change-ID: 20260906-sunxi-clk-no-p-de3574e5823a
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2495;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=iKacs7dw+/b845xjJsLw2XuiPPAnkyl59zLiFFJQOGk=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLLmCrK0Z2RuORfzuqfXZbOq5v8wY8eCVQtE+9mcW6wXZ
 UlpPW7pKGVhEONikBVTZOHyF/9nrcPz7YhA632YOaxMIEMYuDgFYCIGTxj+KZw4mdunZRVYFLtU
 L3vmDr+0XJ2dxabrC7Mnn9eSYZivzshw8sIG7v+bGQ0mmOzddjKlOrlB0843a0Ob9KU/y/YWyC/
 nAgA=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

Sashiko pointed out two issues in my series adding clock driver support
for the Allwinner A733 SoC [1][2].

First, ccu_mp_set_rate() generates an invalid mask when an MP clock is
defined with a zero-width P divider, clearing unrelated register fields.
Second, ccu_mp_set_rate() does not handle CCU_FEATURE_UPDATE_BIT, so
divider changes are not latched by the hardware.

The affected A733 clocks were modeled after the existing A523 MBUS,
IOMMU, and DRAM clocks, which have the same issues. According to the
hardware description, these clocks only contain an M divider and should
be modeled as M-only clocks.

The A523 high-speed and PRCM timer clocks have the opposite problem.
They only contain a P divider but are modeled as MP clocks with a
zero-width M divider.

Add a feature-capable variant of the M-only clock macro and migrate the
affected A523 clocks to it. Convert the timer clocks to the existing
P-only clock type. The affected A733 clocks will use the new M-only
macro in the next revision of the A733 CCU series.

Tested on Radxa Cubie A5E with CLOCK_ALLOW_WRITE_DEBUGFS enabled:

  # cat /sys/kernel/debug/clk/mbus/clk_rate
  600000000
  # devmem 0x02001540 32
  0xC0000003

  # echo 300000000 > /sys/kernel/debug/clk/mbus/clk_rate

Results without this series:

  # cat /sys/kernel/debug/clk/mbus/clk_rate
  600000000
  # devmem 0x02001540 32
  0x00000003

Results with this series:

  # cat /sys/kernel/debug/clk/mbus/clk_rate
  300000000
  # devmem 0x02001540 32
  0xC0000007

Link: https://lore.kernel.org/r/20260905164854.57BEF1F00A3A@smtp.kernel.org [1]
Link: https://lore.kernel.org/r/20260905164855.57E751F00A3D@smtp.kernel.org [2]
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
Junhui Liu (4):
      clk: sunxi-ng: div: Add feature support to M clock macro
      clk: sunxi-ng: sun55i-a523-ccu: Use M-only clocks for MBUS, IOMMU and DRAM
      clk: sunxi-ng: sun55i-a523-ccu: Use P-only clocks for high-speed timers
      clk: sunxi-ng: sun55i-a523-r-ccu: Use P-only clocks for timers

 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c |  37 ++++-----
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c   | 128 ++++++++++++++-----------------
 drivers/clk/sunxi-ng/ccu_div.h           |  18 ++++-
 3 files changed, 88 insertions(+), 95 deletions(-)
---
base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c
change-id: 20260906-sunxi-clk-no-p-de3574e5823a

Best regards,
--  
Junhui Liu <junhui.liu@pigmoral.tech>

