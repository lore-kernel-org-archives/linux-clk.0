Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41413EDACD;
	Fri,  4 Sep 2026 13:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529626; cv=none; b=tMRPjVMKxPxARToOIEgW1ee5+GPJjPjMtKkimFpQHcucUKn67pUH45fiUPLRe8zS2y1GdFAXe47Jt9UgonQejPbKYVTEHcBeEmeL3uSVP2/NFssUqO0NSNicI7JKvWJKp4L7WHc7Ufig48heCA8EaQfsE8jj53isPXpdJ5Y0KiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529626; c=relaxed/simple;
	bh=jrOd4Hrk+SVGKObt8qkwvbAXHOaE3Px7VkO0WQZppE8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p9CE1OExodpHTztqnkhBX1rNrdrm9psDL4PKIuyUxj4e1VEnS/Y7Zy+AymNH0bsG+diMMLW0C0tf0aHdjf9K/+xEsHVEPne8jt/6Y6zKcVfCi/EE1uZai3ElW09xOFkagyj8L5viONPV/7dzAyRxEgihvHQ90OlT/VA3mnE2CMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dyu6nehj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dyu6nehj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9221F00A3D;
	Fri,  4 Sep 2026 13:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529624;
	bh=jrOd4Hrk+SVGKObt8qkwvbAXHOaE3Px7VkO0WQZppE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dyu6nehjd2JvJaJbiBkjcbMQogvSASDoqkHljYhLXcxKxX/9LLcV3Mkxtf2D+IkFI
	 eGw4QLrGbEONJF49g1QW6dbGk23boud0dm/Vhv0oPNMHOoqyR5OiXW+t9uiDfZXQgx
	 +uPeP3ui6daZZOmvkLxZRXjuLTR+24sOZb6Xt6pmxwSiHEbF40/TVTF/81n4CcOQeb
	 I4GGjdbIbt9vsFnctyaWdJpa1nUoxXnUxKNDk1L2QE+HONC3FyrBAw+Z3nRYqmPcw4
	 CtnEMMMoNp5Q9cXGs3SOK0I/6n5PFKPDCntLvti1OxoKCptzTkLiYj2kMOuzb/kXy9
	 09GjtdzesRRBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/19] soc: starfive: Add jh7110-vout-subsystem
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, lee@kernel.org, mfd@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org
In-Reply-To: <20260904-jh7110-clean-send-v3-12-484f9ae72715@samsung.com>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132731eucas1p182c607567520f7c6f482a9c85ab64ece@eucas1p1.samsung.com>
 <20260904-jh7110-clean-send-v3-12-484f9ae72715@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 13:47:03 +0000
Message-Id: <20260904134703.BC9221F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> Nothing in the video output subsystem can reach its own registers until
> the NoC display bus clock and reset are up and PD_VOUT is powered, and
> those are shared by every device in the region. Leaving them to whichever
> consumer probes first works by accident and stops working as soon as the
> probe order changes.
>=20
> Add a driver for the subsystem node that takes the bus clock and reset,
> holds a runtime PM reference so genpd keeps PD_VOUT powered, and then
> populates its children. All three are released only once the last child
> is gone.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-jh7110-cle=
an-send-v3-0-484f9ae72715@samsung.com?part=3D12

