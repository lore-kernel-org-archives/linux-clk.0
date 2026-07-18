Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F3E1E47C5
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 23:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417336; cv=none; b=J03Kh+OMLpe4HiHeanXwDlPUUwvQu0kyZM/U4D7FqHrl6vLGOW24kOjBzde4tk3ObUQgj1ymavbLapbPvu5LHsCzx/zX36EN7cWXxI0gCLygYDdwSrNW1Y5CNCmnqhMtmeHhL5EQRS5vc8O1sf/OAJTXGshqnQ2oyPaZbAFx194=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417336; c=relaxed/simple;
	bh=jo9g2GDI/6NeeN99rn8z6/28nXe9vk0uAcnKw2N4GC8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GLmi0KHoHvjEXdHTyDP8591T5I1PnK6TT3Jqfj/n7FgbYw78dwItnvmd/qQYHa8lzhUzMMTVaVB30dUtFaAA+UZQo4AsrSB24N0vfY+ffu25fw25YRGw6ErAHA4mgTc+yMD3F8eT25IhVkdMsx4ML1DhnagLlfoE/LCstZgHqQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=frmobMaZ; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="frmobMaZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1784417327; x=1784676527;
	bh=jo9g2GDI/6NeeN99rn8z6/28nXe9vk0uAcnKw2N4GC8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=frmobMaZIxC1WXm021Mj8/MUfvktEd3tKzb0XjBD6r+DWrIHHlDRUYl5JJ2MR6CQF
	 W3WRu5hEK1ixmqhKTQseGv1FDg0HhLQmQyD0MI0nksmwiz2oyfJqWWTKXbr39J26iv
	 ZNK+ZG0ZhVRNQEp5GnsbpIhpXkA42YgyCDcIYfifzVuiKVjXddIW4Qp8f42Fp/Dc+0
	 3mIIJcbZPxKOeCuQNmjUf8qin88PeX/D8AYJWn5JsorCXoYVg3I5ijMENcZDO+3nRh
	 TnHAn1WLKzgqJP7zSQ//MwjvrraQCbl8REO+JxiuazNbGulkYC2yPepEwrDcisgqBN
	 ADuRN6ucmcNhg==
Date: Sat, 18 Jul 2026 23:28:43 +0000
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clk: qcom: dispcc-sm8450: Fix disp_cc_mdss_mdp_clk_src ops
Message-ID: <57bece3e-cfa8-4ddd-811b-eae271b738fd@proton.me>
In-Reply-To: <e43fd30b-4f97-4f14-85f2-7d113c0dc1c3@ixit.cz>
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me> <20260713-sm8450-qol-dispcc-v3-1-56fd05822270@proton.me> <e43fd30b-4f97-4f14-85f2-7d113c0dc1c3@ixit.cz>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 4b7f46a2be7eeadc0406834d95ffbd1b2879a764
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/17/26 5:02 PM, David Heidelberg wrote:
> it's likely this change will be safe for older sdm845 too? Comma.AI peopl=
e have
> it applied downstream on top of 6.18/7.1 [1], so I'm wondering if it's so=
mething
> after testing on available targets could be enabled for 845 too.

Hello.
I'm not sure, since the patch you linked modifies both mdp and rot clocks
while I only had to modify mdp for SM8450/8475.
Both clocks would have to be tested to get a verdict.

Regards,
Esteban

