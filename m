Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A48E35E1D5;
	Sun, 13 Sep 2026 16:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789316164; cv=none; b=qF+u4QpbfVP95txIC3vj2H8Aev4i/593BNo+WbL5pdG834GbnCtwgzuzSqaHgdtWAPcTyVGqKqQ1kexIvBJHLLTjia76EnfTUA0TUBWZShhmNzd16AlqKhfl+K9fhfcmiD/l5ycowmkJLj2sO5mW+D+MTdtLt9qv4MZ9fZoST94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789316164; c=relaxed/simple;
	bh=jpCqN3D19a2OiRZNhweu5IYUQ1umPGMKnHJ5S/I9hsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gP39iJGU1cIov+OvuNT0gzKIkyxFCUTXT8DwaXlmMes5/DWbNHa0XAw5LOBwJOn+1v86n0U0kC+yDYUCjHJvH9pIeYji+ZB6eVGq5QRG9NdiJZ85b7L9tB7Jgub725GJ3Fol6wAa4Rp9yaa2fugoWNvpDlLkUb5rBkaU4OSVU2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRCCBoBz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRCCBoBz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C4A1F000FF;
	Sun, 13 Sep 2026 16:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789316162;
	bh=b2QN1R9cEP+65/eaKbkkpietz+IIKIO9R9b6vVssGVA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oRCCBoBzGCO2WSuWyFbKyFY4UEl/Zz8HdyalS/m7VI4lHJFbXRF9FT8g/Ay2mjgbT
	 POLU0wOnyTijCQBSXXAw0z9C76xOnDw0J8qGaF3/fEOubRusUB/BbWJlvfOFC4rR3B
	 0YnDrbHpI7JCoYGpHeCkPuY+4JHIq5aue4aRjLzSJV4ClQnt8faIKbj+VLkhkdnlde
	 +NFPA2YKHBjQ+ECA4oXTXje5dfjmF0Uq0NCc3mXm50X+mDm9rL/Q5sx/lg7FBYd00D
	 3wYevpuOLNH2XvuJuKjb0H9e0JtA210EHq59Ypya+ZZVudMzlrIKdLfCT0411Zl39U
	 k83Uud6h7ZTug==
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech>
References: <20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech>
Subject: Re: [PATCH 0/4] clk: sunxi-ng: a523: Fix single-divider clocks
Message-Id: <178931616050.1372417.13697138134958064084.b4-ty@kernel.org>
Date: Mon, 14 Sep 2026 00:16:00 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sun, 06 Sep 2026 15:06:37 +0800, Junhui Liu wrote:
> Sashiko pointed out two issues in my series adding clock driver support
> for the Allwinner A733 SoC [1][2].
> 
> First, ccu_mp_set_rate() generates an invalid mask when an MP clock is
> defined with a zero-width P divider, clearing unrelated register fields.
> Second, ccu_mp_set_rate() does not handle CCU_FEATURE_UPDATE_BIT, so
> divider changes are not latched by the hardware.
> 
> [...]

Applied to sunxi/clk-for-7.4 in sunxi, thanks!

[1/4] clk: sunxi-ng: div: Add feature support to M clock macro
      https://git.kernel.org/sunxi/linux/c/da543a093f65
[2/4] clk: sunxi-ng: sun55i-a523-ccu: Use M-only clocks for MBUS, IOMMU and DRAM
      https://git.kernel.org/sunxi/linux/c/88735a2ffbea
[3/4] clk: sunxi-ng: sun55i-a523-ccu: Use P-only clocks for high-speed timers
      https://git.kernel.org/sunxi/linux/c/4b41d0ffa9d9
[4/4] clk: sunxi-ng: sun55i-a523-r-ccu: Use P-only clocks for timers
      https://git.kernel.org/sunxi/linux/c/b260db91603a

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

