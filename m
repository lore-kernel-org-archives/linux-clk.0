Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D754C53160E
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906599; cv=none; b=KXsUVq85w4C4SGR32NrkpoqhqZ4wMoWt2w8mMKqiNQhqo+/uB9blQAFSLqyOGYbub+rpKoyetwwkSlmMj00CkWjjjnlERml+0K3vxiwkUqwYerv5LSkOXZs71Naz2cUuiiRuU6tmyVWv9zzsGqiSZFAuiJF4iJ55GxqsCiQFb5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906599; c=relaxed/simple;
	bh=tP0upS0ryG3UkZvfss/u7n5xabVTHRJHMUDlVp2z8To=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ZuPugdzVInZLd3KwOJSc95tRg78Jb6sOsiMy+Elagt15/2vH3jB2HCPu71FTcikiVdUhUPitOD3qYNVm2IsgTKbQgitPAl09RaX1sSpyoSLSUKXwHZsqqGOBwFC+J6tapV639FzUpVD77Dhhf5fqtqnahMVB+3/2fiUSu7NyBi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLJhg37a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLJhg37a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D661F000FF;
	Tue, 13 Oct 2026 15:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791906598;
	bh=dsJJl0d4VhLT0Hjhk2O/219Dr7gRxdOHjy7ZoY6bs84=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XLJhg37akFA5ntQXZw0kgM/cK5fVcfD6FXReiESUfecT4pZZWw0FGGQTU4LJxmHMC
	 QTgxHGISwAaIIcT7WsjG6IcW0w9nX75xHe/ShTDL/ZGxkMF2fYfRyw5gozD/jtxNkx
	 stAYwSIAUuwOgMkAg0kF+bTZmG5S1lEnGQDZ88/uFjFUwNwB0C+mJSWBkHVli2NAGB
	 H9tYXqCjcE9ohXLmtJqRUY2Qw/Ubc0h4vADKzLRAhzTK7bMdlAIfUZYZqWhYrptuLW
	 nkgonKZrJ2odfhBvBA4X9KtU00NXlyvfZzCjOL224tZFLDFzHgzz9YWyYsdno+QvfA
	 firZN5SbXCavw==
Message-ID: <sashiko-outbox-170050@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/35] clk: mediatek: Fix index in composite clock
 unwind path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akari Tsuyukusa" <akkun11.open@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261013151734.3177690-10-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
 <20261013151734.3177690-10-akkun11.open@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 15:49:57 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: type confusion and wild frees in unwind path for skipped dupl=
icates
--

commit 0447601409056d10a76a91c61e487c303de15ac7
Author: Akari Tsuyukusa <akkun11.open@gmail.com>

clk: mediatek: Fix index in composite clock unwind path

This commit fixes an index error in the unwind path of
mtk_clk_register_composites(). It updates the error handling loop
to use the current descriptor's ID instead of always checking the
first descriptor's ID.

Cc: stable@vger.kernel.org

> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mt=
k.c
> index 3dfdd3a422f80..0b10a4b14a6e8 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -363,7 +363,7 @@ int mtk_clk_register_composites(struct device *dev,
>  	while (--i >=3D 0) {
>  		const struct mtk_composite *mc =3D &mcs[i];
> =20
> -		if (IS_ERR_OR_NULL(clk_data->hws[mcs->id]))
> +		if (IS_ERR_OR_NULL(clk_data->hws[mc->id]))

[Severity: High]
Does this unwind loop safely handle duplicate clock IDs that were skipped
during the forward registration loop?

In mtk_clk_register_composites(), the forward loop skips registering a
duplicate clock ID but leaves its existing valid pointer intact:

        if (!IS_ERR_OR_NULL(clk_data->hws[mc->id])) {
                pr_warn("Trying to register duplicate clock ID: %d\n",
                        mc->id);
                continue;
        }

If a subsequent clock fails to register, the error path is triggered. Since
the skipped duplicate has a valid pointer in the array from a prior
registration, the updated guard evaluates to false. The unwind path will
then incorrectly unregister a clock pointer that this loop did not
allocate.

If that externally-owned duplicate was registered as a different clock type,
mtk_clk_unregister_composite() will perform an invalid cast:

        composite =3D to_clk_composite(hw);
        if (composite->mux_hw)
                mux =3D to_clk_mux(composite->mux_hw);

Could this lead to memory corruption when kfree() is subsequently called on
garbage offsets read from the invalid cast?

>  			continue;
> =20
>  		mtk_clk_unregister_composite(clk_data->hws[mc->id]);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013151734.3177=
690-1-akkun11.open@gmail.com?part=3D9
