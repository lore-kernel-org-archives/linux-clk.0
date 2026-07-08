Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493E34F7983;
	Wed,  8 Jul 2026 14:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522659; cv=none; b=Pp3jTbBh1YL72SYb76JStxmlUtfx+uBu16Y2nwbP9CsPC9ZizQpBWl9GF9BNHZwJvuaayuGlICwDUEh/e+AxvxxmUjyz4IqQd8YFaPZCi9tWkb7jXjkuUAMNNN/QJd1keT0UoWFYzqlZd79LrPVrSrHCJa87uOP2/qES27agskE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522659; c=relaxed/simple;
	bh=lLyROqZE0ydWkolIvy/Eq1ql1hX3fsn2TGYIXh12aoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r7bJl/XpvKsLPlS3egjQWtSoQftcu40nd7aCAYUWfVlOTSlkUKlzDurU/4JVi8/siTh2Ue5ybQGgaYdSzOVEJvhcakbjYOo4/lx8jTyYZ07HfYhxqbD8gV6Kse5tjIKSg9FqK5zCHg/8AHaAdgv965pL3Lk/QOSYc1yhMoBCK2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=daOE10wH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="daOE10wH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7B11F00A3D;
	Wed,  8 Jul 2026 14:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522658;
	bh=JkzeN1rfHLrwk45sfaOFfLsae5rlzHqSqIFRrojYsK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=daOE10wHOiezUptudQKIviFR4rokvSuYFj9GehZLF2bnYtNktfFmtD5mBLr1n6T8a
	 EyxmL5kXINy7XPj0u2XODIJlwWRBMuHzGATuwGOBw6sySVJaZNhiRL/QxT6mmRiC7Y
	 2wyRYekgAAmkb3hzGc3caW6HBnvBPBMoO2WlZof31lxEHPj5DSS5eK02lAMe1UACoM
	 HO6BQjlU4zKpgqY+dsgPxqKRqufw1x6J44w2q8dVtWOCgZZJWnhZkhxLuhEV+fJ7xu
	 /Rh9giWciHHrpPzXLZJatp3wVcyD8zzvAoDtUjnD+7ctjTnajNCHO9QN7d8Ik7SDI7
	 h/NgOIR8/9I+w==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH] Revert "clk: qcom: regmap-phy-mux: Rework the implementation"
Date: Wed,  8 Jul 2026 09:56:38 -0500
Message-ID: <178352261638.2235436.8659636329958958308.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260622-topic-phymux_revert-v1-1-f6ec85523840@oss.qualcomm.com>
References: <20260622-topic-phymux_revert-v1-1-f6ec85523840@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 22 Jun 2026 12:46:05 +0200, Konrad Dybcio wrote:
> This reverts commit e108373c54fbc844b7f541c6fd7ecb31772afd3c.
> 
> This has been reported to break PCIe on at least SM8350 and Eliza
> platforms. I had originally tested this on Hamoa (X1E) where there were
> no adverse effects. It's highly likely that this stems from a
> difference in how the bootloader configures the clocks.
> 
> [...]

Applied, thanks!

[1/1] Revert "clk: qcom: regmap-phy-mux: Rework the implementation"
      commit: 0aec16a93bac6b2db928119bd34cc1e896173af4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
