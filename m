Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A0427FD72
	for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 02:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761877717; cv=none; b=S7iVTimiE6aapKSl1t5044OTHQOcNumkVgQBHAT2RJdTMh/WbVF+0wI8IzJ2fa6kjGSc2Q168Hrl3vx/vFeGgufTaHijpSDWQwUfz9951ndqlkuttJa06MTvr9pp1fXzQE4DTZCtGnufi+9u/hKPKKPxVlQOa1vu2IDnCbHdReo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761877717; c=relaxed/simple;
	bh=KCWVlcgb2vlTFeuNn6M9x7iyQu3pcLnS9YetBihR8wo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hkvxA84aJo6DVVHURvWtQV0gUcysOQSWXcQYVfkDK3PVxYKtURHPlXQjEY9DKM+ZGZi/DiHuyhsl6ZWjOqvXnKwD6DZFD5ZdrdCK4Gh5eYN9YfZLFHXUaQsgeSyTnQ4sgMYgorXLpw2oHK4wDFKTV0q21a7HnXVG2EcPVlgW9QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=permerror (bad message/signature format); arc=none smtp.client-ip=95.215.58.170
Authentication-Results:smtp.subspace.kernel.org; dkim=permerror (bad message/signature format)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alexey Minnekhanov
Subject: [PATCH 0/3] SDM630/660: Add missing MDSS reset
Date: Fri, 31 Oct 2025 05:27:42 +0300
Message-Id: <20251031-sdm660-mdss-reset-v1-0-14cb4e6836f2@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ4eBGkC/x3MQQqAIBBA0avErBtQS4muEi0sp5qFFk5EEN09a
 fkW/z8glJkE+uqBTBcL76lA1xXMm08rIYdiMMpYrRqNEqJzCmMQwUxCJyptfeu8abrJQumOTAv
 f/3MY3/cDZTCz6GMAAAA=
X-Change-ID: 20251031-sdm660-mdss-reset-015a46a238b5
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Alexey Minnekhanov <alexeymin@postmarketos.org>
X-Migadu-Flow: FLOW_OUT

Since kernel 6.17 display stack needs to reset the hardware properly to
ensure that we don't run into issues with the hardware configured by the
bootloader. MDSS reset is necessary to have working display when the
bootloader has already initialized it for the boot splash screen.

Signed-off-by: Alexey Minnekhanov <<alexeymin@postmarketos.org>>
---
Alexey Minnekhanov (3):
      dt-bindings: clock: mmcc-sdm660: Add missing MDSS reset
      clk: qcom: mmcc-sdm660: Add missing MDSS reset
      arm64: dts: qcom: sdm630: Add missing MDSS reset

 arch/arm64/boot/dts/qcom/sdm630.dtsi         | 1 +
 drivers/clk/qcom/mmcc-sdm660.c               | 1 +
 include/dt-bindings/clock/qcom,mmcc-sdm660.h | 1 +
 3 files changed, 3 insertions(+)
---
base-commit: e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
change-id: 20251031-sdm660-mdss-reset-015a46a238b5

Best regards,
-- 
Alexey Minnekhanov <<alexeymin@postmarketos.org>>

