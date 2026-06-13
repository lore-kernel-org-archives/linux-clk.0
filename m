Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9AB348860;
	Sat, 13 Jun 2026 22:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781391316; cv=none; b=hAIYgCpvICCj0+d0oncvq0XSsqbbBtCp/1XfEk7JbG42+zay+gk2ZX2Aa6qNiCtk3F6ufXc/6fNmriTFXLxKt4/3GEAZfS8pUOyB4I1iAB9zKGBbS7eofwb2u22XtHEFcd59/m0Ouwq8AhVDhUQ6opjixxJ+LkCKgpf5wbvmECA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781391316; c=relaxed/simple;
	bh=cojz8L42QoYl4v8USwM1fmjxLhPaAAO4EBmbvPz+95w=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=PZCdw+Y+cJintVHJE0kCBqX4YU2kRvarrgD3hzuuKGqGCxnUgi93dAl/qh+VwnwUbYivzwjMo8moX6+EzgEI4cGuNRstVHK/KG7aUxPqGuz5l83TWINaIB8y1KYMo33GqwxLVzAmkAHHH1e6zUFr6X9KLrpWkRcd++DXpxWn6rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0bDutmf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0bDutmf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2750F1F000E9;
	Sat, 13 Jun 2026 22:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781391315;
	bh=cojz8L42QoYl4v8USwM1fmjxLhPaAAO4EBmbvPz+95w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=R0bDutmfWV/1bHtsseUtk4NuDpcqjBpr/3X+l3QT539C98oqUFuVRoXwhZ1F2tApZ
	 EW/xXcgZFOh7w64Jo5SZaoqimxnssWMc6+6R9W1g622zYTFcIA4tG25g5i/Rlq4R7t
	 Ctlpp9R954fGyNfOFhZ3RCoQ2EjhMFHy/738yV+2iM1UIjkNDj9nt1TUczgUmyBqCO
	 fJBN2bY4g2szgbiC2DvRWiGDReP5v4+8Ir7c5RIbH21a07TU2VIYEI1trbZfpMLAF6
	 N8LgYf7wRifY93I7rYZWS51KP6o4igC1/ML7WG3ZwCwM77pPfSGbz6n8KavhuLmEVQ
	 moBbAo8FWIijQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260602-tcsr_qref_0527-v5-2-8ea174a59d7e@oss.qualcomm.com>
References: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com> <20260602-tcsr_qref_0527-v5-2-8ea174a59d7e@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/7] clk: qcom: Add generic clkref_en support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
To: Bjorn Andersson <andersson@kernel.org>, Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 15:46:17 -0700
Message-ID: <178139077723.819343.8364833855890359860@localhost.localdomain>
User-Agent: alot/0.12

Quoting Qiang Yu (2026-06-02 01:02:18)
> Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> register controls whether refclk is gated through to the PHY side.
>=20
> These clkref controls are different from typical GCC branch clocks:
> - only a single enable bit is present, without branch-style config bits
> - regulators must be voted before enable and unvoted after disable
>=20
> Model this as a dedicated clk_ref clock type with custom clk_ops instead
> of reusing struct clk_branch semantics.
>=20
> Also provide a common registration/probe API so the same clkref model
> can be reused regardless of where clkref_en registers are placed, e.g.
> TCSR on glymur and TLMM on SM8750.
>=20
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
[...]
> diff --git a/include/linux/clk/qcom.h b/include/linux/clk/qcom.h
> new file mode 100644
> index 000000000000..09e2e3178cfb
> --- /dev/null
> +++ b/include/linux/clk/qcom.h

Why are we making this file in linux/clk when only drivers/clk/qcom/ is
going to use it? We can have some qref.h header in the qcom clk driver
area.
