Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D24A51615B;
	Wed, 23 Sep 2026 18:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188772; cv=none; b=sty7hoqWdz1YMWFvOfv7w0Lz/USUk3rkWuNmy8siB1My4txq8DkwEW9U0GVA3IX+BOpRWJwpScFTzzVnd9qYSQLFU7z8zmwjf/ejFUtawnGOWr4Ztz1Smj/ZLMGzcGdbqbsZREoMyJrZfMRkB4s4cnUoGI36Hn35XkoLhU7LHX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188772; c=relaxed/simple;
	bh=pDqXMsvM2rl0jRqbXzFCkzmCUDeRXHXh7kvYNmNL3/8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oAIxE/ZLj0Edsa2EV6YLLZLxca16dVtHs7jTLVtVxMAQb6g+PVPZ8KnlFSHicW4UioRtn7Aq6qbmOmT6VSKRti1lPwJUoG1pMJxSiSpAzy3l9xJGcjkI6vOvywoxVYm/b+7xLbzct3cqGJAGhX1u7PNhXzTAJZJm3F9y3UsQeB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NfvFSi0B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NfvFSi0B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3620C1F000FF;
	Wed, 23 Sep 2026 18:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790188765;
	bh=pDqXMsvM2rl0jRqbXzFCkzmCUDeRXHXh7kvYNmNL3/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NfvFSi0BRHqC6QKftJdN6DNxh2atYqEE3FDpXxbLpuSENYGSQBBuVlza4Jkce96my
	 0AamZb6/XtccZxvGJbFXKVi5RtteHAwWtTwT7UeD4Q06mP4RvrEXvYccIeUN02Oxb8
	 yRlx11xsmTcjT0GhliAjAWB2LYhhsmfgBzl2yFJ80nmCSC70l9R3+rZSnFYHzQS/Um
	 NgbYkDIWjoazubPKiaMG5F5hAeUqL/0hS7v58sYP6REhzA/T516216E9IOyqtuEUZa
	 eWm5JA1FUYDPHa1Z4uzWX9nWw0CYNjI3cRuTdAMdG4XrtcuEtdW+yiYNabeW/xLCut
	 Z2CatmjUmPkjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 12/12] ARM: dts: zte: Declare zx297520v3 CRM device
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, linux-clk@vger.kernel.org, vkoul@kernel.org, mfd@lists.linux.dev, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org
In-Reply-To: <20260923-zx29clk-v12-12-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
 <20260923-zx29clk-v12-12-9c243796b6d2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:39:24 +0000
Message-Id: <20260923183925.3620C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> This patch adds DT nodes for the main clock and reset controllers on the
> zx297520v3 board. It replaces the temporary placeholder UART clocks with
> the proper clocks exported by topcrm and lspcrm.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-zx29clk-v1=
2-0-9c243796b6d2@gmail.com?part=3D12

