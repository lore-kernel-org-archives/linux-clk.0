Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F40B3749FE
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 20:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783024112; cv=none; b=Oa9kcoFKtI+83YIujVyW2mnDevcsag9jc6GLAaijmMBo5IBhwAq61TejnXHa2hnuhTcvdARZbMFPdWM5SWJ6i0Al3R37uYSXj5rTTFEAWqk/RI8SfqFC+7rdfkZrPg1nAxpmZ9vP9YZxUI/54oEINKgqqVJADSgIyKCxAxBXq8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783024112; c=relaxed/simple;
	bh=unQsydtjAAVv4Ud2oQVvNHCT/ZtVhlkJsaaSsqaqI/0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PG+MVv0Wqltb21fzZOikL2q+KLPHwL6irNbBS7WpnPVcXMsRIQex2gtQp6FDvToJjcNtAKojrJPqNr81ZDDmXgcofIUeH4wYo/6ZmC9G+PHpiU9Psh6+qSDELw2q7EBOj5wsqBxbrAUVnDtJRXYoBVjslbgVwbLMpwy/sz1ueIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfDcbbjb; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfDcbbjb"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso12417095e9.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783024110; x=1783628910; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xvtrv/+d8hgkbnhW0n0gWT+809XDlEUPExgyc3n/9CQ=;
        b=LfDcbbjbsQiuWpXGeAVuh5wcwVKbl9O7UFWPUFxcxSH73XEaUwPl3TLEaJg5LXvi8Q
         jJcnsibirattWoyqkPrnpQU2PBC5REvhbOONm35YE6HgWt1ADZCk8b+Fa0rV4DtgjcEi
         He5sZpymN9+6AENBwoKElP5KkjEHfqU4YCqss6JKSm+Klxi+blf+4SxW8cCEjoDyqOOk
         RRNokcP2CbqDsWQLdhaRRWncnmEjhh7UhqK9ba9At4MZyQFvuK9o5kxXWoBki/zvnDWt
         P9qONAD+wLynIYP663cdRs6qponv3YIW1nuvJOPndj+7Z4CaJ6S4zUbICWawEa7b9qDl
         RrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024110; x=1783628910;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xvtrv/+d8hgkbnhW0n0gWT+809XDlEUPExgyc3n/9CQ=;
        b=SwMCcqZpezLWphn4JjzuePxOBxq3XiLyusztdxfIMSJVp8neuYiPf5jKa/dgMCtvdz
         bMZuE1funfc3GK8Wf67+sdKB+7F81yUSegMuKhnNorsEBc7drYwHOKwWiUc50y1ftpuz
         4X+EllJP2CDtgnwG9ZTCTkEnHruwkmzaEGmn9THUfmb8Er0gNsIEHy4u3+R2/oVN5aQt
         6x/QnYmxQNjrVeJW82lH+1Io2JCPK3GVJkoKBfiWB5J5+bLLuGgV8pIyE3K+owFXmqwL
         8z4ORxfPZ3yEC6XT/vNLSd1GCv9F8qJjLgwfGXaDEfKfy1yeQX18s0WMfnD1k4C+NJ2W
         YsfQ==
X-Gm-Message-State: AOJu0YxvmIJd0Z7Po0mBc5Xgm7LB+3oMAwLAOPQTjn3NYa19CI50GF4S
	D3U344CscpslOUVKyDHpQtMXro3g7NhCqNyPK/rFcJWLDrSqvTj3uXa1
X-Gm-Gg: AfdE7cnYprqN0vEqhPWSCHg6CySpWn3SeNT/cdNnFGifVoPGMJ/kzCHiRIjmMDRZ/z3
	DJqWmUeIO4Jdf3KSFwvNrCMmbb/2hkc16whE+rjtGZ//KaQvj7AwL00N10QUSeq/uc4fCd6KbGv
	3+ugzuzBxaywVpx3WBgOiSDbGRD+QPGKsSj894u94Q61YchyS0rhjA6/zynHBL8MnLqr5JU8sfB
	UIx4GaqunsknjFtXXGTBzdLVybfzn2Y22Fhk834zOnxPPETXMyxMN7N85Y9QDqP2ziC8ZyBc2P4
	Im0wcbU87CYxN72N+1dy5bqmYgylCQP++qmnfMsQ8/V596Q55SGsEifrOoWO7VrEds4bEEGQgXv
	DArk2SUBiZmLG33GvdCuitLvrZma4vDRw5rq+toLfExj8oHii9usxMZs0gCXT2nIBJJQePQ8bE1
	w8A9a/tCkfcbykWD96NHl4tww=
X-Received: by 2002:a05:600d:8649:10b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-493c2b905d3mr89908715e9.24.1783024109578;
        Thu, 02 Jul 2026 13:28:29 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6369488sm80321145e9.9.2026.07.02.13.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:28:29 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v6 00/12] ZTE zx297520v3 clock bindings and driver
Date: Thu, 02 Jul 2026 23:27:55 +0300
Message-Id: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XOTU7DMBAF4KtUXmNkj/9ZcQ/EwnbGrUXTQBKiQ
 pW7M00XiYLkzbPmezM3NmBfcWAvhxvrcapD7S4U7NOB5VO8HJHXhjIDAVYYKfjvFUI+f3BA3ai
 ASoLPjKY/eyz1ujS9vT9yj1/fVDg+PlmKA/LctW0daQEm76TEjEDPoQFU4KJJLlrwSNUpuKINu
 3ed6jB2/c9y5CSXsn/3TJILjjLFXErBYN3rsY31/EwLl44Jtk6uDshBKAKbrIQoZu/UxkFYnSK
 XXUGjMSrvy97p1VlpV6fvLoagUwOAodk7s3HgV2fIuVCK0Bq1DLB18zz/ASz8meTKAQAA
X-Change-ID: 20260510-zx29clk-2e4d39e3128c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4773;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=unQsydtjAAVv4Ud2oQVvNHCT/ZtVhlkJsaaSsqaqI/0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqRsnkUE94LCgDtF4324R9Is48FRxPumYtJWGXk
 aO3oADIaqeJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakbJ5BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiI4EA//SvIbIp3vn7Ya2hiovUKHEh7UGCh6JwW
 2ZvfyZEwvuuxHjW45iAuJm+UsXdOk/vS6ru72gINVgAYN1g4yREtCL4vILJMygDj/coRXD1UQBJ
 Y5DI2FYoItiCuyaJQ4VKyq2T3TX0kr6K7FOYgAzr/QDhkarc0XmLCUsKkkoUWfz3kO8iDO6VU62
 rMLTSSP92uEuBHfvAvX5u5//SMXx0fQG+g5GFs2HsxN2TBCoTVvwvW7Vn2qmwoB1uMr4QJvb/p+
 50zF//TKaBWpCftFiUzeaxZ5RZhrtjw1oYaX8GnvyRAWXUoOJi13vesyg2SW5Ede6oAn5GcRNzC
 5SZiStQgkpuA/we41pha84kbCTqx1pnSAMbIxiRKs1Mw+zOy5n1c5U1EBKnGZ2s4DXoR3ajQH2v
 gzxT2e9GU7sbdq5eVCLp007I/YHjaSHHeHBtSju5pTZxD+O8L9TGcBZZhLCuhXtFu25CgAvbMnQ
 h3i6ZUBIg/RzKiQeWjbjeGbhm9JBEb07cYYdItI66MZlwXyX4Qu9E9/wJA+ffpEymRs4SjXJsiQ
 EJSbJo4n2OVzWzgUi8Qphln/nOByw2niT4JKZ0ht/hX0BjJtxOLqqf6LL/rH0ZSDg79ajWXh2P6
 zbWhVjRyq/35CjSmeWsgGdvdvpqGhKbIBaWfA6gUHbVRusWJD+zg=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

Hi,

I am sending version 5 of my zx297520v3 clock patch. The major change is 
using regmaps rather than raw mmio to access the clocks and moving reset 
handling into its own mfd/aux bus driver.

I think the list of clocks in my driver is fairly complete; It is 
certainly a lot better than what the downstream ZTE drivers have. I 
deduced a lot of it by trial and error. I am sure there are some clocks 
missing that will need to be added to the binding later. Afaiu adding 
clocks is not an issue, but removing or reordering them is an ABI break.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Changes in v6:
*) Use MFD for all 3 controllers - I hope both Conor and Philipp will 
agree. I kept top and matrix bindings in soc/zte and lsp in clock/ 
though.

*) Clean up issues found by Sashiko. I pointed them out in the individual 
patches. They are localized fixes and don't affect the overall design

*)small code consistency: Changed "zx297520v3_lsp" to use "-" , "rst" in 
driver names to "reset"

Changes in v5:
*) Use MFD instead of aux bus for top and matrix clocks
*) Move top and matrix bindings to soc/zte
*) Give USB PHY its own resets
*) Other localized changes are noted in the individual patches
- Link to v4: https://lore.kernel.org/r/20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com

Changes in v4:
*) Use syscon and regmap instead of raw IO
*) Move reset to its own driver on the aux bus, but keep reset and clk 
in the same binding as it matches the way the hardware works
*) Go back to having matrixclk in its own device because syscon deals 
poorly with multi io reg devices. List all PLL outputs from topclk as 
inputs to matrixclk
*) Some more hardware research: Figure out the parents of the 4 possible
GPIO clock outputs and declare them in the driver. They are unused on 
the hardware I have, but they show that all PLLs can be used.

- Link to v3: https://lore.kernel.org/r/20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com

Changes in v3:
Model top and matrix clocks as one device
Add PLL driver
Fixed a few issues found by Sashiko: register lock, some missing devm_, 
error handling

v2: Fix build issues introduced by checkpatch.pl fixes that I didn't 
spot earlier.

---
Stefan Dösinger (12):
      dt-bindings: soc: zte: Add zx297520v3 top clock and reset bindings
      dt-bindings: soc: zte: Add zx297520v3 matrix clock and reset bindings
      dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset bindings
      mfd: zx297520v3: Add a clock and reset MFD driver.
      clk: zte: Add Clock registration infrastructure.
      clk: zte: Add regmap based clocks
      clk: zte: Add zx PLL support infrastructure
      clk: zte: Introduce a driver for zx297520v3 top clocks
      clk: zte: Introduce a driver for zx297520v3 matrix clocks
      clk: zte: Introduce a driver for zx297520v3 LSP clocks
      reset: zte: Add a zx297520v3 reset driver
      ARM: dts: zte: Declare zx297520v3 CRM device nodes

 .../bindings/clock/zte,zx297520v3-lspcrm.yaml      |  96 +++
 .../bindings/soc/zte/zte,zx297520v3-matrixcrm.yaml | 178 +++++
 .../bindings/soc/zte/zte,zx297520v3-topcrm.yaml    |  86 +++
 MAINTAINERS                                        |   7 +
 arch/arm/boot/dts/zte/zx297520v3.dtsi              |  98 ++-
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/zte/Kconfig                            |  27 +
 drivers/clk/zte/Makefile                           |   6 +
 drivers/clk/zte/clk-regmap.c                       | 250 +++++++
 drivers/clk/zte/clk-zx.c                           | 142 ++++
 drivers/clk/zte/clk-zx.h                           |  80 ++
 drivers/clk/zte/clk-zx297520v3.c                   | 819 +++++++++++++++++++++
 drivers/clk/zte/pll-zx.c                           | 495 +++++++++++++
 drivers/reset/Kconfig                              |  10 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-zte-zx297520v3.c               | 234 ++++++
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/zte/Kconfig                            |  20 +
 drivers/soc/zte/Makefile                           |   3 +
 drivers/soc/zte/zx297520v3-crm.c                   |  95 +++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 171 +++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |  61 ++
 24 files changed, 2875 insertions(+), 8 deletions(-)
---
base-commit: 6eb8711ece2ce27e52e327a5b7a628ed39b97f45
change-id: 20260510-zx29clk-2e4d39e3128c

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>

