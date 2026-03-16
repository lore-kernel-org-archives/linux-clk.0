Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E602EF67A
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 16:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773677765; cv=none; b=BpO0NLrKn4VjJKrHAtey7CU51GgaBUBDVDJ/MV+iFWoMhwN/jp56PY4S2UO3vGn9HH3gUBCm+TQ1XJsuMZMMkqrJOL4jK/gyVeCpVE9uivbC2FwslynR5a8I5dB3HB/JQvKVr8vB6pzUL1RT3ihCYYeDYd7Hjn/xUKY1QLqp8ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773677765; c=relaxed/simple;
	bh=xreSaR7HVScN7/JPHgdktEB13nBjTdZHk3rukjjO/ZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r/3a2WmSFVKuotMV1n8/N8k8a2LMm2nOODOJe7akC/bZbilIyVNhJC2U/7zUGu41+m/kuKG3Ojk0hizlWJ3UC+oqDH99SoZV/pa6WnflBbwOCBnVkSdlY/dDFHwd/4AkxHLTonFvmaFXXAVC2/O8Wj2mmZ6NJFTs84+81kD/NBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDvp6hpg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDvp6hpg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF32C2BC9E
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 16:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773677765;
	bh=xreSaR7HVScN7/JPHgdktEB13nBjTdZHk3rukjjO/ZY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JDvp6hpgRImEqdRQRiWAoUolxDyQ0V3fTQY/1eV5bBh0IeRT3CYBcUlWRYpnIooP4
	 GejKfTanMj8heZDsfz+trR7VrTyzQE/AJUGdNfQAoq9L9q2+TxxwnyvnK9A3dSTfXO
	 CV3cOfrKjYiTaaGzBCCP0Pa+MFkn5KbUJdcOPr60h6b2rgFSMUVpgdDy1d8qSQIKZS
	 6Pfoz969y3HONDlbI1OSIuPjDJ/2fiGBo9tQKPZggAlrBMuE7I9mqLCs4801GT0A1s
	 1aeGshQUmeglwXvae3GXdm8zBuiROPgkJ4qdev5unoAB/epBsmdrUOqtgeyL6yqRsf
	 7ZzO6pYpkUucQ==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6644a3029b3so5026788a12.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 09:16:05 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw4bpNRDuHhFxxtA4FGL4ScOLqNAMH9ENyv6OV/x8F3OhXrGFaM
	nJZSFAooDCc98TYTWPNZZcS5HU8ZThPuJs5hEnw37BBZ+ZI3QPqKD51leeu2/St9/X5IwDXEn73
	ZTAGs2g9PuiWNCKVEDfDmHHBsLDvPUg==
X-Received: by 2002:a05:6402:280c:b0:663:10b9:42d2 with SMTP id
 4fb4d7f45d1cf-663ba100b94mr8639580a12.3.1773677763351; Mon, 16 Mar 2026
 09:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312162449.569359-1-cjd@cjdns.fr> <20260312162449.569359-2-cjd@cjdns.fr>
In-Reply-To: <20260312162449.569359-2-cjd@cjdns.fr>
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Mar 2026 11:15:49 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq++U7VKUWtsN=mDvtR_8biSLViR16oLqgT0GJ1Ms4gPFw@mail.gmail.com>
X-Gm-Features: AaiRm52mdxiqeCOOKqKQbpZ7_ORIOf5RnhqfrH80YmgCxP_EqyIebUU42qXckO4
Message-ID: <CAL_Jsq++U7VKUWtsN=mDvtR_8biSLViR16oLqgT0GJ1Ms4gPFw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock, reset: Add econet EN751221
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, naseefkm@gmail.com, 
	bmasney@redhat.com, mturquette@baylibre.com, sboyd@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, 
	p.zabel@pengutronix.de, nbd@nbd.name, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 11:25=E2=80=AFAM Caleb James DeLisle <cjd@cjdns.fr>=
 wrote:
>
> Add clock and reset bindings for EN751221 as well as a "chip-scu" which i=
s
> an additional regmap that is used by the clock driver as well as others.
> This split of the SCU across two register areas is the same as the Airoha
> AN758x family.
>
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../bindings/clock/airoha,en7523-scu.yaml     |  6 ++-
>  .../devicetree/bindings/mfd/syscon.yaml       |  2 +
>  MAINTAINERS                                   |  2 +
>  .../dt-bindings/clock/econet,en751221-scu.h   | 12 +++++
>  .../dt-bindings/reset/econet,en751221-scu.h   | 49 +++++++++++++++++++
>  5 files changed, 70 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/clock/econet,en751221-scu.h
>  create mode 100644 include/dt-bindings/reset/econet,en751221-scu.h

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
