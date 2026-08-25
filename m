Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7E23E7145;
	Tue, 25 Aug 2026 21:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693501; cv=none; b=oOfsWEnzC0tvNPZFRSvuHIm4W3InolT7yJUzY035UkfnBzq9dCY4oB274hdx8nc/Mzl0U4VCp4F0PvlgRpoBPYMFz05329RJoaH4WwFvsgr2aJOY/vh3e/pz4KNhz04UUXvL42pw9f/jI0t2KFBegSFpzOIGg7jwymYmhsBG4FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693501; c=relaxed/simple;
	bh=R68l1qItjT79oFyRuhZkIlYtScrZffqTh+ICx2pRJzE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QZAN1kBeEKt427k/p/qnXyNBhkjzEMt9ucIiQl3IJ2L4PxAJxj7MTXpAhRfsBzTgZGM00DMlp9VsLHoJVAZAWi4Do0mn0LxeY7uAeaJtNH7gV8BhjvKq7jPxezzP+oxbFUgzhlKlQI0m0O0pCfFYdLAnRjd8vyKEhWFgc49YhzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDOyHnBW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDOyHnBW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C7B21F000E9;
	Tue, 25 Aug 2026 21:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787693500;
	bh=R68l1qItjT79oFyRuhZkIlYtScrZffqTh+ICx2pRJzE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fDOyHnBWLJdcrXerCwSPSHVgflMKSYPJKFPXCSt1BD799uzXM6MF+7QkYJ6M0fyGj
	 wb9Q85ywx2ARaJaDbLdjE/JXo5+LBY6Y67kKYqyFrY6yZmCo+FNx6JqRiuYYA6Gqcz
	 wLiY6Zh+M5xrhb3ReeJxsv0l7T+47hR8ZSM8zdVDQJCfPdUpYzEdsXS4pS3IiILPrU
	 KfrKYTmaV4coNVDsoKyV6d7EGyikGAAcqDVGS/LCbreU8XMM5kV/MKq8SNZNKALP0K
	 k91Q8bSI2D5egi1qn/B6cKceb2zApbmxOZQwheVUfMI/LHNR7HC1Z6xobpLtyTa7Ph
	 PMSqrtZnjj/Ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 04/12] ARM: dts: zte: Declare zx297520v3 CRM device
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260826-zx29clk-v11-4-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260826-zx29clk-v11-4-f8ad59c6426c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 21:31:39 +0000
Message-Id: <20260825213140.0C7B21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> This patch adds DT nodes for the main clock and reset controllers on the
> zx297520v3 board. It replaces the temporary placeholder UART clocks with
> the proper clocks exported by topcrm and lspcrm.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-zx29clk-v1=
1-0-f8ad59c6426c@gmail.com?part=3D4

