Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBCB8F66;
	Fri,  3 Jan 2025 19:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735931028; cv=none; b=npBHbxgg6RQ0U1SUMgNrUgQfbnPzvctH4oqhj5/hyVbXd+u72HrOtC/4Vathti7JS75aI3dVCsD4aCwgXIi5hJ4vZSYmupwMxuUYVWgY2nX8YAupy7vYh+LS/g33k2VdryXcHOtM7iougRmwjTcswaKMAL/M1uYMfUZrf3tJj/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735931028; c=relaxed/simple;
	bh=nYCCUOzh0NUnGVSzltg9x7aYnSuqSSKJyBYNWshTqgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6uSSXm2l1ZbjVIflgLW2nFkPAzY3zd1gEPzif3DukIEVIIezc+a2lqCHoL7+Jwo8G9r/AHqUY1f9f1VxQG5NlVJB3BD87BjMBAVMX/As9kPUhr1cYKBFaCb9Ow5HSpU+D6NuWABaNECs805PUVSppulXj2pP+TE/mUiqsegvSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fIfc+Pga; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fIfc+Pga"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC49DC4CECE;
	Fri,  3 Jan 2025 19:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735931027;
	bh=nYCCUOzh0NUnGVSzltg9x7aYnSuqSSKJyBYNWshTqgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fIfc+PgaKw27/OT2xpjfQo4xQfcrSl70OdbWGYZW/tV5GswHgE/5ZZi8MBWKWKgH7
	 VZGKyqXY9ZvyNlwXxFZnCVYpXXXa7aCTmLmVO5v0w/JvrCJcF0r9pRL7vNLLiNO7dr
	 r4Ch73VefRfXzN9vZo4k+64kuMwlAYatPo+sXrjeRtB8XPhGFlNUsyyEWVqwmZu0/i
	 hQ5B2EOC3nQJR38vZOX/ikBuZoNJzcNKpAhVkUURLU2UeXDkwQ087TwG30oS9afosQ
	 PoOM9SZNxDYTDu/egLhoOJo+VA8YI1gWsHyzyOhoZFrlzMb01ZI7pz8DbX1yRHi3KY
	 WMyMSsKbfGo8Q==
Date: Fri, 3 Jan 2025 13:03:45 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>, robh+dt <robh+dt@kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	linux-clk <linux-clk@vger.kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-amlogic <linux-amlogic@lists.infradead.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 3/5] dt-bindings: clock: add Amlogic T7 peripherals clock
 controller
Message-ID: <173593102550.2572043.16817852344252694801.robh@kernel.org>
References: <20241231060047.2298871-1-jian.hu@amlogic.com>
 <20241231060047.2298871-4-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231060047.2298871-4-jian.hu@amlogic.com>


On Tue, 31 Dec 2024 14:00:45 +0800, Jian Hu wrote:
> Add DT bindings for the peripheral clock controller of the Amlogic T7
> SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../clock/amlogic,t7-peripherals-clkc.yaml    | 111 +++++++++
>  .../clock/amlogic,t7-peripherals-clkc.h       | 231 ++++++++++++++++++
>  2 files changed, 342 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

