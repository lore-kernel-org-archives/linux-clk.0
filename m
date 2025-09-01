Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABD1221577;
	Mon,  1 Sep 2025 21:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756762351; cv=none; b=XZGgzn/x//qzcxntPBOoJOa7OYQ+R8msv5L3RJppQ9wzPsVI8Bjbt3K6R0s/UW90wjfqG1d05FH1Td1hw1QQcaerUnhTD3qlGXzjBRytx0LR++SnRkOpHK91/V25WQ+Ijb0RJqwgvnrb5H6eAXzxzezYVq0ReuIZlsaKapDMlgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756762351; c=relaxed/simple;
	bh=XJtUW54wFVnqUN/GjGXLK8CdHk3O9QHu7uFpdEFxdw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sO7p2F7p7Q+GhLeWkVFax679Dq5xUm6NQhuK/tNjvEgelZ+DwxeAys+zN5LjXCcAYzgoa8jxYEi19blmvFLCuvntG4Ix80MPEaoOedeofzmxWrOQsDire0ORhQDvRbiYt73adyU+I2wOBtMPzSsJ0EwP9Gcgxw54BMoOAqxApWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODajV7ga; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODajV7ga"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A74AC4CEF0;
	Mon,  1 Sep 2025 21:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756762351;
	bh=XJtUW54wFVnqUN/GjGXLK8CdHk3O9QHu7uFpdEFxdw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ODajV7gaIdI7Peny6U62Mdbzmn17K9c0n4WpKG92q5YyVAysBnZMEGw4Et5oG5ko1
	 rL9IhH1ttdwkSZdj3hu7eMuqcD+1x3Mp+xA1M6SfkZgn0aP5qzETf8UyPlPKZouX+T
	 nFY5rqZx1stDmtbCB/UWDJaeHMuoXq3P22KYL4bAIredkKjBmP9b7l/JJbJu13HESr
	 BYSlVclAMrS54rDQM7Yu0zQtdMFUR/KtdHhyqZ+DgK4U6/p8SMJecIlbC/5sKl4H/9
	 jAW7TlRg0vlEA8idVSL7tX4DdDEltK0kidhIG/jVqNtp/fi7bgmft1iIHwDwY9YYqu
	 RifmqcGWDUVhQ==
Date: Mon, 1 Sep 2025 16:32:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: WeiHao Li <cn.liweihao@gmail.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, hjc@rock-chips.com,
	andy.yan@rock-chips.com
Subject: Re: [PATCH v1 3/7] dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
Message-ID: <175676234944.379480.9026638393609375066.robh@kernel.org>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
 <20250831104855.45883-4-cn.liweihao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250831104855.45883-4-cn.liweihao@gmail.com>


On Sun, 31 Aug 2025 18:48:51 +0800, WeiHao Li wrote:
> Add a clock id for mipi dsi reference clock, mipi dsi node used it.
> 
> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
> ---
>  include/dt-bindings/clock/rk3368-cru.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

