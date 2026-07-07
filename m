Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE30C23BD1D;
	Tue,  7 Jul 2026 09:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417288; cv=none; b=CYGZd7R3dCk8X5RpFilUCzOcRvYfJOE7FRWFEMhBcAJFJMMZSSL/h0FvP2RB4w5wA5ROU70e9dHugmWgo5b+YI3QUuuCn1erupohenhosdZlpeI6DxKIVAoMXPIA421ANJCk19J3+GOpYGZ1ZnrvZsImreHR0rpP7xSAt7gs0uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417288; c=relaxed/simple;
	bh=aaJkouc0j0BlKCAS1RY90DSMHg5PkEs0Uv/6/9S/ZPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MPXMHpikae6TkNLlaf0uUiINRWIfPHXTkvQCuUrFy2GDQ06D6HjIXMQw7rEj3OAdpLfBJzUnSveIAQDpvZVdNe8ryyJZvbG7APSxIMkZsD56slKA5M/EJHCLxcKBQ4gPyMmVNxlREjDyWkp+zFrCjxGmLvqhV9K/bthII8NFozY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=D5jb2t6i; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="D5jb2t6i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=u2xB54k8wnP3j+i/BezsfM/iJmqJZPrpAP/RKUP1HHU=; b=D5jb2t6iILMTxhDn9DydV+DJS8
	lvx3Kc8zQac0BqKhR7encW4rHqpeP2GYBZ4IsrICbfw5rO1HTI3HYm0LpXnsFNZcejbTHueJ+jk1K
	g+EEwqNJ922YrexciPdtRsgj/ncWzAzJO3tEJFJ0Qr+99UyQdmZwnRVZq9zy8muujX1HABhpCbUXn
	K0+tOP5IAWN21Cpxkn7HNhRdFbXlZTI8ccZk0o0oAhU1DlHCc91MaYV/oImKPYBCi2+HMRhdIrwDQ
	FFvXckyt1qsOswrJrGEsLTRyjwXElvIZ0jh1QveLjwqkv0GMVR47Ex8t9kdr7F2edsUx2tn9IvVZ8
	BbRc1GeQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	zhangqing@rock-chips.com,
	sebastian.reichel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	andyshrk@163.com,
	macromorgan@hotmail.com
Subject: Re: [PATCH v2 0/2] Bring dclk_vop2 in line with other VPs on RK3588
Date: Tue,  7 Jul 2026 11:41:06 +0200
Message-ID: <178341726130.481833.2104125095372172924.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304121426.1184680-1-heiko@sntech.de>
References: <20260304121426.1184680-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 04 Mar 2026 13:14:24 +0100, Heiko Stuebner wrote:
> The dclk for VP2 behaves differently and its use can currently break
> other peripherals, so fix that and additionally allow it to drive
> the same outputs.
> 
> I've kept Quentin's Tested-by from v1, as the overall change is the same
> but did not transfer his Reviewed-by, as the series-structure changed.
> 
> [...]

Applied, thanks!

[1/2] clk: rockchip: rk3588: Don't change PLL rates when setting dclk_vop2_src
      commit: 13b10571cc353448275365ede1a5396d20dfe839
[2/2] clk: rockchip: rk3588: Allow VP2 the same sourcing options as other VPs
      commit: 778dd30867ad783b6903b0aa24a0ab5e97c2dff6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
