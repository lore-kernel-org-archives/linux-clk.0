Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB20217648;
	Mon,  9 Feb 2026 17:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770659247; cv=none; b=iWX1dQ9fLL6J4lBS92TZI2aZ9IrVQS3vRYAklrw9mLraeWUb2R7Iti+n8IvjFq+slp3XNBtfBLrIbet0sVHFy4uAX6aSDJbb33mHQury8qlWL8jWg10cv3fmHW2uC6Z7Xs7GFpuPffLw7jG4DuZonQqLDa0NQ0OKgNs+gjTwDrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770659247; c=relaxed/simple;
	bh=W37SsjB+H7rXIGvWY7KH81Hzrv9zqZkMvfSZ8zrUAxk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=MqGFnN+YT5xmdoJDpH0w0gbKVlrTXFUauXCSz9UJcbWuz2pBP/1q4A4haJpkAWemM5a3IPU6vFTNQ5JVP1S++d2ksR0GvMe4avhgS43n184p3FowKHyKDoQs0YjAME9vJmXEKlyfUARTjenoeiOHe2jaSDe8Anlq3OARnQjHq08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgwP0Q2H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgwP0Q2H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5669FC16AAE;
	Mon,  9 Feb 2026 17:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770659247;
	bh=W37SsjB+H7rXIGvWY7KH81Hzrv9zqZkMvfSZ8zrUAxk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XgwP0Q2HgNbqCO4/70Co8ZcBFWV+4fv6zAAFPiAlE4aeDGQpOaoAWPr8tBXyM9hJ5
	 OtLDPXMpVHA5gEVa81L6XlGaeoaQUuX7m2Ep7MWoNOflwfaRxekg0Eo9WNXPBOiXIY
	 9fH8cxZs16MZW+1zZANdxancSSnGyDaCDtMMc2B6fD1YNlowTEHLMdHcYoNKAjYpjK
	 wmwY5iovi9EsiNUAphiqeD0bcUZpXylXcPtp19gjCpQTDQZL2BZmEwl044pQBuuOVK
	 0+EuXb2qZVWJxIPm4v6eOcT310DNtoLJ53bHL3dSXzC7AuBk6yAlp0rwFt6KgP0zhD
	 af7JYMeHmO5sw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260205154202.21819-1-me@ziyao.cc>
References: <20260205154202.21819-1-me@ziyao.cc>
Subject: Re: [PATCH v2] clk: Avoid DT fetch in possible_parent_show if clk_hw is provided
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Yao Zi <me@ziyao.cc>, Drew Fustini <fustini@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
To: Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>, Yao Zi <me@ziyao.cc>
Date: Mon, 09 Feb 2026 09:47:25 -0800
Message-ID: <177065924524.54237.5857092620031619822@lazor>
User-Agent: alot/0.12

Quoting Yao Zi (2026-02-05 07:42:02)
> When showing a parent for which clk_core_get_parent_by_index fails, we
> may try using the parent's global name or the local name. If this fails
> either, the parent clock's clock-output-names is fetched through
> DT-index.
>=20
> struct clk_hw pointer takes precedence with DT-index when registering
> clocks, thus most drivers only zero the index member of struct
> clk_parent_data when providing the parent through struct clk_hw pointer.
> If the pointer cannot resovle to a clock, clk_core_get_parent_by_index

Use clk_core_get_parent_by_index() to indicate this is a function.

> will fail as well, in which case possible_parent_show will fetch the

possible_parent_show()

> parent's clock-output-names property, treat the unintended, zeroed index

Use "clock-output-names" to indicate DT property.

> as valid, and yield a misleading name if the clock controller does come
> with a clocks property.
>=20
> Let's add an extra check against the struct clk_hw pointer, and only
> perform the DT-index-based fetch if it isn't provided.
>=20
> Fixes: 2d156b78ce8f ("clk: Fix debugfs clk_possible_parents for clks with=
out parent string names")
> Signed-off-by: Yao Zi <me@ziyao.cc>
> Tested-by: Drew Fustini <fustini@kernel.org>
> ---
>  drivers/clk/clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> This was found when fixing the wrong parent description of
> clk-th1520-ap.c[1]. Without the patch,
>=20
>         # cat /sys/kernel/debug/clk/c910/clk_possible_parents
>         osc_24m cpu-pll1
>=20
> The first parent should be c910-i0, provided by an unresolvable struct
> clk_hw pointer. osc_24m is the first (and only) parent specified in
> devicetree for the clock controller. With the patch,
>=20
>         # cat /sys/kernel/debug/clk/c910/clk_possible_parents
>         (missing) cpu-pll1
>=20
> [1]: https://lore.kernel.org/linux-riscv/20250705052028.24611-1-ziyao@dis=
root.org/
>=20
> Changed from v1:
> - Collect tags
> - Switch to my new mail address
> - Link to v1: https://lore.kernel.org/all/20250705095816.29480-2-ziyao@di=
sroot.org/
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 85d2f2481acf..a9d1aea59689 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3588,7 +3588,7 @@ static void possible_parent_show(struct seq_file *s=
, struct clk_core *core,
>         } else if (core->parents[i].fw_name) {
>                 seq_printf(s, "<%s>(fw)", core->parents[i].fw_name);
>         } else {
> -               if (core->parents[i].index >=3D 0)
> +               if (!core->parents[i].hw && core->parents[i].index >=3D 0)
>                         name =3D of_clk_get_parent_name(core->of_node, co=
re->parents[i].index);
>                 if (!name)
>                         name =3D "(missing)";

I had to read this and reference the code for about 10 minutes. It's
really confusing! Adding a well placed condition doesn't help me :(

My confusion comes from thinking that core->parents[i].index should be
negative if the 'hw' member is specified. See how the loop in
clk_core_populate_parent_map() sets the index to -1 at the start of the
loop? It seems that whatever the clk provider passes though will
overwrite that though, leading to the index becoming 0 again if the
clk_parent_data was static initialized. Oof.

How about we set index to -1 when 'hw' is present? This reminds me of a
thread[1] with Jerome years ago where we were discussing how confusing
this all is. It's my fault for missing that the index was getting
overwritten. Here's a totally untested patch. I'm tempted to print a
warning or really fail clk registration if we find that hw is NULL,
fw_name is NULL, and index is < 0. I don't see any case where we should
allow drivers to only put the legacy name in the clk_parent_data
structure.

----8<-----
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 85d2f2481acf..b1a0da0991c4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4254,10 +4254,23 @@ static int clk_core_populate_parent_map(struct clk_=
core *core,
 			ret =3D clk_cpy_name(&parent->name, parent_names[i],
 					   true);
 		} else if (parent_data) {
+			/*
+			 * Most difficult case. Precedence order is 'hw',
+			 * 'fw_name', 'index', and finally 'name'. If 'hw' is
+			 * present it's easy, just use it. Otherwise 'fw_name'
+			 * or 'index' needs to be present, while 'name' can be
+			 * present in the case that a parent lookup should
+			 * fallback to the legacy path where global clk names
+			 * are used for clk topology.
+			 */
 			parent->hw =3D parent_data[i].hw;
-			parent->index =3D parent_data[i].index;
+			if (parent->hw)
+				continue;
+
 			ret =3D clk_cpy_name(&parent->fw_name,
 					   parent_data[i].fw_name, false);
+			if (!parent->fw_name)
+				parent->index =3D parent_data[i].index;
 			if (!ret)
 				ret =3D clk_cpy_name(&parent->name,
 						   parent_data[i].name,

Another thing we can probably do in debugfs is figure out that the clk
is known but not registered yet. That case can be detected if the 'hw'
member isn't NULL or if the fw_name/index field is set. In that case we
know without a doubt that either the clk hasn't been registered yet or
it never will appear in the case the DT node is disabled or the clocks
property has a <0> cell at that index. We signal this information from
clk_core_fill_parent_index() by setting 'parent' to -EPROBE_DEFER. We
could have a better function here that returns the parent clk_core
pointer and then in debugfs we can test that for -ENOENT vs.
-EPROBE_DEFER and distinguish "missing" from "waiting" or something like
that.

I'll also note that of_clk_get_parent_name() doesn't need to check for a
positive index. It will fail with a negative index like we intend
causing the end result to be "(missing)" anyway. We should remove that
condition to simplify.

[1] https://lore.kernel.org/all/6394b7e46a7967f4a5a6f77215e670e3e7a7ef10.ca=
mel@baylibre.com/
