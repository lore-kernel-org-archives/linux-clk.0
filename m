Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCF546C840;
	Fri,  2 Oct 2026 09:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932486; cv=none; b=F+55QqYYgcTo3m5ehaBvNo2RTv2yRIdojm78hmqDwwJLFlC99oNUXnO+EL+SxDKNpACZHch5fES1Wpbs7yLiBZzvlOvRBWV1xkicdPJeVQh9HkZubfQtV3gi4e036iF9Wi4TK21b84fWQeVOSyUIleYVfkit7U4TQETuWeicWOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932486; c=relaxed/simple;
	bh=qAQQBfayz0zyDLK6k18ivMhR2sXSvex38ewtzXLLkqs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OB0d9ruitH2IBm4YDHPtSJ1uhaIw4ArZPuCw8hDd2AIcD/yw1jhbWdxEUOVOnqhU+hh3O6znGRNpGH+XSNeQQCKEwU2dDIHtThWsA3M6Yxt5GRoIcnvtPS3iucoFpMLywBPQG7dy16KlB+FZ5Java787WO4f992Ol5kS5NBF13U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IoFhluqV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IoFhluqV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54641F00893;
	Fri,  2 Oct 2026 09:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932485;
	bh=Y0kOdqEo71g8AWci/z+cAXnUMfAQ4suoLdgDOhKBvFU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IoFhluqVUTP1ekMX5LxQiLX/Vi6uwsgBugpN/TYiGuYvlBz+uf3tUwXHu4kzNxSuw
	 0bXzzGeSJNyXEo1myBNzHoai5rrrdDSkxHX30HBjOrp9ZpxodL2L1r7hh7Jy/8VmFC
	 bZMTpX7jqx1S7YtoDLbq9A7xde3pN9KEQHDq5Qas+kG0oKiXKJVUUGWysqf11jg6k4
	 akDx8nBu4+a2Mv7QFfntfqBrO0+wUBRZxAOp4J9MUCWrvzArkQGmrs4pFbib90t9DE
	 5CafsZcQ+M38HKxavd2QY2iN95NUTGtqoAEX5UDXjRlyZ0hNEafXwUP/Wlz+55XbTi
	 XVyTznQk3zyFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 04/11] clk: realtek: Introduce common probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261002074331.3066919-5-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-5-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:14:44 +0000
Message-Id: <20261002091444.B54641F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] clk: realtek: aux_name in struct rtk_clk_desc is missing const qual=
ifier
--

commit 70362e309c085cb7899e077d069e8a4a7e5719cc
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Introduce common probe()

Add rtk_clk_probe() to set up the shared regmap, register clock hardware,
and add the clock provider. Additionally, if the "#reset-cells" property is
present, it creates and registers an auxiliary device.

> diff --git a/drivers/clk/realtek/clk-rtk-common.h b/drivers/clk/realtek/c=
lk-rtk-common.h
> new file mode 100644
> index 0000000000000..de3f23120b539
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtk-common.h
> @@ -0,0 +1,37 @@

[ ... ]

> +struct rtk_clk_desc {
> +	struct clk_hw_onecell_data *clk_data;
> +	struct rtk_clk_regmap **clks;
> +	size_t num_clks;
> +	char *aux_name;

[Severity: Low]
Would it be better for aux_name to be a const char pointer here?

Since this struct member is typically assigned string literals by caller
drivers, dropping the const qualifier exposes read-only memory to accidental
modification and could cause compiler warnings if compiled with
-Wwrite-strings.

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002074331.3066=
919-1-eleanor.lin@realtek.com?part=3D4
