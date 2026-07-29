Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B0C3203B6;
	Wed, 29 Jul 2026 02:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785293089; cv=none; b=EMRZuEsIzPxg3eU9BSQdT6eCaQXM4rM+5PUc39YXETRFIYnyRq/SV/FLxKQ64dJJ1NwUUFHYnrHhM/XYvaFxB3q9LO3rBIrVZfzos7oct1IL+Yc+fYo7nyd8nJUg+7VLsibVaqCXgCrNG7pExfrwW2oeYSNpd8cgY4vdPNhbxho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785293089; c=relaxed/simple;
	bh=H1jEBpulhwXcxkrQhaY5mwLrLyjgFnxDDci3QGQk6Ns=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=svruRRYFYp3ZqVBk7kjftdMk/1qECc6IeuZSCjHeT5UHHwYprLB4G75mPoDj1j/vGDLMIrZkQJGi65Ttk6nRX+zmVAvqWbzdSg2qhXMUMokwqixX6ViJIaINlkle8c9TetdjJ896gyfb1PSf+CFf8UoI4wHZs2Swso/B5Fw4zvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=efTlB+p/; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="efTlB+p/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1785293074; x=1785552274;
	bh=H1jEBpulhwXcxkrQhaY5mwLrLyjgFnxDDci3QGQk6Ns=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=efTlB+p/08TxaRCZdpi05SY1v5hRaHlAfSRnqZFMqVwQvTrz7ejH71yIsJ+y3IgFs
	 8qc5j7pxertNjU9Ky5ajpugjeF0Wg1wP1L7gmcTXTl5cZboBGeNwxoOfULF7r0FHxL
	 776vwiwK3YOTk5sDuOJ7aIiYyiNR6umJD1WXTupq4p48kHidgBqvXYUcVq8ikwCzlL
	 Em/sIjUE1cf+6Y5R8I5BodikipGFTZbv26mN1GWaSt8rFZMReaISW4WHtyr3zF4ZsR
	 mNnBferqVdvs4YJck9YeUFAgDBpOM76bxnfru0dmAbJoUswMIhH+H2kQ1mHqJxf6iX
	 RB4rbKUlN/++A==
Date: Wed, 29 Jul 2026 02:44:27 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] clk: qcom: alpha-pll: Check Lucid Ole PLL status before configuring
Message-ID: <1c4ff5d7-58dd-42c1-882c-c1ce0d5a62cb@proton.me>
In-Reply-To: <40404aa6-7822-4c65-abdf-0ecf1fa073cc@oss.qualcomm.com>
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me> <20260713-sm8450-qol-dispcc-v3-3-56fd05822270@proton.me> <40404aa6-7822-4c65-abdf-0ecf1fa073cc@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 72e22563e9944f6a8e79f33c9bd846bf4313b83e
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/15/26 5:31 AM, Konrad Dybcio wrote:
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


Konrad, since you pointed me in the right direction for this commit, can
I have your permission to add Suggested-by?
I should have asked this earlier. Sorry about that.

Regards,
Esteban

