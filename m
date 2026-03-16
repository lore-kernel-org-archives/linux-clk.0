Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D839D19C542
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 12:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773663367; cv=none; b=QfcIKhbIZVNdXCIwiugP6HXyTMwj54L2vsPaLdCbSJG3JtnUVgD1FM1a0KltWgyizaJoqKXg1CDKZXXpUMUpEFGXDov0KwfiRNDC0nkNFgL3ec0Y2cwbRMZtt0QJ0GAAJ0nfN/PKfIlqqGMcIfQq+f8yMfAazTlOCe0LrpRLfNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773663367; c=relaxed/simple;
	bh=SrpGwU7qrBLflsSEF7JnYoUZan3t/CY9j9+fProo7sk=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=uSSEy5Y982EL6rArZPnGF38UtZH+VkATGflsaOIE/v3Hhzlm+rqJ84vL4e7xMvlQU0cNoZBvcd7w5//5/Qjd2pc3X4ZCTACjTnjvrmA1tMjcBPMYEA+AucY3R4V+klqKhG1RtXyn45jriXrRJ/12luJrr2Q+p9N5k+7CDMSboh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HrIPuqZY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HrIPuqZY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2F9C19421;
	Mon, 16 Mar 2026 12:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773663367;
	bh=SrpGwU7qrBLflsSEF7JnYoUZan3t/CY9j9+fProo7sk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=HrIPuqZYfyTJ3andYiQHAdrtH8kzZiFG88qcY+ELNkubu62Llcr9ZVZFNtt8v0qcq
	 RdlmnW5kd13VgRJROzamTV4kVbEOpBIN+ie8hG23WgnPFaq2M2pEySYvGTIDGFajnv
	 BISB0DucckMfUh2TwOndhUCxeX7Wf3kFg019VZh0n/11vzhJQGPdpt0KAmiM1cDOwA
	 BrclieRQpNlS4YqrCF0pnU+kIy73105BFaog7ON9k+sQc0U0Hb5YJMCaQ5d7Fcmtdt
	 1G4Tf2gFbEIRrnK2lLUQxC9gqZGisd9Cy1tZbo0b0+WdIy72WidvN/EsnZvU8Zp09H
	 OSkKh82p8nEOw==
Message-ID: <86d314a03d1597390adb850789501cb9@kernel.org>
Date: Mon, 16 Mar 2026 12:16:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Subject: Re: [PATCH v7 1/5] clk: bcm: rpi: Manage clock rate in
 prepare/unprepare callbacks
In-Reply-To: <20260312-v3d-power-management-v7-1-9f006a1d4c55@igalia.com>
References: <20260312-v3d-power-management-v7-1-9f006a1d4c55@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Chema
 Casanova" <jmcasanova@igalia.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "Florian
 Fainelli" <florian.fainelli@broadcom.com>, "Iago Toral Quiroga" <itoral@igalia.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Melissa Wen" <mwen@igalia.com>, "Michael
 Turquette" <mturquette@baylibre.com>, "Nicolas Saenz Julienne" <nsaenz@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Stefan Wahren" <wahrenst@gmx.net>, "Stephen
 Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

On Thu, 12 Mar 2026 18:34:23 -0300, Ma=C3=ADra Canal wrote:
> On current firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> actually power off the clock. To achieve meaningful power savings, the
> clock rate must be set to the minimum before disabling. This might be
> fixed in future firmware releases.
>=20
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
