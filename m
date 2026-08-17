Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945703B4E80;
	Mon, 17 Aug 2026 11:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964847; cv=none; b=OZc8C/ZzM00jF1Fmfs1eY6x9faMsat6vDjOwiwIBXiL5GS4qJuQFOXO6B5jXsjikzfu0HADhvAwZuNJeOcHJJiHyI064ZrLbEOgvEqS9S6iJmBEdey9LzPVVfgN2wiBIFw/8UYo/e7bVbY3SYRvXjXoSsnbZZZnHJwE8b19lqNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964847; c=relaxed/simple;
	bh=Ll8GhB8+1ToChn9S1Mf+eyF3QTfvpYPmIq3sWLPDAPI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b5ylCd9J+ciPEOOu11NqJCOF9rHai2gYpQlYd8nRDk1Ktd3j36yw2g5Qz7ER05nWsDicX+gmDUHoOrCJJWXPE23NDHHSh4fUFJFG3c1Tp4StvMtVZwpm8HFN3HbATRPDFuvVbSgpQUAXO3xKMfG+xKzRoPNhJQ9qfJ+3Qwz1oDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UW0u2PnO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UW0u2PnO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C85C1F00A3A;
	Mon, 17 Aug 2026 11:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786964846;
	bh=Xl/kigk12zUwk7Zy3JRNlC/tijcWBdNbK0ShawWDoPc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UW0u2PnOhHLi6cA41TGUuRIhgcN01P2O5xoyxfi54+dZEeOwRP64cSdpfHLP7wbBS
	 ZrFKVbyMiCirlFHmgfhXSiNfufr7fTvXMYmg/Ato5jBSK7OCIAxixfu6dVGDXUCWK1
	 dT4vJN/ke6pqiW2qmAn6g4hJUfeGpyZ1aOMKABQOcOfc80uc/070QSXqVQ1J0yDBFA
	 ECJi72JkxIPQGhCzvPsGbxiVw22oYkSnU+G84OdmkIyiVrQIBw1QEbBbyqYRRps+oD
	 4Rn6Aw4IbYh4TACeLlRQ2m1iteDEUt6te8B0vOMLsTlpBBgLJ8ZU0ND1WEAdXaBTz6
	 PgE8JVzSp03kA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 4/6] clk: Add KUnit tests for assigned-clock-sscs
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260817-clk-v11-v11-4-36e9bc701b11@nxp.com>
References: <20260817-clk-v11-v11-0-36e9bc701b11@nxp.com>
 <20260817-clk-v11-v11-4-36e9bc701b11@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 11:07:25 +0000
Message-Id: <20260817110726.4C85C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Commit message and code mismatch: .set_spread_spectrum is omitte=
d from clk_dummy_single_parent_ops
--

--- Patch [4]: [PATCH v11 4/6] clk: Add KUnit tests for assigned-clock-sscs=
 ---
commit 5c23da1873b6e03ee6da2afc142b2da0f14531f3
Author: Peng Fan <peng.fan@nxp.com>

clk: Add KUnit tests for assigned-clock-sscs

This patch adds KUnit test coverage for the assigned-clock-sscs DT
property. It extends the dummy clock context and ops to support spread
spectrum settings, and adds a new test suite for various scenarios.

>     Extend the existing test infrastructure to support spread spectrum:
>     - Add struct clk_spread_spectrum field to clk_dummy_context and a
>       clk_dummy_set_spread_spectrum callback
>     - Wire set_spread_spectrum into all dummy clock ops

[Severity: Medium]
The commit message mentions wiring set_spread_spectrum into all dummy clock
ops, but it appears to be omitted from clk_dummy_single_parent_ops in
clk_test.c. Is this omission intentional?

It looks like clk_dummy_set_spread_spectrum assumes the clk_hw is embedded
in a struct clk_dummy_context:

static int clk_dummy_set_spread_spectrum(...)
{
    struct clk_dummy_context *ctx =3D
        container_of(hw, struct clk_dummy_context, hw);
   =20
    ctx->sscs =3D *ss_conf;
    ...
}

Clocks using clk_dummy_single_parent_ops often allocate a bare struct
clk_hw or use struct clk_single_parent_ctx, which lacks the sscs field.
If the callback had been naively wired as the commit message implies,
configuring spread spectrum on these clocks might cause memory corruption
via an out-of-bounds write.

Could the commit message be updated to clarify that
clk_dummy_single_parent_ops was intentionally skipped?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-clk-v11-v1=
1-0-36e9bc701b11@nxp.com?part=3D4
