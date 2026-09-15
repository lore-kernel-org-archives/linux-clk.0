Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CE94AA59D
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 16:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490955; cv=none; b=u1AxbJp4S/Wu7BTD6xGNobCRcaouN+RRIMC5FPdF8oBzr+ZGXEdzPcUeltmYDOJBbqi1E7bk3Nd5jIBztAiUj8i5yRLMUnhZgo8yfY4HH84LIfEAdMbUAjyL5b6VYMcVfBF1OYsbl91rZMDoF2w4JYY9uNxRWYWjGFNDe74k4Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490955; c=relaxed/simple;
	bh=8qCxZZr4xqLGti0fMGHy3n6+lR0CyGNP8cWBAUiTKRw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sbVEayQM4eA/ZZYs2+10SmAbg/oIJACuHIFcWhEhNTe6oyI2TVr5emscTOjb6yS9rH9hzwSsNjVN9oyxo3fTSbqfnrqtIxfiaSCdmjU7i4S04DRYUenhxd20nBvQPi3AcgD9M86PxQPbaqAH3FCQcEeiwUB5Bk6mEh0CvOnx/I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJa/kScU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJa/kScU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597D51F000FF;
	Tue, 15 Sep 2026 16:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789490953;
	bh=uuZpUGPgYj3tcimwW/SA4ggbQB6ZS9iRPMffqVfrPiE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oJa/kScU0nXKXAbVXnCPC2wRwqNVKggCcTFEaIpxdQZpdUmqATtN8v/hvsd5e5s/G
	 MvegfrlJT7MAHsE+DBCGpdkqSzg+6lfp91Xyk70Ze1aDCcKx5bO+pf9xg65GChif6M
	 MR5nXrBvcU49pJeZ6rbNv2kLkvv94iEAh98PCklhwlLCNNK+JiLCl/5JkVqhrOZ8GH
	 oxAR5LOFzScjSFbtru9gsSOMJYw+5ln03JDY2XUKqUOHc8Eqxe7Z86LYC9DikToK2M
	 QQTQ//itUlNoy8RBfJqiKuT89U6NHCa28COnL1q2OXej41XlQuZ1S6Nnbpdf/zmvs3
	 MogF8Q9S03cqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] clk: Document of_clk_get_by_name() return values
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dan Carpenter" <error27@gmail.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <b3de48fdbaaade69cce126b59bd6dfb8f437b495.1789451862.git.error27@gmail.com>
References: <cover.1789451862.git.error27@gmail.com>
 <b3de48fdbaaade69cce126b59bd6dfb8f437b495.1789451862.git.error27@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 16:49:12 +0000
Message-Id: <20260915164913.597D51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: false claim in of_clk_get_by_name() documentation
--

commit d09131dbb97111f2e3801d98bcbd5fbb8288397d
Author: Dan Carpenter <error27@gmail.com>

clk: Document of_clk_get_by_name() return values

This commit documents the return values for of_clk_get_by_name(), stating
that it returns a valid clock on success or an error pointer on failure. It
also explicitly claims that the function never returns NULL.

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index fef87167a60b5..7e1a88c3837a3 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -5420,6 +5420,9 @@ EXPORT_SYMBOL(of_clk_get);
>   * This function parses the clocks and clock-names properties,
>   * and uses them to look up the struct clk from the registered list of c=
lock
>   * providers.
> + *
> + * Returns: A clock pointer on success or an error pointer on failure.  =
This
> + * function never returns NULL.
>   */
>  struct clk *of_clk_get_by_name(struct device_node *np, const char *name)
>  {

[Severity: Medium]
Is it accurate that this function never returns NULL?

It appears of_clk_get_by_name() delegates to of_clk_get_hw_from_clkspec(),
which invokes the clock provider's get_hw callback. Providers often use
of_clk_hw_onecell_get() with sparse clock arrays (such as
struct clk_hw_onecell_data) where uninitialized entries are NULL.

When such an entry is requested, NULL propagates back through
clk_hw_create_clk() (which uses ERR_CAST(NULL)), causing
of_clk_get_by_name() to return NULL on success.

Could this documentation mislead driver developers into removing NULL checks
or introducing assertions (e.g., BUG_ON(!clk)) that will crash the kernel
when a valid dummy clock is returned?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/b3de48fdbaaade69cce=
126b59bd6dfb8f437b495.1789451862.git.error27@gmail.com?part=3D1
