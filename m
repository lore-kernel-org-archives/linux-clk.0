Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586164;
	b=X4taJ7LA8fUnKquAiiMTH3I0cufx3ZFwSqHBLRlfGtELBRfnAih77OtPWde1tQq3CcRc
	 +AYSrsUazLWEtxRBLwth8vEbhhEBUT2S8p1tdTfADAMgZdQOGILPLSHlbNNV0L9pJD6k5
	 WH5yk2D31asgfyNTdWBIFzY0t1HQYY0LGqD575xxvtQ74HG0Zu59o+azjIyHXtRYrdc6u
	 3RDANWc5laiXfig5pj6AFIuAXT3RuZFLYKGFs58kHbjF582MJrvTB86OpwWESuEQMRWGU
	 FvjqEnXDDY7Fd/AGYrxwskzPtT2hbQRhye2Os2uwIovdHn6JWQUc9tXW3AP6TeYu/gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586164;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ps/qs5CWGADuVYzfGEn+VGQnXcRANVXhnQ5CyJ+SbKc=;
	b=lPG1ONx+WHWOUR2VdTYvnGlX1W3uwJ4E+2Ycuea0JQpU4z0ZPc7NMsdH8z2W54cqrC78
	 qESMJFG5SKnQRjmt3ixagix+1Wma6NSlZTRTNx5dXSA9/Uy6OsHFNOdhhIbdNLxJ7o5aa
	 2oKV5ReSSz7ALpZyUvQt576JXmP0GOwE81qD4FIZzoYLJWnz9UQo6xu/h2gE/8CN8AmV/
	 JiB1bHeGydCfzEHDheMP+38s9pASJJvjDxtOZoVPV0RF9yP4IkoRUdwDSKKcIWEwLJeCU
	 7L/P3ZPsU8ppvB2Dzk1FURQgN9SxThtQnKWYpPWlv1NRQm1ej+Nnp3rXFSxGCrHbl5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BdldPLyI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1748606A324;
	Mon,  2 Nov 2026 02:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BdldPLyI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6411F000C1;
	Mon,  2 Nov 2026 02:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793586163;
	bh=ps/qs5CWGADuVYzfGEn+VGQnXcRANVXhnQ5CyJ+SbKc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=BdldPLyI7rsUgAobFIathWTmBtP/I9JyKZxIjN+58RQf2UVMmdkEHiQOTIx2To7mr
	 JmzGq3vAdJoOlCAlrScAv3TfXOWXoBnxNSAitEuG0Y5UOcPFq2RcwwcCemeFgfpbo9
	 Z1/U6psSFy+YCoIrbD+kgUaNyOKEAfttvym3B91TtgC7Iy3uCnYyhz4+K9itr2TV9p
	 RB4vSr3cRaibBc69qLWEKv/3ug281NcbnJ/GqjlWDgkgY++rf5LG4qzcAGFlkizx+O
	 X3+j9fZP+6WEIFUJDkLonnzuaKQCSmBvX73LKfDDUnH8pwjUdep7MKHNweo19iXpmK
	 AgSLG2y+rKu5g==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] clk: stm32: add support for reset_control_reset()
From: Brian Masney <masneyb@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261019-ups_reset_control_reset-v2-1-be4ccf511cbb@foss.st.com>
References: <20261019-ups_reset_control_reset-v2-1-be4ccf511cbb@foss.st.com>
Date: Sun, 01 Nov 2026 21:22:31 -0500
Message-Id: <179358615196.355577.6979239007950304521.b4-review@b4>
X-Mailer: b4 0.17-dev-5d8fe
X-Developer-Signature: v=1; a=openpgp-sha256; l=1001; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=b4zZE+9DrZ8HWU79r7L/+S6e/F34MgSto3ilXCnyf4k=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKef37rumDRDxsh1ZOJ6wzPafFd4VTZX/izTenplteaO
 /MzjkxL6ihlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiT/IZGY4HhOvtsJI5ubnv
 1Fmmk7o31js5XbksHKXToP35Lauq4WGGv5LdQhXL/8xfucCBeYeU6q5FFuvuFsassW4yjmvY8Ne
 WlQMA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Gabriel,

> The STM32 RCC reset controller currently implements only .assert(),
> .deassert(), and .status().
> 
> As a result, reset_control_reset() returns -ENOTSUPP, forcing consumers
> to open-code the assert / delay / deassert sequence.
> rs.

There's an extra 'rs.' here.

It looks like there's at least two in-tree consumers (stm32mp25_vpu_hw.c
and stm32-dma3.c) that call reset_control_reset() without checking the
result. Would it be worthwhile to call out in the commit message that
this will actually invoke the reset in those cases? I think that would
be useful information to have for someone deciding whether or not to
backport this to a downstream kernel.

> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
> Changes in v2:
> - Increase the assert delay from 2 us to 50 us, a value that suits all
>   STM32 IPs

I think this would be useful to also include in the commit message.

Brian

-- 
Brian Masney <masneyb@kernel.org>
