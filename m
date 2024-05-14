Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E21AD53
	for <linux-clk@vger.kernel.org>; Tue, 14 May 2024 03:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715657926; cv=none; b=tOtDyPFEUsyhTO4JSJscg/K99K9mCfKBK6SJ+KE9nn8ddlJ/k87dlbfhxW6NIOgNzHWQ/Smk61S/cN+50BRVShHl3Ny5oQ9yAVqO0NvnPg/+JkF9DoieTei29k4NdYjotv8/MmweyEyfb35Ol2iS89xMwSnXr0mqN2KC7cNFfpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715657926; c=relaxed/simple;
	bh=7a+y2HRsddODpSxzMDCXWnxzd8zBeVjt9cSh9s6DkGo=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=ZAopqo9pECLHBhnoS/2m68QdnsDZINlAjHU3z5IH4lhY7j6qMOnl+iXf7NnDGSpXOJiYP49UJlQFc+zRZYjXlaDaVqCYsloZLoY+8jKnmC9wQcmw6F0rk6ky51mZuj/ZZCequ6IBlfWlJPcDJRW3wbx1ya/6dmfp4urgQMXvhsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJu/XsMZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJu/XsMZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D39C2BD10;
	Tue, 14 May 2024 03:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715657926;
	bh=7a+y2HRsddODpSxzMDCXWnxzd8zBeVjt9cSh9s6DkGo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mJu/XsMZ26XL/RoBULz3PsothXvvWrmTCTKcrI1NbyfME5tjkmXKCkXdO5g6qTqgO
	 1HQa8av42MU1pxbpCc9pRe53FzKGNK1ZPcbHKTmEkVx1swxihib6RSvVIcHy5/uHr0
	 nvK98RMDm4l/XUIySA5+TR/3KhhBXoVOgNtDNJRuUmuxunhNhYm4/b3UEGfRT56IRx
	 w/Cho3bOxhjDDVn1xqPEzdq5l2IQQOo6/3vghosARkIEoGhhBQ3dG4rgLnZlOwvsAC
	 GRfJHJ+OFUgxMaVyLPiATBgUyGZnfb4iKPQoQqDHY34jQI/wxzfyI7yDfLk+62YS9y
	 LOl3brORyoj4g==
Message-ID: <301cd41e6283c12ac67fb8c0f8d5c929.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAA1CXcBhABB60JG-sT1qRysD1AP+bN=wo=5vwbeTv13Gj72EzA@mail.gmail.com>
References: <CAA1CXcBhABB60JG-sT1qRysD1AP+bN=wo=5vwbeTv13Gj72EzA@mail.gmail.com>
Subject: Re: [Bug Report] Multiple S390x KUNIT clk failures
From: Stephen Boyd <sboyd@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Audra Mitchell <aubaker@redhat.com>, Donald Zickus <dzickus@redhat.com>
To: KUnit Development <kunit-dev@googlegroups.com>, Nico Pache <npache@redhat.com>, linux-clk@vger.kernel.org
Date: Mon, 13 May 2024 20:38:43 -0700
User-Agent: alot/0.10

Quoting Nico Pache (2024-05-13 18:08:40)
> Hi,
>=20
> We are seeing a number of the CLK kunit tests failing on S390x. This
> has been occurring for some time now (as early as v6.1). We run these
> tests as modules (without the UML wrappers), and have not seen these
> failures on any other architectures.

Do you have commit 75357829cc8e ("clk: Fix clk gate kunit test on
big-endian CPUs"). What is the kernel version?
