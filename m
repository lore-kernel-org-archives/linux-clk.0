Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D552F9C37;
	Thu, 30 Apr 2026 10:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777545080; cv=none; b=UuOyuxHzz+tejNlYCRYZgdCXU/xug67zBH3gcAjWQQG0ASMau4YBEMDUhsropJzRwuqHhR3mrxdx9kiBqSYSoj0n8oxXk/vYzx8bFssMFRP4Sho6BRXpPlFuTB9XmjqN5m3SydcpUj0rkaouFvonP7FzgCCW7f34XCHrsEwpweY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777545080; c=relaxed/simple;
	bh=wVganUCXK6vIj7/O6DnSvBs/72BhNDH1zmFCk8I/4ko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ay/cbXobVKXVTH1ci0Zk0uD3yAOObbztZdCXWG3SiXCaS0yM2LA5iGNznc9/C+lERiUxMNfjcw6IqGll+HIYUqzYDlQjq1sshDdUXXAphijkkrpsP1cYP9KzxB+bf9wgBcktGXBMk9dbmNkvGO+vZdnNXTjmfF0naJ+3VAkEmZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sgmCp9Xs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sgmCp9Xs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F445C2BCB4;
	Thu, 30 Apr 2026 10:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777545080;
	bh=wVganUCXK6vIj7/O6DnSvBs/72BhNDH1zmFCk8I/4ko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sgmCp9Xsn53pKZhEerjpHv6u/otaR9UF0/X6a0u0lGDaL7knL4zJwWlJMeppc//bi
	 NiYSwWtLextSaO5alpln7qEMvj4lFH5vdR4vxN2PGUEBZ2lFbbrtgShFiHOXuSl2wm
	 XsDcT/hGAil0OyMOQhrKl8AYl+d6h/2qfKwlCp93ZPtJFIYDSgQct2iEHsL3ntx17n
	 QIdI2h+AXkCp0E6N9KkvguxmmegMkcnMUGoMh4vPmsoV7mNk4BH/kR/ijoirXb93KF
	 anArNJPzFR/pUKatmzeRon0mXbKtXJdNStU4R39jaFpzPhpKU8EiQ8WzdKEtMy8V2g
	 SDDyQ8dsoR60g==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 30 Apr 2026 10:30:29 +0000
Subject: [PATCH 4/4] clk: spacemit: k3: Fix PCIe clock register offset
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-06-pci-clk-fix-v1-4-32fdc77c02ab@kernel.org>
References: <20260430-06-pci-clk-fix-v1-0-32fdc77c02ab@kernel.org>
In-Reply-To: <20260430-06-pci-clk-fix-v1-0-32fdc77c02ab@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=963; i=dlan@kernel.org;
 h=from:subject:message-id; bh=wVganUCXK6vIj7/O6DnSvBs/72BhNDH1zmFCk8I/4ko=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBp8y9cNqqlKHMxtnLU9zIo/Qf/1KA5Z7FHEaPEX
 qDFi+siiHCJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCafMvXBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1mPA/+JoQHwC+Lh+rWtXbfjSJh97YDp85STnJns4hFJrrDkq+yjZXkv8zmk
 C2C0iD2tlB8+QbF1h6D2rFQYi8jgrUNIHIrEzYGgt6L17ZgBN5U2v6w97zl0nQijSKhOXrcw1Ik
 SDD7BQ9wKrROYNaMp3BoXqPlUkGn95UONZHKrhzPKhO4uRhya+alFlvTO9EaN1jseOYvggYOzdv
 NBuP4HxvutIPKpxYLjfOhPT8bLra6zffrqkhHmH1Kt+b069SJbH42KqejIC2wmpSMpMfG5NH5RY
 qte0an8inyzll0N0ElYw+4PJjeqUWzdeOFVlKtX3YvZrY0fD9pLhc9+rMGFc1hjCdz0/tHlOIcU
 t2qiUQd4XdWmXRER4ZekrStZ5++EmIDoGRsoxyunqzxDbHg00Geu5QQNkeH+QfzbkoRP8sK5gSB
 d9PJMXW1aDs4KVKLhONjZ4yXdJoKFfmRGX6/WLbO/zcZObqIixTZGuusCT63NVGuuHi5B0aVO38
 lmCRsAs+5O+6y6GhujVJUOgz2NSBLgwQc9YxM9RsXJeAPvTzKY/+N/0akzkDnCJHiwQYr0G96Bj
 Od5gko6B2jjU3LKXNNhie0xuBuJcuHQ8lXK9TBspePblPyYeI4xh3rzZZskXbTsmE7BIEVn5gyY
 gIku1SfwsTByqIE1pZFaW6JcvKQ7+g=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The offset of PCIe Clock CTRL register for port B and C controller was
wrongle swapped, correct it here.

Fixes: 091d19cc2401 ("clk: spacemit: k3: extract common header")
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 include/soc/spacemit/k3-syscon.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/soc/spacemit/k3-syscon.h b/include/soc/spacemit/k3-syscon.h
index 0299bea065a0..a68255dd641f 100644
--- a/include/soc/spacemit/k3-syscon.h
+++ b/include/soc/spacemit/k3-syscon.h
@@ -168,8 +168,8 @@
 #define APMU_CPU_C2_CLK_CTRL		0x394
 #define APMU_CPU_C3_CLK_CTRL		0x208
 #define APMU_PCIE_CLK_RES_CTRL_A	0x1f0
-#define APMU_PCIE_CLK_RES_CTRL_B	0x1c8
-#define APMU_PCIE_CLK_RES_CTRL_C	0x1d0
+#define APMU_PCIE_CLK_RES_CTRL_B	0x1d0
+#define APMU_PCIE_CLK_RES_CTRL_C	0x1c8
 #define APMU_PCIE_CLK_RES_CTRL_D	0x1e0
 #define APMU_PCIE_CLK_RES_CTRL_E	0x1e8
 #define APMU_EMAC0_CLK_RES_CTRL		0x3e4

-- 
2.53.0

