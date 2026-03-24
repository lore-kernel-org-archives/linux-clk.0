Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C3CCA6F
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 00:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311787; cv=none; b=tQKBjjKizae5IHMUOND/4O41iIohXM1CYO+TtuHlMYJ/gbuPwmrkTqsVZXttm0hBuqIqJtYRtvO4CnXls5a+pLiRDOfxQLwONM1Kzs+vnqmhCm2zsyxc4o3Jitc5i/lGQ//WUg7DxkROU55Pf7e5050vbpJP/7jB+N81TqoKTkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311787; c=relaxed/simple;
	bh=SC2ww4mJ1qgAoxcGEzXEXyqlY9RVISGD9yN/EftWNec=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=LtBFvqXQImABmD9l8+PtJbWnvjA8SQvdrFyxakMeDpOWLj4LCp4IbNUUFiyfxp9w+8R/YSCGFfrUppIj1T6DNXkpHdkIBe0ZhiMgQsfDTcaIXnZDdGpCtkbJ6bVQbM534zZrtF6RgNEL6IPFj/tk7DzjdLtMhJFB0EYcXuxB1Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XiBE9ov2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XiBE9ov2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27AD0C4CEF7;
	Tue, 24 Mar 2026 00:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311787;
	bh=SC2ww4mJ1qgAoxcGEzXEXyqlY9RVISGD9yN/EftWNec=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XiBE9ov29yNU6/5B0AfnbLcDPQksTDNLH5ePaqtdeaf9acTNUq4HJtSOjqowCOO9k
	 Vjvg1LuO+quqYVXrHvBmEDeG/dxOt3DzDCpdWgDxIaMFXfyerCoVCRiwL3vPRmXt39
	 09a1ddyF9GLZXIgCkhiSOXw1//FPNpfnob68SQ/SNSSeJ71K54zKrRUGwVb5Kz2mFS
	 AtJoboE6Gc8wyo2e1pIypreefHYD7wEwSuJhvTEVugzS2/hMm9DYGxkGS2GPdCXfij
	 /LkFnsqVVA+ZrqRoDf2T8TYQphhKH7mbuTORDbQ1HjQWWq8rwbdgub4mDiSjml1NUY
	 3D5qgLTHeVCnw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260312-v3d-power-management-v7-1-9f006a1d4c55@igalia.com>
References: <20260312-v3d-power-management-v7-0-9f006a1d4c55@igalia.com> <20260312-v3d-power-management-v7-1-9f006a1d4c55@igalia.com>
Subject: Re: [PATCH v7 1/5] clk: bcm: rpi: Manage clock rate in prepare/unprepare callbacks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>
To: Chema Casanova <jmcasanova@igalia.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Iago Toral Quiroga <itoral@igalia.com>, Maxime Ripard <mripard@kernel.org>, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Melissa Wen <mwen@igalia.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Stefan Wahren <wahrenst@gmx.net>
Date: Mon, 23 Mar 2026 17:23:04 -0700
Message-ID: <177431178481.5403.10860855444629990495@lazor>
User-Agent: alot/0.12

Quoting Ma=C3=ADra Canal (2026-03-12 14:34:23)
> On current firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> actually power off the clock. To achieve meaningful power savings, the
> clock rate must be set to the minimum before disabling. This might be
> fixed in future firmware releases.
>=20
> Rather than pushing rate management to clock consumers, handle it
> directly in the clock framework's prepare/unprepare callbacks. In
> unprepare, set the rate to the minimum before disabling the clock.
> In prepare, for clocks marked with `maximize` (currently v3d),
> restore the rate to the maximum after enabling.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
