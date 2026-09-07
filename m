Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9121372B5A;
	Mon,  7 Sep 2026 08:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770128; cv=none; b=qNXpX/iKSPMVpOkphZ0gY1ts8U6TEpb8ToT6XEK4lnxele28MJdxSwf8byemhSDWo3n6ORGRdcqDDO27Q0WNikujwvo8w22DI9ZXmhlMi8OxaZJxZL03o2Ch1jMxpDv2kRSRBN1epBGM+V+XEwA/i4hZHdlUiMy9P1uRea0KyPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770128; c=relaxed/simple;
	bh=7z7vylSyfWqE3EDq/ZZoS1b3CumUAB6aQkwOD+wEqlE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LGyJItI6gAuJinPF35xWfytGwqBfcDnbirkMThINjQ+ulBY0Qrc45ok5+jUN44TMhx4A01snkzcr1WJnAv0ot6tNDf45kbZIL9InTmgGK8H1FJHktabxDcaaYcl8AaoQ2UbqiRiKNTl414+lPkilQxdz3R53EzocRBMTSRMek4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUfyDU5Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUfyDU5Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379551F00A3A;
	Mon,  7 Sep 2026 08:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788770127;
	bh=7lliu8lrqW/CHgr7r/FFZBYLtK9krTWCdW6rmzceK3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JUfyDU5QbxBYRiUjGDpscKWyaipP8tm3zXn6RKIrtl4eWdFMyQPVhx+YqHg3I8+hm
	 APPQQtCCcfiOWDc84nwAZpu5r79EQ79RTm5RsvBepqTse6WvnMxDAsS7QhGs5otQqV
	 I8jENMPCfoI9aW8NJJgVc4jCOWhbZCSpGNXJdsUrbinMFoTeDlwHXqFml7GCtygQVg
	 Msv4Cx9sDl+N55vhrNgNIWiM8J39GLDTmv4GtQCqvn07pX1JiyQQbXAECAlXYVruII
	 kbc9+yKDFnGKJ+lmhdTGuTSMvuqSc3byPynOpupY+NgLf69qSRmqL6sB2xfvSFY4ay
	 n97vIMVW7pBdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: clock: qcom: document the Nord DPRX
 Clock Controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260907-nords_dprx-v1-2-d472af3f01b1@oss.qualcomm.com>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
 <20260907-nords_dprx-v1-2-d472af3f01b1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 08:35:26 +0000
Message-Id: <20260907083527.379551F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The binding description incorrectly claims the module provides powe=
r domains.
--

commit baf2c48f03a1fa1acdae6f01871eb176b4af7ed4
Author: Taniya Das <taniya.das@oss.qualcomm.com>

dt-bindings: clock: qcom: document the Nord DPRX Clock Controller

This commit adds device tree bindings documentation for the Qualcomm Nord=20
DisplayPort Receiver (DPRX) Clock Controller.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yam=
l b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
> new file mode 100644
> index 0000000000000..fbaaad1f3db3f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
[ ... ]
> +maintainers:
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
> +
> +description: |
> +  Qualcomm dprx clock control module provides the clocks, resets and pow=
er
> +  domains on Nord.
> +

[Severity: Low]
Is it accurate that this module provides power domains?

The documentation text claims the hardware provides power domains, which
contradicts the binding schema below that only consumes a power domain via
power-domains: maxItems: 1 and does not define #power-domain-cells. Could
this be a copy-paste error from another binding?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-nords_dprx=
-v1-0-d472af3f01b1@oss.qualcomm.com?part=3D2
