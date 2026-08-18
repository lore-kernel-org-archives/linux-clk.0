Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AEA3BE16A;
	Tue, 18 Aug 2026 10:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049581; cv=none; b=WAUyLFjon25VoT1g4xJIWscCB61b74EMED+YgLPW6R1hSXb5UzAauGP5ltcYGTV64WphGo1cRgGpiD1VsTqwpX2KRkgjmGgpa4sj4oEA3hwddhK+yH6b4r2NSIdRFS2lp0XXRpxCr8Jw5jPfdln6Y0JiLoqUR/8vI+RJuK3q3/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049581; c=relaxed/simple;
	bh=b0o41whZyJCO+CdLqonZWrkW9RoAMhGyHIjiKvqonns=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r+MqaQtMwTa2vF1inUPP9Jv8PeM38L4LQlakknNdLEQTdgWUGK6Tbm0SHddqqaNRO/CPair+/KLFxAyvi4MkB1p329EEO+1sbUXnxKvvCS8OL3Fve5FBstnRBTadU/56qoFygWUEY0Wezgu8WBBMgwRialdU9awFhx9gDoruPrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/XSXyYU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/XSXyYU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CC81F000E9;
	Tue, 18 Aug 2026 10:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787049580;
	bh=b0o41whZyJCO+CdLqonZWrkW9RoAMhGyHIjiKvqonns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k/XSXyYUO0TVwzzWm9i4uHwlKdo1ZjOP3BfARueYdAV8QFnO4krs7yrvSol3j/bbW
	 eo1ujiBKbY37iCekXL9GOPdFM0m34g8gh77oPwUJF1EK0JI6NuxKwXhN7GE+L/780C
	 /yfFpXp4KZx0VdcMKsqvuYnlvT+cLJCRuNut3475+Fwz9YTA1UTwW+HsdbmGzbsmk8
	 MWm9IDh9HQ65yzRFefKV9M5xmbC4jZcunHvOb9P9gEAcvBfEmJvLaJ/PZTUN0hV7lg
	 XRNeXpBezkj9KPC438Ckb+9dwkIYdlkp9vb10Z3OulK/0Bl27JLqCSZZ4mBYF7YHRL
	 v/0yXT3yppv8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/12] dt-bindings: serial: add Ambarella CV75 UART
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260818-cv75-v5-v5-6-7bbb12f0360f@ambarella.com>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-6-7bbb12f0360f@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:39:39 +0000
Message-Id: <20260818103939.C9CC81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> From: Long Zhao <longzhao@ambarella.com>
>=20
> Document the Ambarella CV75 on-chip UART controller binding for early
> console bring-up. The binding requires a single RCT clock input and
> fixed 32-bit register access via reg-shift and reg-io-width.
>=20
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-cv75-v5-v5=
-0-7bbb12f0360f@ambarella.com?part=3D6

