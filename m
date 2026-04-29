Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DAD1482E8;
	Wed, 29 Apr 2026 03:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434926; cv=none; b=WG0Taw20qygUqepdCyomqFTqlg8KFq6xtwaoXAcbYZ71soSnot1t4wQZ5ntSg97foyv5lHy5KddBTl2cnQAiIDXJwxoT5z3VAlmSJLAWcx6Q6vbasPZP0KOehAF6AtdQgPP1oad305Njd2Cb20008NEWGoT/2pF0RGWUkn9e2Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434926; c=relaxed/simple;
	bh=XD7LybSAWJo5KpfEb3C0kVQ7LW2jaY6lh3iKwHXtfjE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=rL2OXxmdn/r4TIMgNVMKclD/+wjVhDU0Zjo5ncsf0B22wcDDqrT2hHURxVfIHuspvwyqtg1YOXkJLJz5ZqzCrRdYR4bX0co8HRB3eCMXtkg7jCimqt5lclVZ14/djm8Icyfr5GqO6fb3puDcoxrH1Qz9oTvh3YByC8e6JCex4A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mp763qsM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mp763qsM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E228C19425;
	Wed, 29 Apr 2026 03:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434926;
	bh=XD7LybSAWJo5KpfEb3C0kVQ7LW2jaY6lh3iKwHXtfjE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Mp763qsMyHNgFI2UA0Dk9YUahIL1wVgzZgf5i91oKtO2ku6WIce/MUzhvS/OJ86+P
	 bjcUFE2ycVt7noLjqB7P+IE6aYKjcvKxSw+p6gfsN3reb78JkKzjWpMJUCQMC1sNQg
	 o2wMzb96hLhiYm+lXdvTMsHXwSI+cYjpqEiKm3pt4FuofHPs3UVzrUytZkBWiphJMs
	 DH9sDP32Gte1g1Hr4+QvWvcj4BQYIy8dcO1zVP1EWJtqK/vOjnd3wMDkFAXkHGXXgD
	 eW9flYk/bGEhyN9t5P+pLWXxD/O2pBTbufcbUP8xufU51H8gOBaC1LaJIZBqg2ogrh
	 oi9ijppljISqQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260415-bmasney-clk-reviewer-v1-1-49c71082c973@redhat.com>
References: <20260415-bmasney-clk-reviewer-v1-1-49c71082c973@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: add myself as a reviewer for the clk subsystem
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Brian Masney <bmasney@redhat.com>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 28 Apr 2026 20:55:24 -0700
Message-ID: <177743492444.5403.6151612432037798552@lazor>
User-Agent: alot/0.12

Quoting Brian Masney (2026-04-15 13:30:49)
> I've reviewed a lot clk patches for parts of the subsystem that
> typically doesn't get much review. Add myself as a reviewer so that I
> don't miss anything.
>=20
> Link: https://lore.kernel.org/linux-clk/?q=3Df%3Abmasney%40redhat.com
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-fixes
