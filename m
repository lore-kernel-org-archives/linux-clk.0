Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B4943B48C;
	Thu, 20 Aug 2026 12:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787227282; cv=none; b=TsgMm0mBKex9G9OfCDMnKlkTvfqjVvvOdcgBmfErsabkB51SoAuU9vLu9qQ8wF5XAmtgzAXBXsa4kPtcX0kaZFNHVqgwwtLo9U3GvI/OzAn222WjVFlyLtwbwoVQvS685sj4sf2q+32Ss4mT9WOjN7NtdVM25d3Ca6i58GJJ8es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787227282; c=relaxed/simple;
	bh=YovAaYKiXn+Qq1GP17B+q6+CJmqK0Gm0WlW1hsq6A2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hAztonv6dFsuFWJzFEQmlfGG4tV76c+OqrENfz9+uzAGjbqTbuWzhzO8nbq/ef4bVAHp9bnfffeumwTVl9h4Wom7EBXsvhD6M+0CftzbmywmL0kkmtD+TlweQDBvzrzBICtkM+M7cZnbUuhmpob6kaEam+3SoFBnksjWC10vOAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=JWMrF72g; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="JWMrF72g"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=YovAaYKiXn+Qq1GP17B+q6+CJmqK0Gm0WlW1hsq6A2s=; b=JWMrF72gutaao3Y5BH2hl/NXWJ
	RF/F4b25BTXYH3D35mR0+BQpY2M/L91uaK7npus4BQcn/4eahxD+K21x2Rw7qvpKkj1+B5QMdnBAO
	wWoAlyMzG4Mx0PjO503XGXIAGg1P7mZn4zknwdym8Gn5+GMulV10Q8ABq2LSJ3Km0lLLoSzBaiEV8
	I2x94caTEZHVBbo6iiP0dZTuQNpePphMkix6kfUP4eKHzMdcDD33387vcI4h2gUcLwqD0H6V4GSBt
	EtIYm4Q1YK9r6VfZr/tPWywueRndCqRsIRmMqwIW7MYwU7/FRgz2CzN8Dg7/q+5mNedr2uu+3CD/u
	Hsf2Hodw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Vladislav Leonov <vlad@zlab.su>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Simon Glass <sjg@chromium.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Subject:
 Re: [PATCH 01/25] dt-bindings: reset: Add RV1106 CRU reset definitions
Date: Thu, 20 Aug 2026 14:01:03 +0200
Message-ID: <2506382.tdWV9SEqCh@diego>
In-Reply-To: <20260814-pristine-warthog-of-tolerance-4be5cc@quoll>
References:
 <20260810121121.210040-1-vlad@zlab.su> <20260810121121.210040-2-vlad@zlab.su>
 <20260814-pristine-warthog-of-tolerance-4be5cc@quoll>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 14. August 2026, 12:15:26 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Krzysztof Kozlowski:
> On Mon, Aug 10, 2026 at 03:10:52PM +0300, Vladislav Leonov wrote:
> > Add the reset ID definitions for the Rockchip RV1106 clock and
> > reset unit (CRU), to be used by the reset controller driver and
> > device tree nodes.
>=20
> This goes with the binding/compatible using it, where is it?

it was not part of the initial CRU submission, so the binding is at
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
?id=3D713e4d54ff7369b8118f91e98a008220d60b2a5f

slated for the merge-window.


Heiko


