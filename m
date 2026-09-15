Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583154AA571;
	Tue, 15 Sep 2026 15:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486512; cv=none; b=uMaJ5HLMapr5AAw1XA8Z13rqyGy9oJ5mQAuV69KsD+CtGiOOJN59zLGj+ZwsgeaLbHi1hnbPQSqaedsb7qhK0t8lZxhKDVVbbVSS8UV+6N6xMqwuG2Z6zMePCSegCrfg7v4UbLtA0YhkpEzcXUd8cSdx+4erMg3cdTvVFoGySig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486512; c=relaxed/simple;
	bh=b8MGX+xCFQOMeqSYPH2BZXF5sDNIBn+JgMTA6JKV2sk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=thH49yZeAQ6EVqrgmai0+aTsj2JkV2YIf/i7g03c/4SNAsxw08LA3rEmUQzK7wBE91vDfjazaSF4AO9iojw6TeysaYPR6ZWfSp5FbtRO3f4hSd3hs7EdbYnE/IwHB37HybDofaXIjViDMRgKpDfDM5pDG0k6qBnuwrB8+dYwm8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nI1gSoAT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nI1gSoAT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D2A1F000FF;
	Tue, 15 Sep 2026 15:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789486510;
	bh=b8MGX+xCFQOMeqSYPH2BZXF5sDNIBn+JgMTA6JKV2sk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nI1gSoATvWgHYfuidAE0oPRxuYsTnAh1IQF6VS/hpqxQTL7St+XDu45ezG18IxyWg
	 2UQsshK71EW1wdWdkaM/yB34jo6+haB+cjA83zTNdDFX4GOBrLlfTl8R/ZnXoLgLpJ
	 mUuolrACU32pWPbttuPirhedylKwnfA0JC8hdcKC4MIFUd8z33c5dT5JCQHXCWe0RR
	 gjeFGhxrsMe3+fpHIjw9PJV4Tj5KWUkwxQ+hHwTwOOg/ugXdh5CVSd9LaznmzKPRKj
	 gIvkz37KEBCPfO25D2O1UEvKitF09wM7AT8rT3+kfc+Zq2OewupsZXSmc26gy/gEiI
	 G0hrdRCMAFJ9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/20] dt-bindings: display: verisilicon: Add
 starfive,jh7110-dc8200
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, mfd@lists.linux.dev, robh@kernel.org, olteanv@gmail.com, lee@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260915-jh7110-clean-send-v4-5-f0e4fd6f2cc8@samsung.com>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153222eucas1p213b95b05ea7eb9a18700af8888ef5a44@eucas1p2.samsung.com>
 <20260915-jh7110-clean-send-v4-5-f0e4fd6f2cc8@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 15:35:09 +0000
Message-Id: <20260915153510.38D2A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> The JH7110 embeds a DC8200. The binding requires an SoC specific
> compatible ahead of the generic one, so add the JH7110 to the enum.
>=20
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-jh7110-cle=
an-send-v4-0-f0e4fd6f2cc8@samsung.com?part=3D5

