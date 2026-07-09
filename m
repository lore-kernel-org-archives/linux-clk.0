Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C043CC9E4;
	Thu,  9 Jul 2026 06:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578613; cv=none; b=kNhk1FXVj2qmwRkIMUwsqIQTL1K8kKOhloZUGVlcXAsqw766MfFWod8CrJqYQdU6180bKEoP7WokDVez2LId9e4L1AcvlsLhTtmSH3ArH9HTiEwXxkMPPcMwDWSgDP0ubvVQ8qm43agPX7s9RnLw5jCPVvXkJxsayyaBPjyiiGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578613; c=relaxed/simple;
	bh=CL+ZOHvfIA7H9MKtXJAWDMlgCCu0WB8IENaLgo2osmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nX6J2r0DURg8GnNIludgLenWJENdcFX+xB8IABTRqAinZkd3bg+P1c+2adeNO/PI/HYZVMVnZR7jSsFvvBLPPXPsh9rg2kLgEIS2iA7OT0/EOrZAfavXc8oMUtAiX6ztp7f5uppk0PE2Qy2zwZAcUHLamphwZ6naaKAQbG8SiHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IbsoFlfs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IbsoFlfs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206DB1F000E9;
	Thu,  9 Jul 2026 06:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783578612;
	bh=TyshY/pPLFLczWTrv9rohoUWYQKBPA94Z/999WUyf3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IbsoFlfsuBp43vw8YgVcPTec0WrBNRaONd9Oali8V9EsNY6r812R4Pl+XSC5dHN0w
	 biwYFFRc6QxQn+CyeToWYUKqBeBfzYXyY3ks/ZPmz9ZyXQr10H30E/YSIrZakYYdRu
	 7Slu36rg/EOru1AegAZLueeEXyU6iEkvV2S/SRwFwu8rGVuuFHIDLP+HrdtSjdOC0z
	 2ed2W84rjJYUSoqQz+X8A0xlBvv3ack9Oqv5lCApdRTM+0TGO2JrlvU2IRYhVQCXIV
	 L6J08Lkp7W8cnHq3w+HNIMW1A4AOtD/inpQ+gnO02nwxXttDbI2X0L20OooELh4+sN
	 HENmj/UiZ3ZZw==
Date: Wed, 8 Jul 2026 23:30:10 -0700
From: Drew Fustini <fustini@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCHv2] clk: thead: allow COMPILE_TEST builds
Message-ID: <ak8/8ixE7IS7kKdz@x1>
References: <20260707005619.1229238-1-rosenp@gmail.com>
 <ak0T7zxwwSn_L57X@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak0T7zxwwSn_L57X@redhat.com>

On Tue, Jul 07, 2026 at 10:57:51AM -0400, Brian Masney wrote:
> On Mon, Jul 06, 2026 at 05:56:19PM -0700, Rosen Penev wrote:
> > Follow the pattern of many other directories in this Makefile (sunxi-ng,
> > tenstorrent, ti, etc.) by using obj-y. This allows COMPILE_TEST to
> > select the driver without having CONFIG_ARCH_THEAD enabled
> > 
> > Tested with:
> > make LLVM=1 ARCH=loongarch drivers/clk/thead/
> > 
> > Assisted-by: Codex:GPT-5.5
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>

This doesn't apply to 7.2-rc or next for me due to the surrounding
context, but I agree with the change itself.

Acked-by: Drew Fustini <fustini@kernel.org>

Brian - do you think this should be routed through my thead-clk tree or
go through the main clk tree?

Thanks,
Drew
