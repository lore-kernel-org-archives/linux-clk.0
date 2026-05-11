Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E72526ED46;
	Mon, 11 May 2026 02:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778468380; cv=none; b=MIu3KcbjFwroNaBGj1a8t3T9ePG3/oC3iNjUZR3CrpJGfdN0dmGXrmWwclCxGsSvKGEvtdnz6Y0TQePg0DS8QI6E1suh/4hWfU50aufMPitgsxbDi3xUmgsuXYU89Yaj6fREodS69JgMUUAaAbPwnaCrLD/JunrB6/qMdYnZowU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778468380; c=relaxed/simple;
	bh=62GFDbMhrf9Hmoi1Uc8kFyF4ciHaqpBzUokKVG2CQe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WxJb5X4mY8AiijJzJHenxTr87xcAWkHZAcxLJxBiYSPjcJJ4M1p+FQE1yKwCpaTl8ZL5TRwXA4prwfFM+MHDXTJNPakPj3jeyrk8mN7lorWqPyf4di+hcR5xY5RxcGG5up3HG3cRXdwa/0Q4oDhBHHk3h6HC1QJhUlCwW8EirXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxH9U3Wp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxH9U3Wp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7E3C2BCC7;
	Mon, 11 May 2026 02:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778468380;
	bh=62GFDbMhrf9Hmoi1Uc8kFyF4ciHaqpBzUokKVG2CQe4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GxH9U3WpJQ8kpNLWtfR4TNWbj1+70f+u2GidLkv99rRLoxpv4+HcDQIP6IaFgdXmt
	 +C0qNMHqLph5H7y07+5V33VafNkXlkgr60uZvIPGezkZdc+tZ50sj7HPKgTvMp115n
	 +FL0z8SXPeM/1/NTto/3950g/H1tpNlq/lkXiKxVl+IEWU1IeNUDINeuqrpUisi+oN
	 DkAGRlxH9f6Vzs6j7TYVMWxCI7/EOw6JZrejNq+GqlNXPqiEwtoKuixjEmBxPol9X6
	 KRn/kR3Srq+orw1NjEx29ib6OsdyvZs4IBL5Jn30UO+ZQokvtg2zR1SMor+WEgmRV2
	 AlFbMTFKM/lbA==
From: Yixun Lan <dlan@kernel.org>
Date: Mon, 11 May 2026 02:59:11 +0000
Subject: [PATCH v2 3/4] dt-bindings: soc: spacemit: k3: Add PCIe DBI clock
 IDs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-06-pci-clk-fix-v2-3-c9a5e563bab3@kernel.org>
References: <20260511-06-pci-clk-fix-v2-0-c9a5e563bab3@kernel.org>
In-Reply-To: <20260511-06-pci-clk-fix-v2-0-c9a5e563bab3@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=861; i=dlan@kernel.org;
 h=from:subject:message-id; bh=62GFDbMhrf9Hmoi1Uc8kFyF4ciHaqpBzUokKVG2CQe4=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqAUYJTaej5SBATnnsigEQdD+rTWC3jpqtX29uv
 BMQCLX3BiiJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCagFGCRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0UhQ//etf6fkp4Z+h/0EGk6dhK2chO/s+iitT9uA/dId0n23K63Ggbgy5sa
 L+Gfy6C0uF4rsQTaXr89cU/kyqBYsBdTuERvk2B54BpV5KPNrOwqo+GTW8dISqEsb8+HH5qCbQk
 WycI8DIZMDCIYn+PRtZjl3mpghtAh1eBOGbmqslCz2XXwMudz9kV3laTxYXRNvnHe1bB+d4mec4
 Ic4vqQjSRDbxV6915yHVs59UEhL7xM7KEG0i0WnJP141ViwYkMjefgeTuGIM/wYGIrrc9vHS85i
 qV7l+Nv76sJ4T3wNzOIxmXEfyL/+k+hRpYOSmF+dcn7jLqVQ5oqr7B+e6lC+SU0Aa5Xe31Dv0Aa
 A5H0YD/y0Z2/L/Ds4fVjicwLTvySZa1crzr7EYsGnEc529IEceV+0Jrj8GNRvTTn9zDI7OFDIn/
 0TcaK/nreMRYLydrANhLt25E0IrnmnKvR/Fwnem4SB2foK/r6/db/5FQxho7HOmABnWoS5KpTKQ
 9NjieuDcEi+EBI8BEiU/eSN40GLbTxwCiqLdUpEREQ+XaVl03KQJs2BdnZQ+I7pxM06QCHy0Xyj
 WdIpsE0TTCpJX31f2O3ueDPcneybDfQyOVv92AJD3if53wBYmfSdYs2ylYDu6K/cqxiZ8w9a/6v
 cuA6vJUibrAnMZnMqVyQNaM208dHG4=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add clock IDs of PCIe DBI (Data Bus Interface) clock.

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
2.54.0

