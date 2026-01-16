Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09031315D30;
	Fri, 16 Jan 2026 09:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554409; cv=none; b=TAXZjU73O75mce93kDEGhR+bqwdG43uTU2D5URE/YKhJyUCv/84md9uPZZI4ZjBVzQFNfCiiAmqJezkGcaLahhH+SYgbzdQ6hVA8n20OjMz3H4dwNO8rEGW+RumQ/H3WQkEKg5TByIvxdDTxuf6xJP2GSi6pf5trpb5I1kJt4mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554409; c=relaxed/simple;
	bh=xkfDc6g2yll5ZtK5TQVzZb5qiKQreoqa+bmupwEGvlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHz4gxVjIn83llAXrJJ64lKPqnY2RqZKomwOlMGFaellLdxMxnCHNh5rKOgNdc0JB3BGGRxlYLp24Duj66FlwFOd+tfCyfCbKJjW00mLiKGtO/Q0wvEdxghJcAUPXADq4wCXNdiHuDjJNTiC60740/c7ruLWMUdVxmqi3SxTNso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qpMOyyis; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qpMOyyis"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2D5C116C6;
	Fri, 16 Jan 2026 09:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768554408;
	bh=xkfDc6g2yll5ZtK5TQVzZb5qiKQreoqa+bmupwEGvlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qpMOyyisOumwp47b1e1p6PknQvShVVzHcezrJbHxgpa9yHRr1bdSYkCWwMu9rEmAz
	 CMnfNaXpmpe7wfL4KDFnR5tTIHU2D71cSqUG9DmZifoce90ukNafXAtoxwnXmUWf7A
	 WY9HkmScIpVeiY31TKm9bU1Ws49rwZGdbIj5GycvATHleJnirlDK9L2N9kkt22GKRW
	 EbgKvwLKf0Yxlsoe/tk5fJWokkdXfwJcfKdMY7nU4s7ajZ7m/6/MAP0gjkqtiT3pFb
	 MLUqU6hudOU5sbFytoKKgDPXjgaW1hMSaZ9Hl4rALE9Bg3oyoG8Uu3iPJr065BOpe1
	 aMKcJUy0hRWTw==
Date: Fri, 16 Jan 2026 10:06:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, 
	mpe@kernel.org, mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, 
	agross@kernel.org, agross@oss.tenstorrent.com
Subject: Re: [PATCH 5/8] soc: tenstorrent: Add rcpu syscon reset register
 definitions
Message-ID: <20260116-blazing-steady-turtle-db86ff@quoll>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-5-7356e671f28b@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260115-atlantis-clocks-v1-5-7356e671f28b@oss.tenstorrent.com>

On Thu, Jan 15, 2026 at 05:42:04PM -0600, Anirudh Srinivasan wrote:
> Document register offsets used for resets in Atlantis
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  include/soc/tenstorrent/atlantis-syscon.h | 7 +++++++

You just added this file!

This is not only meaningless split but actually hindering review.

Best regards,
Krzysztof

