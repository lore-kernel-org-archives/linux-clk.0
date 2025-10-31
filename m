Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F158F2882AA
	for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 02:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761877737; cv=none; b=gtrPtsDNbyFbz5bolll+RGB//Y0v4JdMmaUVzBsD87RXVBWldkWgrv2ukaqSFBAjkOsplxG8ox5iitLddL4aiOe/gBEOI6FuSr4whvdJ+B2vpOEXDymbTY+FmQrY1pW3aXhcrSveHue9DC5jIM4ajsNDrU+hIX5AyHgpxAsWAYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761877737; c=relaxed/simple;
	bh=TrZDGEYQD/7Jm3/Y3QZkkklUr78KX1OE+DBqzAN8Wos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PoEbkwZerZZgZHe+DE5h3C6QsYyevcy2PwWjvGapjyhxRVJQDWC3H3nPBc1O6uuj2X+dD8dQ7LO80hr4ol6aDoW1dBHfNWa/TizrJeeVug5jLm/WTRDsLWbzK4DAd9/0ysvdCZBjnpd63mlSYKIGl4y47o5rMbZ3yOq/CrjAaqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=permerror (bad message/signature format); arc=none smtp.client-ip=95.215.58.171
Authentication-Results:smtp.subspace.kernel.org; dkim=permerror (bad message/signature format)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alexey Minnekhanov
Date: Fri, 31 Oct 2025 05:27:45 +0300
Subject: [PATCH 3/3] arm64: dts: qcom: sdm630: Add missing MDSS reset
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-sdm660-mdss-reset-v1-3-14cb4e6836f2@postmarketos.org>
References: <20251031-sdm660-mdss-reset-v1-0-14cb4e6836f2@postmarketos.org>
In-Reply-To: <20251031-sdm660-mdss-reset-v1-0-14cb4e6836f2@postmarketos.org>
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

From: Alexey Minnekhanov <alexeymin@postmarketos.org>

If the OS does not support recovering the state left by the
bootloader it needs a way to reset display hardware, so that it can
start from a clean state. Add a reference to the relevant reset.

It fixes display init issue appeared in Linux v6.17: without reset
device boots into black screen and you need to turn display off/on
to "fix" it. Also sometimes it can boot into solid blue color
with these messages in kernel log:

  hw recovery is not complete for ctl:2
  [drm:dpu_encoder_phys_vid_prepare_for_kickoff:569] [dpu error]enc33
      intf1 ctl 2 reset failure: -22
  [drm:dpu_encoder_frame_done_timeout:2727] [dpu error]enc33 frame
      done timeout

Cc: <stable@vger.kernel.org> # 6.17
Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 8b1a45a4e56e..fedff18a5721 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1563,6 +1563,7 @@ mdss: display-subsystem@c900000 {
 			reg-names = "mdss_phys", "vbif_phys";
 
 			power-domains = <&mmcc MDSS_GDSC>;
+			resets = <&mmcc MDSS_BCR>;
 
 			clocks = <&mmcc MDSS_AHB_CLK>,
 				 <&mmcc MDSS_AXI_CLK>,

-- 
2.51.0

