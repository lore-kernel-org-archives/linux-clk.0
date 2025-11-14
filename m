Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F319246BBA;
	Fri, 14 Nov 2025 04:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763093365; cv=none; b=DHAupgO/VJSQjSZtkOQ5QG1b2Jg7otCPIcdLzsPIrsoGVaD1uNUPnpFQ0JKWzgyWKcCccDwThKCbG3SeUVXx9Sip4YswzsMAfd7JU3h4RGGe9K8kI54z7wz4VvCzSM+4RihMI9M9+rHaRYz+txnHKqvVV0q6Mtyj1syob6WpRu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763093365; c=relaxed/simple;
	bh=4c4vh6+BB27uxbgTfjCbJ0ljIKXa19ItFtJ6p1jjPhE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Ij5uv7sz/77VK0p4QpSs3g2JCNAn8ecNMgBML31P+HeOAJx5T7NYv6oMC85wvV3PbI2I9PL5hJSobB8wCcpg2QV4+2TJg7OKSL3dg3i7lQ8M9GK9HZrCijv4cBOl8pHRVFPeRXmDbnb2mEi52cF2KWsFNFslQngnLgzk2L25AsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVTBspbH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVTBspbH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33D7C116B1;
	Fri, 14 Nov 2025 04:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763093364;
	bh=4c4vh6+BB27uxbgTfjCbJ0ljIKXa19ItFtJ6p1jjPhE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mVTBspbHocqrJlpBANsgISapRzBdfdNGoru83F3NNHZwkHYdO1UcAWFrLoL2WsAAn
	 OyA1tVHtn9da/L7l2EBSg6WYGs9uMzn4BI3dHghKKouTZ4IoEkr4/AS4yJClvHl4VD
	 FCXl/B/gl1X+nRc6vnC6TqtKpH0W55WCgc+hDkuxa3yFb++Uno4mOrJLQQzAWKbmQG
	 U1adN3w7TuALI3Q9maT9BjId15Y8ld7R/pOuOZxNpid70VUXR7wLu2KwEbP8wIlrQc
	 uwpsuBKRy2NrU9X8Zz66x8pb9DCWRovHz53/qMDlwSNd4wPWHgm/Se27wAUUY8aySJ
	 jQyOv5YDjsdRg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110035645.892431-3-mikhail.kshevetskiy@iopsys.eu>
References: <20251110035645.892431-1-mikhail.kshevetskiy@iopsys.eu> <20251110035645.892431-3-mikhail.kshevetskiy@iopsys.eu>
Subject: Re: [PATCH RESEND v3 2/3] clk: en7523: Add reset-controller support for EN7523 SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Andreas Gnau <andreas.gnau@iopsys.eu>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Thu, 13 Nov 2025 20:09:22 -0800
Message-ID: <176309336273.11952.13793350271645615953@lazor>
User-Agent: alot/0.11

Quoting Mikhail Kshevetskiy (2025-11-09 19:56:44)
> Introduce reset API support to EN7523 clock driver. EN7523 uses the
> same reset logic as EN7581, so just reuse existing code.
>=20
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next
