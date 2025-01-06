Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3671DA631;
	Mon,  6 Jan 2025 15:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736178378; cv=none; b=Ti7AjUGD2we1GEgx26VNmm0ja4s/Q5Y2+c48yn5OnoqnVoq+tH9rXHu+DZeLOIMsuFK6/ykav/jIXb9h/YWW+KihKz6dPWTyrW8dBf/uc9POp930jwZwtoCFnUHBOPgI/Ey0jwWEgLfmCkhXZbbmMhHD1hdcbTxjq72xX/a52eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736178378; c=relaxed/simple;
	bh=TiylIWGYX8F6qOxnmLngPqSgf2VkNgOfXPXnFnKBok0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BCy9HwxkxnQxj+mAapwtUHxnX0EvF+u2MumElrpWMizGkHo7hZKZnIaEO62gBL4llVUdJzpsAv+shFuh1F7xt3qGZgcyEb2VACBLzjlslsQmNHqIaadBB3gwF9HinjrG8fwqarp+79kNbkznEVbItv9U7TfLsZajTFcWtKWPsRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB13C4CED6;
	Mon,  6 Jan 2025 15:46:18 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 5D88C5F814;
	Mon,  6 Jan 2025 23:46:14 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Roman Beranek <me@crly.cz>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Vasily Khoruzhick <anarsoul@gmail.com>
In-Reply-To: <20250104074035.1611136-1-anarsoul@gmail.com>
References: <20250104074035.1611136-1-anarsoul@gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: allwinner: a64: fix video output on
 Pinebook
Message-Id: <173617837421.3282465.589306007023383641.b4-ty@csie.org>
Date: Mon, 06 Jan 2025 23:46:14 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Fri, 03 Jan 2025 23:36:56 -0800, Vasily Khoruzhick wrote:
> Since commit ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI
> in TCON0 mux"), TCON0 clock parent is always set to PLL_MIPI, but
> unfortunately it breaks video output on Pinebook.
> 
> I did an experiment: I manually configured PLL_MIPI and PLL_VIDEO0_2X
> to the same clock rate and flipped the switch with devmem. Experiment
> clearly showed that whenever PLL_MIPI is selected as TCON0 clock
> parent, the video output stops working.
> 
> [...]

Applied to sunxi/for-next in sunxi/linux.git, thanks!

[1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
      https://git.kernel.org/sunxi/linux/c/9897831de614
[2/4] clk: sunxi-ng: a64: drop redundant CLK_PLL_VIDEO0_2X and CLK_PLL_MIPI
      https://git.kernel.org/sunxi/linux/c/0f368cb7ef10
[3/4] arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0
      https://git.kernel.org/sunxi/linux/c/8715c91a8365
[4/4] clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent
      https://git.kernel.org/sunxi/linux/c/383ca7bee8a9

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

