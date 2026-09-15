Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB6643C067;
	Tue, 15 Sep 2026 15:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486514; cv=none; b=QAI4jYkA0PcLf4l/DSgXN1Q7uUzorOvxFw5wbK8OpX0lwKtMA27lOdgsZLFvkbq8eKCObr61bJ8zgRAd4v6JxXoJA04RVq7GlfBmpg9UGPhB4zMjP+rysnR04aY0HH72xHUwvZP9v4OsEVcmKAOnN+kcFzfWvrF3DP6NTSTtUfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486514; c=relaxed/simple;
	bh=lAvJ2bguiRgbSmP/34mDql50B0mFX68Xkv2x+ti9yCs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L53TS0YLnMb+KdXIRh9ALlvszLfVNdZiFU9TxW3ANr2tT4Ai8IwSvzimW1ziPh0IBIf8wfsNykDq81ruVjOeuEuS8x6/njrYVd3hNrHbBVoMJAiSWWTvcRQ85N6mCxiFS0B768xqLTBH7yASrM6ZudqTmHCJLhIMY1MGRFUHBE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=opBaQ7aj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opBaQ7aj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6731D1F00893;
	Tue, 15 Sep 2026 15:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789486512;
	bh=lAvJ2bguiRgbSmP/34mDql50B0mFX68Xkv2x+ti9yCs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=opBaQ7ajJydF8UmgbmB0mFFGvbO31di4dzsCPEVOmv6ds1Zm8REAoJZxp8DVuP1Jx
	 l6m/krTWRfzCjgPGRrSAI6vZy2ybTHUqPtbdA3S3oYisfmGI2u0lG9maCvSKPkfxZs
	 uEKXYMCXj/gDMTzZfjhil+F5kGuQ1aU+L4cE6VsYCcWVtNZYEJdh6eiFLtr7+6roX3
	 24Y8X7w6EjevblqhbrqiBahNtW/ucCvQU/XPuiSuaKEKSaBGyyfCY6gVaW9WnTnSxV
	 jDdn0pOURuptp5Rd8AlWgo4slMcYQ1kCNn2Y1aJGDVqnEp23gjsmBAkfIRVXYn7g34
	 xSPsGyRZnAfBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/20] dt-bindings: soc: starfive: Add
 starfive,jh7110-vout-subsystem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: vkoul@kernel.org, dri-devel@lists.freedesktop.org, lee@kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, mfd@lists.linux.dev
In-Reply-To: <20260915-jh7110-clean-send-v4-6-f0e4fd6f2cc8@samsung.com>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153224eucas1p1c19b20f6af600b1c3228a9a8f4bb4490@eucas1p1.samsung.com>
 <20260915-jh7110-clean-send-v4-6-f0e4fd6f2cc8@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 15:35:11 +0000
Message-Id: <20260915153511.6731D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> The JH7110 groups its display hardware into a video output subsystem,
> dom_vout_top, covering the DC8200, the HDMI transmitter, the video
> output clock generator and the video output system controller.
>=20
> They share one NoC port whose clock and reset gate access to every
> register in the region, and the region sits in the PD_VOUT power
> domain. Describe the subsystem as a bus node so those resources are
> owned by the block that shares them, rather than by whichever consumer
> happens to probe first.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-jh7110-cle=
an-send-v4-0-f0e4fd6f2cc8@samsung.com?part=3D6

