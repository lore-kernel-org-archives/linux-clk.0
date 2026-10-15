Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1353E92A5
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 17:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083913; cv=none; b=IYsnABbJeEQkHZy9EkHbOXMWjKdxmBaZHaBKPm0myQzR+BCHfVpjN6RrsoAPG220YLFIsj8VRK48k2pPPbIA4KKg933kdtPSSWSj3qCWmfK3a9vTFP9bKYot1D0LrcaiPDh7kbBQszIH13FWAFlmmOdDxtlZ089svKd9/wGVbhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083913; c=relaxed/simple;
	bh=CPqdgdoBiKyuGuCrUo+o49D9hAGfy5sOJ0VbKWMkOGU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=rtzhN4XQtqTdg5wSD7PEP4GphJ8cuzNOZDRdnkUh9JsJqpt4Ogr57JyavlWFdlh9mYu5SJpSjUVvvJv43+RoQlrsbTG82b4YqpihXKnxrO7jiJ56Clito5EtTDW7TrlFU5tUTg9FIamgRB14BOtyUCsrm5OIHKVh7Q7ebw5PlLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOa95jP1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOa95jP1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9898A1F000C5;
	Thu, 15 Oct 2026 17:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792083902;
	bh=/aacSIpWAfUx2mO/R8wB9Cmlq8rhK2Df4cjZUkr/hjU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dOa95jP1uMTcGUN7ysQpWafXN88bEqnzpL6NOAh+yBE2pclhLDRjpOe0ng4CwFoIi
	 0lIkHQrPhrQ31yXHcr6s3oaABWX2RogiZTi0ZMh8tJatnU+eXGQsOv2vZD8c3OQ9tU
	 uXWpKbk8FcPltBz4UZEnJXjInKZrlARbNfNut6/5nPH14VOiSJjmWqLcC5GLsM5Q1c
	 yvlLOGwC64P8uRvF75zVCWCFUBH7kjNT1JNo3sp/umgCLn/HNU6l6nW6KbQmS+krfZ
	 OaNALsblf4di83+PRPF4QRJnL7KyzrR6KUIZcbNG+HSwi6sNj2Vt+GbLaytDr8wqZZ
	 o5tyvKt71LC7w==
Message-ID: <sashiko-outbox-173231@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] clk: ti: fapll: Fix clock speed calculation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ettore Chimenti" <ettore.chimenti@linaro.org>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261015-patch-ektor5-dm8168-clk-v1-2-8b99c5cd5541@linaro.org>
References: <20261015-patch-ektor5-dm8168-clk-v1-0-8b99c5cd5541@linaro.org>
 <20261015-patch-ektor5-dm8168-clk-v1-2-8b99c5cd5541@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 17:05:02 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: ti: fapll: set_frac_rate uses incorrect 10000000 base causing=
 clock mismatch
- [High] clk: ti: fapll: mismatched set/get fractional bases and off-by-one=
 denominator
--

commit 1dcae77615d6eede1d731b41214f02cb5834c02c
Author: Andrew Goodbody <andrew.goodbody@linaro.org>

clk: ti: fapll: Fix clock speed calculation

The fractional part of the divider was being treated as 1/10000000 wheras
it is in fact 1/16777215. This led to incorrect clock speeds being
reported when a fractional divider was in use. Correct it.

> The fractional part of the divider was being treated as 1/10000000 wheras

[Severity: Low]
This isn't a bug, but there is a typo (wheras) in the commit message.

diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
index ae2f6fed10f66..008a61f45ac14 100644
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -336,8 +336,8 @@ static unsigned long ti_fapll_synth_recalc_rate(struct =
clk_hw *hw,
 		v =3D readl_relaxed(synth->freq);
 		synth_int_div =3D (v >> 24) & 0xf;
 		synth_frac_div =3D v & 0xffffff;
-		synth_div_freq =3D (synth_int_div * 10000000) + synth_frac_div;
-		rate *=3D 10000000;
+		synth_div_freq =3D (synth_int_div * 16777215) + synth_frac_div;
+		rate *=3D 16777215;

[Severity: High]
Is the new 16777215 denominator an off-by-one error?

Standard 24-bit hardware dividers typically use a base of 16,777,216 (2^24).
While 0xffffff is the maximum 24-bit value, the fractional denominator is
usually the full 2^24.

[Severity: High]
Does this create a mismatch between calculating the rate and setting the ra=
te?

Looking at ti_fapll_synth_set_frac_rate() which was not updated in this pat=
ch,
it still uses the 10000000 base to calculate the divider:

drivers/clk/ti/fapll.c:ti_fapll_synth_set_frac_rate() {
	for (; post_div_m < SYNTH_MAX_DIV_M; post_div_m++) {
		synth_int_div =3D DIV_ROUND_UP_ULL((u64)parent_rate *
						 SYNTH_PHASE_K *
						 10000000,
						 rate * post_div_m);
		synth_frac_div =3D synth_int_div % 10000000;
		synth_int_div /=3D 10000000;

		if (synth_int_div <=3D SYNTH_MAX_INT_DIV)
			break;
	}
	...
}

If a clock rate is set using ti_fapll_synth_set_frac_rate(), the programmed
hardware fractional divider will use the 10000000 base. However,
ti_fapll_synth_recalc_rate() will interpret that same register using the new
16777215 denominator. Should ti_fapll_synth_set_frac_rate() also be updated
to use the new denominator?

 		do_div(rate, synth_div_freq);
 		rate *=3D SYNTH_PHASE_K;
 	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-patch-ekto=
r5-dm8168-clk-v1-0-8b99c5cd5541@linaro.org?part=3D2
