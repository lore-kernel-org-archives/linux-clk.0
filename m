Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19572F9D9
	for <linux-clk@vger.kernel.org>; Sun, 21 Sep 2025 16:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758471916; cv=none; b=DvK6K5BbiV7dHtUVFrFxbmCankNmBynSyn3UN4NI4wM/boX8z7WJuGZoNhYnVeLEUeTJhMpcYtgVlVILDjO1j7g9MDUOasZzFc7onsxFdep7twyR4N4EU9uz6uKk4VssoriIbpbI/O8UiQu5mjAwDDdoF1blOSGQKRkH3TL/aCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758471916; c=relaxed/simple;
	bh=4+lFFGxaAXuhxyC60wyFAdmrF9GVKC8NDmo1gVQ1tBU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=qGd5UNyoXeHtxvYKq0LvkRYndxqBwdLHTB/ubUaKCZoY7xeSdDxhiT80n2tM8CjDoE2XgwpbcCW6u+JW2KtQw4xHxrkP/VgxobcAqSd+PNsFnJotn8ApftquUOPRKn3UNyCM8zmKLPekJR6AYqJD3MA9W8nlLDOj9ool/8o4FPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fT1X8zT5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fT1X8zT5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67647C4AF09;
	Sun, 21 Sep 2025 16:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758471914;
	bh=4+lFFGxaAXuhxyC60wyFAdmrF9GVKC8NDmo1gVQ1tBU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fT1X8zT50hl2pXeiLohHKGfigxhL9EZEmCFLlf9K+Tjlj6CalyQYnEuy+LCR5vJmB
	 sYKmJ2puO2ZdxqRB8Di7vErQnPDTri9bU52sWICrAfYNeBq+hSEaNRzcf5DW8rd4um
	 KOrc3oy0jNKIZrCh0DmYrWROTMxvcWT5pASMjfdw0zcmG9alW/d32IVRluZOYGrhzq
	 K4SKVPaKHxpSyV+WhjNdDv/XJ/zUMXZniouXpLbpbSXYYvZxySPA50H5yB+c1+WDbS
	 ywGHrLC62LlDnsRdo7sjREHp0d+eayNMyoRCkGO9Qg38eeSW+dPsbzX0okZ2PmBRWL
	 MS49cRGiCb7UA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250731-v3d-power-management-v2-2-032d56b01964@igalia.com>
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com> <20250731-v3d-power-management-v2-2-032d56b01964@igalia.com>
Subject: Re: [PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when preparing/unpreparing
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Dom Cobley <popcornmix@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Iago Toral Quiroga <itoral@igalia.com>, Maxime Ripard <mripard@kernel.org>, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Melissa Wen <mwen@igalia.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Stefan Wahren <wahrenst@gmx.net>
Date: Sun, 21 Sep 2025 09:25:13 -0700
Message-ID: <175847191319.4354.13436181095126788590@lazor>
User-Agent: alot/0.11

Quoting Ma=C3=ADra Canal (2025-07-31 14:06:18)
> Currently, when we prepare or unprepare RPi's clocks, we don't actually
> enable/disable the firmware clock. This means that
> `clk_disable_unprepare()` doesn't actually change the clock state at
> all, nor does it lowers the clock rate.
>=20
> From the Mailbox Property Interface documentation [1], we can see that
> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
> prepare and an unprepare hook for RPi's firmware clock.
>=20
> As now the clocks are actually turned off, some of them are now marked
> CLK_IS_CRITICAL, as those are required to be on during the whole system
> operation.
>=20
> Link: https://github.com/raspberrypi/firmware/wiki/Mailbox-property-inter=
face [1]
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>=20
> ---

Applied to clk-next
