Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672319;
	b=j1J/GzoWq8PsGDnpGorph8tan6LGPmFLD2EJti7Yf50nHjG+/wYWRnm9BrdIumtsHiZG
	 pZEOBiUciO7N6s1Zjxjk+LADOS1G1xw+nflzA3/6Jx6H/+UQXu1tDKYMc39sh5/w8qq6m
	 FeZv9HXMAglbfdwe7P3YfZEyPO3A/yutDaE8GS1oq9YG5lVLZotiV6ZV3+n4MmzGOqo7j
	 BIYGOT/TUOaV8ExUpj+L0dz2E6eSMGjMgYUIcOQQCHbgRaHQy0ZdsDawvrUjZ7S86tRyE
	 yIg0igObk+bfge1oUeuAl7rRg6EbMqcVLa3DcIxpQ3rxlti2OXLuq4cahaG9eU7T6ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672319;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=JbegetZtdMJY0UH56qsA+4py+WjtuP90DgylLUgZa9w=;
	b=4fwhUpMn4HYjskHRRsDn0F62S+Zy5w0N2mbEs1b2CXmg0dYuQRr/a9bpVsCnJ4rMJ1Uk
	 2lJTmbIBAF4kbIWy6oNtvvBYTLl/v2LVkgSQUWa5ymOtaAibu1T60qP5/1Fft9ImbpsDx
	 0AcKwwtVIt89AnIiYPslrh4SRt26JBtHrBYOZfglvOcFlOpXvJdheo6KXRFSggMOT6V4q
	 TwOqSFA5wTXO9dpcRy3gwwcFhBvnV0dqtaL6Q7Io7UnXwuhvhDokCkopddWGujUN5Zp/s
	 DXJCAxJsS9QJ8kgH/LuMfMr8tvW8vWrOq//G4EuM+V6czM5jMpLhShX199ydBoljerw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mB1zVfI+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F189606A31C;
	Thu, 26 Nov 2026 05:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mB1zVfI+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178B71F000CA;
	Thu, 26 Nov 2026 05:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795672319;
	bh=JbegetZtdMJY0UH56qsA+4py+WjtuP90DgylLUgZa9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mB1zVfI+R01hF2zbBQpgEqOuzZm7P7/2DdcJwuDqxeovKJXk64nnnOjiX5OlQ45fk
	 GMNmS5fYcbULpgzOTMJ7LRDo+LFpPa+5feR3jByJIyXwmYLGh+oJtaNuBd2g2wsJL1
	 ++lsT/uvODPYCFgtfqlyGP2tWNR5X0m30k2lpSOpntrfDBogP+0MS3elU/RBKjnKpF
	 T16Q2NBpf4H1veqrcW2dEGGOTg8xHgbaWVMP2SXCW1AkjqpsSaU4gP7qXbnXNK5y/3
	 ydkzmxIo/lG4y94MrDk2vJJdHlQqj4HX13EO9/LyIV/ggPbQ0SLodSA+Ivq+x7pzxC
	 y960LSgW17mRg==
From: Yixun Lan <dlan@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Yixun Lan <dlan@kernel.org>
Cc: Alex Elder <elder@riscstar.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Iker Pedrosa <ikerpedrosam@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: spacemit: extend to support pm domain driver
Date: Thu, 26 Nov 2026 05:51:51 +0000
Message-ID: <179567190353.1020552.6488313745742549977.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org>
References: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org>
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
Content-Transfer-Encoding: 8bit


On Thu, 08 Oct 2026 02:57:54 +0000, Yixun Lan wrote:
> The APMU (Application Subsystem Power Management Unit) register region block
> not only provides clock and reset support, but also the pm domain management
> capabilities, so registering pm domain driver via auxilary bus is feasible
> way to go.
> 
> The series try to extend the CCU driver to do some preparation for addition
> of pm domain driver via the auxilary bus.
> 
> [...]

Applied to SpacemiT SoC tree (branch: clk-for-next), thanks!

[1/2] clk: spacemit: rename to generic ccu aux register function
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=92abd348af1882c1f91af67e6c66cc1e0a437814
[2/2] clk: spacemit: register pm domain auxiliary driver
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=a2aa2b526090cad0199bda2fcf713f25cb15dd18

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
