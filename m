Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795822954;
	b=XODqGaJ/mWwsUpggsyCxBiWDZTeE89WO8YwQMoXeDTsvW6DviTqMbPq5NhUwDWmPO40h
	 /Y8+BkITbAdh5dNOVgAmUfy5u8F56uboNQWHy4rLcnEbe3XX1SMtsSyXQ9H/hicdFCtAC
	 3eKldFKB9q23lW2okUA2lOj7r5E7TbvdDHH4x02CvC+vEBQOC1U/4EzBKYj0K0+PVqCzB
	 GGxycqCpugbGg1NoVHJDrF1p/bkavQK4dLpRpv194p5poTANfr5/S9TH3d1y52DqKFLf/
	 516uRzaSjJsmtMVMclPOrcgRwDDYLCeldTgzaNlfXCYNZgakk8a1DJTO53lX+L3R2rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795822954;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=0HKgOf2neF8BsNKIMfwNTXBbMcaQ/qjnZDjWn2cWxT8=;
	b=UeqmaJCaQ+2tofbF5F76YIRBi+NeuVpqC/JXxwQqznP/6vFyVahUm0xGtfNdSAn8HQue
	 hcD2B+QKXKpXlAFWQUOOpZLtWQuAfSRxh1D/ngBfFO3Vhp20Tbwzgx8V549CKgva6ejyM
	 QzQTFno+QCgS1TxvQ13nGCuB62jXTtvq59vO8lsJ1i0x7oKl4lco1Qk2nigee2Zx8i9oY
	 nbTCDPgszrrDFK6m8q4K+eolCUfGN1CAe+nc4SB0yEKfa4FvLgI1ZuaLBoNPRFDpuqcDQ
	 9suFxE+MXIAS0nVjwwIsiKXFzESDAVQUU1XmtlVLkyyTHDqJNWjqTZHaS4NK4LNxukQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D9JEzgMn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C359606A31C;
	Fri, 27 Nov 2026 23:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D9JEzgMn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2266A1F00893;
	Fri, 27 Nov 2026 23:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795822953;
	bh=0HKgOf2neF8BsNKIMfwNTXBbMcaQ/qjnZDjWn2cWxT8=;
	h=From:Subject:Date:To:Cc;
	b=D9JEzgMnxeoZtCXLy2bp7by/IYxROo7J7yJyAfyPP3jgcWjDfL7W8iD7ZzuEsS+P7
	 Z7hkK2V5aLU+zPjyZjd7DiyqSLt6LjyE/tQ0/lLZY3LR3OyaUVgnUTLyV5ROoS3ghR
	 j7R0tcWhZl6B6NtbVBGnhnLgftbKh6eJq6mPF0ZAzB7PGpVNN3XlbWt3Dw0uY5q/CS
	 DixVsJXEXHdh6ox62F2HW/Tz1Dhuwhx15LXiBhZNPcwMlGQHdNUk4WVUQ3NQlN1AuO
	 o+lYlxg7+dCe57xPa1A8FvOa5uLfNJQ/ZG/mvPAL5JhjHHbUDwQY/2plOKo941Fc74
	 j+iChQZBWyB9g==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/6] Move DB8500 PRCMU clock policy into the clock
 subsystem
Date: Sat, 28 Nov 2026 00:42:28 +0100
Message-Id: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MSwqEMBAFwKs0b21DEohIriKzcJJWGz+RBEUQ7
 z4wdYB6UKWoVAR6UOTSqnlHINsQ4jzsk7AmBIIzrrXWeT5vbwwfJW4nxzXHhbd8CadOxuSdaf1
 3QEM4iox6/+P+874/+ybPVWgAAAA=
X-Change-ID: 20261125-ux500-prcmu-clock-move-d8efd52065ba
To: Ulf Hansson <ulfh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 mfd@lists.linux.dev
X-Mailer: b4 0.16.0

The U8500 clocks will need some extended features going forward
and I don't want to force Lee to review clock patches just
because there is half a clock driver in the MFD PRCMU
driver.

Move ARMSS rate selection and CLKOUT, peripheral, PLL and DSI clock
register programming into the Ux500 clock drivers.

The MFD driver continues to own the shared register mapping,
SoC PLL/SYSCLK firmware commands and mailbox synchronization.

Drop the unused partial-25% APE mode, which was emulated by
changing clock dividers in MFD.

The final patch removes a bit of policy from the PRCMU
driver, it will be managed by the clock subsystem.

An LLM helped with the mechanics in this patch series.

This series requires the following prerequisite patch:
"mfd/regulator: db8500-prcmu: Remove EPOD regulators, v2"
https://lore.kernel.org/mfd/20261127-ux500-epod-regulator-removal-v2-1-0ccab0f430fd@kernel.org/

---
Linus Walleij (6):
      clk: ux500: Select ARMSS firmware operating points in the clock driver
      clk: ux500: Move CLKOUT programming to the clock driver
      mfd: db8500-prcmu: Drop unused partial APE clock divider mode
      clk: ux500: Move PRCMU clock register handling out of MFD
      clk: ux500: Separate the PRCMU DSI clock implementation
      mfd: db8500-prcmu: Always submit an explicit APE OPP request

 drivers/clk/ux500/Makefile        |   2 +-
 drivers/clk/ux500/clk-prcmu-dsi.c | 352 ++++++++++++++
 drivers/clk/ux500/clk-prcmu-hw.c  | 492 ++++++++++++++++++++
 drivers/clk/ux500/clk-prcmu-hw.h  |  39 ++
 drivers/clk/ux500/clk-prcmu.c     | 163 ++++++-
 drivers/mfd/db8500-prcmu-regs.h   | 128 ------
 drivers/mfd/db8500-prcmu.c        | 937 +-------------------------------------
 include/linux/mfd/db8500-prcmu.h  |  40 +-
 8 files changed, 1041 insertions(+), 1112 deletions(-)
---
base-commit: eaf11176791570b235e10c43bed920659745615b
change-id: 20261125-ux500-prcmu-clock-move-d8efd52065ba

Best regards,
--  
Linus Walleij <linusw@kernel.org>

