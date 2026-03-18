Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4223311946;
	Wed, 18 Mar 2026 15:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848576; cv=none; b=EeWjdXbIP1EsoTz3/PCa6uV3VGR1pkICKcIM52fZZ6TS4kNH7iZ5G32YXOqFEd0EQuawOv+L8qXXeEz+PTkns2hxbyg9H6oXUfUNahZJKwfMxLppQYObkGWhsZ9Ws6LHscxHM2kTJK5+EOxITHICh72m1Gn14k6Eq3bCH0FfQyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848576; c=relaxed/simple;
	bh=2x4oVweRq+GVYi6zSzJwmZ8lBsQqyfo4azqIWus+kl8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=nNlYDnnb24NMnw5he6Btx/glh304o1aTViNL95buWwyS0cIyoRDrO31LMCCTx2wRfbunxhGCfHc9VqwYporFiNcFto2HhQGYRseMlwB3LCv8n/UZgqOObkhKowPggXpX1El+B4p2+QCbTPwS5veZS/Hx3NcgpEJaWIjDXcLdYxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+4Kp5J/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+4Kp5J/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62AA4C19421;
	Wed, 18 Mar 2026 15:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773848575;
	bh=2x4oVweRq+GVYi6zSzJwmZ8lBsQqyfo4azqIWus+kl8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=r+4Kp5J/s/rGrmhmwHSop9Jokx/zvQ/SWVDm3h64t/HvP+WU59UDgPQxsMlJa9AJL
	 bdfRHtFrCeZQQ7xCT6H3O1+a9SuCS0PdF7ACfr8Bt3njOA+bycJ57EMBXDDSfadGo0
	 8yYrztyi8PR3Uf9pLCS2UDDVI/KdLx5m+kCrb043Pc9ZfJOBb/sCq2q4sHS49SaU8I
	 5vJo6b55AtLIER2Vcj0mxQ4VJcTtDweOhmUrVMqdvaMJv2sQ49RVDafHbeXerV/LK4
	 JrpCV6iFD4rrPZWQPt1EsELmYmuL1pcWPYnFnFJHYll4f+DTZrJ7JbetFfffxs4jqP
	 OnUKOHdLXb15w==
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 16:42:49 +0100
Message-Id: <DH60U76GPPWN.1UJJ89FKSXOWL@kernel.org>
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
Cc: <abelvesa@kernel.org>, <peng.fan@nxp.com>, <daniel.baluta@oss.nxp.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>, <Frank.Li@nxp.com>,
 <s.hauer@pengutronix.de>, <kernel@pengutronix.de>, <festevam@gmail.com>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <hanguidong02@gmail.com>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, "Alexander
 Stein" <alexander.stein@ew.tq-group.com>
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260212235842.85934-1-dakr@kernel.org>
 <177384710701.3709943.608237959975537642.b4-ty@oss.qualcomm.com>
In-Reply-To: <177384710701.3709943.608237959975537642.b4-ty@oss.qualcomm.com>

On Wed Mar 18, 2026 at 4:39 PM CET, Abel Vesa wrote:
>
> On Fri, 13 Feb 2026 00:58:11 +0100, Danilo Krummrich wrote:
>> imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
>> called from IMX driver's probe() callbacks.
>>=20
>> However, it neither makes sense to register drivers from probe()
>> callbacks of other drivers, nor does the driver core allow registering
>> drivers with a device lock already being held.
>>=20
>> [...]
>
> Applied, thanks!
>
> [1/1] clk: scu/imx8qxp: do not register driver in probe()
>       commit: 93a6d39e78bfa78b2160621aafbb490e063f12d9

This is already in Linus' tree, you gave your ACK in [1] for me to take it
through the driver-core tree.

[1] https://lore.kernel.org/all/66i6cgh5zmz32ikwjvrz3gtezjotltqmfzdai7ybwjh=
anx3bif@i5g62ziautwq/
