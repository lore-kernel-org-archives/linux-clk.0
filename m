Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B733D1CAF
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 08:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508891; cv=none; b=StNgYTM55sDaIPMzVmqUuKOPR7O8GhBjlsYH44VN2KJc9oLtbLwmmryoMaUC7Lf4L02ojmtQUxCRrrtqK1c+Lwzq3M3F9PZvHXzQvlAT+A6cm2Exgxt92zMEajJJ+XISR7o9UZ18lUXnpjRiFqMvPVbiNeb4ErEO7ZjLFlUTRxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508891; c=relaxed/simple;
	bh=Uh0d9T08SwM1sDA9nRN2gZBOxG4WL+Qi9X3/lA7X5u0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qBKIzwFXtBvLP6UW4a4lD/ip/bW7H009mAL9s5GDeAAtN3OAfcDAv00HtnFWrPDeiRcGJHNsy5TOo2E4Vf2y4GxXU3jAR1dD41Y3WK12+vsbwpKH4b7AZgEWJxVcOA38wKL8gF5XLtYXyaqBeRDFAkyC7a0TAMEXQCOIMqATIE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cTpOO7Ef; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cTpOO7Ef"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84381F00A3E;
	Fri,  4 Sep 2026 08:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788508889;
	bh=rDi9jRb7ScOOex0VyOuu+iizu/n7Q0wAN/Mn+kntuRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cTpOO7EfBjpGNKuqyCugyioEFwcI8E5Th18ot+f6fsboyjRF0wbfl8vOWcp87ofCB
	 yOrdu2Tg1afKMBfoS8TxPp7OEKbUW0yV02hY+9gZiOno+6N9FTPECd/Y4zJ8SeW3+j
	 XwMzWUAB5cleShfnZ/5ZIg3pbyN1RLvNZ8YOdvQoiZ38MXGfmnOOhD6x+4iscbimqC
	 V/vIqr+FWB8Tq6ByQ2It34dQYRQrQZp+nnFRWLO1/7QVKLKFWZA68q4C/HxnYp1XXC
	 /0Y3b1ZkHP8iJv4a3aSi9nN5yHhU+xkiSF1OapZ10oUfr/7JwJoMI7XM+/DzF3V3t7
	 CcIUfU7eej8ZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: devres: make clock cleanup explicit on failure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?T251ciDDlnprYW4=?= <work@onurozkan.dev>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260904075026.60793-1-work@onurozkan.dev>
References: <20260904075026.60793-1-work@onurozkan.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 08:01:29 +0000
Message-Id: <20260904080129.A84381F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Replaces devm_add_action_or_reset() with open-coded error handling =
to pacify a static analyzer.
--

commit f91fcabb46a07cc1fa1a03a8bac1f236304fd974
Author: Onur =C3=96zkan <work@onurozkan.dev>
Subject: clk: devres: make clock cleanup explicit on failure

This commit replaces the standard devm_add_action_or_reset() helper with
devm_add_action() and an explicitly open-coded clock disable and unprepare
sequence on failure. This change was made to address a smatch warning.

Link: https://lore.kernel.org/all/apmUPdYtdIM0dQbF@redhat.com
Closes: https://lore.kernel.org/r/202608090025.dwxdfqFr-lkp@intel.com

> diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
> index 4cc3863bd7da9..9ed9a7b7b23f4 100644
> --- a/drivers/clk/clk-devres.c
> +++ b/drivers/clk/clk-devres.c
> @@ -123,9 +123,11 @@ struct clk *devm_clk_get_optional_enabled_with_rate(=
struct device *dev,
>  	if (ret)
>  		goto out_put_clk;
> =20
> -	ret =3D devm_add_action_or_reset(dev, devm_clk_disable_unprepare, clk);
> -	if (ret)
> +	ret =3D devm_add_action(dev, devm_clk_disable_unprepare, clk);
> +	if (ret) {
> +		clk_disable_unprepare(clk);
>  		goto out_put_clk;
> +	}

[Severity: Low]
Is it necessary to open-code this cleanup logic in
devm_clk_get_optional_enabled_with_rate() just to satisfy a static analyzer?

Replacing standard kernel abstractions like devm_add_action_or_reset() with
manual error handling to pacify a false positive degrades code structure and
reverts the benefits of the devres pattern.

Should the analyzer be fixed instead of open-coding the manual cleanup
sequence here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904075026.6079=
3-1-work@onurozkan.dev?part=3D1
