Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B679437B00A;
	Wed, 29 Apr 2026 03:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777435072; cv=none; b=K5KRXqY9E0MTm7pct+aw6ghCKmGQ5X10rVFqMk3E/9itMmuMZ/u79yJviAhuCIPolhTLn9SZke5d1LEhVrU1l4VrAJX+DNzR36QlhWpBAtGfaEbdAQ3yDnNdbLmrkNBzi1V62jst8qfx0zrGCRFoxxl9iU7HbeO6maYsowrM/Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777435072; c=relaxed/simple;
	bh=IiZDEYd3G61roEvM82iRLsIal6Ch/P/n1ZmhGvjYTDw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ryHEBvWQXXbBbAIbsEbv+BaCf9tNxxnMUgGkYQUmHRvbIFsDkL/t4yzYN4NZN87TDfKq3w+X7dSwy5e1NMJx+lReE0jPIzcm6bVwmW9FZDEBGZ07J9weKzysXCC6H58PrU6x+kf01xih+hREu0ihxVDaIVAbImc5bSJl8Q/I0pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ItCGFWpD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItCGFWpD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53EF8C19425;
	Wed, 29 Apr 2026 03:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777435072;
	bh=IiZDEYd3G61roEvM82iRLsIal6Ch/P/n1ZmhGvjYTDw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ItCGFWpD2QdkMGgAOOfEqBEPyHdxHMWSPK5W9gUSAkzumDJgSp2UuWVMxKs5LCr6g
	 iHRNL3nUdwHMlZaepTB2yCLadReoPGH972UALJ/buLg2z5E27/sZeuXbBjbB0LBw5Q
	 H0wHHiOacPPWTSCunZbj5v6hZMMD5kvLsg/v4XEpiL/m18wV7HZZM3E8RZXuDDebX5
	 gzpDktsnvn2//N1pHFVc2J4qtOJW9XEpQqTF1WkPsJWdrmWp4Q3ejDSQnsLBWdBhLS
	 /oRK+s02HPU+NUZHtdvrfY/a+sRITFedGx5keKf2QjzGcZL57cxDrjRUkVF0U+qEPV
	 NRbPt6769I9ng==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260427-ti-sci-jacinto-s2r-restore-irq-v6-3-72c6468cb2ab@bootlin.com>
References: <20260427-ti-sci-jacinto-s2r-restore-irq-v6-0-72c6468cb2ab@bootlin.com> <20260427-ti-sci-jacinto-s2r-restore-irq-v6-3-72c6468cb2ab@bootlin.com>
Subject: Re: [PATCH v6 3/4] clk: keystone: sci-clk: add restore_context() operation
From: Stephen Boyd <sboyd@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, Abhash Kumar <a-kumar2@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, "Thomas Richard (TI)" <thomas.richard@bootlin.com>, Dhruva Gole <d-gole@ti.com>, Kendall Willis <k-willis@ti.com>
To: "Thomas Richard (TI)" <thomas.richard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Tero Kristo <kristo@kernel.org>
Date: Tue, 28 Apr 2026 20:57:50 -0700
Message-ID: <177743507054.5403.221436011297776412@lazor>
User-Agent: alot/0.12

Quoting Thomas Richard (TI) (2026-04-27 05:21:36)
> Implement the restore_context() operation to restore the clock rate and t=
he
> clock parent state. The clock rate is saved in sci_clk struct during
> set_rate() and recalc_rate() operations. The parent index is saved in
> sci_clk struct during set_parent() operation. During clock registration,
> the core retrieves each clock=E2=80=99s parent using get_parent() operati=
on to
> ensure the internal clock tree reflects the actual hardware state,
> including any configurations made by the bootloader. So we also save the
> parent index in get_parent().
>=20
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Reviewed-by: Kendall Willis <k-willis@ti.com>
> Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
