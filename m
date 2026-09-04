Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C424A0EFD;
	Fri,  4 Sep 2026 13:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528650; cv=none; b=JaWJ31Yju0HyMtpewQ/U031J9B5Rpr3ft6M6CaU5KrlmNS5AE2X0M0Otzbnf5c3Oq5S/dYlQawg7QCydr64pPO1KyP/RKSBD+tbkq4psxhiasW+9ivWx+qOccCUuOsZSRmA5v858NKuMpp1Kr7252S5i85yCtx7npGXd/aWp+4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528650; c=relaxed/simple;
	bh=IQ26GNFlKcl9SbfyYjBUWsK0WzvCiHztfchbZ3Xz8N8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EThdpknTM06RabBhLXs2QRPqxOZuWwUrAK4rikcBjQPuHsSk55Nil2V1bfBYH/xioLqkVNrob79KIKX6PHnwr6VUBXgPUi4qczzxFuZkjD4qQZ/2PE5e4+fFNYZyAT62YD5zrp1YpnXVBEJzdo0LizpU5rayjfNTOlgf3DV+248=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Imto6OsL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Imto6OsL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D7F1F00A3D;
	Fri,  4 Sep 2026 13:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788528649;
	bh=IQ26GNFlKcl9SbfyYjBUWsK0WzvCiHztfchbZ3Xz8N8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Imto6OsLTI+gjfxw4DNmfbbwAhoooMnzWjRjQNIxXYSjS6WXX5xg4QSxinYrAu61z
	 w8ErfeOCFFrKmk9zBSHKNYgKU7uV9RONFSZPuQysWk8P64GR4vTKafSE28kRG5P6QW
	 7yHAJ6ZIiF/1PrcOSEIhtnk9k70Fyc6F1UgliOhsOccuLUKCLNgAz6LqAqkMOPXKID
	 EnHqj6KCfz3UOfMvZMLr3Xf9qDndKamYZeZsxcBn4Umxp6rr3XMItXfYpnDvP9PyF4
	 hxo4o+mt/lWx2WScxJhaLTcHr+X6LHKxVLwYkgUcC5IOCGQbuk2FiyV4Wp8WSOLxO7
	 106FtoP/fbgKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/19] dt-bindings: soc: starfive: Add
 starfive,jh7110-vout-syscon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, olteanv@gmail.com, lee@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, vkoul@kernel.org, robh@kernel.org
In-Reply-To: <20260904-jh7110-clean-send-v3-4-484f9ae72715@samsung.com>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132716eucas1p2d093509db255e62e6bd546e734f04e63@eucas1p2.samsung.com>
 <20260904-jh7110-clean-send-v3-4-484f9ae72715@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 13:30:48 +0000
Message-Id: <20260904133048.B6D7F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> The video output subsystem has its own system controller, documented as
> dom_vout_syscon. Among other things it holds the mux that selects which
> DC8200 output drives the HDMI transmitter, so the HDMI controller needs
> to reach it.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-jh7110-cle=
an-send-v3-0-484f9ae72715@samsung.com?part=3D4

