Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7247041B8E4;
	Tue, 25 Aug 2026 21:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693757; cv=none; b=lXbwBLdTpVnBP2MQnAmlM4bLCqh5g1RhoqiRfbDcdSR37K53NXGGf9w8U8te8RtafYgEBy6mL3/uLUyv14/bmhRzxUoExLQRyF4HWEl7ygR7gV8D3lGkZ6eIsuPQN4WQmn1wtv0X0MyCQENZ+QBrkdCPQsv6fNzvLDbX5GAqr7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693757; c=relaxed/simple;
	bh=Qm8Kj6dzkUYon3/ELXvm/yvPx7iY64uZ3RX73svnXbU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DOasDmhtt5gJZqP3gjkUolCpMHiKhCy5JGTYIg0OLpkuXmKvEl/TMY9mY8zBX2PTChruaNkIkREaaviAeBwDlOmXY7dq5P1JgAwzoFy61L4nf7LxxKg990T9zyWLhTEPKUZwEFzBA9W8nmR+SR72DpkkKYo2isXZH/By3bRYFYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJ4APmpv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJ4APmpv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D691F00A3A;
	Tue, 25 Aug 2026 21:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787693756;
	bh=Qm8Kj6dzkUYon3/ELXvm/yvPx7iY64uZ3RX73svnXbU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XJ4APmpvjracUV6Hz21xkco7mNA42533TpkhhtmWbjKEZ89Wix9ECc9CIlbmLgf8P
	 3zuJCDdpXgMAcyeDdCALtgM0X1Srrot3hl9/lU0NeUX1fAujcr6MH9mk/Dm2bdW38n
	 AUcBSHaJ1/yeu1kbUmNq1s16lVQk7jssqC+t8Gh2sVnbIlC73z3Erncga7/EHD9hFv
	 EZI81xln8RPV31hjCd06BYK/fPuAu8hi8Wc+zeCZV1oJfpvSU9s65kVRXDWzWJdesQ
	 YyIixHBn/wEAMU4mXwVwz7vfmNCvVQhSWDsW71MQtZqzlVWkgK7mKf7DSGCxWtpkEz
	 5tCI/6qEAwF8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 12/12] reset: zte: Add a zx297520v3 reset driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, lee@kernel.org, olteanv@gmail.com, mfd@lists.linux.dev, conor+dt@kernel.org, vkoul@kernel.org
In-Reply-To: <20260826-zx29clk-v11-12-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260826-zx29clk-v11-12-f8ad59c6426c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 21:35:55 +0000
Message-Id: <20260825213555.E4D691F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> This drives the MFD child devices created by the zte-zx297520v3-crm
> driver.
>=20
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-zx29clk-v1=
1-0-f8ad59c6426c@gmail.com?part=3D12

