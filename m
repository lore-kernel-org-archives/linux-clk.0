Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81FF20ADF8;
	Mon, 13 Jul 2026 22:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783982852; cv=none; b=pW37RoTvm+OMb3YNqi2sZSf/ju0EeMmfQH1HIKpOB4v772oxkH6MzYX1G1hOFs6rEUOKeMhqC1QOmIV/+/2JgOLoGQfKVG+OkZn7vOBY0ynIGHzGbJnApH1jj6UppC/g+cgIiRhMPMpVWR50qhy0+P4XvUrpc172G9qXoxYxspU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783982852; c=relaxed/simple;
	bh=jMGWE8tA/29DhQ/N6afaPNZfUuTNcd/k2GMf4/rve6U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JyMJT0AJ9tLlv5qS+3FGITtiPbsdJYoC8dB2H4opKUtEABg6xW1PfMa/YyF04yO9tiUvhpIZSZP5SwMcdVuTi18ApCNj+qG6aBoqBlgFqJi9zPaNYU9JhTvhPJg1O+NMMksLFRQ7fqXXnmSb4P7lBp8zhM3u7fZhKEPAOJ9g8Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=In+B9Cui; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="In+B9Cui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=3dkiarpw4bg4zokmj73yonjex4.protonmail; t=1783982844; x=1784242044;
	bh=jMGWE8tA/29DhQ/N6afaPNZfUuTNcd/k2GMf4/rve6U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=In+B9CuiPaRuzaxYQwMp4IgoG2wMQ656Nifnp9pcE8NftRUttLfb9sztvdrtvADkJ
	 oFla/PDOyY9uXaJ5dYYvfLgKVjz4RhYwmpfre5fLa7bHz342234qyhm4yai/VJfS+n
	 RPgK0oNWGMX+XAKc3vDt8sGSOWkIS7AW+M+iZwgo/rgfQZFHQbSGFMj8M/rZ4oQRWE
	 nAmPZ8hIskIq/Wgxq8zyBXEwHE7O/fpIdERP0ikOoMRBrunvY8u/hkVm5BBLGcPswP
	 NBLMQuVxsLXKc5i5245lqlGgFOvonNOcqNFCpk7GppFmoIf7Giqg9aav+dMZsrFnrq
	 wcKS8TVh02ciQ==
Date: Mon, 13 Jul 2026 22:47:19 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] clk: qcom: dispcc-sm8450: Keep pll types as is for SM8475
Message-ID: <d58a72e3-fbb3-4dad-a706-a61b8267825a@proton.me>
In-Reply-To: <d6a56ee7-2380-4e2a-b217-6d7398944279@oss.qualcomm.com>
References: <20260711-sm8450-qol-dispcc-v2-0-fc1a07ac5601@proton.me> <20260711-sm8450-qol-dispcc-v2-3-fc1a07ac5601@proton.me> <d6a56ee7-2380-4e2a-b217-6d7398944279@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 31ff9d771682dc8a421c67293ce9b4f8748cda45
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/13/26 6:57 AM, Konrad Dybcio wrote:
> No, these are two separate hardware designs and you can't mix the
> configuration like that just because it so happens to circumvent a bug.
>=20
> Taking a peek at clk_lucid_evo_pll_configure, there's an early bailout:
>=20
> if (trion_pll_is_enabled(pll, regmap)) {
> =09pr_debug("Lucid Evo PLL is already enabled, skipping configuration\n")=
;
> =09return;
> }
>=20
> I think it should be fine to copy-paste it as-is for LUCID_OLE. Please
> check if that resolves your issue.
Indeed, this solves the issue and the display no longer glitches out at
boot.
Will correct in v3; thanks for pointing me in the right direction.

Regards,
Esteban

