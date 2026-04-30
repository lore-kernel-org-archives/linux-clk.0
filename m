Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D3013B7AE;
	Thu, 30 Apr 2026 10:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777545065; cv=none; b=hRFMqCj9Bn8sFEytlMddhkEFluycOrJvpZxe9greMFxaCqM27YgcbqadXhR9yEObCUNk35zdcP0yZyV+OU1WgtfgHzqsbh0Kc+kO5WppYYVRvuivREwnR4LYv18hSnteuaHVM6TJZfSeJxyFOSc4X95TGtYuB4IjBbN5pvVzcYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777545065; c=relaxed/simple;
	bh=QJ3l9s3WRH0yxHRx/NIafnOMgM2A7S6+psCcSgpfN6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EY0PJpRWj3QmyVSQaskBBxoRxTPrSH1eJRLM3FtbC2PKP8IlRDs18oHWb283R8LDBGWVgOwlGIfXhJhBoZ1qE5r3FwrqI5NCwxm0vE26LJkL3Am24cfzGt0N4gGu8EBr+zD4sNRRfUmDCZvvTTp/w/DrgghVxy9pS3TYTnazocU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NnqFYq25; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NnqFYq25"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E1CFC2BCB4;
	Thu, 30 Apr 2026 10:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777545065;
	bh=QJ3l9s3WRH0yxHRx/NIafnOMgM2A7S6+psCcSgpfN6I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NnqFYq25pGo/VPzFfdpzHdzYlZeqEzFG2P1obsx6PyWS6zGWijOpXPwFJAIwl2cP9
	 tbECcUYRuHW5FhBbPwYc19hYSMmzRY3TgdNdXwbhm5ILN613etBRLZJab+mS8PWxDD
	 TuXP2PMhVc9Qa8R9Xvq6VSYiamcOOyYDfa8Vmssc6yKp0RBshZG0HYNJtxnPKjuX/2
	 QH5a/rvz73TgSQRkwZ3wTt2dtxvwLTMATVeBaGiCdMB/FKSE9JSi8wZ1XIVDfC6Ncn
	 OmZyZ1HSwja6jPm3a0Ndnt3kQoHyfkh0OU/WQctoiqLlDcE4M4hcTG6hedkQ8AG6FT
	 ti+eeEkLWJahQ==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 30 Apr 2026 10:30:26 +0000
Subject: [PATCH 1/4] dt-bindings: soc: spacemit: k3: Add PCIe DBI clock IDs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-06-pci-clk-fix-v1-1-32fdc77c02ab@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=936; i=dlan@kernel.org;
 h=from:subject:message-id; bh=QJ3l9s3WRH0yxHRx/NIafnOMgM2A7S6+psCcSgpfN6I=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBp8y9SSIqzEuSPbtUyWFait1k7Ip757U8OyVpzG
 t+X0JrAYvqJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCafMvUhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2Mpg/7B4iSJo/BrSyeWdPkixvHCMSvye2WX+yY/meFPbYJ0W8qrlsGwMCke
 EMj+Rrhiz1tHULVm6H+S7jPCFvCDMd3Ryp8oad/An4BEBrECfpqTjl9UKLpFoX9GbU7SbiYh6Hi
 1sNZ807E3wDXP+W5+i4DSX83qH7pRflD41wm9g4rzmCA7msr8dSjJLbVFDWGuYrYiOd0y5m3uMb
 bDokkeQonPIexstW9cQ37IIBi2qt2y9bkiUerUMOUl+QvNhWctU26m0TljWka42tjyMyKTVpCR5
 RdUA6CwzvhVNhphZJy+ktYDNwesoFDnqN/Gub2R/1Wjr8ONQ2cH9MxHBxjboCHGXmIIyZqR0u2s
 ssZc+wO8KjfqTQxc+yDBC604BSWuj1akNTZhntx64pPt2FUQsKZj5+ScLrpNIxzbxzIIZ4E5smp
 8oM5nqNMKBIHU70iURQ8Y1gtgc8RB7hgmPXNxrtktGPhCMTv4CrYg6b/9fnPvdl8pBwEwr3bI/U
 MaPekx9ZrFh4JlzPvo/fd0V2y2jhiRwQcCPfncaMy3GiAhoHDcTdaJL+T/DPo6Zq4DO53Bpf0SH
 YviBuQJ+8UVCAcuGlSL/ZpNebMx60C6VnV1x7VYKTRKbhiWxdD4pTPSSnxOaJYRfH6qAG8Kve7v
 t9kOOonzcx+Zkz2RK5dPR11B6IVJtc=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add clock IDs of PCIe DBI (Data Bus Interface) clock.

Fixes: efe897b557e2 ("dt-bindings: soc: spacemit: k3: add clock support")
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 include/dt-bindings/clock/spacemit,k3-clocks.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/spacemit,k3-clocks.h b/include/dt-bindings/clock/spacemit,k3-clocks.h
index b22336f3ae40..dfae52547cda 100644
--- a/include/dt-bindings/clock/spacemit,k3-clocks.h
+++ b/include/dt-bindings/clock/spacemit,k3-clocks.h
@@ -380,6 +380,11 @@
 #define CLK_APMU_ISIM_VCLK1      86
 #define CLK_APMU_ISIM_VCLK2      87
 #define CLK_APMU_ISIM_VCLK3      88
+#define CLK_APMU_PCIE_PORTA_DBI  89
+#define CLK_APMU_PCIE_PORTB_DBI  90
+#define CLK_APMU_PCIE_PORTC_DBI  91
+#define CLK_APMU_PCIE_PORTD_DBI  92
+#define CLK_APMU_PCIE_PORTE_DBI  93
 
 /* DCIU clocks */
 #define CLK_DCIU_HDMA            0

-- 
2.53.0

