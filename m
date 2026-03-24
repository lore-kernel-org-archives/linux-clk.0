Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03F6241690;
	Tue, 24 Mar 2026 00:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774313057; cv=none; b=Wv/tF4qnQSUgWkFKZliT4cV+vISnhPOFU4IrYbiguLT+wRHmnP/8bN2RbJmGw2TQaQi/xzpdXY1r6o9iOAaQ34JDNXkL13yjuP1S3iKFSqP2j8vBieI29Rs6RI44Uevj/tfW9IAQjxaWdXqwGYkY7Z7ijpYtp+xyMwvWkD7DxWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774313057; c=relaxed/simple;
	bh=zzQNKHTkEVAtgYQMHYZVy248jusM+FnEvT6P4WtJR6c=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ggavZiJQh1tftIfBMcwVRalG88HrnvdXmxgMuN+3d2dPMFxghjKQbFhtZhTbKKrF/kVltWGBk4j0ajm8pTuHUfGPtIiCe9XQH+GIwKKdNhf2AX66tafMBFPaNhRsA1He4rkdQ2tTUIRIZ8hK9nP8kuZ6jx8rTKrUqFq4Hikth1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BCVLImsv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BCVLImsv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FDB1C4CEF7;
	Tue, 24 Mar 2026 00:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774313057;
	bh=zzQNKHTkEVAtgYQMHYZVy248jusM+FnEvT6P4WtJR6c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BCVLImsvOGIo0CPsj3MmbYWcVwQQHXRJd4BRw3lQWY/EuwPuDZKcgH9u7cdvlNpuq
	 K/M2VZg1bcrX5ieLnQWRnAMMJaB2Bpy7Sja96O/6UXSXv3QE80a94wFxj2EGAOpxO5
	 ZE4KTeCCmZy2IILNK+XkPTVS9Cemq+kWUSXvxEofSMX3Q2Zr5TD6vbpkv3BX0Nyslf
	 qmEc5Fqm3IrVVLeoZkgBJWH8kByl4Vlql+fT/GONQysuBAW1M3ylz4rTsUf2nlQzWL
	 YwAE7ldYXcwzT/tCMU7SXCZdRH1l9cpVFne6qaMMcYuwlK7fs8gDvGPQw75z+V2IID
	 YEndTnRkURoDw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260318110251.2412-1-mohd.abd.6602@gmail.com>
References: <20260318110251.2412-1-mohd.abd.6602@gmail.com>
Subject: Re: [PATCH] clk: uniphier: mux: fix signedness bug in get_parent
From: Stephen Boyd <sboyd@kernel.org>
Cc: hayashi.kunihiko@socionext.com, mhiramat@kernel.org, yamada.masahiro@socionext.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Anas Iqbal <mohd.abd.6602@gmail.com>
To: Anas Iqbal <mohd.abd.6602@gmail.com>, linux-clk@vger.kernel.org, mturquette@baylibre.com
Date: Mon, 23 Mar 2026 17:44:15 -0700
Message-ID: <177431305509.5403.15386021337517970667@lazor>
User-Agent: alot/0.12

Quoting Anas Iqbal (2026-03-18 04:02:51)
> The uniphier_clk_mux_get_parent() function returns a u8, but
> propagates negative error codes such as -EINVAL and regmap_read()
> failures. These values are implicitly converted to large unsigned
> integers, resulting in invalid parent indices.
>=20
> The clk_ops.get_parent() callback is expected to return a valid
> parent index and does not support error codes. Fix this by returning
> 0 as a safe fallback in error cases.

A large number will exceed the number of parents possible for the clk
and turn into a failure to find the parent in the parent map. There's
nothing to do here besides implement clk_ops::get_parent_hw()[1] and fix
all the drivers.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/log/?h=3D=
clk-parent-rewrite
