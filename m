Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79EB1CF5EE;
	Mon, 13 Jan 2025 21:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803719; cv=none; b=FI/f0c2+5spCqwCkDcNd31SJBEI0erdb5JDDG8nrEfDG6bPU6L+/YdMtLWiYYtRn3/ZjPCmII9nA2zZT5brXUIuK9k3j6EcSGAvqizOLUIngeitxk1PD8xnOTVmePspES6LKXYcEes398eVOEmFr1bBp+xtNYDyhQ9ErlKX/wOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803719; c=relaxed/simple;
	bh=TJo97l/4vNDjSBHs824SQR+fvQYvXG/bo641djKoPxk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=IXcOMhTe+I+sQrUZy7uLkWujlx/rJB+okoKkVF7ePpljcTsKet9dXqcb0NAr93pmYQB0iNuvxKBR7x71MFnAlpoecNlZp6Q7unC1Ow2r+pebPnABcnMsUcrYRUqUlV6++S6un65O4iQJp1GjwieYZeJ/KGowcD4ALGN8EIasTLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dK2dB0VP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dK2dB0VP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D775C4CED6;
	Mon, 13 Jan 2025 21:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736803719;
	bh=TJo97l/4vNDjSBHs824SQR+fvQYvXG/bo641djKoPxk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dK2dB0VPhNx0YcutvALyCREGGbZ6CtMt0cmz02+jPpxya9nsLngAokUc3saptkHdu
	 hdfB4kVJLqn4zZQI+SSSfcGgUj18F6lVHAWNiIxZtsseN/XVGe5BZbgyqdxvQeouP3
	 iXKQnajSo9dTr53pLWRFtE0bwGikPhtmV6vPea3d+RcDNKFViesPIvMjm6F/Tzb1o8
	 dzLCpR5lAbCD87yrMaJW+qdlJihWbKhy7B9m6kTJ12Wi9QZ7L9I9bGL4QNcQWCvFuH
	 k81KSMEv+cSW9FL2mJdChzT00V8Uy8J+FHfk5qu+3P7qZ4PP2BZFGCQW06fGwmeXs0
	 n653XWyTwYdjA==
Message-ID: <b2cdc665f44521dca41d328b87b2febb.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250112213947.8524-1-colin.i.king@gmail.com>
References: <20250112213947.8524-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] clk: ep93xx: make const read-only arrays static
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
To: Colin Ian King <colin.i.king@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Date: Mon, 13 Jan 2025 13:28:37 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Colin Ian King (2025-01-12 13:39:47)
> Don't populate the const read-only arrays on the stack at run time,
> instead make them static.
>=20
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Applied to clk-next
