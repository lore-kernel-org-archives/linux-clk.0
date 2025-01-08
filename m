Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF461FE453;
	Wed,  8 Jan 2025 11:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736337226; cv=pass; b=Iz1Eouy0qKFsnuMuJiczzFsZ6Mn1NfX4itFdjvJi07vIktFJP+T8c3p+VZ3eEmlLKk38FPqkmyHFHi2R+dRuX0UfGitDkc67I6VuskjONLO+G9bJ+VzhRgFCa/EqUlxoHiP3AgR7hZ7Qyjn0ULb4Xym7BSWl5rDk0etH9M6ekl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736337226; c=relaxed/simple;
	bh=EnhV95JOUiDqyhGhIVC7iHbwbXdz4k3QEDXdQCHiCmc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SrmAgjDcQHx3vdpLcu1TzueQda+XnLdxp/9R3el8YkcaU6Q1yl58oZ/cdq6YedZnwP+LdHT+PMdFta+4wwoVw8n+0S7rtbhBRz6oKGKawrOi7Qzhbg6ew7ynTlbEGRbbmikOd8TZ5Jc8K1EhByvtLYljduESlcS7K/soXD2tSJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=IJ9btuGC; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="IJ9btuGC"
ARC-Seal: i=1; a=rsa-sha256; t=1736337212; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IKSlO00cPMt57MupNatC0bqx+ZcCv/3AqIBTsFRmMQIX8Fw95KgMhHPf0MZgHq9WV5wSWPVHH54aESNdwig8JqHnG+uVqY08sC9gPBYWpHDeIRGCZ5iGZTb249yrLY1kpo4gFKNpVJWvG0tnQrNOt8Ei2qJ3cfv2MTy4zaaXLDU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736337212; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SV6+dD61DjVjHaXAw4cZ7pAs5Ek4RvEv84oeJT7/Jlk=; 
	b=HSU7GzNilwKbgdmSwLGH8+h7wQuQK91nvNdg5yOMMuHFMM1lD++hmI5OOxh8wq5Ox3NWTeq2NYheAsS/vCs4GirCJl3M/eaCZzlaC14Nmo34T3iDI8/NrIB7LWdg55vuU8kMPOAGT5sI5ieYv3QUaph9XBFqtvEBL/19mSytD5k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736337212;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=SV6+dD61DjVjHaXAw4cZ7pAs5Ek4RvEv84oeJT7/Jlk=;
	b=IJ9btuGC0yhbQD2brTNdxzro2kKi26IK2uQitLe7XtRq1HLNUV9aWuPVOa6Nv7DB
	EpzV9gYsEUsvH+IQ0CHbDrJwzZynaY1yFgALDvFy/BhAbHbyUqkigO2c7OwKw5AMk/W
	7r45h5knNXEWbGgFigxC4gv9rS9VbyMCcBat8gbo=
Received: by mx.zohomail.com with SMTPS id 1736337209274483.6594892898389;
	Wed, 8 Jan 2025 03:53:29 -0800 (PST)
From: Xukai Wang <kingxukai@zohomail.com>
Subject: [PATCH v2 0/3] riscv: canaan: Add support for K230-Canmv clock
Date: Wed, 08 Jan 2025 19:53:06 +0800
Message-Id: <20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACJnfmcC/22PQW6DMBBFr4K8rit7bDCw6j2qLuyZcbESQgIUt
 Y24ex3SRag6K39L7838q5h4TDyJtriKkZc0peGUAzwVAjt/emeZKGcBCqwGVclg5QGMkng8yAb
 KaExkqhBEJs4jx/S52V7f7nnky0eWzvdPcfYzdlnZFsTkDVoHUeWJkaxCInIYKzKhZCBH3hHev
 MFPLHHo+zS3hfOldiFQNIR148FzWSqVdZXjGkysI6CpIovbBV2a5mH82uotZjvht4nbNVmMzI+
 gXVPqumbnXr6Hbuh9Oj7nvZtqsQ+4tnvcZlyjatBXwdja/4PrBxyaPa4zDqB9o3MHxfQHX9f1B
 6Kl8YypAQAA
X-Change-ID: 20241206-b4-k230-clk-925f33fed6c2
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.2
Feedback-ID: rr08011227ba5e3a8d70608de2ce4996130000408bc3c13a028403076f2b5ffdfedb427aa725b96e6725753a:zu08011227cfa1dcabed92c2e71aefc7f100004979d722aff1144df9bddbf5ff30a1768dd220fb0d3d8df855:rf0801122d0f1e211bd97fcc46e25e04b6000059365634c4ba4e5beb21e0b6035ad86f2ed9372a290e72ac99dec17635970d:ZohoMail
X-ZohoMailClient: External

This patch series adds clock controller support for the Canaan Kendryte
K230 SoC. The K230 SoC includes an external 24MHz OSC and 4 internal
PLLs, with the controller managing these sources and their derived clocks.

The clock tree and hardware-specific definition can be found in the
vendor's DTS [1],
and this series is based on the K230 initial series [2].

Link: https://github.com/kendryte/k230_sdk/blob/main/src/little/linux/arch/riscv/boot/dts/kendryte/clock_provider.dtsi [1]
Link: https://lore.kernel.org/linux-clk/tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com/ [2]

Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Xukai Wang <kingxukai@zohomail.com>

---
Changes in v2:
- Add items and description.
- Rename k230-clk.h to canaan,k230-clk.h
- Link to v1: https://lore.kernel.org/r/20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com

---
Xukai Wang (3):
      dt-bindings: clock: Add bindings for Canaan K230 clock controller
      clk: canaan: Add clock driver for Canaan K230
      riscv: dts: canaan: Add clock initial support for K230

 .../devicetree/bindings/clock/canaan,k230-clk.yaml |   42 +
 arch/riscv/boot/dts/canaan/k230.dtsi               |   27 +
 drivers/clk/Kconfig                                |    6 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-k230.c                             | 1424 ++++++++++++++++++++
 include/dt-bindings/clock/canaan,k230-clk.h        |   49 +
 6 files changed, 1549 insertions(+)
---
base-commit: 7a517bbdf3dc89a2ae5500ded67e823f8f2c36fe
change-id: 20241206-b4-k230-clk-925f33fed6c2
prerequisite-patch-id: deda3c472f0000ffd40cddd7cf6d3b5e2d7da7dc

Best regards,
-- 
Xukai Wang <kingxukai@zohomail.com>

