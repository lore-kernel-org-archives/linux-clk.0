Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FD747B439
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 20:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123278; cv=none; b=LuNN+SWFjo4V1mf33HA9/2h8Uj/pjWkY8V5PbtTbHPU1U2BEV3FlGxWB+FkR3vg/UfdP/LusUOlbqE4cF0zWMsRbcG9ObADlFPH29dlYuC2W40fbIhZ9U3ES54eiqXrrDiU3b1htSR7hDL6OaTWox8UUlIpmJOYvec2ZBIY+PaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123278; c=relaxed/simple;
	bh=pkkSKWR0KodJQ0vKkZtGPD0h3ScWWHyhcqWDDPs15o4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ho65exh0bfl7Rtxdw/ynjRHs4O8ALI9+yqUexZcPX46jTi5z1r+bL4CSJBbl3VS3HTwEsD0eFBNjP9YOMqFlvIY7hOTTuV+DBOEiMgSsnuonUECi2bEwal4IS2zYdfCCbhksAOpLGr8Z1vXeIGppu4pdeFrAnKskiczRDgtLGnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOMyTvbQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOMyTvbQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD66E1F00899
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 20:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781123276;
	bh=pkkSKWR0KodJQ0vKkZtGPD0h3ScWWHyhcqWDDPs15o4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AOMyTvbQOFf4cnMqCYIp9/iW/sXw0BEIZtHETWgQjQl54joutGO8WdSnh6Pw2l3ll
	 yuerVxTf0SyroNDVTjAxdy0z3PV5vPhoeIsqLQKsN199ZTtNTXXbb0PlUSPvR766DV
	 Lq1aX5ONBFlr0Vag2CQOUIucCx/1uiJkD4Rb1Gn0fG/8C8J0Ex4L19NlHE6Ff8Vum4
	 ZMnUqUBnUuTH+mlWNTlCMXEMivzR0Xf23jZWQOL9kaaiLtSEFtBOep+cLY7IUGmZs3
	 0/z94M1yMQ0vvi+Fevrp2SkpDfl/PFT7pF3xHO+jaAwe+gk7A4Hor85U+7p5MEQh0V
	 gw3GvkM1StTpw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa68d7d757so7674046e87.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:27:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+wi1eFlfXGImTmFw0E9Xdgw3Zdcv9So97dHpjE1KlDMJxQRaW7irWurGTI3uQcUAdwwuCmsHHlTJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyIpkYTShZ/hILleJUQuIDkR08sexsnx1dsVQhy7JF6TbATjQQ
	pur1iOqJrs4fXFdwk0NbxUaTsZnUpcJO3nKGiPkVlvh4RNmApkBVnVmHzIifgK2OQXqbsli1hmr
	VBQFbiL/nUAEx2Ez+4CuvY3KZu1e5FaU=
X-Received: by 2002:a05:6512:3c86:b0:5aa:75c9:d304 with SMTP id
 2adb3069b0e04-5aa87be8296mr8153378e87.31.1781123275724; Wed, 10 Jun 2026
 13:27:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602042747.277270-1-github.com@herrie.org> <20260602042747.277270-2-github.com@herrie.org>
In-Reply-To: <20260602042747.277270-2-github.com@herrie.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 10 Jun 2026 22:27:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLmjMrFzSamKynqs_QBVntoXCpgWzwb59_jSU9FCOHQqJA@mail.gmail.com>
X-Gm-Features: AVVi8Cd58dhay5rtIbjO_HVEJCqe06ETUbqcdGMd8VWF9ZDp7hedhRQq79v2Tt0
Message-ID: <CAD++jLmjMrFzSamKynqs_QBVntoXCpgWzwb59_jSU9FCOHQqJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: qcom: gcc-msm8660: register CE2 H clock
To: Herman van Hazendonk <github.com@herrie.org>
Cc: sboyd@kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 6:27=E2=80=AFAM Herman van Hazendonk
<github.com@herrie.org> wrote:

> On MSM8x60 the Crypto Engine 2 (CE2) block at 0x18500000 is gated by
> a single hardware enable in GCC_CE2_HCLK_CTL (0x2740, BIT(4)). The
> existing dt-binding header already reserves CE2_H_CLK (ID 77) for
> this clock but the driver never registered an entry for it, so probe
> of any consumer that resolves the binding fails: the CE2 MMIO window
> reads back 0x0 and qce's DMA hangs indefinitely waiting for handshake
> signals that never arrive.
>
> Add a single clk_branch under CE2_H_CLK pointing at the GCC enable.
> The upstream qce driver requests both "core" and "iface" via
> devm_clk_get_optional_enabled(); on MSM8x60 the vendor MSM8660
> clock-8x60.c maps both consumer-name lookups to the same hardware
> register, so the consumer device tree can reference the single
> CE2_H_CLK phandle twice under both clock-names. The framework returns
> the same struct clk for both clk_get() calls, per-consumer refcounting
> works correctly, and the underlying enable bit stays asserted while
> either consumer holds the clock prepared -- avoiding the refcount
> race two independent clk_branch structs would create against the
> same hardware bit.
>
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
