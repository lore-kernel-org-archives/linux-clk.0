Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2A727A47F;
	Fri, 28 Aug 2026 13:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925154; cv=none; b=odClVO4pofqZXyLPl9FUaEf+mSSwc4tUBJY4nWwQK8jsynesep2pgFG8Z19mE/8ZW7O4zqxlqL8yFFOIAAAutgZuMS3qPzrYC9V96pSsnS7qxB1VJkMeuKA3J/ZgnhtnlkubjjfpmB1cPOwwpk/U88371yedQ3e+sgXf/kjPZBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925154; c=relaxed/simple;
	bh=v5B/fiOqedgCBxcCieptb7KGyc9EvkPc2fTNjN6aglI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YR7lirCdNNxi2ySA+aO1zTWgbzce8iLM0QZtKPbgnZ+KcHFkzS4a4NgEP5gfqrcfGQAzkrGEdBTRx/7oiC5pekA+A7QZ2Bi5dHkhkg9cqAr7yWZ/Wd1Ly1k4PAbOgvX6hXVvdkmycoTTO3yP+DVEjQVdevz6v92JE0JjgFBlmyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpkrMTyk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpkrMTyk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A50281F000E9;
	Fri, 28 Aug 2026 13:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787925153;
	bh=v5B/fiOqedgCBxcCieptb7KGyc9EvkPc2fTNjN6aglI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DpkrMTykW2r8Pzk9IvIE3hcAJtoRhIwOvD96MRnYZI1pTXm4WfTbyGmvO4D74VcVt
	 58gtXRg5zdJoh4b/oiUT3kaVb3W93Pn4lg9HLCkiXFgUIA7TRdSHta4nUXE6SeeU23
	 ZM6xkOa64XUL3Zrn39v1QkfuTqvOF6gzWQHpZE64XcEv0nZLOHCY+E/z/0xBq8ydOj
	 QnabfkHLd5h7nVmKpB3zcC/E7tPVjXxokrQjtUXBhD5T2/CQUK5pGCpJZ640qubwoE
	 3wDQV141E9M+D3gjvWKlXOtv3Ga1SEral+cn9hw4CSpKKsNv2qRN950Ya6sz6uiRMp
	 d/wBlFPEmxpcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/15] drm/bridge: inno-hdmi: Add .mode_valid
 platform operation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260828-jh7110-clean-send-v2-7-331680c8b9d1@samsung.com>
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
 <CGME20260828134826eucas1p1ed3a0c4a3207dc01d1ccb33e45ae462e@eucas1p1.samsung.com>
 <20260828-jh7110-clean-send-v2-7-331680c8b9d1@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 13:52:32 +0000
Message-Id: <20260828135232.A50281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> inno_hdmi_bridge_mode_valid() validates the pixel clock against
> hdmi->refclk, but that clock is optional and is only present on
> platforms that describe a "ref" clock. Platforms where the pixel clock
> is produced by a separate device - such as the StarFive JH7110, whose
> PHY is both the clock and the PHY provider - have no "ref" clock, so
> the check is skipped entirely and every mode is reported as valid.
>=20
> A mode the platform cannot generate is then advertised to userspace.
> The subsequent modeset appears to succeed, since the atomic enable path
> cannot fail, and the display silently stays blank.
>=20
> Add a .mode_valid platform operation so platforms can reject modes they
> are unable to drive. Platforms that do not implement it are unaffected.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-jh7110-cle=
an-send-v2-0-331680c8b9d1@samsung.com?part=3D7

