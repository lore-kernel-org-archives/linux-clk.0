Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77257270EC3;
	Wed, 12 Aug 2026 05:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786513593; cv=none; b=mVj+HKfE/3PQOnTo5B6Xw2pQeF5nnZt+ngOESInE2jWZd6BqmsWUiKIyxgJamHsxpzz/07PvkbPkIEjyiwcRuypflD9bCvMd6UK9ghRYg/3UBR2bl6scw/TSNLWx92NV4hlTXyKCEFYqZfIHTrFRtQOGulO6PShy2kJjX9AFJOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786513593; c=relaxed/simple;
	bh=N++5Z5KdPe5M4c462tftlfQsAVaWMcAMvDxRM9CrRbs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=XqH6oRfJXiqvyd6VaD4te/xyzYpbmklFaWobuErMUKp68krwQrMLMK3zLf63r0FL6+t52S3LkWGFPauNNH6uTbKEZc6iDym8/KoDoveq5asDf7yPBq6DhfvtTnXeiDfmMPDrISfsw5GRNtARVtQzQpVlddHsuvYQcEFNPpEw3qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AihuxvCI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AihuxvCI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC3ED1F000E9;
	Wed, 12 Aug 2026 05:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786513592;
	bh=SGSApCPRMb3TnDF5cL9PHxP3javPP2KI/QwBzAazsso=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=AihuxvCIi6PZo50ZKE+UV0N75dHj2XCEHfdjJrO98jtm03YAPs21x8sUkrqKr8v7Z
	 IhwYjFYquzq1uvXuFuk/typVGRwrgdpOfPnDsRud0kn6FxHtGo2Q343cup3qC9RKbx
	 logJH33s5RJTmLJjF7wgic0IPnfSzt5boaKVUkWODerD5F6Fap7wtk5TDD7bgQ1xMI
	 JKNz2TmQ527aHA+JnbnbwkVnTIKysMG4CW7+l2v4HMszmwbam4FeH3NAEhXNylewRu
	 NoKyUjLG9XcHJyjGQY/FSS3HDR2gkIWT3vwTpcYHr1ZhILSupuPpbwUgS1C6TmIYMI
	 25GwB5shhToKg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260804115610.126049-1-abel.vesa@oss.qualcomm.com>
References: <20260804115610.126049-1-abel.vesa@oss.qualcomm.com>
Subject: Re: [GIT PULL] clk: imx: Updates for v7.3
From: Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Mike Turquette <mturquette@baylibre.com>
Date: Tue, 11 Aug 2026 22:46:30 -0700
Message-ID: <178651359011.5862.5213879268997098861@lazor>
User-Agent: alot/0.12

Quoting Abel Vesa (2026-08-04 04:56:10)
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/=
clk-imx-7.3
>=20
> for you to fetch changes up to 39ec460b56b26319d1f31b459e8be7ea34ae9c67:
>=20
>   clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on i.MX95 (2026-07-30=
 17:12:57 +0300)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
