Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795493180;
	b=Khg2qJvLG46jWAmKQOyKgV/NbKbQvYMNpTajTMhIZgrzT7jtqyRKvMfmi6BAJKF+ece0
	 hL5BSrGekifdb17aaqA7pgAGIPvpkOlDFvogNSGbVOqhWuj0+reOCcCfrMu5umUPM7Rj2
	 vTlajZFqnqiIPgiFo0rxvs5UCEktaTgp+OKdj9/6UeH/irHEVybzEjlfjig1jFNEaTq4U
	 bBGLqlFfmHMB7bTlcWBfHGqr8tzXT5tQpvhRjn0pkKnlpmivjYH+vaIQnKeQQTneOcw0a
	 XejxmijkXCo2T3hJQ+Zaf1As+4bnrtgxdwr6XXfLuSTSCNCa46hB7AbaX7O1z6s3I4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795493180;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MLyYUj0Pfd5koVb8sNQqwWsa4NkXJ2XNvfGWZKPAGUw=;
	b=HYzYtj6BKg6sxO4iIA6tYlDvt8deEEnVl6sBqzhqOqwyMd2T4fZNCNkxPA1ZREFmcZYp
	 X8aZ06KAWxJ6UwyzKxRnNY58L8deite3D0RHee02et3G6d6vzdb+RqFamLWqvdNEo8PT+
	 MM1f0Hhl2P9bJaVCeystAJix8WsBNcWdgnghdN0iUgxR0a9nJAKyoLQyWDHYQV1nEsdNv
	 YAeL7PVTI4JEQDfTb+TXI4y6v0RSqeRJ9QDpF81wQVPWLqmxsyB7c3mjM0oO/83+Oer4A
	 5mbKLd4yfxW7kFw68K3Vw2GsquUw2fcSwrEDVUHST37+DvTKo4/kRpvz0THpNsi6DjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="TLzc9/JR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39A1606A33C;
	Tue, 24 Nov 2026 04:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TLzc9/JR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E14D31F000CF;
	Tue, 24 Nov 2026 04:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795493179;
	bh=MLyYUj0Pfd5koVb8sNQqwWsa4NkXJ2XNvfGWZKPAGUw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TLzc9/JRUleknlrRPuEsqiVmOYZC5Mo3VEfU9V8ki/EdeDrqhANVKqynj41u8FyxV
	 2pYxVKHXrYf2YNTfqRA6cvQ5pRH0WlrFpqZuzy5Z0oOIFS2SoBB0T5vIRVaBNMyo4Y
	 Mk23SkvcKfR4BluLcdFkePur+ZnhkPlnP1wBW1MDCnxza5pipUzm/VqgoNTNwwqE4G
	 XZof9sXR4s6DM48vTf/VPLwwI3/ySjRSILiSuTh9M3OLati7zFJ+k4e0SVl/O6fVxJ
	 s9Ifu2RtckshBHiYppkVG8dvvOLAtJ3GCD2nQ9QVpdS/dZgoWd758HUzaynf8D5quA
	 DhHvCPIECjXvA==
Message-ID: <sashiko-outbox-230495@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 8/8] clk: clocking-wizard: Use separate
 notifier_block for each clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubhrajyoti Datta" <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124035613.1968260-9-shubhrajyoti.datta@amd.com>
References: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
 <20261124035613.1968260-9-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 04:06:18 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] clk: clocking-wizard: missing Fixes: trailer for commit
  812283cd5463
--

commit 0c67f4b1f8ba075a81a9fa7a79cc2bab19b7b2cc
Author: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

> clk: clocking-wizard: Use separate notifier_block for each clock
>
> A struct notifier_block has a single 'next' pointer, so registering the
> same instance to two different notification chains corrupts the linked
> lists. Use a dedicated nb_axi for the s_axi_aclk notifier chain.
>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

[Severity: Low]
This fixes a bug where clk_wzrd->nb was registered to both the clk_in1 and
s_axi_aclk notifier chains.  Should this include:

  Fixes: 812283cd5463 ("staging: Add Xilinx Clocking Wizard driver")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124035613.1968=
260-1-shubhrajyoti.datta@amd.com?part=3D8
