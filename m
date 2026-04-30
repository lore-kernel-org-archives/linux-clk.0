Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41C2228CB8;
	Thu, 30 Apr 2026 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777545058; cv=none; b=moVe2rslKWuwdrocFq65YtP3QrHLwLX9Ld7zbCxA3tcFHoYx4D2HL5GKns5XCAHM5pkicCkkaNeZC74lDB8J3q2ITZ6dN3GAxquvGSgLv6P+HvF1CTnC7wNBfzL9TWWBje65AmVypjtiI6vhvLQiLkRVZzl4fxkp+ZpKgUMNcXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777545058; c=relaxed/simple;
	bh=DmeSSTIGufqnT9oymE4UEk/rZkHHJ5nwP7hD8//UdrQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q8Y4ICJ407VRJn6YvVTz2ZUHFqrvb0D20IMY79Y4FIzOSdkQTry//q5CZJ/ckioCtG/GsUQ/Q6Mda6/B6VQIQA9Fy+DNe5uOzQidH/sqSkbmHfsDSOP37kkFXUJ99nRorkYig1dLOEiMBtC2V/D19KKQhuNoPopLMBZs1Wo8KRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWSfmgyx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWSfmgyx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E729FC2BCB3;
	Thu, 30 Apr 2026 10:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777545058;
	bh=DmeSSTIGufqnT9oymE4UEk/rZkHHJ5nwP7hD8//UdrQ=;
	h=From:Subject:Date:To:Cc:From;
	b=aWSfmgyxckA5I2LQl2tRlWPVi9qkuSzqU7XBzwtvqKm1KhejCvSOQpDYAnR8/ghAa
	 jGuIl6wU+kbizMFQFParI6Xx5bf2vMFJGYaT6RzFuBOKG+vesj+cG3uJuxXPFp14VI
	 DEN2Jy2GWttleO8xyEjSKGoSVWYbsf0ijRJJaZA47A7bKMRq4slbPVILfNFn2JPSk2
	 92T4+eI96MRRpyS3Vz1Pd183+3DUjzUFLR9Uw6VPD1cqGBxnFpzr6pGsKycN5DddPw
	 V15CJzYmsaEoIKkw4HW4okayE77MAy8brLA5UvMIeqeSL//kubsSSgDAMzKwzlxe+f
	 hhucfVKamqZTQ==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/4] riscv: spacemit: k3: some clock fixes related to PCIe
Date: Thu, 30 Apr 2026 10:30:25 +0000
Message-Id: <20260430-06-pci-clk-fix-v1-0-32fdc77c02ab@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEIv82kC/x2MSQqAMAwAvyI5G4gLrfgV8aA1alCqtCBC6d8NH
 mdgJkHkIByhLxIEfiTK5RWqsgC3T35jlEUZaqoNtQ0hGbydoDsPXOVFVtvZmawhCxrdgVX/w2H
 M+QO8afqrYAAAAA==
X-Change-ID: 20260430-06-pci-clk-fix-e60487b07607
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=898; i=dlan@kernel.org;
 h=from:subject:message-id; bh=DmeSSTIGufqnT9oymE4UEk/rZkHHJ5nwP7hD8//UdrQ=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBp8y9Pbw0UXF6v+Sxj7RgIpbKiDLeZUszFWSa/s
 2RNtRpR/1OJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCafMvTxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1hYRAAhpFGnBLjpvTIg3GcabvxnDktWdIcTYxFZLlnhrNe2Ro7+57RbD4ea
 Qv1HiMYuaxCfFtdgcvg9AqIkPmcojzHYegSn62QlqCuFXIOV/I+caqbaM3ejVOnpUPMelJnxZBY
 JG8wXf9k2MouF/IGZs5zPeg+Bc1DAHfEYl5FPvQFXTnLF4Zd6v+sOwVDbhU7LfsFcXMqtey0qI+
 9HomizpGDOISaSqh6RS6ttodaeuxNFVEfqddNJ7jU9l8S20IyUT7qocn5/XcDryEjgigStE30Wt
 N/Bjv5itBBMJ7e2tJ37A6pwp3vsbSrjljj2hp1HYQ/VTekKNpD4qewFEDD34md8jk4+YJOmcRPW
 MGcmJJ4hDcP6kmb6JYLFwEdp9bVpiNyzOXMqwDvfeyTUiELbyarxsXxjccv6nGG4yT4oFcbknTs
 NFERPN1sM4HdEOUmNZEz+tWyuruchuP3l65kPTUlycOFdZmN+Kaz4ZxJxXUjkAe+mbT6FyMbuLd
 ar1IQboD+GA39OlkGuy/d49jQMvfcWgFDiGD867I2MH8MXoqO6HYODTuHqHQt/8T/1AFWT/qWIR
 HJqleS4bRxzD7TNyB5I47GjheZmug+zFmwb5GHXX0fF/rnliKzpn4Mja2nB5pkV492Cxs5zycuF
 laMbdX4dbuRuQeCRGcCx0RCToMeX2k=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Here are some fixes for previous patch set in order to make PCIe work,
Add PCIe DBI clock which was missing, Fix the parent clock, And correct
the PCIe Clock CTRL register offset.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (4):
      dt-bindings: soc: spacemit: k3: Add PCIe DBI clock IDs
      clk: spacemit: k3: Add PCIe DBI clock
      clk: spacemit: k3: Switch to pll2_d6 as parent for PCIe clock
      clk: spacemit: k3: Fix PCIe clock register offset

 drivers/clk/spacemit/ccu-k3.c                  | 30 +++++++++++++++++---------
 include/dt-bindings/clock/spacemit,k3-clocks.h |  5 +++++
 include/soc/spacemit/k3-syscon.h               |  4 ++--
 3 files changed, 27 insertions(+), 12 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260430-06-pci-clk-fix-e60487b07607

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

