Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795252005;
	b=ITnWPelzqca8aNQmzTpi5NtZ/dX090WCSBMoWpitDO1BfAzN43X0GoggYVhl9orvP2ee
	 H6SyV4be5oHmyAxjuYt+xfz9bKg8Ka25LV007JR4APi403aP02MMAWXxeL2JpfGC/HAkn
	 /ZDU3+BmM0HOcArG+MJAaPMMEw9p75jWOVtmwls1E+c+sE77lerByr7HeIEM/DoXMZt3u
	 hJRKuSgtWfIEK0yiyCsQ2cZyxaErPNEOvuFiTnvvrz3AZAJdaa88SqO5C88qUOcboj3Z9
	 G1H7Vrpnn1DsV+fAHHxeDce1eF0FtIL/EY82JMDzz+itm4GAvnBWcqxVl9QBgDB/5bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795252005;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=H6dL6XzAMKVv4yNYKDGAgTOJst/aecV2YTBa2m0Jai0=;
	b=khNKr3gCjkasIUyy2Hhf+QsZnqnZxHSPxONYnzei7ykiSxK+y5iI/ai6g8DLcC55axwV
	 lDvQSbBTZl+z8/wWWHBkMn4AXFS6p2y+BpNMHucGfqUy7FqsZgx1t77MdBKnnsY0MpuIN
	 XciwSYyB64c7Gr5y9hEf6bu1SkzKJNWbyBfM0Ix8G8iuF6bq5AcVjmpgE69y0nt4QPXQR
	 jOp5Qfxc5j0Zp5KueKIHRiiCHDeBWfnwZUJo9LntrnRNP4yvjPRCw+ufniBkLdP/h8xjS
	 jhqrEou3GX0AuZnb6ez8Ijdt/IY/o+QmTaEPB4VUtiCyz35AR3GnT48gHfJS/hfH6dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Km7+OJVj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DC1606A320;
	Sat, 21 Nov 2026 09:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Km7+OJVj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0A31F000C4;
	Sat, 21 Nov 2026 09:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795252005;
	bh=H6dL6XzAMKVv4yNYKDGAgTOJst/aecV2YTBa2m0Jai0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Km7+OJVjqlWJjhhxB+m+sVOS4VxAaJo1rT7yEmeirJFPAMkgmsKR/yqnXQEYPBq1P
	 ib4JFrWFs0MeDTgnBXuw2XQqA9fTZSJJwiVSplQFSwUXv5LqsWjap7hf6fRT+qpc54
	 qz+WkXPWGNUCoTpAhsn/G+NpmjtIecNS7z7gzb9SUICaMTj61DHDAb0PvHWCjgR0y3
	 Gtb77qQ5k6aDqfTYC2tRKZlie5F5e2fSz2uSEwOWOk8vcn9djSld9nbpKfWZ2YG+3O
	 PpdvtQczrrRTukJ6NfPWpzb7kccJ438II5tvTXQrsOreXScofjwCVZ37XzwsxS6vfM
	 JPIcMpJWZ0+IQ==
Date: Sat, 21 Nov 2026 10:06:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v12 01/10] dt-bindings: clock: ma35d1: Mark HXT and LXT
 legacy
Message-ID: <20261121-ruddy-neon-rooster-a24f5c@quoll>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
 <20261118-perso-ma35d1-upstream-clk-v12-1-bee2c8dad4e1@bootlin.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-1-bee2c8dad4e1@bootlin.com>

On Wed, Nov 18, 2026 at 05:59:10PM +0100, Miquel Raynal wrote:
> The whole clock list is supposed to represent the clocks provided by the
> main MA35D1 clock controller. Yet, the comment at the top is wrong by
> definition: it lists both external and internal clocks, which does not
> make sense. HXT and LXT are on-board oscillators which are now correctly
> described as independent fixed clocks with their own DT node. The clock
> controller is a consumer of these nodes and a provider of all the other
> clocks listed in this file.
> 
> A look-up towards the HXT or LXT index through the clock controller is
> always wrong, yet possible (even if totally useless) with legacy DT, but
> should not be made with a recent DT describing HXT and LXT oscillators
> as individual nodes, hence mark them both legacy.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

