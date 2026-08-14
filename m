Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E962E739D;
	Fri, 14 Aug 2026 19:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786737047; cv=none; b=nsQKRWBtqKtA7QEayrzFNSPLDNg7icdc0C8gj8Unt0A4QP+Xey9mN4LtfdcdA7v3SQA97CJYMYXGMHfg4qP+XV2kGKZTgv2DlLlIpJWCQbJRlmMSHoMhAorLAUL/ohIWpWEi6XCv9sWDEz+7+zj+psM0VIAWEZwz3W6uEIUKUWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786737047; c=relaxed/simple;
	bh=5rIbemL29vCBojzDFIp//9V3wEdUAXGEMx+6kQ9YwBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MY3OwkqoJZh9ip5AX6mhKFI3lnYu4KuCaulVjhZPiemCYvlC8JpY46IhUKVfDt9yVjr+Yg+iY8LSE0IAB6xxXbJCSZRwVfyVlmdYeanUqjz1PCZLL7lzIy9QeD0W9KBpB5hvvhE6Tun456C59XJGfHCq+/0lO8vyenzjou4k5ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XTSfEB2Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTSfEB2Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 157CB1F00A3D;
	Fri, 14 Aug 2026 19:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786737046;
	bh=UfuellpKzl2QbOUgjzfSmVMxVZk9riyHzJuyvVWhqck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XTSfEB2Z3hzJkqxZv3qAntDMcC10GG2tSk7pLPm5+oYaR9VIahSdiINqU3yu3NZYZ
	 hOgeDGHH9V1Gi22RIaDrAEApl8lZt4AXmiZ+WCjsD7CWSMu2V3BLHc6AL6LDf0w0ju
	 CY4V2CMC/gJJQLig4opDlLo69FoGRB5th1k5/09KGQxeTlTUjjEtR70513Fj2UQqPr
	 e7Mg9HhMKfbd6lEUnag14bSgR9aSKUx4q/Ncs52SZYKngn80I3in9GaWl99QaGhDrO
	 4oiXy0CaQQXnYRSMHk/ZAXJ+rgW/hreCBlbgQRvrq08nuQ8krgqoW2YuHe0kk1sW6G
	 E+7NbTnzPbScg==
Date: Fri, 14 Aug 2026 14:50:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: daniel.baluta@gmail.com, m-chawdhry@ti.com,
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	simona.toaca@nxp.com, Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, goledhruva@gmail.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: ti,dra7-atl-clock: convert to DT
 schema
Message-ID: <178673704494.2791829.10392174669442213292.robh@kernel.org>
References: <20260813-ti-dra7-atl-v1-0-27b691f4cdcf@gmail.com>
 <20260813-ti-dra7-atl-v1-1-27b691f4cdcf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-ti-dra7-atl-v1-1-27b691f4cdcf@gmail.com>


On Thu, 13 Aug 2026 00:41:17 +0530, Bhargav Joshi wrote:
> Convert the clock output portion of the DRA7 ATL (Audio Tracking Logic)
> binding from text to DT schema. property clock-output-names is added
> that is used by existing dts/dtsi.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../devicetree/bindings/clock/ti/dra7-atl.txt      | 38 ----------------------
>  .../bindings/clock/ti/ti,dra7-atl-clock.yaml       | 38 ++++++++++++++++++++++
>  2 files changed, 38 insertions(+), 38 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

