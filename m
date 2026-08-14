Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC4041686F
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692515; cv=none; b=eYjDk9LtxQhd5ucNUEYo9lo7EVg7Ocg+BZohJ8DicLKekQROJh1jPYG4Jyn0QGmm6iBKLuYycoWw1PrsQ5s7dxjlsymnbgzLdJjl44xMRb2XDIS3AnsxD5osi+lZ28EqQUW3VvfRrxTLsoF4Eq0vYTPBr21wPwgTuZ0olKZ5N4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692515; c=relaxed/simple;
	bh=qDGQ13IBjiJgy62oQRDtufMFAqPAJd0NT3GMpxMkjkk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MDfsKcY8GgpDPX0hNymnoNQcn/JbBoPQOd+Tgso8yiMgDU+Hw5D5MtOvDp4aU5NM61b9sGftRVgn29qURTC754aRA0QJ327l7Cv6yNITZ0tD2RzL676I/0QvOhacZYOY0mUfD3HG10xHqMUjWln/T7BQ4j0571+VjeG9Y3xsWyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eLtc9ZDG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLtc9ZDG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDAE41F000E9;
	Fri, 14 Aug 2026 07:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692509;
	bh=qDGQ13IBjiJgy62oQRDtufMFAqPAJd0NT3GMpxMkjkk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eLtc9ZDGFLYKVNr7+FtKsZA+T6M7W6aCT8lx+rZISt+trkvn3zERrH+gVOFfBXkab
	 RlA/TAZdKKwYrNHcQFFio43HIbrT4ef3pLdNRpVdh8cHfLksia6Ur+5jh4n7fe773H
	 G7sjnfGU8yR5PHWvgdLfCBjZqYG9oM6mhbHpDAXFBZ/3nI+hX8Ktm+earCMRH03Tkd
	 EosGvPhYj1iyFUxSdGtBecb9+Xt9Pvdz2oHE0ciH1Jiavyy18oPpLGRf2CIHOMqzRM
	 fI+EkveAK4Jh4KqEirCXEj/tqdOVbY7HJ3ky6AUi8wZNh2cTq4XNOms7WNxCV7Cvip
	 xMqP4f7tFML+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: nuvoton: ma35d1: Use clk_hw pointers as mux
 parents
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260813-perso-ma35d1-upstream-clk-v1-1-e78e5e6172ea@bootlin.com>
References: <20260813-perso-ma35d1-upstream-clk-v1-1-e78e5e6172ea@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 07:28:28 +0000
Message-Id: <20260814072828.EDAE41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing IS_ERR() check when retrieving clk_hw pointers for mux par=
ents leads to a kernel panic if a parent clock failed to register.
--

--- Patch [1]: [PATCH] clk: nuvoton: ma35d1: Use clk_hw pointers as mux par=
ents ---
Note: The format of this report has been altered to a free-form summary due
to automated recitation restrictions. Inline diffs are omitted.

commit cb1ab325c1866a1de7e5ffdc22cd1339fb87557f
Author: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: clk: nuvoton: ma35d1: Use clk_hw pointers as mux parents

This patch updates the MA35D1 clock provider to use direct HW clock pointers
for parent lookups instead of string-based lookups, fixing flat clock trees
and unassigned frequencies.

[Severity: High]
Could this lead to a kernel panic if a parent clock registration fails?

In drivers/clk/nuvoton/clk-ma35d1.c, within the ma35d1_clk_mux() function,
the code iterates over num_parents and assigns hws[parent_idx[i]] to the
parent_hws array.

If a preceding clock registration function (like ma35d1_reg_clk_pll or
ma35d1_clk_fixed) fails, it will return an ERR_PTR which gets stored in the
hws array. Because ma35d1_clk_mux() copies these pointers into parent_hws
without an IS_ERR check, the ERR_PTR is handed off to the clock core.

Since the common clock framework treats any non-NULL pointer as valid, won't
this result in an invalid memory dereference when clk_core_fill_parent_inde=
x()
attempts to access parent->hw->core?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-perso-ma35=
d1-upstream-clk-v1-1-e78e5e6172ea@bootlin.com?part=3D1
