Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E1E426429;
	Mon, 10 Aug 2026 16:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786379518; cv=none; b=TJ5t4/9DmaroX0gI0XAs0Mf0HMfQPOy0xQbwlAe5relueLdH0VX02/I4Tj6CtYzGNtBrMtd6FnPvTQP847UHBl5NLmh6SyCykiUdhb6VBbg7E3tUHuHqzvksZNV6rp70PGomrfF7dX5PJpiICDFEErAvqw2beIpHv2FnnjbGCRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786379518; c=relaxed/simple;
	bh=3+orMjaHms0psMzQ8MhDiorwFgRCUQOe9uGSq6Fptro=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s3HCHwsdxLtBb3vRjZX7t8OMiW7WwBQbkgPyxQ/fnV7RUDwxGSLoc86Qw5DCRGp22r/c+Vs1jiGxFmRrADqMBduhVA17Sd9CjFkBjKjBo7xPgmcPI+TaAeZyj6/cWsEYLD//AanO7o+fVoYnSwJhmYXM8dxPO0KDKPFUUNufXUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=XmBrs2Bq; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="XmBrs2Bq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1786379508; x=1786638708;
	bh=3+orMjaHms0psMzQ8MhDiorwFgRCUQOe9uGSq6Fptro=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XmBrs2BqVx/A9s4Yao+/eUB4N+8vcrI8/Y3soNfr4SIcTU2qxPiuco1a8C5Ue8y9R
	 R6TdxguvXaBAOhvDYetHC7pSehffRWe9/EW+WejQNu5hwL/pTffi2+k94gKCdR3j0n
	 o9wRM7rQ/mWsT13m5XFJyx5747R2YZ2H945w9J3+ABdl4YgEIna3eVkhLeViDS3dy1
	 j2bjsYaozoXq3RK6cK5sJ5JjMNi3FSAWOuZhBbkNFQl0Su6VAeVT1qVQL4UEXKMOn/
	 scCL29mmbT4pXGDARtln7Yei6IQkQ64OmSgJjlRbHe1NzboQ46+oi9oQP7zh8aDg8O
	 TXfh7rIvW+hqg==
Date: Mon, 10 Aug 2026 16:31:37 +0000
To: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] SM8450 QoL changes (dispcc)
Message-ID: <aa71663e-103b-4f61-affd-e3a35a1690bd@proton.me>
In-Reply-To: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: d2a76ae8a023fa792ab4db3dbf0db1bb35915c5e
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/13/26 11:28 PM, Esteban Urrutia via B4 Relay wrote:
> These patches are mainly focused on getting a flickerless boot process
> on SM8475 based devices.
Any update on when this series can be picked?

Regards,
Esteban

