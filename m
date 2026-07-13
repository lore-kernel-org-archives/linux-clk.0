Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D1E235358;
	Mon, 13 Jul 2026 14:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783951527; cv=none; b=usBdQIloyIRnltOIEaiwX4M7vg+7lN9rM0gODQuvv4UnHR66uDw1NR1XvoHCSLxQklCdlOlm5474cTBMQPbIBa5EZAgXGJm+n8mU/X3UcDp7GuNy+SjjZYif1wzm5gawVaRd++o0/Gs/kxNWJMosoMnJ6de2w1rCfKhKl79cLfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783951527; c=relaxed/simple;
	bh=Jmkrf/EOcsaJtEIwx99+hxx+pRDkd8Tp9R0cq4jY6os=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bymJbsc/2lDHP6PglCFDvkLaIV3EBtWbWbUxcz+wsqJMpOYnv2Qeqc1Dv95QqGbVenfeLmRRbGO2bz0HJySFPeJS8PC6WawhXuUz2T0XM1zx9Nvh6R3VjAFKU+PD2H+kk0NY/rTB0lz8BcJUEK67Ec8G3e4MErfvjlwFbKY43J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=fvbSQ/tJ; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="fvbSQ/tJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1783951515; x=1784210715;
	bh=JNVm5dqtN4z1AXI4iOUrU1/SqbEPl4ytOZKLht8iRdk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fvbSQ/tJkUDLyg3/6asMTv9lTYHTIYXAw4o0ONgjz6ZQrMnA3qtx48KjyTjICDwQf
	 0sGjXv97+Vrz8iqRL+83wHypwtbglPZV8L3G+HQGmnYaEOAWvRv6Z+WXyQur78LyGl
	 sXGt2S9k4lTGQubdPqB6UuqsV3IC8XCjAxjIFjD1KYLZ+yvsvDGtXcftzuT0nKe52H
	 Gs7l29m59PCe+/qxgJCLRuCDYmRjKzX+t0DINc/mVa9Syqlu1SR25lwyfQJNpNGIef
	 qqG2ebhDKAdudpHGg59UHnh8swkDd7UcnVjYhLr3OlN36cfFk254F/02vfXlcjRjkb
	 d3L0f0+EMoRtw==
Date: Mon, 13 Jul 2026 14:05:12 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: qcom: dispcc-sm8450: Migrate to qcom_cc_driver_data
Message-ID: <83ebfe48-3161-4261-8e3b-905b2eebd2ee@proton.me>
In-Reply-To: <dcea3653-1428-49ee-9287-a1b27da2003b@oss.qualcomm.com>
References: <20260711-sm8450-qol-dispcc-v2-0-fc1a07ac5601@proton.me> <20260711-sm8450-qol-dispcc-v2-2-fc1a07ac5601@proton.me> <dcea3653-1428-49ee-9287-a1b27da2003b@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 69e0dd07640d0cb1341423a707ce184a092d134a
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/13/26 6:47 AM, Konrad Dybcio wrote:
> [...]
>=20
>>  =09/* Enable clock gating for MDP clocks */
>>  =09regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
>=20
> This would ideally become regmap_set_bits(..., BIT(4)) in desc->clk_regs_=
configure
Will do in v3 :)

Regards,
Esteban

