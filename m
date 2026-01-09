Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A41E2DB794;
	Fri,  9 Jan 2026 20:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767991386; cv=none; b=rPyTNlB0kba1QzQVIsgIcpSj3OcM+wTfbg/knMce5v7mVJjSr8p0JPtwl8ysuJkW5T++yd4t5yc0POt39lxOBXKwfF3NlDzHOgdgECQQu0NT0wBvXocKki/Ctxk9SzDB1TJb8eGMhgqDuHTDASuHk4UmoaVaLvSlLQbAQWy8UmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767991386; c=relaxed/simple;
	bh=miKcZWol48Jw+2UO6gt4cVVV1UHKKRtEl1qwPzQqXP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GFJsQLRPRZDEWYAauJMkvpHrYIuVoTq4oQQMEoq6LthybJqe4U3tUnFRm+XnLprx+k/Y+x5Sblhe+imrpl4IrIj0COJvcQtDDQpApoGtXX8erGYuVnrjr0th3XcUT6gJkGgSxZvoqAxN4kKTFpr66BY1cavUT/NPHQ6ZCPSgQ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=0mvT/PbG; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="0mvT/PbG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=f5RJrE9iu3AAG2e7ylgK1ozseoLRQiyaoirBfZJAtnQ=; b=0mvT/PbGRh9OZnqLcSrZpsjnOb
	yP9cFt3trK6oUFCtVbEP5qujsrD2emQSMPcusA0XHuETJz9fqvtMjU73AzVcgO1ujqxJGCRBUblyb
	fI8kdZWpF0bkNWE+pMVAKS1z2egHEQ8f853vglLDqtJdFFCGoWz2GsSwcC+cyCwsYrd+eEKI7Yzo4
	XNPjNcasRe3avUpDqs5zYAaIhGoUS4MjDUxYbXx1j5e+BPjcHwaz3dsSm28CJnl+J13NNBL3OUOiO
	RQl9nCXZNcnCJR8j9Z0vzjpDrakKEYiormETfKSNa7eyh+i5Wp2SSBRg+90qCTZcrvNl2/5rpGuXi
	/0oMxuAw==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1veJJs-001g9m-Nf; Fri, 09 Jan 2026 21:42:53 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Miaoqian Lin <linmq006@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] clk: rockchip: Fix error pointer check after rockchip_clk_register_gate_link()
Date: Fri,  9 Jan 2026 21:42:51 +0100
Message-ID: <176799135865.3468380.11555784321903491011.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250805030358.3665878-1-linmq006@gmail.com>
References: <20250805030358.3665878-1-linmq006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 05 Aug 2025 07:03:58 +0400, Miaoqian Lin wrote:
> Replace NULL check with IS_ERR_OR_NULL() check after calling
> rockchip_clk_register_gate_link() since this function
> returns error pointers (ERR_PTR).
> 
> 

Applied, thanks!

[1/1] clk: rockchip: Fix error pointer check after rockchip_clk_register_gate_link()
      commit: a8d722f03923b1c6166d39482c6df8f017e185d9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
