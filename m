Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794435090;
	b=OMg3JBcBPK9dXm9vPjiiHb6+RVrM40Lg5nwG77lkjVLCqYS2pFqDMfhua+sR6tSw90Jl
	 z/OxUZoXQikArpd1GrxsIkBXQ7WHmw89BXPENnF6jKduqbGFjovBWaH2iILg8iDCkOR8k
	 g7WW8GLUjL4dQNiE2yNlqfUf3cORrmfXYjo/HlkOJgs121iRa8YrnO76naH6RVH79flBR
	 7FgurFQ2jb6CDmh59/M8BsTnthFrgqjmacjA0KEP+AbE30y9feFcVWiSGLecTsNEWDhKe
	 2ZYG27/AQhmRvvtfg5oxJwIK28tqbrUmhcm++2fFb6wMTobUjGU9mvEvTTxYSyUL74w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794435090;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=MUGi+6yGnkd+Ifly32JGBty8CIYlhjDD8RBpprRWoYE=;
	b=blUqNaRtvyAjLyPs8c4aDGwh7E4gdRqsOUtbS2HiIXnrQhM29ZtgBEXl1U3GWHFjrXtR
	 1fdyTQ2a+brQuVlxb1rNVxZDPSI9xFN6KjOJIp1B5PM3I2MUVkyKGw1nPOMXM28od0pfj
	 BgkjNz3zT482bVdI0HHfrD5oLuEZL4SOU7jvav2Ah5zb3Ne7hMuZflD+wl6f5FkXCTT+M
	 fAZRnpxKa+nL9fBNf0ee75fItBki3DKF9k/T4PiYxuF/3gMX+xJJ+h9GBANjSJdsHkqow
	 uyUdWmXA/2NyhffOLYE738tDTlc+WqFDfhrwudjqFKcuymjuc8Jq80peyLa2lY811Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l+CZocFO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06CE606A31C;
	Wed, 11 Nov 2026 22:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l+CZocFO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B461F00A05;
	Wed, 11 Nov 2026 22:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794435090;
	bh=MUGi+6yGnkd+Ifly32JGBty8CIYlhjDD8RBpprRWoYE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=l+CZocFOipkssoSR4nDy8rXOPR4VscQyi4qnCL1vXPFwNQg8OaBOIuOCaInl8e96r
	 ZwlRc1i7/6L4/vzQN+0L0DwnuPbmtt67pfOjPY+vb0dxgPlPB90E7P0j1anEKLviQv
	 5LSrrdNHXhS/UOfzdhgQspSktdWd9/8F+qEEiPz38DK/XgFrpRqK9aYp87/QrAjErI
	 +jyYnf8ekRSoAZKyHF1Fbpjw6W39yy9fnq3WO2Y5eYee09N9qA/Vhq3yWy92aWaXID
	 32hmABD3dDPq1uccKqdLQN7VMxwxRDRnsHMjk9Ep7IHrJhQHw1C9tJr6BxPRHmK5Aw
	 R1QVhNtVNZuIA==
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
Subject: Re: [PATCH v3 2/5] clk: cix: Handle Sky1 AUDSS DMA interrupt gates
 as an irqchip
From: Brian Masney <masneyb@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, robin.murphy@arm.com, sboyd@kernel.org, 
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 devicetree@vger.kernel.org, Frank.Li@kernel.org, 
 cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, joakim.zhang@cixtech.com, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261106013520.1134450-3-Jelly.Jia@cixtech.com>
References: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
 <20261106013520.1134450-3-Jelly.Jia@cixtech.com>
Date: Wed, 11 Nov 2026 17:11:24 -0500
Message-Id: <179443508445.1143992.8301638068435530250.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=mfXkakMz9SQLnadusaEu+YqUiKYZPgdb6OV+3ZdFD4k=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+vOD9uZVb4uv3nHldHjJmJjzhf5Q2x70WmpclWMz7W
 +QIq+bxjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZiycTI8O5dXbIQ18kz2+d/
 VygRbQh/eI+l8Dr3DPbTzS/t9x94/ZWR4RNX2yHlgn8zhYU2lpdo71SbWh0lLsL4/8tpp88+Mdx
 +DAA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Jelly,

> The AUDSS CRU INFO_AP_IRQC register gates each DMA-350 channel interrupt
> onto the shared AP GIC line. Manage these gates with an irqchip in the
> CRU driver, keeping access to CRU registers out of the DMA driver. Mask
> and unmask the corresponding AP gate through the IRQ core; this controls
> interrupt delivery, not AP/DSP channel ownership.
> 
> The register exposes gate state but no per-channel pending status. Poll
> each enabled child's DMA handler to check its channel-local status. Use
> level flow handling so disabled and oneshot-threaded interrupts remain
> masked, and mark the children as polled because IRQ_NONE is expected
> when a different channel caused the parent interrupt.
> 
> Use a raw regmap lock for the hard-IRQ callbacks and keep the CRU powered
> while its IRQ resources are in use or being torn down. Quiesce the parent
> IRQ before runtime suspend and move system sleep handling to noirq.
> Save and restore the interrupt gates and software reset state with the
> other CRU context. Dispose of child mappings before removing the domain.
> 
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>

The irqchip driver doesn't belong in the clk subsystem, and it needs to
go in the irqchip subsystem. You can use the auxilary device like what's
done for the reset driver today.

Brian

-- 
Brian Masney <masneyb@kernel.org>
