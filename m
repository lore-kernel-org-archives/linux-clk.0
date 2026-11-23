Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467145;
	b=tbcNnwltbTUf/9eb8DYVu4y5NLUec5FKopoGk7Ub4n9QS5lCBJ0m+QuwqbeBviZHd5QV
	 a2VTj/sWLT7Bfx12N8cfyTOetvm8+I0pqMoD8KWMxayowR1D+ln/6ssHZueseO8csMwfw
	 McD5vhRiZHm/RZgd71JMhaxiyR8ptae7gUsttQVtf5Mfn1dEO/invT/DMz9p0FitEO9eq
	 AqfKBrG+AQ/cHo9+iR48yihMFgdCM23ssfBmY1AENTv/iz/qAnsA2UKV8garMUgK9UMWc
	 MfEdpISwiaCJ0CdHIS6sREz4GbxVmXu9LnK6v8H69Ke8NZIqFHS5BMNDde2nTJ7M3EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467145;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XyP9gShFWPctxSr81uIRTuZ0/c7l5kxiV6FOUZw82Go=;
	b=qUr3UVWbjMhlrYulZMfwj4se3G+51NavEACPpMXtW4/81Y4n6YkgSTCZVulsONpl1THm
	 xrNrGWUTQAKOSBJCNl4+T7Cv3VIwM+do78p0OGIJ0+5hBMBVuxxNRn8iqWZcx9iHniX1u
	 /VfDU081lnODbARiqjg7GZrHFId+GK44Y1tYW80snnHQEJCCj0HWU/zxC6JK5qhR1FT04
	 wCNIHD/UI7c07Vyjc6ivTNSK0ZqSCnD+R1y1ev2jOR6vkWi/wLbnTC37eFhF+6Vd84qdz
	 7tFqOtseCfA1v9BI/2RHrb+izS2bpiKnaORkOX9fnOsvIaGKxgRIMaCAgQsiD8aXgiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mjmB7DaN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461C0606A321
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 20:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mjmB7DaN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D5311F000C4;
	Mon, 23 Nov 2026 20:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467144;
	bh=XyP9gShFWPctxSr81uIRTuZ0/c7l5kxiV6FOUZw82Go=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mjmB7DaN45FkKi/rFem3RymsbICdjBlUz2Kueg4yq2lLk4rrxS1qe8Ev6gwqkJ9ED
	 FRrIjwnvwd46bvEX+RRnZlxVD8XPvRRZVgL6N3C1quyON1kDhSGmnxfM1lq6A7vOJC
	 5mChpnfM8R6Xz4733e8aljg4td1ix+EWYplFtRkOHQrEez3x0DBa9p8f65bhg8GEEB
	 ep07V7aMj/4I75Aoj9cro3BOq1dy/8oUJpNVJ/KebHIQDTpvBIteGAYG+5TBgnRr7f
	 LiwAmCktxml0d8cYsjLJ7B3G5eLYtAQP9S60ami4825ktGb3MTNbnJa5QIBo6cQLbH
	 miu0va7QlHcKw==
Message-ID: <sashiko-outbox-230029@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: qcom: glymur-dispcc: Stop mdss_mdp and mdss_ahb
 clk_src from getting parked
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tobias Heider" <tobias.heider@canonical.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261123-glymur-dispcc-park-v1-1-d636ef8e04f6@canonical.com>
References: <20261123-glymur-dispcc-park-v1-1-d636ef8e04f6@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 20:52:23 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] clk: qcom: dispcc-glymur: missing Fixes: trailer on bug-fix
  commit
--

commit d6b4721a4b28e59b4b633b11337db01bb5f1e588
Author: Tobias Heider <tobias.heider@canonical.com>

> clk: qcom: glymur-dispcc: Stop mdss_mdp and mdss_ahb clk_src from getting=
 parked
>
> Parking disp_cc_mdss_mdp_clk_src and disp_cc_mdss_ahb_clk_src at 19.2MHz
> kills the EFI GOP framebuffer. The EFI GOP framebuffer should keep working
> until the msm display driver loads, to help with boot debugging and to
> ensure display output when the msm module is not in the initramfs.
>
> Switch both disp_cc_mdss_mdp_clk_src and disp_cc_mdss_ahb_clk_src over
> to clk_rcg2_shared_no_init_park_ops to keep the EFI framebuffer working
> after binding the glymur-dispcc driver, following the
> precedent of commit bc27dbefae6e ("clk: qcom: x1e80100-dispcc: Stop
> disp_cc_mdss_mdp_clk_src from getting parked") and
> commit 5285b0467578 ("clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src
> at registration time")'
>
> Unlike x1e80100, where mdss_ahb is never parked, glymur's ahb also
> gets parked. Unparking disp_cc_mdss_mdp_clk_src alone was tested
> on the HP EliteBook X G2q and is not sufficient: the EFI GOP still
> dies unless disp_cc_mdss_ahb_clk_src is left un-parked as well.
>
> Signed-off-by: Tobias Heider <tobias.heider@canonical.com>

[Severity: Low]
As in the precedent commits cited in the changelog, should this include a
Fixes: tag for the commit that introduced disp_cc_mdss_ahb_clk_src and
disp_cc_mdss_mdp_clk_src with clk_rcg2_shared_ops?

  Fixes: b4d15211c408 ("clk: qcom: dispcc-glymur: Add support for Display C=
lock Controller")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-glymur-dis=
pcc-park-v1-1-d636ef8e04f6@canonical.com?part=3D1
